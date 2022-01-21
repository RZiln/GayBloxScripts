local Players = game:GetService("Players")
game:GetService("Players").LocalPlayer.Character.Head:Destroy()
for i = 1, 20 do
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position = game:GetService("Workspace").Map.Clickable.Garbage.Position
    wait()
end