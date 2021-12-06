local key = _G.Key
local check = "https://raw.githubusercontent.com/MCEScript/Script_MCE_HUB/main/Check.php?key=" .. key
if game:HttpGet(check) == "Whitelisted" then
loadstring(game:HttpGet("https://github.com/MCEScript/Script_MCE_HUB/blob/main/Main-Script.lua"))()
else
game.Players.LocalPlayer:Kick("Key ผิดกรุณาตรวจสอบให้ดีก่อนใส่ <3 .")
end
