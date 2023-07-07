-- decompiled by Sentinel (took 3.365195ms)
local v1 = require(script.Parent:WaitForChild("Util"))
local v_u_2 = require(script.Parent.Parent:WaitForChild("ChatSettings"))
local v_u_3 = game:GetService("Players")
local v_u_4 = nil
pcall(function()
	-- upvalues: (ref) v_u_4
	v_u_4 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
local v_u_5 = v_u_3.LocalPlayer
while v_u_5 == nil do
	v_u_3.ChildAdded:wait()
	v_u_5 = v_u_3.LocalPlayer
end
local v_u_6 = {}
v_u_6.__index = v_u_6
local v_u_7 = {}
function v_u_6.TrimWhisperCommand(_, p8)
	if string.sub(p8, 1, 3):lower() == "/w " then
		return string.sub(p8, 4)
	elseif string.sub(p8, 1, 9):lower() == "/whisper " then
		return string.sub(p8, 10)
	else
		return nil
	end
end
function v_u_6.TrimWhiteSpace(_, p9)
	return string.gsub(p9, "%s+", ""), p9[#p9] == " "
end
function v_u_6.ShouldAutoCompleteNames(_)
	-- upvalues: (copy) v_u_2
	return v_u_2.WhisperCommandAutoCompletePlayerNames == nil and true or v_u_2.WhisperCommandAutoCompletePlayerNames
end
function v_u_6.GetWhisperingPlayer(p10, p11)
	-- upvalues: (copy) v_u_3, (ref) v_u_5, (copy) v_u_2
	local v12 = p10:TrimWhisperCommand((p11:lower()))
	if v12 then
		local v13, v14 = p10:TrimWhiteSpace(v12)
		local v15 = {}
		local v16 = {}
		local v17 = v_u_3:GetPlayers()
		for v18 = 1, #v17 do
			if v17[v18] ~= v_u_5 then
				if string.sub(v17[v18].Name:lower(), 1, (string.len(v13))) == v13 then
					v15[v17[v18]] = v17[v18].Name:lower()
				end
				if v_u_2.WhisperByDisplayName then
					local v19 = v17[v18].DisplayName:lower()
					if string.sub(v19, 1, (string.len(v13))) == v13 then
						v16[v17[v18]] = v19
					end
				end
			end
		end
		local v20 = 0
		local v21 = nil
		local v22 = nil
		for v23, v24 in pairs(v15) do
			v20 = v20 + 1
			if v24 == v13 then
				if v14 then
					return v23
				end
				v22 = v24
				v21 = v23
			else
				v22 = v24
				v21 = v23
			end
		end
		if v_u_2.WhisperByDisplayName then
			for v25, v26 in pairs(v16) do
				if v21 ~= v25 then
					v20 = v20 + 1
					v22 = v26
					v21 = v25
				end
			end
		end
		if v20 == 1 then
			if p10:ShouldAutoCompleteNames() then
				return v21
			end
			if v22 == v13 then
				return v21
			end
		end
	end
	return nil
end
function v_u_6.GetWhisperChanneNameColor(p27)
	if p27.ChatSettings.WhisperChannelNameColor then
		return p27.ChatSettings.WhisperChannelNameColor
	else
		return Color3.fromRGB(102, 14, 102)
	end
end
function v_u_6.EnterWhisperState(p28, p29)
	-- upvalues: (copy) v_u_2, (ref) v_u_4
	p28.PlayerNameEntered = true
	p28.PlayerName = p29.Name
	p28.PlayerDisplayName = p29.DisplayName
	p28.MessageModeButton.Size = UDim2.new(0, 1000, 1, 0)
	local v30
	if v_u_2.PlayerDisplayNamesEnabled and v_u_2.WhisperByDisplayName then
		v30 = string.format("[To %s]", p29.DisplayName)
	else
		v30 = string.format("[To %s]", p29.Name)
	end
	if v_u_4.tryLocalize then
		v30 = v_u_4:tryLocalize(v30)
	end
	p28.MessageModeButton.Text = v30
	p28.MessageModeButton.TextColor3 = p28:GetWhisperChanneNameColor()
	local v31 = math.ceil(p28.MessageModeButton.TextBounds.X)
	p28.MessageModeButton.Size = UDim2.new(0, v31, 1, 0)
	p28.TextBox.Size = UDim2.new(1, -v31, 1, 0)
	p28.TextBox.Position = UDim2.new(0, v31, 0, 0)
	p28.TextBox.Text = " "
end
function v_u_6.TextUpdated(p32)
	local v33 = p32.TextBox.Text
	if p32.PlayerNameEntered then
		if v33 == "" then
			p32.MessageModeButton.Text = ""
			p32.MessageModeButton.Size = UDim2.new(0, 0, 0, 0)
			p32.TextBox.Size = UDim2.new(1, 0, 1, 0)
			p32.TextBox.Position = UDim2.new(0, 0, 0, 0)
			p32.TextBox.Text = ""
			p32.PlayerNameEntered = false
			p32.ChatBar:ResetCustomState()
			p32.ChatBar:CaptureFocus()
		end
	else
		local v34 = p32:GetWhisperingPlayer(v33)
		if v34 then
			p32:EnterWhisperState(v34)
			return
		end
	end
end
function v_u_6.GetMessage(p35)
	if p35.PlayerNameEntered then
		return "/w " .. p35.PlayerName .. " " .. p35.TextBox.Text
	else
		return p35.TextBox.Text
	end
end
function v_u_6.ProcessCompletedMessage(_)
	return false
end
function v_u_6.Destroy(p36)
	p36.MessageModeConnection:disconnect()
	p36.Destroyed = true
end
function v_u_7.new(p37, p38, p39, p40)
	-- upvalues: (copy) v_u_6
	local v_u_41 = setmetatable({}, v_u_6)
	v_u_41.Destroyed = false
	v_u_41.ChatWindow = p37
	v_u_41.ChatBar = p38
	v_u_41.ChatSettings = p39
	v_u_41.TextBox = p38:GetTextBox()
	v_u_41.MessageModeButton = p38:GetMessageModeTextButton()
	v_u_41.OriginalWhisperText = ""
	v_u_41.PlayerNameEntered = false
	v_u_41.MessageModeConnection = v_u_41.MessageModeButton.MouseButton1Click:connect(function()
		-- upvalues: (copy) v_u_41
		local v42 = v_u_41.TextBox.Text
		if string.sub(v42, 1, 1) == " " then
			v42 = string.sub(v42, 2)
		end
		v_u_41.ChatBar:ResetCustomState()
		v_u_41.ChatBar:SetTextBoxText(v42)
		v_u_41.ChatBar:CaptureFocus()
	end)
	if p40 then
		v_u_41:EnterWhisperState(p40)
		return v_u_41
	else
		v_u_41:TextUpdated()
		return v_u_41
	end
end
function ProcessMessage(p43, p44, p45, p46)
	-- upvalues: (copy) v_u_7
	if string.sub(p43, 1, 3):lower() == "/w " or string.sub(p43, 1, 9):lower() == "/whisper " then
		return v_u_7.new(p44, p45, p46)
	else
		return nil
	end
end
function CreateCustomState(p47, p48, p49, p50)
	-- upvalues: (copy) v_u_7
	return v_u_7.new(p48, p49, p50, p47)
end
return {
	[v1.KEY_COMMAND_PROCESSOR_TYPE] = v1.IN_PROGRESS_MESSAGE_PROCESSOR, 
	[v1.KEY_PROCESSOR_FUNCTION] = ProcessMessage, 
	["CustomStateCreator"] = CreateCustomState
}
