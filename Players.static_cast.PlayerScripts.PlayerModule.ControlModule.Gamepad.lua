-- decompiled by Sentinel (took 2.128477ms)
local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = Vector3.new(0, 0, 0)
local v_u_4 = Enum.UserInputType.None
local v_u_5 = require(script.Parent:WaitForChild("BaseCharacterController"))
local v_u_6 = setmetatable({}, v_u_5)
v_u_6.__index = v_u_6
function v_u_6.new(p7)
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_4
	local v8 = setmetatable(v_u_5.new(), v_u_6)
	v8.CONTROL_ACTION_PRIORITY = p7
	v8.forwardValue = 0
	v8.backwardValue = 0
	v8.leftValue = 0
	v8.rightValue = 0
	v8.activeGamepad = v_u_4
	v8.gamepadConnectedConn = nil
	v8.gamepadDisconnectedConn = nil
	return v8
end
function v_u_6.Enable(p9, p10)
	-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_4
	if not v_u_1.GamepadEnabled then
		return false
	end
	if p10 == p9.enabled then
		return true
	end
	p9.forwardValue = 0
	p9.backwardValue = 0
	p9.leftValue = 0
	p9.rightValue = 0
	p9.moveVector = v_u_3
	p9.isJumping = false
	if p10 then
		p9.activeGamepad = p9:GetHighestPriorityGamepad()
		if p9.activeGamepad == v_u_4 then
			return false
		end
		p9:BindContextActions()
		p9:ConnectGamepadConnectionListeners()
	else
		p9:UnbindContextActions()
		p9:DisconnectGamepadConnectionListeners()
		p9.activeGamepad = v_u_4
	end
	p9.enabled = p10
	return true
end
function v_u_6.GetHighestPriorityGamepad(_)
	-- upvalues: (copy) v_u_1, (copy) v_u_4
	local v11 = v_u_4
	for _, v12 in pairs((v_u_1:GetConnectedGamepads())) do
		if v12.Value < v11.Value then
			v11 = v12
		end
	end
	return v11
end
function v_u_6.BindContextActions(p_u_13)
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2
	if p_u_13.activeGamepad == v_u_4 then
		return false
	end
	v_u_2:BindActivate(p_u_13.activeGamepad, Enum.KeyCode.ButtonR2)
	v_u_2:BindActionAtPriority("jumpAction", function(_, p14, _)
		-- upvalues: (copy) p_u_13
		p_u_13.isJumping = p14 == Enum.UserInputState.Begin
		return Enum.ContextActionResult.Sink
	end, false, p_u_13.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonA)
	v_u_2:BindActionAtPriority("moveThumbstick", function(_, p15, p16)
		-- upvalues: (copy) p_u_13, (ref) v_u_3
		if p15 == Enum.UserInputState.Cancel then
			p_u_13.moveVector = v_u_3
			return Enum.ContextActionResult.Sink
		end
		if p_u_13.activeGamepad ~= p16.UserInputType then
			return Enum.ContextActionResult.Pass
		end
		if p16.KeyCode == Enum.KeyCode.Thumbstick1 then
			if 0.2 < p16.Position.magnitude then
				p_u_13.moveVector = Vector3.new(p16.Position.X, 0, -p16.Position.Y)
			else
				p_u_13.moveVector = v_u_3
			end
			return Enum.ContextActionResult.Sink
		end
	end, false, p_u_13.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Thumbstick1)
	return true
end
function v_u_6.UnbindContextActions(p17)
	-- upvalues: (copy) v_u_4, (copy) v_u_2
	if p17.activeGamepad ~= v_u_4 then
		v_u_2:UnbindActivate(p17.activeGamepad, Enum.KeyCode.ButtonR2)
	end
	v_u_2:UnbindAction("moveThumbstick")
	v_u_2:UnbindAction("jumpAction")
end
function v_u_6.OnNewGamepadConnected(p18)
	-- upvalues: (copy) v_u_4
	local v19 = p18:GetHighestPriorityGamepad()
	if v19 == p18.activeGamepad then
		return
	elseif v19 == v_u_4 then
		warn("Gamepad:OnNewGamepadConnected found no connected gamepads")
		p18:UnbindContextActions()
	else
		if p18.activeGamepad ~= v_u_4 then
			p18:UnbindContextActions()
		end
		p18.activeGamepad = v19
		p18:BindContextActions()
	end
end
function v_u_6.OnCurrentGamepadDisconnected(p20)
	-- upvalues: (copy) v_u_4, (copy) v_u_2
	if p20.activeGamepad ~= v_u_4 then
		v_u_2:UnbindActivate(p20.activeGamepad, Enum.KeyCode.ButtonR2)
	end
	local v21 = p20:GetHighestPriorityGamepad()
	if p20.activeGamepad == v_u_4 or v21 ~= p20.activeGamepad then
		if v21 == v_u_4 then
			p20:UnbindContextActions()
			p20.activeGamepad = v_u_4
		else
			p20.activeGamepad = v21
			v_u_2:BindActivate(p20.activeGamepad, Enum.KeyCode.ButtonR2)
		end
	else
		warn("Gamepad:OnCurrentGamepadDisconnected found the supposedly disconnected gamepad in connectedGamepads.")
		p20:UnbindContextActions()
		p20.activeGamepad = v_u_4
		return
	end
end
function v_u_6.ConnectGamepadConnectionListeners(p_u_22)
	-- upvalues: (copy) v_u_1
	p_u_22.gamepadConnectedConn = v_u_1.GamepadConnected:Connect(function(_)
		-- upvalues: (copy) p_u_22
		p_u_22:OnNewGamepadConnected()
	end)
	p_u_22.gamepadDisconnectedConn = v_u_1.GamepadDisconnected:Connect(function(p23)
		-- upvalues: (copy) p_u_22
		if p_u_22.activeGamepad == p23 then
			p_u_22:OnCurrentGamepadDisconnected()
		end
	end)
end
function v_u_6.DisconnectGamepadConnectionListeners(p24)
	if p24.gamepadConnectedConn then
		p24.gamepadConnectedConn:Disconnect()
		p24.gamepadConnectedConn = nil
	end
	if p24.gamepadDisconnectedConn then
		p24.gamepadDisconnectedConn:Disconnect()
		p24.gamepadDisconnectedConn = nil
	end
end
return v_u_6
