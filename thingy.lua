--fireclickdetector(game:GetService("Workspace").Map["Job Board"]["Click Part"].ClickDetector)
gloves = game:GetService("Workspace").Folders.QuestLocations.Gloves
plr = game:GetService("Players").LocalPlayer
local quest = game:GetService("Players").IShoujo.PlayerGui.Bars.Quest.Description
for i, v in pairs(gloves:GetDescendants()) do
    if v:IsA("TouchTransmitter") and v.Parent:FindFirstChild("QuestMarker") then
    plr.Character.HumanoidRootPart.CFrame = v.Parent.CFrame * CFrame.new(15, 0, 15)
    task.wait(1)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0) --0 is touch
    task.wait()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1) -- 1 is untouch
    end
end