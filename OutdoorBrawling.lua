local ts = game:GetService("TweenService")
local quest = game:GetService("Players").IShoujo.PlayerGui.QuestGui.Frame.Type
local function Tween(part, endpos, speed, grounding)
    if part and endpos then

        local Time = (endpos - part.Position).magnitude / speed
        local Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
        local Tween = ts:Create(part, Info, {
            CFrame = CFrame.new(endpos.X, endpos.Y - grounding, endpos.Z)
        })
        Tween:Play()
        wait(Time)
    end
end

local function noclip()
    local noclip = true

while true do
    player = game.Players.LocalPlayer
    character = player.Character

    if noclip then
        for _, v in pairs(character:GetDescendants()) do
            pcall(function()
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end)
        end
    end

    game:GetService("RunService").Stepped:wait()
end
end
spawn(noclip)
--- Dirt



local function Dirt()
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
    Tween((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart),
        (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position), (80), 15)
    print("Searching for dirt")
    for i, v in pairs(game:GetService("Workspace").DD:GetChildren()) do
        if v.Decal.Transparency == 0 then
            Tween((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart), (v.Position), (80), 4)
            task.wait(3)
            fireclickdetector(v.ClickDetector)
            task.wait(3)
        end
    end
end

--[[ --- secret magnitude
Tween((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart),
    (game:GetService("Workspace").Deliver2.Position), (80))


 ]]
    

Dirt()
if string.find(quest.Text, "Trip") then

    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true
    Tween((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart),
    Tween((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart),(game:GetService("Workspace").Deliver.Position), (80), 5))
    Tween((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart),(game:GetService("Workspace").Deliver.Position), (80), 5))
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false

    elseif string.find(quest.Text,"Clean 80 Patches of Dirt....") then
        print("Dirt")
        Dirt()
end