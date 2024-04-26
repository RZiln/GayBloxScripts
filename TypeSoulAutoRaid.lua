task.wait(5)
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
print("Running")
if game.PlaceId == 17047374266 then


local mobs = {};
local networkOneShot = {};
local Maid  = loadstring(game:HttpGet("https://raw.githubusercontent.com/Quenty/NevermoreEngine/version2/Modules/Shared/Events/Maid.lua", true))()
oneShotPercent = 100

LivingThings = game:GetService("Workspace").Entities or Instance.new("Model");
networkOneShot.__index = networkOneShot;


function listenToChildAdded(folder, listener, options)
    options = options or {listenToDestroying = false};

    local createListener = typeof(listener) == 'table' and listener.new or listener;

    assert(typeof(folder) == 'Instance', 'listenToChildAdded folder #1 listener has to be an instance');
    assert(typeof(createListener) == 'function', 'listenToChildAdded #2 listener has to be a function');

    local function onChildAdded(child)
        local listenerObject = createListener(child);

        if (options.listenToDestroying) then
            child.Destroying:Connect(function()
                local removeListener = typeof(listener) == 'table' and (function() local a = (listener.Destroy or listener.Remove); a(listenerObject) end) or listenerObject;

                if (typeof(removeListener) ~= 'function') then
                    warn('[Utility] removeListener is not definded possible memory leak for', folder);
                else
                    removeListener(child);
                end;
            end);
        end;
    end

    debug.profilebegin(string.format('Utility.listenToChildAdded(%s)', folder:GetFullName()));

    for _, child in next, folder:GetChildren() do
        task.spawn(onChildAdded, child);
    end;

    debug.profileend();

    return folder.ChildAdded:Connect(createListener);
end;

function networkOneShot.new(mob)
    local self = setmetatable({},networkOneShot);
    mobs[mob] = self;

    self._maid = Maid.new();

    self.char = mob;
    self.humanoid = mob.Humanoid;
    self.hrp = mob.HumanoidRootPart;

    self._maid:GiveTask(mob.Destroying:Connect(function()
        self:Destroy();
    end))
    print("Made Connection!", mob);
    self._maid:GiveTask(game:GetService("RunService").RenderStepped:Connect(function()

        if oneShotPercent < self.humanoid.Health/self.humanoid.MaxHealth*100 then return; end
        self.humanoid.Health = 0
        --self.char:PivotTo(CFrame.new(self.hrp.Position.X,workspace.FallenPartsDestroyHeight-500,self.hrp.Position.Z))
    end))
end

function networkOneShot:Destroy()
    self._maid:DoCleaning();
    for i,v in next, mobs do
        if v ~= self then continue; end

        mobs[i] = nil;
    end
end

function networkOneShot:ClearAll()
    for _,v in next, mobs do
        v:Destroy();
    end
end

game:GetService("RunService").Heartbeat:Connect(function()
    sethiddenproperty(game.Players.LocalPlayer,"MaxSimulationRadius",math.huge);
    sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",math.huge);
end)

local oneShotNpc = listenToChildAdded(LivingThings,function(instance)
    if game.Players:FindFirstChild(instance.Name) then return; end
    if not instance:WaitForChild("HumanoidRootPart",5) or not instance:WaitForChild("Humanoid",5) then return; end

    networkOneShot.new(instance);
end)


game.Players.LocalPlayer.PlayerGui.ScreenEffects.ChildAdded:Connect(function(child)

    local webhook = "https://discord.com/api/webhooks/1077595753935024158/v3ygQ8f67XGIpnO67VtT68Pue9hp0nK8dIkNCfNGGLap9MqHW4zWQlGZLKMBYMQJSOCp"
    local http = game:GetService("HttpService")
    local message = {
    embeds = { {
        title = game.Players.LocalPlayer.Name,
        description = child:WaitForChild("TextLabel").Text,
        color = 16776995
    } },
    attachments = { }
    }
    local jsonMessage = http:JSONEncode(message)
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local success, response = pcall(function()
        return request({
            Url = webhook,
            Body = jsonMessage,
            Method = "POST",
            Headers = headers,
        })
    end)

    print(success, table.unpack(response))


    end)

elseif game.PlaceId == 14069678431 then

game:GetService("Players").LocalPlayer.Character.CharacterHandler.Remotes.PartyCreate:FireServer()
task.wait(.1)
fireclickdetector(game:GetService("Workspace").NPCs.RaidBoss.Kisuke.ClickDetector)
task.wait(1)
game:GetService("Players").LocalPlayer.Kisuke:FireServer("Yes")
task.wait(5)
game:GetService("TeleportService"):Teleport(14069678431)
end