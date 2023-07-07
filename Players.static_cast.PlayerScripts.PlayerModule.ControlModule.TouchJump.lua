-- decompiled by Sentinel (took 2.7211ms)
local v_u_1 = game:GetService("Players")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = require(script.Parent:WaitForChild("BaseCharacterController"))
local v_u_4 = setmetatable({}, v_u_3)
v_u_4.__index = v_u_4
function v_u_4.new()
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v5 = setmetatable(v_u_3.new(), v_u_4)
	v5.parentUIFrame = nil
	v5.jumpButton = nil
	v5.characterAddedConn = nil
	v5.humanoidStateEnabledChangedConn = nil
	v5.humanoidJumpPowerConn = nil
	v5.humanoidParentConn = nil
	v5.externallyEnabled = false
	v5.jumpPower = 0
	v5.jumpStateEnabled = true
	v5.isJumping = false
	v5.humanoid = nil
	return v5
end
function v_u_4.EnableButton(p6, p7)
	-- upvalues: (copy) v_u_1
	if p7 then
		if not p6.jumpButton then
			p6:Create()
		end
		local v8 = v_u_1.LocalPlayer.Character
		if v8 then
			v8 = v_u_1.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		end
		if v8 and p6.externallyEnabled and p6.externallyEnabled and 0 < v8.JumpPower then
			p6.jumpButton.Visible = true
			return
		end
	else
		p6.jumpButton.Visible = false
		p6.isJumping = false
		p6.jumpButton.ImageRectOffset = Vector2.new(1, 146)
	end
end
function v_u_4.UpdateEnabled(p9)
	if 0 < p9.jumpPower and p9.jumpStateEnabled then
		p9:EnableButton(true)
	else
		p9:EnableButton(false)
	end
end
function v_u_4.HumanoidChanged(p10, p11)
	-- upvalues: (copy) v_u_1
	local v12 = v_u_1.LocalPlayer.Character
	if v12 then
		v12 = v_u_1.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	end
	if v12 then
		if p11 == "JumpPower" then
			p10.jumpPower = v12.JumpPower
			p10:UpdateEnabled()
			return
		end
		if p11 == "Parent" and not v12.Parent then
			p10.humanoidChangeConn:Disconnect()
		end
	end
end
function v_u_4.HumanoidStateEnabledChanged(p13, p14, p15)
	if p14 == Enum.HumanoidStateType.Jumping then
		p13.jumpStateEnabled = p15
		p13:UpdateEnabled()
	end
end
function v_u_4.CharacterAdded(p_u_16, p17)
	if p_u_16.humanoidChangeConn then
		p_u_16.humanoidChangeConn:Disconnect()
		p_u_16.humanoidChangeConn = nil
	end
	p_u_16.humanoid = p17:FindFirstChildOfClass("Humanoid")
	while not p_u_16.humanoid do
		p17.ChildAdded:wait()
		p_u_16.humanoid = p17:FindFirstChildOfClass("Humanoid")
	end
	p_u_16.humanoidJumpPowerConn = p_u_16.humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function()
		-- upvalues: (copy) p_u_16
		p_u_16.jumpPower = p_u_16.humanoid.JumpPower
		p_u_16:UpdateEnabled()
	end)
	p_u_16.humanoidParentConn = p_u_16.humanoid:GetPropertyChangedSignal("Parent"):Connect(function()
		-- upvalues: (copy) p_u_16
		if not p_u_16.humanoid.Parent then
			p_u_16.humanoidJumpPowerConn:Disconnect()
			p_u_16.humanoidJumpPowerConn = nil
			p_u_16.humanoidParentConn:Disconnect()
			p_u_16.humanoidParentConn = nil
		end
	end)
	p_u_16.humanoidStateEnabledChangedConn = p_u_16.humanoid.StateEnabledChanged:Connect(function(p18, p19)
		-- upvalues: (copy) p_u_16
		p_u_16:HumanoidStateEnabledChanged(p18, p19)
	end)
	p_u_16.jumpPower = p_u_16.humanoid.JumpPower
	p_u_16.jumpStateEnabled = p_u_16.humanoid:GetStateEnabled(Enum.HumanoidStateType.Jumping)
	p_u_16:UpdateEnabled()
end
function v_u_4.SetupCharacterAddedFunction(p_u_20)
	-- upvalues: (copy) v_u_1
	p_u_20.characterAddedConn = v_u_1.LocalPlayer.CharacterAdded:Connect(function(p21)
		-- upvalues: (copy) p_u_20
		p_u_20:CharacterAdded(p21)
	end)
	if v_u_1.LocalPlayer.Character then
		p_u_20:CharacterAdded(v_u_1.LocalPlayer.Character)
	end
end
function v_u_4.Enable(p22, p23, p24)
	if p24 then
		p22.parentUIFrame = p24
	end
	p22.externallyEnabled = p23
	p22:EnableButton(p23)
end
function v_u_4.Create(p_u_25)
	-- upvalues: (copy) v_u_2
	if p_u_25.parentUIFrame then
		if p_u_25.jumpButton then
			p_u_25.jumpButton:Destroy()
			p_u_25.jumpButton = nil
		end
		local v26 = math.min(p_u_25.parentUIFrame.AbsoluteSize.x, p_u_25.parentUIFrame.AbsoluteSize.y) <= 500
		local v27 = v26 and 70 or 120
		p_u_25.jumpButton = Instance.new("ImageButton")
		p_u_25.jumpButton.Name = "JumpButton"
		p_u_25.jumpButton.Visible = false
		p_u_25.jumpButton.BackgroundTransparency = 1
		p_u_25.jumpButton.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
		p_u_25.jumpButton.ImageRectOffset = Vector2.new(1, 146)
		p_u_25.jumpButton.ImageRectSize = Vector2.new(144, 144)
		p_u_25.jumpButton.Size = UDim2.new(0, v27, 0, v27)
		p_u_25.jumpButton.Position = v26 and UDim2.new(1, -(v27 * 1.5 - 10), 1, -v27 - 20) or UDim2.new(1, -(v27 * 1.5 - 10), 1, -v27 * 1.75)
		local v_u_28 = nil
		p_u_25.jumpButton.InputBegan:connect(function(p29)
			-- upvalues: (ref) v_u_28, (copy) p_u_25
			if not v_u_28 and p29.UserInputType == Enum.UserInputType.Touch and p29.UserInputState == Enum.UserInputState.Begin then
				v_u_28 = p29
				p_u_25.jumpButton.ImageRectOffset = Vector2.new(146, 146)
				p_u_25.isJumping = true
			end
		end)
		p_u_25.jumpButton.InputEnded:connect(function(p30)
			-- upvalues: (ref) v_u_28, (copy) p_u_25
			if p30 == v_u_28 then
				v_u_28 = nil
				p_u_25.isJumping = false
				p_u_25.jumpButton.ImageRectOffset = Vector2.new(1, 146)
			end
		end)
		v_u_2.MenuOpened:connect(function()
			-- upvalues: (ref) v_u_28, (copy) p_u_25
			if v_u_28 then
				v_u_28 = nil
				p_u_25.isJumping = false
				p_u_25.jumpButton.ImageRectOffset = Vector2.new(1, 146)
			end
		end)
		if not p_u_25.characterAddedConn then
			p_u_25:SetupCharacterAddedFunction()
		end
		p_u_25.jumpButton.Parent = p_u_25.parentUIFrame
	end
end
return v_u_4
