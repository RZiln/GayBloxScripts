repeat task.wait() until game:IsLoaded()

game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Queue.Infinite.InfiniteMode.CFrame

task.wait(1)
local A_1 = "InfLevel"
local A_2 = "-1.7"
local A_3 = false
local Event = game:GetService("ReplicatedStorage").Remotes.Input
Event:FireServer(A_1, A_2, A_3)

task.wait(1)

local A_1 = "Start"
local Event = game:GetService("ReplicatedStorage").Remotes.Input
Event:FireServer(A_1)





