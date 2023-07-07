-- decompiled by Sentinel (took 4.268732ms)
repeat
	task.wait()
until game:IsLoaded()
local v_u_1 = game.Players.LocalPlayer
local v_u_2 = v_u_1.Character or v_u_1.CharacterAdded:Wait()
local v_u_3 = game:GetService("ReplicatedStorage").Remotes
local v_u_4 = game:GetService("UserInputService")
local v_u_5 = game:GetService("TweenService")
function shootinput(p6)
	-- upvalues: (copy) v_u_4
	task.wait(0.095)
	return v_u_4:IsKeyDown(Enum.KeyCode[p6])
end
v_u_4.InputBegan:Connect(function(p7, p8)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if p8 then
		return
	elseif v_u_2:FindFirstChild("Ball") then
		return
	elseif p7.KeyCode == Enum.KeyCode.Space then
		v_u_3.Block:FireServer(true, 1)
	elseif p7.KeyCode == Enum.KeyCode.ButtonY then
		v_u_3.Block:FireServer(true, 1)
	end
end)
v_u_4.InputBegan:Connect(function(p9, p10)
	-- upvalues: (copy) v_u_3
	if not p10 then
		if p9.KeyCode == Enum.KeyCode.LeftShift or p9.KeyCode == Enum.KeyCode.ButtonR2 then
			v_u_3.Sprint:FireServer({
				["Sprinting"] = true
			})
		end
	end
end)
v_u_4.InputEnded:Connect(function(p11, p12)
	-- upvalues: (copy) v_u_3
	if not p12 then
		if p11.KeyCode == Enum.KeyCode.LeftShift or p11.KeyCode == Enum.KeyCode.ButtonR2 then
			v_u_3.Sprint:FireServer({
				["Sprinting"] = false
			})
		end
	end
end)
v_u_4.InputBegan:Connect(function(p13, p14)
	-- upvalues: (copy) v_u_3
	if p14 then
		return
	elseif p13.KeyCode == Enum.KeyCode.E then
		v_u_3.Shoot:FireServer(shootinput("E"), 1)
	elseif p13.KeyCode == Enum.KeyCode.ButtonX then
		v_u_3.Shoot:FireServer(true, 1)
	end
end)
v_u_4.InputEnded:Connect(function(p15, p16)
	-- upvalues: (copy) v_u_3
	if not p16 then
		if p15.KeyCode == Enum.KeyCode.E or p15.KeyCode == Enum.KeyCode.ButtonX then
			v_u_3.Shoot:FireServer(false, 2)
		end
	end
end)
v_u_4.InputBegan:Connect(function(p17, p18)
	-- upvalues: (copy) v_u_3
	if p18 then
		return
	elseif p17.KeyCode == Enum.KeyCode.Space then
		v_u_3.Dunk:FireServer(true, 1)
	elseif p17.UserInputType == Enum.UserInputType.Gamepad1 and p17.KeyCode == Enum.KeyCode.ButtonY then
		v_u_3.Dunk:FireServer(true, 1)
	end
end)
v_u_4.InputEnded:Connect(function(p19, p20)
	-- upvalues: (copy) v_u_3
	if p20 then
		return
	elseif p19.KeyCode == Enum.KeyCode.Space then
		v_u_3.Dunk:FireServer(false, 2)
	elseif p19.UserInputType == Enum.UserInputType.Gamepad1 and p19.KeyCode == Enum.KeyCode.ButtonY then
		v_u_3.Dunk:FireServer(false, 2)
	end
end)
v_u_4.InputBegan:Connect(function(p21, p22)
	-- upvalues: (copy) v_u_3
	if p22 then
		return
	elseif p21.KeyCode == Enum.KeyCode.G then
		v_u_3.Guard:FireServer(true, 1)
	elseif p21.UserInputType == Enum.UserInputType.Gamepad1 and p21.KeyCode == Enum.KeyCode.ButtonL2 then
		v_u_3.Guard:FireServer(true, 1)
	end
end)
v_u_4.InputEnded:Connect(function(p23, p24)
	-- upvalues: (copy) v_u_3
	if p24 then
		return
	elseif p23.KeyCode == Enum.KeyCode.G then
		v_u_3.Guard:FireServer(false, 2)
	elseif p23.UserInputType == Enum.UserInputType.Gamepad1 and p23.KeyCode == Enum.KeyCode.ButtonL2 then
		v_u_3.Guard:FireServer(false, 2)
	end
end)
v_u_4.InputBegan:Connect(function(p25, p26)
	-- upvalues: (copy) v_u_3
	if p26 then
		return
	elseif p25.KeyCode == Enum.KeyCode.R then
		v_u_3.Steal:FireServer(true, 1)
	elseif p25.UserInputType == Enum.UserInputType.Gamepad1 and p25.KeyCode == Enum.KeyCode.ButtonX then
		v_u_3.Steal:FireServer(true, 1)
	end
end)
v_u_4.InputBegan:Connect(function(p27, p28)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
	if not p28 then
		if p27.KeyCode == Enum.KeyCode.R and v_u_2:FindFirstChild("Ball") then
			if v_u_4:IsKeyDown(Enum.KeyCode.T) then
				v_u_3.Pass:FireServer({
					["Type"] = "Closest", 
					["TypeOfPass"] = "Lob"
				})
				return
			end
			v_u_3.Pass:FireServer({
				["Type"] = "Closest"
			})
		end
	end
end)
v_u_4.InputBegan:Connect(function(p29, p30)
	-- upvalues: (copy) v_u_3
	if not p30 then
		if p29.KeyCode == Enum.KeyCode.B then
			v_u_3.DropBall:FireServer(true, 1)
		end
	end
end)
game.ReplicatedStorage.Remotes.Tween.OnClientEvent:Connect(function(p31, p32, p33)
	-- upvalues: (copy) v_u_5
	print(p31)
	v_u_5:Create(p33, TweenInfo.new(p32), p31):Play()
end)
game.ReplicatedStorage.Remotes.ChangeDirection.OnClientEvent:Connect(function(_, _) end)
game:GetService("Players")
local v_u_34 = {}
task.wait(1)
local v_u_35 = {
	{
		Enum.KeyCode.One, 
		["Controller"] = { Enum.KeyCode.ButtonA }
	}, 
	{
		Enum.KeyCode.Two, 
		["Controller"] = { Enum.KeyCode.ButtonB }
	}, 
	{
		Enum.KeyCode.Three, 
		["Controller"] = { Enum.KeyCode.ButtonX }
	}, 
	{ Enum.KeyCode.Four }, 
	{ Enum.KeyCode.Five }, 
	{ Enum.KeyCode.Six }, 
	{ Enum.KeyCode.Seven }, 
	{ Enum.KeyCode.Eight }, 
	{ Enum.KeyCode.Nine }
}
v_u_4.InputBegan:Connect(function(p36, p37)
	-- upvalues: (copy) v_u_35, (ref) v_u_34, (copy) v_u_4, (copy) v_u_3
	if not p37 then
		if p36.UserInputType ~= Enum.UserInputType.Gamepad1 then
			for v38, v39 in v_u_35, nil, nil do
				if table.find(v39, p36.KeyCode) and v_u_34[v38] then
					if v_u_4:IsKeyDown(Enum.KeyCode.T) then
						v_u_3.Pass:FireServer({
							["Type"] = "IconPass", 
							["Target"] = v_u_34[v38], 
							["TypeOfPass"] = "Lob"
						})
					else
						v_u_3.Pass:FireServer({
							["Type"] = "IconPass", 
							["Target"] = v_u_34[v38]
						})
					end
				end
			end
		end
	end
end)
function UpdateList(_)
	-- upvalues: (ref) v_u_34, (copy) v_u_2
	for v40, v41 in pairs(v_u_34) do
		repeat
			task.wait()
		until v41.Character
		if v41.Character.Team.Value == v_u_2.Team.Value and v41.Character.Court.Value == v_u_2.Court.Value then
			v41.Character:WaitForChild("Pass").Number.Text = tostring(v40)
		end
	end
end
game.Players.PlayerRemoving:Connect(function(p_u_42)
	-- upvalues: (ref) v_u_34
	p_u_42.CharacterRemoving:Connect(function(_)
		-- upvalues: (copy) p_u_42, (ref) v_u_34
		local v43 = p_u_42 ~= game.Players.LocalPlayer and table.find(v_u_34, p_u_42)
		if v43 then
			table.remove(v_u_34, v43)
		end
		UpdateList()
	end)
end)
v_u_3.UpdateIcons.OnClientEvent:Connect(function(p44)
	-- upvalues: (ref) v_u_34, (copy) v_u_2
	if p44.Type == "Add" then
		task.wait(0.1)
		for _, v45 in pairs(game.Players:GetPlayers()) do
			if v45 ~= game.Players.LocalPlayer and v45.Character.Team.Value == game.Players.LocalPlayer.Character.Team.Value and v45.Character and v45.Character:FindFirstChild("Court") and v45.Character.Court.Value == game.Players.LocalPlayer.Character.Court.Value then
				table.insert(v_u_34, v45)
			end
			UpdateList()
		end
		for v46, v47 in pairs(v_u_34) do
			if v47.Character.Team.Value == v_u_2.Team.Value and v47.Character.Court.Value == v_u_2.Court.Value then
				v47.Character:WaitForChild("Pass").Number.Text = tostring(v46)
			end
		end
		return
	elseif p44.Type == "Remove" then
		for _, v48 in pairs(v_u_34) do
			if v48.Character.Team.Value == v_u_2.Team.Value and v48.Character.Court.Value == v_u_2.Court.Value then
				v48.Character:WaitForChild("Pass").Enabled = false
			end
		end
		return
	elseif p44.Type == "Update" then
		for _, v49 in pairs(v_u_34) do
			if v49.Character.Team.Value == v_u_2.Team.Value and v49.Character.Court.Value == v_u_2.Court.Value then
				v49.Character:WaitForChild("Pass").Enabled = p44.Boolean
			end
		end
	elseif p44.Type == "Reset" then
		v_u_34 = {}
		for _, v50 in pairs(v_u_34) do
			if v50.Character.Team.Value == v_u_2.Team.Value and v50.Character.Court.Value == v_u_2.Court.Value then
				v50.Character:WaitForChild("Pass").Enabled = false
			end
			local v51 = v50.Character.Team.Value == v_u_2.Team.Value and v50.Character.Court.Value == v_u_2.Court.Value and table.find(v_u_34, v50)
			if v51 then
				table.remove(v_u_34, v51)
			end
		end
	end
end)
v_u_4.InputBegan:Connect(function(p52, p53)
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	if not p53 then
		if v_u_1.Name == "FarmyRBX" and p52.KeyCode == Enum.KeyCode.P then
			v_u_3.Teleport:FireServer()
		end
	end
end)
workspace.CurrentCamera.CameraSubject = v_u_2:WaitForChild("Head")
task.wait(0.2)
workspace.CurrentCamera.CameraSubject = v_u_2:WaitForChild("Head")
