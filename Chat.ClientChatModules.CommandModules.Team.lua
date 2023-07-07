-- decompiled by Sentinel (took 1.776443ms)
local v_u_1 = game:GetService("Players")
local v_u_2 = { "/team ", "/t ", "% " }
function IsTeamCommand(p3)
	-- upvalues: (copy) v_u_2
	for v4 = 1, #v_u_2 do
		local v5 = v_u_2[v4]
		if string.sub(p3, 1, v5:len()):lower() == v5 then
			return true
		end
	end
	return false
end
local v_u_6 = {}
v_u_6.__index = v_u_6
local v7 = require(script.Parent:WaitForChild("Util"))
local v_u_8 = {}
function v_u_6.EnterTeamChat(p9)
	p9.TeamChatEntered = true
	p9.MessageModeButton.Size = UDim2.new(0, 1000, 1, 0)
	p9.MessageModeButton.Text = "[Team]"
	p9.MessageModeButton.TextColor3 = p9:GetTeamChatColor()
	local v10 = p9.MessageModeButton.TextBounds.X
	p9.MessageModeButton.Size = UDim2.new(0, v10, 1, 0)
	p9.TextBox.Size = UDim2.new(1, -v10, 1, 0)
	p9.TextBox.Position = UDim2.new(0, v10, 0, 0)
	p9.OriginalTeamText = p9.TextBox.Text
	p9.TextBox.Text = " "
end
function v_u_6.TextUpdated(p11)
	local v12 = p11.TextBox.Text
	if p11.TeamChatEntered then
		if v12 == "" then
			p11.MessageModeButton.Text = ""
			p11.MessageModeButton.Size = UDim2.new(0, 0, 0, 0)
			p11.TextBox.Size = UDim2.new(1, 0, 1, 0)
			p11.TextBox.Position = UDim2.new(0, 0, 0, 0)
			p11.TextBox.Text = ""
			p11.TeamChatEntered = false
			p11.ChatBar:ResetCustomState()
			p11.ChatBar:CaptureFocus()
		end
	elseif IsTeamCommand(v12) then
		p11:EnterTeamChat()
		return
	end
end
function v_u_6.GetMessage(p13)
	if p13.TeamChatEntered then
		return "/t " .. p13.TextBox.Text
	else
		return p13.TextBox.Text
	end
end
function v_u_6.ProcessCompletedMessage(_)
	return false
end
function v_u_6.Destroy(p14)
	p14.MessageModeConnection:disconnect()
	p14.Destroyed = true
end
function v_u_6.GetTeamChatColor(p15)
	-- upvalues: (copy) v_u_1
	local v16 = v_u_1.LocalPlayer
	if v16.Team then
		return v16.Team.TeamColor.Color
	elseif p15.ChatSettings.DefaultChannelNameColor then
		return p15.ChatSettings.DefaultChannelNameColor
	else
		return Color3.fromRGB(35, 76, 142)
	end
end
function v_u_8.new(p17, p18, p19)
	-- upvalues: (copy) v_u_6
	local v_u_20 = setmetatable({}, v_u_6)
	v_u_20.Destroyed = false
	v_u_20.ChatWindow = p17
	v_u_20.ChatBar = p18
	v_u_20.ChatSettings = p19
	v_u_20.TextBox = p18:GetTextBox()
	v_u_20.MessageModeButton = p18:GetMessageModeTextButton()
	v_u_20.OriginalTeamText = ""
	v_u_20.TeamChatEntered = false
	v_u_20.MessageModeConnection = v_u_20.MessageModeButton.MouseButton1Click:connect(function()
		-- upvalues: (copy) v_u_20
		local v21 = v_u_20.TextBox.Text
		if string.sub(v21, 1, 1) == " " then
			v21 = string.sub(v21, 2)
		end
		v_u_20.ChatBar:ResetCustomState()
		v_u_20.ChatBar:SetTextBoxText(v21)
		v_u_20.ChatBar:CaptureFocus()
	end)
	v_u_20:EnterTeamChat()
	return v_u_20
end
function ProcessMessage(p22, p23, p24, p25)
	-- upvalues: (copy) v_u_8
	if p24.TargetChannel == "Team" then
		return
	elseif IsTeamCommand(p22) then
		return v_u_8.new(p23, p24, p25)
	else
		return nil
	end
end
return {
	[v7.KEY_COMMAND_PROCESSOR_TYPE] = v7.IN_PROGRESS_MESSAGE_PROCESSOR, 
	[v7.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}
