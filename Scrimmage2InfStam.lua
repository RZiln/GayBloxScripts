local Player = game:GetService("Players").LocalPlayer
local Stamina = game:GetService("Players").LocalPlayer.Character.Stamina

local NewStamina = 1/0

local Hook;
Hook = hookfunction(getrawmetatable(game).__index, newcclosure(function(o,i)
   if o == Stamina and i == "Value" then
       return NewStamina
   end
   return Hook(o,i)
end))