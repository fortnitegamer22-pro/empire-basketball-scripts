-- decompiled by Sentinel (took 1.557409ms)
local v_u_1 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatConstants"))
local v2, v3 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserAddChatThrottlingToAllChannels")
end)
if not v2 then
	v3 = false
end
local v_u_4 = not v3
local v_u_5 = {}
local v_u_6 = {}
local v_u_7 = nil
pcall(function()
	-- upvalues: (ref) v_u_7
	v_u_7 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
v_u_7 = v_u_7 == nil and {} or v_u_7
if not (v_u_7.FormatMessageToSend and v_u_7.LocalizeFormattedMessage) then
	function v_u_7.FormatMessageToSend(_, _, p8)
		return p8
	end
end
return function(p_u_9)
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (ref) v_u_4, (ref) v_u_7, (copy) v_u_1
	p_u_9:RegisterProcessCommandsFunction("flood_detection", function(p10, _, p11)
		-- upvalues: (ref) v_u_6, (copy) p_u_9, (ref) v_u_5, (ref) v_u_4, (ref) v_u_7
		if v_u_6[p10] then
			return false
		end
		local v12 = p_u_9:GetSpeaker(p10)
		if not v12 then
			return false
		end
		if not v12:GetPlayer() then
			return false
		end
		if not v_u_5[p10] then
			v_u_5[p10] = {}
		end
		local v13
		if v_u_4 then
			if not v_u_5[p10][p11] then
				v_u_5[p10][p11] = {}
			end
			v13 = v_u_5[p10][p11]
		else
			v13 = v_u_5[p10]
		end
		local v14 = tick()
		while 0 < #v13 and v13[1] < v14 do
			table.remove(v13, 1)
		end
		if #v13 < 7 then
			table.insert(v13, tick() + 15)
			return false
		end
		local v15 = math.ceil(v13[1] - v14)
		v12:SendSystemMessage(v_u_7:FormatMessageToSend("GameChat_ChatFloodDetector_MessageDisplaySeconds", string.format("You must wait %d %s before sending another message!", v15, 1 < v15 and "seconds" or "second"), "RBX_NUMBER", tostring(v15)), p11)
		return true
	end, v_u_1.LowPriority)
	p_u_9.SpeakerRemoved:connect(function(p16)
		-- upvalues: (ref) v_u_5
		v_u_5[p16] = nil
	end)
end
