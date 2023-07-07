-- decompiled by Sentinel (took 3.486083ms)
local v_u_1 = game:GetService("Chat")
local v_u_2 = game:GetService("RunService")
local v3 = v_u_1:WaitForChild("ClientChatModules")
local v_u_4 = require(v3:WaitForChild("ChatConstants"))
local v_u_5 = require(v3:WaitForChild("ChatSettings"))
local v_u_6 = require(v_u_1:WaitForChild("ChatModules").Utility.DisplayNameHelpers)
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
local v_u_9 = {
	["ChatColor"] = v_u_5.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}
return function(p_u_10)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_5, (copy) v_u_6, (ref) v_u_7, (copy) v_u_9, (copy) v_u_4
	local function v_u_17(p11, p12)
		-- upvalues: (ref) v_u_2, (ref) v_u_1
		if v_u_2:IsStudio() then
			return true
		end
		local v_u_13 = p11:GetPlayer()
		local v_u_14 = p12:GetPlayer()
		if not (v_u_13 and v_u_14) then
			return false
		end
		local v15, v16 = pcall(function()
			-- upvalues: (ref) v_u_1, (copy) v_u_13, (copy) v_u_14
			return v_u_1:CanUsersChatAsync(v_u_13.UserId, v_u_14.UserId)
		end)
		return v15 and v16
	end
	local function v_u_29(p18, p19, p20)
		-- upvalues: (copy) p_u_10, (ref) v_u_5, (ref) v_u_6, (ref) v_u_7, (ref) v_u_9, (ref) v_u_4, (copy) v_u_17
		local v21 = p_u_10:GetSpeaker(p18)
		local v22 = nil
		local v23
		if string.sub(p19, 1, 1) == "\"" then
			local v24 = string.find(p19, "\"", 2)
			if v24 then
				v23 = string.sub(p19, 2, v24 - 1)
				v22 = string.sub(p19, v24 + 2)
			else
				v23 = p19
			end
		else
			v23 = string.match(p19, "^[^%s]+")
			if v23 then
				v22 = string.sub(p19, string.len(v23) + 2)
			else
				v23 = p19
			end
		end
		local v25, v26
		if v_u_5.PlayerDisplayNamesEnabled and v_u_5.WhisperByDisplayNameEnabled then
			v25, v26 = v_u_6.getUserNameFromChattedName(v23, p18, v21:GetNameForDisplay())
		else
			v25, v26 = v_u_6.getUserNameFromChattedName(v23, p18, nil)
		end
		local v27 = p_u_10:GetSpeaker(v25)
		if v26 == v_u_6.CommandErrorCodes.ChattingToSelf then
			v21:SendSystemMessage(v_u_7:FormatMessageToSend("GameChat_PrivateMessaging_CannotWhisperToSelf", "You cannot whisper to yourself."), p20, v_u_9)
			return
		elseif v26 == v_u_6.CommandErrorCodes.NoMatches then
			v21:SendSystemMessage(v_u_7:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker \'%s\' does not exist.", tostring(v23)), "RBX_NAME", tostring(v25)), p20, v_u_9)
			return
		elseif v26 == v_u_6.CommandErrorCodes.MultipleMatches then
			v21:SendSystemMessage(v_u_7:FormatMessageToSend("InGame.Chat.Response.DisplayNameMultipleMatches", "Warning: The following users have this display name: "), p20, v_u_9)
			v21:SendSystemMessage(v_u_6.getUsersWithDisplayNameString(v23, p18), p20, v_u_9)
		elseif v27 then
			local v28 = p_u_10:GetChannel((not v_u_4.WhisperChannelPrefix and "To " or v_u_4.WhisperChannelPrefix) .. v25)
			if v28 then
				if v_u_17(v21, v27) then
					if not v21:IsInChannel(v28.Name) then
						v21:JoinChannel(v28.Name)
					end
					if v22 and 0 < string.len(v22) then
						v21:SayMessage(v22, v28.Name)
					end
					v21:SetMainChannel(v28.Name)
				else
					v21:SendSystemMessage(v_u_7:FormatMessageToSend("GameChat_PrivateMessaging_CannotChat", "You are not able to chat with this player."), p20, v_u_9)
				end
			end
			v21:SendSystemMessage(v_u_7:FormatMessageToSend("GameChat_MuteSpeaker_SpeakerDoesNotExist", string.format("Speaker \'%s\' does not exist.", tostring(v23)), "RBX_NAME", tostring(v25)), p20, v_u_9)
		end
	end
	local function v_u_37(p30, p31, p32)
		-- upvalues: (copy) p_u_10, (ref) v_u_4
		local v33 = p_u_10:GetSpeaker(p30)
		local v34 = v33.ExtraData
		v33:SendMessage(p31, p32, p30, v34)
		local v35 = p_u_10:GetSpeaker((string.sub(p32, 4)))
		local v36 = (not v_u_4.WhisperChannelPrefix and "To " or v_u_4.WhisperChannelPrefix) .. p30
		if v35 then
			if not v35:IsInChannel(v36) then
				v35:JoinChannel(v36)
			end
			v35:SendMessage(p31, v36, p30, v34)
		end
		return true
	end
	local function v_u_39(_, p38, _)
		-- upvalues: (ref) v_u_4
		if v_u_4.MessageTypeWhisper then
			p38.MessageType = v_u_4.MessageTypeWhisper
		end
	end
	p_u_10:RegisterProcessCommandsFunction("whisper_commands", function(p40, p41, p42)
		-- upvalues: (copy) v_u_29
		local v43 = false
		if string.sub(p41, 1, 3):lower() == "/w " then
			v_u_29(p40, string.sub(p41, 4), p42)
			return true
		else
			if string.sub(p41, 1, 9):lower() == "/whisper " then
				v_u_29(p40, string.sub(p41, 10), p42)
				v43 = true
			end
			return v43
		end
	end, v_u_4.StandardPriority)
	p_u_10.SpeakerAdded:connect(function(p44)
		-- upvalues: (copy) p_u_10, (ref) v_u_5, (ref) v_u_4, (ref) v_u_7, (copy) v_u_37, (copy) v_u_39
		local v45 = p_u_10:GetSpeaker(p44)
		local v46
		if v_u_5.PlayerDisplayNamesEnabled then
			if v45:GetPlayer() then
				v46 = v45:GetNameForDisplay() .. "(@" .. p44 .. ")"
			else
				v46 = p44
			end
		else
			v46 = p44
		end
		local v47 = (not v_u_4.WhisperChannelPrefix and "To " or v_u_4.WhisperChannelPrefix) .. p44
		if p_u_10:GetChannel(v47) then
			p_u_10:RemoveChannel(v47)
		end
		local v48 = p_u_10:AddChannel(v47)
		v48.Joinable = false
		v48.Leavable = true
		v48.AutoJoin = false
		v48.Private = true
		v48.WelcomeMessage = v_u_7:FormatMessageToSend("GameChat_PrivateMessaging_NowChattingWith", "You are now privately chatting with " .. v46 .. ".", "RBX_NAME", tostring(v46))
		local v49
		if v_u_5.WhisperChannelNameColor then
			v49 = v_u_5.WhisperChannelNameColor
		else
			v49 = Color3.fromRGB(102, 14, 102)
		end
		v48.ChannelNameColor = v49
		v48:RegisterProcessCommandsFunction("replication_function", v_u_37, v_u_4.LowPriority)
		v48:RegisterFilterMessageFunction("message_type_function", v_u_39)
	end)
	p_u_10.SpeakerRemoved:connect(function(p50)
		-- upvalues: (ref) v_u_4, (copy) p_u_10
		local v51 = (not v_u_4.WhisperChannelPrefix and "To " or v_u_4.WhisperChannelPrefix) .. p50
		if p_u_10:GetChannel(v51) then
			p_u_10:RemoveChannel(v51)
		end
	end)
end
