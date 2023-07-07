-- decompiled by Sentinel (took 5.962944ms)
local v_u_1 = game:GetService("ContextActionService")
local v_u_2 = game:GetService("UserInputService")
local v3 = game:GetService("RunService")
local v_u_4 = UserSettings():GetService("UserGameSettings")
local v_u_5 = game:GetService("VRService")
game:GetService("StarterGui")
local v_u_6 = game:GetService("Players").LocalPlayer
local v_u_7 = Enum.ContextActionPriority.Medium.Value
local v_u_8 = Vector2.new(1, 0.77) * 0.008726646259971648
local v_u_9 = Vector2.new(1, 0.77) * 0.12217304763960307
local v_u_10 = Vector2.new(1, 0.66) * 0.017453292519943295
local v_u_11 = Vector2.new(1, 0.77) * 0.06981317007977318
local v12, v13 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserResetTouchStateOnMenuOpen")
end)
local v_u_14 = v12 and v13
local v_u_15 = Instance.new("BindableEvent")
local v_u_16 = Instance.new("BindableEvent")
local v_u_17 = v_u_15.Event
local v_u_18 = v_u_16.Event
v_u_2.InputBegan:Connect(function(p19, p20)
	-- upvalues: (copy) v_u_15
	if not p20 and p19.UserInputType == Enum.UserInputType.MouseButton2 then
		v_u_15:Fire()
	end
end)
v_u_2.InputEnded:Connect(function(p21, _)
	-- upvalues: (copy) v_u_16
	if p21.UserInputType == Enum.UserInputType.MouseButton2 then
		v_u_16:Fire()
	end
end)
local function v_u_23(p22)
	return math.sign(p22) * math.clamp((math.exp(2 * (math.abs(p22) - 0.1) / 0.9) - 1) / 6.38905609893065, 0, 1)
end
local function v_u_27(p24)
	local v25 = workspace.CurrentCamera
	if v25 then
		local v26 = v25.CFrame:ToEulerAnglesYXZ()
		if 0 <= p24.Y * v26 then
			return p24
		else
			return Vector2.new(1, (1 - (2 * math.abs(v26) / math.pi) ^ 0.75) * 0.75 + 0.25) * p24
		end
	else
		return p24
	end
end
local function v_u_34(p28)
	-- upvalues: (copy) v_u_6
	local v29 = v_u_6:FindFirstChildOfClass("PlayerGui")
	if v29 then
		v29 = v29:FindFirstChild("TouchGui")
	end
	local v30
	if v29 then
		v30 = v29:FindFirstChild("TouchControlFrame")
	else
		v30 = v29
	end
	if v30 then
		v30 = v30:FindFirstChild("DynamicThumbstickFrame")
	end
	if not v30 then
		return false
	end
	if not v29.Enabled then
		return false
	end
	local v31 = v30.AbsolutePosition
	local v32 = v31 + v30.AbsoluteSize
	local v33
	if p28.X >= v31.X then
		if p28.Y >= v31.Y then
			if p28.X <= v32.X then
				v33 = p28.Y <= v32.Y
			else
				v33 = false
			end
		else
			v33 = false
		end
	else
		v33 = false
	end
	return v33
end
local v_u_35 = 0.016666666666666666
v3.Stepped:Connect(function(_, p36)
	-- upvalues: (ref) v_u_35
	v_u_35 = p36
end)
local v37 = {}
local v_u_38 = {}
local v_u_39 = 0
local v_u_40 = {
	["Thumbstick2"] = Vector2.new()
}
local v_u_41 = {
	["Left"] = 0, 
	["Right"] = 0, 
	["I"] = 0, 
	["O"] = 0
}
local v_u_42 = {
	["Movement"] = Vector2.new(), 
	["Wheel"] = 0, 
	["Pan"] = Vector2.new(), 
	["Pinch"] = 0
}
local v_u_43 = {
	["Move"] = Vector2.new(), 
	["Pinch"] = 0
}
local v_u_44 = Instance.new("BindableEvent")
v37.gamepadZoomPress = v_u_44.Event
local v_u_45 = v_u_5.VREnabled and Instance.new("BindableEvent") or nil
if v_u_5.VREnabled then
	v37.gamepadReset = v_u_45.Event
end
function v37.getRotationActivated()
	-- upvalues: (ref) v_u_39, (copy) v_u_40
	return 0 < v_u_39 and true or 0 < v_u_40.Thumbstick2.Magnitude
end
function v37.getRotation(p46)
	-- upvalues: (copy) v_u_4, (copy) v_u_41, (ref) v_u_35, (copy) v_u_40, (copy) v_u_42, (copy) v_u_27, (copy) v_u_43, (copy) v_u_11, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10
	local v47 = Vector2.new(1, v_u_4:GetCameraYInvertValue())
	local v48 = Vector2.new(v_u_41.Right - v_u_41.Left, 0) * v_u_35
	local v49 = v_u_40.Thumbstick2
	local v50 = v_u_42.Movement
	local v51 = v_u_42.Pan
	local v52 = v_u_27(v_u_43.Move)
	if p46 then
		v48 = Vector2.new()
	end
	return (v48 * 2.0943951023931953 + v49 * v_u_11 + v50 * v_u_8 + v51 * v_u_9 + v52 * v_u_10) * v47
end
function v37.getZoomDelta()
	-- upvalues: (copy) v_u_41, (copy) v_u_42, (copy) v_u_43
	return (v_u_41.O - v_u_41.I) * 0.1 + (-v_u_42.Wheel + v_u_42.Pinch) * 1 + -v_u_43.Pinch * 0.04
end
local function v_u_55(_, _, p53)
	-- upvalues: (copy) v_u_40, (ref) v_u_23
	local v54 = p53.Position
	v_u_40[p53.KeyCode.Name] = Vector2.new(v_u_23(v54.X), -v_u_23(v54.Y))
	return Enum.ContextActionResult.Pass
end
local function v_u_58(_, p56, p57)
	-- upvalues: (copy) v_u_41
	v_u_41[p57.KeyCode.Name] = p56 == Enum.UserInputState.Begin and 1 or 0
end
local function v_u_60(_, p59, _)
	-- upvalues: (copy) v_u_44
	if p59 == Enum.UserInputState.Begin then
		v_u_44:Fire()
	end
end
local function v_u_62(_, p61, _)
	-- upvalues: (copy) v_u_45
	if p61 == Enum.UserInputState.Begin then
		v_u_45:Fire()
	end
end
local function v_u_66()
	-- upvalues: (copy) v_u_40, (copy) v_u_41, (copy) v_u_42, (copy) v_u_43
	for _, v63 in pairs({
		v_u_40, 
		v_u_41, 
		v_u_42, 
		v_u_43
	}) do
		for v64, v65 in pairs(v63) do
			if type(v65) == "boolean" then
				v63[v64] = false
			else
				v63[v64] = v63[v64] * 0
			end
		end
	end
end
local v_u_67 = {}
local v_u_68 = nil
local v_u_69 = nil
local function v_u_72(p70, p71)
	-- upvalues: (ref) v_u_68, (copy) v_u_34, (ref) v_u_39, (ref) v_u_67
	assert(p70.UserInputType == Enum.UserInputType.Touch)
	assert(p70.UserInputState == Enum.UserInputState.Begin)
	if v_u_68 == nil and v_u_34(p70.Position) and not p71 then
		v_u_68 = p70
	else
		if not p71 then
			v_u_39 = math.max(0, v_u_39 + 1)
		end
		v_u_67[p70] = p71
	end
end
local function v_u_74(p73, _)
	-- upvalues: (ref) v_u_68, (ref) v_u_67, (ref) v_u_69, (ref) v_u_39
	assert(p73.UserInputType == Enum.UserInputType.Touch)
	assert(p73.UserInputState == Enum.UserInputState.End)
	if p73 == v_u_68 then
		v_u_68 = nil
	end
	if v_u_67[p73] == false then
		v_u_69 = nil
		v_u_39 = math.max(0, v_u_39 - 1)
	end
	v_u_67[p73] = nil
end
local function v_u_84(p75, p76)
	-- upvalues: (ref) v_u_68, (ref) v_u_67, (copy) v_u_43, (ref) v_u_69
	assert(p75.UserInputType == Enum.UserInputType.Touch)
	assert(p75.UserInputState == Enum.UserInputState.Change)
	if p75 == v_u_68 then
		return
	else
		if v_u_67[p75] == nil then
			v_u_67[p75] = p76
		end
		local v77 = {}
		for v78, v79 in pairs(v_u_67) do
			if not v79 then
				table.insert(v77, v78)
			end
		end
		if #v77 == 1 and v_u_67[p75] == false then
			local v80 = p75.Delta
			local v81 = v_u_43
			v81.Move = v81.Move + Vector2.new(v80.X, v80.Y)
		end
		if #v77 == 2 then
			local v82 = (v77[1].Position - v77[2].Position).Magnitude
			if v_u_69 then
				local v83 = v_u_43
				v83.Pinch = v83.Pinch + v82 - v_u_69
			end
			v_u_69 = v82
		else
			v_u_69 = nil
		end
	end
end
local function v_u_85()
	-- upvalues: (ref) v_u_67, (ref) v_u_68, (ref) v_u_69, (ref) v_u_14, (ref) v_u_39
	v_u_67 = {}
	v_u_68 = nil
	v_u_69 = nil
	if v_u_14 then
		v_u_39 = 0
	end
end
local function v_u_90(p86, p87, p88, p89)
	-- upvalues: (copy) v_u_42
	if not p89 then
		v_u_42.Wheel = p86
		v_u_42.Pan = p87
		v_u_42.Pinch = -p88
	end
end
local function v_u_93(p91, p92)
	-- upvalues: (ref) v_u_72, (ref) v_u_39
	if p91.UserInputType == Enum.UserInputType.Touch then
		v_u_72(p91, p92)
	elseif p91.UserInputType == Enum.UserInputType.MouseButton2 and not p92 then
		v_u_39 = math.max(0, v_u_39 + 1)
	end
end
local function v_u_97(p94, p95)
	-- upvalues: (ref) v_u_84, (copy) v_u_42
	if p94.UserInputType == Enum.UserInputType.Touch then
		v_u_84(p94, p95)
	elseif p94.UserInputType == Enum.UserInputType.MouseMovement then
		local v96 = p94.Delta
		v_u_42.Movement = Vector2.new(v96.X, v96.Y)
	end
end
local function v_u_100(p98, p99)
	-- upvalues: (ref) v_u_74, (ref) v_u_39
	if p98.UserInputType == Enum.UserInputType.Touch then
		v_u_74(p98, p99)
	elseif p98.UserInputType == Enum.UserInputType.MouseButton2 then
		v_u_39 = math.max(0, v_u_39 - 1)
	end
end
local v_u_101 = false
function v37.setInputEnabled(p102)
	-- upvalues: (ref) v_u_101, (copy) v_u_66, (ref) v_u_85, (copy) v_u_1, (copy) v_u_55, (copy) v_u_7, (copy) v_u_58, (copy) v_u_5, (copy) v_u_62, (copy) v_u_60, (ref) v_u_38, (copy) v_u_2, (copy) v_u_93, (copy) v_u_97, (copy) v_u_100, (copy) v_u_90, (ref) v_u_14
	if v_u_101 ~= p102 then
		v_u_101 = p102
		v_u_66()
		v_u_85()
		if v_u_101 then
			v_u_1:BindActionAtPriority("RbxCameraThumbstick", v_u_55, false, v_u_7, Enum.KeyCode.Thumbstick2)
			v_u_1:BindActionAtPriority("RbxCameraKeypress", v_u_58, false, v_u_7, Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.I, Enum.KeyCode.O)
			if v_u_5.VREnabled then
				v_u_1:BindAction("RbxCameraGamepadReset", v_u_62, false, Enum.KeyCode.ButtonL3)
			end
			v_u_1:BindAction("RbxCameraGamepadZoom", v_u_60, false, Enum.KeyCode.ButtonR3)
			table.insert(v_u_38, v_u_2.InputBegan:Connect(v_u_93))
			table.insert(v_u_38, v_u_2.InputChanged:Connect(v_u_97))
			table.insert(v_u_38, v_u_2.InputEnded:Connect(v_u_100))
			table.insert(v_u_38, v_u_2.PointerAction:Connect(v_u_90))
			if v_u_14 then
				table.insert(v_u_38, game:GetService("GuiService").MenuOpened:connect(v_u_85))
				return
			end
		else
			v_u_1:UnbindAction("RbxCameraThumbstick")
			v_u_1:UnbindAction("RbxCameraMouseMove")
			v_u_1:UnbindAction("RbxCameraMouseWheel")
			v_u_1:UnbindAction("RbxCameraKeypress")
			v_u_1:UnbindAction("RbxCameraGamepadZoom")
			if v_u_5.VREnabled then
				v_u_1:UnbindAction("RbxCameraGamepadReset")
			end
			for _, v103 in pairs(v_u_38) do
				v103:Disconnect()
			end
			v_u_38 = {}
		end
	end
end
function v37.getInputEnabled()
	-- upvalues: (ref) v_u_101
	return v_u_101
end
function v37.resetInputForFrameEnd()
	-- upvalues: (copy) v_u_42, (copy) v_u_43
	v_u_42.Movement = Vector2.new()
	v_u_43.Move = Vector2.new()
	v_u_43.Pinch = 0
	v_u_42.Wheel = 0
	v_u_42.Pan = Vector2.new()
	v_u_42.Pinch = 0
end
v_u_2.WindowFocused:Connect(v_u_66)
v_u_2.WindowFocusReleased:Connect(v_u_66)
local v_u_104 = false
local v_u_105 = false
local v_u_106 = 0
function v37.getHoldPan()
	-- upvalues: (ref) v_u_104
	return v_u_104
end
function v37.getTogglePan()
	-- upvalues: (ref) v_u_105
	return v_u_105
end
function v37.getPanning()
	-- upvalues: (ref) v_u_105, (ref) v_u_104
	return v_u_105 or v_u_104
end
function v37.setTogglePan(p107)
	-- upvalues: (ref) v_u_105
	v_u_105 = p107
end
local v_u_108 = false
local v_u_109 = nil
local v_u_110 = nil
function v37.enableCameraToggleInput()
	-- upvalues: (ref) v_u_108, (ref) v_u_104, (ref) v_u_105, (ref) v_u_109, (ref) v_u_110, (ref) v_u_17, (ref) v_u_106, (ref) v_u_18, (copy) v_u_2
	if not v_u_108 then
		v_u_108 = true
		v_u_104 = false
		v_u_105 = false
		if v_u_109 then
			v_u_109:Disconnect()
		end
		if v_u_110 then
			v_u_110:Disconnect()
		end
		v_u_109 = v_u_17:Connect(function()
			-- upvalues: (ref) v_u_104, (ref) v_u_106
			v_u_104 = true
			v_u_106 = tick()
		end)
		v_u_110 = v_u_18:Connect(function()
			-- upvalues: (ref) v_u_104, (ref) v_u_106, (ref) v_u_105, (ref) v_u_2
			v_u_104 = false
			if tick() - v_u_106 < 0.3 and (v_u_105 or v_u_2:GetMouseDelta().Magnitude < 2) then
				v_u_105 = not v_u_105
			end
		end)
	end
end
function v37.disableCameraToggleInput()
	-- upvalues: (ref) v_u_108, (ref) v_u_109, (ref) v_u_110
	if v_u_108 then
		v_u_108 = false
		if v_u_109 then
			v_u_109:Disconnect()
			v_u_109 = nil
		end
		if v_u_110 then
			v_u_110:Disconnect()
			v_u_110 = nil
		end
	end
end
return v37
