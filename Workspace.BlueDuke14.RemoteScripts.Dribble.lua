-- decompiled by Sentinel (took 980.042µs)
local v_u_1 = game.Players.LocalPlayer;
(v_u_1.Character or v_u_1.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
local v_u_2 = false
local v_u_3 = {}
local v_u_4 = game:GetService("UserInputService")
v_u_4.InputBegan:Connect(function(p5, p6)
	-- upvalues: (copy) v_u_1, (copy) v_u_4, (ref) v_u_3, (ref) v_u_2
	if not p6 and v_u_1.Character:GetAttribute("Shooting") ~= true then
		if p5.KeyCode == Enum.KeyCode.C or p5.KeyCode == Enum.KeyCode.X or p5.KeyCode == Enum.KeyCode.Z or p5.KeyCode == Enum.KeyCode.V or p5.KeyCode == Enum.KeyCode.DPadLeft or p5.KeyCode == Enum.KeyCode.DPadDown or p5.KeyCode == Enum.KeyCode.DPadRight or p5.KeyCode == Enum.KeyCode.DPadUp then
			v_u_3[#v_u_3 + 1] = p5.KeyCode == Enum.KeyCode.DPadRight and "C" or p5.KeyCode == Enum.KeyCode.DPadLeft and "Z" or p5.KeyCode == Enum.KeyCode.DPadDown and "X" or v_u_4:GetStringForKeyCode(p5.KeyCode)
			if not v_u_2 then
				v_u_2 = true
				task.wait(0.195)
				v_u_2 = false
				game.ReplicatedStorage.Remotes.Dribble:FireServer(table.concat(v_u_3))
				v_u_3 = {}
			end
		end
	end
end)
