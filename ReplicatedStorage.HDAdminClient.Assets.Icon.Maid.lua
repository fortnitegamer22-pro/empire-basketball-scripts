-- decompiled by Sentinel (took 9.288242ms)
local v_u_23 = {
	["ClassName"] = "Maid", 
	["new"] = function()
		-- upvalues: (copy) v_u_23
		return setmetatable({
			["_tasks"] = {}
		}, v_u_23)
	end, 
	["isMaid"] = function(p1)
		local v2
		if type(p1) == "table" then
			v2 = p1.ClassName == "Maid"
		else
			v2 = false
		end
		return v2
	end, 
	["__index"] = function(p3, p4)
		-- upvalues: (copy) v_u_23
		if v_u_23[p4] then
			return v_u_23[p4]
		else
			return p3._tasks[p4]
		end
	end, 
	["__newindex"] = function(p5, p6, p7)
		-- upvalues: (copy) v_u_23
		if v_u_23[p6] ~= nil then
			error(("\'%s\' is reserved"):format(tostring(p6)), 2)
		end
		local v8 = p5._tasks
		local v9 = v8[p6]
		if v9 ~= p7 then
			v8[p6] = p7
			if v9 then
				if type(v9) == "function" then
					v9()
					return
				end
				if typeof(v9) == "RBXScriptConnection" then
					v9:Disconnect()
					return
				end
				if v9.Destroy then
					v9:Destroy()
					return
				end
				if v9.destroy then
					v9:destroy()
				end
			end
		end
	end, 
	["giveTask"] = function(p10, p11)
		if not p11 then
			error("Task cannot be false or nil", 2)
		end
		local v12 = #p10._tasks + 1
		p10[v12] = p11
		if type(p11) == "table" and not (p11.Destroy or p11.destroy) then
			warn("[Maid.GiveTask] - Gave table task without .Destroy\n\n" .. debug.traceback())
		end
		return v12
	end, 
	["give"] = function(p13, p14)
		if type(p14) ~= "table" or not p14.isAPromise then
			return p14, p13:giveTask(p14)
		end
		local v15, v16 = p13:givePromise(p14)
		_ = v15
		return p14, v16
	end, 
	["doCleaning"] = function(p17)
		local v18 = p17._tasks
		for v19, v20 in pairs(v18) do
			if typeof(v20) == "RBXScriptConnection" then
				v18[v19] = nil
				v20:Disconnect()
			end
		end
		local v21, v22 = next(v18)
		while v22 ~= nil do
			v18[v21] = nil
			if type(v22) == "function" then
				v22()
			elseif typeof(v22) == "RBXScriptConnection" then
				v22:Disconnect()
			elseif v22.Destroy then
				v22:Destroy()
			elseif v22.destroy then
				v22:destroy()
			end
			v21, v22 = next(v18)
		end
	end
}
v_u_23.destroy = v_u_23.doCleaning
v_u_23.clean = v_u_23.doCleaning
return v_u_23
