-- decompiled by Sentinel (took 9.370702ms)
local v_u_1 = Vector3.new(0, 0, 1)
local v_u_2 = Vector3.new(1, 0, 1)
Vector2.new(0.2617993877991494, 0)
Vector2.new(0.7853981633974483, 0)
Vector2.new(0, 0)
local v_u_3 = Vector3.new(0, 0, 0)
local v_u_4 = Vector3.new(0, 5, 0)
Vector3.new(0, 4, 0)
local v_u_5 = Vector3.new(0, 1.5, 0)
local v_u_6 = Vector3.new(0, 1.5, 0)
local v_u_7 = Vector3.new(0, 2, 0)
local v_u_8 = Vector3.new(2, 2, 1)
local v_u_9 = require(script.Parent:WaitForChild("CameraUtils"))
local v_u_10 = require(script.Parent:WaitForChild("ZoomController"))
local v_u_11 = require(script.Parent:WaitForChild("CameraToggleStateController"))
local v_u_12 = require(script.Parent:WaitForChild("CameraInput"))
local v_u_13 = require(script.Parent:WaitForChild("CameraUI"))
local v_u_14 = game:GetService("UserInputService")
game:GetService("StarterGui")
local v_u_15 = game:GetService("VRService")
local v_u_16 = UserSettings():GetService("UserGameSettings")
local v_u_17 = game:GetService("Players").LocalPlayer
local v18, v19 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserCameraGamepadZoomFix")
end)
local v_u_20 = v18 and v19
local v_u_21 = {}
v_u_21.__index = v_u_21
function v_u_21.new()
	-- upvalues: (copy) v_u_21, (copy) v_u_17, (copy) v_u_3, (copy) v_u_16
	local v_u_22 = setmetatable({}, v_u_21)
	v_u_22.FIRST_PERSON_DISTANCE_THRESHOLD = 1
	v_u_22.cameraType = nil
	v_u_22.cameraMovementMode = nil
	v_u_22.lastCameraTransform = nil
	v_u_22.lastUserPanCamera = tick()
	v_u_22.humanoidRootPart = nil
	v_u_22.humanoidCache = {}
	v_u_22.lastSubject = nil
	v_u_22.lastSubjectPosition = Vector3.new(0, 5, 0)
	v_u_22.lastSubjectCFrame = CFrame.new(v_u_22.lastSubjectPosition)
	v_u_22.defaultSubjectDistance = math.clamp(12.5, v_u_17.CameraMinZoomDistance, v_u_17.CameraMaxZoomDistance)
	v_u_22.currentSubjectDistance = math.clamp(12.5, v_u_17.CameraMinZoomDistance, v_u_17.CameraMaxZoomDistance)
	v_u_22.inFirstPerson = false
	v_u_22.inMouseLockedMode = false
	v_u_22.portraitMode = false
	v_u_22.isSmallTouchScreen = false
	v_u_22.resetCameraAngle = true
	v_u_22.enabled = false
	v_u_22.PlayerGui = nil
	v_u_22.cameraChangedConn = nil
	v_u_22.viewportSizeChangedConn = nil
	v_u_22.shouldUseVRRotation = false
	v_u_22.VRRotationIntensityAvailable = false
	v_u_22.lastVRRotationIntensityCheckTime = 0
	v_u_22.lastVRRotationTime = 0
	v_u_22.vrRotateKeyCooldown = {}
	v_u_22.cameraTranslationConstraints = Vector3.new(1, 1, 1)
	v_u_22.humanoidJumpOrigin = nil
	v_u_22.trackingHumanoid = nil
	v_u_22.cameraFrozen = false
	v_u_22.subjectStateChangedConn = nil
	v_u_22.gamepadZoomPressConnection = nil
	v_u_22.mouseLockOffset = v_u_3
	if v_u_17.Character then
		v_u_22:OnCharacterAdded(v_u_17.Character)
	end
	v_u_17.CharacterAdded:Connect(function(p23)
		-- upvalues: (copy) v_u_22
		v_u_22:OnCharacterAdded(p23)
	end)
	if v_u_22.cameraChangedConn then
		v_u_22.cameraChangedConn:Disconnect()
	end
	v_u_22.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		-- upvalues: (copy) v_u_22
		v_u_22:OnCurrentCameraChanged()
	end)
	v_u_22:OnCurrentCameraChanged()
	if v_u_22.playerCameraModeChangeConn then
		v_u_22.playerCameraModeChangeConn:Disconnect()
	end
	v_u_22.playerCameraModeChangeConn = v_u_17:GetPropertyChangedSignal("CameraMode"):Connect(function()
		-- upvalues: (copy) v_u_22
		v_u_22:OnPlayerCameraPropertyChange()
	end)
	if v_u_22.minDistanceChangeConn then
		v_u_22.minDistanceChangeConn:Disconnect()
	end
	v_u_22.minDistanceChangeConn = v_u_17:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function()
		-- upvalues: (copy) v_u_22
		v_u_22:OnPlayerCameraPropertyChange()
	end)
	if v_u_22.maxDistanceChangeConn then
		v_u_22.maxDistanceChangeConn:Disconnect()
	end
	v_u_22.maxDistanceChangeConn = v_u_17:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function()
		-- upvalues: (copy) v_u_22
		v_u_22:OnPlayerCameraPropertyChange()
	end)
	if v_u_22.playerDevTouchMoveModeChangeConn then
		v_u_22.playerDevTouchMoveModeChangeConn:Disconnect()
	end
	v_u_22.playerDevTouchMoveModeChangeConn = v_u_17:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function()
		-- upvalues: (copy) v_u_22
		v_u_22:OnDevTouchMovementModeChanged()
	end)
	v_u_22:OnDevTouchMovementModeChanged()
	if v_u_22.gameSettingsTouchMoveMoveChangeConn then
		v_u_22.gameSettingsTouchMoveMoveChangeConn:Disconnect()
	end
	v_u_22.gameSettingsTouchMoveMoveChangeConn = v_u_16:GetPropertyChangedSignal("TouchMovementMode"):Connect(function()
		-- upvalues: (copy) v_u_22
		v_u_22:OnGameSettingsTouchMovementModeChanged()
	end)
	v_u_22:OnGameSettingsTouchMovementModeChanged()
	v_u_16:SetCameraYInvertVisible()
	v_u_16:SetGamepadCameraSensitivityVisible()
	v_u_22.hasGameLoaded = game:IsLoaded()
	if not v_u_22.hasGameLoaded then
		v_u_22.gameLoadedConn = game.Loaded:Connect(function()
			-- upvalues: (copy) v_u_22
			v_u_22.hasGameLoaded = true
			v_u_22.gameLoadedConn:Disconnect()
			v_u_22.gameLoadedConn = nil
		end)
	end
	v_u_22:OnPlayerCameraPropertyChange()
	return v_u_22
end
function v_u_21.GetModuleName(_)
	return "BaseCamera"
end
function v_u_21.OnCharacterAdded(p_u_24, p25)
	-- upvalues: (copy) v_u_14, (copy) v_u_17
	p_u_24.resetCameraAngle = p_u_24.resetCameraAngle or p_u_24:GetEnabled()
	p_u_24.humanoidRootPart = nil
	if v_u_14.TouchEnabled then
		p_u_24.PlayerGui = v_u_17:WaitForChild("PlayerGui")
		for _, v26 in ipairs(p25:GetChildren()) do
			if v26:IsA("Tool") then
				p_u_24.isAToolEquipped = true
			end
		end
		p25.ChildAdded:Connect(function(p27)
			-- upvalues: (copy) p_u_24
			if p27:IsA("Tool") then
				p_u_24.isAToolEquipped = true
			end
		end)
		p25.ChildRemoved:Connect(function(p28)
			-- upvalues: (copy) p_u_24
			if p28:IsA("Tool") then
				p_u_24.isAToolEquipped = false
			end
		end)
	end
end
function v_u_21.GetHumanoidRootPart(p29)
	-- upvalues: (copy) v_u_17
	local v30 = not p29.humanoidRootPart and v_u_17.Character and v_u_17.Character:FindFirstChildOfClass("Humanoid")
	if v30 then
		p29.humanoidRootPart = v30.RootPart
	end
	return p29.humanoidRootPart
end
function v_u_21.GetBodyPartToFollow(_, p31, _)
	if p31:GetState() == Enum.HumanoidStateType.Dead then
		local v32 = p31.Parent
		if v32 and v32:IsA("Model") then
			return v32:FindFirstChild("Head") or p31.RootPart
		end
	end
	return p31.RootPart
end
function v_u_21.GetSubjectCFrame(p33)
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_7, (copy) v_u_5, (copy) v_u_3
	local v34 = p33.lastSubjectCFrame
	local v35 = workspace.CurrentCamera
	if v35 then
		v35 = v35.CameraSubject
	end
	if not v35 then
		return v34
	end
	if v35:IsA("Humanoid") then
		local v36 = v35:GetState() == Enum.HumanoidStateType.Dead
		local v37 = v35.RootPart
		if v36 then
			if v35.Parent then
				if v35.Parent:IsA("Model") then
					v37 = v35.Parent:FindFirstChild("Head") or v37
				end
			end
		end
		if v37 then
			if v37:IsA("BasePart") then
				local v38
				if v35.RigType == Enum.HumanoidRigType.R15 then
					if v35.AutomaticScalingEnabled then
						v38 = v_u_6
						local v39 = v35.RootPart
						if v37 == v39 then
							v38 = v38 + Vector3.new(0, (v39.Size.Y - v_u_8.Y) / 2, 0)
						end
					else
						v38 = v_u_7
					end
				else
					v38 = v_u_5
				end
				if v36 then
					v38 = v_u_3
				end
				v34 = v37.CFrame * CFrame.new(v38 + v35.CameraOffset)
			end
		end
	elseif v35:IsA("BasePart") then
		v34 = v35.CFrame
	elseif v35:IsA("Model") then
		if v35.PrimaryPart then
			v34 = v35:GetPrimaryPartCFrame()
		else
			v34 = CFrame.new()
		end
	end
	if v34 then
		p33.lastSubjectCFrame = v34
	end
	return v34
end
function v_u_21.GetSubjectVelocity(_)
	-- upvalues: (copy) v_u_3
	local v40 = workspace.CurrentCamera
	if v40 then
		v40 = v40.CameraSubject
	end
	if not v40 then
		return v_u_3
	end
	if v40:IsA("BasePart") then
		return v40.Velocity
	end
	if v40:IsA("Humanoid") then
		local v41 = v40.RootPart
		if v41 then
			return v41.Velocity
		end
	else
		local v42 = v40:IsA("Model") and v40.PrimaryPart
		if v42 then
			return v42.Velocity
		end
	end
	return v_u_3
end
function v_u_21.GetSubjectRotVelocity(_)
	-- upvalues: (copy) v_u_3
	local v43 = workspace.CurrentCamera
	if v43 then
		v43 = v43.CameraSubject
	end
	if not v43 then
		return v_u_3
	end
	if v43:IsA("BasePart") then
		return v43.RotVelocity
	end
	if v43:IsA("Humanoid") then
		local v44 = v43.RootPart
		if v44 then
			return v44.RotVelocity
		end
	else
		local v45 = v43:IsA("Model") and v43.PrimaryPart
		if v45 then
			return v45.RotVelocity
		end
	end
	return v_u_3
end
function v_u_21.StepZoom(p46)
	-- upvalues: (copy) v_u_12, (copy) v_u_10
	local v47 = p46.currentSubjectDistance
	local v48 = v_u_12.getZoomDelta()
	if 0 < math.abs(v48) then
		local v49
		if 0 < v48 then
			v49 = math.max(v47 + v48 * (1 + v47 * 0.5), p46.FIRST_PERSON_DISTANCE_THRESHOLD)
		else
			v49 = math.max((v47 + v48) / (1 - v48 * 0.5), 0.5)
		end
		p46:SetCameraToSubjectDistance(v49 < p46.FIRST_PERSON_DISTANCE_THRESHOLD and 0.5 or v49)
	end
	return v_u_10.GetZoomRadius()
end
function v_u_21.GetSubjectPosition(p50)
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_7, (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
	local v51 = p50.lastSubjectPosition
	local v52 = game.Workspace.CurrentCamera
	if v52 then
		v52 = v52.CameraSubject
	end
	if not v52 then
		return nil
	end
	if v52:IsA("Humanoid") then
		local v53 = v52:GetState() == Enum.HumanoidStateType.Dead
		local v54 = v52.RootPart
		if v53 then
			if v52.Parent then
				if v52.Parent:IsA("Model") then
					v54 = v52.Parent:FindFirstChild("Head") or v54
				end
			end
		end
		if v54 then
			if v54:IsA("BasePart") then
				local v55
				if v52.RigType == Enum.HumanoidRigType.R15 then
					if v52.AutomaticScalingEnabled then
						v55 = v_u_6
						if v54 == v52.RootPart then
							v55 = v55 + Vector3.new(0, v52.RootPart.Size.Y / 2 - v_u_8.Y / 2, 0)
						end
					else
						v55 = v_u_7
					end
				else
					v55 = v_u_5
				end
				if v53 then
					v55 = v_u_3
				end
				v51 = v54.CFrame.p + v54.CFrame:vectorToWorldSpace(v55 + v52.CameraOffset)
			end
		end
	elseif v52:IsA("VehicleSeat") then
		v51 = v52.CFrame.p + v52.CFrame:vectorToWorldSpace(v_u_4)
	elseif v52:IsA("SkateboardPlatform") then
		v51 = v52.CFrame.p + v_u_4
	elseif v52:IsA("BasePart") then
		v51 = v52.CFrame.p
	elseif v52:IsA("Model") then
		if v52.PrimaryPart then
			v51 = v52:GetPrimaryPartCFrame().p
		else
			v51 = v52:GetModelCFrame().p
		end
	end
	p50.lastSubject = v52
	p50.lastSubjectPosition = v51
	return v51
end
function v_u_21.UpdateDefaultSubjectDistance(p56)
	-- upvalues: (copy) v_u_17
	if p56.portraitMode then
		p56.defaultSubjectDistance = math.clamp(25, v_u_17.CameraMinZoomDistance, v_u_17.CameraMaxZoomDistance)
	else
		p56.defaultSubjectDistance = math.clamp(12.5, v_u_17.CameraMinZoomDistance, v_u_17.CameraMaxZoomDistance)
	end
end
function v_u_21.OnViewportSizeChanged(p57)
	-- upvalues: (copy) v_u_14
	local v58 = game.Workspace.CurrentCamera.ViewportSize
	p57.portraitMode = v58.X < v58.Y
	local v59 = v_u_14.TouchEnabled
	if v59 then
		v59 = v58.Y < 500 and true or v58.X < 700
	end
	p57.isSmallTouchScreen = v59
	p57:UpdateDefaultSubjectDistance()
end
function v_u_21.OnCurrentCameraChanged(p_u_60)
	-- upvalues: (copy) v_u_14
	if v_u_14.TouchEnabled then
		if p_u_60.viewportSizeChangedConn then
			p_u_60.viewportSizeChangedConn:Disconnect()
			p_u_60.viewportSizeChangedConn = nil
		end
		local v61 = game.Workspace.CurrentCamera
		if v61 then
			p_u_60:OnViewportSizeChanged()
			p_u_60.viewportSizeChangedConn = v61:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				-- upvalues: (copy) p_u_60
				p_u_60:OnViewportSizeChanged()
			end)
		end
	end
	if p_u_60.cameraSubjectChangedConn then
		p_u_60.cameraSubjectChangedConn:Disconnect()
		p_u_60.cameraSubjectChangedConn = nil
	end
	local v62 = game.Workspace.CurrentCamera
	if v62 then
		p_u_60.cameraSubjectChangedConn = v62:GetPropertyChangedSignal("CameraSubject"):Connect(function()
			-- upvalues: (copy) p_u_60
			p_u_60:OnNewCameraSubject()
		end)
		p_u_60:OnNewCameraSubject()
	end
end
function v_u_21.OnDynamicThumbstickEnabled(p63)
	-- upvalues: (copy) v_u_14
	if v_u_14.TouchEnabled then
		p63.isDynamicThumbstickEnabled = true
	end
end
function v_u_21.OnDynamicThumbstickDisabled(p64)
	p64.isDynamicThumbstickEnabled = false
end
function v_u_21.OnGameSettingsTouchMovementModeChanged(p65)
	-- upvalues: (copy) v_u_17, (copy) v_u_16
	if v_u_17.DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice then
		if v_u_16.TouchMovementMode == Enum.TouchMovementMode.DynamicThumbstick or v_u_16.TouchMovementMode == Enum.TouchMovementMode.Default then
			p65:OnDynamicThumbstickEnabled()
			return
		end
		p65:OnDynamicThumbstickDisabled()
	end
end
function v_u_21.OnDevTouchMovementModeChanged(p66)
	-- upvalues: (copy) v_u_17
	if v_u_17.DevTouchMovementMode == Enum.DevTouchMovementMode.DynamicThumbstick then
		p66:OnDynamicThumbstickEnabled()
	else
		p66:OnGameSettingsTouchMovementModeChanged()
	end
end
function v_u_21.OnPlayerCameraPropertyChange(p67)
	p67:SetCameraToSubjectDistance(p67.currentSubjectDistance)
end
function v_u_21.InputTranslationToCameraAngleChange(_, p68, p69)
	return p68 * p69
end
function v_u_21.GamepadZoomPress(p70)
	-- upvalues: (ref) v_u_20, (copy) v_u_17
	local v71 = p70:GetCameraToSubjectDistance()
	if v_u_20 then
		local v72 = v_u_17.CameraMinZoomDistance
		local v73 = v_u_17.CameraMaxZoomDistance
		local v74 = 0.5 >= v72 and 0 or v72
		local v75 = v74 + 10
		local v76 = v75 + 10
		if v73 < v76 then
			v75 = v74 + (v73 - v74) / 2
		else
			v73 = v76
		end
		if (v75 + v73) / 2 < v71 then
			p70:SetCameraToSubjectDistance(v75)
			return
		elseif (v74 + v75) / 2 < v71 then
			p70:SetCameraToSubjectDistance(v74)
		else
			p70:SetCameraToSubjectDistance(v73)
		end
	elseif 15 < v71 then
		p70:SetCameraToSubjectDistance(10)
		return
	elseif 5 < v71 then
		p70:SetCameraToSubjectDistance(0)
	else
		p70:SetCameraToSubjectDistance(20)
	end
end
function v_u_21.Enable(p_u_77, p78)
	-- upvalues: (copy) v_u_12, (copy) v_u_17
	if p_u_77.enabled ~= p78 then
		p_u_77.enabled = p78
		if p_u_77.enabled then
			v_u_12.setInputEnabled(true)
			p_u_77.gamepadZoomPressConnection = v_u_12.gamepadZoomPress:Connect(function()
				-- upvalues: (copy) p_u_77
				p_u_77:GamepadZoomPress()
			end)
			if v_u_17.CameraMode == Enum.CameraMode.LockFirstPerson then
				p_u_77.currentSubjectDistance = 0.5
				if not p_u_77.inFirstPerson then
					p_u_77:EnterFirstPerson()
				end
			end
		else
			v_u_12.setInputEnabled(false)
			if p_u_77.gamepadZoomPressConnection then
				p_u_77.gamepadZoomPressConnection:Disconnect()
				p_u_77.gamepadZoomPressConnection = nil
			end
			p_u_77:Cleanup()
		end
		p_u_77:OnEnable(p78)
	end
end
function v_u_21.OnEnable(_, _) end
function v_u_21.GetEnabled(p79)
	return p79.enabled
end
function v_u_21.Cleanup(p80)
	-- upvalues: (copy) v_u_9
	if p80.subjectStateChangedConn then
		p80.subjectStateChangedConn:Disconnect()
		p80.subjectStateChangedConn = nil
	end
	if p80.viewportSizeChangedConn then
		p80.viewportSizeChangedConn:Disconnect()
		p80.viewportSizeChangedConn = nil
	end
	p80.lastCameraTransform = nil
	p80.lastSubjectCFrame = nil
	v_u_9.restoreMouseBehavior()
end
function v_u_21.UpdateMouseBehavior(p81)
	-- upvalues: (copy) v_u_16, (copy) v_u_13, (copy) v_u_12, (copy) v_u_11, (copy) v_u_9
	if p81.isCameraToggle and v_u_16.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove == false then
		v_u_13.setCameraModeToastEnabled(true)
		v_u_12.enableCameraToggleInput()
		v_u_11(p81.inFirstPerson)
		return
	else
		v_u_13.setCameraModeToastEnabled(false)
		v_u_12.disableCameraToggleInput()
		if p81.inFirstPerson or p81.inMouseLockedMode then
			v_u_9.setRotationTypeOverride(Enum.RotationType.CameraRelative)
			v_u_9.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter)
			return
		else
			v_u_9.restoreRotationType()
			if v_u_12.getRotationActivated() then
				v_u_9.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition)
			else
				v_u_9.restoreMouseBehavior()
			end
		end
	end
end
function v_u_21.UpdateForDistancePropertyChange(p82)
	p82:SetCameraToSubjectDistance(p82.currentSubjectDistance)
end
function v_u_21.SetCameraToSubjectDistance(p83, p84)
	-- upvalues: (copy) v_u_17, (copy) v_u_10
	local v85 = p83.currentSubjectDistance
	if v_u_17.CameraMode == Enum.CameraMode.LockFirstPerson then
		p83.currentSubjectDistance = 0.5
		if not p83.inFirstPerson then
			p83:EnterFirstPerson()
		end
	else
		local v86 = math.clamp(p84, v_u_17.CameraMinZoomDistance, v_u_17.CameraMaxZoomDistance)
		if v86 < 1 then
			p83.currentSubjectDistance = 0.5
			if not p83.inFirstPerson then
				p83:EnterFirstPerson()
			end
		else
			p83.currentSubjectDistance = v86
			if p83.inFirstPerson then
				p83:LeaveFirstPerson()
			end
		end
	end
	v_u_10.SetZoomParameters(p83.currentSubjectDistance, (math.sign(p84 - v85)))
	return p83.currentSubjectDistance
end
function v_u_21.SetCameraType(p87, p88)
	p87.cameraType = p88
end
function v_u_21.GetCameraType(p89)
	return p89.cameraType
end
function v_u_21.SetCameraMovementMode(p90, p91)
	p90.cameraMovementMode = p91
end
function v_u_21.GetCameraMovementMode(p92)
	return p92.cameraMovementMode
end
function v_u_21.SetIsMouseLocked(p93, p94)
	p93.inMouseLockedMode = p94
end
function v_u_21.GetIsMouseLocked(p95)
	return p95.inMouseLockedMode
end
function v_u_21.SetMouseLockOffset(p96, p97)
	p96.mouseLockOffset = p97
end
function v_u_21.GetMouseLockOffset(p98)
	return p98.mouseLockOffset
end
function v_u_21.InFirstPerson(p99)
	return p99.inFirstPerson
end
function v_u_21.EnterFirstPerson(_) end
function v_u_21.LeaveFirstPerson(_) end
function v_u_21.GetCameraToSubjectDistance(p100)
	return p100.currentSubjectDistance
end
function v_u_21.GetMeasuredDistanceToFocus(_)
	local v101 = game.Workspace.CurrentCamera
	if v101 then
		return (v101.CoordinateFrame.p - v101.Focus.p).magnitude
	else
		return nil
	end
end
function v_u_21.GetCameraLookVector(_)
	-- upvalues: (copy) v_u_1
	return game.Workspace.CurrentCamera and game.Workspace.CurrentCamera.CFrame.LookVector or v_u_1
end
function v_u_21.CalculateNewLookCFrameFromArg(p102, p103, p104)
	-- upvalues: (copy) v_u_3
	local v105 = p103 or p102:GetCameraLookVector()
	local v106 = math.asin(v105.Y)
	local v107 = Vector2.new(p104.X, (math.clamp(p104.Y, -1.3962634015954636 + v106, 1.3962634015954636 + v106)))
	return CFrame.Angles(0, -v107.X, 0) * CFrame.new(v_u_3, v105) * CFrame.Angles(-v107.Y, 0, 0)
end
function v_u_21.CalculateNewLookVectorFromArg(p108, p109, p110)
	return p108:CalculateNewLookCFrameFromArg(p109, p110).LookVector
end
function v_u_21.CalculateNewLookVectorVRFromArg(p111, p112)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v113 = Vector2.new(p112.X, 0)
	return ((CFrame.Angles(0, -v113.X, 0) * CFrame.new(v_u_3, ((p111:GetSubjectPosition() - game.Workspace.CurrentCamera.CFrame.p) * v_u_2).unit) * CFrame.Angles(-v113.Y, 0, 0)).LookVector * v_u_2).unit
end
function v_u_21.GetHumanoid(p114)
	-- upvalues: (copy) v_u_17
	local v115 = v_u_17
	if v115 then
		v115 = v_u_17.Character
	end
	if not v115 then
		return nil
	end
	local v116 = p114.humanoidCache[v_u_17]
	if v116 and v116.Parent == v115 then
		return v116
	end
	p114.humanoidCache[v_u_17] = nil
	local v117 = v115:FindFirstChildOfClass("Humanoid")
	if v117 then
		p114.humanoidCache[v_u_17] = v117
	end
	return v117
end
function v_u_21.GetHumanoidPartToFollow(_, p118, p119)
	if p119 == Enum.HumanoidStateType.Dead then
		local v120 = p118.Parent
		if v120 then
			return v120:FindFirstChild("Head") or p118.Torso
		else
			return p118.Torso
		end
	else
		return p118.Torso
	end
end
function v_u_21.OnNewCameraSubject(p121)
	if p121.subjectStateChangedConn then
		p121.subjectStateChangedConn:Disconnect()
		p121.subjectStateChangedConn = nil
	end
end
function v_u_21.IsInFirstPerson(p122)
	return p122.inFirstPerson
end
function v_u_21.Update(_, _)
	error("BaseCamera:Update() This is a virtual function that should never be getting called.", 2)
end
function v_u_21.GetCameraHeight(p123)
	-- upvalues: (copy) v_u_15
	return (not v_u_15.VREnabled or p123.inFirstPerson) and 0 or 0.25881904510252074 * p123.currentSubjectDistance
end
return v_u_21
