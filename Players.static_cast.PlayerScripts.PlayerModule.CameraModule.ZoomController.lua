-- decompiled by Sentinel (took 1.807836ms)
local v_u_1 = require(script:WaitForChild("Popper"))
local v_u_2 = math.clamp
local v_u_3 = math.exp
local v_u_4 = math.min
local v_u_5 = math.max
local v_u_6 = math.pi
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = game:GetService("Players").LocalPlayer
assert(v_u_9)
local function v10()
	-- upvalues: (ref) v_u_7, (copy) v_u_9, (ref) v_u_8
	v_u_7 = v_u_9.CameraMinZoomDistance
	v_u_8 = v_u_9.CameraMaxZoomDistance
end
v_u_7 = v_u_9.CameraMinZoomDistance
v_u_8 = v_u_9.CameraMaxZoomDistance
v_u_9:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(v10)
v_u_9:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(v10)
local v_u_11 = {}
v_u_11.__index = v_u_11
function v_u_11.new(p12, p13, p14, p15)
	-- upvalues: (copy) v_u_2, (copy) v_u_11
	local v16 = v_u_2(p13, p14, p15)
	return setmetatable({
		["freq"] = p12, 
		["x"] = v16, 
		["v"] = 0, 
		["minValue"] = p14, 
		["maxValue"] = p15, 
		["goal"] = v16
	}, v_u_11)
end
function v_u_11.Step(p17, p18)
	-- upvalues: (copy) v_u_6, (copy) v_u_3
	local v19 = p17.freq * 2 * v_u_6
	local v20 = p17.v
	local v21 = p17.minValue
	local v22 = p17.maxValue
	local v23 = p17.goal
	local v24 = v23 - p17.x
	local v25 = v19 * p18
	local v26 = v_u_3(-v25)
	local v27 = v23 + (v20 * p18 - v24 * (v25 + 1)) * v26
	local v28 = ((v24 * v19 - v20) * v25 + v20) * v26
	if v27 < v21 then
		v22 = v21
		v28 = 0
	elseif v22 < v27 then
		v28 = 0
	else
		v22 = v27
	end
	p17.x = v22
	p17.v = v28
	return v22
end
local v_u_29 = v_u_11.new(4.5, 12.5, 0.5, v_u_8)
local v_u_30 = 0
return {
	["Update"] = function(p31, p32, p33)
		-- upvalues: (copy) v_u_29, (ref) v_u_30, (ref) v_u_7, (ref) v_u_8, (copy) v_u_2, (copy) v_u_5, (copy) v_u_1, (copy) v_u_4
		local v34 = math.huge
		if 1 < v_u_29.goal then
			local v35 = v_u_29.goal
			local v36 = v_u_30
			local v37 = v_u_7
			local v38 = v_u_2(v35 + v36 * (1 + v35 * 0.0375), v37, v_u_8)
			v34 = v_u_1(p32 * CFrame.new(0, 0, 0.5), v_u_5(v_u_29.x, v38 < 1 and (v36 <= 0 and v37 and v37 or 1) or v38) - 0.5, p33) + 0.5
		end
		v_u_29.minValue = 0.5
		v_u_29.maxValue = v_u_4(v_u_8, v34)
		return v_u_29:Step(p31)
	end, 
	["GetZoomRadius"] = function()
		-- upvalues: (copy) v_u_29
		return v_u_29.x
	end, 
	["SetZoomParameters"] = function(p39, p40)
		-- upvalues: (copy) v_u_29, (ref) v_u_30
		v_u_29.goal = p39
		v_u_30 = p40
	end, 
	["ReleaseSpring"] = function()
		-- upvalues: (copy) v_u_29
		v_u_29.x = v_u_29.goal
		v_u_29.v = 0
	end
}
