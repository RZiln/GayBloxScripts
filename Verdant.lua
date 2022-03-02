local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(false)
Player = game:GetService("Players").LocalPlayer
_G.ESP = false

local Finity = loadstring(game:HttpGet("https://raw.githubusercontent.com/RZiln/GayBloxScripts/master/finity_lib.lua"))()
local FinityWindow = Finity.new(true)
FinityWindow.ChangeToggleKey(Enum.KeyCode.RightAlt)

local Main = FinityWindow:Category("Main")
local Misc = FinityWindow:Category("Misc")

local VisualSector = Main:Sector("ESP")
local DestroyUI = Misc:Sector("Destroy UI")

ESP:AddObjectListener(game:GetService("Workspace").NPCs.Standard, {
    Color =  Color3.new(1, 0.823529, 0.823529),
    Type = "Model",
    Name = "Aitveras",
    PrimaryPart = function(obj)
        local hrp = obj:FindFirstChildWhichIsA("BasePart")
        while not hrp do
            wait()
            hrp = obj:FindFirstChildWhichIsA("BasePart")
        end
        return hrp
    end,
    Validator = function(obj)
        return not game.Players:GetPlayerFromCharacter(obj)
    end,
    IsEnabled = "NPCs",
})
ESP.NPCs = false

VisualSector:Cheat("Checkbox", "ESP", function(State)
    if State == true then
        ESP:Toggle(true)
    else
        ESP:Toggle(false)
    end

end)

VisualSector:Cheat("Checkbox", "Aitveras ESP", function(State)
    ESP.NPCs = State

end)

----------------------------------------------------
DestroyUI:Cheat("Button", "Destroy UI", function()
	game:GetService("CoreGui").FinityUI:Destroy()
end)
