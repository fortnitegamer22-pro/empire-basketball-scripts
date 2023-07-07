-- decompiled by Sentinel (took 765.003µs)
local v_u_1 = require(script.Parent:WaitForChild("Util"))
local v_u_2 = game:GetService("RunService")
local v_u_3 = nil
pcall(function()
	-- upvalues: (ref) v_u_3
	v_u_3 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
v_u_3 = v_u_3 == nil and {
	["Get"] = function(_, _, p4)
		return p4
	end
} or v_u_3
function ProcessMessage(_, p5, _)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (ref) v_u_3
	local v6 = game:GetService("Players").LocalPlayer
	if not v6 or v6.UserId >= 0 or v_u_2:IsStudio() then
		return false
	end
	local v7 = p5:GetCurrentChannel()
	if v7 then
		v_u_1:SendSystemMessageToSelf(v_u_3:Get("GameChat_SwallowGuestChat_Message", "Create a free account to get access to chat permissions!"), v7, {})
	end
	return true
end
return {
	[v_u_1.KEY_COMMAND_PROCESSOR_TYPE] = v_u_1.COMPLETED_MESSAGE_PROCESSOR, 
	[v_u_1.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}
