local Finity = loadstring(game:HttpGet("https://raw.githubusercontent.com/RZiln/GayBloxScripts/master/finity_lib.lua"))()
local FinityWindow = Finity.new(true)
FinityWindow.ChangeToggleKey(Enum.KeyCode.RightAlt)

local Main = FinityWindow:Category("Main")
local Misc = FinityWindow:Category("Misc")

local CalistheticsSector = Main:Sector("Calisthetics")
local DestroyUI = Misc:Sector("Destroy UI")

--------------------------------------------------------
DestroyUI:Cheat("Button", "Destroy UI", function()
	game:GetService("CoreGui").FinityUI:Destroy()
end)