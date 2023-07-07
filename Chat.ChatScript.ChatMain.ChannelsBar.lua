-- decompiled by Sentinel (took 4.532569ms)
local v1 = {}
local v2 = script.Parent
local v_u_3 = require(v2:WaitForChild("ChannelsTab"))
local v_u_4 = require(v2:WaitForChild("MessageSender"))
local v_u_5 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local v_u_6 = require(v2:WaitForChild("CurveUtil"))
local v_u_7 = {}
v_u_7.__index = v_u_7
function v_u_7.CreateGuiObjects(p_u_8, p9)
	-- upvalues: (copy) v_u_5, (copy) v_u_4
	local v10 = Instance.new("Frame")
	v10.Selectable = false
	v10.Size = UDim2.new(1, 0, 1, 0)
	v10.BackgroundTransparency = 1
	v10.Parent = p9
	local v11 = Instance.new("Frame")
	v11.Selectable = false
	v11.Name = "ScrollingBase"
	v11.BackgroundTransparency = 1
	v11.ClipsDescendants = true
	v11.Size = UDim2.new(1, 0, 1, 0)
	v11.Position = UDim2.new(0, 0, 0, 0)
	v11.Parent = v10
	local v12 = Instance.new("Frame")
	v12.Selectable = false
	v12.Name = "ScrollerSizer"
	v12.BackgroundTransparency = 1
	v12.Size = UDim2.new(1, 0, 1, 0)
	v12.Position = UDim2.new(0, 0, 0, 0)
	v12.Parent = v11
	local v13 = Instance.new("Frame")
	v13.Selectable = false
	v13.Name = "ScrollerFrame"
	v13.BackgroundTransparency = 1
	v13.Size = UDim2.new(1, 0, 1, 0)
	v13.Position = UDim2.new(0, 0, 0, 0)
	v13.Parent = v12
	local v14 = Instance.new("Frame")
	v14.Selectable = false
	v14.Size = UDim2.new(1, 0, 1, 0)
	v14.Position = UDim2.new(0, 0, 0, 0)
	v14.ClipsDescendants = true
	v14.BackgroundTransparency = 1
	v14.Parent = v10
	local v_u_15 = Instance.new("Frame")
	v_u_15.Selectable = false
	v_u_15.Name = "LeaveConfirmationFrame"
	v_u_15.Size = UDim2.new(1, 0, 1, 0)
	v_u_15.Position = UDim2.new(0, 0, 1, 0)
	v_u_15.BackgroundTransparency = 0.6
	v_u_15.BorderSizePixel = 0
	v_u_15.BackgroundColor3 = Color3.new(0, 0, 0)
	v_u_15.Parent = v14
	local v16 = Instance.new("TextButton")
	v16.Selectable = false
	v16.Size = UDim2.new(1, 0, 1, 0)
	v16.BackgroundTransparency = 1
	v16.Text = ""
	v16.Parent = v_u_15
	local v17 = Instance.new("TextButton")
	v17.Selectable = false
	v17.Size = UDim2.new(0.25, 0, 1, 0)
	v17.BackgroundTransparency = 1
	v17.Font = v_u_5.DefaultFont
	v17.TextSize = 18
	v17.TextStrokeTransparency = 0.75
	v17.Position = UDim2.new(0, 0, 0, 0)
	v17.TextColor3 = Color3.new(0, 1, 0)
	v17.Text = "Confirm"
	v17.Parent = v_u_15
	local v18 = v17:Clone()
	v18.Parent = v_u_15
	v18.Position = UDim2.new(0.75, 0, 0, 0)
	v18.TextColor3 = Color3.new(1, 0, 0)
	v18.Text = "Cancel"
	local v19 = Instance.new("TextLabel")
	v19.Selectable = false
	v19.Size = UDim2.new(0.5, 0, 1, 0)
	v19.Position = UDim2.new(0.25, 0, 0, 0)
	v19.BackgroundTransparency = 1
	v19.TextColor3 = Color3.new(1, 1, 1)
	v19.TextStrokeTransparency = 0.75
	v19.Text = "Leave channel <XX>?"
	v19.Font = v_u_5.DefaultFont
	v19.TextSize = 18
	v19.Parent = v_u_15
	local v_u_20 = Instance.new("StringValue")
	v_u_20.Name = "LeaveTarget"
	v_u_20.Parent = v_u_15
	local v_u_21 = v_u_15.Position
	v17.MouseButton1Click:connect(function()
		-- upvalues: (ref) v_u_4, (copy) v_u_20, (copy) v_u_15, (copy) v_u_21
		v_u_4:SendMessage(string.format("/leave %s", v_u_20.Value), nil)
		v_u_15:TweenPosition(v_u_21, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
	end)
	v18.MouseButton1Click:connect(function()
		-- upvalues: (copy) v_u_15, (copy) v_u_21
		v_u_15:TweenPosition(v_u_21, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
	end)
	local v22 = Instance.new("ImageButton", v10)
	v22.Selectable = v_u_5.GamepadNavigationEnabled
	v22.Name = "PageLeftButton"
	v22.SizeConstraint = Enum.SizeConstraint.RelativeYY
	v22.Size = UDim2.new(0.7, 0, 0.7, 0)
	v22.BackgroundTransparency = 1
	v22.Position = UDim2.new(0, 4, 0.15000000000000002, 0)
	v22.Visible = false
	v22.Image = "rbxassetid://471630199"
	local v23 = Instance.new("ImageLabel", v22)
	v23.Name = "ArrowLabel"
	v23.BackgroundTransparency = 1
	v23.Size = UDim2.new(0.4, 0, 0.4, 0)
	v23.Image = "rbxassetid://471630112"
	local v24 = Instance.new("Frame", v10)
	v24.Selectable = false
	v24.BackgroundTransparency = 1
	v24.Name = "PositionalHelper"
	v24.Size = v22.Size
	v24.SizeConstraint = v22.SizeConstraint
	v24.Position = UDim2.new(1, 0, 0.15000000000000002, 0)
	local v25 = v22:Clone()
	v25.Parent = v24
	v25.Name = "PageRightButton"
	v25.Size = UDim2.new(1, 0, 1, 0)
	v25.SizeConstraint = Enum.SizeConstraint.RelativeXY
	v25.Position = UDim2.new(-1, -4, 0, 0)
	local v26 = UDim2.new(0.05, 0, 0, 0)
	v25.ArrowLabel.Position = UDim2.new(0.3, 0, 0.3, 0) + v26
	v22.ArrowLabel.Position = UDim2.new(0.3, 0, 0.3, 0) - v26
	v22.ArrowLabel.Rotation = 180
	p_u_8.GuiObject = v10
	p_u_8.GuiObjects.BaseFrame = v10
	p_u_8.GuiObjects.ScrollerSizer = v12
	p_u_8.GuiObjects.ScrollerFrame = v13
	p_u_8.GuiObjects.PageLeftButton = v22
	p_u_8.GuiObjects.PageRightButton = v25
	p_u_8.GuiObjects.LeaveConfirmationFrame = v_u_15
	p_u_8.GuiObjects.LeaveConfirmationNotice = v19
	p_u_8.GuiObjects.PageLeftButtonArrow = v22.ArrowLabel
	p_u_8.GuiObjects.PageRightButtonArrow = v25.ArrowLabel
	p_u_8:AnimGuiObjects()
	v22.MouseButton1Click:connect(function()
		-- upvalues: (copy) p_u_8
		p_u_8:ScrollChannelsFrame(-1)
	end)
	v25.MouseButton1Click:connect(function()
		-- upvalues: (copy) p_u_8
		p_u_8:ScrollChannelsFrame(1)
	end)
	p_u_8:ScrollChannelsFrame(0)
end
function v_u_7.UpdateMessagePostedInChannel(p27, p28)
	local v29 = p27:GetChannelTab(p28)
	if v29 then
		v29:UpdateMessagePostedInChannel()
	else
		warn("ChannelsTab \'" .. p28 .. "\' does not exist!")
	end
end
function v_u_7.AddChannelTab(p_u_30, p31)
	-- upvalues: (copy) v_u_3, (copy) v_u_5
	if p_u_30:GetChannelTab(p31) then
		error("Channel tab \'" .. p31 .. "\'already exists!")
	end
	local v_u_32 = v_u_3.new(p31)
	v_u_32.GuiObject.Parent = p_u_30.GuiObjects.ScrollerFrame
	p_u_30.ChannelTabs[p31:lower()] = v_u_32
	p_u_30.NumTabs = p_u_30.NumTabs + 1
	p_u_30:OrganizeChannelTabs()
	if v_u_5.RightClickToLeaveChannelEnabled then
		v_u_32.NameTag.MouseButton2Click:connect(function()
			-- upvalues: (copy) p_u_30, (copy) v_u_32
			p_u_30.LeaveConfirmationNotice.Text = string.format("Leave channel %s?", v_u_32.ChannelName)
			p_u_30.LeaveConfirmationFrame.LeaveTarget.Value = v_u_32.ChannelName
			p_u_30.LeaveConfirmationFrame:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true)
		end)
	end
	return v_u_32
end
function v_u_7.RemoveChannelTab(p33, p34)
	if not p33:GetChannelTab(p34) then
		error("Channel tab \'" .. p34 .. "\'does not exist!")
	end
	local v35 = p34:lower()
	p33.ChannelTabs[v35]:Destroy()
	p33.ChannelTabs[v35] = nil
	p33.NumTabs = p33.NumTabs - 1
	p33:OrganizeChannelTabs()
end
function v_u_7.GetChannelTab(p36, p37)
	return p36.ChannelTabs[p37:lower()]
end
function v_u_7.OrganizeChannelTabs(p38)
	-- upvalues: (copy) v_u_5
	local v39 = {}
	table.insert(v39, p38:GetChannelTab(v_u_5.GeneralChannelName))
	table.insert(v39, p38:GetChannelTab("System"))
	for _, v40 in pairs(p38.ChannelTabs) do
		if v40.ChannelName ~= v_u_5.GeneralChannelName and v40.ChannelName ~= "System" then
			table.insert(v39, v40)
		end
	end
	for v41, v42 in pairs(v39) do
		v42.GuiObject.Position = UDim2.new(v41 - 1, 0, 0, 0)
	end
	p38.GuiObjects.ScrollerSizer.Size = UDim2.new(1 / math.max(1, (math.min(v_u_5.ChannelsBarFullTabSize, p38.NumTabs))), 0, 1, 0)
	p38:ScrollChannelsFrame(0)
end
function v_u_7.ResizeChannelTabText(p43, p44)
	for _, v45 in pairs(p43.ChannelTabs) do
		v45:SetTextSize(p44)
	end
end
function v_u_7.ScrollChannelsFrame(p_u_46, p47)
	-- upvalues: (copy) v_u_5
	if p_u_46.ScrollChannelsFrameLock then
		return
	else
		p_u_46.ScrollChannelsFrameLock = true
		local v48 = v_u_5.ChannelsBarFullTabSize
		local v49 = p_u_46.CurPageNum + p47
		if v49 < 0 then
			v49 = 0
		elseif 0 < v49 then
			if v49 + v48 > p_u_46.NumTabs then
				v49 = p_u_46.NumTabs - v48
			end
		end
		p_u_46.CurPageNum = v49
		local v50 = UDim2.new(-p_u_46.CurPageNum, 0, 0, 0)
		p_u_46.GuiObjects.PageLeftButton.Visible = 0 < p_u_46.CurPageNum
		p_u_46.GuiObjects.PageRightButton.Visible = p_u_46.CurPageNum + v48 < p_u_46.NumTabs
		if p47 == 0 then
			p_u_46.ScrollChannelsFrameLock = false
		else
			p_u_46:WaitUntilParentedCorrectly()
			p_u_46.GuiObjects.ScrollerFrame:TweenPosition(v50, Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.15, true, function()
				-- upvalues: (copy) p_u_46
				p_u_46.ScrollChannelsFrameLock = false
			end)
		end
	end
end
function v_u_7.FadeOutBackground(p51, p52)
	-- upvalues: (copy) v_u_6
	for _, v53 in pairs(p51.ChannelTabs) do
		v53:FadeOutBackground(p52)
	end
	p51.AnimParams.Background_TargetTransparency = 1
	p51.AnimParams.Background_NormalizedExptValue = v_u_6:NormalizedDefaultExptValueInSeconds(p52)
end
function v_u_7.FadeInBackground(p54, p55)
	-- upvalues: (copy) v_u_6
	for _, v56 in pairs(p54.ChannelTabs) do
		v56:FadeInBackground(p55)
	end
	p54.AnimParams.Background_TargetTransparency = 0.6
	p54.AnimParams.Background_NormalizedExptValue = v_u_6:NormalizedDefaultExptValueInSeconds(p55)
end
function v_u_7.FadeOutText(p57, p58)
	for _, v59 in pairs(p57.ChannelTabs) do
		v59:FadeOutText(p58)
	end
end
function v_u_7.FadeInText(p60, p61)
	for _, v62 in pairs(p60.ChannelTabs) do
		v62:FadeInText(p61)
	end
end
function v_u_7.AnimGuiObjects(p63)
	p63.GuiObjects.PageLeftButton.ImageTransparency = p63.AnimParams.Background_CurrentTransparency
	p63.GuiObjects.PageRightButton.ImageTransparency = p63.AnimParams.Background_CurrentTransparency
	p63.GuiObjects.PageLeftButtonArrow.ImageTransparency = p63.AnimParams.Background_CurrentTransparency
	p63.GuiObjects.PageRightButtonArrow.ImageTransparency = p63.AnimParams.Background_CurrentTransparency
end
function v_u_7.InitializeAnimParams(p64)
	-- upvalues: (copy) v_u_6
	p64.AnimParams.Background_TargetTransparency = 0.6
	p64.AnimParams.Background_CurrentTransparency = 0.6
	p64.AnimParams.Background_NormalizedExptValue = v_u_6:NormalizedDefaultExptValueInSeconds(0)
end
function v_u_7.Update(p65, p66)
	-- upvalues: (copy) v_u_6
	for _, v67 in pairs(p65.ChannelTabs) do
		v67:Update(p66)
	end
	p65.AnimParams.Background_CurrentTransparency = v_u_6:Expt(p65.AnimParams.Background_CurrentTransparency, p65.AnimParams.Background_TargetTransparency, p65.AnimParams.Background_NormalizedExptValue, p66)
	p65:AnimGuiObjects()
end
function v_u_7.WaitUntilParentedCorrectly(p68)
	while not p68.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
		p68.GuiObject.AncestryChanged:wait()
	end
end
function v1.new()
	-- upvalues: (copy) v_u_7, (copy) v_u_5
	local v_u_69 = setmetatable({}, v_u_7)
	v_u_69.GuiObject = nil
	v_u_69.GuiObjects = {}
	v_u_69.ChannelTabs = {}
	v_u_69.NumTabs = 0
	v_u_69.CurPageNum = 0
	v_u_69.ScrollChannelsFrameLock = false
	v_u_69.AnimParams = {}
	v_u_69:InitializeAnimParams()
	v_u_5.SettingsChanged:connect(function(p70, p71)
		-- upvalues: (copy) v_u_69
		if p70 == "ChatChannelsTabTextSize" then
			v_u_69:ResizeChannelTabText(p71)
		end
	end)
	return v_u_69
end
return v1
