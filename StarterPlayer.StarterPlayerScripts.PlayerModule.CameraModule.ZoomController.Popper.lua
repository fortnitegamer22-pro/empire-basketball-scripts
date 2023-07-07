-- decompiled by Sentinel (took 5.786418ms)
local v1 = game:GetService("Players")
local v_u_2 = game.Workspace.CurrentCamera
local v_u_3 = math.min
local v_u_4 = math.tan
local v_u_5 = math.rad
local v_u_6 = math.huge
local v_u_7 = Ray.new
local v_u_8 = nil
local v_u_9 = nil
local function v12()
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (ref) v_u_9, (copy) v_u_4, (ref) v_u_8
	local v10 = v_u_2.ViewportSize
	local v11 = v10.X / v10.Y
	v_u_9 = 2 * v_u_4(v_u_5(v_u_2.FieldOfView) / 2)
	v_u_8 = v11 * v_u_9
end
v_u_2:GetPropertyChangedSignal("FieldOfView"):Connect(v12)
v_u_2:GetPropertyChangedSignal("ViewportSize"):Connect(v12)
local v13 = v_u_2.ViewportSize
local v14 = v13.X / v13.Y
v_u_9 = 2 * v_u_4(v_u_5(v_u_2.FieldOfView) / 2)
v_u_8 = v14 * v_u_9
local v_u_15 = v_u_2.NearPlaneZ
v_u_2:GetPropertyChangedSignal("NearPlaneZ"):Connect(function()
	-- upvalues: (ref) v_u_15, (copy) v_u_2
	v_u_15 = v_u_2.NearPlaneZ
end)
local v_u_16 = {}
local v_u_17 = {}
local function v26(p_u_18)
	-- upvalues: (copy) v_u_17, (ref) v_u_16
	p_u_18.CharacterAdded:Connect(function(p19)
		-- upvalues: (ref) v_u_17, (copy) p_u_18, (ref) v_u_16
		v_u_17[p_u_18] = p19
		local v20 = 1
		v_u_16 = {}
		for _, v21 in pairs(v_u_17) do
			v_u_16[v20] = v21
			v20 = v20 + 1
		end
	end)
	p_u_18.CharacterRemoving:Connect(function()
		-- upvalues: (ref) v_u_17, (copy) p_u_18, (ref) v_u_16
		v_u_17[p_u_18] = nil
		local v22 = 1
		v_u_16 = {}
		for _, v23 in pairs(v_u_17) do
			v_u_16[v22] = v23
			v22 = v22 + 1
		end
	end)
	if p_u_18.Character then
		v_u_17[p_u_18] = p_u_18.Character
		local v24 = 1
		v_u_16 = {}
		for _, v25 in pairs(v_u_17) do
			v_u_16[v24] = v25
			v24 = v24 + 1
		end
	end
end
v1.PlayerAdded:Connect(v26)
v1.PlayerRemoving:Connect(function(p27)
	-- upvalues: (copy) v_u_17, (ref) v_u_16
	v_u_17[p27] = nil
	local v28 = 1
	v_u_16 = {}
	for _, v29 in pairs(v_u_17) do
		v_u_16[v28] = v29
		v28 = v28 + 1
	end
end)
for _, v30 in ipairs(v1:GetPlayers()) do
	v26(v30)
end
local v31 = 1
v_u_16 = {}
for _, v32 in pairs(v_u_17) do
	v_u_16[v31] = v32
	v31 = v31 + 1
end
local v_u_33 = nil
local v_u_34 = nil
v_u_2:GetPropertyChangedSignal("CameraSubject"):Connect(function()
	-- upvalues: (copy) v_u_2, (ref) v_u_34
	local v35 = v_u_2.CameraSubject
	if v35:IsA("Humanoid") then
		v_u_34 = v35.RootPart
		return
	elseif v35:IsA("BasePart") then
		v_u_34 = v35
	else
		v_u_34 = nil
	end
end)
local v_u_36 = {
	Vector2.new(0.4, 0), 
	Vector2.new(-0.4, 0), 
	Vector2.new(0, -0.4), 
	Vector2.new(0, 0.4), 
	Vector2.new(0, 0.2)
}
local function v_u_46(p37, p38)
	-- upvalues: (ref) v_u_16, (copy) v_u_7
	local v39 = #v_u_16
	while true do
		local v40, v41 = workspace:FindPartOnRayWithIgnoreList(v_u_7(p37, p38), v_u_16, false, true)
		if v40 then
			if v40.CanCollide then
				local v42 = v_u_16
				for v43 = #v42, v39 + 1, -1 do
					v42[v43] = nil
				end
				return v41, true
			end
			v_u_16[#v_u_16 + 1] = v40
		end
		if not v40 then
			local v44 = v_u_16
			for v45 = #v44, v39 + 1, -1 do
				v44[v45] = nil
			end
			return p37 + p38, false
		end
	end
end
local function v_u_68(p47, p48, p49, p50)
	-- upvalues: (ref) v_u_16, (ref) v_u_15, (copy) v_u_6, (copy) v_u_7, (ref) v_u_33
	debug.profilebegin("queryPoint")
	local v51 = #v_u_16
	local v52 = p49 + v_u_15
	local v53 = p47 + p48 * v52
	local v54 = v_u_6
	local v55 = v54
	local v56 = p47
	local v57 = v54
	v54 = v55
	v57 = v55
	v55 = v54
	local v58 = 0
	while true do
		if true then
			local v59, v60 = workspace:FindPartOnRayWithIgnoreList(v_u_7(v56, v53 - v56), v_u_16, false, true)
			v58 = v58 + 1
			local v61
			if v59 then
				local v62 = 64 <= v58
				local v63 = 1 - (1 - v59.Transparency) * (1 - v59.LocalTransparencyModifier) < 0.25 and v59.CanCollide
				if v63 then
					if v_u_33 == (v59:GetRootPart() or v59) then
						v63 = false
					else
						v63 = not v59:IsA("TrussPart")
					end
				end
				if v63 or v62 then
					local v64 = { v59 }
					v61 = (v60 - p47).Magnitude
					if workspace:FindPartOnRayWithWhitelist(v_u_7(v53, v60 - v53), v64, true) then
						if v62 then
							v55 = v61
							v61 = v54
						else
							local v65
							if p50 then
								v65 = workspace:FindPartOnRayWithWhitelist(v_u_7(p50, v53 - p50), v64, true) or workspace:FindPartOnRayWithWhitelist(v_u_7(v53, p50 - v53), v64, true)
							else
								v65 = false
							end
							if v65 then
								v55 = v61
								v61 = v54
							elseif v52 >= v54 then
								v61 = v54
							end
						end
					else
						v55 = v61
						v61 = v54
					end
				else
					v61 = v54
				end
				v_u_16[#v_u_16 + 1] = v59
				v56 = v60 - p48 * 0.001
			else
				v61 = v54
			end
		end
		if v55 < v_u_6 or not v59 then
			local v66 = v_u_16
			for v67 = #v66, v51 + 1, -1 do
				v66[v67] = nil
			end
			debug.profileend()
			return v61 - v_u_15, v55 - v_u_15
		end
		v54 = v61
	end
end
local function v_u_84(p69, p70)
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (ref) v_u_8, (ref) v_u_9, (ref) v_u_15, (copy) v_u_68
	debug.profilebegin("queryViewport")
	local v71 = p69.p
	local v72 = p69.rightVector
	local v73 = p69.upVector
	local v74 = -p69.lookVector
	local v75 = v_u_2.ViewportSize
	local v76 = v_u_6
	local v77 = v76
	local v78 = v76
	v76 = v77
	v78 = v77
	for v79 = 0, 1 do
		local v80 = v72 * (v79 - 0.5) * v_u_8
		for v81 = 0, 1 do
			local v82, v83 = v_u_68(v71 + v_u_15 * (v80 + v73 * (v81 - 0.5) * v_u_9), v74, p70, v_u_2:ViewportPointToRay(v75.x * v79, v75.y * v81).Origin)
			if v83 >= v77 then
				v83 = v77
			end
			if v82 < v76 then
				v76 = v82
				v77 = v83
			else
				v77 = v83
			end
		end
	end
	debug.profileend()
	return v76, v77
end
local function v_u_96(p85, p86, p87)
	-- upvalues: (copy) v_u_46, (copy) v_u_3, (copy) v_u_68, (copy) v_u_36, (copy) v_u_6
	debug.profilebegin("testPromotion")
	local v88 = p85.p
	local v89 = p85.rightVector
	local v90 = p85.upVector
	local v91 = -p85.lookVector
	debug.profilebegin("extrapolate")
	for v92 = 0, v_u_3(1.25, p87.rotVelocity.magnitude + (v_u_46(v88, p87.posVelocity * 1.25) - v88).Magnitude / p87.posVelocity.magnitude), 0.0625 do
		local v93 = p87.extrapolate(v92)
		if p86 <= v_u_68(v93.p, -v93.lookVector, p86) then
			return false
		end
	end
	debug.profileend()
	debug.profilebegin("testOffsets")
	for _, v94 in ipairs(v_u_36) do
		local v95 = v_u_46(v88, v89 * v94.x + v90 * v94.y)
		if v_u_68(v95, (v88 + v91 * p86 - v95).Unit, p86) == v_u_6 then
			return false
		end
	end
	debug.profileend()
	debug.profileend()
	return true
end
return function(p97, p98, p99)
	-- upvalues: (ref) v_u_33, (ref) v_u_34, (copy) v_u_84, (copy) v_u_96
	debug.profilebegin("popper")
	v_u_33 = v_u_34 and v_u_34:GetRootPart() or v_u_34
	local v100, v101 = v_u_84(p97, p98)
	if v101 >= p98 then
		v101 = p98
	end
	if v100 < v101 then
		if not v_u_96(p97, p98, p99) then
			v100 = v101
		end
	else
		v100 = v101
	end
	v_u_33 = nil
	debug.profileend()
	return v100
end
