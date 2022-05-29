_G.ScriptEnabled = true;
_G.Farming = false;
_G.Speed = 200;
local ts = game:GetService("TweenService")
-- Needed Locals
local Player = game.Players.LocalPlayer;
local Char = Player.Character;
local board_radius = 10;
local job_radius = 15;
local Mission = Player.PlayerGui.Mission.Frame;
local Dirt = game:GetService("Workspace").Dirt;
local Posters = game:GetService("Workspace").Posters;
local Delivery = game:GetService("Workspace").Delivery;
local jobboard = game:getService("Workspace").Corkboard.Board["Color this to paint the board"]

-- Anti Chair Technology
for i,v in pairs(game.Workspace:GetChildren()) do -- WE OUT TO FIND EM!
    if v.Name == "Model" then
        for i,z in pairs(v:GetDescendants()) do -- SEARCH FOR EM CHAIRS! REEEEEE
            if z:IsA("Seat") then -- GET OUTTA HERE!
                z:Destroy(); -- MUAHAHAHAH
            end
        end
    end
end

function TP(endpos)
    if endpos then
        print("Teleporting")
        local Time = (endpos - game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position).magnitude/_G.Speed
        local Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
        local Tween = ts:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart,Info,{CFrame = CFrame.new(endpos.X,endpos.Y +5,endpos.Z)})
        Tween:Play()
        task.wait(Time)
        task.wait(0.5)
    end
end

-- Name Hide (Credits to Rziln on V3RM)
function Hide_Name()
    pcall(function()
        local ign = Player.PlayerGui.HUD.Naming.Text
        for i,v in pairs(Char:GetChildren()) do
           if v:IsA("Accessory") or v:IsA("Pants") or v:IsA("Shirt") then
               print(v)
               v:Destroy()
           end
        end
        
        for i,v in pairs(Char:GetChildren()) do
           if v:IsA("Part") then
               warn(v)
               v.Color = Color3.new(0, 0, 0)
           end
        end
        Char[ign]:Destroy()
    end)
end

-- Auto Farm
function Farm()
    pcall(function() -- Avoid breaking the script
        _G.Farming = true; -- Started
        
        TP(jobboard.Position); -- Teleport us to Board

            fireclickdetector(jobboard.ClickDetector); -- If we fire too soon we get kicked.
        
        task.wait(1); -- Just incase.. lel
        
        local Job = nil; -- Current Job
        
        -- Check if we got the job and what we're doing.
        if Mission.Visible == true then
            
            local JobDesc = Mission.Desc.Text
            
            -- FACKIN DISCUSTANG (google it)
            if string.match(JobDesc, "groceries") then
                Job = "Delivery";
            elseif string.match(JobDesc, "dirt") then
                Job = "Dirt";
            elseif string.match(JobDesc, "posters") then
                Job = "Posters" 
            end
            
            print("Current Job: "..Job);
            
            -- Dirt Job
            if Job == "Dirt" then
                local dirtchildren = Dirt:GetChildren()
                local dirtneeded = 1337;
                repeat
                for i, dirtchild in ipairs(dirtchildren) do
                    if Mission.Visible == true then -- Still jobing!
                        if dirtchild.Decal.Transparency == 0 then -- Not taken
                            Char.Humanoid.Jump = true;
                            TP(dirtchild.Position);
                            -- Rub hands and task.task.wait for us to get close enough
                                fireclickdetector(dirtchild.ClickDetector);
                            task.wait(3)
                            dirtneeded = tonumber(string.match(Mission.Desc.Text, "%d+"));
                        end
                    else
                        _G.Farming = false;
                    end
                end
                task.wait();
                until dirtneeded <= 0 or Mission.Visible == false
                _G.Farming = false;
            end
            
            -- Posters Job
            if Job == "Posters" then
                local postchildren = Posters:GetChildren()
                local postneeded = 1337;
                repeat
                for i, postchild in ipairs(postchildren) do
                    if Mission.Visible == true then -- Still jobing!
                        if postchild.Decal.Transparency == 1 then -- Not taken
                            Char.Humanoid.Jump = true;
                            TP(postchild.Position);
                             -- Rub hands and task.wait for us to get close enough
                                fireclickdetector(postchild.ClickDetector);
                            task.wait(3)
                            postneeded =  tonumber(string.match(Mission.Desc.Text, "%d+"));
                        end
                    else
                        _G.Farming = false;
                    end
                end
                task.wait();
                until postneeded <= 0 or Mission.Visible == false
                _G.Farming = false;
            end
            
            -- Delivery Job
            if Job == "Delivery" then
                local deliverychildren = Delivery:GetChildren()
                for i, delivechild in ipairs(deliverychildren) do
                    if delivechild.Name == "Part" then
                        task.wait(1);
                        Char.Humanoid.Jump = true;
                        TP(delivechild.Position);
                        repeat task.wait() until (Char.HumanoidRootPart.Position - delivechild.Position).magnitude < job_radius or Mission.Visible == false
                    end
                end
                task.wait(1);
                _G.Farming = false;
            end
            
            _G.Farming = false;
        end
        
        _G.Farming = false;
    end)
end

Char.Humanoid.Changed:Connect(function()
    if Char.Humanoid.Health <= 0 then -- ded
        pcall(function() 
            _G.ScriptEnabled = false; -- Stop it from calling the Farm Function;
            _G.Farming = false; -- Stop it from calling the Farm Function;
            task.wait(10); -- task.wait for respawn and ect.
            Hide_Name(); -- Rehide our name
            Char.Humanoid:Move(Vector3.new(0, 0, -5), true) -- Move a bit to avoid getting kicked.
            -- If there isn't a humanoid then rip.
            _G.ScriptEnabled = true;
        end)
end
end)

-- Call Hide_Name first execution.
Hide_Name();

while _G.ScriptEnabled do
    task.wait(1); -- No need to cause un-needed lag..
    if not _G.Farming and not Mission.Visible then
        Farm();
    end
end