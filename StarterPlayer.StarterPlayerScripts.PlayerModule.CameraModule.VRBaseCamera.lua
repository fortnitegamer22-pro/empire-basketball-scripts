-- decompiled by Sentinel (took 3.792748ms)
local v_u_1 = Vector3.new(0, 4, 0)
local v_u_2 = game:GetService("VRService")
local v_u_3 = require(script.Parent:WaitForChild("CameraInput"))
local v_u_4 = require(script.Parent:WaitForChild("ZoomController"))
local v_u_5 = game:GetService("Players").LocalPlayer
local v_u_6 = game:GetService("Lighting")
local v_u_7 = game:GetService("RunService")
local v_u_8 = UserSettings():GetService("UserGameSettings")
local v_u_9 = require(script.Parent:WaitForChild("BaseCamera"))
local v_u_10 = setmetatable({}, v_u_9)
v_u_10.__index = v_u_10
function v_u_10.new()
	-- upvalues: (copy) v_u_9, (copy) v_u_10, (copy) v_u_5
	local v11 = setmetatable(v_u_9.new(), v_u_10)
	v11.defaultDistance = 7
	v11.defaultSubjectDistance = math.clamp(v11.defaultDistance, v_u_5.CameraMinZoomDistance, v_u_5.CameraMaxZoomDistance)
	v11.currentSubjectDistance = math.clamp(v11.defaultDistance, v_u_5.CameraMinZoomDistance, v_u_5.CameraMaxZoomDistance)
	v11.VRFadeResetTimer = 0
	v11.VREdgeBlurTimer = 0
	v11.gamepadResetConnection = nil
	v11.needsReset = true
	return v11
end
function v_u_10.GetModuleName(_)
	return "VRBaseCamera"
end
function v_u_10.GamepadZoomPress(p12)
	if 3.5 < p12:GetCameraToSubjectDistance() then
		p12:SetCameraToSubjectDistance(0)
		p12.currentSubjectDistance = 0
	else
		p12:SetCameraToSubjectDistance(7)
		p12.currentSubjectDistance = 7
	end
	p12:GamepadReset()
	p12:ResetZoom()
end
function v_u_10.GamepadReset(p13)
	p13.needsReset = true
end
function v_u_10.ResetZoom(p14)
	-- upvalues: (copy) v_u_4
	v_u_4.SetZoomParameters(p14.currentSubjectDistance, 0)
	v_u_4.ReleaseSpring()
end
function v_u_10.OnEnable(p_u_15, p16)
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_6
	if p16 then
		p_u_15.gamepadResetConnection = v_u_3.gamepadReset:Connect(function()
			-- upvalues: (copy) p_u_15
			p_u_15:GamepadReset()
		end)
	else
		if p_u_15.inFirstPerson then
			p_u_15:GamepadZoomPress()
		end
		if p_u_15.gamepadResetConnection then
			p_u_15.gamepadResetConnection:Disconnect()
			p_u_15.gamepadResetConnection = nil
		end
		p_u_15.VREdgeBlurTimer = 0
		p_u_15:UpdateEdgeBlur(v_u_5, 1)
		local v17 = v_u_6:FindFirstChild("VRFade")
		if v17 then
			v17.Brightness = 0
		end
	end
end
function v_u_10.UpdateDefaultSubjectDistance(p18)
	-- upvalues: (copy) v_u_5
	p18.defaultSubjectDistance = math.clamp(7, v_u_5.CameraMinZoomDistance, v_u_5.CameraMaxZoomDistance)
end
function v_u_10.GetCameraToSubjectDistance(p19)
	return p19.currentSubjectDistance
end
function v_u_10.SetCameraToSubjectDistance(p20, p21)
	-- upvalues: (copy) v_u_5, (copy) v_u_4
	local v22 = p20.currentSubjectDistance
	local v23 = math.clamp(p21, 0, v_u_5.CameraMaxZoomDistance)
	if v23 < 1 then
		p20.currentSubjectDistance = 0.5
		if not p20.inFirstPerson then
			p20:EnterFirstPerson()
		end
	else
		p20.currentSubjectDistance = v23
		if p20.inFirstPerson then
			p20:LeaveFirstPerson()
		end
	end
	v_u_4.SetZoomParameters(p20.currentSubjectDistance, (math.sign(p21 - v22)))
	return p20.currentSubjectDistance
end
function v_u_10.GetVRFocus(p24, p25, p26)
	p24.cameraTranslationConstraints = Vector3.new(p24.cameraTranslationConstraints.x, math.min(1, p24.cameraTranslationConstraints.y + p26), p24.cameraTranslationConstraints.z)
	return CFrame.new(Vector3.new(p25.x, (p24.lastCameraFocus or p25).y, p25.z):Lerp(p25 + Vector3.new(0, p24:GetCameraHeight(), 0), p24.cameraTranslationConstraints.y))
end
function v_u_10.StartFadeFromBlack(p27)
	-- upvalues: (copy) v_u_8, (copy) v_u_6
	if v_u_8.VignetteEnabled ~= false then
		local v28 = v_u_6:FindFirstChild("VRFade")
		if not v28 then
			v28 = Instance.new("ColorCorrectionEffect")
			v28.Name = "VRFade"
			v28.Parent = v_u_6
		end
		v28.Brightness = -1
		p27.VRFadeResetTimer = 0.1
	end
end
function v_u_10.UpdateFadeFromBlack(p29, p30)
	-- upvalues: (copy) v_u_6
	local v31 = v_u_6:FindFirstChild("VRFade")
	if 0 < p29.VRFadeResetTimer then
		p29.VRFadeResetTimer = math.max(p29.VRFadeResetTimer - p30, 0)
		local v32 = v_u_6:FindFirstChild("VRFade")
		if v32 and v32.Brightness < 0 then
			v32.Brightness = math.min(v32.Brightness + p30 * 10, 0)
			return
		end
	elseif v31 then
		v31.Brightness = 0
	end
end
function v_u_10.StartVREdgeBlur(p33, p34)
	-- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_2
	if v_u_8.VignetteEnabled ~= false then
		local v35 = workspace.CurrentCamera:FindFirstChild("VRBlurPart")
		if not v35 then
			local v_u_36 = Vector3.new(0.44, 0.47, 1)
			local v_u_37 = Instance.new("Part")
			v_u_37.Name = "VRBlurPart"
			v_u_37.Parent = workspace.CurrentCamera
			v_u_37.CanTouch = false
			v_u_37.CanCollide = false
			v_u_37.CanQuery = false
			v_u_37.Anchored = true
			v_u_37.Size = v_u_36
			v_u_37.Transparency = 1
			v_u_37.CastShadow = false
			v_u_7.RenderStepped:Connect(function(_)
				-- upvalues: (ref) v_u_2, (ref) v_u_37, (copy) v_u_36
				local v38 = v_u_2:GetUserCFrame(Enum.UserCFrame.Head)
				local v39 = workspace.CurrentCamera.CFrame * CFrame.new(v38.p * workspace.CurrentCamera.HeadScale) * (v38 - v38.p)
				v_u_37.CFrame = v39 * CFrame.Angles(0, 3.141592653589793, 0) + v39.LookVector * 1.05 * workspace.CurrentCamera.HeadScale
				v_u_37.Size = v_u_36 * workspace.CurrentCamera.HeadScale
			end)
			v35 = v_u_37
		end
		local v40 = p34.PlayerGui:FindFirstChild("VRBlurScreen")
		local v41
		if v40 then
			v41 = v40:FindFirstChild("VRBlur")
		else
			v41 = nil
		end
		if not v41 then
			local v42 = v40 or Instance.new("SurfaceGui") or Instance.new("ScreenGui")
			v42.Name = "VRBlurScreen"
			v42.Parent = p34.PlayerGui
			v42.Adornee = v35
			v41 = Instance.new("ImageLabel")
			v41.Name = "VRBlur"
			v41.Parent = v42
			v41.Image = "rbxasset://textures/ui/VR/edgeBlur.png"
			v41.AnchorPoint = Vector2.new(0.5, 0.5)
			v41.Position = UDim2.new(0.5, 0, 0.5, 0)
			v41.Size = UDim2.fromScale(workspace.CurrentCamera.ViewportSize.X * 2.3 / 512, workspace.CurrentCamera.ViewportSize.Y * 2.3 / 512)
			v41.BackgroundTransparency = 1
			v41.Active = true
			v41.ScaleType = Enum.ScaleType.Stretch
		end
		v41.Visible = true
		v41.ImageTransparency = 0
		p33.VREdgeBlurTimer = 0.14
	end
end
function v_u_10.UpdateEdgeBlur(p43, p44, p45)
	local v46 = p44.PlayerGui:FindFirstChild("VRBlurScreen")
	local v47
	if v46 then
		v47 = v46:FindFirstChild("VRBlur")
	else
		v47 = nil
	end
	if v47 then
		if 0 < p43.VREdgeBlurTimer then
			p43.VREdgeBlurTimer = p43.VREdgeBlurTimer - p45
			local v48 = p44.PlayerGui:FindFirstChild("VRBlurScreen")
			local v49 = v48 and v48:FindFirstChild("VRBlur")
			if v49 then
				v49.ImageTransparency = 1 - math.clamp(p43.VREdgeBlurTimer, 0.01, 0.14) * 7.142857142857142
				return
			end
		else
			v47.Visible = false
		end
	end
end
function v_u_10.GetCameraHeight(p50)
	return p50.inFirstPerson and 0 or 0.25881904510252074 * p50.currentSubjectDistance
end
function v_u_10.GetSubjectCFrame(p51)
	-- upvalues: (copy) v_u_9
	local v52 = v_u_9.GetSubjectCFrame(p51)
	local v53 = workspace.CurrentCamera
	if v53 then
		v53 = v53.CameraSubject
	end
	if not v53 then
		return v52
	end
	if v53:IsA("Humanoid") then
		if v53:GetState() == Enum.HumanoidStateType.Dead then
			if v53 == p51.lastSubject then
				v52 = p51.lastSubjectCFrame
			end
		end
	end
	if v52 then
		p51.lastSubjectCFrame = v52
	end
	return v52
end
function v_u_10.GetSubjectPosition(p54)
	-- upvalues: (copy) v_u_9, (copy) v_u_1
	local v55 = v_u_9.GetSubjectPosition(p54)
	local v56 = game.Workspace.CurrentCamera
	if v56 then
		v56 = v56.CameraSubject
	end
	if not v56 then
		return nil
	end
	if v56:IsA("Humanoid") then
		if v56:GetState() == Enum.HumanoidStateType.Dead then
			if v56 == p54.lastSubject then
				v55 = p54.lastSubjectPosition
			end
		end
	elseif v56:IsA("VehicleSeat") then
		v55 = v56.CFrame.p + v56.CFrame:vectorToWorldSpace(v_u_1)
	end
	p54.lastSubjectPosition = v55
	return v55
end
return v_u_10
