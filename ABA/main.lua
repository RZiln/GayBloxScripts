game:GetService("Players").PlayerAdded:Wait()
task.wait(5)

game:GetService("RunService"):Set3dRenderingEnabled(false)
setfpscap(10)
if game.PlaceId == 5411459567 then
    repeat task.wait(1) until game.Workspace.Message
end
_G.MinTimer = 60

local function notify(text)
    game.StarterGui:SetCore("SendNotification", {
        Title = "RZiln's AFK hop",
        Duration = 10,
        Text = text
    })
end

if game.GameId == 578392296 then
    if game.PlaceId ~= 5411459567 then
        notify("Joining AFK World")
        syn.queue_on_teleport(
            'loadstring(game:HttpGet("https://raw.githubusercontent.com/RZiln/GayBloxScripts/master/ABA/main.lua", true))()')
        game:GetService('TeleportService'):Teleport(5411459567)
    end

    notify("AFK Hop running")
    local function timerCheck()
        local timer = game.Workspace.Message.Text:split(" ")
        local time = tonumber(timer[1])
        return time
    end

    if timerCheck() <= _G.MinTimer then
        notify("Waiting for reward")
        repeat
            task.wait()
        until timerCheck() > _G.MinTimer
        notify("Server Hopping")
        task.wait(1)
        syn.queue_on_teleport(
            'loadstring(game:HttpGet("https://raw.githubusercontent.com/RZiln/GayBloxScripts/master/ABA/main.lua", true))()')
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RZiln/GayBloxScripts/master/ABA/ServerHop.lua", true))()
    else
        notify("Server Hopping")
        syn.queue_on_teleport(
            'loadstring(game:HttpGet("https://raw.githubusercontent.com/RZiln/GayBloxScripts/master/ABA/main.lua", true))()')
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RZiln/GayBloxScripts/master/ABA/ServerHop.lua", true))()
    end

end
