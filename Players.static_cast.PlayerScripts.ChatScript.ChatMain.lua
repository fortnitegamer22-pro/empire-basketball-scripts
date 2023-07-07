-- decompiled by Sentinel (took 13.198422ms)
local v_u_1 = {
	["Visible"] = nil, 
	["IsCoreGuiEnabled"] = nil, 
	["TopbarEnabled"] = nil, 
	["VisibilityStateChanged"] = nil
}
local v2, v3 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserHandleChatHotKeyWithContextActionService")
end)
if not v2 then
	v3 = false
end
local v4, v5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserHandleFriendJoinNotifierOnClient")
end)
if not v4 then
	v5 = false
end
local v6, v7 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled")
end)
local v_u_8 = v6 and v7
game:GetService("RunService")
local v9 = game:GetService("ReplicatedStorage")
local v_u_10 = game:GetService("Chat")
local v_u_11 = game:GetService("StarterGui")
local v12 = game:GetService("ContextActionService")
local v_u_13 = v9:WaitForChild("DefaultChatSystemChatEvents")
local v14 = v9:WaitForChild("DefaultChatSystemChatEvents")
local v15 = v_u_10:WaitForChild("ClientChatModules")
local v_u_16 = require(v15:WaitForChild("ChatConstants"))
local v_u_17 = require(v15:WaitForChild("ChatSettings"))
local v18 = require(v15:WaitForChild("MessageCreatorModules"):WaitForChild("Util"))
local v_u_19 = nil
pcall(function()
	-- upvalues: (ref) v_u_19
	v_u_19 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
v_u_19 = v_u_19 == nil and {
	["Get"] = function(_, _, p20)
		return p20
	end
} or v_u_19
local v_u_21
if v_u_8 then
	local v_u_22 = script:FindFirstChild("ChatTranslationEnabled")
	if v_u_22 == nil then
		local v_u_23 = nil
		v_u_23 = script.ChildAdded:Connect(function(p24)
			-- upvalues: (ref) v_u_22, (ref) v_u_23
			if p24.Name == "ChatTranslationEnabled" then
				v_u_22 = p24
				v_u_23:Disconnect()
			end
		end)
		v_u_21 = v_u_22
	else
		v_u_21 = v_u_22
	end
else
	v_u_21 = nil
end
local v_u_25 = 10
local v_u_26 = {
	["OnNewMessage"] = "RemoteEvent", 
	["OnMessageDoneFiltering"] = "RemoteEvent", 
	["OnNewSystemMessage"] = "RemoteEvent", 
	["OnChannelJoined"] = "RemoteEvent", 
	["OnChannelLeft"] = "RemoteEvent", 
	["OnMuted"] = "RemoteEvent", 
	["OnUnmuted"] = "RemoteEvent", 
	["OnMainChannelSet"] = "RemoteEvent", 
	["SayMessageRequest"] = "RemoteEvent", 
	["GetInitDataRequest"] = "RemoteFunction"
}
local v_u_27 = {}
local v_u_28 = Instance.new("BindableEvent")
function TryRemoveChildWithVerifyingIsCorrectType(p29)
	-- upvalues: (copy) v_u_26, (copy) v_u_27, (ref) v_u_25
	if v_u_26[p29.Name] and p29:IsA(v_u_26[p29.Name]) then
		v_u_26[p29.Name] = nil
		v_u_27[p29.Name] = p29
		v_u_25 = v_u_25 - 1
	end
end
for _, v30 in pairs(v14:GetChildren()) do
	TryRemoveChildWithVerifyingIsCorrectType(v30)
end
if 0 < v_u_25 then
	v_u_28.Event:wait()
	v14.ChildAdded:connect(function(p31)
		-- upvalues: (ref) v_u_25, (copy) v_u_28
		TryRemoveChildWithVerifyingIsCorrectType(p31)
		if v_u_25 < 1 then
			v_u_28:Fire()
		end
	end):disconnect()
	v_u_28:Destroy()
end
local v_u_32 = game:GetService("UserInputService")
local v_u_33 = game:GetService("RunService")
local v_u_34 = game:GetService("Players")
local v_u_35 = v_u_34.LocalPlayer
while not v_u_35 do
	v_u_34.ChildAdded:wait()
	v_u_35 = v_u_34.LocalPlayer
end
local v_u_36 = true
local v_u_37 = Instance.new("ScreenGui")
v_u_37.Name = "Chat"
v_u_37.ResetOnSpawn = false
v_u_37.DisplayOrder = v_u_17.ScreenGuiDisplayOrder == nil and 6 or v_u_17.ScreenGuiDisplayOrder
v_u_37.Parent = v_u_35:WaitForChild("PlayerGui")
local v_u_38 = false
local v_u_39 = script
require(v_u_39:WaitForChild("MessageLabelCreator"))
local v_u_40 = require(v_u_39:WaitForChild("MessageLogDisplay"))
require(v_u_39:WaitForChild("ChatChannel"))
local v_u_41 = require(v_u_39:WaitForChild("ChatWindow")).new()
local v_u_42 = require(v_u_39:WaitForChild("ChannelsBar")).new()
local v_u_43 = v_u_40.new()
local v_u_44 = require(v_u_39:WaitForChild("CommandProcessor")).new()
local v_u_45 = require(v_u_39:WaitForChild("ChatBar")).new(v_u_44, v_u_41)
v_u_41:CreateGuiObjects(v_u_37)
v_u_41:RegisterChatBar(v_u_45)
v_u_41:RegisterChannelsBar(v_u_42)
v_u_41:RegisterMessageLogDisplay(v_u_43)
v18:RegisterChatWindow(v_u_41)
local v_u_46 = require(v_u_39:WaitForChild("MessageSender"))
v_u_46:RegisterSayMessageFunction(v_u_27.SayMessageRequest)
if v_u_32.TouchEnabled then
	v_u_45:SetTextLabelText(v_u_19:Get("GameChat_ChatMain_ChatBarTextTouch", "Tap here to chat"))
else
	v_u_45:SetTextLabelText(v_u_19:Get("GameChat_ChatMain_ChatBarText", "To chat click here or press \"/\" key"))
end
spawn(function()
	-- upvalues: (copy) v_u_39, (copy) v_u_17, (copy) v_u_41
	local v47 = require(v_u_39:WaitForChild("CurveUtil"))
	local v48 = 1 / (v_u_17.ChatAnimationFPS or 20)
	local v49 = tick()
	while true do
		local v50 = tick()
		local v51 = v47:DeltaTimeToTimescale(v50 - v49)
		if v51 ~= 0 then
			v_u_41:Update(v51)
		end
		wait(v48)
		v49 = v50
	end
end)
function CheckIfPointIsInSquare(p52, p53, p54)
	local v55
	if p53.X <= p52.X then
		if p52.X <= p54.X then
			if p53.Y <= p52.Y then
				v55 = p52.Y <= p54.Y
			else
				v55 = false
			end
		else
			v55 = false
		end
	else
		v55 = false
	end
	return v55
end
local v_u_56 = false
local v_u_57 = false
local v_u_58 = 0
local v_u_59 = 0
local v_u_60 = Instance.new("BindableEvent")
local v_u_61 = Instance.new("BindableEvent")
local v_u_62 = Instance.new("BindableEvent")
function DoBackgroundFadeIn(p63)
	-- upvalues: (ref) v_u_59, (ref) v_u_56, (copy) v_u_60, (copy) v_u_41, (copy) v_u_17, (copy) v_u_43, (copy) v_u_40
	v_u_59 = tick()
	v_u_56 = false
	v_u_60:Fire()
	v_u_41:FadeInBackground(p63 or v_u_17.ChatDefaultFadeDuration)
	if v_u_41:GetCurrentChannel() then
		local v64 = v_u_43.Scroller
		v64.ScrollingEnabled = true
		v64.ScrollBarThickness = v_u_40.ScrollBarThickness
	end
end
function DoBackgroundFadeOut(p65)
	-- upvalues: (ref) v_u_59, (ref) v_u_56, (copy) v_u_60, (copy) v_u_41, (copy) v_u_17, (copy) v_u_43
	v_u_59 = tick()
	v_u_56 = true
	v_u_60:Fire()
	v_u_41:FadeOutBackground(p65 or v_u_17.ChatDefaultFadeDuration)
	if v_u_41:GetCurrentChannel() then
		local v66 = v_u_43.Scroller
		v66.ScrollingEnabled = false
		v66.ScrollBarThickness = 0
	end
end
function DoTextFadeIn(p67)
	-- upvalues: (ref) v_u_58, (ref) v_u_57, (copy) v_u_60, (copy) v_u_41, (copy) v_u_17
	v_u_58 = tick()
	v_u_57 = false
	v_u_60:Fire()
	v_u_41:FadeInText((p67 or v_u_17.ChatDefaultFadeDuration) * 0)
end
function DoTextFadeOut(p68)
	-- upvalues: (ref) v_u_58, (ref) v_u_57, (copy) v_u_60, (copy) v_u_41, (copy) v_u_17
	v_u_58 = tick()
	v_u_57 = true
	v_u_60:Fire()
	v_u_41:FadeOutText(p68 or v_u_17.ChatDefaultFadeDuration)
end
function DoFadeInFromNewInformation()
	-- upvalues: (copy) v_u_17
	DoTextFadeIn()
	if v_u_17.ChatShouldFadeInFromNewInformation then
		DoBackgroundFadeIn()
	end
end
function InstantFadeIn()
	DoBackgroundFadeIn(0)
	DoTextFadeIn(0)
end
function InstantFadeOut()
	DoBackgroundFadeOut(0)
	DoTextFadeOut(0)
end
local v_u_69 = nil
function UpdateFadingForMouseState(p70)
	-- upvalues: (ref) v_u_69, (copy) v_u_61, (copy) v_u_45
	v_u_69 = p70
	v_u_61:Fire()
	if v_u_45:IsFocused() then
		return
	elseif p70 then
		DoBackgroundFadeIn()
		DoTextFadeIn()
	else
		DoBackgroundFadeIn()
	end
end
spawn(function()
	-- upvalues: (copy) v_u_33, (ref) v_u_69, (copy) v_u_45, (copy) v_u_61, (copy) v_u_62, (ref) v_u_56, (ref) v_u_59, (copy) v_u_17, (ref) v_u_57, (ref) v_u_58, (copy) v_u_60
	while true do
		v_u_33.RenderStepped:wait()
		while v_u_69 or v_u_45:IsFocused() do
			if v_u_69 then
				v_u_61.Event:wait()
			end
			if v_u_45:IsFocused() then
				v_u_62.Event:wait()
			end
		end
		if v_u_56 then
			if v_u_57 then
				v_u_60.Event:wait()
			elseif tick() - v_u_58 > v_u_17.ChatWindowTextFadeOutTime then
				DoTextFadeOut()
			end
		elseif tick() - v_u_59 > v_u_17.ChatWindowBackgroundFadeOutTime then
			DoBackgroundFadeOut()
		end
	end
end)
function getClassicChatEnabled()
	-- upvalues: (copy) v_u_17, (copy) v_u_34
	if v_u_17.ClassicChatEnabled == nil then
		return v_u_34.ClassicChat
	else
		return v_u_17.ClassicChatEnabled
	end
end
function getBubbleChatEnabled()
	-- upvalues: (copy) v_u_17, (copy) v_u_34
	if v_u_17.BubbleChatEnabled == nil then
		return v_u_34.BubbleChat
	else
		return v_u_17.BubbleChatEnabled
	end
end
function bubbleChatOnly()
	local v71 = not getClassicChatEnabled()
	if v71 then
		v71 = getBubbleChatEnabled()
	end
	return v71
end
function UpdateMousePosition(p72)
	-- upvalues: (copy) v_u_1, (copy) v_u_17, (copy) v_u_41, (ref) v_u_69
	if v_u_1.Visible and v_u_1.IsCoreGuiEnabled and (v_u_1.TopbarEnabled or v_u_17.ChatOnWithTopBarOff) then
		if not bubbleChatOnly() then
			local v73 = v_u_41.GuiObject.AbsolutePosition
			local v74 = CheckIfPointIsInSquare(p72, v73, v73 + v_u_41.GuiObject.AbsoluteSize)
			if v74 ~= v_u_69 then
				UpdateFadingForMouseState(v74)
			end
		end
	else
		return
	end
end
v_u_32.InputChanged:connect(function(p75, _)
	if p75.UserInputType == Enum.UserInputType.MouseMovement then
		UpdateMousePosition((Vector2.new(p75.Position.X, p75.Position.Y)))
	end
end)
v_u_32.TouchTap:connect(function(p76, _)
	UpdateMousePosition(p76[1])
end)
v_u_32.TouchMoved:connect(function(p77, _)
	UpdateMousePosition((Vector2.new(p77.Position.X, p77.Position.Y)))
end)
v_u_32.Changed:connect(function(p78)
	-- upvalues: (copy) v_u_32, (copy) v_u_41, (copy) v_u_37
	if p78 == "MouseBehavior" and v_u_32.MouseBehavior == Enum.MouseBehavior.LockCenter then
		local v79 = v_u_41.GuiObject.AbsolutePosition
		if CheckIfPointIsInSquare(v_u_37.AbsoluteSize / 2, v79, v79 + v_u_41.GuiObject.AbsoluteSize) then
			v_u_32.MouseBehavior = Enum.MouseBehavior.Default
		end
	end
end)
UpdateFadingForMouseState(true)
UpdateFadingForMouseState(false)
local v85 = {
	["Signal"] = function()
		local v80 = {}
		local v_u_81 = Instance.new("BindableEvent")
		local v_u_82 = nil
		local v_u_83 = nil
		function v80.fire(_, ...)
			-- upvalues: (ref) v_u_82, (ref) v_u_83, (copy) v_u_81
			v_u_82 = { ... }
			v_u_83 = select("#", ...)
			v_u_81:Fire()
		end
		function v80.connect(_, p_u_84)
			-- upvalues: (copy) v_u_81, (ref) v_u_82, (ref) v_u_83
			if not p_u_84 then
				error("connect(nil)", 2)
			end
			return v_u_81.Event:connect(function()
				-- upvalues: (copy) p_u_84, (ref) v_u_82, (ref) v_u_83
				p_u_84(unpack(v_u_82, 1, v_u_83))
			end)
		end
		function v80.wait(_)
			-- upvalues: (copy) v_u_81, (ref) v_u_82, (ref) v_u_83
			v_u_81.Event:wait()
			assert(v_u_82, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
			return unpack(v_u_82, 1, v_u_83)
		end
		return v80
	end
}
function SetVisibility(p86)
	-- upvalues: (copy) v_u_41, (copy) v_u_1
	v_u_41:SetVisible(p86)
	v_u_1.VisibilityStateChanged:fire(p86)
	v_u_1.Visible = p86
	if v_u_1.IsCoreGuiEnabled then
		if p86 then
			InstantFadeIn()
			return
		end
		InstantFadeOut()
	end
end
local v_u_87 = nil
v_u_1.TopbarEnabled = true
v_u_1.MessageCount = 0
v_u_1.Visible = true
v_u_1.IsCoreGuiEnabled = true
function v_u_1.ToggleVisibility(_)
	-- upvalues: (copy) v_u_41
	SetVisibility(not v_u_41:GetVisible())
end
function v_u_1.SetVisible(_, p88)
	-- upvalues: (copy) v_u_41
	if v_u_41:GetVisible() ~= p88 then
		SetVisibility(p88)
	end
end
function v_u_1.FocusChatBar(_)
	-- upvalues: (copy) v_u_45
	v_u_45:CaptureFocus()
end
function v_u_1.EnterWhisperState(_, p89)
	-- upvalues: (copy) v_u_45
	v_u_45:EnterWhisperState(p89)
end
function v_u_1.GetVisibility(_)
	-- upvalues: (copy) v_u_41
	return v_u_41:GetVisible()
end
function v_u_1.GetMessageCount(p90)
	return p90.MessageCount
end
function v_u_1.TopbarEnabledChanged(p91, p92)
	p91.TopbarEnabled = p92
	p91.CoreGuiEnabled:fire(game:GetService("StarterGui"):GetCoreGuiEnabled(Enum.CoreGuiType.Chat))
end
function v_u_1.IsFocused(_, _)
	-- upvalues: (copy) v_u_45
	return v_u_45:IsFocused()
end
v_u_1.ChatBarFocusChanged = v85.Signal()
v_u_1.VisibilityStateChanged = v85.Signal()
v_u_1.MessagesChanged = v85.Signal()
v_u_1.MessagePosted = v85.Signal()
v_u_1.CoreGuiEnabled = v85.Signal()
v_u_1.ChatMakeSystemMessageEvent = v85.Signal()
v_u_1.ChatWindowPositionEvent = v85.Signal()
v_u_1.ChatWindowSizeEvent = v85.Signal()
v_u_1.ChatBarDisabledEvent = v85.Signal()
function v_u_1.fChatWindowPosition(_)
	-- upvalues: (copy) v_u_41
	return v_u_41.GuiObject.Position
end
function v_u_1.fChatWindowSize(_)
	-- upvalues: (copy) v_u_41
	return v_u_41.GuiObject.Size
end
function v_u_1.fChatBarDisabled(_)
	-- upvalues: (copy) v_u_45
	return not v_u_45:GetEnabled()
end
if v3 then
	v12:BindAction("ToggleChat", function(p93, p94, p95)
		-- upvalues: (ref) v_u_36, (ref) v_u_87
		if p93 == "ToggleChat" and p94 == Enum.UserInputState.Begin and v_u_36 and p95.UserInputType == Enum.UserInputType.Keyboard then
			v_u_87()
		end
	end, true, Enum.KeyCode.Slash)
else
	function v_u_1.SpecialKeyPressed(_, p96, _)
		-- upvalues: (ref) v_u_36, (ref) v_u_87
		if p96 == Enum.SpecialKey.ChatHotkey and v_u_36 then
			v_u_87()
		end
	end
end
v_u_1.CoreGuiEnabled:connect(function(p97)
	-- upvalues: (copy) v_u_1, (copy) v_u_17, (copy) v_u_41, (copy) v_u_45
	v_u_1.IsCoreGuiEnabled = p97
	if p97 then
		p97 = v_u_1.TopbarEnabled or v_u_17.ChatOnWithTopBarOff
	end
	v_u_41:SetCoreGuiEnabled(p97)
	if p97 then
		InstantFadeIn()
	else
		v_u_45:ReleaseFocus()
		InstantFadeOut()
	end
end)
function trimTrailingSpaces(p98)
	local v99 = #p98
	while 0 < v99 and p98:find("^%s", v99) do
		v99 = v99 - 1
	end
	return p98:sub(1, v99)
end
v_u_1.ChatMakeSystemMessageEvent:connect(function(p100)
	-- upvalues: (ref) v_u_38, (copy) v_u_17, (copy) v_u_41, (copy) v_u_16, (copy) v_u_42, (copy) v_u_1
	if p100.Text and type(p100.Text) == "string" then
		while not v_u_38 do
			wait()
		end
		local v101 = v_u_17.GeneralChannelName
		local v102 = v_u_41:GetChannel(v101)
		if v102 then
			v102:AddMessageToChannel({
				["ID"] = -1, 
				["FromSpeaker"] = nil, 
				["SpeakerUserId"] = 0, 
				["OriginalChannel"] = v101, 
				["IsFiltered"] = true, 
				["MessageLength"] = string.len(p100.Text), 
				["MessageLengthUtf8"] = utf8.len(utf8.nfcnormalize(p100.Text)), 
				["Message"] = trimTrailingSpaces(p100.Text), 
				["MessageType"] = v_u_16.MessageTypeSetCore, 
				["Time"] = os.time(), 
				["ExtraData"] = p100
			})
			v_u_42:UpdateMessagePostedInChannel(v101)
			v_u_1.MessageCount = v_u_1.MessageCount + 1
			v_u_1.MessagesChanged:fire(v_u_1.MessageCount)
		end
	end
end)
v_u_1.ChatBarDisabledEvent:connect(function(p103)
	-- upvalues: (ref) v_u_36, (copy) v_u_45
	if v_u_36 then
		v_u_45:SetEnabled(not p103)
		if p103 then
			v_u_45:ReleaseFocus()
		end
	end
end)
v_u_1.ChatWindowSizeEvent:connect(function(p104)
	-- upvalues: (copy) v_u_41
	v_u_41.GuiObject.Size = p104
end)
v_u_1.ChatWindowPositionEvent:connect(function(p105)
	-- upvalues: (copy) v_u_41
	v_u_41.GuiObject.Position = p105
end)
v_u_87 = function()
	-- upvalues: (copy) v_u_41, (copy) v_u_45, (copy) v_u_1
	if v_u_41:GetCoreGuiEnabled() then
		if v_u_45:GetEnabled() then
			if not v_u_45:IsFocused() and v_u_45:GetVisible() then
				v_u_1:SetVisible(true)
				InstantFadeIn()
				v_u_45:CaptureFocus()
				v_u_1.ChatBarFocusChanged:fire(true)
			end
		end
	else
		return
	end
end
v_u_62.Event:connect(function(p106)
	-- upvalues: (copy) v_u_1
	v_u_1.ChatBarFocusChanged:fire(p106)
end)
function DoSwitchCurrentChannel(p107)
	-- upvalues: (copy) v_u_41
	if v_u_41:GetChannel(p107) then
		v_u_41:SwitchCurrentChannel(p107)
	end
end
function SendMessageToSelfInTargetChannel(p108, p109, p110)
	-- upvalues: (copy) v_u_41, (copy) v_u_16
	local v111 = v_u_41:GetChannel(p109)
	if v111 then
		v111:AddMessageToChannel({
			["ID"] = -1, 
			["FromSpeaker"] = nil, 
			["SpeakerUserId"] = 0, 
			["OriginalChannel"] = p109, 
			["IsFiltered"] = true, 
			["MessageLength"] = string.len(p108), 
			["MessageLengthUtf8"] = utf8.len(utf8.nfcnormalize(p108)), 
			["Message"] = trimTrailingSpaces(p108), 
			["MessageType"] = v_u_16.MessageTypeSystem, 
			["Time"] = os.time(), 
			["ExtraData"] = p110
		})
	end
end
function chatBarFocused()
	-- upvalues: (ref) v_u_69, (ref) v_u_57, (copy) v_u_62
	if not v_u_69 then
		DoBackgroundFadeIn()
		if v_u_57 then
			DoTextFadeIn()
		end
	end
	v_u_62:Fire(true)
end
function chatBarFocusLost(p112, _)
	-- upvalues: (copy) v_u_62, (copy) v_u_45, (copy) v_u_1, (copy) v_u_44, (copy) v_u_41, (copy) v_u_17, (copy) v_u_46
	DoBackgroundFadeIn()
	v_u_62:Fire(false)
	if p112 then
		local v113 = v_u_45:GetTextBox().Text
		if v_u_45:IsInCustomState() then
			v113 = v_u_45:GetCustomMessage() or v113
			v_u_45:ResetCustomState()
			if v_u_45:CustomStateProcessCompletedMessage(v113) then
				return
			end
		end
		v_u_45:GetTextBox().Text = ""
		if v113 ~= "" then
			v_u_1.MessagePosted:fire(v113)
			if not v_u_44:ProcessCompletedChatMessage(v113, v_u_41) then
				if v_u_17.DisallowedWhiteSpace then
					for v114 = 1, #v_u_17.DisallowedWhiteSpace do
						if v_u_17.DisallowedWhiteSpace[v114] == "\t" then
							v113 = string.gsub(v113, v_u_17.DisallowedWhiteSpace[v114], " ")
						else
							v113 = string.gsub(v113, v_u_17.DisallowedWhiteSpace[v114], "")
						end
					end
				end
				local v115 = string.gsub(string.gsub(v113, "\n", ""), "[ ]+", " ")
				local v116 = v_u_41:GetTargetMessageChannel()
				if v116 then
					v_u_46:SendMessage(v115, v116)
					return
				end
				v_u_46:SendMessage(v115, nil)
			end
		end
	end
end
local v_u_117 = {}
function setupChatBarConnections()
	-- upvalues: (ref) v_u_117, (copy) v_u_45
	for v118 = 1, #v_u_117 do
		v_u_117[v118]:Disconnect()
	end
	v_u_117 = {}
	table.insert(v_u_117, (v_u_45:GetTextBox().FocusLost:connect(chatBarFocusLost)))
	table.insert(v_u_117, (v_u_45:GetTextBox().Focused:connect(chatBarFocused)))
end
setupChatBarConnections()
v_u_45.GuiObjectsChanged:connect(setupChatBarConnections)
function getEchoMessagesInGeneral()
	-- upvalues: (copy) v_u_17
	return v_u_17.EchoMessagesInGeneralChannel == nil and true or v_u_17.EchoMessagesInGeneralChannel
end
v_u_27.OnMessageDoneFiltering.OnClientEvent:connect(function(p119)
	-- upvalues: (copy) v_u_17, (ref) v_u_35, (copy) v_u_41
	if v_u_17.ShowUserOwnFilteredMessage or p119.FromSpeaker ~= v_u_35.Name then
		local v120 = p119.OriginalChannel
		local v121 = v_u_41:GetChannel(v120)
		if v121 then
			v121:UpdateMessageFiltered(p119)
		end
		local v122 = getEchoMessagesInGeneral() and v_u_17.GeneralChannelName and v120 ~= v_u_17.GeneralChannelName and v_u_41:GetChannel(v_u_17.GeneralChannelName)
		if v122 then
			v122:UpdateMessageFiltered(p119)
		end
	end
end)
v_u_27.OnNewMessage.OnClientEvent:connect(function(p123, p124)
	-- upvalues: (copy) v_u_41, (ref) v_u_35, (copy) v_u_42, (copy) v_u_17, (copy) v_u_1
	local v125 = v_u_41:GetChannel(p124)
	if v125 then
		v125:AddMessageToChannel(p123)
		if p123.FromSpeaker ~= v_u_35.Name then
			v_u_42:UpdateMessagePostedInChannel(p124)
		end
		local v126 = getEchoMessagesInGeneral() and v_u_17.GeneralChannelName and p124 ~= v_u_17.GeneralChannelName and v_u_41:GetChannel(v_u_17.GeneralChannelName)
		if v126 then
			v126:AddMessageToChannel(p123)
		end
		v_u_1.MessageCount = v_u_1.MessageCount + 1
		v_u_1.MessagesChanged:fire(v_u_1.MessageCount)
		DoFadeInFromNewInformation()
	end
end)
v_u_27.OnNewSystemMessage.OnClientEvent:connect(function(p127, p128)
	-- upvalues: (copy) v_u_41, (copy) v_u_42, (copy) v_u_1, (copy) v_u_17
	local v129 = p128 or "System"
	local v130 = v_u_41:GetChannel(v129)
	if v130 then
		v130:AddMessageToChannel(p127)
		v_u_42:UpdateMessagePostedInChannel(v129)
		v_u_1.MessageCount = v_u_1.MessageCount + 1
		v_u_1.MessagesChanged:fire(v_u_1.MessageCount)
		DoFadeInFromNewInformation()
		local v131 = getEchoMessagesInGeneral() and v_u_17.GeneralChannelName and v129 ~= v_u_17.GeneralChannelName and v_u_41:GetChannel(v_u_17.GeneralChannelName)
		if v131 then
			v131:AddMessageToChannel(p127)
			return
		end
	else
		warn(string.format("Just received system message for channel I\'m not in [%s]", v129))
	end
end)
function HandleChannelJoined(p132, p133, p134, p135, p136, p137)
	-- upvalues: (copy) v_u_41, (copy) v_u_17, (ref) v_u_38, (copy) v_u_45, (copy) v_u_16, (ref) v_u_19, (ref) v_u_8, (ref) v_u_21
	if v_u_41:GetChannel(p132) then
		v_u_41:RemoveChannel(p132)
	end
	if p132 == v_u_17.GeneralChannelName then
		v_u_38 = true
	end
	if p135 then
		v_u_45:SetChannelNameColor(p132, p135)
	end
	local v138 = v_u_41:AddChannel(p132)
	if v138 then
		if p132 == v_u_17.GeneralChannelName then
			DoSwitchCurrentChannel(p132)
		end
		if p134 then
			local v139 = #p134 <= v_u_17.MessageHistoryLengthPerChannel and 1 or #p134 - v_u_17.MessageHistoryLengthPerChannel
			for v140 = v139, #p134 do
				v138:AddMessageToChannel(p134[v140])
			end
			local v141 = getEchoMessagesInGeneral() and p136 and v_u_17.GeneralChannelName and p132 ~= v_u_17.GeneralChannelName and v_u_41:GetChannel(v_u_17.GeneralChannelName)
			if v141 then
				v141:AddMessagesToChannelByTimeStamp(p134, v139)
			end
		end
		if p133 ~= "" then
			local v142 = {
				["ID"] = -1, 
				["FromSpeaker"] = nil, 
				["SpeakerUserId"] = 0, 
				["OriginalChannel"] = p132, 
				["IsFiltered"] = true, 
				["MessageLength"] = string.len(p133), 
				["MessageLengthUtf8"] = utf8.len(utf8.nfcnormalize(p133)), 
				["Message"] = trimTrailingSpaces(p133), 
				["MessageType"] = v_u_16.MessageTypeWelcome, 
				["Time"] = os.time(), 
				["ExtraData"] = nil
			}
			v138:AddMessageToChannel(v142)
			local v143 = getEchoMessagesInGeneral() and p137 and not v_u_17.ShowChannelsBar and p132 ~= v_u_17.GeneralChannelName and v_u_41:GetChannel(v_u_17.GeneralChannelName)
			if v143 then
				v143:AddMessageToChannel(v142)
			end
		end
		local v144 = v_u_19:Get("GameChat_ChatMain_ChatTranslationOnboarding", "Text chat will be translated into your language. Tap the symbol in front of the message to see the original. You can turn off translations in the Settings menu.")
		if v_u_8 and v144 ~= "" and p132 == v_u_17.GeneralChannelName and v_u_21 ~= nil and v_u_21.Value then
			v138:AddMessageToChannel({
				["ID"] = -2, 
				["FromSpeaker"] = nil, 
				["SpeakerUserId"] = 0, 
				["OriginalChannel"] = p132, 
				["IsFiltered"] = true, 
				["MessageLength"] = string.len(v144), 
				["MessageLengthUtf8"] = utf8.len(utf8.nfcnormalize(v144)), 
				["Message"] = trimTrailingSpaces(v144), 
				["MessageType"] = v_u_16.MessageTypeWelcome, 
				["Time"] = os.time(), 
				["ExtraData"] = nil
			})
		end
		DoFadeInFromNewInformation()
	end
end
v_u_27.OnChannelJoined.OnClientEvent:connect(function(p145, p146, p147, p148)
	HandleChannelJoined(p145, p146, p147, p148, false, true)
end)
v_u_27.OnChannelLeft.OnClientEvent:connect(function(p149)
	-- upvalues: (copy) v_u_41
	v_u_41:RemoveChannel(p149)
	DoFadeInFromNewInformation()
end)
v_u_27.OnMuted.OnClientEvent:connect(function(_) end)
v_u_27.OnUnmuted.OnClientEvent:connect(function(_) end)
v_u_27.OnMainChannelSet.OnClientEvent:connect(function(p150)
	DoSwitchCurrentChannel(p150)
end)
coroutine.wrap(function()
	-- upvalues: (copy) v_u_13, (copy) v_u_45
	local v151 = v_u_13:WaitForChild("ChannelNameColorUpdated", 5)
	if v151 then
		v151.OnClientEvent:connect(function(p152, p153)
			-- upvalues: (ref) v_u_45
			v_u_45:SetChannelNameColor(p152, p153)
		end)
	end
end)()
local v_u_154 = nil
local v_u_155 = nil
local v_u_156 = nil
local v_u_157 = nil
pcall(function()
	-- upvalues: (ref) v_u_154, (copy) v_u_11, (ref) v_u_155, (ref) v_u_156, (ref) v_u_157
	v_u_154 = v_u_11:GetCore("PlayerBlockedEvent")
	v_u_155 = v_u_11:GetCore("PlayerMutedEvent")
	v_u_156 = v_u_11:GetCore("PlayerUnblockedEvent")
	v_u_157 = v_u_11:GetCore("PlayerUnmutedEvent")
end)
function SendSystemMessageToSelf(p158)
	-- upvalues: (copy) v_u_41, (copy) v_u_16
	local v159 = v_u_41:GetCurrentChannel()
	if v159 then
		v159:AddMessageToChannel({
			["ID"] = -1, 
			["FromSpeaker"] = nil, 
			["SpeakerUserId"] = 0, 
			["OriginalChannel"] = v159.Name, 
			["IsFiltered"] = true, 
			["MessageLength"] = string.len(p158), 
			["MessageLengthUtf8"] = utf8.len(utf8.nfcnormalize(p158)), 
			["Message"] = trimTrailingSpaces(p158), 
			["MessageType"] = v_u_16.MessageTypeSystem, 
			["Time"] = os.time(), 
			["ExtraData"] = nil
		})
	end
end
function MutePlayer(p160)
	-- upvalues: (copy) v_u_13
	local v161 = v_u_13:FindFirstChild("MutePlayerRequest")
	if v161 then
		return v161:InvokeServer(p160.Name)
	else
		return false
	end
end
if v_u_154 then
	v_u_154.Event:connect(function(p162)
		-- upvalues: (copy) v_u_17, (ref) v_u_19
		if MutePlayer(p162) then
			local v163
			if v_u_17.PlayerDisplayNamesEnabled then
				v163 = p162.DisplayName
			else
				v163 = p162.Name
			end
			SendSystemMessageToSelf(v_u_19:Get("GameChat_ChatMain_SpeakerHasBeenBlocked", string.format("Speaker \'%s\' has been blocked.", v163), {
				["RBX_NAME"] = v163
			}))
		end
	end)
end
if v5 then
	local v164
	if v_u_17.ShowFriendJoinNotification == nil then
		v164 = false
	else
		v164 = v_u_17.ShowFriendJoinNotification
	end
	if v164 then
		v_u_34.PlayerAdded:Connect(function(p_u_165)
			-- upvalues: (ref) v_u_35, (copy) v_u_17, (ref) v_u_19
			local v166, v167 = pcall(function()
				-- upvalues: (copy) p_u_165, (ref) v_u_35
				return p_u_165:IsFriendsWith(v_u_35.UserId)
			end)
			if v166 and v167 then
				local v168 = p_u_165.Name
				if v_u_17.PlayerDisplayNamesEnabled then
					v168 = p_u_165.DisplayName
				end
				SendSystemMessageToSelf((v_u_19:FormatMessageToSend("GameChat_FriendChatNotifier_JoinMessage", string.format("Your friend %s has joined the game.", v168), "RBX_NAME", v168)))
			end
		end)
	end
end
if v_u_155 then
	v_u_155.Event:connect(function(p169)
		-- upvalues: (copy) v_u_17, (ref) v_u_19
		if MutePlayer(p169) then
			local v170
			if v_u_17.PlayerDisplayNamesEnabled then
				v170 = p169.DisplayName
			else
				v170 = p169.Name
			end
			SendSystemMessageToSelf(v_u_19:Get("GameChat_ChatMain_SpeakerHasBeenMuted", string.format("Speaker \'%s\' has been muted.", v170), {
				["RBX_NAME"] = v170
			}))
		end
	end)
end
function UnmutePlayer(p171)
	-- upvalues: (copy) v_u_13
	local v172 = v_u_13:FindFirstChild("UnMutePlayerRequest")
	if v172 then
		return v172:InvokeServer(p171.Name)
	else
		return false
	end
end
if v_u_156 then
	v_u_156.Event:connect(function(p173)
		-- upvalues: (copy) v_u_17, (ref) v_u_19
		if UnmutePlayer(p173) then
			local v174
			if v_u_17.PlayerDisplayNamesEnabled then
				v174 = p173.DisplayName
			else
				v174 = p173.Name
			end
			SendSystemMessageToSelf(v_u_19:Get("GameChat_ChatMain_SpeakerHasBeenUnBlocked", string.format("Speaker \'%s\' has been unblocked.", v174), {
				["RBX_NAME"] = v174
			}))
		end
	end)
end
if v_u_157 then
	v_u_157.Event:connect(function(p175)
		-- upvalues: (copy) v_u_17, (ref) v_u_19
		if UnmutePlayer(p175) then
			local v176
			if v_u_17.PlayerDisplayNamesEnabled then
				v176 = p175.DisplayName
			else
				v176 = p175.Name
			end
			SendSystemMessageToSelf(v_u_19:Get("GameChat_ChatMain_SpeakerHasBeenUnMuted", string.format("Speaker \'%s\' has been unmuted.", v176), {
				["RBX_NAME"] = v176
			}))
		end
	end)
end
spawn(function()
	-- upvalues: (ref) v_u_35, (copy) v_u_11, (copy) v_u_13
	if 0 < v_u_35.UserId then
		pcall(function()
			-- upvalues: (ref) v_u_11, (ref) v_u_13
			local v177 = v_u_11:GetCore("GetBlockedUserIds")
			local v178 = 0 < #v177 and v_u_13:FindFirstChild("SetBlockedUserIdsRequest")
			if v178 then
				v178:FireServer(v177)
			end
		end)
	end
end)
spawn(function()
	-- upvalues: (copy) v_u_10, (ref) v_u_35, (ref) v_u_36, (copy) v_u_33
	local v179, v180 = pcall(function()
		-- upvalues: (ref) v_u_10, (ref) v_u_35
		return v_u_10:CanUserChatAsync(v_u_35.UserId)
	end)
	if v179 then
		v_u_36 = v_u_33:IsStudio() or v180
	end
end)
local v181 = v_u_27.GetInitDataRequest:InvokeServer()
for _, v182 in pairs(v181.Channels) do
	if v182[1] == v_u_17.GeneralChannelName then
		HandleChannelJoined(v182[1], v182[2], v182[3], v182[4], true, false)
	end
end
for _, v183 in pairs(v181.Channels) do
	if v183[1] ~= v_u_17.GeneralChannelName then
		HandleChannelJoined(v183[1], v183[2], v183[3], v183[4], true, false)
	end
end
return v_u_1
