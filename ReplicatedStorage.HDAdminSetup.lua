-- decompiled by Sentinel (took 498.794µs)
local v_u_3 = {
	["GetClientFolder"] = function(_)
		return game:GetService("ReplicatedStorage"):WaitForChild("HDAdminClient")
	end, 
	["GetMain"] = function(_, p1)
		-- upvalues: (copy) v_u_3
		local v2 = require(v_u_3:GetClientFolder():WaitForChild("SharedModules").MainFramework)
		if p1 ~= true then
			v2 = v2:CheckInitialized()
		end
		return v2
	end
}
return v_u_3
