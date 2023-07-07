-- decompiled by Sentinel (took 2.725809ms)
local v1, v2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagRemoveMessageFromMessageLog")
end)
local v_u_3 = v1 and v2
local v4, v5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled")
end)
local v_u_6 = v4 and v5
local v7 = {}
local v8 = script.Parent
local v_u_9 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local v_u_10
if v_u_6 then
	local v_u_11 = v8:FindFirstChild("ChatTranslationEnabled")
	if v_u_11 == nil then
		local v_u_12 = nil
		v_u_12 = v8.ChildAdded:Connect(function(p13)
			-- upvalues: (ref) v_u_11, (ref) v_u_12
			if p13.Name == "ChatTranslationEnabled" then
				v_u_11 = p13
				v_u_12:Disconnect()
			end
		end)
		v_u_10 = v_u_11
	else
		v_u_10 = v_u_11
	end
else
	v_u_10 = nil
end
local v_u_14 = {}
v_u_14.__index = v_u_14
function v_u_14.Destroy(p15)
	p15.Destroyed = true
end
function v_u_14.SetActive(p16, p17)
	if p17 ~= p16.Active then
		if p17 == false then
			p16.MessageLogDisplay:Clear()
		else
			p16.MessageLogDisplay:SetCurrentChannelName(p16.Name)
			for v18 = 1, #p16.MessageLog do
				p16.MessageLogDisplay:AddMessage(p16.MessageLog[v18])
			end
		end
		p16.Active = p17
	end
end
function v_u_14.UpdateMessageFiltered(p19, p20)
	-- upvalues: (ref) v_u_6, (ref) v_u_10, (ref) v_u_3
	local v21 = p19.MessageLog
	local v22 = nil
	local v23 = 1
	while true do
		if v23 > #v21 then
			v24 = v22
			break
		end
		local v24 = v21[v23]
		if v24.ID == p20.ID then
			break
		end
		v23 = v23 + 1
	end
	if v24 then
		v24.Message = p20.Message
		v24.IsFiltered = true
		if v_u_6 and v_u_10 ~= nil and v_u_10.Value then
			v24.TranslatedMessage = p20.TranslatedMessage
			v24.ShowTranslated = true
		end
		if p19.Active then
			if v_u_3 and v24.Message == "" then
				table.remove(p19.MessageLog, v23)
			end
			p19.MessageLogDisplay:UpdateMessageFiltered(v24)
			return
		end
	else
		p19:AddMessageToChannelByTimeStamp(p20)
	end
end
function v_u_14.AddMessageToChannel(p25, p26)
	-- upvalues: (copy) v_u_9
	table.insert(p25.MessageLog, p26)
	if p25.Active then
		p25.MessageLogDisplay:AddMessage(p26)
	end
	if #p25.MessageLog > v_u_9.MessageHistoryLengthPerChannel then
		p25:RemoveLastMessageFromChannel()
	end
end
function v_u_14.InternalAddMessageAtTimeStamp(p27, p28)
	for v29 = 1, #p27.MessageLog do
		if p28.Time < p27.MessageLog[v29].Time then
			table.insert(p27.MessageLog, v29, p28)
			return
		end
	end
	table.insert(p27.MessageLog, p28)
end
function v_u_14.AddMessagesToChannelByTimeStamp(p30, p31, p32)
	-- upvalues: (copy) v_u_9
	for v33 = p32, #p31 do
		p30:InternalAddMessageAtTimeStamp(p31[v33])
	end
	while #p30.MessageLog > v_u_9.MessageHistoryLengthPerChannel do
		table.remove(p30.MessageLog, 1)
	end
	if p30.Active then
		p30.MessageLogDisplay:Clear()
		for v34 = 1, #p30.MessageLog do
			p30.MessageLogDisplay:AddMessage(p30.MessageLog[v34])
		end
	end
end
function v_u_14.AddMessageToChannelByTimeStamp(p35, p36)
	-- upvalues: (copy) v_u_9
	if 1 <= #p35.MessageLog then
		if p35.MessageLog[1].Time > p36.Time then
			return
		elseif p36.Time >= p35.MessageLog[#p35.MessageLog].Time then
			p35:AddMessageToChannel(p36)
		else
			for v37 = 1, #p35.MessageLog do
				if p36.Time < p35.MessageLog[v37].Time then
					table.insert(p35.MessageLog, v37, p36)
					if #p35.MessageLog > v_u_9.MessageHistoryLengthPerChannel then
						p35:RemoveLastMessageFromChannel()
					end
					if p35.Active then
						p35.MessageLogDisplay:AddMessageAtIndex(p36, v37)
					end
					return
				end
			end
		end
	else
		p35:AddMessageToChannel(p36)
		return
	end
end
function v_u_14.RemoveLastMessageFromChannel(p38)
	table.remove(p38.MessageLog, 1)
	if p38.Active then
		p38.MessageLogDisplay:RemoveLastMessage()
	end
end
function v_u_14.ClearMessageLog(p39)
	p39.MessageLog = {}
	if p39.Active then
		p39.MessageLogDisplay:Clear()
	end
end
function v_u_14.RegisterChannelTab(p40, p41)
	p40.ChannelTab = p41
end
function v7.new(p42, p43)
	-- upvalues: (copy) v_u_14
	local v44 = setmetatable({}, v_u_14)
	v44.Destroyed = false
	v44.Active = false
	v44.MessageLog = {}
	v44.MessageLogDisplay = p43
	v44.ChannelTab = nil
	v44.Name = p42
	return v44
end
return v7
