-- decompiled by Sentinel (took 12.31808ms)
local v_u_1 = game:GetService("ReplicatedStorage")
return {
	["addToReplicatedStorage"] = function()
		-- upvalues: (copy) v_u_1
		if v_u_1:FindFirstChild(script.Name) then
			return false
		end
		local v2 = Instance.new("ObjectValue")
		v2.Name = script.Name
		v2.Value = script.Parent
		v2.Parent = v_u_1
		return v2
	end, 
	["getObject"] = function()
		-- upvalues: (copy) v_u_1
		return v_u_1:FindFirstChild(script.Name) or false
	end
}
