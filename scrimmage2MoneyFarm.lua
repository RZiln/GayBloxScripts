local ts = game:GetService("TweenService")


local lp = game.Players.LocalPlayer
local ms = lp:GetMouse()
local rm = getrawmetatable(game)
local index = rm.__index
local bv = Instance.new("BoolValue");
bv.Value = false;
setreadonly(rm,false)

rm.__index = function(self,j)
   if tostring(self) == "Part" and tostring(j) == "Anchored" then
       return index(bv,"Value")
end
   return index(self,j)
end


game:GetService("RunService").Stepped:Connect(function()
    game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)
       lp.Character.Head.CanCollide = false
       lp.Character.Torso.CanCollide = false
end);

local function Tween(part, endpos, speed)
    if part and endpos then
        local Time = (endpos - part.Position).magnitude/speed
        local Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
        local Tween = ts:Create(part,Info,{CFrame = CFrame.new(endpos.X,endpos.Y +5,endpos.Z)})
        Tween:Play()
        wait(Time)
    end
end

local plr = game:GetService("Players").LocalPlayer
while true do
    wait()
    for i,v in next, game:GetService("Workspace").Map.Clickable:GetChildren() do
        if v.Name == "Garbage" then
            if v.Click.Name ~= nil then
                Tween((game:GetService("Players").LocalPlayer.Character.HumanoidRootPart), (v.Position), (_G.Speed))
                
                fireclickdetector(v.ClickDetector, 32)
                fireclickdetector(game:GetService("Workspace").NPCS.MainNPC.ClickBox.ClickDetector)
                wait()
            end
            
        end
        wait()
    end
end

