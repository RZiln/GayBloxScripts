-- Decompiled with the Synapse X Luau decompiler.

wait(0.75);
local l__Name__1 = script.Parent.Parent.Parent.Name;
local l__Parent__2 = script.Parent;
local v3 = tick() - 1;
local l__Parent__4 = l__Parent__2.Parent.Parent;
local l__Character__5 = l__Parent__4.Character;
local l__mouse__6 = l__Parent__4:GetMouse();
local l__ReplicatedStorage__7 = game:GetService("ReplicatedStorage");
local l__Humanoid__8 = l__Character__5:WaitForChild("Humanoid");
local v9 = game.ReplicatedStorage.Remotes.Request:InvokeServer("Style");
local u1 = l__Parent__4.Character.Humanoid:LoadAnimation(script.Parent[v9].Idle);
local l__Walk__2 = script.Parent[v9].Walk;
local l__walk__3 = l__Character__5:FindFirstChild("Animate"):FindFirstChild("walk");
l__Parent__2.Equipped:Connect(function(p1)
	local l__Parent__10 = l__Parent__2.Parent;
	if game.ReplicatedStorage.Remotes.Request:InvokeServer("Style") ~= "Katana" then
		u1:Play();
		game.StarterPlayer.StarterCharacterScripts.Animate.walk.WalkAnim.AnimationId = l__Walk__2.AnimationId;
		l__walk__3.WalkAnim.AnimationId = l__Walk__2.AnimationId;
		return;
	end;
	local v11 = l__Parent__4.Character.Humanoid:LoadAnimation(script.Parent[v9].Equip);
	v11:Play();
	v11.Stopped:Wait();
	u1:Play();
	game.StarterPlayer.StarterCharacterScripts.Animate.walk.WalkAnim.AnimationId = l__Walk__2.AnimationId;
	l__walk__3.WalkAnim.AnimationId = l__Walk__2.AnimationId;
end);
styleh = {
	Normal = { "Right Arm", "Left Arm", "Right Arm", "Left Arm", "Right Arm" }, 
	Sumo = { "Right Arm", "Left Arm", "Right Arm", "Left Arm", "Right Arm" }, 
	Boxing = { "Right Arm", "Left Arm", "Right Arm", "Left Arm", "Right Arm" }, 
	Karate = { "Right Arm", "Left Arm", "Right Arm", "Left Arm", "Right Arm" }, 
	Muay = { "Right Arm", "Left Arm", "Right Arm", "Left Arm", "Right Arm" }
};
local u4 = true;
local u5 = v3;
local u6 = 1;
local l__accion__7 = script.Parent.Parent.zoom.boom.accion;
local u8 = {
	Normal = 0, 
	Sumo = 0.1, 
	Boxing = -0.1, 
	OldBoxing = -0.1, 
	Karate = -0.1, 
	Muay = -0.07, 
	Wrestling = 0.01, 
	Taekwondo = -0.08, 
	Niko = -0.08, 
	Nikoo = -0.24, 
	ASumo = -0.15, 
	Marbs = -0.15, 
	KungFu = -0.2, 
	Van = -0.22, 
	Helly = -0.22, 
	Hitman = -0.1, 
	Booter = -0.05, 
	Yuri = -0.22, 
	Formless = -0.18, 
	Mercenary = -0.18, 
	Raishin = -0.22, 
	Gaolang = -0.22, 
	Momo = -0.22, 
	Ashley = -0.22, 
	Woo = -0.22, 
	NORMAL = -0.22, 
	Baritsu = -0.2, 
	Lethwei = -0.1
};
l__Parent__2.Activated:Connect(function(p2)
	if not l__Parent__4.Character.Status:FindFirstChild("KO") and not l__Parent__4.Character.Status:FindFirstChild("Stunned") and not l__Parent__4.Character.Status:FindFirstChild("Pushup") and not l__Parent__4.Character.Status:FindFirstChild("Blocking") and not l__Parent__4.Character:FindFirstChild("Boulders") then
		local v12 = Instance.new("StringValue", l__Parent__4.Character.Status);
		v12.Name = "attack";
		game.Debris:AddItem(v12, 0.4);
		if u4 == false then
			return;
		else
			if tick() - u5 > 1.5 then
				u6 = 1;
			end;
			u4 = false;
			u5 = tick();
			local v13 = game.ReplicatedStorage.Remotes.Request:InvokeServer("Style");
			local v14 = l__Parent__4.Character.Humanoid:LoadAnimation(script.Parent[v13]["Punch" .. u6]);
			v14:Play();
			v14:AdjustSpeed(1.4);
			l__accion__7:FireServer(true, u6);
			u6 = u6 + 1;
			wait(0.35 + u8[v13]);
			if u6 > 5 then
				u6 = 1;
				wait(1.8 + u8[v13]);
			end;
			u4 = true;
			l__accion__7:FireServer(false);
			return;
		end;
	end;
end);
l__Parent__2.Unequipped:Connect(function(p3)
	if game.ReplicatedStorage.Remotes.Request:InvokeServer("Style") ~= "Katana" then
		u1:Stop();
		game.StarterPlayer.StarterCharacterScripts.Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=180426354";
		l__walk__3.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=180426354";
		return;
	end;
	local v15 = l__Parent__4.Character.Humanoid:LoadAnimation(script.Parent[v9].Unequip);
	u1:Stop();
	game.StarterPlayer.StarterCharacterScripts.Animate.walk.WalkAnim.AnimationId = l__Walk__2.AnimationId;
	l__walk__3.WalkAnim.AnimationId = l__Walk__2.AnimationId;
	v15:Play();
	v15.Stopped:Wait();
end);
l__mouse__6.Button2Down:Connect(function()
	if u4 == false then
		return;
	end;
	if l__Character__5:FindFirstChild(script.Parent.Name) then
		if not (not l__Parent__4.Character.Status:FindFirstChild("KO")) or not (not l__Parent__4.Character.Status:FindFirstChild("Dashing")) or not (not l__Parent__4.Character.Status:FindFirstChild("Stunned")) or not (not l__Parent__4.Character.Status:FindFirstChild("Pushup")) or not (not l__Parent__4.Character.Status:FindFirstChild("Blocking")) or l__Parent__4.Character:FindFirstChild("Boulders") then
			return;
		else
			u4 = false;
			if l__Parent__4.Backpack.zoom.zoomies.Value == true and l__Parent__4.Backpack.zoom.ven.Value > 4 and v9 == "Wrestling" or l__Parent__4.Backpack.zoom.zoomies.Value == true and l__Parent__4.Backpack.zoom.ven.Value > 4 and v9 == "Woo" or l__Parent__4.Backpack.zoom.zoomies.Value == true and l__Parent__4.Backpack.zoom.ven.Value > 4 and v9 == "Van" then
				u4 = false;
				l__Character__5.Humanoid.Jump = true;
				local v16 = l__Parent__4.Character.Humanoid:LoadAnimation(script.Parent.Drop);
				v16:Play();
				v16:AdjustSpeed(1.19);
				local v17 = Instance.new("BodyVelocity", l__Character__5.HumanoidRootPart);
				v17.Velocity = l__Character__5.HumanoidRootPart.CFrame.lookVector * 35;
				v17.MaxForce = Vector3.new(1000000, 10000000, 100000000);
				game.Debris:AddItem(v17, 0.3);
				wait(0.35);
				l__accion__7:FireServer(true, "DropKick");
				wait(1.5);
				u4 = true;
				return;
			end;
			local v18 = Instance.new("StringValue", l__Parent__4.Character.Status);
			v18.Name = "attack";
			game.Debris:AddItem(v18, 1.4);
			local v19 = true;
			l__accion__7:FireServer(nil);
			local v20 = l__Parent__4.Character.Humanoid:LoadAnimation(script.Parent.Rhl);
			v20:Play();
			wait(0.05);
			v20:AdjustSpeed(0);
			wait(0.35);
			if l__Character__5.Status:FindFirstChild("Stunned") then
				v19 = false;
			end;
			wait(0.15);
			if l__Character__5.Status:FindFirstChild("Stunned") or v19 == false then
				v20:Stop();
			else
				v20:AdjustSpeed(2);
				l__accion__7:FireServer(true, "Kick");
			end;
			wait(1.5);
			u4 = true;
		end;
	end;
end);
l__Parent__4.PlayerGui.HUD.Kick.MouseButton1Click:Connect(function()
	if u4 == false then
		return;
	end;
	if l__Character__5:FindFirstChild(script.Parent.Name) then
		if not (not l__Parent__4.Character.Status:FindFirstChild("KO")) or not (not l__Parent__4.Character.Status:FindFirstChild("Dashing")) or not (not l__Parent__4.Character.Status:FindFirstChild("Stunned")) or not (not l__Parent__4.Character.Status:FindFirstChild("Pushup")) or not (not l__Parent__4.Character.Status:FindFirstChild("Blocking")) or l__Parent__4.Character:FindFirstChild("Boulders") then
			return;
		else
			u4 = false;
			if l__Parent__4.Backpack.zoom.zoomies.Value ~= true or not (l__Parent__4.Backpack.zoom.ven.Value > 4) or v9 ~= "Wrestling" then
				if v9 == "Woo" or v9("Van") then
					u4 = false;
					l__Character__5.Humanoid.Jump = true;
					local v21 = l__Parent__4.Character.Humanoid:LoadAnimation(script.Parent.Drop);
					v21:Play();
					v21:AdjustSpeed(1.19);
					local v22 = Instance.new("BodyVelocity", l__Character__5.HumanoidRootPart);
					v22.Velocity = l__Character__5.HumanoidRootPart.CFrame.lookVector * 35;
					v22.MaxForce = Vector3.new(1000000, 10000000, 100000000);
					game.Debris:AddItem(v22, 0.3);
					wait(0.35);
					l__accion__7:FireServer(true, "DropKick");
					wait(1.5);
					u4 = true;
					return;
				end;
				local v23 = Instance.new("StringValue", l__Parent__4.Character.Status);
				v23.Name = "attack";
				game.Debris:AddItem(v23, 1.4);
				local v24 = true;
				l__accion__7:FireServer(nil);
				local v25 = l__Parent__4.Character.Humanoid:LoadAnimation(script.Parent.Rhl);
				v25:Play();
				wait(0.05);
				v25:AdjustSpeed(0);
				wait(0.35);
				if l__Character__5.Status:FindFirstChild("Stunned") then
					v24 = false;
				end;
				wait(0.15);
				if l__Character__5.Status:FindFirstChild("Stunned") or v24 == false then
					v25:Stop();
				else
					v25:AdjustSpeed(2);
					l__accion__7:FireServer(true, "Kick");
				end;
				wait(1.5);
				u4 = true;
			else
				u4 = false;
				l__Character__5.Humanoid.Jump = true;
				v21 = l__Parent__4.Character.Humanoid:LoadAnimation(script.Parent.Drop);
				v21:Play();
				v21:AdjustSpeed(1.19);
				v22 = Instance.new("BodyVelocity", l__Character__5.HumanoidRootPart);
				v22.Velocity = l__Character__5.HumanoidRootPart.CFrame.lookVector * 35;
				v22.MaxForce = Vector3.new(1000000, 10000000, 100000000);
				game.Debris:AddItem(v22, 0.3);
				wait(0.35);
				l__accion__7:FireServer(true, "DropKick");
				wait(1.5);
				u4 = true;
				return;
			end;
		end;
	end;
end);
local u9 = false;
l__Parent__2.AncestryChanged:Connect(function()
	if l__Parent__2.Parent == l__Character__5 then
		local v26 = game.ReplicatedStorage.Remotes.Request:InvokeServer("Style");
		if v26 == "Booter" and l__Character__5.Torso.Size == Vector3.new(2, 1, 1) then
			l__Character__5.Humanoid.HipHeight = 0.6;
			u9 = true;
			return;
		end;
		if v26 == "Booter" and l__Character__5.Torso.Size == Vector3.new(3.7, 6, 3.7) then
			l__Character__5.Humanoid.HipHeight = -1;
			u9 = true;
			return;
		end;
	elseif l__Parent__2.Parent == l__Parent__4.Backpack then
		local v27 = game.ReplicatedStorage.Remotes.Request:InvokeServer("Style");
		if v27 == "Booter" and l__Character__5.Torso.Size == Vector3.new(2, 1, 1) then
			if u9 then
				l__Character__5.Humanoid.HipHeight = -0.4;
				u9 = false;
				return;
			end;
		elseif v27 == "Booter" and l__Character__5.Torso.Size == Vector3.new(5.7, 6, 3.7) and u9 then
			l__Character__5.Humanoid.HipHeight = 2;
			u9 = false;
		end;
	end;
end);
while true do
	wait(1);
	if l__Parent__4.Backpack.DashLocal.Disabled == true then
		game.ReplicatedStorage.Remotes.Cast:FireServer();
	end;
end;
