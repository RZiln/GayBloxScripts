_G.MinTimer = 60


if game.GameId == 578392296 then
    
    if game.PlaceId ~= 5411459567 then
        game:GetService('TeleportService'):Teleport(5411459567)
    end

    local function timerCheck()
        local timer = game.Workspace.Message.Text:split(" ")
        local time = tonumber(timer[1])
        return time
    end

    if timerCheck() <= _G.MinTimer then
        repeat task.wait() until timerCheck() > _G.MinTimer

    end


end