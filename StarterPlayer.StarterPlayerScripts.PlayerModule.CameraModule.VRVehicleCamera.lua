-- decompiled by Sentinel (took 2.403314ms)
local v_u_1 = require(script.Parent:WaitForChild("VRBaseCamera"))
require(script.Parent:WaitForChild("CameraInput"))
local v_u_2 = require(script.Parent:WaitForChild("CameraUtils"))
local v_u_3 = require(script.Parent:WaitForChild("ZoomController"))
require(script.Parent:WaitForChild("VehicleCamera"))
local v_u_4 = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraCore"))
local v_u_5 = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraConfig"))
local v_u_6 = game:GetService("RunService")
game:GetService("VRService")
local v_u_7 = game:GetService("Players").LocalPlayer
local v_u_8 = v_u_2.Spring
local v_u_9 = v_u_2.mapClamp
local _ = v_u_2.sanitizeAngle
Vector3.new(0, 0, 0)
local v_u_10 = 0.016666666666666666
local v_u_11 = setmetatable({}, v_u_1)
v_u_11.__index = v_u_11
function v_u_11.new()
	-- upvalues: (copy) v_u_1, (copy) v_u_11, (copy) v_u_6, (ref) v_u_10
	local v12 = setmetatable(v_u_1.new(), v_u_11)
	v12:Reset()
	v_u_6.Stepped:Connect(function(_, p13)
		-- upvalues: (ref) v_u_10
		v_u_10 = p13
	end)
	return v12
end
function v_u_11.Reset(p14)
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_5, (copy) v_u_2
	p14.vehicleCameraCore = v_u_4.new(p14:GetSubjectCFrame())
	p14.pitchSpring = v_u_8.new(0, -math.rad(v_u_5.pitchBaseAngle))
	p14.yawSpring = v_u_8.new(0, 0)
	local v15 = workspace.CurrentCamera
	local v16
	if v15 then
		v16 = v15.CameraSubject
	else
		v16 = v15
	end
	assert(v15, "VRVehicleCamera initialization error")
	assert(v16)
	assert(v16:IsA("VehicleSeat"))
	local v17, v18 = v_u_2.getLooseBoundingSphere((v16:GetConnectedParts(true)))
	p14.assemblyRadius = math.max(v18, 0.001)
	p14.assemblyOffset = v16.CFrame:Inverse() * v17
	p14.lastCameraFocus = nil
	p14:_StepInitialZoom()
end
function v_u_11._StepInitialZoom(p19)
	-- upvalues: (copy) v_u_3, (copy) v_u_5
	p19:SetCameraToSubjectDistance((math.max(v_u_3.GetZoomRadius(), p19.assemblyRadius * v_u_5.initialZoomRadiusMul)))
end
function v_u_11._GetThirdPersonLocalOffset(p20)
	-- upvalues: (copy) v_u_5
	return p20.assemblyOffset + Vector3.new(0, p20.assemblyRadius * v_u_5.verticalCenterOffset, 0)
end
function v_u_11._GetFirstPersonLocalOffset(p21, p22)
	-- upvalues: (copy) v_u_7
	local v23 = v_u_7.Character
	if v23 and v23.Parent then
		local v24 = v23:FindFirstChild("Head")
		if v24 and v24:IsA("BasePart") then
			return p22:Inverse() * v24.Position
		end
	end
	return p21:_GetThirdPersonLocalOffset()
end
function v_u_11.Update(p25)
	-- upvalues: (ref) v_u_10, (copy) v_u_9, (copy) v_u_7
	local v26 = workspace.CurrentCamera
	local v27
	if v26 then
		v27 = v26.CameraSubject
	else
		v27 = v26
	end
	local v28 = p25.vehicleCameraCore
	assert(v26)
	assert(v27)
	assert(v27:IsA("VehicleSeat"))
	local v29 = v_u_10
	v_u_10 = 0
	local v30 = p25:GetSubjectCFrame()
	local v31 = p25:GetSubjectRotVelocity()
	math.abs((p25:GetSubjectVelocity():Dot(v30.ZVector)))
	local v32 = p25:StepZoom()
	local v33 = v_u_9(v32, 0.5, p25.assemblyRadius, 1, 0)
	local v34 = p25:_GetThirdPersonLocalOffset():Lerp(p25:_GetFirstPersonLocalOffset(v30), v33)
	v28:setTransform(v30)
	local v35 = v28:step(v29, math.abs((v30.XVector:Dot(v31))), math.abs((v30.YVector:Dot(v31))), v33)
	p25:UpdateFadeFromBlack(v29)
	local v36, v37
	if p25:IsInFirstPerson() then
		v36 = CFrame.new(v30 * v34) * CFrame.new(v35.Position, Vector3.new(v35.LookVector.X, 0, v35.LookVector.Z).Unit)
		v37 = v36 * CFrame.new(0, 0, v32)
		p25:StartVREdgeBlur(v_u_7)
	else
		v36 = CFrame.new(v30 * v34) * v35
		v37 = v36 * CFrame.new(0, 0, v32)
		if not p25.lastCameraFocus then
			p25.lastCameraFocus = v36
			p25.needsReset = true
		end
		local v38 = v36.Position - v26.CFrame.Position
		if 0.56 < v38.Unit:Dot(v26.CFrame.LookVector) and v38.magnitude < 200 and not p25.needsReset then
			v36 = p25.lastCameraFocus
			local v39 = v36.p
			local v40 = p25:GetCameraLookVector()
			v37 = CFrame.new(v39 - v32 * p25:CalculateNewLookVectorFromArg(Vector3.new(v40.X, 0, v40.Z).Unit, Vector2.new(0, 0)), v39)
		else
			p25.currentSubjectDistance = 16
			p25.lastCameraFocus = p25:GetVRFocus(v30.Position, v29)
			p25.needsReset = false
			p25:StartFadeFromBlack()
			p25:ResetZoom()
		end
		p25:UpdateEdgeBlur(v_u_7, v29)
	end
	return v37, v36
end
function v_u_11.EnterFirstPerson(p41)
	p41.inFirstPerson = true
	p41:UpdateMouseBehavior()
end
function v_u_11.LeaveFirstPerson(p42)
	p42.inFirstPerson = false
	p42:UpdateMouseBehavior()
end
return v_u_11
