-- decompiled by Sentinel (took 1.785887ms)
local v_u_1 = game:GetService("Chat")
local v_u_2 = game:GetService("RunService")
local v3 = v_u_1:WaitForChild("ClientChatModules")
local v_u_4 = require(v3:WaitForChild("ChatSettings"))
local v_u_5 = require(v3:WaitForChild("ChatConstants"))
local v_u_6 = nil
pcall(function()
	-- upvalues: (ref) v_u_6
	v_u_6 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
v_u_6 = v_u_6 == nil and {} or v_u_6
if not (v_u_6.FormatMessageToSend and v_u_6.LocalizeFormattedMessage) then
	function v_u_6.FormatMessageToSend(_, _, p7)
		return p7
	end
end
local v_u_8 = not v_u_4.DisallowedWhiteSpace and {
	"\n", 
	"\r", 
	"\t", 
	"\11", 
	"\f"
} or v_u_4.DisallowedWhiteSpace
local function v_u_10(p9)
	-- upvalues: (copy) v_u_4
	if p9:len() > v_u_4.MaximumMessageLength * 6 then
		return false
	elseif utf8.len(p9) == nil then
		return false
	else
		return utf8.len(utf8.nfcnormalize(p9)) <= v_u_4.MaximumMessageLength
	end
end
return function(p_u_11)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (ref) v_u_6, (copy) v_u_10, (ref) v_u_8, (copy) v_u_5
	p_u_11:RegisterProcessCommandsFunction("message_validation", function(p12, p13, p14)
		-- upvalues: (copy) p_u_11, (ref) v_u_2, (ref) v_u_1, (ref) v_u_6, (ref) v_u_10, (ref) v_u_8
		local v15 = p_u_11:GetSpeaker(p12)
		local v_u_16 = v15:GetPlayer()
		if v15 then
			if v_u_16 then
				if v_u_2:IsStudio() or v_u_16.UserId >= 1 then
					local v17
					if v_u_2:IsStudio() then
						v17 = true
					else
						local v18, v19 = pcall(function()
							-- upvalues: (ref) v_u_1, (copy) v_u_16
							return v_u_1:CanUserChatAsync(v_u_16.UserId)
						end)
						v17 = v18 and v19
					end
					if v17 then
						if v_u_10(p13) then
							for _, v20 in pairs(v_u_8) do
								if p13:find(v20) then
									v15:SendSystemMessage(v_u_6:FormatMessageToSend("GameChat_ChatMessageValidator_WhitespaceError", "Your message contains whitespace that is not allowed."), p14)
									return true
								end
							end
							return false
						else
							v15:SendSystemMessage(v_u_6:FormatMessageToSend("GameChat_ChatMessageValidator_MaxLengthError", "Your message exceeds the maximum message length."), p14)
							return true
						end
					else
						v15:SendSystemMessage(v_u_6:FormatMessageToSend("GameChat_ChatMessageValidator_SettingsError", "Your chat settings prevent you from sending messages."), p14)
						return true
					end
				else
					return true
				end
			else
				return false
			end
		else
			return false
		end
	end, v_u_5.VeryHighPriority)
end
