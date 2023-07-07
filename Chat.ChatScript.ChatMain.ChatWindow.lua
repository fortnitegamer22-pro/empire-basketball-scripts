-- decompiled by Sentinel (took 9.156041ms)
local v1 = {}
local v_u_2 = game:GetService("Players")
game:GetService("Chat")
local v_u_3 = v_u_2.LocalPlayer:WaitForChild("PlayerGui")
local v_u_4 = game:GetService("Chat")
local v5 = script.Parent
local v_u_6 = require(v5:WaitForChild("ChatChannel"))
local v_u_7 = require(v_u_4:WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local v_u_8 = require(v5:WaitForChild("CurveUtil"))
local v_u_9 = {}
v_u_9.__index = v_u_9
function getClassicChatEnabled()
	-- upvalues: (copy) v_u_7, (copy) v_u_2
	if v_u_7.ClassicChatEnabled == nil then
		return v_u_2.ClassicChat
	else
		return v_u_7.ClassicChatEnabled
	end
end
function getBubbleChatEnabled()
	-- upvalues: (copy) v_u_7, (copy) v_u_2
	if v_u_7.BubbleChatEnabled == nil then
		return v_u_2.BubbleChat
	else
		return v_u_7.BubbleChatEnabled
	end
end
function bubbleChatOnly()
	local v10 = not getClassicChatEnabled()
	if v10 then
		v10 = getBubbleChatEnabled()
	end
	return v10
end
function mergeProps(p11, p12)
	if p11 and p12 then
		for v13, v14 in pairs(p11) do
			if p12[v13] ~= nil then
				p12[v13] = v14
			end
		end
	end
end
function v_u_9.CreateGuiObjects(p15, p16)
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_3
	local v_u_17 = nil
	pcall(function()
		-- upvalues: (ref) v_u_17, (ref) v_u_4
		v_u_17 = v_u_4:InvokeChatCallback(Enum.ChatCallbackType.OnCreatingChatWindow, nil)
	end)
	mergeProps(v_u_17, v_u_7)
	local v_u_18 = Instance.new("Frame")
	v_u_18.BackgroundTransparency = 1
	v_u_18.Active = v_u_7.WindowDraggable
	v_u_18.Parent = p16
	v_u_18.AutoLocalize = false
	local v_u_19 = Instance.new("Frame")
	v_u_19.Selectable = false
	v_u_19.Name = "ChatBarParentFrame"
	v_u_19.BackgroundTransparency = 1
	v_u_19.Parent = v_u_18
	local v_u_20 = Instance.new("Frame")
	v_u_20.Selectable = false
	v_u_20.Name = "ChannelsBarParentFrame"
	v_u_20.BackgroundTransparency = 1
	v_u_20.Position = UDim2.new(0, 0, 0, 0)
	v_u_20.Parent = v_u_18
	local v_u_21 = Instance.new("Frame")
	v_u_21.Selectable = false
	v_u_21.Name = "ChatChannelParentFrame"
	v_u_21.BackgroundTransparency = 1
	v_u_21.BackgroundColor3 = v_u_7.BackGroundColor
	v_u_21.BackgroundTransparency = 0.6
	v_u_21.BorderSizePixel = 0
	v_u_21.Parent = v_u_18
	local v_u_22 = Instance.new("ImageButton")
	v_u_22.Selectable = false
	v_u_22.Image = ""
	v_u_22.BackgroundTransparency = 0.6
	v_u_22.BorderSizePixel = 0
	v_u_22.Visible = false
	v_u_22.BackgroundColor3 = v_u_7.BackGroundColor
	v_u_22.Active = true
	if bubbleChatOnly() then
		v_u_22.Position = UDim2.new(1, -v_u_22.AbsoluteSize.X, 0, 0)
	else
		v_u_22.Position = UDim2.new(1, -v_u_22.AbsoluteSize.X, 1, -v_u_22.AbsoluteSize.Y)
	end
	v_u_22.Parent = v_u_18
	local v23 = Instance.new("ImageLabel")
	v23.Selectable = false
	v23.Size = UDim2.new(0.8, 0, 0.8, 0)
	v23.Position = UDim2.new(0.2, 0, 0.2, 0)
	v23.BackgroundTransparency = 1
	v23.Image = "rbxassetid://261880743"
	v23.Parent = v_u_22
	local v24 = 3
	local v25 = v_u_18
	while v25 and not v25:IsA("ScreenGui") do
		v25 = v25.Parent
	end
	local v_u_26 = v25.AbsoluteSize.X <= 640 and 1 or v25.AbsoluteSize.X <= 1024 and 2 or v24
	local v_u_27 = false
	local function v_u_37()
		-- upvalues: (ref) v_u_27, (copy) v_u_18, (ref) v_u_3, (ref) v_u_7, (copy) v_u_20, (copy) v_u_19
		if v_u_27 then
			return
		else
			v_u_27 = true
			if v_u_18:IsDescendantOf(v_u_3) then
				local v28 = v_u_18
				while v28 and not v28:IsA("ScreenGui") do
					v28 = v28.Parent
				end
				local v29 = v_u_7.MinimumWindowSize
				local v30 = v_u_7.MaximumWindowSize
				local v31 = v29.X.Scale * v28.AbsoluteSize.X + v29.X.Offset
				local v32 = math.max(v29.Y.Scale * v28.AbsoluteSize.Y + v29.Y.Offset, v_u_20.AbsoluteSize.Y + v_u_19.AbsoluteSize.Y)
				local v33 = v30.X.Scale * v28.AbsoluteSize.X + v30.X.Offset
				local v34 = v30.Y.Scale * v28.AbsoluteSize.Y + v30.Y.Offset
				local v35 = v_u_18.AbsoluteSize.X
				local v36 = v_u_18.AbsoluteSize.Y
				if v35 < v31 then
					v_u_18.Size = v_u_18.Size + UDim2.new(0, v31 - v35, 0, 0)
				elseif v33 < v35 then
					v_u_18.Size = v_u_18.Size + UDim2.new(0, v33 - v35, 0, 0)
				end
				if v36 < v32 then
					v_u_18.Size = v_u_18.Size + UDim2.new(0, 0, 0, v32 - v36)
				elseif v34 < v36 then
					v_u_18.Size = v_u_18.Size + UDim2.new(0, 0, 0, v34 - v36)
				end
				v_u_18.Size = UDim2.new(v_u_18.AbsoluteSize.X / v28.AbsoluteSize.X, 0, v_u_18.AbsoluteSize.Y / v28.AbsoluteSize.Y, 0)
				v_u_27 = false
			end
		end
	end
	v_u_18.Changed:connect(function(p38)
		-- upvalues: (copy) v_u_37
		if p38 == "AbsoluteSize" then
			v_u_37()
		end
	end)
	v_u_22.DragBegin:connect(function(_)
		-- upvalues: (copy) v_u_18
		v_u_18.Draggable = false
	end)
	local function v_u_41(p39)
		-- upvalues: (ref) v_u_7, (copy) v_u_18, (copy) v_u_22
		if v_u_7.WindowDraggable == false and v_u_7.WindowResizable == false then
			return
		else
			local v40 = p39 - v_u_18.AbsolutePosition + v_u_22.AbsoluteSize
			v_u_18.Size = UDim2.new(0, v40.X, 0, v40.Y)
			if bubbleChatOnly() then
				v_u_22.Position = UDim2.new(1, -v_u_22.AbsoluteSize.X, 0, 0)
			else
				v_u_22.Position = UDim2.new(1, -v_u_22.AbsoluteSize.X, 1, -v_u_22.AbsoluteSize.Y)
			end
		end
	end
	v_u_22.DragStopped:connect(function(_, _)
		-- upvalues: (copy) v_u_18, (ref) v_u_7
		v_u_18.Draggable = v_u_7.WindowDraggable
	end)
	local v_u_42 = false
	v_u_22.Changed:connect(function(p43)
		-- upvalues: (copy) v_u_18, (ref) v_u_42, (copy) v_u_41, (copy) v_u_22
		if p43 == "AbsolutePosition" and not v_u_18.Draggable then
			if v_u_42 then
				return
			end
			v_u_42 = true
			v_u_41(v_u_22.AbsolutePosition)
			v_u_42 = false
		end
	end)
	if bubbleChatOnly() then
		v_u_19.Position = UDim2.new(0, 0, 0, 0)
		v_u_20.Visible = false
		v_u_20.Active = false
		v_u_21.Visible = false
		v_u_21.Active = false
		local v44 = v_u_18
		while v44 and not v44:IsA("ScreenGui") do
			v44 = v44.Parent
		end
		local v45, v46
		if v_u_26 == 1 then
			v45 = v_u_7.DefaultWindowSizePhone.X.Scale
			v46 = v_u_7.DefaultWindowSizePhone.X.Offset
		elseif v_u_26 == 2 then
			v45 = v_u_7.DefaultWindowSizeTablet.X.Scale
			v46 = v_u_7.DefaultWindowSizeTablet.X.Offset
		else
			v45 = v_u_7.DefaultWindowSizeDesktop.X.Scale
			v46 = v_u_7.DefaultWindowSizeDesktop.X.Offset
		end
		local v47 = nil
		local v48
		if v_u_26 == 1 then
			v48 = v47 or v_u_7.ChatBarTextSizePhone
		else
			v48 = v47 or v_u_7.ChatBarTextSize
		end
		v_u_18.Size = UDim2.new(v45, v46, 0, v48 + 14 + 10)
		v_u_18.Position = v_u_7.DefaultWindowPosition
	else
		local v49 = v_u_18
		while v49 and not v49:IsA("ScreenGui") do
			v49 = v49.Parent
		end
		if v_u_26 == 1 then
			v_u_18.Size = v_u_7.DefaultWindowSizePhone
		elseif v_u_26 == 2 then
			v_u_18.Size = v_u_7.DefaultWindowSizeTablet
		else
			v_u_18.Size = v_u_7.DefaultWindowSizeDesktop
		end
		v_u_18.Position = v_u_7.DefaultWindowPosition
	end
	if v_u_26 == 1 then
		v_u_7.ChatWindowTextSize = v_u_7.ChatWindowTextSizePhone
		v_u_7.ChatChannelsTabTextSize = v_u_7.ChatChannelsTabTextSizePhone
		v_u_7.ChatBarTextSize = v_u_7.ChatBarTextSizePhone
	end
	local function v_u_52(p50)
		-- upvalues: (copy) v_u_22, (copy) v_u_19
		v_u_22.Visible = p50
		v_u_22.Draggable = p50
		local v51 = v_u_19.Size.Y.Offset
		if p50 then
			v_u_19.Size = UDim2.new(1, -v51 - 2, 0, v51)
			if not bubbleChatOnly() then
				v_u_19.Position = UDim2.new(0, 0, 1, -v51)
				return
			end
		else
			v_u_19.Size = UDim2.new(1, 0, 0, v51)
			if not bubbleChatOnly() then
				v_u_19.Position = UDim2.new(0, 0, 1, -v51)
			end
		end
	end
	local function v_u_59()
		-- upvalues: (ref) v_u_26, (ref) v_u_7, (copy) v_u_21
		local v53 = nil
		local v54
		if v_u_26 == 1 then
			v54 = v53 or v_u_7.ChatChannelsTabTextSizePhone
		else
			v54 = v53 or v_u_7.ChatChannelsTabTextSize
		end
		local v55 = math.max(32, v54 + 8) + 2
		local v56 = nil
		local v57
		if v_u_26 == 1 then
			v57 = v56 or v_u_7.ChatBarTextSizePhone
		else
			v57 = v56 or v_u_7.ChatBarTextSize
		end
		local v58 = v57 + 14 + 10
		if v_u_7.ShowChannelsBar then
			v_u_21.Size = UDim2.new(1, 0, 1, -(v55 + v58 + 2 + 2))
			v_u_21.Position = UDim2.new(0, 0, 0, v55 + 2)
		else
			v_u_21.Size = UDim2.new(1, 0, 1, -(v58 + 2 + 2))
			v_u_21.Position = UDim2.new(0, 0, 0, 2)
		end
	end
	local function v_u_63(p60)
		-- upvalues: (ref) v_u_26, (ref) v_u_7, (copy) v_u_19, (copy) v_u_22, (copy) v_u_59, (copy) v_u_52
		local v61
		if v_u_26 == 1 then
			v61 = p60 or v_u_7.ChatBarTextSizePhone
		else
			v61 = p60 or v_u_7.ChatBarTextSize
		end
		local v62 = v61 + 14 + 10
		v_u_19.Size = UDim2.new(1, 0, 0, v62)
		if not bubbleChatOnly() then
			v_u_19.Position = UDim2.new(0, 0, 1, -v62)
		end
		v_u_22.Size = UDim2.new(0, v62, 0, v62)
		v_u_22.Position = UDim2.new(1, -v62, 1, -v62)
		v_u_59()
		v_u_52(v_u_7.WindowResizable)
	end
	local v64 = v_u_7.ChatChannelsTabTextSize
	local v65
	if v_u_26 == 1 then
		v65 = v64 or v_u_7.ChatChannelsTabTextSizePhone
	else
		v65 = v64 or v_u_7.ChatChannelsTabTextSize
	end
	v_u_20.Size = UDim2.new(1, 0, 0, math.max(32, v65 + 8) + 2)
	v_u_59()
	v_u_63(v_u_7.ChatBarTextSize)
	local v66 = v_u_7.WindowDraggable
	v_u_18.Active = v66
	v_u_18.Draggable = v66
	v_u_52(v_u_7.WindowResizable)
	v_u_20.Visible = v_u_7.ShowChannelsBar
	v_u_59()
	v_u_7.SettingsChanged:connect(function(p67, p68)
		-- upvalues: (copy) v_u_18, (copy) v_u_52, (ref) v_u_26, (ref) v_u_7, (copy) v_u_20, (copy) v_u_59, (copy) v_u_63
		if p67 == "WindowDraggable" then
			v_u_18.Active = p68
			v_u_18.Draggable = p68
			return
		elseif p67 == "WindowResizable" then
			v_u_52(p68)
			return
		elseif p67 == "ChatChannelsTabTextSize" then
			local v69
			if v_u_26 == 1 then
				v69 = p68 or v_u_7.ChatChannelsTabTextSizePhone
			else
				v69 = p68 or v_u_7.ChatChannelsTabTextSize
			end
			v_u_20.Size = UDim2.new(1, 0, 0, math.max(32, v69 + 8) + 2)
			v_u_59()
			return
		elseif p67 == "ChatBarTextSize" then
			v_u_63(p68)
		elseif p67 == "ShowChannelsBar" then
			v_u_20.Visible = p68
			v_u_59()
		end
	end)
	p15.GuiObject = v_u_18
	p15.GuiObjects.BaseFrame = v_u_18
	p15.GuiObjects.ChatBarParentFrame = v_u_19
	p15.GuiObjects.ChannelsBarParentFrame = v_u_20
	p15.GuiObjects.ChatChannelParentFrame = v_u_21
	p15.GuiObjects.ChatResizerFrame = v_u_22
	p15.GuiObjects.ResizeIcon = v23
	p15:AnimGuiObjects()
end
function v_u_9.GetChatBar(p70)
	return p70.ChatBar
end
function v_u_9.RegisterChatBar(p71, p72)
	p71.ChatBar = p72
	p71.ChatBar:CreateGuiObjects(p71.GuiObjects.ChatBarParentFrame)
end
function v_u_9.RegisterChannelsBar(p73, p74)
	p73.ChannelsBar = p74
	p73.ChannelsBar:CreateGuiObjects(p73.GuiObjects.ChannelsBarParentFrame)
end
function v_u_9.RegisterMessageLogDisplay(p75, p76)
	p75.MessageLogDisplay = p76
	p75.MessageLogDisplay.GuiObject.Parent = p75.GuiObjects.ChatChannelParentFrame
end
function v_u_9.AddChannel(p_u_77, p_u_78)
	-- upvalues: (copy) v_u_6
	if not p_u_77:GetChannel(p_u_78) then
		local v79 = v_u_6.new(p_u_78, p_u_77.MessageLogDisplay)
		p_u_77.Channels[p_u_78:lower()] = v79
		v79:SetActive(false)
		local v80 = p_u_77.ChannelsBar:AddChannelTab(p_u_78)
		v80.NameTag.MouseButton1Click:connect(function()
			-- upvalues: (copy) p_u_77, (copy) p_u_78
			p_u_77:SwitchCurrentChannel(p_u_78)
		end)
		v79:RegisterChannelTab(v80)
		return v79
	end
	error("Channel \'" .. p_u_78 .. "\' already exists!")
end
function v_u_9.GetFirstChannel(p81)
	-- block 4
	local v82, v83, v84
	-- GenericForInit
v82, v83, v84 = pairs(p81.Channels)
[internal control] = v84
-- end GenericForInit
	local v85, v86
	-- GenericForNext
v85, v86 = v82(v83, [internal control])
if v85 ~= nil
[internal control] = v85
-- end GenericForNext
	-- block 0
	goto l3
	::l1::
	return v86
	-- block 2
	goto l1
	::l3::
	return nil
end
function v_u_9.RemoveChannel(p87, p88)
	-- upvalues: (copy) v_u_7
	if not p87:GetChannel(p88) then
		error("Channel \'" .. p88 .. "\' does not exist!")
	end
	local v89 = p88:lower()
	local v90
	if p87.Channels[v89] == p87:GetCurrentChannel() then
		p87:SwitchCurrentChannel(nil)
		v90 = true
	else
		v90 = false
	end
	p87.Channels[v89]:Destroy()
	p87.Channels[v89] = nil
	p87.ChannelsBar:RemoveChannelTab(p88)
	if v90 then
		local v91
		if p87:GetChannel(v_u_7.GeneralChannelName) ~= nil and v89 ~= v_u_7.GeneralChannelName:lower() then
			v91 = v_u_7.GeneralChannelName
		else
			local v92 = p87:GetFirstChannel()
			v91 = v92 and v92.Name or nil
		end
		p87:SwitchCurrentChannel(v91)
	end
	if not v_u_7.ShowChannelsBar and p87.ChatBar.TargetChannel == p88 then
		p87.ChatBar:SetChannelTarget(v_u_7.GeneralChannelName)
	end
end
function v_u_9.GetChannel(p93, p94)
	return p94 and p93.Channels[p94:lower()] or nil
end
function v_u_9.GetTargetMessageChannel(p95)
	-- upvalues: (copy) v_u_7
	if not v_u_7.ShowChannelsBar then
		return p95.ChatBar.TargetChannel
	end
	local v96 = p95:GetCurrentChannel()
	if v96 then
		v96 = v96.Name
	end
	return v96
end
function v_u_9.GetCurrentChannel(p97)
	return p97.CurrentChannel
end
function v_u_9.SwitchCurrentChannel(p98, p99)
	-- upvalues: (copy) v_u_7
	if not v_u_7.ShowChannelsBar then
		local v100 = p98:GetChannel(p99)
		if v100 then
			p98.ChatBar:SetChannelTarget(v100.Name)
		end
		p99 = v_u_7.GeneralChannelName
	end
	local v101 = p98:GetCurrentChannel()
	local v102 = p98:GetChannel(p99)
	if v102 == nil then
		error(string.format("Channel \'%s\' does not exist.", p99))
	end
	if v102 ~= v101 then
		if v101 then
			v101:SetActive(false)
			p98.ChannelsBar:GetChannelTab(v101.Name):SetActive(false)
		end
		if v102 then
			v102:SetActive(true)
			p98.ChannelsBar:GetChannelTab(v102.Name):SetActive(true)
		end
		p98.CurrentChannel = v102
	end
end
function v_u_9.UpdateFrameVisibility(p103)
	local v104 = p103.GuiObject
	local v105 = p103.Visible
	if v105 then
		v105 = p103.CoreGuiEnabled
	end
	v104.Visible = v105
end
function v_u_9.GetVisible(p106)
	return p106.Visible
end
function v_u_9.SetVisible(p107, p108)
	p107.Visible = p108
	p107:UpdateFrameVisibility()
end
function v_u_9.GetCoreGuiEnabled(p109)
	return p109.CoreGuiEnabled
end
function v_u_9.SetCoreGuiEnabled(p110, p111)
	p110.CoreGuiEnabled = p111
	p110:UpdateFrameVisibility()
end
function v_u_9.EnableResizable(p112)
	p112.GuiObjects.ChatResizerFrame.Active = true
end
function v_u_9.DisableResizable(p113)
	p113.GuiObjects.ChatResizerFrame.Active = false
end
function v_u_9.FadeOutBackground(p114, p115)
	-- upvalues: (copy) v_u_8
	p114.ChannelsBar:FadeOutBackground(p115)
	p114.MessageLogDisplay:FadeOutBackground(p115)
	p114.ChatBar:FadeOutBackground(p115)
	p114.AnimParams.Background_TargetTransparency = 1
	p114.AnimParams.Background_NormalizedExptValue = v_u_8:NormalizedDefaultExptValueInSeconds(p115)
end
function v_u_9.FadeInBackground(p116, p117)
	-- upvalues: (copy) v_u_8
	p116.ChannelsBar:FadeInBackground(p117)
	p116.MessageLogDisplay:FadeInBackground(p117)
	p116.ChatBar:FadeInBackground(p117)
	p116.AnimParams.Background_TargetTransparency = 0.6
	p116.AnimParams.Background_NormalizedExptValue = v_u_8:NormalizedDefaultExptValueInSeconds(p117)
end
function v_u_9.FadeOutText(p118, p119)
	p118.MessageLogDisplay:FadeOutText(p119)
	p118.ChannelsBar:FadeOutText(p119)
end
function v_u_9.FadeInText(p120, p121)
	p120.MessageLogDisplay:FadeInText(p121)
	p120.ChannelsBar:FadeInText(p121)
end
function v_u_9.AnimGuiObjects(p122)
	p122.GuiObjects.ChatChannelParentFrame.BackgroundTransparency = p122.AnimParams.Background_CurrentTransparency
	p122.GuiObjects.ChatResizerFrame.BackgroundTransparency = p122.AnimParams.Background_CurrentTransparency
	p122.GuiObjects.ResizeIcon.ImageTransparency = p122.AnimParams.Background_CurrentTransparency
end
function v_u_9.InitializeAnimParams(p123)
	-- upvalues: (copy) v_u_8
	p123.AnimParams.Background_TargetTransparency = 0.6
	p123.AnimParams.Background_CurrentTransparency = 0.6
	p123.AnimParams.Background_NormalizedExptValue = v_u_8:NormalizedDefaultExptValueInSeconds(0)
end
function v_u_9.Update(p124, p125)
	-- upvalues: (copy) v_u_8
	p124.ChatBar:Update(p125)
	p124.ChannelsBar:Update(p125)
	p124.MessageLogDisplay:Update(p125)
	p124.AnimParams.Background_CurrentTransparency = v_u_8:Expt(p124.AnimParams.Background_CurrentTransparency, p124.AnimParams.Background_TargetTransparency, p124.AnimParams.Background_NormalizedExptValue, p125)
	p124:AnimGuiObjects()
end
function v1.new()
	-- upvalues: (copy) v_u_9
	local v126 = setmetatable({}, v_u_9)
	v126.GuiObject = nil
	v126.GuiObjects = {}
	v126.ChatBar = nil
	v126.ChannelsBar = nil
	v126.MessageLogDisplay = nil
	v126.Channels = {}
	v126.CurrentChannel = nil
	v126.Visible = true
	v126.CoreGuiEnabled = true
	v126.AnimParams = {}
	v126:InitializeAnimParams()
	return v126
end
return v1
