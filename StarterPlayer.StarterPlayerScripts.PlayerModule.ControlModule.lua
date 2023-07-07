-- decompiled by Sentinel (took 6.026031ms)
local v_u_1 = {}
v_u_1.__index = v_u_1
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("UserInputService")
local v_u_5 = game:GetService("GuiService")
local v_u_6 = game:GetService("Workspace")
local v_u_7 = UserSettings():GetService("UserGameSettings")
local v_u_8 = game:GetService("VRService")
local v_u_9 = require(script:WaitForChild("Keyboard"))
local v_u_10 = require(script:WaitForChild("Gamepad"))
local v_u_11 = require(script:WaitForChild("DynamicThumbstick"))
local v12, v13 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserHideControlsWhenMenuOpen")
end)
local v_u_14 = v12 and v13
local v15, v16 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate")
end)
local v_u_17 = v15 and v16
local v_u_18 = require(script:WaitForChild("TouchThumbstick"))
local v_u_19 = require(script:WaitForChild("ClickToMoveController"))
local v_u_20 = require(script:WaitForChild("TouchJump"))
local v_u_21 = require(script:WaitForChild("VehicleController"))
local v_u_22 = Enum.ContextActionPriority.Medium.Value
local v_u_23 = {
	[Enum.TouchMovementMode.DPad] = v_u_11, 
	[Enum.DevTouchMovementMode.DPad] = v_u_11, 
	[Enum.TouchMovementMode.Thumbpad] = v_u_11, 
	[Enum.DevTouchMovementMode.Thumbpad] = v_u_11, 
	[Enum.TouchMovementMode.Thumbstick] = v_u_18, 
	[Enum.DevTouchMovementMode.Thumbstick] = v_u_18, 
	[Enum.TouchMovementMode.DynamicThumbstick] = v_u_11, 
	[Enum.DevTouchMovementMode.DynamicThumbstick] = v_u_11, 
	[Enum.TouchMovementMode.ClickToMove] = v_u_19, 
	[Enum.DevTouchMovementMode.ClickToMove] = v_u_19, 
	[Enum.TouchMovementMode.Default] = v_u_11, 
	[Enum.ComputerMovementMode.Default] = v_u_9, 
	[Enum.ComputerMovementMode.KeyboardMouse] = v_u_9, 
	[Enum.DevComputerMovementMode.KeyboardMouse] = v_u_9, 
	[Enum.DevComputerMovementMode.Scriptable] = nil, 
	[Enum.ComputerMovementMode.ClickToMove] = v_u_19, 
	[Enum.DevComputerMovementMode.ClickToMove] = v_u_19
}
local v_u_24 = {
	[Enum.UserInputType.Keyboard] = v_u_9, 
	[Enum.UserInputType.MouseButton1] = v_u_9, 
	[Enum.UserInputType.MouseButton2] = v_u_9, 
	[Enum.UserInputType.MouseButton3] = v_u_9, 
	[Enum.UserInputType.MouseWheel] = v_u_9, 
	[Enum.UserInputType.MouseMovement] = v_u_9, 
	[Enum.UserInputType.Gamepad1] = v_u_10, 
	[Enum.UserInputType.Gamepad2] = v_u_10, 
	[Enum.UserInputType.Gamepad3] = v_u_10, 
	[Enum.UserInputType.Gamepad4] = v_u_10
}
local v_u_25 = nil
function v_u_1.new()
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (ref) v_u_14, (copy) v_u_5, (copy) v_u_21, (copy) v_u_22, (copy) v_u_3, (copy) v_u_4, (copy) v_u_7
	local v_u_26 = setmetatable({}, v_u_1)
	v_u_26.controllers = {}
	v_u_26.activeControlModule = nil
	v_u_26.activeController = nil
	v_u_26.touchJumpController = nil
	v_u_26.moveFunction = v_u_2.LocalPlayer.Move
	v_u_26.humanoid = nil
	v_u_26.lastInputType = Enum.UserInputType.None
	v_u_26.controlsEnabled = true
	v_u_26.humanoidSeatedConn = nil
	v_u_26.vehicleController = nil
	v_u_26.touchControlFrame = nil
	if v_u_14 then
		v_u_5.MenuOpened:Connect(function()
			-- upvalues: (copy) v_u_26
			if v_u_26.touchControlFrame and v_u_26.touchControlFrame.Visible then
				v_u_26.touchControlFrame.Visible = false
			end
		end)
		v_u_5.MenuClosed:Connect(function()
			-- upvalues: (copy) v_u_26
			if v_u_26.touchControlFrame then
				v_u_26.touchControlFrame.Visible = true
			end
		end)
	end
	v_u_26.vehicleController = v_u_21.new(v_u_22)
	v_u_2.LocalPlayer.CharacterAdded:Connect(function(p27)
		-- upvalues: (copy) v_u_26
		v_u_26:OnCharacterAdded(p27)
	end)
	v_u_2.LocalPlayer.CharacterRemoving:Connect(function(p28)
		-- upvalues: (copy) v_u_26
		v_u_26:OnCharacterRemoving(p28)
	end)
	if v_u_2.LocalPlayer.Character then
		v_u_26:OnCharacterAdded(v_u_2.LocalPlayer.Character)
	end
	v_u_3:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(p29)
		-- upvalues: (copy) v_u_26
		v_u_26:OnRenderStepped(p29)
	end)
	v_u_4.LastInputTypeChanged:Connect(function(p30)
		-- upvalues: (copy) v_u_26
		v_u_26:OnLastInputTypeChanged(p30)
	end)
	v_u_7:GetPropertyChangedSignal("TouchMovementMode"):Connect(function()
		-- upvalues: (copy) v_u_26
		v_u_26:OnTouchMovementModeChange()
	end)
	v_u_2.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function()
		-- upvalues: (copy) v_u_26
		v_u_26:OnTouchMovementModeChange()
	end)
	v_u_7:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function()
		-- upvalues: (copy) v_u_26
		v_u_26:OnComputerMovementModeChange()
	end)
	v_u_2.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function()
		-- upvalues: (copy) v_u_26
		v_u_26:OnComputerMovementModeChange()
	end)
	v_u_26.playerGui = nil
	v_u_26.touchGui = nil
	v_u_26.playerGuiAddedConn = nil
	v_u_5:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function()
		-- upvalues: (copy) v_u_26
		v_u_26:UpdateTouchGuiVisibility()
		v_u_26:UpdateActiveControlModuleEnabled()
	end)
	if not v_u_4.TouchEnabled then
		v_u_26:OnLastInputTypeChanged(v_u_4:GetLastInputType())
		return v_u_26
	end
	v_u_26.playerGui = v_u_2.LocalPlayer:FindFirstChildOfClass("PlayerGui")
	if not v_u_26.playerGui then
		v_u_26.playerGuiAddedConn = v_u_2.LocalPlayer.ChildAdded:Connect(function(p31)
			-- upvalues: (copy) v_u_26, (ref) v_u_4
			if p31:IsA("PlayerGui") then
				v_u_26.playerGui = p31
				v_u_26:CreateTouchGuiContainer()
				v_u_26.playerGuiAddedConn:Disconnect()
				v_u_26.playerGuiAddedConn = nil
				v_u_26:OnLastInputTypeChanged(v_u_4:GetLastInputType())
			end
		end)
		return v_u_26
	end
	v_u_26:CreateTouchGuiContainer()
	v_u_26:OnLastInputTypeChanged(v_u_4:GetLastInputType())
	return v_u_26
end
function v_u_1.GetMoveVector(p32)
	if p32.activeController then
		return p32.activeController:GetMoveVector()
	else
		return Vector3.new(0, 0, 0)
	end
end
function v_u_1.GetActiveController(p33)
	return p33.activeController
end
function v_u_1.UpdateActiveControlModuleEnabled(p_u_34)
	-- upvalues: (copy) v_u_2, (copy) v_u_19, (copy) v_u_5, (copy) v_u_4, (copy) v_u_18, (copy) v_u_11
	local function v35()
		-- upvalues: (copy) p_u_34, (ref) v_u_19, (ref) v_u_2
		if p_u_34.activeControlModule == v_u_19 then
			p_u_34.activeController:Enable(true, v_u_2.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice, p_u_34.touchJumpController)
			return
		elseif p_u_34.touchControlFrame then
			p_u_34.activeController:Enable(true, p_u_34.touchControlFrame)
		else
			p_u_34.activeController:Enable(true)
		end
	end
	if p_u_34.activeController then
		if p_u_34.controlsEnabled then
			if v_u_5.TouchControlsEnabled or not v_u_4.TouchEnabled or p_u_34.activeControlModule ~= v_u_19 and p_u_34.activeControlModule ~= v_u_18 and p_u_34.activeControlModule ~= v_u_11 then
				v35()
			else
				p_u_34.activeController:Enable(false)
				if p_u_34.moveFunction then
					p_u_34.moveFunction(v_u_2.LocalPlayer, Vector3.new(0, 0, 0), true)
				end
			end
		else
			p_u_34.activeController:Enable(false)
			if p_u_34.moveFunction then
				p_u_34.moveFunction(v_u_2.LocalPlayer, Vector3.new(0, 0, 0), true)
			end
			return
		end
	else
		return
	end
end
function v_u_1.Enable(p36, p37)
	p36.controlsEnabled = p37 == nil and true or p37
	if p36.activeController then
		p36:UpdateActiveControlModuleEnabled()
	end
end
function v_u_1.Disable(p38)
	p38.controlsEnabled = false
	p38:UpdateActiveControlModuleEnabled()
end
function v_u_1.SelectComputerMovementModule(_)
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_24, (ref) v_u_25, (copy) v_u_7, (copy) v_u_9, (copy) v_u_19, (copy) v_u_23
	if v_u_4.KeyboardEnabled or v_u_4.GamepadEnabled then
		local v39 = v_u_2.LocalPlayer.DevComputerMovementMode
		local v40
		if v39 == Enum.DevComputerMovementMode.UserChoice then
			v40 = v_u_24[v_u_25]
			if v_u_7.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove then
				if v40 == v_u_9 then
					v40 = v_u_19
				end
			end
		else
			v40 = v_u_23[v39]
			if not v40 then
				if v39 ~= Enum.DevComputerMovementMode.Scriptable then
					warn("No character control module is associated with DevComputerMovementMode ", v39)
				end
			end
		end
		if v40 then
			return v40, true
		elseif v39 == Enum.DevComputerMovementMode.Scriptable then
			return nil, true
		else
			return nil, false
		end
	else
		return nil, false
	end
end
function v_u_1.SelectTouchModule(_)
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_23, (copy) v_u_7
	if not v_u_4.TouchEnabled then
		return nil, false
	end
	local v41 = v_u_2.LocalPlayer.DevTouchMovementMode
	local v42
	if v41 == Enum.DevTouchMovementMode.UserChoice then
		v42 = v_u_23[v_u_7.TouchMovementMode]
	else
		if v41 == Enum.DevTouchMovementMode.Scriptable then
			return nil, true
		end
		v42 = v_u_23[v41]
	end
	return v42, true
end
local function v_u_53(p43, p44)
	-- upvalues: (copy) v_u_6, (copy) v_u_8
	local v45 = v_u_6.CurrentCamera
	if not v45 then
		return p44
	end
	if p43:GetState() == Enum.HumanoidStateType.Swimming then
		return v45.CFrame:VectorToWorldSpace(p44)
	end
	local v46 = v45.CFrame
	if v_u_8.VREnabled then
		if p43.RootPart then
			if (p43.RootPart.CFrame.Position - v46.Position).Magnitude < 3 then
				v46 = v46 * v_u_8:GetUserCFrame(Enum.UserCFrame.Head)
			end
		end
	end
	local _, _, _, v51, v48, v49, _, _, v50, _, _, v51 = v46:GetComponents()
	if v50 >= 1 or -1 >= v50 then
		v49 = -v48 * math.sign(v50)
	end
	local v52 = math.sqrt(v51 * v51 + v49 * v49)
	return Vector3.new((v51 * p44.X + v49 * p44.Z) / v52, 0, (v51 * p44.Z - v49 * p44.X) / v52)
end
function v_u_1.OnRenderStepped(p54, p55)
	-- upvalues: (copy) v_u_10, (copy) v_u_53, (copy) v_u_2
	if p54.activeController and p54.activeController.enabled and p54.humanoid then
		p54.activeController:OnRenderStepped(p55)
		local v56 = p54.activeController:GetMoveVector()
		local v57 = p54.activeController:IsMoveVectorCameraRelative()
		local v58 = p54:GetClickToMoveController()
		if p54.activeController ~= v58 then
			if 0 < v56.magnitude then
				v58:CleanupPath()
			else
				v58:OnRenderStepped(p55)
				v56 = v58:GetMoveVector()
				v57 = v58:IsMoveVectorCameraRelative()
			end
		end
		if p54.vehicleController then
			local v59
			v56, v59 = p54.vehicleController:Update(v56, v57, p54.activeControlModule == v_u_10)
		end
		if v57 then
			v56 = v_u_53(p54.humanoid, v56)
		end
		p54.moveFunction(v_u_2.LocalPlayer, v56, false)
		local v60 = p54.humanoid
		local v61 = not p54.activeController:GetIsJumping() and p54.touchJumpController
		if v61 then
			v61 = p54.touchJumpController:GetIsJumping()
		end
		v60.Jump = v61
	end
end
function v_u_1.OnHumanoidSeated(p62, p63, p64)
	-- upvalues: (copy) v_u_22
	if p63 then
		if p64 and p64:IsA("VehicleSeat") then
			if not p62.vehicleController then
				p62.vehicleController = p62.vehicleController.new(v_u_22)
			end
			p62.vehicleController:Enable(true, p64)
			return
		end
	elseif p62.vehicleController then
		p62.vehicleController:Enable(false, p64)
	end
end
function v_u_1.OnCharacterAdded(p_u_65, p66)
	p_u_65.humanoid = p66:FindFirstChildOfClass("Humanoid")
	while not p_u_65.humanoid do
		p66.ChildAdded:wait()
		p_u_65.humanoid = p66:FindFirstChildOfClass("Humanoid")
	end
	p_u_65:UpdateTouchGuiVisibility()
	if p_u_65.humanoidSeatedConn then
		p_u_65.humanoidSeatedConn:Disconnect()
		p_u_65.humanoidSeatedConn = nil
	end
	p_u_65.humanoidSeatedConn = p_u_65.humanoid.Seated:Connect(function(p67, p68)
		-- upvalues: (copy) p_u_65
		p_u_65:OnHumanoidSeated(p67, p68)
	end)
end
function v_u_1.OnCharacterRemoving(p69, _)
	p69.humanoid = nil
	p69:UpdateTouchGuiVisibility()
end
function v_u_1.UpdateTouchGuiVisibility(p70)
	-- upvalues: (copy) v_u_5
	if p70.touchGui then
		local v71 = p70.humanoid
		if v71 then
			v71 = v_u_5.TouchControlsEnabled
		end
		p70.touchGui.Enabled = v71 and true or false
	end
end
function v_u_1.SwitchToController(p72, p73)
	-- upvalues: (copy) v_u_22, (copy) v_u_19, (copy) v_u_18, (copy) v_u_11, (copy) v_u_20
	if p73 then
		if not p72.controllers[p73] then
			p72.controllers[p73] = p73.new(v_u_22)
		end
		if p72.activeController ~= p72.controllers[p73] then
			if p72.activeController then
				p72.activeController:Enable(false)
			end
			p72.activeController = p72.controllers[p73]
			p72.activeControlModule = p73
			if p72.touchControlFrame and (p72.activeControlModule == v_u_19 or p72.activeControlModule == v_u_18 or p72.activeControlModule == v_u_11) then
				if not p72.controllers[v_u_20] then
					p72.controllers[v_u_20] = v_u_20.new()
				end
				p72.touchJumpController = p72.controllers[v_u_20]
				p72.touchJumpController:Enable(true, p72.touchControlFrame)
			elseif p72.touchJumpController then
				p72.touchJumpController:Enable(false)
			end
			p72:UpdateActiveControlModuleEnabled()
		end
	else
		if p72.activeController then
			p72.activeController:Enable(false)
		end
		p72.activeController = nil
		p72.activeControlModule = nil
	end
end
function v_u_1.OnLastInputTypeChanged(p74, p75)
	-- upvalues: (ref) v_u_25, (copy) v_u_24
	if v_u_25 == p75 then
		warn("LastInputType Change listener called with current type.")
	end
	v_u_25 = p75
	if v_u_25 == Enum.UserInputType.Touch then
		local v76, v77 = p74:SelectTouchModule()
		if v77 then
			while not p74.touchControlFrame do
				wait()
			end
			p74:SwitchToController(v76)
		end
	else
		local v78 = v_u_24[v_u_25] ~= nil and p74:SelectComputerMovementModule()
		if v78 then
			p74:SwitchToController(v78)
		end
	end
	p74:UpdateTouchGuiVisibility()
end
function v_u_1.OnComputerMovementModeChange(p79)
	local v80, v81 = p79:SelectComputerMovementModule()
	if v81 then
		p79:SwitchToController(v80)
	end
end
function v_u_1.OnTouchMovementModeChange(p82)
	local v83, v84 = p82:SelectTouchModule()
	if v84 then
		while not p82.touchControlFrame do
			wait()
		end
		p82:SwitchToController(v83)
	end
end
function v_u_1.CreateTouchGuiContainer(p85)
	-- upvalues: (ref) v_u_17
	if p85.touchGui then
		p85.touchGui:Destroy()
	end
	p85.touchGui = Instance.new("ScreenGui")
	p85.touchGui.Name = "TouchGui"
	p85.touchGui.ResetOnSpawn = false
	p85.touchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	p85:UpdateTouchGuiVisibility()
	if v_u_17 then
		p85.touchGui.ClipToDeviceSafeArea = false
	end
	p85.touchControlFrame = Instance.new("Frame")
	p85.touchControlFrame.Name = "TouchControlFrame"
	p85.touchControlFrame.Size = UDim2.new(1, 0, 1, 0)
	p85.touchControlFrame.BackgroundTransparency = 1
	p85.touchControlFrame.Parent = p85.touchGui
	p85.touchGui.Parent = p85.playerGui
end
function v_u_1.GetClickToMoveController(p86)
	-- upvalues: (copy) v_u_19, (copy) v_u_22
	if not p86.controllers[v_u_19] then
		p86.controllers[v_u_19] = v_u_19.new(v_u_22)
	end
	return p86.controllers[v_u_19]
end
return v_u_1.new()
