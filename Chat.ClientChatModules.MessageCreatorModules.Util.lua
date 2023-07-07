-- decompiled by Sentinel (took 3.864593ms)
local v_u_1 = game:GetService("TextService")
local v_u_2 = game:GetService("Players")
local v_u_3 = v_u_2.LocalPlayer
while not v_u_3 do
	v_u_2.ChildAdded:wait()
	v_u_3 = v_u_2.LocalPlayer
end
local v4 = script.Parent.Parent
local v_u_5 = require(v4:WaitForChild("ChatSettings"))
local v_u_6 = require(v4:WaitForChild("ChatConstants"))
local v7 = {}
local v_u_8 = {}
v_u_8.__index = v_u_8
function v_u_8.GetStringTextBounds(_, p9, p10, p11, p12)
	-- upvalues: (copy) v_u_1
	return v_u_1:GetTextSize(p9, p11, p10, p12 or Vector2.new(10000, 10000))
end
function v_u_8.GetMessageHeight(p13, p14, p15, p16)
	local v17 = p13:GetStringTextBounds(p14.Text, p14.Font, p14.TextSize, Vector2.new(p16 or p15.AbsoluteSize.X, 1000))
	if v17.Y == math.floor(v17.Y) then
		return v17.Y
	else
		return v17.Y + 1
	end
end
function v_u_8.GetNumberOfSpaces(p18, p19, p20, p21)
	return math.ceil(p18:GetStringTextBounds(p19, p20, p21).X / p18:GetStringTextBounds(" ", p20, p21).X)
end
function v_u_8.CreateBaseMessage(p22, p23, p24, p25, p26)
	local v27 = p22:GetFromObjectPool("Frame")
	v27.Selectable = false
	v27.Size = UDim2.new(1, 0, 0, 18)
	v27.Visible = true
	v27.BackgroundTransparency = 1
	local v28 = p22:GetFromObjectPool("TextLabel")
	v28.Selectable = false
	v28.Size = UDim2.new(1, -14, 1, 0)
	v28.Position = UDim2.new(0, 8, 0, 0)
	v28.BackgroundTransparency = 1
	v28.Font = p24
	v28.TextSize = p25
	v28.TextXAlignment = Enum.TextXAlignment.Left
	v28.TextYAlignment = Enum.TextYAlignment.Top
	v28.TextTransparency = 0
	v28.TextStrokeTransparency = 0.75
	v28.TextColor3 = p26
	v28.TextWrapped = true
	v28.ClipsDescendants = true
	v28.Text = p23
	v28.Visible = true
	v28.Parent = v27
	return v27, v28
end
function v_u_8.AddNameButtonToBaseMessage(p_u_29, p30, p31, p32, p_u_33)
	local v34 = p_u_29:GetStringTextBounds(p32, p30.Font, p30.TextSize)
	local v_u_35 = p_u_29:GetFromObjectPool("TextButton")
	v_u_35.Selectable = false
	v_u_35.Size = UDim2.new(0, v34.X, 0, v34.Y)
	v_u_35.Position = UDim2.new(0, 0, 0, 0)
	v_u_35.BackgroundTransparency = 1
	v_u_35.Font = p30.Font
	v_u_35.TextSize = p30.TextSize
	v_u_35.TextXAlignment = p30.TextXAlignment
	v_u_35.TextYAlignment = p30.TextYAlignment
	v_u_35.TextTransparency = p30.TextTransparency
	v_u_35.TextStrokeTransparency = p30.TextStrokeTransparency
	v_u_35.TextColor3 = p31
	v_u_35.Text = p32
	v_u_35.Visible = true
	v_u_35.Parent = p30
	local v_u_36 = v_u_35.MouseButton1Click:connect(function()
		-- upvalues: (copy) p_u_29, (copy) v_u_35, (copy) p_u_33
		p_u_29:NameButtonClicked(v_u_35, p_u_33)
	end)
	local v_u_37 = nil
	v_u_37 = v_u_35.Changed:connect(function(p38)
		-- upvalues: (copy) v_u_36, (ref) v_u_37
		if p38 == "Parent" then
			v_u_36:Disconnect()
			v_u_37:Disconnect()
		end
	end)
	return v_u_35
end
function v_u_8.AddTranslationButtonToBaseMessage(p39, p40)
	local v41 = math.floor(p40.TextSize * 0.9)
	local v42 = Vector2.new(v41, v41)
	local v43 = p39:GetFromObjectPool("ImageButton")
	v43.Selectable = false
	v43.Size = UDim2.new(0, v42.X, 0, v42.Y)
	v43.Position = UDim2.new(0, 0, 0, 0)
	v43.BackgroundTransparency = 1
	v43.Visible = false
	v43.Parent = p40
	v43.Image = "rbxasset://textures/translateIcon.png"
	v43.HoverImage = "rbxasset://textures/translateIconDark.png"
	v43.PressedImage = "rbxasset://textures/translateIconDark.png"
	return v43
end
function v_u_8.AddChannelButtonToBaseMessage(p_u_44, p45, p46, p47, p_u_48)
	local v49 = p_u_44:GetStringTextBounds(p47, p45.Font, p45.TextSize)
	local v_u_50 = p_u_44:GetFromObjectPool("TextButton")
	v_u_50.Selectable = false
	v_u_50.Size = UDim2.new(0, v49.X, 0, v49.Y)
	v_u_50.Position = UDim2.new(0, 0, 0, 0)
	v_u_50.BackgroundTransparency = 1
	v_u_50.Font = p45.Font
	v_u_50.TextSize = p45.TextSize
	v_u_50.TextXAlignment = p45.TextXAlignment
	v_u_50.TextYAlignment = p45.TextYAlignment
	v_u_50.TextTransparency = p45.TextTransparency
	v_u_50.TextStrokeTransparency = p45.TextStrokeTransparency
	v_u_50.TextColor3 = p46
	v_u_50.Text = p47
	v_u_50.Visible = true
	v_u_50.Parent = p45
	local v_u_51 = v_u_50.MouseButton1Click:connect(function()
		-- upvalues: (copy) p_u_44, (copy) v_u_50, (copy) p_u_48
		p_u_44:ChannelButtonClicked(v_u_50, p_u_48)
	end)
	local v_u_52 = nil
	v_u_52 = v_u_50.Changed:connect(function(p53)
		-- upvalues: (copy) v_u_51, (ref) v_u_52
		if p53 == "Parent" then
			v_u_51:Disconnect()
			v_u_52:Disconnect()
		end
	end)
	return v_u_50
end
function v_u_8.AddTagLabelToBaseMessage(p54, p55, p56, p57)
	local v58 = p54:GetStringTextBounds(p57, p55.Font, p55.TextSize)
	local v59 = p54:GetFromObjectPool("TextLabel")
	v59.Selectable = false
	v59.Size = UDim2.new(0, v58.X, 0, v58.Y)
	v59.Position = UDim2.new(0, 0, 0, 0)
	v59.BackgroundTransparency = 1
	v59.Font = p55.Font
	v59.TextSize = p55.TextSize
	v59.TextXAlignment = p55.TextXAlignment
	v59.TextYAlignment = p55.TextYAlignment
	v59.TextTransparency = p55.TextTransparency
	v59.TextStrokeTransparency = p55.TextStrokeTransparency
	v59.TextColor3 = p56
	v59.Text = p57
	v59.Visible = true
	v59.Parent = p55
	return v59
end
function GetWhisperChannelPrefix()
	-- upvalues: (copy) v_u_6
	return not v_u_6.WhisperChannelPrefix and "To " or v_u_6.WhisperChannelPrefix
end
function v_u_8.NameButtonClicked(p60, _, p61)
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (ref) v_u_3
	if p60.ChatWindow then
		if v_u_5.ClickOnPlayerNameToWhisper then
			local v62 = v_u_2:FindFirstChild(p61)
			if v62 and v62 ~= v_u_3 then
				local v63 = GetWhisperChannelPrefix() .. p61
				if p60.ChatWindow:GetChannel(v63) then
					p60.ChatBar:ResetCustomState()
					if p60.ChatWindow:GetTargetMessageChannel() ~= v63 then
						p60.ChatWindow:SwitchCurrentChannel(v63)
					end
					p60.ChatBar:SetText("/w " .. p61)
					p60.ChatBar:CaptureFocus()
					return
				end
				if not p60.ChatBar:IsInCustomState() then
					p60.ChatBar:SetText("/w " .. p61)
					p60.ChatBar:CaptureFocus()
				end
			end
		end
	end
end
function v_u_8.ChannelButtonClicked(p64, _, p65)
	-- upvalues: (copy) v_u_5
	if p64.ChatWindow then
		if v_u_5.ClickOnChannelNameToSetMainChannel and p64.ChatWindow:GetChannel(p65) then
			p64.ChatBar:ResetCustomState()
			if p64.ChatWindow:GetTargetMessageChannel() ~= p65 then
				p64.ChatWindow:SwitchCurrentChannel(p65)
			end
			p64.ChatBar:ResetText()
			p64.ChatBar:CaptureFocus()
		end
	end
end
function v_u_8.RegisterChatWindow(p66, p67)
	p66.ChatWindow = p67
	p66.ChatBar = p67:GetChatBar()
end
function v_u_8.GetFromObjectPool(p68, p69)
	if p68.ObjectPool == nil then
		return Instance.new(p69)
	else
		return p68.ObjectPool:GetInstance(p69)
	end
end
function v_u_8.RegisterObjectPool(p70, p71)
	p70.ObjectPool = p71
end
function v_u_8.CreateFadeFunctions(_, p_u_72)
	local v_u_73 = {}
	for v74, v75 in pairs(p_u_72) do
		v_u_73[v74] = {}
		for v76, v77 in pairs(v75) do
			v_u_73[v74][v76] = {
				["Target"] = v77.FadedIn, 
				["Current"] = v74[v76], 
				["NormalizedExptValue"] = 1
			}
		end
	end
	local function v_u_82()
		-- upvalues: (copy) v_u_73
		for v78, v79 in pairs(v_u_73) do
			for v80, v81 in pairs(v79) do
				v78[v80] = v81.Current
			end
		end
	end
	return function(p83, p84)
		-- upvalues: (copy) v_u_73, (copy) p_u_72
		for v85, v86 in pairs(v_u_73) do
			for v87, v88 in pairs(v86) do
				v88.Target = p_u_72[v85][v87].FadedIn
				v88.NormalizedExptValue = p84:NormalizedDefaultExptValueInSeconds(p83)
			end
		end
	end, function(p89, p90)
		-- upvalues: (copy) v_u_73, (copy) p_u_72
		for v91, v92 in pairs(v_u_73) do
			for v93, v94 in pairs(v92) do
				v94.Target = p_u_72[v91][v93].FadedOut
				v94.NormalizedExptValue = p90:NormalizedDefaultExptValueInSeconds(p89)
			end
		end
	end, function(p95, p96)
		-- upvalues: (copy) v_u_73, (copy) v_u_82
		for _, v97 in pairs(v_u_73) do
			for _, v98 in pairs(v97) do
				v98.Current = p96:Expt(v98.Current, v98.Target, v98.NormalizedExptValue, p95)
			end
		end
		v_u_82()
	end
end
function v_u_8.NewBindableEvent(_, p99)
	local v100 = Instance.new("BindableEvent")
	v100.Name = p99
	return v100
end
function v_u_8.RegisterGuiRoot(_) end
function v7.new()
	-- upvalues: (copy) v_u_8
	local v101 = setmetatable({}, v_u_8)
	v101.ObjectPool = nil
	v101.ChatWindow = nil
	v101.DEFAULT_MESSAGE_CREATOR = "UnknownMessage"
	v101.MESSAGE_CREATOR_MODULES_VERSION = 1
	v101.KEY_MESSAGE_TYPE = "MessageType"
	v101.KEY_CREATOR_FUNCTION = "MessageCreatorFunc"
	v101.KEY_BASE_FRAME = "BaseFrame"
	v101.KEY_BASE_MESSAGE = "BaseMessage"
	v101.KEY_UPDATE_TEXT_FUNC = "UpdateTextFunction"
	v101.KEY_GET_HEIGHT = "GetHeightFunction"
	v101.KEY_FADE_IN = "FadeInFunction"
	v101.KEY_FADE_OUT = "FadeOutFunction"
	v101.KEY_UPDATE_ANIMATION = "UpdateAnimFunction"
	return v101
end
return v7.new()
