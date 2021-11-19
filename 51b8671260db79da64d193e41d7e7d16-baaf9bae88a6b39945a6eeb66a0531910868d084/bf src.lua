repeat wait()
until game:IsLoaded()

local world = game.PlaceId
    if world == 2753915549 then
        world1 = true
    elseif world == 4442272183 then
        world2 = true
    elseif world == 7449423635 then
        world3 = true
    end
weapon = {}

for a, i in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    table.insert(weapon, i.Name)

end
function AC()
    local VU = game:GetService("VirtualUser")
    local q = game.Players.LocalPlayer.PlayerGui.Main.Quest
    local RigC = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
    if q.Visible == true then
    VU:CaptureController()
    VU:ClickButton1(Vector2.new(0.9,0.9))
    VU:CaptureController()
    VU:ClickButton1(Vector2.new(0.9,0.9))
    game:GetService("RunService").Heartbeat:Connect(function()
    RigC.activeController.timeToNextAttack = 0
    end)
end
end


function AutoStats()
local args = {
    [1] = "AddPoint",
    [2] = _G.Stats,
    [3] = _G.PointStats
}

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function CQ()
local lv = game.Players.LocalPlayer.Data.Level.Value
local q = game.Players.LocalPlayer.PlayerGui.Main.Quest
if world1 then
    if lv == 1 or lv <= 9 then
        Mob = "Bandit [Lv. 5]"
        Quest = "BanditQuest1"
        LvQuest = 1
        S = "StartQuest"
        lctQuest = CFrame.new(1061.66699, 16.5166187, 1544.52905, -0.942978859, -3.33851502e-09, 0.332852632, 7.04340497e-09, 1, 2.99841325e-08, -0.332852632, 3.06188177e-08, -0.942978859)
        posQuest = Vector3.new(1061.66699, 16.5166187, 1544.52905, -0.942978859, -3.33851502e-09, 0.332852632, 7.04340497e-09, 1, 2.99841325e-08, -0.332852632, 3.06188177e-08, -0.942978859)
    elseif lv == 10 or lv <= 19 then
        Mob = "Monkey [Lv. 14]"
        Quest = "JungleQuest"
        LvQuest = 1
        S = "StartQuest"
        lctQuest = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
        posQuest = Vector3.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
    elseif lv == 20 or lv <= 29 then
        Mob = "Gorilla [Lv. 20]"
        Quest = "JungleQuest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
        lctQuest = CFrame.new(-1604.12012, 36.8521118, 154.23732, 0.0648873374, -4.70858913e-06, -0.997892559, 1.41431883e-07, 1, -4.70933674e-06, 0.997892559, 1.64442184e-07, 0.0648873374)
    elseif lv == 30 or lv <= 39 then
        Mob = "Pirate [Lv. 35]"
        Quest = "BuggyQuest1"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
        lctQuest = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
    elseif lv == 40 or lv <= 59 then
        Mob = "Brute [Lv. 45]"
        Quest = "BuggyQuest1"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
        lctQuest = CFrame.new(-1139.59717, 4.75205183, 3825.16211, -0.959730506, -7.5857054e-09, 0.280922383, -4.06310328e-08, 1, -1.11807175e-07, -0.280922383, -1.18718916e-07, -0.959730506)
    elseif lv == 60 or lv <= 74 then
        Mob = "Desert Bandit [Lv. 60]"
        Quest = "DesertQuest"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(897.031128, 6.43846416, 4388.97168, -0.804044724, 3.68233266e-08, 0.594568789, 6.97835176e-08, 1, 3.24365246e-08, -0.594568789, 6.75715199e-08, -0.804044724)
        lctQuest = CFrame.new(897.031128, 6.43846416, 4388.97168, -0.804044724, 3.68233266e-08, 0.594568789, 6.97835176e-08, 1, 3.24365246e-08, -0.594568789, 6.75715199e-08, -0.804044724)
    elseif lv == 75 or lv <= 89 then
        Mob = "Desert Officer [Lv. 70]"
        Quest = "DesertQuest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(897.031128, 6.43846416, 4388.97168, -0.804044724, 3.68233266e-08, 0.594568789, 6.97835176e-08, 1, 3.24365246e-08, -0.594568789, 6.75715199e-08, -0.804044724)
        lctQuest = CFrame.new(897.031128, 6.43846416, 4388.97168, -0.804044724, 3.68233266e-08, 0.594568789, 6.97835176e-08, 1, 3.24365246e-08, -0.594568789, 6.75715199e-08, -0.804044724)
    elseif lv == 90 or lv <= 99 then
        Mob = "Snow Bandit [Lv. 90]"
        Quest = "SnowQuest"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(1384.14001, 87.272789, -1297.06482, 0.348555952, -2.53947841e-09, -0.937287986, 1.49860568e-08, 1, 2.86358204e-09, 0.937287986, -1.50443711e-08, 0.348555952)
        lctQuest = CFrame.new(1384.14001, 87.272789, -1297.06482, 0.348555952, -2.53947841e-09, -0.937287986, 1.49860568e-08, 1, 2.86358204e-09, 0.937287986, -1.50443711e-08, 0.348555952)
    elseif lv == 100 or lv <= 119 then
        Mob = "Snowman [Lv. 100]"
        Quest = "SnowQuest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(1384.14001, 87.272789, -1297.06482, 0.348555952, -2.53947841e-09, -0.937287986, 1.49860568e-08, 1, 2.86358204e-09, 0.937287986, -1.50443711e-08, 0.348555952)
        lctQuest = CFrame.new(1384.14001, 87.272789, -1297.06482, 0.348555952, -2.53947841e-09, -0.937287986, 1.49860568e-08, 1, 2.86358204e-09, 0.937287986, -1.50443711e-08, 0.348555952)
    elseif lv == 120 or lv <= 149 then
        Mob = "Chief Petty Officer [Lv. 120]"
        Quest = "MarineQuest2"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(-5035.0835, 28.6520386, 4325.29443, 0.0243340395, -7.08064647e-08, 0.999703884, -6.36926814e-08, 1, 7.23777944e-08, -0.999703884, -6.54350671e-08, 0.0243340395)
        lctQuest = CFrame.new(-5035.0835, 28.6520386, 4325.29443, 0.0243340395, -7.08064647e-08, 0.999703884, -6.36926814e-08, 1, 7.23777944e-08, -0.999703884, -6.54350671e-08, 0.0243340395)
    elseif lv == 150 or lv <= 174 then
        Mob = "Sky Bandit [Lv. 150]"
        Quest = "SkyQuest"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(-4841.83447, 717.669617, -2623.96436, -0.875942111, 5.59710216e-08, -0.482416272, 3.04023082e-08, 1, 6.08195947e-08, 0.482416272, 3.86078725e-08, -0.875942111)
        lctQuest = CFrame.new(-4841.83447, 717.669617, -2623.96436, -0.875942111, 5.59710216e-08, -0.482416272, 3.04023082e-08, 1, 6.08195947e-08, 0.482416272, 3.86078725e-08, -0.875942111)
    elseif lv == 175 or lv <= 224 then
        Mob = "Dark Master [Lv. 175]"
        Quest = "SkyQuest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(-4841.83447, 717.669617, -2623.96436, -0.875942111, 5.59710216e-08, -0.482416272, 3.04023082e-08, 1, 6.08195947e-08, 0.482416272, 3.86078725e-08, -0.875942111)
        lctQuest = CFrame.new(-4841.83447, 717.669617, -2623.96436, -0.875942111, 5.59710216e-08, -0.482416272, 3.04023082e-08, 1, 6.08195947e-08, 0.482416272, 3.86078725e-08, -0.875942111)
    elseif lv == 225 or lv <= 274 then
        Mob = "Toga Warrior [Lv. 225]"
        Quest = "ColosseumQuest"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
        lctQuest =  CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
    elseif lv == 275 or lv <= 299 then
        Mob = "Gladiator [Lv. 275]"
        Quest = "ColosseumQuest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
        lctQuest = CFrame.new(-1576.11743, 7.38933945, -2983.30762, 0.576966345, 1.22114863e-09, 0.816767931, -3.58496594e-10, 1, -1.24185606e-09, -0.816767931, 4.2370063e-10, 0.576966345)
    elseif lv == 300 or lv <= 329 then
        Mob = "Military Soldier [Lv. 300]"
        Quest = "MagmaQuest"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
        lctQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
    elseif lv == 330 or lv <= 449 then
        Mob = "Military Spy [Lv. 330]"
        Quest = "MagmaQuest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
        lctQuest = CFrame.new(-5316.55859, 12.2370615, 8517.2998, 0.588437557, -1.37880001e-08, -0.808542669, -2.10116209e-08, 1, -3.23446478e-08, 0.808542669, 3.60215964e-08, 0.588437557)
    elseif lv == 450 or lv <= 474 then
        Mob = "God's Guard [Lv. 450]"
        Quest = "SkyExp1Quest"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(-4721.71436, 845.277161, -1954.20105, -0.999277651, -5.56969759e-09, 0.0380011722, -4.14751478e-09, 1, 3.75035256e-08, -0.0380011722, 3.73188307e-08, -0.999277651)
        lctQuest = CFrame.new(-4721.71436, 845.277161, -1954.20105, -0.999277651, -5.56969759e-09, 0.0380011722, -4.14751478e-09, 1, 3.75035256e-08, -0.0380011722, 3.73188307e-08, -0.999277651)
    elseif lv == 475 or lv <= 524 then
        Mob = "Shanda [Lv. 475]"
        Quest = "SkyExp1Quest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(-7863.63672, 5545.49316, -379.826324, 0.362120807, -1.98046344e-08, -0.93213129, 4.05822291e-08, 1, -5.48095125e-09, 0.93213129, -3.58431969e-08, 0.362120807)
        lctQuest = CFrame.new(-7863.63672, 5545.49316, -379.826324, 0.362120807, -1.98046344e-08, -0.93213129, 4.05822291e-08, 1, -5.48095125e-09, 0.93213129, -3.58431969e-08, 0.362120807)
    elseif lv == 525 or lv <= 549 then
        Mob = "Royal Squad [Lv. 525]"
        Quest = "SkyExp2Quest"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(-7902.66895, 5635.96387, -1411.71802, 0.0504222959, 2.5710392e-08, 0.998727977, 1.12541557e-07, 1, -3.14249675e-08, -0.998727977, 1.13982921e-07, 0.0504222959)
        lctQuest = CFrame.new(-7902.66895, 5635.96387, -1411.71802, 0.0504222959, 2.5710392e-08, 0.998727977, 1.12541557e-07, 1, -3.14249675e-08, -0.998727977, 1.13982921e-07, 0.0504222959)
    elseif lv == 550 or lv <= 624 then
        Mob = "Royal Soldier [Lv. 550]"
        Quest = "SkyExp2Quest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(-7902.66895, 5635.96387, -1411.71802, 0.0504222959, 2.5710392e-08, 0.998727977, 1.12541557e-07, 1, -3.14249675e-08, -0.998727977, 1.13982921e-07, 0.0504222959)
        lctQuest = CFrame.new(-7902.66895, 5635.96387, -1411.71802, 0.0504222959, 2.5710392e-08, 0.998727977, 1.12541557e-07, 1, -3.14249675e-08, -0.998727977, 1.13982921e-07, 0.0504222959)
    elseif lv == 625 or lv <= 649 then
        Mob = "Galley Pirate [Lv. 625]"
        Quest = "FountainQuest"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(5254.60156, 38.5011406, 4049.69678, -0.0504891425, -3.62066501e-08, -0.998724639, -9.87921389e-09, 1, -3.57534553e-08, 0.998724639, 8.06145284e-09, -0.0504891425)
        lctQuest = CFrame.new(5254.60156, 38.5011406, 4049.69678, -0.0504891425, -3.62066501e-08, -0.998724639, -9.87921389e-09, 1, -3.57534553e-08, 0.998724639, 8.06145284e-09, -0.0504891425)
    elseif lv >= 650 or lv <= 2100 then
        Mob = "Galley Captain [Lv. 650]"
        Quest = "FountainQuest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(5254.60156, 38.5011406, 4049.69678, -0.0504891425, -3.62066501e-08, -0.998724639, -9.87921389e-09, 1, -3.57534553e-08, 0.998724639, 8.06145284e-09, -0.0504891425)
        lctQuest = CFrame.new(5254.60156, 38.5011406, 4049.69678, -0.0504891425, -3.62066501e-08, -0.998724639, -9.87921389e-09, 1, -3.57534553e-08, 0.998724639, 8.06145284e-09, -0.0504891425)
    end
end
if world2 then
    if lv == 700 or lv <= 724 then -- Raider [Lv. 700]
        Mob = "Raider [Lv. 700]"
        Quest = "Area1Quest"
        LvQuest = 1
        S = "StartQuest" 
        posQuest = Vector3.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
        lctQuest = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
    elseif lv == 725 or lv <= 774 then -- Mercenary [Lv. 725]
        Mob = "Mercenary [Lv. 725]"
        Quest = "Area1Quest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
        lctQuest = CFrame.new(-424.080078, 73.0055847, 1836.91589, 0.253544956, -1.42165932e-08, 0.967323601, -6.00147771e-08, 1, 3.04272909e-08, -0.967323601, -6.5768397e-08, 0.253544956)
    elseif lv == 775 or lv <= 799 then -- Swan Pirate [Lv. 775]
        Mob = "Swan Pirate [Lv. 775]"
        Quest = "Area2Quest"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
        lctQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
    elseif lv == 800 or lv <= 874 then -- Factory Staff [Lv. 800]
        Mob = "Factory Staff [Lv. 800]"
        Quest = "Area2Quest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
        lctQuest = CFrame.new(632.698608, 73.1055908, 918.666321, -0.0319722369, 8.96074881e-10, -0.999488771, 1.36326533e-10, 1, 8.92172336e-10, 0.999488771, -1.07732087e-10, -0.0319722369)
    elseif lv == 875 or lv <= 899 then -- Marine Lieutenant [Lv. 875]
        Mob = "Marine Lieutenant [Lv. 875]"
        Quest = "MarineQuest3"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
        lctQuest = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
    elseif lv == 900 or lv <= 949 then -- Marine Captain [Lv. 900]
        Mob = "Marine Captain [Lv. 900]"
        Quest = "MarineQuest3"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
        lctQuest = CFrame.new(-2442.65015, 73.0511475, -3219.11523, -0.873540044, 4.2329841e-08, -0.486752301, 5.64383384e-08, 1, -1.43220786e-08, 0.486752301, -3.99823996e-08, -0.873540044)
    elseif lv == 950 or lv <= 974 then -- Zombie [Lv. 950]
        Mob = "Zombie [Lv. 950]"
        Quest = "ZombieQuest"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08, 0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
        lctQuest = CFrame.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08, 0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
    elseif lv == 975 or lv <= 999 then -- Vampire [Lv. 975]
        Mob = "Vampire [Lv. 975]"
        Quest = "ZombieQuest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08, 0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
        lctQuest = CFrame.new(-5492.79395, 48.5151672, -793.710571, 0.321800292, -6.24695815e-08, 0.946807742, 4.05616092e-08, 1, 5.21931227e-08, -0.946807742, 2.16082796e-08, 0.321800292)
    elseif lv == 1000 or lv <= 1049 then -- Snow Trooper [Lv. 1000] **
        Mob = "Snow Trooper [Lv. 1000]"
        Quest = "SnowMountainQuest"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(604.964966, 401.457062, -5371.69287, 0.353063971, 1.89520435e-08, -0.935599446, -5.81846002e-08, 1, -1.70033754e-09, 0.935599446, 5.50377841e-08, 0.353063971)
        lctQuest = CFrame.new(604.964966, 401.457062, -5371.69287, 0.353063971, 1.89520435e-08, -0.935599446, -5.81846002e-08, 1, -1.70033754e-09, 0.935599446, 5.50377841e-08, 0.353063971)
    elseif lv == 1050 or lv <= 1099 then -- Winter Warrior [Lv. 1050]
        Mob = "Winter Warrior [Lv. 1050]"
        Quest = "SnowMountainQuest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(604.964966, 401.457062, -5371.69287, 0.353063971, 1.89520435e-08, -0.935599446, -5.81846002e-08, 1, -1.70033754e-09, 0.935599446, 5.50377841e-08, 0.353063971)
        lctQuest = CFrame.new(604.964966, 401.457062, -5371.69287, 0.353063971, 1.89520435e-08, -0.935599446, -5.81846002e-08, 1, -1.70033754e-09, 0.935599446, 5.50377841e-08, 0.353063971)
    elseif lv == 1100 or lv <= 1124 then -- Lab Subordinate [Lv. 1100]
        Mob = "Lab Subordinate [Lv. 1100]"
        Quest = "IceSideQuest"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528, 1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
        lctQuest = CFrame.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528, 1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
    elseif lv == 1125 or lv <= 1174 then -- Horned Warrior [Lv. 1125]
        Mob = "Horned Warrior [Lv. 1125]"
        Quest = "IceSideQuest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528, 1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
        lctQuest = CFrame.new(-6060.10693, 15.9868021, -4904.7876, -0.411000341, -5.06538868e-07, 0.91163528, 1.26306062e-07, 1, 6.12581289e-07, -0.91163528, 3.66916197e-07, -0.411000341)
    elseif lv == 1175 or lv <= 1199 then -- Magma Ninja [Lv. 1175]
        Mob = "Magma Ninja [Lv. 1175]"
        Quest = "FireSideQuest"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
        lctQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
    elseif lv == 1200 or lv <= 1249 then -- Lava Pirate [Lv. 1200]
        Mob = "Lava Pirate [Lv. 1200]"
        Quest = "FireSideQuest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
        lctQuest = CFrame.new(-5431.09473, 15.9868021, -5296.53223, 0.831796765, 1.15322464e-07, -0.555080295, -1.10814341e-07, 1, 4.17010995e-08, 0.555080295, 2.68240168e-08, 0.831796765)
    elseif lv == 1250 or lv <= 1274 then -- Ship Deckhand [Lv. 1250]
        Mob = "Ship Deckhand [Lv. 1250]"
        Quest = "ShipQuest1"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
        lctQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
    elseif lv == 1275 or lv <= 1299 then -- Ship Engineer [Lv. 1275]
        Mob = "Ship Engineer [Lv. 1275]"
        Quest = "ShipQuest1"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
        lctQuest = CFrame.new(1037.80127, 125.092171, 32911.6016, -0.244533166, -0, -0.969640911, -0, 1.00000012, -0, 0.96964103, 0, -0.244533136)
    elseif lv == 1300 or lv <= 1324 then -- Ship Steward [Lv. 1300]
        Mob = "Ship Steward [Lv. 1300]"
        Quest = "ShipQuest2"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
        lctQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
    elseif lv == 1325 or lv <= 1349 then -- Ship Officer [Lv. 1325]
        Mob = "Ship Officer [Lv. 1325]"
        Quest = "ShipQuest2"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
        lctQuest = CFrame.new(968.80957, 125.092171, 33244.125, -0.869560242, 1.51905191e-08, -0.493826836, 1.44108379e-08, 1, 5.38534195e-09, 0.493826836, -2.43357912e-09, -0.869560242)
    elseif lv == 1350 or lv <= 1374 then -- Arctic Warrior [Lv. 1350]
        Mob = "Arctic Warrior [Lv. 1350]"
        Quest = "FrostQuest"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226, -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
        lctQuest = CFrame.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226, -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
    elseif lv == 1375 or lv <= 1424 then -- Snow Lurker [Lv. 1375]
        Mob = "Snow Lurker [Lv. 1375]"
        Quest = "FrostQuest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226, -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
        lctQuest = CFrame.new(5669.43506, 28.2117786, -6482.60107, 0.888092756, 1.02705066e-07, 0.459664226, -6.20391774e-08, 1, -1.03572376e-07, -0.459664226, 6.34646895e-08, 0.888092756)
    elseif lv == 1425 or lv <= 1449 then -- Sea Soldier [Lv. 1425]
        Mob = "Sea Soldier [Lv. 1425]"
        Quest = "ForgottenQuest"
        LvQuest = 1
        S = "StartQuest"
        posQuest = Vector3.new(-3052.99097, 236.881363, -10148.1943, -0.997911751, 4.42321983e-08, 0.064591676, 4.90968759e-08, 1, 7.37270085e-08, -0.064591676, 7.67442998e-08, -0.997911751)
        lctQuest = CFrame.new(-3052.99097, 236.881363, -10148.1943, -0.997911751, 4.42321983e-08, 0.064591676, 4.90968759e-08, 1, 7.37270085e-08, -0.064591676, 7.67442998e-08, -0.997911751)
    elseif lv >= 1450 then -- Water Fighter [Lv. 1450]
        Mob = "Water Fighter [Lv. 1450]"
        Quest = "ForgottenQuest"
        LvQuest = 2
        S = "StartQuest"
        posQuest = Vector3.new(-3052.99097, 236.881363, -10148.1943, -0.997911751, 4.42321983e-08, 0.064591676, 4.90968759e-08, 1, 7.37270085e-08, -0.064591676, 7.67442998e-08, -0.997911751)
        lctQuest = CFrame.new(-3052.99097, 236.881363, -10148.1943, -0.997911751, 4.42321983e-08, 0.064591676, 4.90968759e-08, 1, 7.37270085e-08, -0.064591676, 7.67442998e-08, -0.997911751)
    end
end
end

function TP(P1,P2)
local Distance = (P1 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if Distance < 250 then
    Speed = 25000
elseif Distance >= 250 then
    Speed = 275
end
game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = P2}):Play()
end

function MOBS()
CQ()
local M = game.Workspace.Enemies:GetChildren()
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
            for a, e in pairs(M) do
                for i, v in pairs(M) do
                    if e.Name == Mob then
                        if v.Name == Mob then
                            e.Humanoid.WalkSpeed = 1
                            v.Humanoid.WalkSpeed = 1
                            e.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                            e.HumanoidRootPart.Size = Vector3.new(50,50,50)
                            e.HumanoidRootPart.CanCollide = false
                            TP(v.HumanoidRootPart.Position, v.HumanoidRootPart.CFrame * CFrame.new(0,25,10))
                        end
                    end
                end
            end
end
end

function MOBS2()
CQ()
local M2 = game.ReplicatedStorage:GetChildren()
game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
        for ii, vv in pairs(M2) do
            if vv.Name == Mob then
                vv.Humanoid.WalkSpeed = 1
                TP(vv.HumanoidRootPart.Position,vv.HumanoidRootPart.CFrame)
            end
        end
end
end

function ABS()
if game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
else
    local buso = {
        [1] = "Buso"
}

game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(buso))
end
end

function ATQ()
CQ()
local q = game.Players.LocalPlayer.PlayerGui.Main.Quest
    if q.Visible == false then
            TP(posQuest, lctQuest)
                if game.Players.LocalPlayer.Character.HumanoidRootPart.Position == posQuest then
                    wait(0.25)
                        local qu = {
                            [1] = S,
                            [2] = Quest,
                            [3] = LvQuest
                        }
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(qu))
                end
    end
end

function ATEQ()
if game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Selected_Weapons) then
    local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Selected_Weapons)
    wait(.4)
    game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
end
end

spawn(function()
local cam = require(game.ReplicatedStorage.Util.CameraShaker)
    cam:Stop()
end)

local Config = {
WindowName = "MCE Hub Beta Scripts",
Color = Color3.fromRGB(255,128,64),
Keybind = Enum.KeyCode.RightControl
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Autofarm")
local Tab3 = Window:CreateTab("Player")
local Tab5 = Window:CreateTab("Teleport")
local Tab4 = Window:CreateTab("Misc")
local Tab6 = Window:CreateTab("Shop")
local Tab2 = Window:CreateTab("Settings")

local Section1 = Tab1:CreateSection("Autofarm")
local Section2 = Tab1:CreateSection("Autofarm Settings")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")
local Section5 = Tab3:CreateSection("Character")
local Section7 = Tab6:CreateSection("Fighting Style")
local Section11 = Tab6:CreateSection("Haki")
local Section8 = Tab6:CreateSection("Event")
local Section9 = Tab6:CreateSection("Random Fruit")
local Section6 = Tab5:CreateSection("Island")
local Section16 = Tab5:CreateSection("Teleport World")
local Section12 = Tab4:CreateSection("Redeem Code")
local Section13 = Tab1:CreateSection("AutoStats")
local Section15 = Tab3:CreateSection("Aimbot")
local Section14 = Tab3:CreateSection("Aimbot Settings")


-------------
-------------
-------------
local Toggle1 = Section1:CreateToggle("Autofarm", nil, function(f)
	_G.AutoFarm = f
while _G.AutoFarm do wait()
	    pcall(function()
        AC()
        CQ()
        MOBS()
        MOBS2()
        ABS()
        ATQ()
        ATEQ()
    end)
end
end)
local Toggle001 = Section1:CreateToggle("Auto Superhuman", false, function(vu)
Superhuman = vu
while Superhuman do wait()
                                    if Superhuman then
                                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
                                            local args = {
                                                [1] = "BuyBlackLeg"
                                            }
                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                        end   
                                        if game.Players.LocalPlayer.Character:FindFirstChild("Superhuman") or game.Players.LocalPlayer.Backpack:FindFirstChild("Superhuman") then
                                            _G.Selected_Weapons = "Superhuman"
                                        end  
                                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
                                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value <= 299 then
                                                _G.Selected_Weapons = "Black Leg"
                                            end
                                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value <= 299 then
                                                _G.Selected_Weapons = "Electro"
                                            end
                                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value <= 299 then
                                                _G.Selected_Weapons = "Fishman Karate"
                                            end
                                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value <= 299 then
                                                _G.Selected_Weapons = "Dragon Claw"
                                            end
                                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 300 then
                                                local args = {
                                                    [1] = "BuyElectro"
                                                }
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                            end
                                            if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 300 then
                                                local args = {
                                                    [1] = "BuyElectro"
                                                }
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                            end
                                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 300 then
                                                local args = {
                                                    [1] = "BuyFishmanKarate"
                                                }
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                            end
                                            if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 300 then
                                                local args = {
                                                    [1] = "BuyFishmanKarate"
                                                }
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                            end
                                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 300 then
                                                local args = {
                                                    [1] = "BlackbeardReward",
                                                    [2] = "DragonClaw",
                                                    [3] = "1"
                                                }
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                local args = {
                                                    [1] = "BlackbeardReward",
                                                    [2] = "DragonClaw",
                                                    [3] = "2"
                                                }
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
                                            end
                                            if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 300 then
                                                local args = {
                                                    [1] = "BlackbeardReward",
                                                    [2] = "DragonClaw",
                                                    [3] = "1"
                                                }
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                                local args = {
                                                    [1] = "BlackbeardReward",
                                                    [2] = "DragonClaw",
                                                    [3] = "2"
                                                }
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) 
                                            end
                                            if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 300 then
                                                local args = {
                                                    [1] = "BuySuperhuman"
                                                }
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                            end
                                            if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 300 then
                                                local args = {
                                                    [1] = "BuySuperhuman"
                                                }
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                                            end 
                                        end
                                    end
                                end
end)
-------------
local Dropdown2 = Section2:CreateDropdown("Selected Weapons", weapon, function(weapon)
_G.Selected_Weapons = weapon
end)
local Toggle01 = Section2:CreateButton("Refresh", function()
table.clear(weapon)
    for _, we in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        table.insert(weapon, we.Name)
end
end)
-------------
local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)
Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)

local Colorpicker3 = Section3:CreateColorpicker("UI Color", function(Color)
Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)

local Dropdown3 = Section4:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
if Name == "Default" then
    Window:SetBackground("2151741365")
elseif Name == "Hearts" then
    Window:SetBackground("6073763717")
elseif Name == "Abstract" then
    Window:SetBackground("6073743871")
elseif Name == "Hexagon" then
    Window:SetBackground("6073628839")
elseif Name == "Circles" then
    Window:SetBackground("6071579801")
elseif Name == "Lace With Flowers" then
    Window:SetBackground("6071575925")
elseif Name == "Floral" then
    Window:SetBackground("5553946656")
end
end)
Dropdown3:SetOption("Default")

local Colorpicker4 = Section4:CreateColorpicker("Color", function(Color)
Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(1,1,1))

local Slider3 = Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)
Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
Window:SetTileScale(Value)
end)
Slider4:SetValue(0.5)
-------------
local Toggle002 = Section8:CreateToggle("Auto Random Surprise", nil, function(hal)
_G.Bones = hal
    while _G.Bones do wait()
        local bones = {
            [1] = "Bones",
            [2] = "Buy",
            [3] = 1,
            [4] = 1
        }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(bones))
    end
end)
local Toggle003 = Section8:CreateButton("Random Surprise", function(halr)
_G.Randombones = halr
local bone = {
            [1] = "Bones",
            [2] = "Buy",
            [3] = 1,
            [4] = 1
        }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(bone))
end)
local Toggle004 = Section9:CreateButton("Cousin Random Fruits", function(randomf)
_G.RandomF = randomf
        local randomf = {
            [1] = "Cousin",
            [2] = "Buy"
        }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(randomf))
end)
-------------

----- Agility -----
function Fast_Walk()

    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
    end
    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
    end
    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
    end
    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
    end
    wait(.1)
    local inf = Instance.new("ParticleEmitter")
    inf.Acceleration = Vector3.new(0,0,0)
    inf.Archivable = true
    inf.Drag = 20
    inf.EmissionDirection = Enum.NormalId.Top
    inf.Enabled = true
    inf.Lifetime = NumberRange.new(0.2,0.2)
    inf.LightInfluence = 0
    inf.LockedToPart = true
    inf.Name = "Agility"
    inf.Rate = 500
    local numberKeypoints2 = {
        NumberSequenceKeypoint.new(0, 0);  -- At t=0, size of 0
        NumberSequenceKeypoint.new(1, 4); -- At t=1, size of 10
    }

    inf.Size = NumberSequence.new(numberKeypoints2)
    inf.RotSpeed = NumberRange.new(999, 9999)
    inf.Rotation = NumberRange.new(0, 0)
    inf.Speed = NumberRange.new(30, 30)
    inf.SpreadAngle = Vector2.new(360,360)
    inf.Texture = ""
    inf.VelocityInheritance = 0
    inf.ZOffset = 2
    inf.Transparency = NumberSequence.new(0)
    inf.Color = ColorSequence.new(Color3.fromRGB(0, 255, 255),Color3.fromRGB(0, 255, 255))
    inf.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

    local inf2 = Instance.new("ParticleEmitter")
    inf2.Acceleration = Vector3.new(0,0,0)
    inf2.Archivable = true
    inf2.Drag = 20
    inf2.EmissionDirection = Enum.NormalId.Top
    inf2.Enabled = true
    inf2.Lifetime = NumberRange.new(0.2,0.2)
    inf2.LightInfluence = 0
    inf2.LockedToPart = true
    inf2.Name = "Agility"
    local numberKeypoints3 = {
        NumberSequenceKeypoint.new(0, 0);  -- At t=0, size of 0
        NumberSequenceKeypoint.new(1, 4); -- At t=1, size of 10
    }

    inf2.Size = NumberSequence.new(numberKeypoints3)
    inf2.Rate = 500
    inf2.RotSpeed = NumberRange.new(999, 9999)
    inf2.Rotation = NumberRange.new(0, 0)
    inf2.Speed = NumberRange.new(30, 30)
    inf2.SpreadAngle = Vector2.new(360,360)
    inf2.Texture = ""
    inf2.VelocityInheritance = 0
    inf2.Transparency = NumberSequence.new(0)
    inf2.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0),Color3.fromRGB(255, 0, 0))
    inf2.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

    local inf3 = Instance.new("ParticleEmitter")
    inf3.Acceleration = Vector3.new(0,0,0)
    inf3.Archivable = true
    inf3.Drag = 20
    inf3.EmissionDirection = Enum.NormalId.Top
    inf3.Enabled = true
    inf3.Lifetime = NumberRange.new(0.2,0.2)
    inf3.LightInfluence = 0
    inf3.LockedToPart = true
    inf3.Name = "Agility"
    local numberKeypoints4 = {
        NumberSequenceKeypoint.new(0, 0);  -- At t=0, size of 0
        NumberSequenceKeypoint.new(1, 4); -- At t=1, size of 10
    }

    inf3.Size = NumberSequence.new(numberKeypoints4)
    inf3.Rate = 500
    inf3.RotSpeed = NumberRange.new(999, 9999)
    inf3.Rotation = NumberRange.new(0, 0)
    inf3.Speed = NumberRange.new(30, 30)
    inf3.SpreadAngle = Vector2.new(360,360)
    inf3.Texture = ""
    inf3.VelocityInheritance = 0
    inf3.Transparency = NumberSequence.new(0)
    inf3.Color = ColorSequence.new(Color3.fromRGB(255, 255, 0),Color3.fromRGB(255, 255, 0))
    inf3.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

    local inf4 = Instance.new("ParticleEmitter")
    inf4.Acceleration = Vector3.new(0,0,0)
    inf4.Archivable = true
    inf4.Drag = 20
    inf4.EmissionDirection = Enum.NormalId.Top
    inf4.Enabled = true
    inf4.Lifetime = NumberRange.new(0.2,0.2)
    inf4.LightInfluence = 0
    inf4.LockedToPart = true
    inf4.Name = "Agility"
    local numberKeypoints5 = {
        NumberSequenceKeypoint.new(0, 0);  -- At t=0, size of 0
        NumberSequenceKeypoint.new(1, 4); -- At t=1, size of 10
    }

    inf4.Size = NumberSequence.new(numberKeypoints5)
    inf4.Rate = 500
    inf4.RotSpeed = NumberRange.new(999, 9999)
    inf4.Rotation = NumberRange.new(0, 0)
    inf4.Speed = NumberRange.new(30, 30)
    inf4.SpreadAngle = Vector2.new(360,360)
    inf4.Texture = ""
    inf4.VelocityInheritance = 0
    inf4.Transparency = NumberSequence.new(0)
    inf4.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255),Color3.fromRGB(255, 6, 60))
    inf4.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
end
    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
    end
    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
    end
    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
    end
    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility") then
        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Agility"):Destroy()
end

-------------------
------SHOP------
function BuyBlackLeg()
    local args = {
    [1] = "BuyBlackLeg"
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function BuyElectro()
    local args = {
        [1] = "BuyElectro"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function BuyFishmanKarate()
    local args = {
        [1] = "BuyFishmanKarate"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function BuyFishmanKarate()
    local args = {
        [1] = "BuyFishmanKarate"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function BuyDragonClaw()
    local args = {
        [1] = "BlackbeardReward",
        [2] = "DragonClaw",
        [3] = "1"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {
        [1] = "BlackbeardReward",
        [2] = "DragonClaw",
        [3] = "2"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function BuySuperhuman()
    local args = {
        [1] = "BuySuperhuman"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function BuyDeathStep()
    local args = {
        [1] = "BuyDeathStep"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function BuySharkmanKarate()
    local args = {
        [1] = "BuySharkmanKarate",
        [2] = true
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    local args = {
        [1] = "BuySharkmanKarate"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

------Shop------
local Toggle05 = Section7:CreateButton("Black Leg", function(bleg)
 _G.Buy_Black_Leg = bleg
 pcall(function()
 BuyBlackLeg()
end)
end)

local Toggle06 = Section7:CreateButton("Electro", function(elet)
 _G.Buy_Electro = elet
 pcall(function()
 BuyElectro()
end)
end)

local Toggle07 = Section7:CreateButton("Fishman Karate", function(fishm)
 _G.Buy_Fishman_Karate = fishm
 pcall(function()
 BuyFishmanKarate()
end)
end)

local Toggle08 = Section7:CreateButton("Dragon Claw", function(drac)
 _G.Buy_Dragon_Claw = darc
 pcall(function()
 BuyDragonClaw()
end)
end)

local Toggle10 = Section7:CreateButton("Superhuman", function(suph)
 _G.Buy_SuperHuman = suph
 pcall(function()
 BuySuperhuman()
end)
end)

local Toggle10 = Section7:CreateButton("DeathStep", function(deats)
 _G.Buy_Death_Step = deats
 pcall(function()
 BuyDeathStep()
end)
end)

local Toggle11 = Section7:CreateButton("Sharkman Karate", function(shkt)
 _G.Buy_Sharkman_Karate = shkt
 pcall(function()
 BuySharkmanKarate()
end)
end)

local Toggle12 = Section8:CreateButton("Random bones", function(rbone)
 _G.Buy_Random_bones = rbone
 pcall(function()
 bones()
end)
end)
----------------
----Agility-----
local Toggle04 = Section5:CreateButton("Speed Walk", function(wwsp)
	_G.Fast_Walk = wwsp
	    pcall(function()
        Fast_Walk()
    end)
end)
----------------
----Haki----

function Buy_Geppo()
    local args = {
        [1] = "BuyHaki",
        [2] = "Geppo"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function Buy_Buso()
    local args = {
        [1] = "BuyHaki",
        [2] = "Buso"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function Buy_Soru()
    local args = {
        [1] = "BuyHaki",
        [2] = "Soru"
    }

    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

------------

local Toggle13 = Section11:CreateButton("Geppo [Skyjump]", function(skyj)
 _G.Buy_Sky_Jump = skyj
 pcall(function()
 Buy_Geppo()
end)
end)

local Toggle14 = Section11:CreateButton("Buso [Enhancement]", function(ecnm)
 _G.Buy_Haki = ecnm
 pcall(function()
 Buy_Buso()
end)
end)

local Toggle15 = Section11:CreateButton("Soru [Flash Step]", function(fash)
 _G.Buy_Soru = fash
 pcall(function()
 Buy_Soru()
end)
end)

------------ 

--- Teleport ---

local Distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if Distance < 50 then
    Speed = 25000
elseif Distance >= 250 then
    Speed = 200

end

function Startisland()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(1071.2832, 16.3085976, 1426.86792)}):Play()
end

function marinestart()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-2573.3374, 6.88881969, 2046.99817)}):Play()
end

function middletown()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-655.824158, 7.88708115, 1436.67908)}):Play()
end

function jungleisland()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-1249.77222, 11.8870859, 341.356476)}):Play()
end

function piratevillage()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-1122.34998, 4.78708982, 3855.91992)}):Play()
end

function desertisland()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(1094.14587, 6.47350502, 4192.88721)}):Play()
end

function frozenvillage()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(1198.00928, 27.0074959, -1211.73376)}):Play()
end
    
function marineford()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-4505.375, 20.687294, 4260.55908)}):Play()
end

function colosseum()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-1428.35474, 7.38933945, -3014.37305)}):Play()
end

function Skyland1()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-4970.21875, 717.707275, -2622.35449)}):Play()
end

function Skyland2()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-4813.0249, 903.708557, -1912.69055)}):Play()
end

function Skyland3()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-7952.31006, 5545.52832, -320.704956)}):Play()
end

function Prison()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(4874.8125, 5.6519904136658, 735.57012939453)}):Play()
end

function Magmavillage()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-5231.75879, 8.61593437, 8467.87695)}):Play()
end

function underwatercity()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(61163.8516, 11.7796879, 1819.78418)}):Play()
end

function fountaincity()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(5132.7124, 4.53632832, 4037.8562)}):Play()
end

function cyborghouse()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(6262.72559, 71.3003616, 3998.23047)}):Play()
end

function shankroom()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-1442.16553, 29.8788261, -28.3547478)}):Play()
end

function mobisland()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-2850.20068, 7.39224768, 5354.99268)}):Play()
end

--WORLD 2

function FirstSP()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(82.9490662, 18.0710983, 2834.98779)}):Play()
end

function Cafe()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-385.250916, 73.0458984, 297.388397)}):Play()
end

function Factory()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(430.42569, 210.019623, -432.504791)}):Play()
end

function swanmansion()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-390.096313, 331.886475, 673.464966)}):Play()
end

function swanroom()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(2302.19019, 15.1778421, 663.811035)}):Play()
end

function darkarena()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = game.Workspace["_WorldOrigin"].Locations["Dark Arena"].CFrame}):Play()
end

function greenbit()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-2372.14697, 72.9919434, -3166.51416)}):Play()
end

function colosseum()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-1836.58191, 44.5890656, 1360.30652)}):Play()
end

function ghostisland()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-5571.84424, 195.182297, -795.432922)}):Play()
end

function vampireisland()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-5931.77979, 5.19706631, -1189.6908)}):Play()
end

function snowmountain()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(1384.68298, 453.569031, -4990.09766)}):Play()
end

function coldisland()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-6026.96484, 14.7461271, -5071.96338)}):Play()
end

function magmaisland()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-5478.39209, 15.9775667, -5246.9126)}):Play()
end

function cursedship()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(902.059143, 124.752518, 33071.8125)}):Play()
end

function icecastle()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(5400.40381, 28.21698, -6236.99219)}):Play()
end

function forgottenisland()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-3043.31543, 238.881271, -10191.5791)}):Play()
end

function usoapisland()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(4748.78857, 8.35370827, 2849.57959)}):Play()
end

function miniskyisland()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-260.358917, 49325.7031, -35259.3008)}):Play()
end

function secretroom()
    game:GetService("TweenService"):Create(
    game.Players.LocalPlayer.Character.HumanoidRootPart,
    TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
    {CFrame = CFrame.new(-2128.38867, 149.874435, -95.2233658, -0.190948173, 1.07975268e-07, -0.981599987, 2.93935e-06, 1, -4.61784907e-07, 0.981599987, -2.97344309e-06, -0.190948173)}):Play()
end

------------

if world1 then
    local Toggle16 = Section6:CreateButton("Startisland", function(telea)
        _G.Teleport_world1_1 = telea
        pcall(function()
        Startisland()
       end)
       end)
       
       local Toggle17 = Section6:CreateButton("MarineStart", function(teleb)
       _G.Teleport_world1_2 = teleb
        pcall(function()
        marinestart()
       end)
       end)
       
       local Toggle18 = Section6:CreateButton("MiddleTown", function(telec)
       _G.Teleport_world1_3 = telec
        pcall(function()
        middletown()
       end)
       end)
       
       local Toggle19 = Section6:CreateButton("Jungle", function(teled)
       _G.Teleport_world1_4 = teled
        pcall(function()
        jungleisland()
       end)
       end)
       
       local Toggle20 = Section6:CreateButton("Pirate Village", function(telee)
       _G.Teleport_world1_5 = telee
        pcall(function()
        piratevillage()
       end)
       end)
       
       local Toggle21 = Section6:CreateButton("Desert Island", function(telef)
       _G.Teleport_world1_6 = telef
        pcall(function()
        desertisland()
       end)
       end)
       
       local Toggle22 = Section6:CreateButton("Frozen Island", function(teleg)
       _G.Teleport_world1_7 = teleg
        pcall(function()
        frozenvillage()
       end)
       end)
       
       local Toggle23 = Section6:CreateButton("Marine Ford", function(teleh)
       _G.Teleport_world1_8 = teleh
        pcall(function()
        marineford()
       end)
       end)
       
       local Toggle24 = Section6:CreateButton("Colosseum", function(telei)
       _G.Teleport_world1_9 = telei
        pcall(function()
        colosseum()
       end)
       end)
       
       local Toggle25 = Section6:CreateButton("SkyLand [1]", function(telej)
       _G.Teleport_world1_10 = telej
        pcall(function()
        Skyland1()
       end)
       end)
       
       local Toggle26 = Section6:CreateButton("SkyLand [2]", function(telek)
       _G.Teleport_world1_11 = telek
        pcall(function()
        Skyland2()
       end)
       end)
       
       local Toggle27 = Section6:CreateButton("SkyLand [3]", function(telel)
       _G.Teleport_world1_12 = telel
        pcall(function()
        Skyland3()
       end)
       end)
       
       local Toggle28 = Section6:CreateButton("Prison", function(telem)
       _G.Teleport_world1_13 = telem
        pcall(function()
        Prison()
       end)
       end)
       
       local Toggle29 = Section6:CreateButton("Magma Village", function(telen)
       _G.Teleport_world1_14 = telen
        pcall(function()
        Magmavillage()
       end)
       end)
       
       local Toggle30 = Section6:CreateButton("UnderWater City", function(teleo)
       _G.Teleport_world1_15 = teleo
        pcall(function()
        underwatercity()
       end)
       end)
       
       local Toggle31 = Section6:CreateButton("Cyborg House", function(telep)
       _G.Teleport_world1_16 = telep
        pcall(function()
        cyborghouse()
       end)
       end)
       
       local Toggle32 = Section6:CreateButton("Shank's Room", function(teleqq)
       _G.Teleport_world1_17 = teleqq
        pcall(function()
        shankroom()
       end)
       end)
       
       local Toggle33 = Section6:CreateButton("Mob Island", function(teler)
       _G.Teleport_world1_18 = teler
        pcall(function()
        mobisland()
       end)
       end)
end
   
if world2 then
    local Toggle41 = Section6:CreateButton("First Sp", function(www1)
        _G.Teleport_world1_19 = www1
         pcall(function()
         FirstSP()
        end)
        end)
        
        local Toggle42 = Section6:CreateButton("Cafe", function(www2)
        _G.Teleport_world1_20 = www2
         pcall(function()
         Cafe()
        end)
        end)
        
        local Toggle43 = Section6:CreateButton("Factory", function(www3)
            _G.Teleport_world1_21 = www3
             pcall(function()
             Factory()
            end)
            end)
        
        local Toggle44 = Section6:CreateButton("Swan Mansion", function(www4)
            _G.Teleport_world1_22 = www4
             pcall(function()
             swanmansion()
            end)
            end)
        
        local Toggle45 = Section6:CreateButton("Swan Room", function(www5)
            _G.Teleport_world1_23 = www5
             pcall(function()
             swanroom()
            end)
            end)
        
        local Toggle46 = Section6:CreateButton("Dark Arena", function(www6)
            _G.Teleport_world1_24 = www6
             pcall(function()
             darkarena()
            end)
            end)
        
        local Toggle47 = Section6:CreateButton("Green Bit", function(www7)
            _G.Teleport_world1_25 = www7
             pcall(function()
             greenbit()
            end)
            end)
        
        local Toggle48 = Section6:CreateButton("Colosseum", function(www8)
            _G.Teleport_world1_27 = www8
             pcall(function()
             colosseum()
            end)
            end)
        
        local Toggle49 = Section6:CreateButton("Ghost Island", function(www9)
            _G.Teleport_world1_28 = www9
             pcall(function()
             ghostisland()
            end)
            end)
        
        local Toggle50 = Section6:CreateButton("Vampire Island", function(www10)
            _G.Teleport_world1_29 = www10
             pcall(function()
             vampireisland()
            end)
            end)
        
        local Toggle51 = Section6:CreateButton("Snow Mountain", function(www11)
            _G.Teleport_world1_30 = www11
             pcall(function()
             snowmountain()
            end)
            end)
        
        local Toggle52 = Section6:CreateButton("Cold Island", function(www12)
            _G.Teleport_world1_31 = www12
             pcall(function()
             coldisland()
            end)
            end)
        
        local Toggle53 = Section6:CreateButton("Magma Island", function(www13)
            _G.Teleport_world1_32 = www13
             pcall(function()
             magmaisland()
            end)
            end)
        
        local Toggle54 = Section6:CreateButton("Cursed Ship", function(www14)
            _G.Teleport_world1_33 = www14
             pcall(function()
             cursedship()
            end)
            end)
        
        local Toggle55 = Section6:CreateButton("Ice Castle", function(www15)
            _G.Teleport_world1_34 = www15
             pcall(function()
             icecastle()
            end)
            end)
        
        local Toggle56 = Section6:CreateButton("Forgotten Island", function(www16)
            _G.Teleport_world1_35 = www16
             pcall(function()
             forgottenisland()
            end)
            end)
        
        local Toggle57 = Section6:CreateButton("Usoap's Island", function(www17)
            _G.Teleport_world1_36 = www17
             pcall(function()
             usoapisland()
            end)
            end)
        
        local Toggle58 = Section6:CreateButton("Minisky Island", function(www18)
            _G.Teleport_world1_37 = www18
             pcall(function()
             miniskyisland()
            end)
            end)
        
        local Toggle59 = Section6:CreateButton("Secret Room", function(www19)
            _G.Teleport_world1_38 = www19
             pcall(function()
             secretroom()
            end)
            end)
        
end
if world3 then
    local Toggle35 = Section6:CreateButton("ComingSoonWorld3", function(www12)
        _G.Teleport_world1_18 = www12
         pcall(function()
         mobisland()
        end)
        end)
end
 
---world---

function TeleSea1()
local args = {
    [1] = "TravelMain" -- OLD WORLD to NEW WORLD
}
game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function TeleSea2()
    local args = {
        [1] = "TravelDressrosa" -- NEW WORLD to OLD WORLD
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end

---

local Toggle37 = Section16:CreateButton("Teleport To Sea 1", function(seaa)
    _G.Teleport_Sea_1 = seaa
    pcall(function()
    TeleSea1()
   end)
   end)

local Toggle39 = Section16:CreateButton("Teleport To Sea 2", function(seab)
    _G.Teleport_Sea_2 = seab
    pcall(function()
    TeleSea2()
   end)
   end)


-----------


------------
--- code ---

local Toggle35 = Section12:CreateButton("Redeem All Code [X2 CODE]", function()
   function UseCode(Text)
     game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Text)
end
UseCode("FUDD10")
UseCode("BIGNEWS")
UseCode("THEGREATACE")
UseCode("SUB2NOOBMASTER123")
UseCode("Sub2Daigrock")
UseCode("Axiore")
UseCode("TantaiGaming")
UseCode("STRAWHATMAINE")
UseCode("Sub2OfficialNoobie")
UseCode("SUB2GAMERROBOT_EXP1")
UseCode("THEGREATACE")
UseCode("UPD15")
UseCode("2BILLION")
UseCode("UPD16")
end)

------------

---INF STAMINA---

local Toggle009 = Section5:CreateToggle("Inf Energy", nil, function(value)
    InfinitsEnergy = value
    originalstam = LocalPlayer.Character.Energy.Value
end)
local LocalPlayer = game:GetService'Players'.LocalPlayer
local originalstam = LocalPlayer.Character.Energy.Value
function infinitestam()
    LocalPlayer.Character.Energy.Changed:connect(function()
        if InfinitsEnergy then
            LocalPlayer.Character.Energy.Value = originalstam
        end
    end)
end
spawn(function()
    while wait(.1) do
        if InfinitsEnergy then
            wait(0.3)
            originalstam = LocalPlayer.Character.Energy.Value
            infinitestam()
        end
    end
end)

--- Dodge No cooldown

function NoDodgeCool()
    if nododgecool then
        for i,v in next, getgc() do
            if game.Players.LocalPlayer.Character.Dodge then
                if typeof(v) == "function" and getfenv(v).script == game.Players.LocalPlayer.Character.Dodge then
                    for i2,v2 in next, getupvalues(v) do
                        if tostring(v2) == "0.4" then
                            repeat wait(.1)
                                setupvalue(v,i2,0)
                            until not nododgecool
                        end
                    end
                end
            end
        end
    end
end


local Toggle012 = Section5:CreateToggle("Dodge No Cooldown", nil, function(nocdd)
    nododgecool = nocdd
    NoDodgeCool()
end)

------------------

-- -- -- -- -- ---

----Auto Stats----

function Automelee()
    local args = {
        [1] = "AddPoint",
        [2] = "Melee",
        [3] = Points
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function Autodefense()
    local args = {
        [1] = "AddPoint",
        [2] = "Defense",
        [3] = Points
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function AutoSword()
    local args = {
        [1] = "AddPoint",
        [2] = "Sword",
        [3] = Points
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function AutoGun()
    local args = {
        [1] = "AddPoint",
        [2] = "Gun",
        [3] = Points
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

function AutoDevilfruit()
    local args = {
        [1] = "AddPoint",
        [2] = "Demon Fruit",
        [3] = Points
    }
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end

---

local Toggle005 = Section13:CreateToggle("Melee", nil, function(zasd)
	_G.Auto_Melee = zasd
while _G.Auto_Melee do wait()
	    pcall(function()
            Automelee()
    end)
end
end)

local Toggle006 = Section13:CreateToggle("Defense", nil, function(zase)
	_G.Auto_Defense = zase
while _G.Auto_Defense do wait()
	    pcall(function()
            Autodefense()
    end)
end
end)

local Toggle007 = Section13:CreateToggle("Sword", nil, function(zasf)
	_G.Auto_Sword = zasf
while _G.Auto_Sword do wait()
	    pcall(function()
            AutoSword()
    end)
end
end)

local Toggle008 = Section13:CreateToggle("Gun", nil, function(zasg)
	_G.Auto_Gun = zasg
while _G.Auto_Gun do wait()
	    pcall(function()
            AutoGun()
    end)
end
end)

local Toggle009 = Section13:CreateToggle("Devil Fruit", nil, function(zash)
	_G.Auto_Defruit = zash
while _G.Auto_Defruit do wait()
	    pcall(function()
            AutoDevilfruit()
    end)
end
end)

local Slider1 = Section13:CreateSlider("Points", 1,10,nil,true, function(pons)
	Points = pons
end)


local Toggle010 = Section1:CreateToggle("AutoClick", nil, function(atcc)
	_G.Auto_Click = atcc
while _G.Auto_Click do wait()
	    pcall(function()
            AC()
    end)
end
end)

------
local Toggle011 = Section2:CreateToggle("Fast Attack", nil, function(bool)
FastAtk = bool
end)

local q = game.Players.LocalPlayer.PlayerGui.Main.Quest
spawn(function()
    while wait() do
        if q.Visible == true then
            game:GetService'VirtualUser':Button1Down(Vector2.new(0.9,0.9))
            game:GetService'VirtualUser':Button1Up(Vector2.new(0.9,0.9))
        end
    end
end)


local Dropdown4 = Section14:CreateDropdown("Select Player", PlayerName, function(aimplayer)
Players = aimplayer
v.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
v.HumanoidRootPart.Transparency = 1
end)

---super functions---
local Toggle040 = Section5:CreateToggle("Ctrl+Click [Teleport]", nil, function(ctrltp)
    CTRL = ctrltp
end)
local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()
Mouse.Button1Down:connect(
    function()
        if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
            return
        end
        if not Mouse.Target then
            return
        end
        if CTRL then
            Plr.Character:MoveTo(Mouse.Hit.p)
        end
    end)
----------------















