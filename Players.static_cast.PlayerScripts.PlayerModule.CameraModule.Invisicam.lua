-- decompiled by Sentinel (took 8.666686ms)
local v_u_1 = game:GetService("Players")
local v_u_2 = Vector3.new(0, 0, 0)
local v_u_3 = {
	["LIMBS"] = 2, 
	["MOVEMENT"] = 3, 
	["CORNERS"] = 4, 
	["CIRCLE1"] = 5, 
	["CIRCLE2"] = 6, 
	["LIMBMOVE"] = 7, 
	["SMART_CIRCLE"] = 8, 
	["CHAR_OUTLINE"] = 9
}
local v_u_4 = {
	["Head"] = true, 
	["Left Arm"] = true, 
	["Right Arm"] = true, 
	["Left Leg"] = true, 
	["Right Leg"] = true, 
	["LeftLowerArm"] = true, 
	["RightLowerArm"] = true, 
	["LeftUpperLeg"] = true, 
	["RightUpperLeg"] = true
}
local v_u_5 = {
	Vector3.new(1, 1, -1), 
	Vector3.new(1, -1, -1), 
	Vector3.new(-1, -1, -1), 
	(Vector3.new(-1, 1, -1))
}
local v_u_6 = 2 * math.pi / 24
local function v_u_12(p7, ...)
	local v8 = {}
	local v9 = ""
	for _, v10 in pairs({ ... }) do
		v8[v10] = true
		v9 = v9 .. (v9 == "" and "" or " or ") .. v10
	end
	local v11 = type(p7)
	assert(v8[v11], v9 .. " type expected, got: " .. v11)
end
local function v_u_40(p13, p14, p15, p16)
	-- upvalues: (copy) v_u_2
	local v17 = p14:Cross(p16)
	local v18 = p15.X - p13.X
	local v19 = p15.Y - p13.Y
	local v20 = p15.Z - p13.Z
	local v21 = p14.Y
	local v22 = -p16.Y
	local v23 = v17.Y
	local v24 = p14.Z
	local v25 = -p16.Z
	local v26 = v17.Z
	local v27 = p14.X * (v22 * v26 - v23 * v25) - -p16.X * (v21 * v26 - v23 * v24) + v17.X * (v21 * v25 - v22 * v24)
	if v27 == 0 then
		return v_u_2
	else
		local v28 = -p16.Y
		local v29 = v17.Y
		local v30 = -p16.Z
		local v31 = v17.Z
		local v32 = (v18 * (v28 * v31 - v29 * v30) - -p16.X * (v19 * v31 - v29 * v20) + v17.X * (v19 * v30 - v28 * v20)) / v27
		local v33 = p14.Y
		local v34 = v17.Y
		local v35 = p14.Z
		local v36 = v17.Z
		local v37 = p13 + v32 * p14
		local v38 = p15 + (p14.X * (v19 * v36 - v34 * v20) - v18 * (v33 * v36 - v34 * v35) + v17.X * (v33 * v20 - v19 * v35)) / v27 * p16
		local v39 = v37 + 0.5 * (v38 - v37)
		if (v38 - v37).Magnitude < 0.25 then
			return v39
		else
			return v_u_2
		end
	end
end
local v_u_41 = require(script.Parent:WaitForChild("BaseOcclusion"))
local v_u_42 = setmetatable({}, v_u_41)
v_u_42.__index = v_u_42
function v_u_42.new()
	-- upvalues: (copy) v_u_41, (copy) v_u_42, (copy) v_u_3
	local v43 = setmetatable(v_u_41.new(), v_u_42)
	v43.char = nil
	v43.humanoidRootPart = nil
	v43.torsoPart = nil
	v43.headPart = nil
	v43.childAddedConn = nil
	v43.childRemovedConn = nil
	v43.behaviors = {}
	v43.behaviors[v_u_3.LIMBS] = v43.LimbBehavior
	v43.behaviors[v_u_3.MOVEMENT] = v43.MoveBehavior
	v43.behaviors[v_u_3.CORNERS] = v43.CornerBehavior
	v43.behaviors[v_u_3.CIRCLE1] = v43.CircleBehavior
	v43.behaviors[v_u_3.CIRCLE2] = v43.CircleBehavior
	v43.behaviors[v_u_3.LIMBMOVE] = v43.LimbMoveBehavior
	v43.behaviors[v_u_3.SMART_CIRCLE] = v43.SmartCircleBehavior
	v43.behaviors[v_u_3.CHAR_OUTLINE] = v43.CharacterOutlineBehavior
	v43.mode = v_u_3.SMART_CIRCLE
	v43.behaviorFunction = v43.SmartCircleBehavior
	v43.savedHits = {}
	v43.trackedLimbs = {}
	v43.camera = game.Workspace.CurrentCamera
	v43.enabled = false
	return v43
end
function v_u_42.Enable(p44, p45)
	p44.enabled = p45
	if not p45 then
		p44:Cleanup()
	end
end
function v_u_42.GetOcclusionMode(_)
	return Enum.DevCameraOcclusionMode.Invisicam
end
function v_u_42.LimbBehavior(p46, p47)
	for v48, _ in pairs(p46.trackedLimbs) do
		p47[#p47 + 1] = v48.Position
	end
end
function v_u_42.MoveBehavior(p49, p50)
	for v51 = 1, 3 do
		local v52 = p49.humanoidRootPart.Velocity
		p50[#p50 + 1] = p49.humanoidRootPart.Position + (v51 - 1) * p49.humanoidRootPart.CFrame.lookVector * Vector3.new(v52.X, 0, v52.Z).Magnitude / 2
	end
end
function v_u_42.CornerBehavior(p53, p54)
	-- upvalues: (copy) v_u_5
	local v55 = p53.humanoidRootPart.CFrame
	local v56 = v55.Position
	local v57 = v55 - v56
	local v58 = p53.char:GetExtentsSize() / 2
	p54[#p54 + 1] = v56
	for v59 = 1, #v_u_5 do
		p54[#p54 + 1] = v56 + v57 * v58 * v_u_5[v59]
	end
end
function v_u_42.CircleBehavior(p60, p61)
	-- upvalues: (copy) v_u_3
	local v62
	if p60.mode == v_u_3.CIRCLE1 then
		v62 = p60.humanoidRootPart.CFrame
	else
		local v63 = p60.camera.CoordinateFrame
		v62 = v63 - v63.Position + p60.humanoidRootPart.Position
	end
	p61[#p61 + 1] = v62.Position
	for v64 = 0, 9 do
		local v65 = 2 * math.pi / 10 * v64
		p61[#p61 + 1] = v62 * 3 * Vector3.new(math.cos(v65), math.sin(v65), 0)
	end
end
function v_u_42.LimbMoveBehavior(p66, p67)
	p66:LimbBehavior(p67)
	p66:MoveBehavior(p67)
end
function v_u_42.CharacterOutlineBehavior(p68, p69)
	-- upvalues: (copy) v_u_2
	local v70 = p68.torsoPart.CFrame.upVector.unit
	local v71 = p68.torsoPart.CFrame.rightVector.unit
	p69[#p69 + 1] = p68.torsoPart.CFrame.p
	p69[#p69 + 1] = p68.torsoPart.CFrame.p + v70
	p69[#p69 + 1] = p68.torsoPart.CFrame.p - v70
	p69[#p69 + 1] = p68.torsoPart.CFrame.p + v71
	p69[#p69 + 1] = p68.torsoPart.CFrame.p - v71
	if p68.headPart then
		p69[#p69 + 1] = p68.headPart.CFrame.p
	end
	local v72 = CFrame.new(v_u_2, (Vector3.new(p68.camera.CoordinateFrame.lookVector.X, 0, p68.camera.CoordinateFrame.lookVector.Z)))
	local v73 = p68.torsoPart and p68.torsoPart.Position or p68.humanoidRootPart.Position
	local v74 = { p68.torsoPart }
	if p68.headPart then
		v74[#v74 + 1] = p68.headPart
	end
	for v75 = 1, 24 do
		local v76 = 2 * math.pi * v75 / 24
		local v77 = v72 * 3 * Vector3.new(math.cos(v76), math.sin(v76), 0)
		local v78 = Vector3.new(v77.X, math.max(v77.Y, -2.25), v77.Z)
		local v79, v80 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(v73 + v78, -3 * v78), v74, false)
		if v79 then
			p69[#p69 + 1] = v80 + 0.2 * (v73 - v80).unit
		end
	end
end
function v_u_42.SmartCircleBehavior(p81, p82)
	-- upvalues: (copy) v_u_6, (copy) v_u_40
	local v83 = p81.torsoPart.CFrame.upVector.unit
	local v84 = p81.torsoPart.CFrame.rightVector.unit
	p82[#p82 + 1] = p81.torsoPart.CFrame.p
	p82[#p82 + 1] = p81.torsoPart.CFrame.p + v83
	p82[#p82 + 1] = p81.torsoPart.CFrame.p - v83
	p82[#p82 + 1] = p81.torsoPart.CFrame.p + v84
	p82[#p82 + 1] = p81.torsoPart.CFrame.p - v84
	if p81.headPart then
		p82[#p82 + 1] = p81.headPart.CFrame.p
	end
	local v85 = p81.camera.CFrame - p81.camera.CFrame.p
	local v86 = Vector3.new(0, 0.5, 0) + (p81.torsoPart and p81.torsoPart.Position or p81.humanoidRootPart.Position)
	for v87 = 1, 24 do
		local v88 = v_u_6 * v87 - 0.5 * math.pi
		local v89 = v86 + v85 * 2.5 * Vector3.new(math.cos(v88), math.sin(v88), 0)
		local v90 = v89 - p81.camera.CFrame.p
		local v91, v92, v93 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v86, v89 - v86), { p81.char }, false, false)
		if v91 then
			local v94 = v92 + 0.1 * v93.unit
			local v95 = v94 - v86
			local v96 = v95:Cross(v90).unit:Cross(v93).unit
			if v95.unit:Dot(-v96) < v95.unit:Dot((v94 - p81.camera.CFrame.p).unit) then
				v89 = v_u_40(v94, v96, v89, v90)
				if 0 < v89.Magnitude then
					local v97, v98, v99 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v94, v89 - v94), { p81.char }, false, false)
					if v97 then
						v89 = v98 + 0.1 * v99.unit
					end
				else
					v89 = v94
				end
			else
				v89 = v94
			end
			local v100, v101, _ = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v86, v89 - v86), { p81.char }, false, false)
			if v100 then
				v89 = v101 - 0.1 * (v89 - v86).unit
			end
		end
		p82[#p82 + 1] = v89
	end
end
function v_u_42.CheckTorsoReference(p102)
	if p102.char then
		p102.torsoPart = p102.char:FindFirstChild("Torso")
		if not p102.torsoPart then
			p102.torsoPart = p102.char:FindFirstChild("UpperTorso")
			if not p102.torsoPart then
				p102.torsoPart = p102.char:FindFirstChild("HumanoidRootPart")
			end
		end
		p102.headPart = p102.char:FindFirstChild("Head")
	end
end
function v_u_42.CharacterAdded(p_u_103, p104, p105)
	-- upvalues: (copy) v_u_1, (copy) v_u_4
	if p105 == v_u_1.LocalPlayer then
		if p_u_103.childAddedConn then
			p_u_103.childAddedConn:Disconnect()
			p_u_103.childAddedConn = nil
		end
		if p_u_103.childRemovedConn then
			p_u_103.childRemovedConn:Disconnect()
			p_u_103.childRemovedConn = nil
		end
		p_u_103.char = p104
		p_u_103.trackedLimbs = {}
		p_u_103.childAddedConn = p104.ChildAdded:Connect(function(p106)
			-- upvalues: (ref) v_u_4, (copy) p_u_103
			if p106:IsA("BasePart") then
				if v_u_4[p106.Name] then
					p_u_103.trackedLimbs[p106] = true
				end
				if p106.Name == "Torso" or p106.Name == "UpperTorso" then
					p_u_103.torsoPart = p106
				end
				if p106.Name == "Head" then
					p_u_103.headPart = p106
				end
			end
		end)
		p_u_103.childRemovedConn = p104.ChildRemoved:Connect(function(p107)
			-- upvalues: (copy) p_u_103
			p_u_103.trackedLimbs[p107] = nil
			p_u_103:CheckTorsoReference()
		end)
		for _, v108 in pairs(p_u_103.char:GetChildren()) do
			if v108:IsA("BasePart") then
				if v_u_4[v108.Name] then
					p_u_103.trackedLimbs[v108] = true
				end
				if v108.Name == "Torso" or v108.Name == "UpperTorso" then
					p_u_103.torsoPart = v108
				end
				if v108.Name == "Head" then
					p_u_103.headPart = v108
				end
			end
		end
	end
end
function v_u_42.SetMode(p109, p110)
	-- upvalues: (copy) v_u_12, (copy) v_u_3
	v_u_12(p110, "number")
	for _, v111 in pairs(v_u_3) do
		if v111 == p110 then
			p109.mode = p110
			p109.behaviorFunction = p109.behaviors[p109.mode]
			return
		end
	end
	error("Invalid mode number")
end
function v_u_42.GetObscuredParts(p112)
	return p112.savedHits
end
function v_u_42.Cleanup(p113)
	for v114, v115 in pairs(p113.savedHits) do
		v114.LocalTransparencyModifier = v115
	end
end
function v_u_42.Update(p_u_116, _, p117, p118)
	if not (p_u_116.enabled and p_u_116.char) then
		return p117, p118
	end
	p_u_116.camera = game.Workspace.CurrentCamera
	if not p_u_116.humanoidRootPart then
		local v119 = p_u_116.char:FindFirstChildOfClass("Humanoid")
		if v119 and v119.RootPart then
			p_u_116.humanoidRootPart = v119.RootPart
		else
			p_u_116.humanoidRootPart = p_u_116.char:FindFirstChild("HumanoidRootPart")
			if not p_u_116.humanoidRootPart then
				return p117, p118
			end
		end
		local v_u_120 = nil
		v_u_120 = p_u_116.humanoidRootPart.AncestryChanged:Connect(function(p121, p122)
			-- upvalues: (copy) p_u_116, (ref) v_u_120
			if p121 == p_u_116.humanoidRootPart and not p122 then
				p_u_116.humanoidRootPart = nil
				if v_u_120 and v_u_120.Connected then
					v_u_120:Disconnect()
					v_u_120 = nil
				end
			end
		end)
	end
	if not p_u_116.torsoPart then
		p_u_116:CheckTorsoReference()
		if not p_u_116.torsoPart then
			return p117, p118
		end
	end
	local v123 = {}
	p_u_116.behaviorFunction(p_u_116, v123)
	local v124 = {}
	local v125 = { p_u_116.char }
	local v126 = {}
	local v127 = 0.75
	local v128 = 0.75
	local v129 = p_u_116.camera:GetPartsObscuringTarget({ p_u_116.headPart and p_u_116.headPart.CFrame.p or v123[1], p_u_116.torsoPart and p_u_116.torsoPart.CFrame.p or v123[2] }, v125)
	local v130 = 0
	for v131 = 1, #v129 do
		local v132 = v129[v131]
		v130 = v130 + 1
		v126[v132] = true
		for _, v133 in pairs(v132:GetChildren()) do
			if v133:IsA("Decal") or v133:IsA("Texture") then
				v130 = v130 + 1
				break
			end
		end
	end
	if 0 < v130 then
		v127 = math.pow(0.375 + 0.375 / v130, 1 / v130)
		v128 = math.pow(0.25 + 0.25 / v130, 1 / v130)
	end
	local v134 = p_u_116.camera:GetPartsObscuringTarget(v123, v125)
	local v135 = {}
	for v136 = 1, #v134 do
		local v137 = v134[v136]
		local v138
		if v126[v137] then
			v138 = v127 or v128
		else
			v138 = v128
		end
		v135[v137] = v138
		if v137.Transparency < v135[v137] then
			v124[v137] = true
			if not p_u_116.savedHits[v137] then
				p_u_116.savedHits[v137] = v137.LocalTransparencyModifier
			end
		end
		for _, v139 in pairs(v137:GetChildren()) do
			if (v139:IsA("Decal") or v139:IsA("Texture")) and v139.Transparency < v135[v137] then
				v135[v139] = v135[v137]
				v124[v139] = true
				if not p_u_116.savedHits[v139] then
					p_u_116.savedHits[v139] = v139.LocalTransparencyModifier
				end
			end
		end
	end
	for v140, v141 in pairs(p_u_116.savedHits) do
		if v124[v140] then
			v140.LocalTransparencyModifier = v140.Transparency < 1 and (v135[v140] - v140.Transparency) / (1 - v140.Transparency) or 0
		else
			v140.LocalTransparencyModifier = v141
			p_u_116.savedHits[v140] = nil
		end
	end
	return p117, p118
end
return v_u_42
