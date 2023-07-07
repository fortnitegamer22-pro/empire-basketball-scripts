-- decompiled by Sentinel (took 3.684391ms)
local v1, v_u_2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserHandleChatHotKeyWithContextActionService")
end)
if not v1 then
	v_u_2 = false
end
local v_u_3 = game:GetService("StarterGui")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local function v46()
	-- upvalues: (copy) v_u_5, (ref) v_u_2
	local v_u_6 = require(script:WaitForChild("ChatMain"))
	local v7 = {
		["ChatWindow"] = {}, 
		["SetCore"] = {}, 
		["GetCore"] = {}
	}
	v7.ChatWindow.ChatTypes = {}
	v7.ChatWindow.ChatTypes.BubbleChatEnabled = v_u_5.BubbleChatEnabled
	v7.ChatWindow.ChatTypes.ClassicChatEnabled = v_u_5.ClassicChatEnabled
	local v8 = Instance.new("BindableEvent")
	v8.Name = "ToggleVisibility"
	v7.ChatWindow.ToggleVisibility = v8
	local v_u_9 = "ToggleVisibility"
	v8.Event:connect(function(...)
		-- upvalues: (copy) v_u_6, (copy) v_u_9
		v_u_6[v_u_9](v_u_6, ...)
	end)
	local v10 = Instance.new("BindableEvent")
	v10.Name = "SetVisible"
	v7.ChatWindow.SetVisible = v10
	local v_u_11 = "SetVisible"
	v10.Event:connect(function(...)
		-- upvalues: (copy) v_u_6, (copy) v_u_11
		v_u_6[v_u_11](v_u_6, ...)
	end)
	local v12 = Instance.new("BindableEvent")
	v12.Name = "FocusChatBar"
	v7.ChatWindow.FocusChatBar = v12
	local v_u_13 = "FocusChatBar"
	v12.Event:connect(function(...)
		-- upvalues: (copy) v_u_6, (copy) v_u_13
		v_u_6[v_u_13](v_u_6, ...)
	end)
	local v14 = Instance.new("BindableEvent")
	v14.Name = "EnterWhisperState"
	v7.ChatWindow.EnterWhisperState = v14
	local v_u_15 = "EnterWhisperState"
	v14.Event:connect(function(...)
		-- upvalues: (copy) v_u_6, (copy) v_u_15
		v_u_6[v_u_15](v_u_6, ...)
	end)
	local v16 = Instance.new("BindableFunction")
	v16.Name = "GetVisibility"
	v7.ChatWindow.GetVisibility = v16
	local v_u_17 = "GetVisibility"
	function v16.OnInvoke(...)
		-- upvalues: (copy) v_u_6, (copy) v_u_17
		return v_u_6[v_u_17](v_u_6, ...)
	end
	local v18 = Instance.new("BindableFunction")
	v18.Name = "GetMessageCount"
	v7.ChatWindow.GetMessageCount = v18
	local v_u_19 = "GetMessageCount"
	function v18.OnInvoke(...)
		-- upvalues: (copy) v_u_6, (copy) v_u_19
		return v_u_6[v_u_19](v_u_6, ...)
	end
	local v20 = Instance.new("BindableEvent")
	v20.Name = "TopbarEnabledChanged"
	v7.ChatWindow.TopbarEnabledChanged = v20
	local v_u_21 = "TopbarEnabledChanged"
	v20.Event:connect(function(...)
		-- upvalues: (copy) v_u_6, (copy) v_u_21
		v_u_6[v_u_21](v_u_6, ...)
	end)
	local v22 = Instance.new("BindableFunction")
	v22.Name = "IsFocused"
	v7.ChatWindow.IsFocused = v22
	local v_u_23 = "IsFocused"
	function v22.OnInvoke(...)
		-- upvalues: (copy) v_u_6, (copy) v_u_23
		return v_u_6[v_u_23](v_u_6, ...)
	end
	local v_u_24 = Instance.new("BindableEvent")
	v_u_24.Name = "ChatBarFocusChanged"
	v7.ChatWindow.ChatBarFocusChanged = v_u_24
	v_u_6.ChatBarFocusChanged:connect(function(...)
		-- upvalues: (copy) v_u_24
		v_u_24:Fire(...)
	end)
	local v_u_25 = Instance.new("BindableEvent")
	v_u_25.Name = "VisibilityStateChanged"
	v7.ChatWindow.VisibilityStateChanged = v_u_25
	v_u_6.VisibilityStateChanged:connect(function(...)
		-- upvalues: (copy) v_u_25
		v_u_25:Fire(...)
	end)
	local v_u_26 = Instance.new("BindableEvent")
	v_u_26.Name = "MessagesChanged"
	v7.ChatWindow.MessagesChanged = v_u_26
	v_u_6.MessagesChanged:connect(function(...)
		-- upvalues: (copy) v_u_26
		v_u_26:Fire(...)
	end)
	local v_u_27 = Instance.new("BindableEvent")
	v_u_27.Name = "MessagePosted"
	v7.ChatWindow.MessagePosted = v_u_27
	v_u_6.MessagePosted:connect(function(...)
		-- upvalues: (copy) v_u_27
		v_u_27:Fire(...)
	end)
	local v28 = Instance.new("BindableEvent")
	v28.Name = "CoreGuiEnabled"
	v7.ChatWindow.CoreGuiEnabled = v28
	local v_u_29 = "CoreGuiEnabled"
	v28.Event:connect(function(...)
		-- upvalues: (copy) v_u_6, (copy) v_u_29
		v_u_6[v_u_29]:fire(...)
	end)
	local v30 = Instance.new("BindableEvent")
	v30.Name = "ChatMakeSystemMessage"
	v7.SetCore.ChatMakeSystemMessage = v30
	local v_u_31 = "ChatMakeSystemMessage"
	v30.Event:connect(function(...)
		-- upvalues: (copy) v_u_6, (copy) v_u_31
		v_u_6[v_u_31 .. "Event"]:fire(...)
	end)
	local v32 = Instance.new("BindableEvent")
	v32.Name = "ChatWindowPosition"
	v7.SetCore.ChatWindowPosition = v32
	local v_u_33 = "ChatWindowPosition"
	v32.Event:connect(function(...)
		-- upvalues: (copy) v_u_6, (copy) v_u_33
		v_u_6[v_u_33 .. "Event"]:fire(...)
	end)
	local v34 = Instance.new("BindableEvent")
	v34.Name = "ChatWindowSize"
	v7.SetCore.ChatWindowSize = v34
	local v_u_35 = "ChatWindowSize"
	v34.Event:connect(function(...)
		-- upvalues: (copy) v_u_6, (copy) v_u_35
		v_u_6[v_u_35 .. "Event"]:fire(...)
	end)
	local v36 = Instance.new("BindableFunction")
	v36.Name = "ChatWindowPosition"
	v7.GetCore.ChatWindowPosition = v36
	local v_u_37 = "ChatWindowPosition"
	function v36.OnInvoke(...)
		-- upvalues: (copy) v_u_6, (copy) v_u_37
		return v_u_6["f" .. v_u_37](...)
	end
	local v38 = Instance.new("BindableFunction")
	v38.Name = "ChatWindowSize"
	v7.GetCore.ChatWindowSize = v38
	local v_u_39 = "ChatWindowSize"
	function v38.OnInvoke(...)
		-- upvalues: (copy) v_u_6, (copy) v_u_39
		return v_u_6["f" .. v_u_39](...)
	end
	local v40 = Instance.new("BindableEvent")
	v40.Name = "ChatBarDisabled"
	v7.SetCore.ChatBarDisabled = v40
	local v_u_41 = "ChatBarDisabled"
	v40.Event:connect(function(...)
		-- upvalues: (copy) v_u_6, (copy) v_u_41
		v_u_6[v_u_41 .. "Event"]:fire(...)
	end)
	local v42 = Instance.new("BindableFunction")
	v42.Name = "ChatBarDisabled"
	v7.GetCore.ChatBarDisabled = v42
	local v_u_43 = "ChatBarDisabled"
	function v42.OnInvoke(...)
		-- upvalues: (copy) v_u_6, (copy) v_u_43
		return v_u_6["f" .. v_u_43](...)
	end
	if not v_u_2 then
		local v44 = Instance.new("BindableEvent")
		v44.Name = "SpecialKeyPressed"
		v7.ChatWindow.SpecialKeyPressed = v44
		local v_u_45 = "SpecialKeyPressed"
		v44.Event:connect(function(...)
			-- upvalues: (copy) v_u_6, (copy) v_u_45
			v_u_6[v_u_45](v_u_6, ...)
		end)
	end
	SetCoreGuiChatConnections(v7)
end
function SetCoreGuiChatConnections(p_u_47)
	-- upvalues: (copy) v_u_3
	local v48 = 0
	while v48 < 10 do
		v48 = v48 + 1
		local v49, v50 = pcall(function()
			-- upvalues: (ref) v_u_3, (copy) p_u_47
			v_u_3:SetCore("CoreGuiChatConnections", p_u_47)
		end)
		if v49 then
			break
		end
		if not v49 and v48 == 10 then
			error("Error calling SetCore CoreGuiChatConnections: " .. v50)
		end
		wait()
	end
end
function checkBothChatTypesDisabled()
	-- upvalues: (copy) v_u_5
	if v_u_5.BubbleChatEnabled == nil or v_u_5.ClassicChatEnabled == nil then
		return false
	else
		return not (v_u_5.BubbleChatEnabled or v_u_5.ClassicChatEnabled)
	end
end
if game:GetService("GuiService"):IsTenFootInterface() then
	v4:WaitForChild("DefaultChatSystemChatEvents").GetInitDataRequest:InvokeServer()
elseif checkBothChatTypesDisabled() then
	local v51 = {
		["ChatWindow"] = {}
	}
	v51.ChatWindow.ChatTypes = {}
	v51.ChatWindow.ChatTypes.BubbleChatEnabled = false
	v51.ChatWindow.ChatTypes.ClassicChatEnabled = false
	SetCoreGuiChatConnections(v51)
else
	v46()
end
