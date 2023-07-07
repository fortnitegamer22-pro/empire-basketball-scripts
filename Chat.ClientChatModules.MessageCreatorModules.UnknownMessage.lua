-- decompiled by Sentinel (took 376.187µs)
require(script.Parent.Parent:WaitForChild("ChatSettings"))
local v1 = require(script.Parent:WaitForChild("Util"))
function CreateUnknownMessageLabel(p2)
	print("No message creator for message: " .. p2.Message)
end
return {
	[v1.KEY_MESSAGE_TYPE] = "UnknownMessage", 
	[v1.KEY_CREATOR_FUNCTION] = CreateUnknownMessageLabel
}
