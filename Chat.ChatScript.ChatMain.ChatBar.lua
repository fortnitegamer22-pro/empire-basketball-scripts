-- decompiled by Sentinel (took 6.051095ms)
local v1 = {}
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("RunService")
local v4 = game:GetService("Players")
local v_u_5 = game:GetService("TextService")
local v_u_6 = v4.LocalPlayer
while not v_u_6 do
	v4.PlayerAdded:wait()
	v_u_6 = v4.LocalPlayer
end
local v_u_7 = game:GetService("Chat")
local v8 = v_u_7:WaitForChild("ClientChatModules")
local v9 = script.Parent
local v_u_10 = require(v8:WaitForChild("ChatSettings"))
local v_u_11 = require(v9:WaitForChild("CurveUtil"))
local v_u_12 = require(v8:WaitForChild("CommandModules"):WaitForChild("Whisper"))
require(v9:WaitForChild("MessageSender"))
local v_u_13 = nil
pcall(function()
	-- upvalues: (ref) v_u_13
	v_u_13 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
v_u_13 = v_u_13 == nil and {
	["Get"] = function(_, _, p14)
		return p14
	end
} or v_u_13
local v_u_15 = {}
v_u_15.__index = v_u_15
function v_u_15.CreateGuiObjects(p16, p17)
	-- upvalues: (copy) v_u_10
	p16.ChatBarParentFrame = p17
	local v18 = Instance.new("Frame")
	v18.Selectable = false
	v18.Size = UDim2.new(1, 0, 1, 0)
	v18.BackgroundTransparency = 0.6
	v18.BorderSizePixel = 0
	v18.BackgroundColor3 = v_u_10.ChatBarBackGroundColor
	v18.Parent = p17
	local v19 = Instance.new("Frame")
	v19.Selectable = false
	v19.Name = "BoxFrame"
	v19.BackgroundTransparency = 0.6
	v19.BorderSizePixel = 0
	v19.BackgroundColor3 = v_u_10.ChatBarBoxColor
	v19.Size = UDim2.new(1, -14, 1, -14)
	v19.Position = UDim2.new(0, 7, 0, 7)
	v19.Parent = v18
	local v20 = Instance.new("Frame")
	v20.BackgroundTransparency = 1
	v20.Size = UDim2.new(1, -10, 1, -10)
	v20.Position = UDim2.new(0, 5, 0, 5)
	v20.Parent = v19
	local v21 = Instance.new("TextBox")
	v21.Selectable = v_u_10.GamepadNavigationEnabled
	v21.Name = "ChatBar"
	v21.BackgroundTransparency = 1
	v21.Size = UDim2.new(1, 0, 1, 0)
	v21.Position = UDim2.new(0, 0, 0, 0)
	v21.TextSize = v_u_10.ChatBarTextSize
	v21.Font = v_u_10.ChatBarFont
	v21.TextColor3 = v_u_10.ChatBarTextColor
	v21.TextTransparency = 0.4
	v21.TextStrokeTransparency = 1
	v21.ClearTextOnFocus = false
	v21.TextXAlignment = Enum.TextXAlignment.Left
	v21.TextYAlignment = Enum.TextYAlignment.Top
	v21.TextWrapped = true
	v21.Text = ""
	v21.Parent = v20
	local v22 = Instance.new("TextButton")
	v22.Selectable = false
	v22.Name = "MessageMode"
	v22.BackgroundTransparency = 1
	v22.Position = UDim2.new(0, 0, 0, 0)
	v22.TextSize = v_u_10.ChatBarTextSize
	v22.Font = v_u_10.ChatBarFont
	v22.TextXAlignment = Enum.TextXAlignment.Left
	v22.TextWrapped = true
	v22.Text = ""
	v22.Size = UDim2.new(0, 0, 0, 0)
	v22.TextYAlignment = Enum.TextYAlignment.Center
	v22.TextColor3 = p16:GetDefaultChannelNameColor()
	v22.Visible = true
	v22.Parent = v20
	local v23 = Instance.new("TextLabel")
	v23.Selectable = false
	v23.TextWrapped = true
	v23.BackgroundTransparency = 1
	v23.Size = v21.Size
	v23.Position = v21.Position
	v23.TextSize = v21.TextSize
	v23.Font = v21.Font
	v23.TextColor3 = v21.TextColor3
	v23.TextTransparency = v21.TextTransparency
	v23.TextStrokeTransparency = v21.TextStrokeTransparency
	v23.TextXAlignment = v21.TextXAlignment
	v23.TextYAlignment = v21.TextYAlignment
	v23.Text = "..."
	v23.Parent = v20
	p16.GuiObject = v18
	p16.TextBox = v21
	p16.TextLabel = v23
	p16.GuiObjects.BaseFrame = v18
	p16.GuiObjects.TextBoxFrame = v19
	p16.GuiObjects.TextBox = v21
	p16.GuiObjects.TextLabel = v23
	p16.GuiObjects.MessageModeTextButton = v22
	p16:AnimGuiObjects()
	p16:SetUpTextBoxEvents(v21, v23, v22)
	if p16.UserHasChatOff then
		p16:DoLockChatBar()
	end
	p16.eGuiObjectsChanged:Fire()
end
function v_u_15.DoLockChatBar(p_u_24)
	-- upvalues: (ref) v_u_6, (ref) v_u_13
	if p_u_24.TextLabel then
		if 0 < v_u_6.UserId then
			p_u_24.TextLabel.Text = v_u_13:Get("GameChat_ChatMessageValidator_SettingsError", "To chat in game, turn on chat in your Privacy Settings.")
		else
			p_u_24.TextLabel.Text = v_u_13:Get("GameChat_SwallowGuestChat_Message", "Sign up to chat in game.")
		end
		p_u_24:CalculateSize()
	end
	if p_u_24.TextBox then
		p_u_24.TextBox.Active = false
		p_u_24.TextBox.Focused:connect(function()
			-- upvalues: (copy) p_u_24
			p_u_24.TextBox:ReleaseFocus()
		end)
	end
end
function v_u_15.SetUpTextBoxEvents(p_u_25, p_u_26, p_u_27, p_u_28)
	-- upvalues: (copy) v_u_2, (copy) v_u_10
	for v29, v30 in pairs(p_u_25.TextBoxConnections) do
		v30:disconnect()
		p_u_25.TextBoxConnections[v29] = nil
	end
	p_u_25.TextBoxConnections.UserInputBegan = v_u_2.InputBegan:connect(function(p31, _)
		-- upvalues: (copy) p_u_25, (copy) p_u_26, (ref) v_u_10
		if p31.KeyCode == Enum.KeyCode.Backspace and p_u_25:IsFocused() and p_u_26.Text == "" then
			p_u_25:SetChannelTarget(v_u_10.GeneralChannelName)
		end
	end)
	p_u_25.TextBoxConnections.TextBoxChanged = p_u_26.Changed:connect(function(p32)
		-- upvalues: (copy) p_u_25, (copy) p_u_26, (ref) v_u_10
		if p32 == "AbsoluteSize" then
			p_u_25:CalculateSize()
			return
		elseif p32 == "Text" then
			p_u_25:CalculateSize()
			if utf8.len(utf8.nfcnormalize(p_u_26.Text)) > v_u_10.MaximumMessageLength then
				p_u_26.Text = p_u_25.PreviousText
			else
				p_u_25.PreviousText = p_u_26.Text
			end
			if p_u_25.InCustomState then
				p_u_25.CustomState:TextUpdated()
			else
				local v33 = p_u_25.CommandProcessor:ProcessInProgressChatMessage(p_u_26.Text, p_u_25.ChatWindow, p_u_25)
				if v33 then
					p_u_25.InCustomState = true
					p_u_25.CustomState = v33
					return
				end
			end
		end
	end)
	p_u_25.TextBoxConnections.MessageModeClick = p_u_28.MouseButton1Click:connect(function()
		-- upvalues: (copy) p_u_28, (copy) p_u_25, (ref) v_u_10
		if p_u_28.Text ~= "" then
			p_u_25:SetChannelTarget(v_u_10.GeneralChannelName)
		end
	end)
	p_u_25.TextBoxConnections.TextBoxFocused = p_u_26.Focused:connect(function()
		-- upvalues: (copy) p_u_25, (copy) p_u_27
		if not p_u_25.UserHasChatOff then
			p_u_25:CalculateSize()
			p_u_27.Visible = false
		end
	end)
	p_u_25.TextBoxConnections.TextBoxFocusLost = p_u_26.FocusLost:connect(function(_, p34)
		-- upvalues: (copy) p_u_25, (copy) p_u_26, (copy) p_u_27
		p_u_25:CalculateSize()
		if p34 and p34.KeyCode == Enum.KeyCode.Escape then
			p_u_26.Text = ""
		end
		if p_u_26.Text == "" then
			p_u_27.Visible = true
		else
			p_u_27.Visible = false
		end
	end)
end
function v_u_15.GetTextBox(p35)
	return p35.TextBox
end
function v_u_15.GetMessageModeTextButton(p36)
	return p36.GuiObjects.MessageModeTextButton
end
function v_u_15.GetMessageModeTextLabel(p37)
	return p37:GetMessageModeTextButton()
end
function v_u_15.IsFocused(p38)
	if p38.UserHasChatOff then
		return false
	else
		return p38:GetTextBox():IsFocused()
	end
end
function v_u_15.GetVisible(p39)
	return p39.GuiObject.Visible
end
function v_u_15.CaptureFocus(p40)
	if not p40.UserHasChatOff then
		p40:GetTextBox():CaptureFocus()
	end
end
function v_u_15.ReleaseFocus(p41, p42)
	p41:GetTextBox():ReleaseFocus(p42)
end
function v_u_15.ResetText(p43)
	p43:GetTextBox().Text = ""
end
function v_u_15.SetText(p44, p45)
	p44:GetTextBox().Text = p45
end
function v_u_15.GetEnabled(p46)
	return p46.GuiObject.Visible
end
function v_u_15.SetEnabled(p47, p48)
	if p47.UserHasChatOff then
		p47.GuiObject.Visible = true
	else
		p47.GuiObject.Visible = p48
	end
end
function v_u_15.SetTextLabelText(p49, p50)
	if not p49.UserHasChatOff then
		p49.TextLabel.Text = p50
	end
end
function v_u_15.SetTextBoxText(p51, p52)
	p51.TextBox.Text = p52
end
function v_u_15.GetTextBoxText(p53)
	return p53.TextBox.Text
end
function v_u_15.ResetSize(p54)
	p54.TargetYSize = 0
	p54:TweenToTargetYSize()
end
function v_u_15.CalculateSize(p55)
	-- upvalues: (copy) v_u_5
	if not p55.CalculatingSizeLock then
		p55.CalculatingSizeLock = true
		local v56, v57
		if p55:IsFocused() or p55.TextBox.Text ~= "" then
			v56 = p55.TextBox.TextSize
			local v58 = p55.TextBox
			v57 = v_u_5:GetTextSize(v58.Text, v58.TextSize, v58.Font, Vector2.new(v58.AbsoluteSize.X, 10000)).Y
		else
			v56 = p55.TextLabel.TextSize
			local v59 = p55.TextLabel
			v57 = v_u_5:GetTextSize(v59.Text, v59.TextSize, v59.Font, Vector2.new(v59.AbsoluteSize.X, 10000)).Y
		end
		local v60 = v57 - v56
		if p55.TargetYSize ~= v60 then
			p55.TargetYSize = v60
			p55:TweenToTargetYSize()
		end
		p55.CalculatingSizeLock = false
	end
end
function v_u_15.TweenToTargetYSize(p_u_61)
	local v_u_62 = UDim2.new(1, 0, 1, p_u_61.TargetYSize)
	p_u_61.GuiObject.Size = v_u_62
	p_u_61.GuiObject.Size = p_u_61.GuiObject.Size
	local v_u_63 = math.min(1, math.abs(p_u_61.GuiObject.AbsoluteSize.Y - p_u_61.GuiObject.AbsoluteSize.Y) * 1 / p_u_61.TweenPixelsPerSecond)
	if not pcall(function()
		-- upvalues: (copy) p_u_61, (copy) v_u_62, (copy) v_u_63
		p_u_61.GuiObject:TweenSize(v_u_62, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, v_u_63, true)
	end) then
		p_u_61.GuiObject.Size = v_u_62
	end
end
function v_u_15.SetTextSize(p64, p65)
	if not p64:IsInCustomState() then
		if p64.TextBox then
			p64.TextBox.TextSize = p65
		end
		if p64.TextLabel then
			p64.TextLabel.TextSize = p65
		end
	end
end
function v_u_15.GetDefaultChannelNameColor(_)
	-- upvalues: (copy) v_u_10
	if v_u_10.DefaultChannelNameColor then
		return v_u_10.DefaultChannelNameColor
	else
		return Color3.fromRGB(35, 76, 142)
	end
end
function v_u_15.SetChannelTarget(p66, p67)
	-- upvalues: (copy) v_u_10, (ref) v_u_13
	local v68 = p66.GuiObjects.MessageModeTextButton
	local v69 = p66.TextBox
	local v70 = p66.TextLabel
	p66.TargetChannel = p67
	if not p66:IsInCustomState() then
		if p67 ~= v_u_10.GeneralChannelName then
			v68.Size = UDim2.new(0, 1000, 1, 0)
			local v71
			if v_u_13.tryLocalize then
				v71 = v_u_13:tryLocalize(p67)
			else
				v71 = p67
			end
			v68.Text = string.format("[%s] ", v71)
			local v72 = p66:GetChannelNameColor(p67)
			if v72 then
				v68.TextColor3 = v72
			else
				v68.TextColor3 = p66:GetDefaultChannelNameColor()
			end
			local v73 = v68.TextBounds.X
			v68.Size = UDim2.new(0, v73, 1, 0)
			v69.Size = UDim2.new(1, -v73, 1, 0)
			v69.Position = UDim2.new(0, v73, 0, 0)
			v70.Size = UDim2.new(1, -v73, 1, 0)
			v70.Position = UDim2.new(0, v73, 0, 0)
			return
		end
		v68.Text = ""
		v68.Size = UDim2.new(0, 0, 0, 0)
		v69.Size = UDim2.new(1, 0, 1, 0)
		v69.Position = UDim2.new(0, 0, 0, 0)
		v70.Size = UDim2.new(1, 0, 1, 0)
		v70.Position = UDim2.new(0, 0, 0, 0)
	end
end
function v_u_15.IsInCustomState(p74)
	return p74.InCustomState
end
function v_u_15.ResetCustomState(p75)
	-- upvalues: (ref) v_u_13
	if p75.InCustomState then
		p75.CustomState:Destroy()
		p75.CustomState = nil
		p75.InCustomState = false
		p75.ChatBarParentFrame:ClearAllChildren()
		p75:CreateGuiObjects(p75.ChatBarParentFrame)
		p75:SetTextLabelText(v_u_13:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"))
	end
end
function v_u_15.EnterWhisperState(p76, p77)
	-- upvalues: (copy) v_u_12, (copy) v_u_10
	p76:ResetCustomState()
	if v_u_12.CustomStateCreator then
		p76.CustomState = v_u_12.CustomStateCreator(p77, p76.ChatWindow, p76, v_u_10)
		p76.InCustomState = true
	else
		local v78
		if v_u_10.PlayerDisplayNamesEnabled then
			v78 = p77.DisplayName
		else
			v78 = p77.Name
		end
		p76:SetText("/w " .. v78)
	end
	p76:CaptureFocus()
end
function v_u_15.GetCustomMessage(p79)
	if p79.InCustomState then
		return p79.CustomState:GetMessage()
	else
		return nil
	end
end
function v_u_15.CustomStateProcessCompletedMessage(p80, _)
	if p80.InCustomState then
		return p80.CustomState:ProcessCompletedMessage()
	else
		return false
	end
end
function v_u_15.FadeOutBackground(p81, p82)
	-- upvalues: (copy) v_u_11
	p81.AnimParams.Background_TargetTransparency = 1
	p81.AnimParams.Background_NormalizedExptValue = v_u_11:NormalizedDefaultExptValueInSeconds(p82)
	p81:FadeOutText(p82)
end
function v_u_15.FadeInBackground(p83, p84)
	-- upvalues: (copy) v_u_11
	p83.AnimParams.Background_TargetTransparency = 0.6
	p83.AnimParams.Background_NormalizedExptValue = v_u_11:NormalizedDefaultExptValueInSeconds(p84)
	p83:FadeInText(p84)
end
function v_u_15.FadeOutText(p85, p86)
	-- upvalues: (copy) v_u_11
	p85.AnimParams.Text_TargetTransparency = 1
	p85.AnimParams.Text_NormalizedExptValue = v_u_11:NormalizedDefaultExptValueInSeconds(p86)
end
function v_u_15.FadeInText(p87, p88)
	-- upvalues: (copy) v_u_11
	p87.AnimParams.Text_TargetTransparency = 0.4
	p87.AnimParams.Text_NormalizedExptValue = v_u_11:NormalizedDefaultExptValueInSeconds(p88)
end
function v_u_15.AnimGuiObjects(p89)
	p89.GuiObject.BackgroundTransparency = p89.AnimParams.Background_CurrentTransparency
	p89.GuiObjects.TextBoxFrame.BackgroundTransparency = p89.AnimParams.Background_CurrentTransparency
	p89.GuiObjects.TextLabel.TextTransparency = p89.AnimParams.Text_CurrentTransparency
	p89.GuiObjects.TextBox.TextTransparency = p89.AnimParams.Text_CurrentTransparency
	p89.GuiObjects.MessageModeTextButton.TextTransparency = p89.AnimParams.Text_CurrentTransparency
end
function v_u_15.InitializeAnimParams(p90)
	p90.AnimParams.Text_TargetTransparency = 0.4
	p90.AnimParams.Text_CurrentTransparency = 0.4
	p90.AnimParams.Text_NormalizedExptValue = 1
	p90.AnimParams.Background_TargetTransparency = 0.6
	p90.AnimParams.Background_CurrentTransparency = 0.6
	p90.AnimParams.Background_NormalizedExptValue = 1
end
function v_u_15.Update(p91, p92)
	-- upvalues: (copy) v_u_11
	p91.AnimParams.Text_CurrentTransparency = v_u_11:Expt(p91.AnimParams.Text_CurrentTransparency, p91.AnimParams.Text_TargetTransparency, p91.AnimParams.Text_NormalizedExptValue, p92)
	p91.AnimParams.Background_CurrentTransparency = v_u_11:Expt(p91.AnimParams.Background_CurrentTransparency, p91.AnimParams.Background_TargetTransparency, p91.AnimParams.Background_NormalizedExptValue, p92)
	p91:AnimGuiObjects()
end
function v_u_15.SetChannelNameColor(p93, p94, p95)
	p93.ChannelNameColors[p94] = p95
	if p93.GuiObjects.MessageModeTextButton.Text == p94 then
		p93.GuiObjects.MessageModeTextButton.TextColor3 = p95
	end
end
function v_u_15.GetChannelNameColor(p96, p97)
	return p96.ChannelNameColors[p97]
end
function v1.new(p98, p99)
	-- upvalues: (copy) v_u_15, (copy) v_u_10, (copy) v_u_7, (ref) v_u_6, (copy) v_u_3
	local v_u_100 = setmetatable({}, v_u_15)
	v_u_100.GuiObject = nil
	v_u_100.ChatBarParentFrame = nil
	v_u_100.TextBox = nil
	v_u_100.TextLabel = nil
	v_u_100.GuiObjects = {}
	v_u_100.eGuiObjectsChanged = Instance.new("BindableEvent")
	v_u_100.GuiObjectsChanged = v_u_100.eGuiObjectsChanged.Event
	v_u_100.TextBoxConnections = {}
	v_u_100.PreviousText = ""
	v_u_100.InCustomState = false
	v_u_100.CustomState = nil
	v_u_100.TargetChannel = nil
	v_u_100.CommandProcessor = p98
	v_u_100.ChatWindow = p99
	v_u_100.TweenPixelsPerSecond = 500
	v_u_100.TargetYSize = 0
	v_u_100.AnimParams = {}
	v_u_100.CalculatingSizeLock = false
	v_u_100.ChannelNameColors = {}
	v_u_100.UserHasChatOff = false
	v_u_100:InitializeAnimParams()
	v_u_10.SettingsChanged:connect(function(p101, p102)
		-- upvalues: (copy) v_u_100
		if p101 == "ChatBarTextSize" then
			v_u_100:SetTextSize(p102)
		end
	end)
	coroutine.wrap(function()
		-- upvalues: (ref) v_u_7, (ref) v_u_6, (ref) v_u_3, (copy) v_u_100
		local v103, v104 = pcall(function()
			-- upvalues: (ref) v_u_7, (ref) v_u_6
			return v_u_7:CanUserChatAsync(v_u_6.UserId)
		end)
		if v103 then
			v103 = v_u_3:IsStudio() or v104
		end
		if v103 == false then
			v_u_100.UserHasChatOff = true
			v_u_100:DoLockChatBar()
		end
	end)()
	return v_u_100
end
return v1
