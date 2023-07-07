-- decompiled by Sentinel (took 1.64091ms)
local _ = game.Players.LocalPlayer
local v_u_1 = script.Parent
local v_u_2 = v_u_1:WaitForChild("Humanoid")
local v_u_3 = v_u_1:WaitForChild("HumanoidRootPart")
game:GetService("RunService")
local v_u_4 = {}
local v_u_5 = nil
local v_u_6 = {
	["Walking"] = 0.2
}
local v_u_7 = {
	["Idle"] = 0.4
}
local v_u_8 = {}
for _, v9 in script:WaitForChild("MovementAnimations"):GetDescendants() do
	if v9:IsA("Animation") and v9.AnimationId ~= "" then
		v_u_8[v9.Name] = v_u_2:WaitForChild("Animator"):LoadAnimation(v9)
	end
end
function v_u_4.UpdateAnimations(_)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (ref) v_u_5, (copy) v_u_8, (copy) v_u_4
	local v10 = (0 < v_u_2.MoveDirection.Magnitude and 0 < v_u_2.WalkSpeed and true or v_u_1:GetAttribute("Moving") == true) and "Walking" or "Idle"
	if v10 and v10 ~= v_u_5 and v10 ~= "" then
		local v11 = v_u_8[v10]
		v_u_4.StopAnimations()
		v_u_4.PlayAnimation(v11, 1)
		v_u_5 = v11
	end
end
function v_u_4.PlayAnimation(p12, _)
	-- upvalues: (copy) v_u_7
	if not p12.IsPlaying then
		p12:Play(0.3, 0, v_u_7[p12.Name] or 1)
	end
	if p12.WeightTarget ~= 1 then
		p12:AdjustWeight(1, 0.3)
	end
end
function v_u_4.StopAnimations()
	-- upvalues: (copy) v_u_8
	for _, v13 in v_u_8, nil, nil do
		if 0 < v13.WeightTarget then
			v13:AdjustWeight(0, 0.3)
		end
	end
end
function v_u_4.UpdateAnimationSpeed(p14)
	-- upvalues: (ref) v_u_5, (copy) v_u_6, (copy) v_u_3, (copy) v_u_2
	if v_u_5 and v_u_6[v_u_5.Name] and v_u_5.Name == "Walking" then
		local v15 = 0
		local v16 = v15 + (v_u_3.CFrame.LookVector:Dot(v_u_2.MoveDirection) - v15) * p14 * 16
		local v17
		if v16 < 0 then
			v17 = -1
		elseif 0 < v16 then
			task.spawn(function() end)
			v17 = 1
		else
			v17 = 1
		end
		v_u_5:AdjustSpeed(v17)
	end
end
while true do
	repeat
		local v_u_18 = task.wait()
		local v19, v20 = pcall(function()
			-- upvalues: (copy) v_u_4, (copy) v_u_18
			v_u_4.UpdateAnimations(v_u_18)
			v_u_4.UpdateAnimationSpeed(v_u_18)
		end)
	until not v19
	warn("Client Animation Error: " .. v20)
end
