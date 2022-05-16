local borntodie = game.Workspace['Enemies']
for _, v in ipairs(borntodie:GetChildren()) do
    if v:FindFirstChild("HumanoidRootPart") and v.Name == "Name of the model" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame + Vector3.new(0, -6, 0)
    end
end
