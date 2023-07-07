-- decompiled by Sentinel (took 573.745µs)
local v_u_1 = Vector3.new(0, 0, 0)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new()
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v3 = setmetatable({}, v_u_2)
	v3.enabled = false
	v3.moveVector = v_u_1
	v3.moveVectorIsCameraRelative = true
	v3.isJumping = false
	return v3
end
function v_u_2.OnRenderStepped(_, _) end
function v_u_2.GetMoveVector(p4)
	return p4.moveVector
end
function v_u_2.IsMoveVectorCameraRelative(p5)
	return p5.moveVectorIsCameraRelative
end
function v_u_2.GetIsJumping(p6)
	return p6.isJumping
end
function v_u_2.Enable(_, _)
	error("BaseCharacterController:Enable must be overridden in derived classes and should not be called.")
	return false
end
return v_u_2
