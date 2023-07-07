-- decompiled by Sentinel (took 2.628737ms)
local v_u_1 = Enum.ContextActionPriority.Medium.Value
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("ContextActionService")
local v_u_4 = UserSettings().GameSettings
local v_u_5 = require(script.Parent:WaitForChild("CameraUtils"))
local v_u_6 = {}
v_u_6.__index = v_u_6
function v_u_6.new()
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_2
	local v_u_7 = setmetatable({}, v_u_6)
	v_u_7.isMouseLocked = false
	v_u_7.savedMouseCursor = nil
	v_u_7.boundKeys = { Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift }
	v_u_7.mouseLockToggledEvent = Instance.new("BindableEvent")
	local v8 = script:FindFirstChild("BoundKeys")
	if not (v8 and v8:IsA("StringValue")) then
		if v8 then
			v8:Destroy()
		end
		v8 = Instance.new("StringValue")
		assert(v8, "")
		v8.Name = "BoundKeys"
		v8.Value = "LeftShift,RightShift"
		v8.Parent = script
	end
	if v8 then
		v8.Changed:Connect(function(p9)
			-- upvalues: (copy) v_u_7
			v_u_7:OnBoundKeysObjectChanged(p9)
		end)
		v_u_7:OnBoundKeysObjectChanged(v8.Value)
	end
	v_u_4.Changed:Connect(function(p10)
		-- upvalues: (copy) v_u_7
		if p10 == "ControlMode" or p10 == "ComputerMovementMode" then
			v_u_7:UpdateMouseLockAvailability()
		end
	end)
	v_u_2.LocalPlayer:GetPropertyChangedSignal("DevEnableMouseLock"):Connect(function()
		-- upvalues: (copy) v_u_7
		v_u_7:UpdateMouseLockAvailability()
	end)
	v_u_2.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function()
		-- upvalues: (copy) v_u_7
		v_u_7:UpdateMouseLockAvailability()
	end)
	v_u_7:UpdateMouseLockAvailability()
	return v_u_7
end
function v_u_6.GetIsMouseLocked(p11)
	return p11.isMouseLocked
end
function v_u_6.GetBindableToggleEvent(p12)
	return p12.mouseLockToggledEvent.Event
end
function v_u_6.GetMouseLockOffset(_)
	local v13 = script:FindFirstChild("CameraOffset")
	if v13 and v13:IsA("Vector3Value") then
		return v13.Value
	else
		if v13 then
			v13:Destroy()
		end
		local v14 = Instance.new("Vector3Value")
		assert(v14, "")
		v14.Name = "CameraOffset"
		v14.Value = Vector3.new(1.75, 0, 0)
		v14.Parent = script
		if v14 and v14.Value then
			return v14.Value
		else
			return Vector3.new(1.75, 0, 0)
		end
	end
end
function v_u_6.UpdateMouseLockAvailability(p15)
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	local v16 = v_u_2.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable
	local v17 = v_u_2.LocalPlayer.DevEnableMouseLock and v_u_4.ControlMode == Enum.ControlMode.MouseLockSwitch and v_u_4.ComputerMovementMode ~= Enum.ComputerMovementMode.ClickToMove
	if v17 then
		v17 = not v16
	end
	if v17 ~= p15.enabled then
		p15:EnableMouseLock(v17)
	end
end
function v_u_6.OnBoundKeysObjectChanged(p18, p19)
	p18.boundKeys = {}
	for v20 in string.gmatch(p19, "[^%s,]+") do
		for _, v21 in pairs(Enum.KeyCode:GetEnumItems()) do
			if v20 == v21.Name then
				p18.boundKeys[#p18.boundKeys + 1] = v21
				break
			end
		end
	end
	p18:UnbindContextActions()
	p18:BindContextActions()
end
function v_u_6.OnMouseLockToggled(p22)
	-- upvalues: (copy) v_u_5
	p22.isMouseLocked = not p22.isMouseLocked
	if p22.isMouseLocked then
		local v23 = script:FindFirstChild("CursorImage")
		if v23 and v23:IsA("StringValue") and v23.Value then
			v_u_5.setMouseIconOverride(v23.Value)
		else
			if v23 then
				v23:Destroy()
			end
			local v24 = Instance.new("StringValue")
			assert(v24, "")
			v24.Name = "CursorImage"
			v24.Value = "rbxasset://textures/MouseLockedCursor.png"
			v24.Parent = script
			v_u_5.setMouseIconOverride("rbxasset://textures/MouseLockedCursor.png")
		end
	else
		v_u_5.restoreMouseIcon()
	end
	p22.mouseLockToggledEvent:Fire()
end
function v_u_6.DoMouseLockSwitch(p25, _, p26, _)
	if p26 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Pass
	end
	p25:OnMouseLockToggled()
	return Enum.ContextActionResult.Sink
end
function v_u_6.BindContextActions(p_u_27)
	-- upvalues: (copy) v_u_3, (copy) v_u_1
	v_u_3:BindActionAtPriority("MouseLockSwitchAction", function(p28, p29, p30)
		-- upvalues: (copy) p_u_27
		return p_u_27:DoMouseLockSwitch(p28, p29, p30)
	end, false, v_u_1, unpack(p_u_27.boundKeys))
end
function v_u_6.UnbindContextActions(_)
	-- upvalues: (copy) v_u_3
	v_u_3:UnbindAction("MouseLockSwitchAction")
end
function v_u_6.IsMouseLocked(p31)
	local v32 = p31.enabled
	if v32 then
		v32 = p31.isMouseLocked
	end
	return v32
end
function v_u_6.EnableMouseLock(p33, p34)
	-- upvalues: (copy) v_u_5
	if p34 ~= p33.enabled then
		p33.enabled = p34
		if p33.enabled then
			p33:BindContextActions()
			return
		end
		v_u_5.restoreMouseIcon()
		p33:UnbindContextActions()
		if p33.isMouseLocked then
			p33.mouseLockToggledEvent:Fire()
		end
		p33.isMouseLocked = false
	end
end
return v_u_6
