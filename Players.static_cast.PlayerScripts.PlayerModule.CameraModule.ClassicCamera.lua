-- decompiled by Sentinel (took 6.871631ms)
Vector2.new(0, 0)
local v_u_1 = 0
local v_u_2 = CFrame.fromOrientation(-0.2617993877991494, 0, 0)
local v_u_3 = game:GetService("Players")
local v_u_4 = game:GetService("VRService")
local v_u_5 = require(script.Parent:WaitForChild("CameraInput"))
local v_u_6 = require(script.Parent:WaitForChild("CameraUtils"))
local v_u_7 = require(script.Parent:WaitForChild("BaseCamera"))
local v_u_8 = setmetatable({}, v_u_7)
v_u_8.__index = v_u_8
function v_u_8.new()
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_6
	local v9 = setmetatable(v_u_7.new(), v_u_8)
	v9.isFollowCamera = false
	v9.isCameraToggle = false
	v9.lastUpdate = tick()
	v9.cameraToggleSpring = v_u_6.Spring.new(5, 0)
	return v9
end
function v_u_8.GetCameraToggleOffset(p10, p11)
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	if not p10.isCameraToggle then
		return Vector3.new()
	end
	local v12 = p10.currentSubjectDistance
	if v_u_5.getTogglePan() then
		p10.cameraToggleSpring.goal = math.clamp(v_u_6.map(v12, 0.5, p10.FIRST_PERSON_DISTANCE_THRESHOLD, 0, 1), 0, 1)
	else
		p10.cameraToggleSpring.goal = 0
	end
	return Vector3.new(0, p10.cameraToggleSpring:step(p11) * (math.clamp(v_u_6.map(v12, 0.5, 64, 0, 1), 0, 1) + 1), 0)
end
function v_u_8.SetCameraMovementMode(p13, p14)
	-- upvalues: (copy) v_u_7
	v_u_7.SetCameraMovementMode(p13, p14)
	p13.isFollowCamera = p14 == Enum.ComputerCameraMovementMode.Follow
	p13.isCameraToggle = p14 == Enum.ComputerCameraMovementMode.CameraToggle
end
function v_u_8.Update(p15)
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_5, (ref) v_u_1, (copy) v_u_6, (copy) v_u_4
	local v16 = tick()
	local v17 = v16 - p15.lastUpdate
	local v18 = workspace.CurrentCamera
	local v19 = v18.CFrame
	local v20 = v18.Focus
	local v21
	if p15.resetCameraAngle then
		local v22 = p15:GetHumanoidRootPart()
		if v22 then
			v21 = (v22.CFrame * v_u_2).lookVector
		else
			v21 = v_u_2.lookVector
		end
		p15.resetCameraAngle = false
	else
		v21 = nil
	end
	local v23 = v_u_3.LocalPlayer
	local v24 = p15:GetHumanoid()
	local v25 = v18.CameraSubject
	local v26
	if v25 then
		v26 = v25:IsA("VehicleSeat")
	else
		v26 = v25
	end
	local v27
	if v25 then
		v27 = v25:IsA("SkateboardPlatform")
	else
		v27 = v25
	end
	local v28
	if v24 then
		v28 = v24:GetState() == Enum.HumanoidStateType.Climbing
	else
		v28 = v24
	end
	if p15.lastUpdate == nil or 1 < v17 then
		p15.lastCameraTransform = nil
	end
	local v29 = v_u_5.getRotation()
	p15:StepZoom()
	local v30 = p15:GetCameraHeight()
	if v_u_5.getRotation() ~= Vector2.new() then
		v_u_1 = 0
		p15.lastUserPanCamera = tick()
	end
	local v31 = v16 - p15.lastUserPanCamera < 2
	local v32 = p15:GetSubjectPosition()
	if v32 then
		if v23 then
			if v18 then
				local v33 = p15:GetCameraToSubjectDistance()
				local v34 = v33 < 0.5 and 0.5 or v33
				if p15:GetIsMouseLocked() and not p15:IsInFirstPerson() then
					local v35 = p15:CalculateNewLookCFrameFromArg(v21, v29)
					local v36 = p15:GetMouseLockOffset()
					local v37 = v36.X * v35.RightVector + v36.Y * v35.UpVector + v36.Z * v35.LookVector
					if v_u_6.IsFiniteVector3(v37) then
						v32 = v32 + v37
					end
				elseif v_u_5.getRotation() == Vector2.new() then
					if p15.lastCameraTransform then
						local v38 = p15:IsInFirstPerson()
						if (v26 or v27 or p15.isFollowCamera and v28) and p15.lastUpdate and v24 and v24.Torso then
							if v38 then
								if p15.lastSubjectCFrame then
									if v26 or v27 then
										if v25:IsA("BasePart") then
											local v39 = -v_u_6.GetAngleBetweenXZVectors(p15.lastSubjectCFrame.lookVector, v25.CFrame.lookVector)
											if v_u_6.IsFinite(v39) then
												v29 = v29 + Vector2.new(v39, 0)
											end
											v_u_1 = 0
										end
									end
								end
							elseif not v31 then
								local v40 = v24.Torso.CFrame.lookVector
								v_u_1 = math.clamp(v_u_1 + 3.839724354387525 * v17, 0, 4.363323129985824)
								local v41 = math.clamp(v_u_1 * v17, 0, 1)
								if p15:IsInFirstPerson() then
									v41 = not (p15.isFollowCamera and p15.isClimbing) and 1 or v41
								end
								local v42 = v_u_6.GetAngleBetweenXZVectors(v40, p15:GetCameraLookVector())
								if v_u_6.IsFinite(v42) then
									if 0.0001 < math.abs(v42) then
										v29 = v29 + Vector2.new(v42 * v41, 0)
									end
								end
							end
						elseif p15.isFollowCamera then
							if not v38 then
								if not v31 then
									if not v_u_4.VREnabled then
										local v43 = v_u_6.GetAngleBetweenXZVectors(-(p15.lastCameraTransform.p - v32), p15:GetCameraLookVector())
										if v_u_6.IsFinite(v43) then
											if 0.0001 < math.abs(v43) then
												if math.abs(v43) > 0.4 * v17 then
													v29 = v29 + Vector2.new(v43, 0)
												end
											end
										end
									end
								end
							end
						end
					end
				end
				local v44
				if p15.isFollowCamera then
					local v45 = p15:CalculateNewLookVectorFromArg(v21, v29)
					if v_u_4.VREnabled then
						v44 = p15:GetVRFocus(v32, v17)
					else
						v44 = CFrame.new(v32)
					end
					v19 = CFrame.new(v44.p - v34 * v45, v44.p) + Vector3.new(0, v30, 0)
				else
					local v46 = v_u_4.VREnabled
					if v46 then
						v44 = p15:GetVRFocus(v32, v17)
					else
						v44 = CFrame.new(v32)
					end
					local v47 = v44.p
					if v46 and not p15:IsInFirstPerson() then
						local v48 = (v32 - v18.CFrame.p).magnitude
						if v34 < v48 or v29.x ~= 0 then
							local v49 = p15:CalculateNewLookVectorFromArg(nil, v29) * math.min(v48, v34)
							local v50 = v47 - v49
							local v51 = v18.CFrame.lookVector
							if v29.x == 0 then
								v49 = v51
							end
							v19 = CFrame.new(v50, (Vector3.new(v50.x + v49.x, v50.y, v50.z + v49.z))) + Vector3.new(0, v30, 0)
						end
					else
						v19 = CFrame.new(v47 - v34 * p15:CalculateNewLookVectorFromArg(v21, v29), v47)
					end
				end
				local v52 = p15:GetCameraToggleOffset(v17)
				v20 = v44 + v52
				v19 = v19 + v52
				p15.lastCameraTransform = v19
				p15.lastCameraFocus = v20
				if (v26 or v27) and v25:IsA("BasePart") then
					p15.lastSubjectCFrame = v25.CFrame
				else
					p15.lastSubjectCFrame = nil
				end
			end
		end
	end
	p15.lastUpdate = v16
	return v19, v20
end
function v_u_8.EnterFirstPerson(p53)
	p53.inFirstPerson = true
	p53:UpdateMouseBehavior()
end
function v_u_8.LeaveFirstPerson(p54)
	p54.inFirstPerson = false
	p54:UpdateMouseBehavior()
end
return v_u_8
