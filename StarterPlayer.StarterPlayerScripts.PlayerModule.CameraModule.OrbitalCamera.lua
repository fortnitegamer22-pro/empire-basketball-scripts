-- decompiled by Sentinel (took 4.595492ms)
local v_u_1 = Vector3.new(0, 0, 1)
local v_u_2 = Vector3.new(1, 0, 1)
local v_u_3 = Vector3.new(0, 0, 0)
local v_u_4 = 2 * math.pi
local v_u_5 = require(script.Parent:WaitForChild("CameraUtils"))
local v_u_6 = require(script.Parent:WaitForChild("CameraInput"))
local v_u_7 = game:GetService("Players")
local v_u_8 = game:GetService("VRService")
local v_u_9 = require(script.Parent:WaitForChild("BaseCamera"))
local v_u_10 = setmetatable({}, v_u_9)
v_u_10.__index = v_u_10
function v_u_10.new()
	-- upvalues: (copy) v_u_9, (copy) v_u_10
	local v11 = setmetatable(v_u_9.new(), v_u_10)
	v11.lastUpdate = tick()
	v11.changedSignalConnections = {}
	v11.refAzimuthRad = nil
	v11.curAzimuthRad = nil
	v11.minAzimuthAbsoluteRad = nil
	v11.maxAzimuthAbsoluteRad = nil
	v11.useAzimuthLimits = nil
	v11.curElevationRad = nil
	v11.minElevationRad = nil
	v11.maxElevationRad = nil
	v11.curDistance = nil
	v11.minDistance = nil
	v11.maxDistance = nil
	v11.gamepadDollySpeedMultiplier = 1
	v11.lastUserPanCamera = tick()
	v11.externalProperties = {}
	v11.externalProperties.InitialDistance = 25
	v11.externalProperties.MinDistance = 10
	v11.externalProperties.MaxDistance = 100
	v11.externalProperties.InitialElevation = 35
	v11.externalProperties.MinElevation = 35
	v11.externalProperties.MaxElevation = 35
	v11.externalProperties.ReferenceAzimuth = -45
	v11.externalProperties.CWAzimuthTravel = 90
	v11.externalProperties.CCWAzimuthTravel = 90
	v11.externalProperties.UseAzimuthLimits = false
	v11:LoadNumberValueParameters()
	return v11
end
function v_u_10.LoadOrCreateNumberValueParameter(p_u_12, p_u_13, p14, p_u_15)
	local v16 = script:FindFirstChild(p_u_13)
	if v16 and v16:isA(p14) then
		p_u_12.externalProperties[p_u_13] = v16.Value
	else
		if p_u_12.externalProperties[p_u_13] == nil then
			return
		end
		v16 = Instance.new(p14)
		v16.Name = p_u_13
		v16.Parent = script
		v16.Value = p_u_12.externalProperties[p_u_13]
	end
	if p_u_15 then
		if p_u_12.changedSignalConnections[p_u_13] then
			p_u_12.changedSignalConnections[p_u_13]:Disconnect()
		end
		p_u_12.changedSignalConnections[p_u_13] = v16.Changed:Connect(function(p17)
			-- upvalues: (copy) p_u_12, (copy) p_u_13, (copy) p_u_15
			p_u_12.externalProperties[p_u_13] = p17
			p_u_15(p_u_12)
		end)
	end
end
function v_u_10.SetAndBoundsCheckAzimuthValues(p18)
	p18.minAzimuthAbsoluteRad = math.rad(p18.externalProperties.ReferenceAzimuth) - math.abs((math.rad(p18.externalProperties.CWAzimuthTravel)))
	p18.maxAzimuthAbsoluteRad = math.rad(p18.externalProperties.ReferenceAzimuth) + math.abs((math.rad(p18.externalProperties.CCWAzimuthTravel)))
	p18.useAzimuthLimits = p18.externalProperties.UseAzimuthLimits
	if p18.useAzimuthLimits then
		p18.curAzimuthRad = math.max(p18.curAzimuthRad, p18.minAzimuthAbsoluteRad)
		p18.curAzimuthRad = math.min(p18.curAzimuthRad, p18.maxAzimuthAbsoluteRad)
	end
end
function v_u_10.SetAndBoundsCheckElevationValues(p19)
	local v20 = math.max(p19.externalProperties.MinElevation, -80)
	local v21 = math.min(p19.externalProperties.MaxElevation, 80)
	p19.minElevationRad = math.rad((math.min(v20, v21)))
	p19.maxElevationRad = math.rad((math.max(v20, v21)))
	p19.curElevationRad = math.max(p19.curElevationRad, p19.minElevationRad)
	p19.curElevationRad = math.min(p19.curElevationRad, p19.maxElevationRad)
end
function v_u_10.SetAndBoundsCheckDistanceValues(p22)
	p22.minDistance = p22.externalProperties.MinDistance
	p22.maxDistance = p22.externalProperties.MaxDistance
	p22.curDistance = math.max(p22.curDistance, p22.minDistance)
	p22.curDistance = math.min(p22.curDistance, p22.maxDistance)
end
function v_u_10.LoadNumberValueParameters(p23)
	p23:LoadOrCreateNumberValueParameter("InitialElevation", "NumberValue", nil)
	p23:LoadOrCreateNumberValueParameter("InitialDistance", "NumberValue", nil)
	p23:LoadOrCreateNumberValueParameter("ReferenceAzimuth", "NumberValue", p23.SetAndBoundsCheckAzimuthValue)
	p23:LoadOrCreateNumberValueParameter("CWAzimuthTravel", "NumberValue", p23.SetAndBoundsCheckAzimuthValues)
	p23:LoadOrCreateNumberValueParameter("CCWAzimuthTravel", "NumberValue", p23.SetAndBoundsCheckAzimuthValues)
	p23:LoadOrCreateNumberValueParameter("MinElevation", "NumberValue", p23.SetAndBoundsCheckElevationValues)
	p23:LoadOrCreateNumberValueParameter("MaxElevation", "NumberValue", p23.SetAndBoundsCheckElevationValues)
	p23:LoadOrCreateNumberValueParameter("MinDistance", "NumberValue", p23.SetAndBoundsCheckDistanceValues)
	p23:LoadOrCreateNumberValueParameter("MaxDistance", "NumberValue", p23.SetAndBoundsCheckDistanceValues)
	p23:LoadOrCreateNumberValueParameter("UseAzimuthLimits", "BoolValue", p23.SetAndBoundsCheckAzimuthValues)
	p23.curAzimuthRad = math.rad(p23.externalProperties.ReferenceAzimuth)
	p23.curElevationRad = math.rad(p23.externalProperties.InitialElevation)
	p23.curDistance = p23.externalProperties.InitialDistance
	p23:SetAndBoundsCheckAzimuthValues()
	p23:SetAndBoundsCheckElevationValues()
	p23:SetAndBoundsCheckDistanceValues()
end
function v_u_10.GetModuleName(_)
	return "OrbitalCamera"
end
function v_u_10.SetInitialOrientation(p24, p25)
	-- upvalues: (copy) v_u_5
	if p25 and p25.RootPart then
		assert(p25.RootPart, "")
		local v26 = (p25.RootPart.CFrame.LookVector - Vector3.new(0, 0.23, 0)).Unit
		v_u_5.IsFinite((v_u_5.GetAngleBetweenXZVectors(v26, p24:GetCameraLookVector())))
		v_u_5.IsFinite(math.asin(p24:GetCameraLookVector().Y) - math.asin(v26.Y))
	else
		warn("OrbitalCamera could not set initial orientation due to missing humanoid")
	end
end
function v_u_10.GetCameraToSubjectDistance(p27)
	return p27.curDistance
end
function v_u_10.SetCameraToSubjectDistance(p28, p29)
	-- upvalues: (copy) v_u_7
	if v_u_7.LocalPlayer then
		p28.currentSubjectDistance = math.clamp(p29, p28.minDistance, p28.maxDistance)
		p28.currentSubjectDistance = math.max(p28.currentSubjectDistance, p28.FIRST_PERSON_DISTANCE_THRESHOLD)
	end
	p28.inFirstPerson = false
	p28:UpdateMouseBehavior()
	return p28.currentSubjectDistance
end
function v_u_10.CalculateNewLookVector(p30, p31, p32)
	-- upvalues: (copy) v_u_3
	local v33 = p31 or p30:GetCameraLookVector()
	local v34 = math.asin(v33.Y)
	local v35 = Vector2.new(p32.X, (math.clamp(p32.Y, v34 - 1.3962634015954636, v34 - -1.3962634015954636)))
	return (CFrame.Angles(0, -v35.X, 0) * CFrame.new(v_u_3, v33) * CFrame.Angles(-v35.Y, 0, 0)).LookVector
end
function v_u_10.Update(p36, _)
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_8, (copy) v_u_2, (copy) v_u_4, (copy) v_u_1
	local v37 = tick()
	local v38 = v37 - p36.lastUpdate
	local v39 = v_u_6.getRotation() ~= Vector2.new()
	local v40 = workspace.CurrentCamera
	local v41 = v40.CFrame
	local v42 = v40.Focus
	local v43 = v_u_7.LocalPlayer
	local v44
	if v40 then
		v44 = v40.CameraSubject
	else
		v44 = v40
	end
	local v45
	if v44 then
		v45 = v44:IsA("VehicleSeat")
	else
		v45 = v44
	end
	local v46
	if v44 then
		v46 = v44:IsA("SkateboardPlatform")
	else
		v46 = v44
	end
	if p36.lastUpdate == nil or 1 < v38 then
		p36.lastCameraTransform = nil
	end
	if v39 then
		p36.lastUserPanCamera = tick()
	end
	local v47 = p36:GetSubjectPosition()
	if v47 then
		if v43 then
			if v40 then
				if p36.gamepadDollySpeedMultiplier ~= 1 then
					p36:SetCameraToSubjectDistance(p36.currentSubjectDistance * p36.gamepadDollySpeedMultiplier)
				end
				local v48 = v_u_8.VREnabled
				v42 = v48 and p36:GetVRFocus(v47, v38) or CFrame.new(v47)
				local v49 = v_u_6.getRotation()
				local v50 = v42.p
				if v48 and not p36:IsInFirstPerson() then
					local v51 = p36:GetCameraHeight()
					local v52 = v47 - v40.CFrame.p
					local v53 = v52.Magnitude
					if p36.currentSubjectDistance < v53 or v49.X ~= 0 then
						local v54 = p36:CalculateNewLookVector(v52.Unit * v_u_2, Vector2.new(v49.X, 0)) * math.min(v53, p36.currentSubjectDistance)
						local v55 = v50 - v54
						local v56 = v40.CFrame.LookVector
						if v49.X == 0 then
							v54 = v56
						end
						v41 = CFrame.new(v55, (Vector3.new(v55.X + v54.X, v55.Y, v55.Z + v54.Z))) + Vector3.new(0, v51, 0)
					end
				else
					p36.curAzimuthRad = p36.curAzimuthRad - v49.X
					if p36.useAzimuthLimits then
						p36.curAzimuthRad = math.clamp(p36.curAzimuthRad, p36.minAzimuthAbsoluteRad, p36.maxAzimuthAbsoluteRad)
					else
						p36.curAzimuthRad = p36.curAzimuthRad ~= 0 and math.sign(p36.curAzimuthRad) * math.abs(p36.curAzimuthRad) % v_u_4 or 0
					end
					p36.curElevationRad = math.clamp(p36.curElevationRad + v49.Y, p36.minElevationRad, p36.maxElevationRad)
					v41 = CFrame.new(v47 + p36.currentSubjectDistance * CFrame.fromEulerAnglesYXZ(-p36.curElevationRad, p36.curAzimuthRad, 0) * v_u_1, v47)
				end
				p36.lastCameraTransform = v41
				p36.lastCameraFocus = v42
				if (v45 or v46) and v44:IsA("BasePart") then
					p36.lastSubjectCFrame = v44.CFrame
				else
					p36.lastSubjectCFrame = nil
				end
			end
		end
	end
	p36.lastUpdate = v37
	return v41, v42
end
return v_u_10
