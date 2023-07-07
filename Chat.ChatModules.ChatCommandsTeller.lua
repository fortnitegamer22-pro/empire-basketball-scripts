-- decompiled by Sentinel (took 1.348204ms)
local v1 = game:GetService("Chat"):WaitForChild("ClientChatModules")
local v_u_2 = require(v1:WaitForChild("ChatSettings"))
local v_u_3 = require(v1:WaitForChild("ChatConstants"))
local v_u_4 = nil
pcall(function()
	-- upvalues: (ref) v_u_4
	v_u_4 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
v_u_4 = v_u_4 == nil and {} or v_u_4
if not (v_u_4.FormatMessageToSend and v_u_4.LocalizeFormattedMessage) then
	function v_u_4.FormatMessageToSend(_, _, p5)
		return p5
	end
end
return function(p_u_6)
	-- upvalues: (copy) v_u_2, (ref) v_u_4, (copy) v_u_3
	p_u_6:RegisterProcessCommandsFunction("chat_commands_inquiry", function(p7, p8, p9)
		-- upvalues: (copy) p_u_6, (ref) v_u_4, (ref) v_u_2
		if p8:lower() ~= "/?" and p8:lower() ~= "/help" then
			return false
		end
		local v10 = p_u_6:GetSpeaker(p7)
		v10:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_Desc", "These are the basic chat commands."), p9)
		if v_u_2.AllowMeCommand then
			v10:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_MeCommand", "/me <text> : roleplaying command for doing actions."), p9)
		end
		v10:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_SwitchChannelCommand", "/c <channel> : switch channel menu tabs."), p9)
		local v11
		if v_u_2.ShowJoinAndLeaveHelpText == nil then
			v11 = false
		else
			v11 = v_u_2.ShowJoinAndLeaveHelpText
		end
		if v11 then
			v10:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_JoinChannelCommand", "/join <channel> or /j <channel> : join channel."), p9)
			v10:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_LeaveChannelCommand", "/leave <channel> or /l <channel> : leave channel. (leaves current if none specified)"), p9)
		end
		v10:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_WhisperCommand", "/whisper <speaker> or /w <speaker> : open private message channel with speaker."), p9)
		v10:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_MuteCommand", "/mute <speaker> : mute a speaker."), p9)
		v10:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_UnMuteCommand", "/unmute <speaker> : unmute a speaker."), p9)
		local v12 = v10:GetPlayer()
		if v12 and v12.Team then
			v10:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_TeamCommand", "/team <message> or /t <message> : send a team chat to players on your team."), p9)
		end
		return true
	end, v_u_3.StandardPriority)
	local v13 = v_u_2.GeneralChannelName and p_u_6:GetChannel(v_u_2.GeneralChannelName)
	if v13 then
		v13.WelcomeMessage = v_u_4:FormatMessageToSend("GameChat_ChatCommandsTeller_AllChannelWelcomeMessage", "Chat \'/?\' or \'/help\' for a list of chat commands.")
	end
end
