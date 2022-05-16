local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
Player = game:GetService("Players").LocalPlayer

local Finity = loadstring(game:HttpGet("https://raw.githubusercontent.com/RZiln/GayBloxScripts/master/finity_lib.lua"))()
local FinityWindow = Finity.new(true)
FinityWindow.ChangeToggleKey(Enum.KeyCode.RightAlt)

local Main = FinityWindow:Category("Main")
local Misc = FinityWindow:Category("Misc")

local PlayerVisualSector = Main:Sector("Player ESP")
local ItemVisualSector = Main:Sector("Item ESP")
local DestroyUI = Misc:Sector("Destroy UI")

ESP:AddObjectListener(game:GetService("Workspace"), {
    Name = "Lock",
    Recursive = true,
    CustomName = "Chest",
    Validator = function(obj)
        return not obj:FindFirstChild("TouchTransmitter")
        end,
    Color = Color3.fromRGB(123, 169, 255),
    IsEnabled = "Chest",
})


ESP.Players = false
ESP.Names = false
ESP.Boxes = false
ESP.Tracers = false


PlayerVisualSector:Cheat("Checkbox", "Player ESP", function(State)
    ESP.Players = State
end)

PlayerVisualSector:Cheat("Checkbox", "Names", function(State)
    ESP.Names = State
end)

PlayerVisualSector:Cheat("Checkbox", "Boxes", function(State)
    ESP.Boxes = State
end)

PlayerVisualSector:Cheat("Checkbox", "Tracers", function(State)
    ESP.Tracers = State
end)

PlayerVisualSector:Cheat("ColorPicker", "Color", function(Color)
    ESP.Color = Color
end)


ESP.Box = false
ItemVisualSector:Cheat("Checkbox", "Chest ESP", function(State)
    ESP.Chest = State

end)


----------------------------------------------------
DestroyUI:Cheat("Button", "Destroy UI", function()
	game:GetService("CoreGui").FinityUI:Destroy()
end)
