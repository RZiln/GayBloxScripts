repeat
    task.wait(2)
until game.Loaded

if game.PlaceId == 8304191830 then

    local Player = game:GetService 'Players'.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    Character:WaitForChild("HumanoidRootPart")
    Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["_npcs"].kisuke.Torso.CFrame

    print('Ran')
    local url =
        "https://discord.com/api/webhooks/814771602868404225/4Qu3nbBl6Y7Kdbe0wgDof9vSHbTZ5X2ZLHKmUR-y-xdGPOIpfxJmOM5fCR4aO64XL8nI"

    local function sendWebhook(contents)
        local data = {
            ["embeds"] = {{
                ["title"] = "| Summons | 😎",
                ["description"] = contents,
                ["type"] = "rich",
                ["color"] = tonumber(0x7269da)
            }}
        }
        local newdata = game:GetService("HttpService"):JSONEncode(data)
        local headers = {
            ["content-type"] = "application/json"
        }
        local wh = {
            Url = url,
            Body = newdata,
            Method = "POST",
            Headers = headers
        }
        request = http_request or request or HttpPost or syn.request
        local HttpService = game:GetService("HttpService")
        request(wh)
    end
    task.wait(5)
    local summonUI = game:GetService("Players").LocalPlayer.PlayerGui.HatchGui.Main.Main.Scroll

    local HttpService = game:GetService("HttpService")
    local var = false

    local summonList = {}
    for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.HatchGui:GetDescendants()) do
        if v:IsA("Model") and v.Name == "WorldModel" then

            unit = v:FindFirstChildOfClass("Model")

            table.insert(summonList, tostring(unit))
        end
    end

    if isfile("SummonWebhook.txt") then
        print("File Exists")
        for i, v in pairs(HttpService:JSONDecode(readfile("SummonWebhook.txt"))) do

            if v == summonList[i] then

                print("Match")

            elseif v ~= summonList[i] and var == false then
                sendWebhook(HttpService:JSONEncode(summonList))
                var = true
                print("Not a match")
            end
        end

        if var == true then
            writefile("SummonWebhook.txt", HttpService:JSONEncode(summonList))
        end

    else
        writefile("SummonWebhook.txt", HttpService:JSONEncode(summonList))
        sendWebhook(HttpService:JSONEncode(summonList))
        print(isfile("SummonWebhook.txt"))
    end
end
