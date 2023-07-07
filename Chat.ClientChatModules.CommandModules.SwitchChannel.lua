-- decompiled by Sentinel (took 1.118905ms)
local v_u_1 = require(script.Parent:WaitForChild("Util"))
local v_u_2 = nil
pcall(function()
	-- upvalues: (ref) v_u_2
	v_u_2 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
v_u_2 = v_u_2 == nil and {
	["Get"] = function(_, _, p3)
		return p3
	end
} or v_u_2
function ProcessMessage(p4, p5, p6)
	-- upvalues: (copy) v_u_1, (ref) v_u_2
	if string.sub(p4, 1, 3):lower() ~= "/c " then
		return false
	end
	local v7 = string.sub(p4, 4)
	local v8 = p5:GetChannel(v7)
	if v8 then
		p5:SwitchCurrentChannel(v7)
		if not p6.ShowChannelsBar and p5:GetCurrentChannel() then
			v_u_1:SendSystemMessageToSelf(string.gsub(v_u_2:Get("GameChat_SwitchChannel_NowInChannel", string.format("You are now chatting in channel: \'%s\'", v7), {
				["RBX_NAME"] = v7
			}), "{RBX_NAME}", v7), v8, {})
		end
	else
		local v9 = p5:GetCurrentChannel()
		if v9 then
			v_u_1:SendSystemMessageToSelf(string.gsub(v_u_2:Get("GameChat_SwitchChannel_NotInChannel", string.format("You are not in channel: \'%s\'", v7), {
				["RBX_NAME"] = v7
			}), "{RBX_NAME}", v7), v9, {
				["ChatColor"] = Color3.fromRGB(245, 50, 50)
			})
		end
	end
	return true
end
return {
	[v_u_1.KEY_COMMAND_PROCESSOR_TYPE] = v_u_1.COMPLETED_MESSAGE_PROCESSOR, 
	[v_u_1.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}
