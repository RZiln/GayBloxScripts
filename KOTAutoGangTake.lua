local Bases = game:GetService("Workspace").Bases
local ts = game:GetService("TweenService")
repeat task.wait() until game:IsLoaded()
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.


local function Tween(part, endpos, speed)
    if part and endpos then
        local Time = (endpos - part.Position).magnitude/speed
        local Info = TweenInfo.new(Time, Enum.EasingStyle.Linear)
        local Tween = ts:Create(part,Info,{CFrame = CFrame.new(endpos.X,endpos.Y +5,endpos.Z)})
        Tween:Play()
        wait(Time)
    end
end

local function punch()
    local A_1 = true
        local A_2 = 1
        local Event = game:GetService("Players").LocalPlayer.Backpack.zoom.boom.accion
        Event:FireServer(A_1, A_2)
        task.wait()
end

for i, v in pairs(game.Workspace:GetDescendants()) do
    if v:IsA("TouchTransmitter") and v.Parent:FindFirstChild("Decal") then
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
        wait()
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
    end
end
task.wait(2)
for i,v in pairs(Bases:GetDescendants()) do
    print(v)
    if v.Name == "Head" then
        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Position, 300)
        task.wait(2)
        punch()
        punch()
        task.wait(2)
        Teleport()
        break
    end
end

