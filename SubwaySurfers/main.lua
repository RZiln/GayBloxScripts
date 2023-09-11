local frame = '0'
local runService = game:GetService("RunService")

runService.RenderStepped:Connect(function(deltaTime)
    if #frame == 1 then
        frame = '0'..frame
    end

    local Image = Drawing.new("Image")
    local Full = workspace.CurrentCamera.ViewportSize
    Image.Size = Vector2.new(Full.X / 2, Full.Y / 2)
    Image.Position = Vector2.new(0, Full.Y / 2)
    Image.Data = game:HttpGet(
        `https://raw.githubusercontent.com/RZiln/GayBloxScripts/master/SubwaySurfers/Frames/frame_{frame}_delay-0.05s.jpg`)
    Image.Visible = true

    task.wait(1/24)
    Image:Destroy()
    frame = tonumber(frame) + 1

    if frame > 84 then
        frame = 0
    end

    frame = tostring(frame)
end)

