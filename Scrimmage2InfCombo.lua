local Player = game:GetService("Players").LocalPlayer
local Stamina = game:GetService("Workspace")["HUMANOID_HOLDER"].IShoujo.Combo

local NewStamina = 1

local Hook;
Hook = hookfunction(getrawmetatable(game).__index, newcclosure(function(o,i)
   if o == Stamina and i == "Value" then
       return NewStamina
   end
   return Hook(o,i)
end))