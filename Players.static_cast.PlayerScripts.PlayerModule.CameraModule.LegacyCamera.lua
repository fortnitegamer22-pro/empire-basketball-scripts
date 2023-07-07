-- decompiled by Sentinel (took 1.764646ms)
Vector2.new()
require(script.Parent:WaitForChild("CameraUtils"))
local v_u_1 = require(script.Parent:WaitForChild("CameraInput"))
local v_u_2 = game:GetService("Players")
local v_u_3 = require(script.Parent:WaitForChild("BaseCamera"))
local v_u_4 = setmetatable({}, v_u_3)
v_u_4.__index = v_u_4
function v_u_4.new()
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v5 = setmetatable(v_u_3.new(), v_u_4)
	v5.cameraType = Enum.CameraType.Fixed
	v5.lastUpdate = tick()
	v5.lastDistanceToSubject = nil
	return v5
end
function v_u_4.GetModuleName(_)
	return "LegacyCamera"
end
function v_u_4.SetCameraToSubjectDistance(p6, p7)
	-- upvalues: (copy) v_u_3
	return v_u_3.SetCameraToSubjectDistance(p6, p7)
end
function v_u_4.Update(p8, _)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	if not p8.cameraType then
		return nil, nil
	end
	local v9 = tick()
	local v10 = workspace.CurrentCamera
	local v11 = v10.CFrame
	local v12 = v10.Focus
	local v13 = v_u_2.LocalPlayer
	if p8.lastUpdate == nil or 1 < v9 - p8.lastUpdate then
		p8.lastDistanceToSubject = nil
	end
	local v14 = p8:GetSubjectPosition()
	if p8.cameraType == Enum.CameraType.Fixed then
		if v14 then
			if v13 then
				if v10 then
					v12 = v10.Focus
					v11 = CFrame.new(v10.CFrame.p, v10.CFrame.p + p8:GetCameraToSubjectDistance() * p8:CalculateNewLookVectorFromArg(nil, v_u_1.getRotation()))
				end
			end
		end
	elseif p8.cameraType == Enum.CameraType.Attach then
		local v15 = p8:GetSubjectCFrame()
		local _, v16 = v15:ToEulerAnglesYXZ()
		v12 = CFrame.new(v15.p) * CFrame.fromEulerAnglesYXZ(math.clamp(v10.CFrame:ToEulerAnglesYXZ() - v_u_1.getRotation().Y, -1.3962634015954636, 1.3962634015954636), v16, 0)
		v11 = v12 * CFrame.new(0, 0, p8:StepZoom())
	else
		if p8.cameraType ~= Enum.CameraType.Watch then
			return v10.CFrame, v10.Focus
		end
		if v14 then
			if v13 then
				if v10 then
					local v17 = nil
					if v14 == v10.CFrame.p then
						warn("Camera cannot watch subject in same position as itself")
						return v10.CFrame, v10.Focus
					end
					local v18 = p8:GetHumanoid()
					if v18 then
						if v18.RootPart then
							local v19 = v14 - v10.CFrame.p
							v17 = v19.unit
							if p8.lastDistanceToSubject then
								if p8.lastDistanceToSubject == p8:GetCameraToSubjectDistance() then
									p8:SetCameraToSubjectDistance(v19.magnitude)
								end
							end
						end
					end
					local v20 = p8:GetCameraToSubjectDistance()
					v12 = CFrame.new(v14)
					v11 = CFrame.new(v14 - v20 * p8:CalculateNewLookVectorFromArg(v17, v_u_1.getRotation()), v14)
					p8.lastDistanceToSubject = v20
				end
			end
		end
	end
	p8.lastUpdate = v9
	return v11, v12
end
return v_u_4
