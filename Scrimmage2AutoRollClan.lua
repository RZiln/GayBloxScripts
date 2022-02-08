local roll = game:GetService("Workspace").Map.Clickable["Reroll Genetics - 4000$"].Head.ClickDetector
local clanWanted =  {
    "The other Tokita student"
}
local complete = false

while complete == false do
    task.wait()
    local clan = game:GetService("Players").LocalPlayer.PlayerGui.StarterGuiPackageScrimmage2.HUD.Inventory.ItemInfo.Genetics.Text
    for i,v in next, clanWanted do
        if clan:match(v) then
            complete = true
            print("You got it finally! "..v)
        end
        task.wait()
    end
    if complete ~= true then
    fireclickdetector(roll)
    end
    task.wait(5)
end


