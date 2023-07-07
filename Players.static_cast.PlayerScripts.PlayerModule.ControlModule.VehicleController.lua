-- decompiled by Sentinel (took 1.814084ms)
local v_u_1 = game:GetService("ContextActionService")
local v_u_2 = Vector3.new(0, 0, 0)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v5 = setmetatable({}, v_u_3)
	v5.CONTROL_ACTION_PRIORITY = p4
	v5.enabled = false
	v5.vehicleSeat = nil
	v5.throttle = 0
	v5.steer = 0
	v5.acceleration = 0
	v5.decceleration = 0
	v5.turningRight = 0
	v5.turningLeft = 0
	v5.vehicleMoveVector = v_u_2
	v5.autoPilot = {}
	v5.autoPilot.MaxSpeed = 0
	v5.autoPilot.MaxSteeringAngle = 0
	return v5
end
function v_u_3.BindContextActions(p_u_6)
	-- upvalues: (copy) v_u_1
	v_u_1:BindActionAtPriority("throttleAccel", function(p7, p8, p9)
		-- upvalues: (copy) p_u_6
		p_u_6:OnThrottleAccel(p7, p8, p9)
		return Enum.ContextActionResult.Pass
	end, false, p_u_6.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonR2)
	v_u_1:BindActionAtPriority("throttleDeccel", function(p10, p11, p12)
		-- upvalues: (copy) p_u_6
		p_u_6:OnThrottleDeccel(p10, p11, p12)
		return Enum.ContextActionResult.Pass
	end, false, p_u_6.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonL2)
	v_u_1:BindActionAtPriority("arrowSteerRight", function(p13, p14, p15)
		-- upvalues: (copy) p_u_6
		p_u_6:OnSteerRight(p13, p14, p15)
		return Enum.ContextActionResult.Pass
	end, false, p_u_6.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Right)
	v_u_1:BindActionAtPriority("arrowSteerLeft", function(p16, p17, p18)
		-- upvalues: (copy) p_u_6
		p_u_6:OnSteerLeft(p16, p17, p18)
		return Enum.ContextActionResult.Pass
	end, false, p_u_6.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Left)
end
function v_u_3.Enable(p19, p20, p21)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	if p20 ~= p19.enabled or p21 ~= p19.vehicleSeat then
		p19.enabled = p20
		p19.vehicleMoveVector = v_u_2
		if p20 then
			if p21 then
				p19.vehicleSeat = p21
				p19:SetupAutoPilot()
				p19:BindContextActions()
				return
			end
		else
			v_u_1:UnbindAction("throttleAccel")
			v_u_1:UnbindAction("throttleDeccel")
			v_u_1:UnbindAction("arrowSteerRight")
			v_u_1:UnbindAction("arrowSteerLeft")
			p19.vehicleSeat = nil
		end
	end
end
function v_u_3.OnThrottleAccel(p22, _, p23, _)
	if p23 == Enum.UserInputState.End or p23 == Enum.UserInputState.Cancel then
		p22.acceleration = 0
	else
		p22.acceleration = -1
	end
	p22.throttle = p22.acceleration + p22.decceleration
end
function v_u_3.OnThrottleDeccel(p24, _, p25, _)
	if p25 == Enum.UserInputState.End or p25 == Enum.UserInputState.Cancel then
		p24.decceleration = 0
	else
		p24.decceleration = 1
	end
	p24.throttle = p24.acceleration + p24.decceleration
end
function v_u_3.OnSteerRight(p26, _, p27, _)
	if p27 == Enum.UserInputState.End or p27 == Enum.UserInputState.Cancel then
		p26.turningRight = 0
	else
		p26.turningRight = 1
	end
	p26.steer = p26.turningRight + p26.turningLeft
end
function v_u_3.OnSteerLeft(p28, _, p29, _)
	if p29 == Enum.UserInputState.End or p29 == Enum.UserInputState.Cancel then
		p28.turningLeft = 0
	else
		p28.turningLeft = -1
	end
	p28.steer = p28.turningRight + p28.turningLeft
end
function v_u_3.Update(p30, p31, p32, _)
	-- upvalues: (copy) v_u_2
	if p30.vehicleSeat then
		if p32 then
			local v33 = p31 + Vector3.new(p30.steer, 0, p30.throttle)
			p30.vehicleSeat.ThrottleFloat = -v33.Z
			p30.vehicleSeat.SteerFloat = v33.X
			return v33, true
		else
			local v34 = p30.vehicleSeat.Occupant.RootPart.CFrame:VectorToObjectSpace(p31)
			p30.vehicleSeat.ThrottleFloat = p30:ComputeThrottle(v34)
			p30.vehicleSeat.SteerFloat = p30:ComputeSteer(v34)
			return v_u_2, true
		end
	else
		return p31, false
	end
end
function v_u_3.ComputeThrottle(_, p35)
	-- upvalues: (copy) v_u_2
	return p35 == v_u_2 and 0 or -p35.Z
end
function v_u_3.ComputeSteer(p36, p37)
	-- upvalues: (copy) v_u_2
	return p37 == v_u_2 and 0 or -math.atan2(-p37.x, -p37.z) * 180 / math.pi / p36.autoPilot.MaxSteeringAngle
end
function v_u_3.SetupAutoPilot(p38)
	p38.autoPilot.MaxSpeed = p38.vehicleSeat.MaxSpeed
	p38.autoPilot.MaxSteeringAngle = 35
end
return v_u_3
