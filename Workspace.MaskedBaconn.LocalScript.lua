-- decompiled by Sentinel (took 683.615µs)
local v1 = game.Players.LocalPlayer
local v_u_2 = v1.Character or v1.CharacterAdded:Wait()
local v_u_3 = game.ReplicatedStorage.Remotes
local v_u_4 = game:GetService("UserInputService")
local function v_u_6(p5, _)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if p5.KeyCode == Enum.KeyCode.ButtonA then
		print("Pressed button A")
		print("Pressed button A")
		if v_u_2 and v_u_2:FindFirstChild("Ball") then
			v_u_3.Pass:FireServer({
				["Type"] = "Closest"
			})
		end
	end
end
if v_u_4 then
	local v7, v8 = pcall(function()
		-- upvalues: (copy) v_u_4, (copy) v_u_6
		v_u_4.InputBegan:Connect(v_u_6)
	end)
	if not v7 then
		warn("Failed to connect to InputBegan event:", v8)
		return
	end
else
	warn("UserInputService not found.")
end
