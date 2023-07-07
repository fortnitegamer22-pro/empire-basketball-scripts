-- decompiled by Sentinel (took 3.35442ms)
game:GetService("Players")
local v_u_1 = game:GetService("GuiService")
local v_u_2 = game:GetService("UserInputService")
UserSettings():GetService("UserGameSettings")
local v3, v4 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserClampClassicThumbstick")
end)
local v_u_5 = v3 and v4
local v_u_6 = Vector3.new(0, 0, 0)
local v_u_7 = require(script.Parent:WaitForChild("BaseCharacterController"))
local v_u_8 = setmetatable({}, v_u_7)
v_u_8.__index = v_u_8
function v_u_8.new()
	-- upvalues: (copy) v_u_7, (copy) v_u_8
	local v9 = setmetatable(v_u_7.new(), v_u_8)
	v9.isFollowStick = false
	v9.thumbstickFrame = nil
	v9.moveTouchObject = nil
	v9.onTouchMovedConn = nil
	v9.onTouchEndedConn = nil
	v9.screenPos = nil
	v9.stickImage = nil
	v9.thumbstickSize = nil
	return v9
end
function v_u_8.Enable(p10, p11, p12)
	-- upvalues: (copy) v_u_6
	if p11 == nil then
		return false
	end
	local v13 = p11 and true or false
	if p10.enabled == v13 then
		return true
	end
	p10.moveVector = v_u_6
	p10.isJumping = false
	if v13 then
		if not p10.thumbstickFrame then
			p10:Create(p12)
		end
		p10.thumbstickFrame.Visible = true
	else
		p10.thumbstickFrame.Visible = false
		p10:OnInputEnded()
	end
	p10.enabled = v13
end
function v_u_8.OnInputEnded(p14)
	-- upvalues: (copy) v_u_6
	p14.thumbstickFrame.Position = p14.screenPos
	p14.stickImage.Position = UDim2.new(0, p14.thumbstickFrame.Size.X.Offset / 2 - p14.thumbstickSize / 4, 0, p14.thumbstickFrame.Size.Y.Offset / 2 - p14.thumbstickSize / 4)
	p14.moveVector = v_u_6
	p14.isJumping = false
	p14.thumbstickFrame.Position = p14.screenPos
	p14.moveTouchObject = nil
end
function v_u_8.Create(p_u_15, p16)
	-- upvalues: (ref) v_u_5, (copy) v_u_2, (copy) v_u_1
	if p_u_15.thumbstickFrame then
		p_u_15.thumbstickFrame:Destroy()
		p_u_15.thumbstickFrame = nil
		if p_u_15.onTouchMovedConn then
			p_u_15.onTouchMovedConn:Disconnect()
			p_u_15.onTouchMovedConn = nil
		end
		if p_u_15.onTouchEndedConn then
			p_u_15.onTouchEndedConn:Disconnect()
			p_u_15.onTouchEndedConn = nil
		end
	end
	local v17 = math.min(p16.AbsoluteSize.X, p16.AbsoluteSize.Y) <= 500
	p_u_15.thumbstickSize = v17 and 70 or 120
	p_u_15.screenPos = v17 and UDim2.new(0, p_u_15.thumbstickSize / 2 - 10, 1, -p_u_15.thumbstickSize - 20) or UDim2.new(0, p_u_15.thumbstickSize / 2, 1, -p_u_15.thumbstickSize * 1.75)
	p_u_15.thumbstickFrame = Instance.new("Frame")
	p_u_15.thumbstickFrame.Name = "ThumbstickFrame"
	p_u_15.thumbstickFrame.Active = true
	p_u_15.thumbstickFrame.Visible = false
	p_u_15.thumbstickFrame.Size = UDim2.new(0, p_u_15.thumbstickSize, 0, p_u_15.thumbstickSize)
	p_u_15.thumbstickFrame.Position = p_u_15.screenPos
	p_u_15.thumbstickFrame.BackgroundTransparency = 1
	local v18 = Instance.new("ImageLabel")
	v18.Name = "OuterImage"
	v18.Image = "rbxasset://textures/ui/TouchControlsSheet.png"
	v18.ImageRectOffset = Vector2.new()
	v18.ImageRectSize = Vector2.new(220, 220)
	v18.BackgroundTransparency = 1
	v18.Size = UDim2.new(0, p_u_15.thumbstickSize, 0, p_u_15.thumbstickSize)
	v18.Position = UDim2.new(0, 0, 0, 0)
	v18.Parent = p_u_15.thumbstickFrame
	p_u_15.stickImage = Instance.new("ImageLabel")
	p_u_15.stickImage.Name = "StickImage"
	p_u_15.stickImage.Image = "rbxasset://textures/ui/TouchControlsSheet.png"
	p_u_15.stickImage.ImageRectOffset = Vector2.new(220, 0)
	p_u_15.stickImage.ImageRectSize = Vector2.new(111, 111)
	p_u_15.stickImage.BackgroundTransparency = 1
	p_u_15.stickImage.Size = UDim2.new(0, p_u_15.thumbstickSize / 2, 0, p_u_15.thumbstickSize / 2)
	p_u_15.stickImage.Position = UDim2.new(0, p_u_15.thumbstickSize / 2 - p_u_15.thumbstickSize / 4, 0, p_u_15.thumbstickSize / 2 - p_u_15.thumbstickSize / 4)
	p_u_15.stickImage.ZIndex = 2
	p_u_15.stickImage.Parent = p_u_15.thumbstickFrame
	local v_u_19 = nil
	local function v_u_25(p20)
		-- upvalues: (copy) p_u_15, (ref) v_u_5
		local v21 = p20 / p_u_15.thumbstickSize / 2
		local v22 = v21.magnitude
		local v23
		if v22 < 0.05 then
			v23 = Vector3.new()
		else
			local v24
			if v_u_5 then
				v24 = v21.unit * math.min(1, (v22 - 0.05) / 0.95)
			else
				v24 = v21.unit * (v22 - 0.05) / 0.95
			end
			v23 = Vector3.new(v24.X, 0, v24.Y)
		end
		p_u_15.moveVector = v23
	end
	local function v_u_31(p26)
		-- upvalues: (ref) v_u_19, (copy) p_u_15
		local v27 = Vector2.new(p26.X - v_u_19.X, p26.Y - v_u_19.Y)
		local v28 = v27.magnitude
		local v29 = p_u_15.thumbstickFrame.AbsoluteSize.X / 2
		if p_u_15.isFollowStick and v29 < v28 then
			local v30 = v27.unit * v29
			p_u_15.thumbstickFrame.Position = UDim2.new(0, p26.X - p_u_15.thumbstickFrame.AbsoluteSize.X / 2 - v30.X, 0, p26.Y - p_u_15.thumbstickFrame.AbsoluteSize.Y / 2 - v30.Y)
		else
			v27 = v27.unit * math.min(v28, v29)
		end
		p_u_15.stickImage.Position = UDim2.new(0, v27.X + p_u_15.stickImage.AbsoluteSize.X / 2, 0, v27.Y + p_u_15.stickImage.AbsoluteSize.Y / 2)
	end
	p_u_15.thumbstickFrame.InputBegan:Connect(function(p32)
		-- upvalues: (copy) p_u_15, (ref) v_u_19
		if not p_u_15.moveTouchObject and p32.UserInputType == Enum.UserInputType.Touch and p32.UserInputState == Enum.UserInputState.Begin then
			p_u_15.moveTouchObject = p32
			p_u_15.thumbstickFrame.Position = UDim2.new(0, p32.Position.X - p_u_15.thumbstickFrame.Size.X.Offset / 2, 0, p32.Position.Y - p_u_15.thumbstickFrame.Size.Y.Offset / 2)
			v_u_19 = Vector2.new(p_u_15.thumbstickFrame.AbsolutePosition.X + p_u_15.thumbstickFrame.AbsoluteSize.X / 2, p_u_15.thumbstickFrame.AbsolutePosition.Y + p_u_15.thumbstickFrame.AbsoluteSize.Y / 2)
			Vector2.new(p32.Position.X - v_u_19.X, p32.Position.Y - v_u_19.Y)
		end
	end)
	p_u_15.onTouchMovedConn = v_u_2.TouchMoved:Connect(function(p33, _)
		-- upvalues: (copy) p_u_15, (ref) v_u_19, (copy) v_u_25, (copy) v_u_31
		if p33 == p_u_15.moveTouchObject then
			v_u_19 = Vector2.new(p_u_15.thumbstickFrame.AbsolutePosition.X + p_u_15.thumbstickFrame.AbsoluteSize.X / 2, p_u_15.thumbstickFrame.AbsolutePosition.Y + p_u_15.thumbstickFrame.AbsoluteSize.Y / 2)
			v_u_25((Vector2.new(p33.Position.X - v_u_19.X, p33.Position.Y - v_u_19.Y)))
			v_u_31(p33.Position)
		end
	end)
	p_u_15.onTouchEndedConn = v_u_2.TouchEnded:Connect(function(p34, _)
		-- upvalues: (copy) p_u_15
		if p34 == p_u_15.moveTouchObject then
			p_u_15:OnInputEnded()
		end
	end)
	v_u_1.MenuOpened:Connect(function()
		-- upvalues: (copy) p_u_15
		if p_u_15.moveTouchObject then
			p_u_15:OnInputEnded()
		end
	end)
	p_u_15.thumbstickFrame.Parent = p16
end
return v_u_8
