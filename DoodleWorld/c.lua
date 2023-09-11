-- Decompiled by Electron BETA [ Made By (Co) ]
-- Path: Workspace.008_LakewoodStation.NPC.Doctor.Interact
local v1 = {BlackRightInk = 2.553, YellowInk = 2.752, CyanInk = 3.522, PinkInk = 2.697, BlackLeftInk = 2.553}
return (function(a1, a2)
local u1 = a1.Tween
local u2 = a1.Utilities
local u3 = (function(a1, a2) -- FillInk
local v1 = v1[a1.Name]
if a2 then
v1 = math.random(250, v1 * 1000 - 500) / 1000
end
local v2 = v1 - a1.Size.Y / 2
v2.Size = v1 * 1000(a1.Size.X, v1, a1.Size.Z)
v2.Position = a1.Position + a1.Size(0, v2, 0)
u1:PlayTween(a1, v2, true, 1.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
end)
local v4 = "I can heal your Doodles to full health using this machine."
v4.Talking = "Shall I heal your Doodles?"
local v5 = true
v4.YesNo = v5
v5.Talk = {(function(a1)
a1.Dialogue:SaySimple("Okay, I'll take your Doodles for a few seconds.", a1, "Doctor")
else if a1.CurrentChunk:FindFirstChild("HealingStation") then
local L_HealingStation_1 = a1.CurrentChunk:FindFirstChild("HealingStation")
local v1 = L_HealingStation_1.PrimaryPart
a1:RotateTo(L_HealingStation_1.PrimaryPart.Position)
v1 = u2
v1 = 0.3
v1.Halt(v1)
v1 = a1.ClientDatabase
local v2 = {}
local v3, v4, v5 = pairs(v1)
for v6,v7 in v3 do
local v8 = L_HealingStation_1:FindFirstChild("Slots"):FindFirstChild("Glow" .. v6)
v2[v6] = a1.Capsule.new({}, v7, v8)
a1.Sound:Play("Click")
a1.Utilities.Halt(0.15)
end
local v9 = v8.Position
v9 = Enum.EasingStyle.Quad
v3(v5, v6, v9, v8)
v9 = "Doctor"
v3(v5, v6, v9)
local v10, v11, v12 = v3(v4)
for v13,v14 in v10 do
v8(v14)
end
v10(v12)
v10(v11)
local v15 = "Doctor"
v10(v12, v13, v15)
v10(v12)
v10(v11)
local v16, v17, v18 = v10(v11)
for v19,v20 in v16 do
v8(v20, true)
end
v16(v18)
v16(v17)
v16()
v16(v18, v19, v20)
for v21 = v18, v16, v17 do
if v19 then
v19()
v19(v8)
v19(v20)
end
end
v16()
v16(v21, v19)
v16(v21)
v16(v21)
v16(v21, v19, v20)
end
end)}
v4.Yes = v5
v5.Talk = {(function(a1)
a1.Dialogue:SaySimple("We hope to see you again!", a1, "Doctor")
end)}
v4.No = v5
local v6 = {}
v6[1] = {Talk = {{Talking = "Hello, and welcome to DoodleCo Pharmacy00â00„00¢!"}, {Talking = v4}, v4}}
return {Dialogue = v6, Name = v6, NPCId = v6}
end)
