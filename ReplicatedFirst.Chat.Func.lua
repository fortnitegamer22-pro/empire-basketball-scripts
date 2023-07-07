-- decompiled by Sentinel (took 3.447143ms)
local v1 = game:GetService("RunService")
local v_u_2 = v1.Heartbeat
local v_u_3 = Vector2.new
local v_u_4 = Instance.new
local v_u_5 = math.cos
local v_u_6 = math.sin
local v_u_7 = math.pi
local v_u_8 = coroutine.create
local v_u_9 = coroutine.resume
local v_u_10 = {}
local v_u_55 = {
	["Linear"] = function(p11, p12, p13, p14)
		return p12 + p13 * p11 / p14
	end, 
	["SineIn"] = function(p15, p16, p17, p18)
		-- upvalues: (copy) v_u_7, (copy) v_u_5
		return -p17 * v_u_5(p15 / p18 * v_u_7 / 2) + p17 + p16
	end, 
	["SineOut"] = function(p19, p20, p21, p22)
		-- upvalues: (copy) v_u_7, (copy) v_u_6
		return p21 * v_u_6(p19 / p22 * v_u_7 / 2) + p20
	end, 
	["QuadIn"] = function(p23, p24, p25, p26)
		local v27 = p23 / p26
		return p25 * v27 * v27 + p24
	end, 
	["QuadOut"] = function(p28, p29, p30, p31)
		local v32 = p28 / p31
		return -p30 * v32 * (v32 - 2) + p29
	end, 
	["BackIn"] = function(p33, p34, p35, p36)
		local v37 = p33 / p36
		return p35 * v37 * v37 * (2.70158 * v37 - 1.70158) + p34
	end, 
	["BackOut"] = function(p38, p39, p40, p41)
		local v42 = p38 / p41 - 1
		return p40 * (v42 * v42 * (2.70158 * v42 + 1.70158) + 1) + p39
	end, 
	["BounceOut"] = function(p43, p44, p45, p46)
		local v47 = p43 / p46
		if v47 < 0.36363636363636365 then
			return p45 * 7.5625 * v47 * v47 + p44
		elseif v47 < 0.7272727272727273 then
			local v48 = v47 - 0.5454545454545454
			return p45 * (7.5625 * v48 * v48 + 0.75) + p44
		elseif v47 < 0.9090909090909091 then
			local v49 = v47 - 0.8181818181818182
			return p45 * (7.5625 * v49 * v49 + 0.9375) + p44
		else
			local v50 = v47 - 0.9545454545454546
			return p45 * (7.5625 * v50 * v50 + 0.984375) + p44
		end
	end, 
	["BounceIn"] = function(p51, p52, p53, p54)
		-- upvalues: (copy) v_u_55
		return p53 - v_u_55.BounceOut(p54 - p51, 0, p53, p54) + p52
	end
}
return {
	game:GetService("ContentProvider"), 
	game:GetService("DataStoreService"), 
	game:GetService("Debris"), 
	game:GetService("InsertService"), 
	game:GetService("Lighting"), 
	game:GetService("MarketplaceService"), 
	game:GetService("Players"), 
	game:GetService("ReplicatedFirst"), 
	game:GetService("ReplicatedStorage"), 
	v1, 
	game:GetService("ServerScriptService"), 
	game:GetService("ServerStorage"), 
	v_u_2, 
	game:GetService("Teams"), 
	game:GetService("TeleportService"), 
	game:GetService("UserInputService"), 
	BrickColor.new, 
	Color3.new, 
	CFrame.new, 
	CFrame.Angles, 
	UDim2.new, 
	v_u_3, 
	Vector3.new, 
	v_u_4, 
	math.abs, 
	math.ceil, 
	math.deg, 
	math.floor, 
	math.max, 
	math.min, 
	v_u_5, 
	math.rad, 
	v_u_6, 
	v_u_7, 
	math.random, 
	function(p56)
		return p56 + 0.5 - (p56 + 0.5) % 1
	end, 
	function(p_u_57, p_u_58, p_u_59)
		-- upvalues: (copy) v_u_4
		return function(p60, _)
			-- upvalues: (ref) v_u_4, (copy) p_u_57, (copy) p_u_58, (copy) p_u_59
			local v61 = v_u_4(p_u_57)
			for v62, v63 in next, p60, nil do
				if tonumber(v62) then
					v63.Parent = v61
				else
					v61[v62] = v63
				end
			end
			v61.Parent = v61.Parent or p_u_58
			v61.Name = p_u_59 or v61.Name
			return v61
		end
	end, 
	function(p64, p65)
		-- upvalues: (copy) v_u_3
		return (v_u_3(p64.x, p64.z) - v_u_3(p65.x, p65.z)).magnitude
	end, 
	function(p66, p67)
		return p66:FindFirstChild(p67)
	end, 
	function(p68, p69, p70)
		local v71 = p69 - p68
		return workspace:FindPartOnRayWithIgnoreList(Ray.new(p68, v71.unit * math.min(v71.magnitude, 999)), p70 or {}, false, true)
	end, 
	function(p72, _)
		for v73, v74 in next, p72, nil do
			local v75 = math.ceil(math.random() * v73)
			p72[v73] = p72[v75]
			p72[v75] = v74
		end
		return p72
	end, 
	function(p76, p77, p78, p79)
		-- upvalues: (copy) v_u_10, (copy) v_u_55, (copy) v_u_2
		v_u_10[p76] = v_u_10[p76] or {}
		local v80 = v_u_10[p76]
		local v81 = v_u_55[p79] or v_u_55.Linear
		local v82, _ = tick()
		for v83, v84 in next, p77, nil do
			p77[v83] = { v84, p76[v83], v84 - p76[v83] }
			v80[v83] = v82
		end
		while true do
			v_u_2:wait()
			local v85 = tick() - v82
			for v86, v87 in next, p77, nil do
				if v80[v86] == v82 then
					p76[v86] = v81(v85, v87[2], v87[3], p78)
				end
			end
			if p78 < v85 then
				for v88, v89 in next, p77, nil do
					if v80[v88] == v82 then
						p76[v88] = v89[1]
						v80[v88] = nil
					end
				end
				return
			end
		end
	end, 
	function(p90, p91)
		return p90:FindFirstChild(p91) or p90:WaitForChild(p91)
	end, 
	function(p92, ...)
		-- upvalues: (copy) v_u_9, (copy) v_u_8
		return v_u_9(v_u_8(p92), ...)
	end
}
