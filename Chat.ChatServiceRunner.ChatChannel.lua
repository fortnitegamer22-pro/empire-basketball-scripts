-- decompiled by Sentinel (took 10.051185ms)
local v1, v2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserShouldMuteUnfilteredMessage")
end)
local v_u_3 = v1 and v2
local v4, v5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures")
end)
local v_u_6 = v4 and v5
local v7, v8 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled")
end)
local v_u_9 = v7 and v8
local v10 = {}
local v_u_11 = game:GetService("Chat")
local v_u_12 = game:GetService("RunService")
local v13 = v_u_11:WaitForChild("ClientChatModules")
local v_u_14 = require(v13:WaitForChild("ChatSettings"))
local v_u_15 = require(v13:WaitForChild("ChatConstants"))
local v_u_16 = require(script.Parent:WaitForChild("Util"))
local v_u_17 = nil
pcall(function()
	-- upvalues: (ref) v_u_17
	v_u_17 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
v_u_17 = v_u_17 or {}
if not (v_u_17.FormatMessageToSend and v_u_17.LocalizeFormattedMessage) then
	function v_u_17.FormatMessageToSend(_, _, p18)
		return p18
	end
end
local v_u_19 = {}
v_u_19.__index = v_u_19
function v_u_19.SendSystemMessage(p_u_20, p21, p22)
	local v_u_23 = p_u_20:InternalCreateMessageObject(p21, nil, true, p22)
	local v24, v25 = pcall(function()
		-- upvalues: (copy) p_u_20, (copy) v_u_23
		p_u_20.eMessagePosted:Fire(v_u_23)
	end)
	if not v24 and v25 then
		print("Error posting message: " .. v25)
	end
	p_u_20:InternalAddMessageToHistoryLog(v_u_23)
	for _, v26 in pairs(p_u_20.Speakers) do
		v26:InternalSendSystemMessage(v_u_23, p_u_20.Name)
	end
	return v_u_23
end
function v_u_19.SendSystemMessageToSpeaker(p27, p28, p29, p30)
	-- upvalues: (copy) v_u_12
	local v31 = p27.Speakers[p29]
	if v31 then
		v31:InternalSendSystemMessage(p27:InternalCreateMessageObject(p28, nil, true, p30), p27.Name)
	elseif v_u_12:IsStudio() then
		warn(string.format("Speaker \'%s\' is not in channel \'%s\' and cannot be sent a system message", p29, p27.Name))
	end
end
function v_u_19.SendMessageObjToFilters(p32, p33, p34, p35)
	p34.Message = p33
	p32:InternalDoMessageFilter(p35.Name, p34, p32.Name)
	p32.ChatService:InternalDoMessageFilter(p35.Name, p34, p32.Name)
	p34.Message = p34.Message
	return p34.Message
end
function v_u_19.CanCommunicateByUserId(_, p_u_36, p_u_37)
	-- upvalues: (copy) v_u_12, (copy) v_u_11
	if v_u_12:IsStudio() then
		return true
	end
	if p_u_36 == 0 or p_u_37 == 0 then
		return true
	end
	local v38, v39 = pcall(function()
		-- upvalues: (ref) v_u_11, (copy) p_u_36, (copy) p_u_37
		return v_u_11:CanUsersChatAsync(p_u_36, p_u_37)
	end)
	return v38 and v39
end
function v_u_19.CanCommunicate(p40, p41, p42)
	local v43 = p41:GetPlayer()
	local v44 = p42:GetPlayer()
	return not (v43 and v44) and true or p40:CanCommunicateByUserId(v43.UserId, v44.UserId)
end
function v_u_19.SendMessageToSpeaker(p45, p46, p47, p48, p49)
	-- upvalues: (copy) v_u_12
	local v50 = p45.Speakers[p47]
	local v51 = p45.ChatService:GetSpeaker(p48)
	if v50 and v51 then
		if v50:IsSpeakerMuted(p48) then
			return
		end
		if not p45:CanCommunicate(v50, v51) then
			return
		end
		local v52 = p45:InternalCreateMessageObject(p46, p48, p47 == p48, p49)
		v50:InternalSendMessage(v52, p45.Name)
		local v53, v54, v55 = p45.ChatService:InternalApplyRobloxFilterNewAPI(v52.FromSpeaker, p45:SendMessageObjToFilters(p46, v52, p48), p45.Private and Enum.TextFilterContext.PrivateChat or Enum.TextFilterContext.PublicChat)
		if v53 then
			v52.FilterResult = v55
			v52.IsFilterResult = v54
			v52.IsFiltered = true
			v50:InternalSendFilteredMessageWithFilterResult(v52, p45.Name)
			return
		end
	elseif v_u_12:IsStudio() then
		warn(string.format("Speaker \'%s\' is not in channel \'%s\' and cannot be sent a message", p47, p45.Name))
	end
end
function v_u_19.KickSpeaker(p56, p57, p58)
	local v59 = p56.ChatService:GetSpeaker(p57)
	if not v59 then
		error("Speaker \"" .. p57 .. "\" does not exist!")
	end
	local v60 = v59:GetNameForDisplay()
	local v61, v62
	if p58 then
		v61 = string.format("You were kicked from \'%s\' for the following reason(s): %s", p56.Name, p58)
		v62 = string.format("%s was kicked for the following reason(s): %s", v60, p58)
	else
		v61 = string.format("You were kicked from \'%s\'", p56.Name)
		v62 = string.format("%s was kicked", v60)
	end
	p56:SendSystemMessageToSpeaker(v61, p57)
	v59:LeaveChannel(p56.Name)
	p56:SendSystemMessage(v62)
end
function v_u_19.MuteSpeaker(p_u_63, p_u_64, p_u_65, p_u_66)
	local v67 = p_u_63.ChatService:GetSpeaker(p_u_64)
	if not v67 then
		error("Speaker \"" .. p_u_64 .. "\" does not exist!")
	end
	p_u_63.Mutes[p_u_64:lower()] = (p_u_66 == 0 or p_u_66 == nil) and 0 or os.time() + p_u_66
	if p_u_65 then
		p_u_63:SendSystemMessage(string.format("%s was muted for the following reason(s): %s", v67:GetNameForDisplay(), p_u_65))
	end
	local v68, v69 = pcall(function()
		-- upvalues: (copy) p_u_63, (copy) p_u_64, (copy) p_u_65, (copy) p_u_66
		p_u_63.eSpeakerMuted:Fire(p_u_64, p_u_65, p_u_66)
	end)
	if not v68 and v69 then
		print("Error mutting speaker: " .. v69)
	end
	local v_u_70 = p_u_63.ChatService:GetSpeaker(p_u_64)
	if v_u_70 then
		local v71, v72 = pcall(function()
			-- upvalues: (copy) v_u_70, (copy) p_u_63, (copy) p_u_65, (copy) p_u_66
			v_u_70.eMuted:Fire(p_u_63.Name, p_u_65, p_u_66)
		end)
		if not v71 and v72 then
			print("Error mutting speaker: " .. v72)
		end
	end
end
function v_u_19.UnmuteSpeaker(p_u_73, p_u_74)
	if not p_u_73.ChatService:GetSpeaker(p_u_74) then
		error("Speaker \"" .. p_u_74 .. "\" does not exist!")
	end
	p_u_73.Mutes[p_u_74:lower()] = nil
	local v75, v76 = pcall(function()
		-- upvalues: (copy) p_u_73, (copy) p_u_74
		p_u_73.eSpeakerUnmuted:Fire(p_u_74)
	end)
	if not v75 and v76 then
		print("Error unmuting speaker: " .. v76)
	end
	local v_u_77 = p_u_73.ChatService:GetSpeaker(p_u_74)
	if v_u_77 then
		local v78, v79 = pcall(function()
			-- upvalues: (copy) v_u_77, (copy) p_u_73
			v_u_77.eUnmuted:Fire(p_u_73.Name)
		end)
		if not v78 and v79 then
			print("Error unmuting speaker: " .. v79)
		end
	end
end
function v_u_19.IsSpeakerMuted(p80, p81)
	return p80.Mutes[p81:lower()] ~= nil
end
function v_u_19.GetSpeakerList(p82)
	local v83 = {}
	for _, v84 in pairs(p82.Speakers) do
		table.insert(v83, v84.Name)
	end
	return v83
end
function v_u_19.RegisterFilterMessageFunction(p85, p86, p87, p88)
	if p85.FilterMessageFunctions:HasFunction(p86) then
		error(string.format("FilterMessageFunction \'%s\' already exists", p86))
	end
	p85.FilterMessageFunctions:AddFunction(p86, p87, p88)
end
function v_u_19.FilterMessageFunctionExists(p89, p90)
	return p89.FilterMessageFunctions:HasFunction(p90)
end
function v_u_19.UnregisterFilterMessageFunction(p91, p92)
	if not p91.FilterMessageFunctions:HasFunction(p92) then
		error(string.format("FilterMessageFunction \'%s\' does not exists", p92))
	end
	p91.FilterMessageFunctions:RemoveFunction(p92)
end
function v_u_19.RegisterProcessCommandsFunction(p93, p94, p95, p96)
	if p93.ProcessCommandsFunctions:HasFunction(p94) then
		error(string.format("ProcessCommandsFunction \'%s\' already exists", p94))
	end
	p93.ProcessCommandsFunctions:AddFunction(p94, p95, p96)
end
function v_u_19.ProcessCommandsFunctionExists(p97, p98)
	return p97.ProcessCommandsFunctions:HasFunction(p98)
end
function v_u_19.UnregisterProcessCommandsFunction(p99, p100)
	if not p99.ProcessCommandsFunctions:HasFunction(p100) then
		error(string.format("ProcessCommandsFunction \'%s\' does not exist", p100))
	end
	p99.ProcessCommandsFunctions:RemoveFunction(p100)
end
function v_u_19.GetHistoryLog(p101)
	local v102 = {}
	for v103, v104 in pairs(p101.ChatHistory) do
		v102[v103] = v104
	end
	return v102
end
function v_u_19.GetHistoryLogForSpeaker(p105, p106)
	-- upvalues: (copy) v_u_15
	local v107 = p106:GetPlayer()
	local v108 = not v107 and -1 or v107.UserId
	local v109 = {}
	for v110 = 1, #p105.ChatHistory do
		if p105:CanCommunicateByUserId(v108, p105.ChatHistory[v110].SpeakerUserId) then
			local v111 = {}
			for v112, v113 in pairs(p105.ChatHistory[v110]) do
				v111[v112] = v113
			end
			if v111.MessageType == v_u_15.MessageTypeDefault or v111.MessageType == v_u_15.MessageTypeMeCommand then
				local v114 = v111.FilterResult
				if v111.IsFilterResult then
					if v107 then
						v111.Message = v114:GetChatForUserAsync(v107.UserId)
					else
						v111.Message = v114:GetNonChatStringForBroadcastAsync()
					end
				else
					v111.Message = v114
				end
			end
			table.insert(v109, v111)
		end
	end
	return v109
end
function v_u_19.InternalDestroy(p115)
	for _, v116 in pairs(p115.Speakers) do
		v116:LeaveChannel(p115.Name)
	end
	p115.eDestroyed:Fire()
	p115.eDestroyed:Destroy()
	p115.eMessagePosted:Destroy()
	p115.eSpeakerJoined:Destroy()
	p115.eSpeakerLeft:Destroy()
	p115.eSpeakerMuted:Destroy()
	p115.eSpeakerUnmuted:Destroy()
end
function v_u_19.InternalDoMessageFilter(p117, p_u_118, p_u_119, p_u_120)
	for v121, v_u_122, _ in p117.FilterMessageFunctions:GetIterator(), nil, nil do
		local v123, v124 = pcall(function()
			-- upvalues: (copy) v_u_122, (copy) p_u_118, (copy) p_u_119, (copy) p_u_120
			v_u_122(p_u_118, p_u_119, p_u_120)
		end)
		if not v123 then
			warn(string.format("DoMessageFilter Function \'%s\' failed for reason: %s", v121, v124))
		end
	end
end
function v_u_19.InternalDoProcessCommands(p125, p_u_126, p_u_127, p_u_128)
	for v129, v_u_130, _ in p125.ProcessCommandsFunctions:GetIterator(), nil, nil do
		local v132, v133 = pcall(function()
			-- upvalues: (copy) v_u_130, (copy) p_u_126, (copy) p_u_127, (copy) p_u_128
			local v131 = v_u_130(p_u_126, p_u_127, p_u_128)
			if type(v131) ~= "boolean" then
				error("Process command functions must return a bool")
			end
			return v131
		end)
		if v132 then
			if v133 then
				return true
			end
		else
			warn(string.format("DoProcessCommands Function \'%s\' failed for reason: %s", v129, v133))
		end
	end
	return false
end
function getLanguageCodeFromLocale(p134)
	return string.gmatch(p134, "[^-]+")() or "en"
end
function v_u_19.InternalPostMessage(p_u_135, p136, p137, p138)
	-- upvalues: (ref) v_u_17, (copy) v_u_11, (ref) v_u_3, (ref) v_u_9, (ref) v_u_6
	if p_u_135:InternalDoProcessCommands(p136.Name, p137, p_u_135.Name) then
		return false
	end
	if p_u_135.Mutes[p136.Name:lower()] ~= nil then
		local v139 = p_u_135.Mutes[p136.Name:lower()]
		if 0 >= v139 or v139 >= os.time() then
			p_u_135:SendSystemMessageToSpeaker(v_u_17:FormatMessageToSend("GameChat_ChatChannel_MutedInChannel", "You are muted and cannot talk in this channel"), p136.Name)
			return false
		end
		p_u_135:UnmuteSpeaker(p136.Name)
	end
	local v_u_140 = p_u_135:InternalCreateMessageObject(p137, p136.Name, false, p138)
	v_u_140.Message = p137
	local v_u_141 = nil
	pcall(function()
		-- upvalues: (ref) v_u_141, (ref) v_u_11, (ref) v_u_140
		v_u_141 = v_u_11:InvokeChatCallback(Enum.ChatCallbackType.OnServerReceivingMessage, v_u_140)
	end)
	v_u_140.Message = nil
	if v_u_141 then
		if v_u_141.ShouldDeliver == false then
			return false
		end
		v_u_140 = v_u_141
	end
	local v142 = p_u_135:SendMessageObjToFilters(p137, v_u_140, p136)
	local v143 = {}
	for _, v144 in pairs(p_u_135.Speakers) do
		if not v144:IsSpeakerMuted(p136.Name) and p_u_135:CanCommunicate(p136, v144) then
			table.insert(v143, v144.Name)
			if v144.Name == p136.Name then
				local v145 = {}
				for v146, v147 in pairs(v_u_140) do
					v145[v146] = v147
				end
				if v_u_3 then
					v145.Message = string.rep("_", v_u_140.MessageLengthUtf8 or v_u_140.MessageLength)
				else
					v145.Message = v142
				end
				v145.IsFiltered = true
				v144:InternalSendMessage(v145, p_u_135.Name)
			else
				v144:InternalSendMessage(v_u_140, p_u_135.Name)
			end
		end
	end
	local v148, v149 = pcall(function()
		-- upvalues: (copy) p_u_135, (ref) v_u_140
		p_u_135.eMessagePosted:Fire(v_u_140)
	end)
	if not v148 and v149 then
		print("Error posting message: " .. v149)
	end
	local v150 = p_u_135.Private and Enum.TextFilterContext.PrivateChat or Enum.TextFilterContext.PublicChat
	local v151 = nil
	if v_u_9 then
		local v152 = {}
		local v153 = {}
		for _, v154 in pairs(p_u_135.Speakers) do
			v153[getLanguageCodeFromLocale(v154:GetPlayer().LocaleId)] = true
		end
		for v155, _ in v153, nil, nil do
			table.insert(v152, v155)
		end
		local v156, v157, v158 = p_u_135.ChatService:InternalApplyRobloxFilterAndTranslate(v_u_140.FromSpeaker, v152, v142, v150)
		if v156 then
			if v157 then
				v_u_140.FilterResult = v158.SourceText
			else
				v_u_140.FilterResult = v158
			end
			v_u_140.IsFilterResult = v157
			if v157 then
				v151 = v158
			end
		else
			if not v_u_6 then
				return false
			end
			v_u_140.IsFilterResult = false
			v_u_140.FilterResult = ""
			v_u_140.MessageLength = 0
		end
	else
		local v159, v160, v161 = p_u_135.ChatService:InternalApplyRobloxFilterNewAPI(v_u_140.FromSpeaker, v142, v150)
		if v159 then
			v_u_140.FilterResult = v161
			v_u_140.IsFilterResult = v160
		else
			if not v_u_6 then
				return false
			end
			v_u_140.IsFilterResult = false
			v_u_140.FilterResult = ""
			v_u_140.MessageLength = 0
		end
	end
	v_u_140.IsFiltered = true
	p_u_135:InternalAddMessageToHistoryLog(v_u_140)
	for _, v162 in pairs(v143) do
		local v163 = p_u_135.Speakers[v162]
		if v163 then
			if v_u_9 and v151 and p136:GetPlayer().LocaleId ~= v163:GetPlayer().LocaleId then
				v163:InternalSendFilteredMessageWithTranslatedFilterResult(v_u_140, p_u_135.Name, v151)
			else
				v163:InternalSendFilteredMessageWithFilterResult(v_u_140, p_u_135.Name)
			end
		end
	end
	local v164 = {}
	for _, v165 in pairs(p_u_135.Speakers) do
		if not v165:IsSpeakerMuted(p136.Name) and p_u_135:CanCommunicate(p136, v165) then
			local v166 = false
			for _, v167 in pairs(v143) do
				if v165.Name == v167 then
					v166 = true
					break
				end
			end
			if not v166 then
				table.insert(v164, v165.Name)
			end
		end
	end
	for _, v168 in pairs(v164) do
		local v169 = p_u_135.Speakers[v168]
		if v169 then
			v169:InternalSendFilteredMessageWithFilterResult(v_u_140, p_u_135.Name)
		end
	end
	return v_u_140
end
function v_u_19.InternalAddSpeaker(p_u_170, p_u_171)
	if p_u_170.Speakers[p_u_171.Name] then
		warn("Speaker \"" .. p_u_171.name .. "\" is already in the channel!")
	else
		p_u_170.Speakers[p_u_171.Name] = p_u_171
		local v172, v173 = pcall(function()
			-- upvalues: (copy) p_u_170, (copy) p_u_171
			p_u_170.eSpeakerJoined:Fire(p_u_171.Name)
		end)
		if not v172 and v173 then
			print("Error removing channel: " .. v173)
		end
	end
end
function v_u_19.InternalRemoveSpeaker(p_u_174, p_u_175)
	if p_u_174.Speakers[p_u_175.Name] then
		p_u_174.Speakers[p_u_175.Name] = nil
		local v176, v177 = pcall(function()
			-- upvalues: (copy) p_u_174, (copy) p_u_175
			p_u_174.eSpeakerLeft:Fire(p_u_175.Name)
		end)
		if not v176 and v177 then
			print("Error removing speaker: " .. v177)
		end
	else
		warn("Speaker \"" .. p_u_175.name .. "\" is not in the channel!")
	end
end
function v_u_19.InternalRemoveExcessMessagesFromLog(p178)
	local v179 = table.remove
	while #p178.ChatHistory > p178.MaxHistory do
		v179(p178.ChatHistory, 1)
	end
end
function v_u_19.InternalAddMessageToHistoryLog(p180, p181)
	table.insert(p180.ChatHistory, p181)
	p180:InternalRemoveExcessMessagesFromLog()
end
function v_u_19.GetMessageType(_, _, p182)
	-- upvalues: (copy) v_u_15
	if p182 == nil then
		return v_u_15.MessageTypeSystem
	else
		return v_u_15.MessageTypeDefault
	end
end
function v_u_19.InternalCreateMessageObject(p183, p184, p185, p186, p187)
	-- upvalues: (copy) v_u_14
	local v188 = p183:GetMessageType(p184, p185)
	local v189 = -1
	local v190 = nil
	local v191
	if p185 then
		v191 = p183.ChatService:GetSpeaker(p185)
		if v191 then
			local v192 = v191:GetPlayer()
			if v192 then
				v189 = v192.UserId
				if v_u_14.PlayerDisplayNamesEnabled then
					v190 = v191:GetNameForDisplay()
				end
			else
				v189 = 0
			end
		end
	else
		v191 = nil
	end
	local v193 = {
		["ID"] = p183.ChatService:InternalGetUniqueMessageId(), 
		["FromSpeaker"] = p185, 
		["SpeakerDisplayName"] = v190, 
		["SpeakerUserId"] = v189, 
		["OriginalChannel"] = p183.Name, 
		["MessageLength"] = string.len(p184), 
		["MessageLengthUtf8"] = utf8.len(utf8.nfcnormalize(p184)), 
		["MessageType"] = v188, 
		["IsFiltered"] = p186, 
		["Message"] = p186 and p184 and p184 or nil, 
		["Time"] = os.time(), 
		["ExtraData"] = {}
	}
	if v191 then
		for v194, v195 in pairs(v191.ExtraData) do
			v193.ExtraData[v194] = v195
		end
	end
	if p187 then
		for v196, v197 in pairs(p187) do
			v193.ExtraData[v196] = v197
		end
	end
	return v193
end
function v_u_19.SetChannelNameColor(p198, p199)
	p198.ChannelNameColor = p199
	for _, v200 in pairs(p198.Speakers) do
		v200:UpdateChannelNameColor(p198.Name, p199)
	end
end
function v_u_19.GetWelcomeMessageForSpeaker(p201, p202)
	return p201.GetWelcomeMessageFunction and p201.GetWelcomeMessageFunction(p202) or p201.WelcomeMessage
end
function v_u_19.RegisterGetWelcomeMessageFunction(p203, p204)
	if type(p204) ~= "function" then
		error("RegisterGetWelcomeMessageFunction must be called with a function.")
	end
	p203.GetWelcomeMessageFunction = p204
end
function v_u_19.UnRegisterGetWelcomeMessageFunction(p205)
	p205.GetWelcomeMessageFunction = nil
end
function v10.new(p206, p207, p208, p209)
	-- upvalues: (copy) v_u_19, (copy) v_u_16
	local v210 = setmetatable({}, v_u_19)
	v210.ChatService = p206
	v210.Name = p207
	v210.WelcomeMessage = p208 or ""
	v210.GetWelcomeMessageFunction = nil
	v210.ChannelNameColor = p209
	v210.Joinable = true
	v210.Leavable = true
	v210.AutoJoin = false
	v210.Private = false
	v210.Speakers = {}
	v210.Mutes = {}
	v210.MaxHistory = 200
	v210.HistoryIndex = 0
	v210.ChatHistory = {}
	v210.FilterMessageFunctions = v_u_16:NewSortedFunctionContainer()
	v210.ProcessCommandsFunctions = v_u_16:NewSortedFunctionContainer()
	v210.eDestroyed = Instance.new("BindableEvent")
	v210.eMessagePosted = Instance.new("BindableEvent")
	v210.eSpeakerJoined = Instance.new("BindableEvent")
	v210.eSpeakerLeft = Instance.new("BindableEvent")
	v210.eSpeakerMuted = Instance.new("BindableEvent")
	v210.eSpeakerUnmuted = Instance.new("BindableEvent")
	v210.MessagePosted = v210.eMessagePosted.Event
	v210.SpeakerJoined = v210.eSpeakerJoined.Event
	v210.SpeakerLeft = v210.eSpeakerLeft.Event
	v210.SpeakerMuted = v210.eSpeakerMuted.Event
	v210.SpeakerUnmuted = v210.eSpeakerUnmuted.Event
	v210.Destroyed = v210.eDestroyed.Event
	return v210
end
return v10
