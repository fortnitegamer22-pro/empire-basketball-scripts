-- decompiled by Sentinel (took 5.93071ms)
local v_u_1 = {}
v_u_1.__index = v_u_1
local v_u_2 = {
	"CameraMinZoomDistance", 
	"CameraMaxZoomDistance", 
	"CameraMode", 
	"DevCameraOcclusionMode", 
	"DevComputerCameraMode", 
	"DevTouchCameraMode", 
	"DevComputerMovementMode", 
	"DevTouchMovementMode", 
	"DevEnableMouseLock"
}
local v_u_3 = {
	"ComputerCameraMovementMode", 
	"ComputerMovementMode", 
	"ControlMode", 
	"GamepadCameraSensitivity", 
	"MouseSensitivity", 
	"RotationType", 
	"TouchCameraMovementMode", 
	"TouchMovementMode"
}
local v_u_4 = game:GetService("Players")
local v_u_5 = game:GetService("RunService")
local v_u_6 = game:GetService("UserInputService")
local v_u_7 = game:GetService("VRService")
local v_u_8 = UserSettings():GetService("UserGameSettings")
local v_u_9 = require(script:WaitForChild("CameraUtils"))
local v_u_10 = require(script:WaitForChild("CameraInput"))
local v_u_11 = require(script:WaitForChild("ClassicCamera"))
local v_u_12 = require(script:WaitForChild("OrbitalCamera"))
local v_u_13 = require(script:WaitForChild("LegacyCamera"))
local v_u_14 = require(script:WaitForChild("VehicleCamera"))
local v_u_15 = require(script:WaitForChild("VRCamera"))
local v_u_16 = require(script:WaitForChild("VRVehicleCamera"))
local v_u_17 = require(script:WaitForChild("Invisicam"))
local v_u_18 = require(script:WaitForChild("Poppercam"))
local v_u_19 = require(script:WaitForChild("TransparencyController"))
local v_u_20 = require(script:WaitForChild("MouseLockController"))
local v_u_21 = {}
local v_u_22 = {}
local v23 = v_u_4.LocalPlayer:WaitForChild("PlayerScripts")
v23:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default)
v23:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow)
v23:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic)
v23:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default)
v23:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow)
v23:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic)
v23:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle)
function v_u_1.new()
	-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_19, (copy) v_u_6, (copy) v_u_20, (copy) v_u_5, (copy) v_u_2, (copy) v_u_3, (copy) v_u_8
	local v_u_24 = setmetatable({}, v_u_1)
	v_u_24.activeCameraController = nil
	v_u_24.activeOcclusionModule = nil
	v_u_24.activeTransparencyController = nil
	v_u_24.activeMouseLockController = nil
	v_u_24.currentComputerCameraMovementMode = nil
	v_u_24.cameraSubjectChangedConn = nil
	v_u_24.cameraTypeChangedConn = nil
	for _, v25 in pairs(v_u_4:GetPlayers()) do
		v_u_24:OnPlayerAdded(v25)
	end
	v_u_4.PlayerAdded:Connect(function(p26)
		-- upvalues: (copy) v_u_24
		v_u_24:OnPlayerAdded(p26)
	end)
	v_u_24.activeTransparencyController = v_u_19.new()
	v_u_24.activeTransparencyController:Enable(true)
	if not v_u_6.TouchEnabled then
		v_u_24.activeMouseLockController = v_u_20.new()
		local v27 = v_u_24.activeMouseLockController:GetBindableToggleEvent()
		if v27 then
			v27:Connect(function()
				-- upvalues: (copy) v_u_24
				v_u_24:OnMouseLockToggled()
			end)
		end
	end
	v_u_24:ActivateCameraController(v_u_24:GetCameraControlChoice())
	v_u_24:ActivateOcclusionModule(v_u_4.LocalPlayer.DevCameraOcclusionMode)
	v_u_24:OnCurrentCameraChanged()
	v_u_5:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(p28)
		-- upvalues: (copy) v_u_24
		v_u_24:Update(p28)
	end)
	for _, v_u_29 in pairs(v_u_2) do
		v_u_4.LocalPlayer:GetPropertyChangedSignal(v_u_29):Connect(function()
			-- upvalues: (copy) v_u_24, (copy) v_u_29
			v_u_24:OnLocalPlayerCameraPropertyChanged(v_u_29)
		end)
	end
	for _, v_u_30 in pairs(v_u_3) do
		v_u_8:GetPropertyChangedSignal(v_u_30):Connect(function()
			-- upvalues: (copy) v_u_24, (copy) v_u_30
			v_u_24:OnUserGameSettingsPropertyChanged(v_u_30)
		end)
	end
	game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
		-- upvalues: (copy) v_u_24
		v_u_24:OnCurrentCameraChanged()
	end)
	return v_u_24
end
function v_u_1.GetCameraMovementModeFromSettings(_)
	-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_6, (copy) v_u_8
	if v_u_4.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
		return v_u_9.ConvertCameraModeEnumToStandard(Enum.ComputerCameraMovementMode.Classic)
	else
		local v31, v32
		if v_u_6.TouchEnabled then
			v31 = v_u_9.ConvertCameraModeEnumToStandard(v_u_4.LocalPlayer.DevTouchCameraMode)
			v32 = v_u_9.ConvertCameraModeEnumToStandard(v_u_8.TouchCameraMovementMode)
		else
			v31 = v_u_9.ConvertCameraModeEnumToStandard(v_u_4.LocalPlayer.DevComputerCameraMode)
			v32 = v_u_9.ConvertCameraModeEnumToStandard(v_u_8.ComputerCameraMovementMode)
		end
		if v31 == Enum.DevComputerCameraMovementMode.UserChoice then
			return v32
		else
			return v31
		end
	end
end
function v_u_1.ActivateOcclusionModule(p33, p34)
	-- upvalues: (copy) v_u_18, (copy) v_u_17, (copy) v_u_22, (copy) v_u_4
	local v35
	if p34 == Enum.DevCameraOcclusionMode.Zoom then
		v35 = v_u_18
	else
		if p34 ~= Enum.DevCameraOcclusionMode.Invisicam then
			warn("CameraScript ActivateOcclusionModule called with unsupported mode")
			return
		end
		v35 = v_u_17
	end
	p33.occlusionMode = p34
	if p33.activeOcclusionModule and p33.activeOcclusionModule:GetOcclusionMode() == p34 then
		if not p33.activeOcclusionModule:GetEnabled() then
			p33.activeOcclusionModule:Enable(true)
		end
	else
		local v36 = p33.activeOcclusionModule
		p33.activeOcclusionModule = v_u_22[v35]
		if not p33.activeOcclusionModule then
			p33.activeOcclusionModule = v35.new()
			if p33.activeOcclusionModule then
				v_u_22[v35] = p33.activeOcclusionModule
			end
		end
		if p33.activeOcclusionModule then
			if p33.activeOcclusionModule:GetOcclusionMode() ~= p34 then
				warn("CameraScript ActivateOcclusionModule mismatch: ", p33.activeOcclusionModule:GetOcclusionMode(), "~=", p34)
			end
			if v36 then
				if v36 == p33.activeOcclusionModule then
					warn("CameraScript ActivateOcclusionModule failure to detect already running correct module")
				else
					v36:Enable(false)
				end
			end
			if p34 == Enum.DevCameraOcclusionMode.Invisicam then
				if v_u_4.LocalPlayer.Character then
					p33.activeOcclusionModule:CharacterAdded(v_u_4.LocalPlayer.Character, v_u_4.LocalPlayer)
				end
			else
				for _, v37 in pairs(v_u_4:GetPlayers()) do
					if v37 and v37.Character then
						p33.activeOcclusionModule:CharacterAdded(v37.Character, v37)
					end
				end
				p33.activeOcclusionModule:OnCameraSubjectChanged(game.Workspace.CurrentCamera.CameraSubject)
			end
			p33.activeOcclusionModule:Enable(true)
		end
	end
end
function v_u_1.ShouldUseVehicleCamera(p38)
	local v39 = workspace.CurrentCamera
	if not v39 then
		return false
	end
	local v40 = v39.CameraType
	local v41 = v39.CameraSubject
	local v42 = v40 == Enum.CameraType.Custom and true or v40 == Enum.CameraType.Follow
	local v43 = v41 and v41:IsA("VehicleSeat") or false
	local v44 = p38.occlusionMode ~= Enum.DevCameraOcclusionMode.Invisicam
	if v43 then
		if not v42 then
			v44 = v42
		end
	else
		v44 = v43
	end
	return v44
end
function v_u_1.ActivateCameraController(p45, p46, p47)
	-- upvalues: (copy) v_u_13, (copy) v_u_7, (copy) v_u_15, (copy) v_u_11, (copy) v_u_12, (copy) v_u_16, (copy) v_u_14, (copy) v_u_21
	local v48 = nil
	if p47 ~= nil then
		if p47 == Enum.CameraType.Scriptable then
			if p45.activeCameraController then
				p45.activeCameraController:Enable(false)
				p45.activeCameraController = nil
			end
			return
		end
		if p47 == Enum.CameraType.Custom then
			p46 = p45:GetCameraMovementModeFromSettings()
		elseif p47 == Enum.CameraType.Track then
			p46 = Enum.ComputerCameraMovementMode.Classic
		elseif p47 == Enum.CameraType.Follow then
			p46 = Enum.ComputerCameraMovementMode.Follow
		elseif p47 == Enum.CameraType.Orbital then
			p46 = Enum.ComputerCameraMovementMode.Orbital
		elseif p47 == Enum.CameraType.Attach or p47 == Enum.CameraType.Watch or p47 == Enum.CameraType.Fixed then
			v48 = v_u_13
		else
			warn("CameraScript encountered an unhandled Camera.CameraType value: ", p47)
		end
	end
	if not v48 then
		if v_u_7.VREnabled then
			v48 = v_u_15
		elseif p46 == Enum.ComputerCameraMovementMode.Classic or p46 == Enum.ComputerCameraMovementMode.Follow or p46 == Enum.ComputerCameraMovementMode.Default or p46 == Enum.ComputerCameraMovementMode.CameraToggle then
			v48 = v_u_11
		else
			if p46 ~= Enum.ComputerCameraMovementMode.Orbital then
				warn("ActivateCameraController did not select a module.")
				return
			end
			v48 = v_u_12
		end
	end
	if p45:ShouldUseVehicleCamera() then
		if v_u_7.VREnabled then
			v48 = v_u_16
		else
			v48 = v_u_14
		end
	end
	local v49
	if v_u_21[v48] then
		v49 = v_u_21[v48]
		if v49.Reset then
			v49:Reset()
		end
	else
		v49 = v48.new()
		v_u_21[v48] = v49
	end
	if p45.activeCameraController then
		if p45.activeCameraController == v49 then
			if not p45.activeCameraController:GetEnabled() then
				p45.activeCameraController:Enable(true)
			end
		else
			p45.activeCameraController:Enable(false)
			p45.activeCameraController = v49
			p45.activeCameraController:Enable(true)
		end
	elseif v49 ~= nil then
		p45.activeCameraController = v49
		p45.activeCameraController:Enable(true)
	end
	if p45.activeCameraController then
		if p46 ~= nil then
			p45.activeCameraController:SetCameraMovementMode(p46)
			return
		end
		if p47 ~= nil then
			p45.activeCameraController:SetCameraType(p47)
		end
	end
end
function v_u_1.OnCameraSubjectChanged(p50)
	local v51 = workspace.CurrentCamera
	local v52
	if v51 then
		v52 = v51.CameraSubject
	else
		v52 = v51
	end
	if p50.activeTransparencyController then
		p50.activeTransparencyController:SetSubject(v52)
	end
	if p50.activeOcclusionModule then
		p50.activeOcclusionModule:OnCameraSubjectChanged(v52)
	end
	p50:ActivateCameraController(nil, v51.CameraType)
end
function v_u_1.OnCameraTypeChanged(p53, p54)
	-- upvalues: (copy) v_u_6, (copy) v_u_9
	if p54 == Enum.CameraType.Scriptable and v_u_6.MouseBehavior == Enum.MouseBehavior.LockCenter then
		v_u_9.restoreMouseBehavior()
	end
	p53:ActivateCameraController(nil, p54)
end
function v_u_1.OnCurrentCameraChanged(p_u_55)
	local v_u_56 = game.Workspace.CurrentCamera
	if v_u_56 then
		if p_u_55.cameraSubjectChangedConn then
			p_u_55.cameraSubjectChangedConn:Disconnect()
		end
		if p_u_55.cameraTypeChangedConn then
			p_u_55.cameraTypeChangedConn:Disconnect()
		end
		p_u_55.cameraSubjectChangedConn = v_u_56:GetPropertyChangedSignal("CameraSubject"):Connect(function()
			-- upvalues: (copy) p_u_55, (copy) v_u_56
			p_u_55:OnCameraSubjectChanged(v_u_56.CameraSubject)
		end)
		p_u_55.cameraTypeChangedConn = v_u_56:GetPropertyChangedSignal("CameraType"):Connect(function()
			-- upvalues: (copy) p_u_55, (copy) v_u_56
			p_u_55:OnCameraTypeChanged(v_u_56.CameraType)
		end)
		p_u_55:OnCameraSubjectChanged(v_u_56.CameraSubject)
		p_u_55:OnCameraTypeChanged(v_u_56.CameraType)
	end
end
function v_u_1.OnLocalPlayerCameraPropertyChanged(p57, p58)
	-- upvalues: (copy) v_u_4, (copy) v_u_9
	if p58 == "CameraMode" then
		if v_u_4.LocalPlayer.CameraMode ~= Enum.CameraMode.LockFirstPerson then
			if v_u_4.LocalPlayer.CameraMode == Enum.CameraMode.Classic then
				p57:ActivateCameraController(v_u_9.ConvertCameraModeEnumToStandard((p57:GetCameraMovementModeFromSettings())))
			else
				warn("Unhandled value for property player.CameraMode: ", v_u_4.LocalPlayer.CameraMode)
			end
		end
		if not p57.activeCameraController or p57.activeCameraController:GetModuleName() ~= "ClassicCamera" then
			p57:ActivateCameraController(v_u_9.ConvertCameraModeEnumToStandard(Enum.DevComputerCameraMovementMode.Classic))
		end
		if p57.activeCameraController then
			p57.activeCameraController:UpdateForDistancePropertyChange()
			return
		end
	else
		if p58 == "DevComputerCameraMode" or p58 == "DevTouchCameraMode" then
			p57:ActivateCameraController(v_u_9.ConvertCameraModeEnumToStandard((p57:GetCameraMovementModeFromSettings())))
			return
		end
		if p58 == "DevCameraOcclusionMode" then
			p57:ActivateOcclusionModule(v_u_4.LocalPlayer.DevCameraOcclusionMode)
			return
		end
		if p58 == "CameraMinZoomDistance" or p58 == "CameraMaxZoomDistance" then
			if p57.activeCameraController then
				p57.activeCameraController:UpdateForDistancePropertyChange()
				return
			end
		else
			if p58 == "DevTouchMovementMode" then
				return
			end
			if p58 == "DevComputerMovementMode" then
				return
			end
			local _ = p58 == "DevEnableMouseLock"
		end
	end
end
function v_u_1.OnUserGameSettingsPropertyChanged(p59, p60)
	-- upvalues: (copy) v_u_9
	if p60 == "ComputerCameraMovementMode" then
		p59:ActivateCameraController(v_u_9.ConvertCameraModeEnumToStandard((p59:GetCameraMovementModeFromSettings())))
	end
end
function v_u_1.Update(p61, p62)
	-- upvalues: (copy) v_u_10
	if p61.activeCameraController then
		p61.activeCameraController:UpdateMouseBehavior()
		local v63, v64 = p61.activeCameraController:Update(p62)
		if p61.activeOcclusionModule then
			v63, v64 = p61.activeOcclusionModule:Update(p62, v63, v64)
		end
		local v65 = game.Workspace.CurrentCamera
		v65.CFrame = v63
		v65.Focus = v64
		if p61.activeTransparencyController then
			p61.activeTransparencyController:Update(p62)
		end
		if v_u_10.getInputEnabled() then
			v_u_10.resetInputForFrameEnd()
		end
	end
end
function v_u_1.GetCameraControlChoice(_)
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_9, (copy) v_u_8
	local v66 = v_u_4.LocalPlayer
	if v66 then
		if v_u_6:GetLastInputType() == Enum.UserInputType.Touch or v_u_6.TouchEnabled then
			if v66.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
				return v_u_9.ConvertCameraModeEnumToStandard(v_u_8.TouchCameraMovementMode)
			else
				return v_u_9.ConvertCameraModeEnumToStandard(v66.DevTouchCameraMode)
			end
		elseif v66.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice then
			return v_u_9.ConvertCameraModeEnumToStandard((v_u_9.ConvertCameraModeEnumToStandard(v_u_8.ComputerCameraMovementMode)))
		else
			return v_u_9.ConvertCameraModeEnumToStandard(v66.DevComputerCameraMode)
		end
	else
		return
	end
end
function v_u_1.OnCharacterAdded(p67, p68, p69)
	if p67.activeOcclusionModule then
		p67.activeOcclusionModule:CharacterAdded(p68, p69)
	end
end
function v_u_1.OnCharacterRemoving(p70, p71, p72)
	if p70.activeOcclusionModule then
		p70.activeOcclusionModule:CharacterRemoving(p71, p72)
	end
end
function v_u_1.OnPlayerAdded(p_u_73, p_u_74)
	p_u_74.CharacterAdded:Connect(function(p75)
		-- upvalues: (copy) p_u_73, (copy) p_u_74
		p_u_73:OnCharacterAdded(p75, p_u_74)
	end)
	p_u_74.CharacterRemoving:Connect(function(p76)
		-- upvalues: (copy) p_u_73, (copy) p_u_74
		p_u_73:OnCharacterRemoving(p76, p_u_74)
	end)
end
function v_u_1.OnMouseLockToggled(p77)
	if p77.activeMouseLockController then
		local v78 = p77.activeMouseLockController:GetIsMouseLocked()
		local v79 = p77.activeMouseLockController:GetMouseLockOffset()
		if p77.activeCameraController then
			p77.activeCameraController:SetIsMouseLocked(v78)
			p77.activeCameraController:SetMouseLockOffset(v79)
		end
	end
end
v_u_1.new()
return {}
