-- decompiled by Sentinel (took 1.052803ms)
repeat
	task.wait()
until game:IsLoaded()
repeat
	task.wait()
until game:IsLoaded()
local v_u_1 = game:GetService("RunService")
local v_u_2 = game.ReplicatedStorage.Remotes
local v_u_3 = game.Players.LocalPlayer;
(v_u_3.Character or v_u_3.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
game:GetService("UserInputService")
game:GetService("TweenService")
script.Parent.TextButton.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_2
	print("Hi")
	v_u_2.JoinCourt:FireServer(true, 1)
end)
v_u_2.MoveCharacter.OnClientEvent:Connect(function(p_u_4, p_u_5)
	-- upvalues: (copy) v_u_3, (copy) v_u_1
	local v6 = v_u_3.Character
	local _ = v6.HumanoidRootPart
	local v_u_7 = v6.Humanoid
	local v_u_8 = v_u_1.RenderStepped:Connect(function(_)
		-- upvalues: (copy) v_u_7, (copy) p_u_4
		v_u_7:MoveTo(p_u_4)
	end)
	task.spawn(function()
		-- upvalues: (copy) v_u_8, (copy) p_u_5
		task.wait(2.35)
		v_u_8:Disconnect()
		if p_u_5.ClassName == "Folder" then
			for _, v9 in pairs(p_u_5.Barriers:GetChildren()) do
				v9.CanCollide = true
			end
		end
	end)
	if p_u_5.ClassName == "Folder" then
		for _, v10 in pairs(p_u_5.Barriers:GetChildren()) do
			v10.CanCollide = false
		end
	end
end)
