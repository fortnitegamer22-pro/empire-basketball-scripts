-- decompiled by Sentinel (took 786.544µs)
repeat
	task.wait()
until game:IsLoaded()
local v_u_1 = script.Parent.Parent
local v_u_2 = v_u_1.HumanoidRootPart
local v_u_3 = v_u_1.Humanoid
game:GetService("RunService").Stepped:Connect(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_2
	if v_u_1:GetAttribute("LookingAtPart") == true then
		return
	elseif v_u_1:GetAttribute("Dribbling") == true then
		task.wait(0.03)
		return
	elseif v_u_3.WalkSpeed ~= 0 then
		v_u_2.BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
		v_u_2.BodyGyro.D = 1
		v_u_2.BodyGyro.P = 1100
		v_u_2.BodyGyro.CFrame = 0 < v_u_3.MoveDirection.Magnitude and CFrame.new(v_u_2.Position, v_u_2.Position + v_u_3.MoveDirection) or v_u_2.CFrame
	end
end)
