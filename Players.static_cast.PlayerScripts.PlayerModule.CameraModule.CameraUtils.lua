-- decompiled by Sentinel (took 4.385098ms)
local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = UserSettings():GetService("UserGameSettings")
local v_u_4 = {}
local v_u_5 = {}
v_u_5.__index = v_u_5
function v_u_5.new(p6, p7)
	-- upvalues: (copy) v_u_5
	return setmetatable({
		["freq"] = p6, 
		["goal"] = p7, 
		["pos"] = p7, 
		["vel"] = 0
	}, v_u_5)
end
function v_u_5.step(p8, p9)
	local v10 = p8.freq * 2 * math.pi
	local v11 = p8.goal
	local v12 = p8.vel
	local v13 = p8.pos - v11
	local v14 = math.exp(-v10 * p9)
	local v15 = (v13 * (1 + v10 * p9) + v12 * p9) * v14 + v11
	p8.pos = v15
	p8.vel = (v12 * (1 - v10 * p9) - v13 * v10 * v10 * p9) * v14
	return v15
end
v_u_4.Spring = v_u_5
function v_u_4.map(p16, p17, p18, p19, p20)
	return (p16 - p17) * (p20 - p19) / (p18 - p17) + p19
end
function v_u_4.mapClamp(p21, p22, p23, p24, p25)
	return math.clamp((p21 - p22) * (p25 - p24) / (p23 - p22) + p24, math.min(p24, p25), (math.max(p24, p25)))
end
function v_u_4.getLooseBoundingSphere(p26)
	local v27 = table.create(#p26)
	for v28, v29 in pairs(p26) do
		v27[v28] = v29.Position
	end
	local v30 = v27[1]
	local v31 = v30
	local v32 = 0
	for _, v33 in ipairs(v27) do
		local v34 = (v33 - v30).Magnitude
		if v32 < v34 then
			v31 = v33
			v32 = v34
		end
	end
	local v35 = v31
	local v36 = 0
	for _, v37 in ipairs(v27) do
		local v38 = (v37 - v31).Magnitude
		if v36 < v38 then
			v35 = v37
			v36 = v38
		end
	end
	local v39 = (v31 + v35) * 0.5
	local v40 = (v31 - v35).Magnitude * 0.5
	for _, v41 in ipairs(v27) do
		local v42 = (v41 - v39).Magnitude
		if v40 < v42 then
			v39 = v39 + (v42 - v40) * 0.5 * (v41 - v39).Unit
			v40 = (v42 + v40) * 0.5
		end
	end
	return v39, v40
end
function v_u_4.sanitizeAngle(p43)
	return (p43 + math.pi) % 2 * math.pi - math.pi
end
function v_u_4.Round(p44, p45)
	local v46 = 10 ^ p45
	return math.floor(p44 * v46 + 0.5) / v46
end
function v_u_4.IsFinite(p47)
	local v48
	if p47 == p47 then
		if p47 == math.huge then
			v48 = false
		else
			v48 = p47 ~= -math.huge
		end
	else
		v48 = false
	end
	return v48
end
function v_u_4.IsFiniteVector3(p49)
	-- upvalues: (copy) v_u_4
	local v50 = v_u_4.IsFinite(p49.X) and v_u_4.IsFinite(p49.Y)
	if v50 then
		v50 = v_u_4.IsFinite(p49.Z)
	end
	return v50
end
function v_u_4.GetAngleBetweenXZVectors(p51, p52)
	return math.atan2(p52.X * p51.Z - p52.Z * p51.X, p52.X * p51.X + p52.Z * p51.Z)
end
function v_u_4.RotateVectorByAngleAndRound(p53, p54, p55)
	if 0 >= p53.Magnitude then
		return 0
	end
	local v56 = p53.Unit
	return math.floor((math.atan2(v56.Z, v56.X) + p54) / p55 + 0.5) * p55 - math.atan2(v56.Z, v56.X)
end
function v_u_4.GamepadLinearToCurve(p57)
	local v58 = Vector2.new
	local v59 = p57.X
	local v60 = v59 < 0 and -1 or 1
	local v61 = math.clamp(1.1 * (2 * math.abs((math.abs(v59))) - 1) - 0.1, -1, 1)
	local v62
	if 0 <= v61 then
		v62 = 0.35 * v61 / (0.35 - v61 + 1)
	else
		v62 = -(0.8 * -v61 / (0.8 + v61 + 1))
	end
	local v63 = math.clamp((v62 / 2 + 0.5) * v60, -1, 1)
	local v64 = p57.Y
	local v65 = v64 < 0 and -1 or 1
	local v66 = math.clamp(1.1 * (2 * math.abs((math.abs(v64))) - 1) - 0.1, -1, 1)
	local v67
	if 0 <= v66 then
		v67 = 0.35 * v66 / (0.35 - v66 + 1)
	else
		v67 = -(0.8 * -v66 / (0.8 + v66 + 1))
	end
	return v58(v63, (math.clamp((v67 / 2 + 0.5) * v65, -1, 1)))
end
function v_u_4.ConvertCameraModeEnumToStandard(p68)
	if p68 == Enum.TouchCameraMovementMode.Default then
		return Enum.ComputerCameraMovementMode.Follow
	elseif p68 == Enum.ComputerCameraMovementMode.Default then
		return Enum.ComputerCameraMovementMode.Classic
	elseif p68 == Enum.TouchCameraMovementMode.Classic or p68 == Enum.DevTouchCameraMovementMode.Classic or p68 == Enum.DevComputerCameraMovementMode.Classic or p68 == Enum.ComputerCameraMovementMode.Classic then
		return Enum.ComputerCameraMovementMode.Classic
	elseif p68 == Enum.TouchCameraMovementMode.Follow or p68 == Enum.DevTouchCameraMovementMode.Follow or p68 == Enum.DevComputerCameraMovementMode.Follow or p68 == Enum.ComputerCameraMovementMode.Follow then
		return Enum.ComputerCameraMovementMode.Follow
	elseif p68 == Enum.TouchCameraMovementMode.Orbital or p68 == Enum.DevTouchCameraMovementMode.Orbital or p68 == Enum.DevComputerCameraMovementMode.Orbital or p68 == Enum.ComputerCameraMovementMode.Orbital then
		return Enum.ComputerCameraMovementMode.Orbital
	elseif p68 == Enum.ComputerCameraMovementMode.CameraToggle or p68 == Enum.DevComputerCameraMovementMode.CameraToggle then
		return Enum.ComputerCameraMovementMode.CameraToggle
	elseif p68 == Enum.DevTouchCameraMovementMode.UserChoice or p68 == Enum.DevComputerCameraMovementMode.UserChoice then
		return Enum.DevComputerCameraMovementMode.UserChoice
	else
		return Enum.ComputerCameraMovementMode.Classic
	end
end
local v_u_69 = ""
local v_u_70 = nil
function v_u_4.setMouseIconOverride(p71)
	-- upvalues: (copy) v_u_1, (ref) v_u_70, (ref) v_u_69
	local v72 = v_u_1.LocalPlayer
	if not v72 then
		v_u_1:GetPropertyChangedSignal("LocalPlayer"):Wait()
		v72 = v_u_1.LocalPlayer
	end
	assert(v72)
	local v73 = v72:GetMouse()
	if v73.Icon ~= v_u_70 then
		v_u_69 = v73.Icon
	end
	v73.Icon = p71
	v_u_70 = p71
end
function v_u_4.restoreMouseIcon()
	-- upvalues: (copy) v_u_1, (ref) v_u_70, (ref) v_u_69
	local v74 = v_u_1.LocalPlayer
	if not v74 then
		v_u_1:GetPropertyChangedSignal("LocalPlayer"):Wait()
		v74 = v_u_1.LocalPlayer
	end
	assert(v74)
	local v75 = v74:GetMouse()
	if v75.Icon == v_u_70 then
		v75.Icon = v_u_69
	end
	v_u_70 = nil
end
local v_u_76 = Enum.MouseBehavior.Default
local v_u_77 = nil
function v_u_4.setMouseBehaviorOverride(p78)
	-- upvalues: (copy) v_u_2, (ref) v_u_77, (ref) v_u_76
	if v_u_2.MouseBehavior ~= v_u_77 then
		v_u_76 = v_u_2.MouseBehavior
	end
	v_u_2.MouseBehavior = p78
	v_u_77 = p78
end
function v_u_4.restoreMouseBehavior()
	-- upvalues: (copy) v_u_2, (ref) v_u_77, (ref) v_u_76
	if v_u_2.MouseBehavior == v_u_77 then
		v_u_2.MouseBehavior = v_u_76
	end
	v_u_77 = nil
end
local v_u_79 = Enum.RotationType.MovementRelative
local v_u_80 = nil
function v_u_4.setRotationTypeOverride(p81)
	-- upvalues: (copy) v_u_3, (ref) v_u_80, (ref) v_u_79
	if v_u_3.RotationType ~= v_u_80 then
		v_u_79 = v_u_3.RotationType
	end
	v_u_3.RotationType = p81
	v_u_80 = p81
end
function v_u_4.restoreRotationType()
	-- upvalues: (copy) v_u_3, (ref) v_u_80, (ref) v_u_79
	if v_u_3.RotationType == v_u_80 then
		v_u_3.RotationType = v_u_79
	end
	v_u_80 = nil
end
return v_u_4
