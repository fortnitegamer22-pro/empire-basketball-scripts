-- decompiled by Sentinel (took 2.313797ms)
local v1 = game:GetService("RunService")
local v_u_2 = require(script.Parent:WaitForChild("BaseCamera"))
local v_u_3 = require(script.Parent:WaitForChild("CameraInput"))
local v_u_4 = require(script.Parent:WaitForChild("CameraUtils"))
local v_u_5 = require(script.Parent:WaitForChild("ZoomController"))
local v_u_6 = require(script:WaitForChild("VehicleCameraCore"))
local v_u_7 = require(script:WaitForChild("VehicleCameraConfig"))
local v_u_8 = game:GetService("Players").LocalPlayer
local _ = v_u_4.map
local v_u_9 = v_u_4.Spring
local v_u_10 = v_u_4.mapClamp
local v_u_11 = v_u_4.sanitizeAngle
local v_u_12 = 0.016666666666666666
v1.Stepped:Connect(function(_, p13)
	-- upvalues: (ref) v_u_12
	v_u_12 = p13
end)
local v_u_14 = setmetatable({}, v_u_2)
v_u_14.__index = v_u_14
function v_u_14.new()
	-- upvalues: (copy) v_u_2, (copy) v_u_14
	local v15 = setmetatable(v_u_2.new(), v_u_14)
	v15:Reset()
	return v15
end
function v_u_14.Reset(p16)
	-- upvalues: (copy) v_u_6, (copy) v_u_9, (copy) v_u_7, (copy) v_u_4
	p16.vehicleCameraCore = v_u_6.new(p16:GetSubjectCFrame())
	p16.pitchSpring = v_u_9.new(0, -math.rad(v_u_7.pitchBaseAngle))
	p16.yawSpring = v_u_9.new(0, 0)
	p16.lastPanTick = 0
	local v17 = workspace.CurrentCamera
	local v18
	if v17 then
		v18 = v17.CameraSubject
	else
		v18 = v17
	end
	assert(v17)
	assert(v18)
	assert(v18:IsA("VehicleSeat"))
	local v19, v20 = v_u_4.getLooseBoundingSphere((v18:GetConnectedParts(true)))
	p16.assemblyRadius = math.max(v20, 0.001)
	p16.assemblyOffset = v18.CFrame:Inverse() * v19
	p16:_StepInitialZoom()
end
function v_u_14._StepInitialZoom(p21)
	-- upvalues: (copy) v_u_5, (copy) v_u_7
	p21:SetCameraToSubjectDistance((math.max(v_u_5.GetZoomRadius(), p21.assemblyRadius * v_u_7.initialZoomRadiusMul)))
end
function v_u_14._StepRotation(p22, p23, p24)
	-- upvalues: (copy) v_u_3, (copy) v_u_11, (copy) v_u_7, (copy) v_u_10
	local v25 = p22.yawSpring
	local v26 = p22.pitchSpring
	local v27 = v_u_3.getRotation(true)
	v25.pos = v_u_11(v25.pos + -v27.X)
	v26.pos = v_u_11((math.clamp(v26.pos + -v27.Y, -1.3962634015954636, 1.3962634015954636)))
	if v_u_3.getRotationActivated() then
		p22.lastPanTick = os.clock()
	end
	local v28 = -math.rad(v_u_7.pitchBaseAngle)
	local v29 = math.rad(v_u_7.pitchDeadzoneAngle)
	if os.clock() - p22.lastPanTick > v_u_7.autocorrectDelay then
		local v30 = v_u_10(p24, v_u_7.autocorrectMinCarSpeed, v_u_7.autocorrectMaxCarSpeed, 0, v_u_7.autocorrectResponse)
		v25.freq = v30
		v26.freq = v30
		if v25.freq < 0.001 then
			v25.vel = 0
		end
		if v26.freq < 0.001 then
			v26.vel = 0
		end
		if math.abs((v_u_11(v28 - v26.pos))) <= v29 then
			v26.goal = v26.pos
		else
			v26.goal = v28
		end
	else
		v25.freq = 0
		v25.vel = 0
		v26.freq = 0
		v26.vel = 0
		v26.goal = v28
	end
	return CFrame.fromEulerAnglesYXZ(v26:step(p23), v25:step(p23), 0)
end
function v_u_14._GetThirdPersonLocalOffset(p31)
	-- upvalues: (copy) v_u_7
	return p31.assemblyOffset + Vector3.new(0, p31.assemblyRadius * v_u_7.verticalCenterOffset, 0)
end
function v_u_14._GetFirstPersonLocalOffset(p32, p33)
	-- upvalues: (copy) v_u_8
	local v34 = v_u_8.Character
	if v34 and v34.Parent then
		local v35 = v34:FindFirstChild("Head")
		if v35 and v35:IsA("BasePart") then
			return p33:Inverse() * v35.Position
		end
	end
	return p32:_GetThirdPersonLocalOffset()
end
function v_u_14.Update(p36)
	-- upvalues: (ref) v_u_12, (copy) v_u_10
	local v37 = workspace.CurrentCamera
	local v38
	if v37 then
		v38 = v37.CameraSubject
	else
		v38 = v37
	end
	local v39 = p36.vehicleCameraCore
	assert(v37)
	assert(v38)
	assert(v38:IsA("VehicleSeat"))
	local v40 = v_u_12
	v_u_12 = 0
	local v41 = p36:GetSubjectCFrame()
	local v42 = p36:GetSubjectRotVelocity()
	local v43 = p36:StepZoom()
	local v44 = v_u_10(v43, 0.5, p36.assemblyRadius, 1, 0)
	v39:setTransform(v41)
	local v45 = CFrame.new(v41 * p36:_GetThirdPersonLocalOffset():Lerp(p36:_GetFirstPersonLocalOffset(v41), v44)) * v39:step(v40, math.abs((v41.XVector:Dot(v42))), math.abs((v41.YVector:Dot(v42))), v44) * p36:_StepRotation(v40, (math.abs((p36:GetSubjectVelocity():Dot(v41.ZVector)))))
	return v45 * CFrame.new(0, 0, v43), v45
end
function v_u_14.ApplyVRTransform(_) end
function v_u_14.EnterFirstPerson(p46)
	p46.inFirstPerson = true
	p46:UpdateMouseBehavior()
end
function v_u_14.LeaveFirstPerson(p47)
	p47.inFirstPerson = false
	p47:UpdateMouseBehavior()
end
return v_u_14
