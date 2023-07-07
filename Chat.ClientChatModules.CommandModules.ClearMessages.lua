-- decompiled by Sentinel (took 557.123µs)
local v1 = require(script.Parent:WaitForChild("Util"))
function ProcessMessage(p2, p3, _)
	if string.sub(p2, 1, 4):lower() ~= "/cls" and string.sub(p2, 1, 6):lower() ~= "/clear" then
		return false
	end
	local v4 = p3:GetCurrentChannel()
	if v4 then
		v4:ClearMessageLog()
	end
	return true
end
return {
	[v1.KEY_COMMAND_PROCESSOR_TYPE] = v1.COMPLETED_MESSAGE_PROCESSOR, 
	[v1.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}
