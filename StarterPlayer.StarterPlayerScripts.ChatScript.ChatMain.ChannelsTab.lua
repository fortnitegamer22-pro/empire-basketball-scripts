-- decompiled by Sentinel (took 3.047192ms)
local v1 = {}
local v_u_2 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local v_u_3 = require(script.Parent:WaitForChild("CurveUtil"))
local v_u_4 = {}
v_u_4.__index = v_u_4
local function v_u_18()
	-- upvalues: (copy) v_u_2
	local v5 = Instance.new("Frame")
	v5.Selectable = false
	v5.Size = UDim2.new(1, 0, 1, 0)
	v5.BackgroundTransparency = 1
	local v6 = Instance.new("Frame")
	v6.Selectable = false
	v6.Name = "BackgroundFrame"
	v6.Size = UDim2.new(1, -2, 1, -2)
	v6.Position = UDim2.new(0, 1, 0, 1)
	v6.BackgroundTransparency = 1
	v6.Parent = v5
	local v7 = Instance.new("Frame")
	v7.Selectable = false
	v7.Name = "UnselectedFrame"
	v7.Size = UDim2.new(1, 0, 1, 0)
	v7.Position = UDim2.new(0, 0, 0, 0)
	v7.BorderSizePixel = 0
	v7.BackgroundColor3 = v_u_2.ChannelsTabUnselectedColor
	v7.BackgroundTransparency = 0.6
	v7.Parent = v6
	local v8 = Instance.new("Frame")
	v8.Selectable = false
	v8.Name = "SelectedFrame"
	v8.Size = UDim2.new(1, 0, 1, 0)
	v8.Position = UDim2.new(0, 0, 0, 0)
	v8.BorderSizePixel = 0
	v8.BackgroundColor3 = v_u_2.ChannelsTabSelectedColor
	v8.BackgroundTransparency = 1
	v8.Parent = v6
	local v9 = Instance.new("ImageLabel")
	v9.Selectable = false
	v9.Name = "BackgroundImage"
	v9.BackgroundTransparency = 1
	v9.BorderSizePixel = 0
	v9.Size = UDim2.new(1, 0, 1, 0)
	v9.Position = UDim2.new(0, 0, 0, 0)
	v9.ScaleType = Enum.ScaleType.Slice
	v9.Parent = v8
	v9.BackgroundTransparency = -0.4
	v9.BackgroundColor3 = Color3.fromRGB(93.6, 100.8, 115.19999999999999)
	local v10 = Instance.new("ImageLabel")
	v10.Selectable = false
	v10.Size = UDim2.new(0.5, -2, 0, 4)
	v10.BackgroundTransparency = 1
	v10.ScaleType = Enum.ScaleType.Slice
	v10.SliceCenter = Rect.new(3, 3, 32, 21)
	v10.Parent = v8
	local v11 = v10:Clone()
	v11.Parent = v8
	v10.Position = UDim2.new(0, 2, 1, -4)
	v11.Position = UDim2.new(0.5, 0, 1, -4)
	v10.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarLeft.png"
	v11.Image = "rbxasset://textures/ui/Settings/Slider/SelectedBarRight.png"
	v10.Name = "BlueBarLeft"
	v11.Name = "BlueBarRight"
	local v12 = Instance.new("TextButton")
	v12.Selectable = v_u_2.GamepadNavigationEnabled
	v12.Size = UDim2.new(1, 0, 1, 0)
	v12.Position = UDim2.new(0, 0, 0, 0)
	v12.BackgroundTransparency = 1
	v12.Font = v_u_2.DefaultFont
	v12.TextSize = v_u_2.ChatChannelsTabTextSize
	v12.TextColor3 = Color3.new(1, 1, 1)
	v12.TextStrokeTransparency = 0.75
	v12.Parent = v6
	local v13 = v12:Clone()
	local v14 = v12:Clone()
	v13.Parent = v7
	v14.Parent = v8
	v13.Font = Enum.Font.SourceSans
	v13.Active = false
	v14.Active = false
	local v15 = Instance.new("Frame")
	v15.Selectable = false
	v15.Size = UDim2.new(0, 18, 0, 18)
	v15.Position = UDim2.new(0.8, -9, 0.5, -9)
	v15.BackgroundTransparency = 1
	v15.Parent = v6
	local v16 = Instance.new("ImageLabel")
	v16.Selectable = false
	v16.Size = UDim2.new(1, 0, 1, 0)
	v16.BackgroundTransparency = 1
	v16.Image = "rbxasset://textures/ui/Chat/MessageCounter.png"
	v16.Visible = false
	v16.Parent = v15
	local v17 = Instance.new("TextLabel")
	v17.Selectable = false
	v17.BackgroundTransparency = 1
	v17.Size = UDim2.new(0, 13, 0, 9)
	v17.Position = UDim2.new(0.5, -7, 0.5, -7)
	v17.Font = v_u_2.DefaultFont
	v17.TextSize = 14
	v17.TextColor3 = Color3.new(1, 1, 1)
	v17.Text = ""
	v17.Parent = v16
	return v5, v12, v13, v14, v16, v7, v8
end
function v_u_4.Destroy(p19)
	p19.GuiObject:Destroy()
end
function v_u_4.UpdateMessagePostedInChannel(p20, p21)
	if not p20.Active or p21 == true then
		local v22 = p20.UnreadMessageCount + 1
		p20.UnreadMessageCount = v22
		local v23 = p20.NewMessageIcon
		v23.Visible = true
		v23.TextLabel.Text = v22 < 100 and tostring(v22) or "!"
		local _ = v23.Position + UDim2.new(0, 0, -0.1, 0)
		v23.Position = UDim2.new(0, 0, -0.15, 0)
		v23:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
	end
end
function v_u_4.SetActive(p24, p25)
	p24.Active = p25
	p24.UnselectedFrame.Visible = not p25
	p24.SelectedFrame.Visible = p25
	if p25 then
		p24.UnreadMessageCount = 0
		p24.NewMessageIcon.Visible = false
		p24.NameTag.Font = Enum.Font.SourceSansBold
	else
		p24.NameTag.Font = Enum.Font.SourceSans
	end
end
function v_u_4.SetTextSize(p26, p27)
	p26.NameTag.TextSize = p27
end
function v_u_4.FadeOutBackground(p28, p29)
	-- upvalues: (copy) v_u_3
	p28.AnimParams.Background_TargetTransparency = 1
	p28.AnimParams.Background_NormalizedExptValue = v_u_3:NormalizedDefaultExptValueInSeconds(p29)
end
function v_u_4.FadeInBackground(p30, p31)
	-- upvalues: (copy) v_u_3
	p30.AnimParams.Background_TargetTransparency = 0.6
	p30.AnimParams.Background_NormalizedExptValue = v_u_3:NormalizedDefaultExptValueInSeconds(p31)
end
function v_u_4.FadeOutText(p32, p33)
	-- upvalues: (copy) v_u_3
	p32.AnimParams.Text_TargetTransparency = 1
	p32.AnimParams.Text_NormalizedExptValue = v_u_3:NormalizedDefaultExptValueInSeconds(p33)
	p32.AnimParams.TextStroke_TargetTransparency = 1
	p32.AnimParams.TextStroke_NormalizedExptValue = v_u_3:NormalizedDefaultExptValueInSeconds(p33)
end
function v_u_4.FadeInText(p34, p35)
	-- upvalues: (copy) v_u_3
	p34.AnimParams.Text_TargetTransparency = 0
	p34.AnimParams.Text_NormalizedExptValue = v_u_3:NormalizedDefaultExptValueInSeconds(p35)
	p34.AnimParams.TextStroke_TargetTransparency = 0.75
	p34.AnimParams.TextStroke_NormalizedExptValue = v_u_3:NormalizedDefaultExptValueInSeconds(p35)
end
function v_u_4.AnimGuiObjects(p36)
	p36.UnselectedFrame.BackgroundTransparency = p36.AnimParams.Background_CurrentTransparency
	p36.SelectedFrame.BackgroundImage.BackgroundTransparency = p36.AnimParams.Background_CurrentTransparency
	p36.SelectedFrame.BlueBarLeft.ImageTransparency = p36.AnimParams.Background_CurrentTransparency
	p36.SelectedFrame.BlueBarRight.ImageTransparency = p36.AnimParams.Background_CurrentTransparency
	p36.NameTagNonSelect.TextTransparency = p36.AnimParams.Background_CurrentTransparency
	p36.NameTagNonSelect.TextStrokeTransparency = p36.AnimParams.Background_CurrentTransparency
	p36.NameTag.TextTransparency = p36.AnimParams.Text_CurrentTransparency
	p36.NewMessageIcon.ImageTransparency = p36.AnimParams.Text_CurrentTransparency
	p36.WhiteTextNewMessageNotification.TextTransparency = p36.AnimParams.Text_CurrentTransparency
	p36.NameTagSelect.TextTransparency = p36.AnimParams.Text_CurrentTransparency
	p36.NameTag.TextStrokeTransparency = p36.AnimParams.TextStroke_CurrentTransparency
	p36.WhiteTextNewMessageNotification.TextStrokeTransparency = p36.AnimParams.TextStroke_CurrentTransparency
	p36.NameTagSelect.TextStrokeTransparency = p36.AnimParams.TextStroke_CurrentTransparency
end
function v_u_4.InitializeAnimParams(p37)
	-- upvalues: (copy) v_u_3
	p37.AnimParams.Text_TargetTransparency = 0
	p37.AnimParams.Text_CurrentTransparency = 0
	p37.AnimParams.Text_NormalizedExptValue = v_u_3:NormalizedDefaultExptValueInSeconds(0)
	p37.AnimParams.TextStroke_TargetTransparency = 0.75
	p37.AnimParams.TextStroke_CurrentTransparency = 0.75
	p37.AnimParams.TextStroke_NormalizedExptValue = v_u_3:NormalizedDefaultExptValueInSeconds(0)
	p37.AnimParams.Background_TargetTransparency = 0.6
	p37.AnimParams.Background_CurrentTransparency = 0.6
	p37.AnimParams.Background_NormalizedExptValue = v_u_3:NormalizedDefaultExptValueInSeconds(0)
end
function v_u_4.Update(p38, p39)
	-- upvalues: (copy) v_u_3
	p38.AnimParams.Background_CurrentTransparency = v_u_3:Expt(p38.AnimParams.Background_CurrentTransparency, p38.AnimParams.Background_TargetTransparency, p38.AnimParams.Background_NormalizedExptValue, p39)
	p38.AnimParams.Text_CurrentTransparency = v_u_3:Expt(p38.AnimParams.Text_CurrentTransparency, p38.AnimParams.Text_TargetTransparency, p38.AnimParams.Text_NormalizedExptValue, p39)
	p38.AnimParams.TextStroke_CurrentTransparency = v_u_3:Expt(p38.AnimParams.TextStroke_CurrentTransparency, p38.AnimParams.TextStroke_TargetTransparency, p38.AnimParams.TextStroke_NormalizedExptValue, p39)
	p38:AnimGuiObjects()
end
function v1.new(p40)
	-- upvalues: (copy) v_u_4, (copy) v_u_18, (copy) v_u_2
	local v41 = setmetatable({}, v_u_4)
	local v42, v43, v44, v45, v46, v47, v48 = v_u_18()
	v41.GuiObject = v42
	v41.NameTag = v43
	v41.NameTagNonSelect = v44
	v41.NameTagSelect = v45
	v41.NewMessageIcon = v46
	v41.UnselectedFrame = v47
	v41.SelectedFrame = v48
	v41.BlueBarLeft = v48.BlueBarLeft
	v41.BlueBarRight = v48.BlueBarRight
	v41.BackgroundImage = v48.BackgroundImage
	v41.WhiteTextNewMessageNotification = v41.NewMessageIcon.TextLabel
	v41.ChannelName = p40
	v41.UnreadMessageCount = 0
	v41.Active = false
	v41.GuiObject.Name = "Frame_" .. v41.ChannelName
	if string.len(p40) > v_u_2.MaxChannelNameLength then
		p40 = string.sub(p40, 1, v_u_2.MaxChannelNameLength - 3) .. "..."
	end
	v41.NameTag.Text = ""
	v41.NameTagNonSelect.Text = p40
	v41.NameTagSelect.Text = p40
	v41.AnimParams = {}
	v41:InitializeAnimParams()
	v41:AnimGuiObjects()
	v41:SetActive(false)
	return v41
end
return v1
