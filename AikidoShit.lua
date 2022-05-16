local pizzashit = game:GetService("Workspace").QuestMarkers.Pizza

local Player = game:GetService("Players").LocalPlayer
local ts = game:GetService("TweenService")

local Finity = loadstring(game:HttpGet("https://raw.githubusercontent.com/RZiln/GayBloxScripts/master/finity_lib.lua"))()
local FinityWindow = Finity.new(true)
FinityWindow.ChangeToggleKey(Enum.KeyCode.RightAlt)

local Main = FinityWindow:Category("Main")
local Credits = FinityWindow:Category("Credits")
local Misc = FinityWindow:Category("Misc")

local FarmSector = Main:Sector("Farm")
local DestroyUI = Misc:Sector("Destroy UI")
local Scripter = Credits:Sector("Scripter")
local UiCred = Credits:Sector("UI")

local function Tween(part, endpos, speed)
    if part and endpos then
        local Time = (endpos - part.Position).magnitude/speed
        local Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
        local Tween = ts:Create(part,Info,{CFrame = CFrame.new(endpos.X,endpos.Y,endpos.Z)})
        Tween:Play()
        wait(Time)
    end
end


FarmSector:Cheat("Button", "TrashFarm", function()
    Player.Character.HumanoidRootPart.Anchored = true
	for i, v in pairs(game:GetService("Workspace").Cracks:GetChildren()) do
        print("222")
        Tween((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart), (v.Position), (100))
        print("111")
        repeat task.wait() until Player.Character.HumanoidRootPart.Position == v.Position
        task.wait(5)
    end
    Player.Character.HumanoidRootPart.Anchored = false
end)



----------------------------------------------------
DestroyUI:Cheat("Button", "Destroy UI", function()
	game:GetService("CoreGui").FinityUI:Destroy()
end)

Scripter:Cheat("Label", "RZiln#4004")
UiCred:Cheat("Label", "detourious")

