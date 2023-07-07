-- decompiled by Sentinel (took 547.031µs)
local v_u_1 = require(script.Parent.Parent:WaitForChild("ChatConstants"))
local v2 = {}
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.SendSystemMessageToSelf(_, p4, p5, p6)
	-- upvalues: (copy) v_u_1
	p5:AddMessageToChannel({
		["ID"] = -1, 
		["FromSpeaker"] = nil, 
		["SpeakerUserId"] = 0, 
		["OriginalChannel"] = p5.Name, 
		["IsFiltered"] = true, 
		["MessageLength"] = string.len(p4), 
		["MessageLengthUtf8"] = utf8.len(utf8.nfcnormalize(p4)), 
		["Message"] = p4, 
		["MessageType"] = v_u_1.MessageTypeSystem, 
		["Time"] = os.time(), 
		["ExtraData"] = p6
	})
end
function v2.new()
	-- upvalues: (copy) v_u_3
	local v7 = setmetatable({}, v_u_3)
	v7.COMMAND_MODULES_VERSION = 1
	v7.KEY_COMMAND_PROCESSOR_TYPE = "ProcessorType"
	v7.KEY_PROCESSOR_FUNCTION = "ProcessorFunction"
	v7.IN_PROGRESS_MESSAGE_PROCESSOR = 0
	v7.COMPLETED_MESSAGE_PROCESSOR = 1
	return v7
end
return v2.new()
