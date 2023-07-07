-- decompiled by Sentinel (took 774.012µs)
local v_u_1 = game:GetService("StarterGui")
local v2 = require(script.Parent:WaitForChild("Util"))
function ProcessMessage(p3, _, _)
	-- upvalues: (copy) v_u_1
	if string.sub(p3, 1, 8):lower() ~= "/console" and string.sub(p3, 1, 11):lower() ~= "/newconsole" then
		return false
	end
	local v4, v_u_5 = pcall(function()
		-- upvalues: (ref) v_u_1
		return v_u_1:GetCore("DevConsoleVisible")
	end)
	if v4 then
		local v6, v7 = pcall(function()
			-- upvalues: (ref) v_u_1, (copy) v_u_5
			v_u_1:SetCore("DevConsoleVisible", not v_u_5)
		end)
		if not v6 and v7 then
			print("Error making developer console visible: " .. v7)
		end
	end
	return true
end
return {
	[v2.KEY_COMMAND_PROCESSOR_TYPE] = v2.COMPLETED_MESSAGE_PROCESSOR, 
	[v2.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}
