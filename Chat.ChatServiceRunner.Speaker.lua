-- decompiled by Sentinel (took 4.572721ms)
local v1 = {}
local v_u_2 = game:GetService("RunService")
local v_u_3 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local _ = script.Parent
local v4, v5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures")
end)
local v_u_6 = v4 and v5
local _, _ = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled")
end)
local v_u_7 = {}
local v_u_8 = {
	["eDestroyed"] = true, 
	["eSaidMessage"] = true, 
	["eReceivedMessage"] = true, 
	["eReceivedUnfilteredMessage"] = true, 
	["eMessageDoneFiltering"] = true, 
	["eReceivedSystemMessage"] = true, 
	["eChannelJoined"] = true, 
	["eChannelLeft"] = true, 
	["eMuted"] = true, 
	["eUnmuted"] = true, 
	["eExtraDataUpdated"] = true, 
	["eMainChannelSet"] = true, 
	["eChannelNameColorUpdated"] = true
}
local v_u_9 = {
	["Destroyed"] = "eDestroyed", 
	["SaidMessage"] = "eSaidMessage", 
	["ReceivedMessage"] = "eReceivedMessage", 
	["ReceivedUnfilteredMessage"] = "eReceivedUnfilteredMessage", 
	["RecievedUnfilteredMessage"] = "eReceivedUnfilteredMessage", 
	["MessageDoneFiltering"] = "eMessageDoneFiltering", 
	["ReceivedSystemMessage"] = "eReceivedSystemMessage", 
	["ChannelJoined"] = "eChannelJoined", 
	["ChannelLeft"] = "eChannelLeft", 
	["Muted"] = "eMuted", 
	["Unmuted"] = "eUnmuted", 
	["ExtraDataUpdated"] = "eExtraDataUpdated", 
	["MainChannelSet"] = "eMainChannelSet", 
	["ChannelNameColorUpdated"] = "eChannelNameColorUpdated"
}
function v_u_7.__index(p10, p11)
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_9
	local v12 = rawget(v_u_7, p11)
	if v12 then
		return v12
	end
	if v_u_8[p11] and not rawget(p10, p11) then
		rawset(p10, p11, Instance.new("BindableEvent"))
	end
	local v13 = v_u_9[p11]
	if v13 and not rawget(p10, p11) then
		if not rawget(p10, v13) then
			rawset(p10, v13, Instance.new("BindableEvent"))
		end
		rawset(p10, p11, rawget(p10, v13).Event)
	end
	return rawget(p10, p11)
end
function v_u_7.LazyFire(p14, p15, ...)
	local v16 = rawget(p14, p15)
	if v16 then
		v16:Fire(...)
	end
end
function v_u_7.SayMessage(p_u_17, p18, p_u_19, p20)
	if p_u_17.ChatService:InternalDoProcessCommands(p_u_17.Name, p18, p_u_19) then
		return
	elseif p_u_19 then
		local v21 = p_u_17.Channels[p_u_19:lower()]
		if v21 then
			local v_u_22 = v21:InternalPostMessage(p_u_17, p18, p20)
			if v_u_22 then
				pcall(function()
					-- upvalues: (copy) p_u_17, (copy) v_u_22, (copy) p_u_19
					p_u_17:LazyFire("eSaidMessage", v_u_22, p_u_19)
				end)
			end
			return v_u_22
		end
	end
end
function v_u_7.JoinChannel(p_u_23, p24)
	if p_u_23.Channels[p24:lower()] then
		warn("Speaker is already in channel \"" .. p24 .. "\"")
	else
		local v_u_25 = p_u_23.ChatService:GetChannel(p24)
		if not v_u_25 then
			error("Channel \"" .. p24 .. "\" does not exist!")
		end
		p_u_23.Channels[p24:lower()] = v_u_25
		v_u_25:InternalAddSpeaker(p_u_23)
		local v26, v27 = pcall(function()
			-- upvalues: (copy) p_u_23, (copy) v_u_25
			p_u_23.eChannelJoined:Fire(v_u_25.Name, v_u_25:GetWelcomeMessageForSpeaker(p_u_23))
		end)
		if not v26 and v27 then
			print("Error joining channel: " .. v27)
		end
	end
end
function v_u_7.LeaveChannel(p_u_28, p29)
	if p_u_28.Channels[p29:lower()] then
		local v_u_30 = p_u_28.Channels[p29:lower()]
		p_u_28.Channels[p29:lower()] = nil
		v_u_30:InternalRemoveSpeaker(p_u_28)
		local v31, v32 = pcall(function()
			-- upvalues: (copy) p_u_28, (copy) v_u_30
			p_u_28:LazyFire("eChannelLeft", v_u_30.Name)
			if p_u_28.PlayerObj then
				p_u_28.EventFolder.OnChannelLeft:FireClient(p_u_28.PlayerObj, v_u_30.Name)
			end
		end)
		if not v31 and v32 then
			print("Error leaving channel: " .. v32)
		end
	else
		warn("Speaker is not in channel \"" .. p29 .. "\"")
	end
end
function v_u_7.IsInChannel(p33, p34)
	return p33.Channels[p34:lower()] ~= nil
end
function v_u_7.GetChannelList(p35)
	local v36 = {}
	for _, v37 in pairs(p35.Channels) do
		table.insert(v36, v37.Name)
	end
	return v36
end
function v_u_7.SendMessage(p38, p39, p40, p41, p42)
	-- upvalues: (copy) v_u_2
	local v43 = p38.Channels[p40:lower()]
	if v43 then
		v43:SendMessageToSpeaker(p39, p38.Name, p41, p42)
	elseif v_u_2:IsStudio() then
		warn(string.format("Speaker \'%s\' is not in channel \'%s\' and cannot receive a message in it.", p38.Name, p40))
	end
end
function v_u_7.SendSystemMessage(p44, p45, p46, p47)
	-- upvalues: (copy) v_u_2
	local v48 = p44.Channels[p46:lower()]
	if v48 then
		v48:SendSystemMessageToSpeaker(p45, p44.Name, p47)
	elseif v_u_2:IsStudio() then
		warn(string.format("Speaker \'%s\' is not in channel \'%s\' and cannot receive a system message in it.", p44.Name, p46))
	end
end
function v_u_7.GetPlayer(p49)
	return p49.PlayerObj
end
function v_u_7.GetNameForDisplay(p50)
	-- upvalues: (copy) v_u_3
	if v_u_3.PlayerDisplayNamesEnabled then
		local v51 = p50:GetPlayer()
		if v51 then
			return v51.DisplayName
		else
			return p50.Name
		end
	else
		return p50.Name
	end
end
function v_u_7.SetExtraData(p52, p53, p54)
	p52.ExtraData[p53] = p54
	p52:LazyFire("eExtraDataUpdated", p53, p54)
end
function v_u_7.GetExtraData(p55, p56)
	return p55.ExtraData[p56]
end
function v_u_7.SetMainChannel(p_u_57, p_u_58)
	local v59, v60 = pcall(function()
		-- upvalues: (copy) p_u_57, (copy) p_u_58
		p_u_57:LazyFire("eMainChannelSet", p_u_58)
		if p_u_57.PlayerObj then
			p_u_57.EventFolder.OnMainChannelSet:FireClient(p_u_57.PlayerObj, p_u_58)
		end
	end)
	if not v59 and v60 then
		print("Error setting main channel: " .. v60)
	end
end
function v_u_7.AddMutedSpeaker(p61, p62)
	p61.MutedSpeakers[p62:lower()] = true
end
function v_u_7.RemoveMutedSpeaker(p63, p64)
	p63.MutedSpeakers[p64:lower()] = false
end
function v_u_7.IsSpeakerMuted(p65, p66)
	return p65.MutedSpeakers[p66:lower()]
end
function v_u_7.InternalDestroy(p67)
	for _, v68 in pairs(p67.Channels) do
		v68:InternalRemoveSpeaker(p67)
	end
	p67.eDestroyed:Fire()
	p67.EventFolder = nil
	p67.eDestroyed:Destroy()
	p67.eSaidMessage:Destroy()
	p67.eReceivedMessage:Destroy()
	p67.eReceivedUnfilteredMessage:Destroy()
	p67.eMessageDoneFiltering:Destroy()
	p67.eReceivedSystemMessage:Destroy()
	p67.eChannelJoined:Destroy()
	p67.eChannelLeft:Destroy()
	p67.eMuted:Destroy()
	p67.eUnmuted:Destroy()
	p67.eExtraDataUpdated:Destroy()
	p67.eMainChannelSet:Destroy()
	p67.eChannelNameColorUpdated:Destroy()
end
function v_u_7.InternalAssignPlayerObject(p69, p70)
	p69.PlayerObj = p70
end
function v_u_7.InternalAssignEventFolder(p71, p72)
	p71.EventFolder = p72
end
function v_u_7.InternalSendMessage(p_u_73, p_u_74, p_u_75)
	local v76, v77 = pcall(function()
		-- upvalues: (copy) p_u_73, (copy) p_u_74, (copy) p_u_75
		p_u_73:LazyFire("eReceivedUnfilteredMessage", p_u_74, p_u_75)
		if p_u_73.PlayerObj then
			p_u_73.EventFolder.OnNewMessage:FireClient(p_u_73.PlayerObj, p_u_74, p_u_75)
		end
	end)
	if not v76 and v77 then
		print("Error sending internal message: " .. v77)
	end
end
function v_u_7.InternalSendFilteredMessage(p_u_78, p_u_79, p_u_80)
	local v81, v82 = pcall(function()
		-- upvalues: (copy) p_u_78, (copy) p_u_79, (copy) p_u_80
		p_u_78:LazyFire("eReceivedMessage", p_u_79, p_u_80)
		p_u_78:LazyFire("eMessageDoneFiltering", p_u_79, p_u_80)
		if p_u_78.PlayerObj then
			p_u_78.EventFolder.OnMessageDoneFiltering:FireClient(p_u_78.PlayerObj, p_u_79, p_u_80)
		end
	end)
	if not v81 and v82 then
		print("Error sending internal filtered message: " .. v82)
	end
end
function v_u_7.InternalSendFilteredMessageWithTranslatedFilterResult(p83, p84, p85, p86)
	-- upvalues: (ref) v_u_6
	local v_u_87 = {}
	for v88, v89 in pairs(p84) do
		v_u_87[v88] = v89
	end
	local v_u_90 = v_u_87.FilterResult
	local v_u_91 = p83:GetPlayer()
	local v_u_92 = p86:GetTranslationForLocale(v_u_91.LocaleId)
	local v_u_93 = ""
	local v_u_94 = nil
	pcall(function()
		-- upvalues: (copy) v_u_87, (copy) v_u_91, (ref) v_u_93, (copy) v_u_90, (copy) v_u_92, (ref) v_u_94
		if v_u_87.IsFilterResult then
			if v_u_91 then
				v_u_93 = v_u_90:GetChatForUserAsync(v_u_91.UserId)
				if v_u_92 then
					v_u_94 = v_u_92:GetChatForUserAsync(v_u_91.UserId)
					return
				end
			else
				v_u_93 = v_u_90:GetNonChatStringForBroadcastAsync()
				if v_u_92 then
					v_u_94 = v_u_92:GetNonChatStringForBroadcastAsync()
					return
				end
			end
		else
			v_u_93 = v_u_90
		end
	end)
	if v_u_6 then
		v_u_87.Message = v_u_93
		if v_u_94 then
			v_u_87.TranslatedMessage = v_u_94
		end
		v_u_87.FilterResult = nil
		p83:InternalSendFilteredMessage(v_u_87, p85)
	elseif 0 < #v_u_93 then
		v_u_87.Message = v_u_93
		if v_u_94 then
			v_u_87.TranslatedMessage = v_u_94
		end
		v_u_87.FilterResult = nil
		p83:InternalSendFilteredMessage(v_u_87, p85)
	end
end
function v_u_7.InternalSendFilteredMessageWithFilterResult(p95, p96, p97)
	-- upvalues: (ref) v_u_6
	local v_u_98 = {}
	for v99, v100 in pairs(p96) do
		v_u_98[v99] = v100
	end
	local v_u_101 = v_u_98.FilterResult
	local v_u_102 = p95:GetPlayer()
	local v_u_103 = ""
	pcall(function()
		-- upvalues: (copy) v_u_98, (copy) v_u_102, (ref) v_u_103, (copy) v_u_101
		if v_u_98.IsFilterResult then
			if v_u_102 then
				v_u_103 = v_u_101:GetChatForUserAsync(v_u_102.UserId)
			else
				v_u_103 = v_u_101:GetNonChatStringForBroadcastAsync()
			end
		else
			v_u_103 = v_u_101
			return
		end
	end)
	if v_u_6 then
		v_u_98.Message = v_u_103
		v_u_98.FilterResult = nil
		p95:InternalSendFilteredMessage(v_u_98, p97)
	elseif 0 < #v_u_103 then
		v_u_98.Message = v_u_103
		v_u_98.FilterResult = nil
		p95:InternalSendFilteredMessage(v_u_98, p97)
	end
end
function v_u_7.InternalSendSystemMessage(p_u_104, p_u_105, p_u_106)
	local v107, v108 = pcall(function()
		-- upvalues: (copy) p_u_104, (copy) p_u_105, (copy) p_u_106
		p_u_104:LazyFire("eReceivedSystemMessage", p_u_105, p_u_106)
		if p_u_104.PlayerObj then
			p_u_104.EventFolder.OnNewSystemMessage:FireClient(p_u_104.PlayerObj, p_u_105, p_u_106)
		end
	end)
	if not v107 and v108 then
		print("Error sending internal system message: " .. v108)
	end
end
function v_u_7.UpdateChannelNameColor(p109, p110, p111)
	p109:LazyFire("eChannelNameColorUpdated", p110, p111)
	if p109.PlayerObj then
		p109.EventFolder.ChannelNameColorUpdated:FireClient(p109.PlayerObj, p110, p111)
	end
end
function v1.new(p112, p113)
	-- upvalues: (copy) v_u_7
	local v114 = setmetatable({}, v_u_7)
	v114.ChatService = p112
	v114.PlayerObj = nil
	v114.Name = p113
	v114.ExtraData = {}
	v114.Channels = {}
	v114.MutedSpeakers = {}
	v114.EventFolder = nil
	return v114
end
return v1
