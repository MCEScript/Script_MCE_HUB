local key = _G.Key
local check = "https://github.com/MCEScript/Script_MCE_HUB/blob/main/Check.php?key=" .. key
if game:HttpGet(check) == "Whitelisted" then
loadstring(game:HttpGet("https://raw.githubusercontent.com/MCEScript/Script_MCE_HUB/main/Main-Script.lua"))()
else
game.Players.LocalPlayer:Kick("Key ผิดกรุณาตรวจสอบให้ดีก่อนใส่ <3 .")
end
