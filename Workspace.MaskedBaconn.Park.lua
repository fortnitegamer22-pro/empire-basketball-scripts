-- decompiled by Sentinel (took 3.625863ms)
local v_u_1 = game.Players.LocalPlayer
local v_u_2 = v_u_1.Character or v_u_1.CharacterAdded:Wait()
local v_u_3 = v_u_2:WaitForChild("HumanoidRootPart")
local v_u_4 = v_u_2.Humanoid
local v_u_5 = game.ReplicatedStorage.Remotes.Park
local v_u_6 = game:GetService("RunService")
local v_u_7 = game:GetService("TweenService")
game:GetService("ReplicatedStorage"):WaitForChild("Netting")
v_u_5.MoveCharacter.OnClientEvent:Connect(function(p8, p_u_9, p10)
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3
	local v_u_11 = p8.Position
	local v_u_12 = p10 or 3.35
	v_u_2:SetAttribute("Moving", true)
	local v_u_13 = v_u_6.RenderStepped:Connect(function(_)
		-- upvalues: (ref) v_u_4, (copy) v_u_11
		v_u_4:MoveTo(v_u_11)
	end)
	task.spawn(function()
		-- upvalues: (copy) p_u_9, (ref) v_u_13
		task.wait(p_u_9)
		v_u_13:Disconnect()
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_11, (ref) v_u_12, (ref) v_u_2
		repeat
			task.wait()
		until (v_u_3.Position - v_u_11).magnitude < v_u_12
		v_u_2:SetAttribute("Moving", false)
	end)
	task.delay(p_u_9 * 2.5, function()
		-- upvalues: (ref) v_u_2
		if v_u_2:GetAttribute("Moving") == true then
			v_u_2:SetAttribute("Moving", false)
		end
	end)
end)
v_u_5.SetPartProperty.OnClientEvent:Connect(function(p14, p15, p16)
	for _, v17 in p14:GetChildren() do
		v17[p15] = p16
	end
end)
v_u_5.SetCamera.OnClientEvent:Connect(function(p18, p19, p20, p21, p22, p_u_23)
	-- upvalues: (copy) v_u_7, (copy) v_u_1
	local v24 = p22 or 0
	local v25 = workspace.CurrentCamera
	if p18 then
		local v26 = p18.CFrame
		if v26 then
			local v27 = v_u_7:Create(v25, TweenInfo.new(p20 or 1.25, p21 or Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), {
				["CFrame"] = v26
			})
			v25.CameraType = Enum.CameraType.Scriptable
			print("Target CFrame: ", v26)
			v27:Play()
			if p18.Name == "Team1" then
				task.wait(1)
				local v_u_28 = v_u_7:Create(v_u_1.PlayerGui.Intro.TextLabel, TweenInfo.new(0.5), {
					["Position"] = UDim2.fromScale(0.39, 0.05)
				})
				v_u_28:Play()
				v_u_1.PlayerGui.Intro.TextLabel.Text = "TEAM 2"
				task.spawn(function()
					-- upvalues: (ref) v_u_28, (copy) p_u_23, (ref) v_u_7, (ref) v_u_1
					v_u_28.Completed:Wait()
					if p_u_23 then
						task.wait(1)
					else
						task.wait(2)
					end
					v_u_28 = v_u_7:Create(v_u_1.PlayerGui.Intro.TextLabel, TweenInfo.new(0.6), {
						["Position"] = UDim2.fromScale(0.39, -0.23)
					})
					v_u_28:Play()
				end)
			elseif p18.Name == "Team2" then
				task.wait(1)
				local v_u_29 = v_u_7:Create(v_u_1.PlayerGui.Intro.TextLabel, TweenInfo.new(0.5), {
					["Position"] = UDim2.fromScale(0.39, 0.05)
				})
				v_u_29:Play()
				v_u_1.PlayerGui.Intro.TextLabel.Text = "TEAM 1"
				task.spawn(function()
					-- upvalues: (ref) v_u_29, (ref) v_u_7, (ref) v_u_1
					v_u_29.Completed:Wait()
					task.wait(1.7)
					v_u_29 = v_u_7:Create(v_u_1.PlayerGui.Intro.TextLabel, TweenInfo.new(0.6), {
						["Position"] = UDim2.fromScale(0.39, -0.23)
					})
					v_u_29:Play()
				end)
			end
			v27.Completed:Wait()
			task.wait(1)
			v_u_1.PlayerGui.MenuUI.BadgesButton.Visible = false
			v_u_1.PlayerGui.MenuUI.Badges.Visible = false
			v_u_1.PlayerGui.MenuUI.Frame.Visible = false
			v_u_1.PlayerGui.Build.Frame.Visible = false
			if p19 ~= false then
				v_u_1.PlayerGui.park.Scoreboard.Enabled = true
			end
			if p18.Name == "Team1" then
				task.wait(v24)
				p18.Gui.TextLabel.Visible = false
				p18.Parent.Team2.Gui.TextLabel.Visible = false
				v25.CameraType = Enum.CameraType.Custom
			end
		else
			warn("Invalid target or camera CFrame")
		end
	else
		warn("Invalid target part")
		return
	end
end)
v_u_5.UI.OnClientEvent:Connect(function(p30, p31, p32)
	p30[p31] = p32
end)
v_u_1.PlayerGui.PlayerCard.Card:FindFirstChild("Name").Text = v_u_2.Name
function getClosestPart(p33)
	if p33 then
		p33 = p33.Character
	end
	if p33 then
		p33 = p33:FindFirstChild("HumanoidRootPart")
	end
	local v34 = math.huge
	local v35 = nil
	for _, v36 in pairs(workspace.Courts:GetDescendants()) do
		if v36.Name == "CSpot" or v36.Name == "PGSpot" then
			local v37 = v36.Parent.Parent.Parent
			local v38 = (p33.Position - v36.Position).magnitude
			if 10 >= v38 then
				if v38 < v34 then
					v34 = math.clamp(v38, 9, 10)
					v35 = v37
				end
			end
		end
	end
	if v35 then
		return v35
	end
end
task.spawn(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	game:GetService("UserInputService").TouchTap:Connect(function(p39, p40)
		-- upvalues: (ref) v_u_2, (ref) v_u_5
		if not p40 then
			if p39.KeyCode == Enum.KeyCode.ButtonA then
				print("pressed a wow")
				if v_u_2:FindFirstChild("Ball") then
					v_u_5.Pass:FireServer({
						["Type"] = "Closest"
					})
				end
			end
		end
	end)
end)
task.spawn(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	game:GetService("UserInputService").InputBegan:Connect(function(p41, p42)
		-- upvalues: (ref) v_u_2, (ref) v_u_5
		if not p42 then
			if p41.KeyCode == Enum.KeyCode.ButtonA then
				print("pressed a wow")
				if v_u_2:FindFirstChild("Ball") then
					v_u_5.Pass:FireServer({
						["Type"] = "Closest"
					})
				end
			end
		end
	end)
end)
task.spawn(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	while v_u_2:FindFirstChild("HumanoidRootPart") and v_u_1:FindFirstChild("PlayerGui") do
		task.wait(1)
		if getClosestPart(v_u_1) and v_u_2:GetAttribute("InsideParkGame") ~= true or v_u_1:GetAttribute("AbleToSeeCourt") == true then
			v_u_1.PlayerGui.park.Frame.Visible = true
		else
			v_u_1.PlayerGui.park.Frame.Visible = false
		end
	end
end)
game:GetService("UserInputService").InputBegan:Connect(function(p43, p44)
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	if not p44 then
		if p43.KeyCode == Enum.KeyCode.Space or p43.KeyCode == Enum.KeyCode.ButtonY or v_u_4.MoveDirection.Magnitude ~= 0 then
			if v_u_4.MoveDirection.Magnitude ~= 0 then
				task.wait(1)
				if v_u_4.MoveDirection.Magnitude == 0 then
					return
				end
			end
			if v_u_4 and v_u_4:GetState() == Enum.HumanoidStateType.Seated then
				v_u_4.Sit = false
				v_u_4.WalkSpeed = 16
				task.wait(0.02)
				v_u_3.CFrame = v_u_3.CFrame + v_u_3.CFrame.LookVector * 4
			end
		end
	end
end)
v_u_4.StateChanged:Connect(function(_, p45)
	-- upvalues: (copy) v_u_4
	if p45 == Enum.HumanoidStateType.Seated then
		v_u_4.WalkSpeed = 0
	end
end)
task.spawn(function()
	local v_u_46 = game.Players.LocalPlayer
	local v_u_47 = v_u_46.Character or v_u_46.CharacterAdded:Wait()
	local v_u_48 = v_u_47.HumanoidRootPart.Position
	local v_u_49 = tick()
	local function v54()
		-- upvalues: (copy) v_u_47, (ref) v_u_49, (copy) v_u_46, (ref) v_u_48
		local v50 = v_u_47:WaitForChild("Humanoid")
		local v51 = v50.RootPart
		local v52 = v51.Velocity
		local _ = v52.magnitude
		local v53 = tick()
		if 55 < v52.magnitude * (v53 - v_u_49) or 17 < v50.WalkSpeed then
			if 17 < v50.WalkSpeed then
				v_u_46:Kick("")
			end
			v51.CFrame = CFrame.new(v_u_48)
		else
			v_u_48 = v51.Position
			v_u_49 = v53
		end
	end
	while true do
		task.wait(0.935)
		v54()
	end
end)
