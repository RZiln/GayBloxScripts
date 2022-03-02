Player = game:GetService("Players").LocalPlayer

local Finity = loadstring(game:HttpGet("https://raw.githubusercontent.com/RZiln/GayBloxScripts/master/finity_lib.lua"))()
local FinityWindow = Finity.new(true)
FinityWindow.ChangeToggleKey(Enum.KeyCode.RightAlt)

local Main = FinityWindow:Category("Main")
local Misc = FinityWindow:Category("Misc")

local CombatSector = Main:Sector("Combat")
local DestroyUI = Misc:Sector("Destroy UI")


CombatSector:Cheat("Button", "No CC", function()

	Player.conditions.cc.slows.ChildAdded:Connect(function(c)
        task.wait()
        if c and c.Parent then
            c:Destroy()
        end
    end)

    Player.conditions.cc.roots.ChildAdded:Connect(function(c)
        task.wait()
        if c and c.Parent then
            c:Destroy()
        end
    end)

    Player.conditions.cc.stuns.ChildAdded:Connect(function(c)
        task.wait()
        if c and c.Parent then
            c:Destroy()
        end
    end)

end)


----------------------------------------------------
DestroyUI:Cheat("Button", "Destroy UI", function()
	game:GetService("CoreGui").FinityUI:Destroy()
end)