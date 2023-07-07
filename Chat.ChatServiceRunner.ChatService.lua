-- decompiled by Sentinel (took 6.361015ms)
local v_u_1 = { 0.05, 0.1, 0.2 }
local v2 = {}
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Chat")
v_u_4:WaitForChild("ClientChatModules")
local v5 = script.Parent
local v6 = v_u_4:WaitForChild("ClientChatModules")
local v_u_7 = {
	["ChatColor"] = require(v6:WaitForChild("ChatSettings")).ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}
local v_u_8 = require(v6:WaitForChild("ChatConstants"))
local v_u_9 = require(v5:WaitForChild("ChatChannel"))
local v_u_10 = require(v5:WaitForChild("Speaker"))
local v_u_11 = require(v5:WaitForChild("Util"))
local v_u_12 = nil
pcall(function()
	-- upvalues: (ref) v_u_12
	v_u_12 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
v_u_12 = v_u_12 or {}
if not (v_u_12.FormatMessageToSend and v_u_12.LocalizeFormattedMessage) then
	function v_u_12.FormatMessageToSend(_, _, p13)
		return p13
	end
end
local v_u_14 = {}
v_u_14.__index = v_u_14
function v_u_14.AddChannel(p_u_15, p_u_16, p17)
	-- upvalues: (ref) v_u_12, (copy) v_u_9, (copy) v_u_8
	if p_u_15.ChatChannels[p_u_16:lower()] then
		error(string.format("Channel %q alrady exists.", p_u_16))
	end
	local v18 = v_u_9.new(p_u_15, p_u_16)
	p_u_15.ChatChannels[p_u_16:lower()] = v18
	v18:RegisterProcessCommandsFunction("default_commands", function(p19, p20)
		-- upvalues: (copy) p_u_15, (copy) p_u_16, (ref) v_u_12
		if p20:lower() ~= "/leave" then
			return false
		end
		local v21 = p_u_15:GetChannel(p_u_16)
		local v22 = p_u_15:GetSpeaker(p19)
		if v21 and v22 then
			if v21.Leavable then
				v22:LeaveChannel(p_u_16)
				v22:SendSystemMessage(v_u_12:FormatMessageToSend("GameChat_ChatService_YouHaveLeftChannel", string.format("You have left channel \'%s\'", p_u_16), "RBX_NAME", p_u_16), "System")
			else
				v22:SendSystemMessage(v_u_12:FormatMessageToSend("GameChat_ChatService_CannotLeaveChannel", "You cannot leave this channel."), p_u_16)
			end
		end
		return true
	end, v_u_8.HighPriority)
	local v23, v24 = pcall(function()
		-- upvalues: (copy) p_u_15, (copy) p_u_16
		p_u_15.eChannelAdded:Fire(p_u_16)
	end)
	if not v23 and v24 then
		print("Error addding channel: " .. v24)
	end
	if p17 ~= nil then
		v18.AutoJoin = p17
		if p17 then
			for _, v25 in pairs(p_u_15.Speakers) do
				v25:JoinChannel(p_u_16)
			end
		end
	end
	return v18
end
function v_u_14.RemoveChannel(p_u_26, p27)
	if p_u_26.ChatChannels[p27:lower()] then
		local v_u_28 = p_u_26.ChatChannels[p27:lower()].Name
		p_u_26.ChatChannels[p27:lower()]:InternalDestroy()
		p_u_26.ChatChannels[p27:lower()] = nil
		local v29, v30 = pcall(function()
			-- upvalues: (copy) p_u_26, (copy) v_u_28
			p_u_26.eChannelRemoved:Fire(v_u_28)
		end)
		if not v29 and v30 then
			print("Error removing channel: " .. v30)
			return
		end
	else
		warn(string.format("Channel %q does not exist.", p27))
	end
end
function v_u_14.GetChannel(p31, p32)
	return p31.ChatChannels[p32:lower()]
end
function v_u_14.AddSpeaker(p_u_33, p_u_34)
	-- upvalues: (copy) v_u_10
	if p_u_33.Speakers[p_u_34:lower()] then
		error("Speaker \"" .. p_u_34 .. "\" already exists!")
	end
	local v35 = v_u_10.new(p_u_33, p_u_34)
	p_u_33.Speakers[p_u_34:lower()] = v35
	local v36, v37 = pcall(function()
		-- upvalues: (copy) p_u_33, (copy) p_u_34
		p_u_33.eSpeakerAdded:Fire(p_u_34)
	end)
	if not v36 and v37 then
		print("Error adding speaker: " .. v37)
	end
	return v35
end
function v_u_14.InternalUnmuteSpeaker(p38, p39)
	for _, v40 in pairs(p38.ChatChannels) do
		if v40:IsSpeakerMuted(p39) then
			v40:UnmuteSpeaker(p39)
		end
	end
end
function v_u_14.RemoveSpeaker(p_u_41, p42)
	if p_u_41.Speakers[p42:lower()] then
		local v_u_43 = p_u_41.Speakers[p42:lower()].Name
		p_u_41:InternalUnmuteSpeaker(v_u_43)
		p_u_41.Speakers[p42:lower()]:InternalDestroy()
		p_u_41.Speakers[p42:lower()] = nil
		local v44, v45 = pcall(function()
			-- upvalues: (copy) p_u_41, (copy) v_u_43
			p_u_41.eSpeakerRemoved:Fire(v_u_43)
		end)
		if not v44 and v45 then
			print("Error removing speaker: " .. v45)
			return
		end
	else
		warn("Speaker \"" .. p42 .. "\" does not exist!")
	end
end
function v_u_14.GetSpeaker(p46, p47)
	return p46.Speakers[p47:lower()]
end
function v_u_14.GetSpeakerByUserOrDisplayName(p48, p49)
	local v50 = p48.Speakers[p49:lower()]
	if v50 then
		return v50
	end
	for _, v51 in pairs(p48.Speakers) do
		local v52 = v51:GetPlayer()
		if v52 and v52.DisplayName:lower() == p49:lower() then
			return v51
		end
	end
end
function v_u_14.GetChannelList(p53)
	local v54 = {}
	for _, v55 in pairs(p53.ChatChannels) do
		if not v55.Private then
			table.insert(v54, v55.Name)
		end
	end
	return v54
end
function v_u_14.GetAutoJoinChannelList(p56)
	local v57 = {}
	for _, v58 in pairs(p56.ChatChannels) do
		if v58.AutoJoin then
			table.insert(v57, v58)
		end
	end
	return v57
end
function v_u_14.GetSpeakerList(p59)
	local v60 = {}
	for _, v61 in pairs(p59.Speakers) do
		table.insert(v60, v61.Name)
	end
	return v60
end
function v_u_14.SendGlobalSystemMessage(p62, p63)
	for _, v64 in pairs(p62.Speakers) do
		v64:SendSystemMessage(p63, nil)
	end
end
function v_u_14.RegisterFilterMessageFunction(p65, p66, p67, p68)
	if p65.FilterMessageFunctions:HasFunction(p66) then
		error(string.format("FilterMessageFunction \'%s\' already exists", p66))
	end
	p65.FilterMessageFunctions:AddFunction(p66, p67, p68)
end
function v_u_14.FilterMessageFunctionExists(p69, p70)
	return p69.FilterMessageFunctions:HasFunction(p70)
end
function v_u_14.UnregisterFilterMessageFunction(p71, p72)
	if not p71.FilterMessageFunctions:HasFunction(p72) then
		error(string.format("FilterMessageFunction \'%s\' does not exists", p72))
	end
	p71.FilterMessageFunctions:RemoveFunction(p72)
end
function v_u_14.RegisterProcessCommandsFunction(p73, p74, p75, p76)
	if p73.ProcessCommandsFunctions:HasFunction(p74) then
		error(string.format("ProcessCommandsFunction \'%s\' already exists", p74))
	end
	p73.ProcessCommandsFunctions:AddFunction(p74, p75, p76)
end
function v_u_14.ProcessCommandsFunctionExists(p77, p78)
	return p77.ProcessCommandsFunctions:HasFunction(p78)
end
function v_u_14.UnregisterProcessCommandsFunction(p79, p80)
	if not p79.ProcessCommandsFunctions:HasFunction(p80) then
		error(string.format("ProcessCommandsFunction \'%s\' does not exist", p80))
	end
	p79.ProcessCommandsFunctions:RemoveFunction(p80)
end
local v_u_81 = 0
local v_u_82 = 0
local v_u_83 = 0
function v_u_14.InternalNotifyFilterIssue(p84)
	-- upvalues: (ref) v_u_82, (ref) v_u_83, (ref) v_u_81, (ref) v_u_12, (copy) v_u_7
	if 60 < tick() - v_u_82 then
		v_u_83 = 0
	end
	v_u_83 = v_u_83 + 1
	v_u_82 = tick()
	if 3 <= v_u_83 and 60 < tick() - v_u_81 then
		v_u_81 = tick()
		local v85 = p84:GetChannel("System")
		if v85 then
			v85:SendSystemMessage(v_u_12:FormatMessageToSend("GameChat_ChatService_ChatFilterIssues", "The chat filter is currently experiencing issues and messages may be slow to appear."), v_u_7)
		end
	end
end
local v_u_86 = {}
function v_u_14.InternalApplyRobloxFilter(p87, p88, p_u_89, p_u_90)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_1, (copy) v_u_86
	if not v_u_3:IsServer() or v_u_3:IsStudio() then
		if not v_u_86[p_u_89] then
			v_u_86[p_u_89] = true
			wait()
		end
		return p_u_89
	end
	local v91 = p87:GetSpeaker(p88)
	if p_u_90 then
		p_u_90 = p87:GetSpeaker(p_u_90)
	end
	if v91 == nil then
		return nil
	end
	local v_u_92 = v91:GetPlayer()
	if p_u_90 then
		p_u_90 = p_u_90:GetPlayer()
	end
	if v_u_92 == nil then
		return p_u_89
	end
	if string.len((string.gsub(p_u_89, " ", ""))) == 0 then
		return p_u_89
	end
	local v93 = tick()
	local v94 = 0
	while true do
		local v95, v96 = pcall(function()
			-- upvalues: (copy) p_u_90, (ref) v_u_4, (copy) p_u_89, (copy) v_u_92
			if p_u_90 then
				return v_u_4:FilterStringAsync(p_u_89, v_u_92, p_u_90)
			else
				return v_u_4:FilterStringForBroadcast(p_u_89, v_u_92)
			end
		end)
		if v95 then
			return v96
		end
		warn("Error filtering message:", v96)
		v94 = v94 + 1
		if 3 < v94 or 60 < tick() - v93 then
			p87:InternalNotifyFilterIssue()
			return nil
		end
		local v97 = v_u_1[math.min(#v_u_1, v94)]
		wait(v97 + (math.random() * 2 - 1) * v97)
	end
end
function v_u_14.InternalApplyRobloxFilterAndTranslate(p98, p99, p_u_100, p_u_101, p_u_102)
	-- upvalues: (copy) v_u_3
	local v103 = v_u_3:IsServer()
	if v103 then
		v103 = not v_u_3:IsStudio()
	end
	if not v103 then
		wait()
		return true, false, p_u_101
	end
	local v104 = p98:GetSpeaker(p99)
	if v104 == nil then
		return false, nil, nil
	end
	local v_u_105 = v104:GetPlayer()
	if v_u_105 == nil then
		return true, false, p_u_101
	end
	if string.len((string.gsub(p_u_101, " ", ""))) == 0 then
		return true, false, p_u_101
	end
	local v106, v107 = pcall(function()
		-- upvalues: (copy) p_u_101, (copy) v_u_105, (copy) p_u_100, (copy) p_u_102
		return game:GetService("TextService"):FilterAndTranslateStringAsync(p_u_101, v_u_105.UserId, p_u_100, p_u_102)
	end)
	if v106 then
		return true, true, v107
	end
	warn("Error filtering and translating message", p_u_101, v107)
	p98:InternalNotifyFilterIssue()
	return false, nil, nil
end
function v_u_14.InternalApplyRobloxFilterNewAPI(p108, p109, p_u_110, p_u_111)
	-- upvalues: (copy) v_u_3
	local v112 = v_u_3:IsServer()
	if v112 then
		v112 = not v_u_3:IsStudio()
	end
	if not v112 then
		wait()
		return true, false, p_u_110
	end
	local v113 = p108:GetSpeaker(p109)
	if v113 == nil then
		return false, nil, nil
	end
	local v_u_114 = v113:GetPlayer()
	if v_u_114 == nil then
		return true, false, p_u_110
	end
	if string.len((string.gsub(p_u_110, " ", ""))) == 0 then
		return true, false, p_u_110
	end
	local v115, v116 = pcall(function()
		-- upvalues: (copy) p_u_110, (copy) v_u_114, (copy) p_u_111
		return game:GetService("TextService"):FilterStringAsync(p_u_110, v_u_114.UserId, p_u_111)
	end)
	if v115 then
		return true, true, v116
	end
	warn("Error filtering message:", p_u_110, v116)
	p108:InternalNotifyFilterIssue()
	return false, nil, nil
end
function v_u_14.InternalDoMessageFilter(p117, p_u_118, p_u_119, p_u_120)
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
function v_u_14.InternalDoProcessCommands(p125, p_u_126, p_u_127, p_u_128)
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
function v_u_14.InternalGetUniqueMessageId(p134)
	local v135 = p134.MessageIdCounter
	p134.MessageIdCounter = v135 + 1
	return v135
end
function v_u_14.InternalAddSpeakerWithPlayerObject(p_u_136, p_u_137, p138, p139)
	-- upvalues: (copy) v_u_10
	if p_u_136.Speakers[p_u_137:lower()] then
		error("Speaker \"" .. p_u_137 .. "\" already exists!")
	end
	local v140 = v_u_10.new(p_u_136, p_u_137)
	v140:InternalAssignPlayerObject(p138)
	p_u_136.Speakers[p_u_137:lower()] = v140
	if p139 then
		local v141, v142 = pcall(function()
			-- upvalues: (copy) p_u_136, (copy) p_u_137
			p_u_136.eSpeakerAdded:Fire(p_u_137)
		end)
		if not v141 and v142 then
			print("Error adding speaker: " .. v142)
		end
	end
	return v140
end
function v_u_14.InternalFireSpeakerAdded(p_u_143, p_u_144)
	local v145, v146 = pcall(function()
		-- upvalues: (copy) p_u_143, (copy) p_u_144
		p_u_143.eSpeakerAdded:Fire(p_u_144)
	end)
	if not v145 and v146 then
		print("Error firing speaker added: " .. v146)
	end
end
function v2.new()
	-- upvalues: (copy) v_u_14, (copy) v_u_11
	local v147 = setmetatable({}, v_u_14)
	v147.MessageIdCounter = 0
	v147.ChatChannels = {}
	v147.Speakers = {}
	v147.FilterMessageFunctions = v_u_11:NewSortedFunctionContainer()
	v147.ProcessCommandsFunctions = v_u_11:NewSortedFunctionContainer()
	v147.eChannelAdded = Instance.new("BindableEvent")
	v147.eChannelRemoved = Instance.new("BindableEvent")
	v147.eSpeakerAdded = Instance.new("BindableEvent")
	v147.eSpeakerRemoved = Instance.new("BindableEvent")
	v147.ChannelAdded = v147.eChannelAdded.Event
	v147.ChannelRemoved = v147.eChannelRemoved.Event
	v147.SpeakerAdded = v147.eSpeakerAdded.Event
	v147.SpeakerRemoved = v147.eSpeakerRemoved.Event
	v147.ChatServiceMajorVersion = 0
	v147.ChatServiceMinorVersion = 5
	return v147
end
return v2.new()
