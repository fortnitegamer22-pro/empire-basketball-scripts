-- decompiled by Sentinel (took 2.599845ms)
local v1 = require(script.Parent.Parent.CameraUtils)
local v_u_2 = require(script.Parent.VehicleCameraConfig)
local v_u_3 = v1.map
local v_u_4 = v1.mapClamp
local v_u_5 = v1.sanitizeAngle
local v_u_6 = {}
v_u_6.__index = v_u_6
function v_u_6.new(p7, p8, p9)
	-- upvalues: (copy) v_u_6
	return setmetatable({
		["fRising"] = p7, 
		["fFalling"] = p8, 
		["g"] = p9, 
		["p"] = p9, 
		["v"] = p9 * 0
	}, v_u_6)
end
function v_u_6.step(p10, p11)
	local v12 = p10.fRising
	local v13 = p10.fFalling
	local v14 = p10.g
	local v15 = p10.p
	local v16 = p10.v
	local v17 = 2 * math.pi
	if 0 < v16 then
		v13 = v12 or v13
	end
	local v18 = v17 * v13
	local v19 = v15 - v14
	local v20 = math.exp(-v18 * p11)
	local v21 = (v19 * (1 + v18 * p11) + v16 * p11) * v20 + v14
	p10.p = v21
	p10.v = (v16 * (1 - v18 * p11) - v19 * v18 * v18 * p11) * v20
	return v21
end
local v_u_22 = {}
v_u_22.__index = v_u_22
function v_u_22.new(p23)
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_2, (copy) v_u_22
	assert(typeof(p23) == "CFrame")
	local v24 = {}
	local _, v25 = p23:toEulerAnglesYXZ()
	v24.yawG = v_u_5(v25)
	local _, v26 = p23:toEulerAnglesYXZ()
	v24.yawP = v_u_5(v26)
	v24.yawV = 0
	v24.pitchG = v_u_5((p23:toEulerAnglesYXZ()))
	v24.pitchP = v_u_5((p23:toEulerAnglesYXZ()))
	v24.pitchV = 0
	v24.fSpringYaw = v_u_6.new(v_u_2.yawReponseDampingRising, v_u_2.yawResponseDampingFalling, 0)
	v24.fSpringPitch = v_u_6.new(v_u_2.pitchReponseDampingRising, v_u_2.pitchResponseDampingFalling, 0)
	return setmetatable(v24, v_u_22)
end
function v_u_22.setGoal(p27, p28)
	-- upvalues: (copy) v_u_5
	assert(typeof(p28) == "CFrame")
	local _, v29 = p28:toEulerAnglesYXZ()
	p27.yawG = v_u_5(v29)
	p27.pitchG = v_u_5((p28:toEulerAnglesYXZ()))
end
function v_u_22.getCFrame(p30)
	return CFrame.fromEulerAnglesYXZ(p30.pitchP, p30.yawP, 0)
end
function v_u_22.step(p31, p32, p33, p34, p35)
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2, (copy) v_u_5
	assert(typeof(p32) == "number")
	assert(typeof(p34) == "number")
	assert(typeof(p33) == "number")
	assert(typeof(p35) == "number")
	local v36 = p31.fSpringYaw
	local v37 = p31.fSpringPitch
	v36.g = v_u_4(v_u_3(p35, 0, 1, p34, 0), math.rad(v_u_2.cutoffMinAngularVelYaw), math.rad(v_u_2.cutoffMaxAngularVelYaw), 1, 0)
	v37.g = v_u_4(v_u_3(p35, 0, 1, p33, 0), math.rad(v_u_2.cutoffMinAngularVelPitch), math.rad(v_u_2.cutoffMaxAngularVelPitch), 1, 0)
	local v38 = 2 * math.pi * v_u_2.pitchStiffness * v37:step(p32) * v_u_3(p35, 0, 1, 1, v_u_2.firstPersonResponseMul)
	local v39 = 2 * math.pi * v_u_2.yawStiffness * v36:step(p32) * v_u_3(p35, 0, 1, 1, v_u_2.firstPersonResponseMul)
	local v40 = p31.yawG
	local v41 = p31.yawV
	local v42 = v_u_5(p31.yawP - v40)
	local v43 = math.exp(-v39 * p32)
	p31.yawP = v_u_5((v42 * (1 + v39 * p32) + v41 * p32) * v43 + v40)
	p31.yawV = (v41 * (1 - v39 * p32) - v42 * v39 * v39 * p32) * v43
	local v44 = p31.pitchG
	local v45 = p31.pitchV
	local v46 = v_u_5(p31.pitchP - v44)
	local v47 = math.exp(-v38 * p32)
	p31.pitchP = v_u_5((v46 * (1 + v38 * p32) + v45 * p32) * v47 + v44)
	p31.pitchV = (v45 * (1 - v38 * p32) - v46 * v38 * v38 * p32) * v47
	return p31:getCFrame()
end
local v_u_48 = {}
v_u_48.__index = v_u_48
function v_u_48.new(p49)
	-- upvalues: (copy) v_u_22, (copy) v_u_48
	return setmetatable({
		["vrs"] = v_u_22.new(p49)
	}, v_u_48)
end
function v_u_48.step(p50, p51, p52, p53, p54)
	return p50.vrs:step(p51, p52, p53, p54)
end
function v_u_48.setTransform(p55, p56)
	p55.vrs:setGoal(p56)
end
return v_u_48
