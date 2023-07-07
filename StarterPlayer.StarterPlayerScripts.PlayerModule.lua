-- decompiled by Sentinel (took 517.866µs)
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new()
	-- upvalues: (copy) v_u_1
	local v2 = setmetatable({}, v_u_1)
	v2.cameras = require(script:WaitForChild("CameraModule"))
	v2.controls = require(script:WaitForChild("ControlModule"))
	return v2
end
function v_u_1.GetCameras(p3)
	return p3.cameras
end
function v_u_1.GetControls(p4)
	return p4.controls
end
function v_u_1.GetClickToMoveController(p5)
	return p5.controls:GetClickToMoveController()
end
return v_u_1.new()
