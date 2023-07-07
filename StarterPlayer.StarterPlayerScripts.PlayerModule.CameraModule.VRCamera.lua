-- decompiled by Sentinel (took 4.320704ms)
local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("VRService")
local v_u_3 = UserSettings():GetService("UserGameSettings")
local v_u_4 = require(script.Parent:WaitForChild("CameraInput"))
require(script.Parent:WaitForChild("CameraUtils"))
local v_u_5 = require(script.Parent:WaitForChild("VRBaseCamera"))
local v_u_6 = setmetatable({}, v_u_5)
v_u_6.__index = v_u_6
function v_u_6.new()
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	local v7 = setmetatable(v_u_5.new(), v_u_6)
	v7.lastUpdate = tick()
	v7:Reset()
	return v7
end
function v_u_6.Reset(p8)
	p8.needsReset = true
	p8.needsBlackout = true
	p8.motionDetTime = 0
	p8.blackOutTimer = 0
	p8.lastCameraResetPosition = nil
	p8.stepRotateTimeout = 0
	p8.cameraOffsetRotation = 0
	p8.cameraOffsetRotationDiscrete = 0
end
function v_u_6.Update(p9, p10)
	-- upvalues: (copy) v_u_1
	local v11 = workspace.CurrentCamera
	local v12 = v11.CFrame
	local v13 = v11.Focus
	local v14 = v_u_1.LocalPlayer
	p9:GetHumanoid()
	local _ = v11.CameraSubject
	if p9.lastUpdate == nil or 1 < p10 then
		p9.lastCameraTransform = nil
	end
	p9:UpdateFadeFromBlack(p10)
	p9:UpdateEdgeBlur(v14, p10)
	local v15 = p9.lastSubjectPosition
	local v16 = p9:GetSubjectPosition()
	if p9.needsBlackout then
		p9:StartFadeFromBlack()
		p9.blackOutTimer = p9.blackOutTimer + math.clamp(p10, 0.0001, 0.1)
		if 0.1 < p9.blackOutTimer and game:IsLoaded() then
			p9.needsBlackout = false
			p9.needsReset = true
		end
	end
	if v16 then
		if v14 then
			if v11 then
				local v17 = p9:GetVRFocus(v16, p10)
				if p9:IsInFirstPerson() then
					v12, v13 = p9:UpdateFirstPersonTransform(p10, v12, v17, v15, v16)
				else
					v12, v13 = p9:UpdateThirdPersonTransform(p10, v12, v17, v15, v16)
				end
				p9.lastCameraTransform = v12
				p9.lastCameraFocus = v13
			end
		end
	end
	p9.lastUpdate = tick()
	return v12, v13
end
function v_u_6.GetAvatarFeetWorldYValue(_)
	local v18 = workspace.CurrentCamera.CameraSubject
	if not v18 then
		return nil
	end
	if not (v18:IsA("Humanoid") and v18.RootPart) then
		return nil
	end
	local v19 = v18.RootPart
	return v19.Position.Y - v19.Size.Y / 2 - v18.HipHeight
end
function v_u_6.UpdateFirstPersonTransform(p20, p21, _, p22, p23, p24)
	-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_3
	if p20.needsReset then
		p20:StartFadeFromBlack()
		p20.needsReset = false
		p20.stepRotateTimeout = 0.25
		p20.VRCameraFocusFrozen = true
		p20.cameraOffsetRotation = 0
		p20.cameraOffsetRotationDiscrete = 0
	end
	local v25 = v_u_1.LocalPlayer
	if 0.01 < (p23 - p24).magnitude then
		p20:StartVREdgeBlur(v25)
	end
	local v26 = p22.p
	local v27 = p20:GetCameraLookVector()
	local v28 = Vector3.new(v27.X, 0, v27.Z).Unit
	if 0 < p20.stepRotateTimeout then
		p20.stepRotateTimeout = p20.stepRotateTimeout - p21
	end
	local v29 = v_u_4.getRotation()
	local v30 = 0
	if v_u_3.VRSmoothRotationEnabled then
		v30 = v29.X
	elseif p20.stepRotateTimeout <= 0 then
		if 0.03 < math.abs(v29.X) then
			v30 = v29.X < 0 and -0.5 or 0.5
			p20.needsReset = true
		end
	end
	return CFrame.new(v26 - 0.5 * p20:CalculateNewLookVectorFromArg(v28, Vector2.new(v30, 0)), v26), p22
end
function v_u_6.UpdateThirdPersonTransform(p31, p32, p33, p34, p35, p36)
	-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_3, (copy) v_u_2
	local v37 = p31:GetCameraToSubjectDistance()
	local v38 = v37 < 0.5 and 0.5 or v37
	if p35 ~= nil then
		if p31.lastCameraFocus ~= nil then
			local v39 = 0.01 < (p35 - p36).magnitude and true or 0.01 < require(v_u_1.LocalPlayer:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule")):GetMoveVector().magnitude
			if v39 then
				p31.motionDetTime = 0.1
			end
			p31.motionDetTime = p31.motionDetTime - p32
			if (0 < p31.motionDetTime and true or v39) and not p31.needsReset then
				p31.VRCameraFocusFrozen = true
				return p33, p31.lastCameraFocus
			end
			local v40 = p31.lastCameraResetPosition == nil and true or 1 < (p36 - p31.lastCameraResetPosition).Magnitude
			local v41 = v_u_4.getRotation()
			local v42 = false
			if v41 ~= Vector2.new() then
				if v41.X ~= 0 then
					local v43 = p31.cameraOffsetRotation + v41.X
					if v43 < -math.pi then
						v43 = math.pi - v43 + math.pi
					elseif math.pi < v43 then
						v43 = -math.pi + v43 - math.pi
					end
					p31.cameraOffsetRotation = math.clamp(v43, -math.pi, math.pi)
					if v_u_3.VRSmoothRotationEnabled then
						p31.cameraOffsetRotationDiscrete = p31.cameraOffsetRotation
						local v44 = p31:GetHumanoid()
						local v45 = v44.Torso and v44.Torso.CFrame.lookVector or Vector3.new(1, 0, 0)
						local v46 = p34.Position - Vector3.new(v45.X, 0, v45.Z) * v38
						local v47 = Vector3.new(p34.Position.X, v46.Y, p34.Position.Z)
						p33 = CFrame.new(v47 - (CFrame.new(v46, v47) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), p31.cameraOffsetRotationDiscrete)).LookVector * (v47 - v46).Magnitude, v47)
					else
						local v48 = math.floor(p31.cameraOffsetRotation * 12 / 12)
						if v48 ~= p31.cameraOffsetRotationDiscrete then
							p31.cameraOffsetRotationDiscrete = v48
							v42 = true
						end
					end
				end
			end
			if p31.VRCameraFocusFrozen and v40 or p31.needsReset or v42 then
				if not v42 then
					p31.cameraOffsetRotationDiscrete = 0
					p31.cameraOffsetRotation = 0
				end
				v_u_2:RecenterUserHeadCFrame()
				p31.VRCameraFocusFrozen = false
				p31.needsReset = false
				p31.lastCameraResetPosition = p36
				p31:ResetZoom()
				p31:StartFadeFromBlack()
				local v49 = p31:GetHumanoid()
				local v50 = v49.Torso and v49.Torso.CFrame.lookVector or Vector3.new(1, 0, 0)
				local v51 = p34.Position - Vector3.new(v50.X, 0, v50.Z) * v38
				local v52 = Vector3.new(p34.Position.X, v51.Y, p34.Position.Z)
				if p31.cameraOffsetRotation ~= 0 then
					v51 = v52 - (CFrame.new(v51, v52) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), p31.cameraOffsetRotationDiscrete)).LookVector * (v52 - v51).Magnitude
				end
				p33 = CFrame.new(v51, v52)
			end
		end
	end
	return p33, p34
end
function v_u_6.EnterFirstPerson(p53)
	p53.inFirstPerson = true
	p53:UpdateMouseBehavior()
end
function v_u_6.LeaveFirstPerson(p54)
	p54.inFirstPerson = false
	p54.needsReset = true
	p54:UpdateMouseBehavior()
	if p54.VRBlur then
		p54.VRBlur.Visible = false
	end
end
return v_u_6
