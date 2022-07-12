local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local Toggled = false
local Keybind = "q"
_G.cd = 0.3
local run = 0
local function key(a)
    keypress(a)
    keyrelease(a)
end

Mouse.KeyDown:Connect(function(Key)
    if Key == Keybind then
        if Toggled then
            Toggled = false
        else
            Toggled = true
            while Toggled do

                key(0x35)
                if run == 0 then
                    key(0x41)
                    key(0x41)
                    run = 1
                elseif run == 1 then
                    key(0x44)
                    key(0x44)
                    run = 0
                end

                task.wait(.3)
                mouse1click()
                task.wait(.2)

                key(0x34)
                task.wait(.2)
                mouse1click()
                task.wait(.1)

                key(0x33)
                task.wait(.2)
                mouse1click()
                task.wait(.1)

            end
        end
    end
end)
