-- decompiled by Sentinel (took 2.246492ms)
local v1 = game:GetService("Chat")
local v2 = v1:WaitForChild("ClientChatModules")
local v_u_3 = require(v2:WaitForChild("ChatConstants"))
local v_u_4 = require(v2:WaitForChild("ChatSettings"))
local v_u_5 = require(v1:WaitForChild("ChatModules").Utility.DisplayNameHelpers)
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
local v_u_8 = {
	["ChatColor"] = v_u_4.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}
return function(p_u_9)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (ref) v_u_6, (copy) v_u_8, (copy) v_u_3
	local function v_u_12(p10)
		if string.sub(p10, 1, 1) == "\"" then
			local v11 = string.find(p10, "\"", 2)
			if v11 then
				return string.sub(p10, 2, v11 - 1)
			end
		else
			p10 = string.match(p10, "^[^%s]+") or p10
		end
		return p10
	end
	local function v_u_21(p13, p14, p15)
		-- upvalues: (copy) v_u_12, (copy) p_u_9, (ref) v_u_4, (ref) v_u_5, (ref) v_u_6, (ref) v_u_8
		local v16 = v_u_12(p14)
		local v17 = p_u_9:GetSpeaker(p13)
		if v17 then
			local v18, v19
			if v_u_4.PlayerDisplayNamesEnabled then
				v18, v19 = v_u_5.getUserNameFromChattedName(v16, p13, v17:GetNameForDisplay())
			else
				v18, v19 = v_u_5.getUserNameFromChattedName(v16, p13, nil)
			end
			local v20 = p_u_9:GetSpeaker(v18)
			if v19 == v_u_5.CommandErrorCodes.ChattingToSelf then
				v17:SendSystemMessage(v_u_6:FormatMessageToSend("GameChat_DoMuteCommand_CannotMuteSelf", "You cannot mute yourself."), p15, v_u_8)
				return
			end
			if v19 == v_u_5.CommandErrorCodes.NoMatches then
				v17:SendSystemMessage(v_u_6:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker \'%s\' does not exist.", tostring(v16)), "RBX_NAME", tostring(v18)), p15, v_u_8)
				return
			end
			if v19 == v_u_5.CommandErrorCodes.MultipleMatches then
				v17:SendSystemMessage(v_u_6:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), p15, v_u_8)
				v17:SendSystemMessage(v_u_5.getUsersWithDisplayNameString(v16, p13), p15, v_u_8)
				return
			end
			if v20 then
				v17:AddMutedSpeaker(v20.Name)
				if v_u_4.PlayerDisplayNamesEnabled then
					v18 = v20:GetNameForDisplay()
				end
				v17:SendSystemMessage(v_u_6:FormatMessageToSend("GameChat_ChatMain_SpeakerHasBeenMuted", string.format("Speaker \'%s\' has been muted.", v18), "RBX_NAME", v18), p15)
			end
		end
	end
	local function v_u_30(p22, p23, p24)
		-- upvalues: (copy) v_u_12, (copy) p_u_9, (ref) v_u_4, (ref) v_u_5, (ref) v_u_6, (ref) v_u_8
		local v25 = v_u_12(p23)
		local v26 = p_u_9:GetSpeaker(p22)
		if v26 then
			local v27, v28
			if v_u_4.PlayerDisplayNamesEnabled then
				v27, v28 = v_u_5.getUserNameFromChattedName(v25, p22, v26:GetNameForDisplay())
			else
				v27, v28 = v_u_5.getUserNameFromChattedName(v25, p22, nil)
			end
			local v29 = p_u_9:GetSpeaker(v27)
			if v28 == v_u_5.CommandErrorCodes.ChattingToSelf then
				v26:SendSystemMessage(v_u_6:FormatMessageToSend("GameChat_DoMuteCommand_CannotMuteSelf", "You cannot mute yourself."), p24, v_u_8)
				return
			end
			if v28 == v_u_5.CommandErrorCodes.NoMatches then
				v26:SendSystemMessage(v_u_6:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker \'%s\' does not exist.", tostring(v27)), "RBX_NAME", tostring(v27)), p24, v_u_8)
				return
			end
			if v28 == v_u_5.CommandErrorCodes.MultipleMatches then
				v26:SendSystemMessage(v_u_6:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), p24, v_u_8)
				v26:SendSystemMessage(v_u_5.getUsersWithDisplayNameString(v25, p22), p24, v_u_8)
				return
			end
			if v29 then
				v26:RemoveMutedSpeaker(v29.Name)
				if v_u_4.PlayerDisplayNamesEnabled then
					v27 = v29:GetNameForDisplay()
				end
				v26:SendSystemMessage(v_u_6:FormatMessageToSend("GameChat_ChatMain_SpeakerHasBeenUnMuted", string.format("Speaker \'%s\' has been unmuted.", v27), "RBX_NAME", v27), p24)
				return
			end
		end
	end
	p_u_9:RegisterProcessCommandsFunction("mute_commands", function(p31, p32, p33)
		-- upvalues: (copy) v_u_21, (copy) v_u_30
		local v34 = false
		if string.sub(p32, 1, 6):lower() == "/mute " then
			v_u_21(p31, string.sub(p32, 7), p33)
			return true
		else
			if string.sub(p32, 1, 8):lower() == "/unmute " then
				v_u_30(p31, string.sub(p32, 9), p33)
				v34 = true
			end
			return v34
		end
	end, v_u_3.StandardPriority)
end
