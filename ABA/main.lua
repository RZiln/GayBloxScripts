_G.MinTimer = 60

game:GetService("Players").PlayerAdded:Wait()

wait(3)

local function notify(text)
    game.StarterGui:SetCore("SendNotification", {
		Title = "RZiln's AFK hop";
        Duration = 10;
		Text = text
	})
end

if game.GameId == 578392296 then

    game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
        if State == Enum.TeleportState.Started then
            syn.queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/RZiln/GayBloxScripts/master/ABA/main.lua", true))()')
        end
    end)
    
    if game.PlaceId ~= 5411459567 then
        notify("Joining AFK World")
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
        repeat task.wait() until timerCheck() > _G.MinTimer
        notify("Server Hopping")
        task.wait(1)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RZiln/GayBloxScripts/master/ABA/ServerHop.lua", true))()
    else
        notify("Server Hopping")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RZiln/GayBloxScripts/master/ABA/ServerHop.lua", true))()
    end


end