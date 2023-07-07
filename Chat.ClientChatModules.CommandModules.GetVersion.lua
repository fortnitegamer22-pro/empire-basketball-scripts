-- decompiled by Sentinel (took 637.386µs)
local v_u_1 = require(script.Parent:WaitForChild("Util"))
local v_u_2 = require(script.Parent.Parent:WaitForChild("ChatConstants"))
return {
	[v_u_1.KEY_COMMAND_PROCESSOR_TYPE] = v_u_1.COMPLETED_MESSAGE_PROCESSOR, 
	[v_u_1.KEY_PROCESSOR_FUNCTION] = function(p3, p4, _)
		-- upvalues: (copy) v_u_1, (copy) v_u_2
		if string.sub(p3, 1, 8):lower() ~= "/version" and string.sub(p3, 1, 9):lower() ~= "/version " then
			return false
		end
		v_u_1:SendSystemMessageToSelf(string.format("This experience is running chat version [%d.%d.%s].", v_u_2.MajorVersion, v_u_2.MinorVersion, v_u_2.BuildVersion), p4:GetCurrentChannel(), {})
		return true
	end
}
