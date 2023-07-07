-- decompiled by Sentinel (took 2.251808ms)
repeat
	task.wait()
until game:IsLoaded()
local v_u_1 = game.Players.LocalPlayer
local v_u_2 = v_u_1.Character
v_u_2:WaitForChild("Humanoid")
local v3 = game:GetService("UserInputService")
local v_u_4 = game.ReplicatedStorage:FindFirstChild("Remotes")
local v5 = v_u_1.PlayerGui["Mobile Buttons"]
local v_u_6 = false
local v_u_7 = {}
if v3.TouchEnabled then
	v_u_4.CheckForDevice:FireServer("Mobile")
	for _, v8 in pairs(v5:GetChildren()) do
		if v8.ClassName ~= "LocalScript" then
			v8.Visible = true
		end
	end
	local v_u_9 = false
	v5.Shoot.InputBegan:Connect(function(p10)
		-- upvalues: (ref) v_u_9
		if p10.UserInputType == Enum.UserInputType.Touch then
			v_u_9 = true
		end
	end)
	v5.Shoot.InputEnded:Connect(function(p11)
		-- upvalues: (ref) v_u_9
		if p11.UserInputType == Enum.UserInputType.Touch then
			v_u_9 = false
		end
	end)
	local v_u_12 = 0
	v5.Shoot.InputBegan:Connect(function(_, p13)
		-- upvalues: (ref) v_u_12, (ref) v_u_9, (copy) v_u_4
		if not p13 then
			v_u_12 = v_u_12 + 1
			task.delay(0.1, function()
				-- upvalues: (ref) v_u_12, (ref) v_u_9, (ref) v_u_4
				if v_u_12 == 1 and v_u_9 then
					v_u_4.Shoot:FireServer(true, 1)
				elseif v_u_12 == 1 then
					v_u_4.Shoot:FireServer(false, 1)
				else
					local _ = v_u_12 == 2
				end
				v_u_12 = 0
			end)
		end
	end)
	v5.Shoot.InputEnded:Connect(function(_, p14)
		-- upvalues: (copy) v_u_4
		if not p14 then
			v_u_4.Shoot:FireServer(false, 2)
		end
	end)
	v5.Pass.InputBegan:Connect(function(_, _)
		-- upvalues: (copy) v_u_2, (copy) v_u_4
		if v_u_2:FindFirstChild("Ball") then
			v_u_4.Pass:FireServer({
				["Type"] = "Closest"
			})
		end
	end)
	v5.Sprint.InputBegan:Connect(function(_, _)
		-- upvalues: (copy) v_u_4
		v_u_4.Sprint:FireServer({
			["Sprinting"] = true
		})
	end)
	v5.Sprint.InputEnded:Connect(function(_, _)
		-- upvalues: (copy) v_u_4
		v_u_4.Sprint:FireServer({
			["Sprinting"] = false
		})
	end)
	v5.Block.InputBegan:Connect(function()
		-- upvalues: (copy) v_u_2, (copy) v_u_4
		if not v_u_2:FindFirstChild("Ball") then
			v_u_4.Block:FireServer(true, 1)
		end
	end)
	v5.DribbleZ.InputBegan:Connect(function(_, _)
		-- upvalues: (copy) v_u_1, (ref) v_u_7, (ref) v_u_6
		if v_u_1.Character:GetAttribute("Shooting") ~= true then
			print(table.concat(v_u_7))
			task.spawn(function()
				-- upvalues: (ref) v_u_6, (ref) v_u_7
				if not v_u_6 then
					v_u_6 = true
					task.wait(0.195)
					v_u_6 = false
					game.ReplicatedStorage.Remotes.Dribble:FireServer(table.concat(v_u_7))
					v_u_7 = {}
				end
			end)
			v_u_7[#v_u_7 + 1] = "Z"
		end
	end)
	v5.DribbleC.InputBegan:Connect(function(_, _)
		-- upvalues: (copy) v_u_1, (ref) v_u_7, (ref) v_u_6
		if v_u_1.Character:GetAttribute("Shooting") ~= true then
			v_u_7[#v_u_7 + 1] = "C"
			print(table.concat(v_u_7))
			task.spawn(function()
				-- upvalues: (ref) v_u_6, (ref) v_u_7
				if not v_u_6 then
					v_u_6 = true
					task.wait(0.195)
					v_u_6 = false
					game.ReplicatedStorage.Remotes.Dribble:FireServer(table.concat(v_u_7))
					v_u_7 = {}
				end
			end)
		end
	end)
	v5.DribbleX.InputBegan:Connect(function(_, _)
		-- upvalues: (copy) v_u_1, (ref) v_u_7, (ref) v_u_6
		if v_u_1.Character:GetAttribute("Shooting") ~= true then
			v_u_7[#v_u_7 + 1] = "X"
			print(table.concat(v_u_7))
			task.spawn(function()
				-- upvalues: (ref) v_u_6, (ref) v_u_7
				if not v_u_6 then
					v_u_6 = true
					task.wait(0.195)
					v_u_6 = false
					game.ReplicatedStorage.Remotes.Dribble:FireServer(table.concat(v_u_7))
					v_u_7 = {}
				end
			end)
		end
	end)
	v5.Steal.InputBegan:Connect(function(_, p15)
		-- upvalues: (copy) v_u_4
		if not p15 then
			v_u_4.Steal:FireServer(true, 1)
		end
	end)
	v5.Guard.InputBegan:Connect(function(_, p16)
		-- upvalues: (copy) v_u_4
		if not p16 then
			v_u_4.Guard:FireServer(true, 1)
		end
	end)
	v5.Guard.InputEnded:Connect(function(_, p17)
		-- upvalues: (copy) v_u_4
		if not p17 then
			v_u_4.Guard:FireServer(true, 2)
		end
	end)
	v5.Dunk.InputBegan:Connect(function(_, p18)
		-- upvalues: (copy) v_u_4
		if not p18 then
			v_u_4.Dunk:FireServer(true, 1)
		end
	end)
	v5.Dunk.InputEnded:Connect(function(_, p19)
		-- upvalues: (copy) v_u_4
		if not p19 then
			v_u_4.Dunk:FireServer(false, 2)
		end
	end)
else
	v_u_4.CheckForDevice:FireServer("PC")
	for _, v20 in pairs(v5:GetChildren()) do
		if v20.ClassName ~= "LocalScript" then
			v20.Visible = false
		end
	end
end
v_u_1:WaitForChild("PlayerGui"):WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton"):Destroy()
