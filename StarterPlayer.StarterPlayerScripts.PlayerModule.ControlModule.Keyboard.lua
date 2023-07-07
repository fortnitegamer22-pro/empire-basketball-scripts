-- decompiled by Sentinel (took 1.932473ms)
local v_u_1 = game:GetService("UserInputService")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = Vector3.new(0, 0, 0)
local v_u_4 = require(script.Parent:WaitForChild("BaseCharacterController"))
local v_u_5 = setmetatable({}, v_u_4)
v_u_5.__index = v_u_5
function v_u_5.new(p6)
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v7 = setmetatable(v_u_4.new(), v_u_5)
	v7.CONTROL_ACTION_PRIORITY = p6
	v7.textFocusReleasedConn = nil
	v7.textFocusGainedConn = nil
	v7.windowFocusReleasedConn = nil
	v7.forwardValue = 0
	v7.backwardValue = 0
	v7.leftValue = 0
	v7.rightValue = 0
	v7.jumpEnabled = true
	return v7
end
function v_u_5.Enable(p8, p9)
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	if not v_u_1.KeyboardEnabled then
		return false
	end
	if p9 == p8.enabled then
		return true
	end
	p8.forwardValue = 0
	p8.backwardValue = 0
	p8.leftValue = 0
	p8.rightValue = 0
	p8.moveVector = v_u_3
	p8.jumpRequested = false
	p8:UpdateJump()
	if p9 then
		p8:BindContextActions()
		p8:ConnectFocusEventListeners()
	else
		p8:UnbindContextActions()
		p8:DisconnectFocusEventListeners()
	end
	p8.enabled = p9
	return true
end
function v_u_5.UpdateMovement(p10, p11)
	-- upvalues: (copy) v_u_3
	if p11 == Enum.UserInputState.Cancel then
		p10.moveVector = v_u_3
	else
		p10.moveVector = Vector3.new(p10.leftValue + p10.rightValue, 0, p10.forwardValue + p10.backwardValue)
	end
end
function v_u_5.UpdateJump(p12)
	p12.isJumping = p12.jumpRequested
end
function v_u_5.BindContextActions(p_u_13)
	-- upvalues: (copy) v_u_2
	v_u_2:BindActionAtPriority("moveForwardAction", function(_, p14, _)
		-- upvalues: (copy) p_u_13
		p_u_13.forwardValue = p14 == Enum.UserInputState.Begin and -1 or 0
		p_u_13:UpdateMovement(p14)
		return Enum.ContextActionResult.Pass
	end, false, p_u_13.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterForward)
	v_u_2:BindActionAtPriority("moveBackwardAction", function(_, p15, _)
		-- upvalues: (copy) p_u_13
		p_u_13.backwardValue = p15 == Enum.UserInputState.Begin and 1 or 0
		p_u_13:UpdateMovement(p15)
		return Enum.ContextActionResult.Pass
	end, false, p_u_13.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterBackward)
	v_u_2:BindActionAtPriority("moveLeftAction", function(_, p16, _)
		-- upvalues: (copy) p_u_13
		p_u_13.leftValue = p16 == Enum.UserInputState.Begin and -1 or 0
		p_u_13:UpdateMovement(p16)
		return Enum.ContextActionResult.Pass
	end, false, p_u_13.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterLeft)
	v_u_2:BindActionAtPriority("moveRightAction", function(_, p17, _)
		-- upvalues: (copy) p_u_13
		p_u_13.rightValue = p17 == Enum.UserInputState.Begin and 1 or 0
		p_u_13:UpdateMovement(p17)
		return Enum.ContextActionResult.Pass
	end, false, p_u_13.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterRight)
	v_u_2:BindActionAtPriority("jumpAction", function(_, p18, _)
		-- upvalues: (copy) p_u_13
		local v19 = p_u_13
		local v20 = p_u_13.jumpEnabled
		if v20 then
			v20 = p18 == Enum.UserInputState.Begin
		end
		v19.jumpRequested = v20
		p_u_13:UpdateJump()
		return Enum.ContextActionResult.Pass
	end, false, p_u_13.CONTROL_ACTION_PRIORITY, Enum.PlayerActions.CharacterJump)
end
function v_u_5.UnbindContextActions(_)
	-- upvalues: (copy) v_u_2
	v_u_2:UnbindAction("moveForwardAction")
	v_u_2:UnbindAction("moveBackwardAction")
	v_u_2:UnbindAction("moveLeftAction")
	v_u_2:UnbindAction("moveRightAction")
	v_u_2:UnbindAction("jumpAction")
end
function v_u_5.ConnectFocusEventListeners(p_u_21)
	-- upvalues: (copy) v_u_3, (copy) v_u_1
	local function v22()
		-- upvalues: (copy) p_u_21, (ref) v_u_3
		p_u_21.moveVector = v_u_3
		p_u_21.forwardValue = 0
		p_u_21.backwardValue = 0
		p_u_21.leftValue = 0
		p_u_21.rightValue = 0
		p_u_21.jumpRequested = false
		p_u_21:UpdateJump()
	end
	p_u_21.textFocusReleasedConn = v_u_1.TextBoxFocusReleased:Connect(v22)
	p_u_21.textFocusGainedConn = v_u_1.TextBoxFocused:Connect(function(_)
		-- upvalues: (copy) p_u_21
		p_u_21.jumpRequested = false
		p_u_21:UpdateJump()
	end)
	p_u_21.windowFocusReleasedConn = v_u_1.WindowFocused:Connect(v22)
end
function v_u_5.DisconnectFocusEventListeners(p23)
	if p23.textFocusReleasedConn then
		p23.textFocusReleasedConn:Disconnect()
		p23.textFocusReleasedConn = nil
	end
	if p23.textFocusGainedConn then
		p23.textFocusGainedConn:Disconnect()
		p23.textFocusGainedConn = nil
	end
	if p23.windowFocusReleasedConn then
		p23.windowFocusReleasedConn:Disconnect()
		p23.windowFocusReleasedConn = nil
	end
end
return v_u_5
