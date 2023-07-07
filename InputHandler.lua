-- decompiled by Sentinel (took 2.929018ms)
local v1 = {}
local v_u_2 = _G.HDAdminMain
local v_u_3 = Enum.UserInputType.MouseMovement
local v_u_4 = Enum.UserInputType.MouseButton1
local v_u_5 = Enum.UserInputType.Touch
v_u_2.chatting = false
v_u_2.userInputService.TextBoxFocused:connect(function()
	-- upvalues: (copy) v_u_2
	v_u_2.chatting = true
end)
v_u_2.userInputService.TextBoxFocusReleased:connect(function()
	-- upvalues: (copy) v_u_2
	v_u_2.chatting = false
end)
local v6 = { v_u_2.gui.MainFrame }
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local function v_u_13(p10, p11)
	-- upvalues: (ref) v_u_8, (ref) v_u_9
	local v12 = p10.Position - v_u_8
	p11.Position = UDim2.new(v_u_9.X.Scale, v_u_9.X.Offset + v12.X, v_u_9.Y.Scale, v_u_9.Y.Offset + v12.Y)
	if p11.AbsolutePosition.Y < 0 then
		p11.Position = p11.Position + UDim2.new(0, 0, 0, -p11.AbsolutePosition.Y)
	end
end
function v1.MakeFrameDraggable(_, p_u_14)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (ref) v_u_7, (ref) v_u_8, (ref) v_u_9
	p_u_14.DragBar.Drag.InputBegan:Connect(function(p_u_15)
		-- upvalues: (ref) v_u_4, (ref) v_u_5, (ref) v_u_7, (copy) p_u_14, (ref) v_u_8, (ref) v_u_9
		if p_u_15.UserInputType == v_u_4 or p_u_15.UserInputType == v_u_5 then
			v_u_7 = p_u_14
			v_u_8 = p_u_15.Position
			v_u_9 = p_u_14.Position
			p_u_15.Changed:Connect(function()
				-- upvalues: (copy) p_u_15, (ref) v_u_7
				if p_u_15.UserInputState == Enum.UserInputState.End then
					v_u_7 = nil
				end
			end)
		end
	end)
end
for _, v16 in pairs(v6) do
	v1:MakeFrameDraggable(v16)
end
local v_u_17 = { "laserEyes" }
local function v_u_20(p18)
	-- upvalues: (copy) v_u_2, (copy) v_u_17
	v_u_2.lastHitPosition = p18
	for _, v19 in pairs(v_u_17) do
		v_u_2:GetModule("cf"):ActivateClientCommand(v19)
	end
end
v_u_2.userInputService.InputChanged:Connect(function(p21, p22)
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (ref) v_u_7, (copy) v_u_2, (copy) v_u_13, (copy) v_u_20
	if (p21.UserInputType == v_u_3 or p21.UserInputType == v_u_5) and (not p22 or v_u_7) and v_u_2.mouseDown and ((v_u_2.lastHitPosition - p21.Position).magnitude < 150 or v_u_2.device ~= "Mobile") then
		if v_u_7 then
			v_u_13(p21, v_u_7)
		end
		v_u_20(p21.Position)
	end
end)
local v_u_23 = v_u_2.gui.CmdBar
local v_u_24 = v_u_23.SearchFrame.TextBox
local v_u_25 = {
	[Enum.KeyCode.Left] = true, 
	[Enum.KeyCode.Right] = true, 
	[Enum.KeyCode.Up] = true, 
	[Enum.KeyCode.Down] = true
}
local v_u_26 = {
	[Enum.KeyCode.Left] = "Left", 
	[Enum.KeyCode.Right] = "Right", 
	[Enum.KeyCode.Up] = "Forwards", 
	[Enum.KeyCode.Down] = "Backwards", 
	[Enum.KeyCode.A] = "Left", 
	[Enum.KeyCode.D] = "Right", 
	[Enum.KeyCode.W] = "Forwards", 
	[Enum.KeyCode.S] = "Backwards", 
	[Enum.KeyCode.Space] = "Up", 
	[Enum.KeyCode.R] = "Up", 
	[Enum.KeyCode.Q] = "Down", 
	[Enum.KeyCode.LeftControl] = "Down", 
	[Enum.KeyCode.F] = "Down"
}
v_u_2.movementKeysPressed = {}
v_u_2.userInputService.InputBegan:Connect(function(p27, p28)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (ref) v_u_7, (copy) v_u_2, (copy) v_u_20, (copy) v_u_23, (copy) v_u_24, (copy) v_u_26, (copy) v_u_25
	if (p27.UserInputType == v_u_4 or p27.UserInputType == v_u_5) and (not p28 or v_u_7) and not v_u_2.mouseDown then
		v_u_2.mouseDown = true
		v_u_20(p27.Position)
	elseif not v_u_2.chatting or v_u_23.Visible and #v_u_24.Text < 2 then
		local v29 = v_u_26[p27.KeyCode]
		if v29 then
			local v30 = v_u_2.movementKeysPressed
			table.insert(v30, v29)
		elseif p27.KeyCode == Enum.KeyCode.E then
			for v31, _ in pairs(v_u_2.commandSpeeds) do
				if v_u_2.commandsActive[v31] then
					v_u_2:GetModule("cf"):EndCommand(v31)
				else
					v_u_2:GetModule("cf"):ActivateClientCommand(v31)
				end
			end
		elseif p27.KeyCode == Enum.KeyCode.Quote or p27.KeyCode == Enum.KeyCode.Semicolon then
			v_u_2:GetModule("CmdBar"):ToggleBar(p27.KeyCode)
		end
	end
	if v_u_25[p27.KeyCode] then
		v_u_2:GetModule("CmdBar"):PressedArrowKey(p27.KeyCode)
	end
end)
v_u_2.userInputService.InputEnded:Connect(function(p32, _)
	-- upvalues: (copy) v_u_26, (copy) v_u_4, (copy) v_u_5, (copy) v_u_2
	local v33 = v_u_26[p32.KeyCode]
	if p32.UserInputType == v_u_4 or p32.UserInputType == v_u_5 then
		v_u_2.mouseDown = false
	elseif v33 then
		for v34, v35 in pairs(v_u_2.movementKeysPressed) do
			if v35 == v33 then
				table.remove(v_u_2.movementKeysPressed, v34)
			end
		end
	end
end)
local v36 = (v_u_2.player.Character or v_u_2.player.CharacterAdded:Wait()):WaitForChild("Humanoid")
local v37 = v_u_2:GetModule("Events")
if v_u_2.device ~= "Computer" then
	v37:New("DoubleJumped", v36).Event:Connect(function()
		-- upvalues: (copy) v_u_2
		for v38, _ in pairs(v_u_2.commandSpeeds) do
			if v_u_2.commandsActive[v38] then
				v_u_2:GetModule("cf"):EndCommand(v38)
			else
				v_u_2:GetModule("cf"):ActivateClientCommand(v38)
			end
		end
	end)
end
return v1
