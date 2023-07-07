-- decompiled by Sentinel (took 7.35483ms)
local v_u_1 = Vector3.new(0, 0, 0)
local v_u_2 = Enum.ContextActionPriority.High.Value
local v_u_3 = {
	0.10999999999999999, 
	0.30000000000000004, 
	0.4, 
	0.5, 
	0.6, 
	0.7, 
	0.75
}
local v_u_4 = #v_u_3
local v_u_5 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local v6 = game:GetService("Players")
local v_u_7 = game:GetService("GuiService")
local v_u_8 = game:GetService("UserInputService")
local v_u_9 = game:GetService("ContextActionService")
local v_u_10 = game:GetService("RunService")
local v_u_11 = game:GetService("TweenService")
local v12, v13 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickMoveOverButtons2")
end)
local v_u_14 = v12 and v13
local v15, v16 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserDynamicThumbstickSafeAreaUpdate")
end)
local v_u_17 = v15 and v16
local v_u_18 = v6.LocalPlayer
if not v_u_18 then
	v6:GetPropertyChangedSignal("LocalPlayer"):Wait()
	v_u_18 = v6.LocalPlayer
end
local v_u_19 = require(script.Parent:WaitForChild("BaseCharacterController"))
local v_u_20 = setmetatable({}, v_u_19)
v_u_20.__index = v_u_20
function v_u_20.new()
	-- upvalues: (copy) v_u_19, (copy) v_u_20
	local v21 = setmetatable(v_u_19.new(), v_u_20)
	v21.moveTouchObject = nil
	v21.moveTouchLockedIn = false
	v21.moveTouchFirstChanged = false
	v21.moveTouchStartPosition = nil
	v21.startImage = nil
	v21.endImage = nil
	v21.middleImages = {}
	v21.startImageFadeTween = nil
	v21.endImageFadeTween = nil
	v21.middleImageFadeTweens = {}
	v21.isFirstTouch = true
	v21.thumbstickFrame = nil
	v21.onRenderSteppedConn = nil
	v21.fadeInAndOutBalance = 0.5
	v21.fadeInAndOutHalfDuration = 0.3
	v21.hasFadedBackgroundInPortrait = false
	v21.hasFadedBackgroundInLandscape = false
	v21.tweenInAlphaStart = nil
	v21.tweenOutAlphaStart = nil
	return v21
end
function v_u_20.GetIsJumping(p22)
	p22.isJumping = false
	return p22.isJumping
end
function v_u_20.Enable(p23, p24, p25)
	-- upvalues: (ref) v_u_14, (copy) v_u_9
	if p24 == nil then
		return false
	end
	local v26 = p24 and true or false
	if p23.enabled == v26 then
		return true
	end
	if v26 then
		if not p23.thumbstickFrame then
			p23:Create(p25)
		end
		p23:BindContextActions()
	else
		if v_u_14 then
			p23:UnbindContextActions()
		else
			v_u_9:UnbindAction("DynamicThumbstickAction")
		end
		p23:OnInputEnded()
	end
	p23.enabled = v26
	p23.thumbstickFrame.Visible = v26
	return nil
end
function v_u_20.OnInputEnded(p27)
	-- upvalues: (copy) v_u_1
	p27.moveTouchObject = nil
	p27.moveVector = v_u_1
	p27:FadeThumbstick(false)
end
function v_u_20.FadeThumbstick(p28, p29)
	-- upvalues: (copy) v_u_11, (copy) v_u_5, (copy) v_u_3
	if p29 or not p28.moveTouchObject then
		if p28.isFirstTouch then
			return
		else
			if p28.startImageFadeTween then
				p28.startImageFadeTween:Cancel()
			end
			if p28.endImageFadeTween then
				p28.endImageFadeTween:Cancel()
			end
			for v30 = 1, #p28.middleImages do
				if p28.middleImageFadeTweens[v30] then
					p28.middleImageFadeTweens[v30]:Cancel()
				end
			end
			if p29 then
				p28.startImageFadeTween = v_u_11:Create(p28.startImage, v_u_5, {
					["ImageTransparency"] = 0
				})
				p28.startImageFadeTween:Play()
				p28.endImageFadeTween = v_u_11:Create(p28.endImage, v_u_5, {
					["ImageTransparency"] = 0.2
				})
				p28.endImageFadeTween:Play()
				for v31 = 1, #p28.middleImages do
					p28.middleImageFadeTweens[v31] = v_u_11:Create(p28.middleImages[v31], v_u_5, {
						["ImageTransparency"] = v_u_3[v31]
					})
					p28.middleImageFadeTweens[v31]:Play()
				end
			else
				p28.startImageFadeTween = v_u_11:Create(p28.startImage, v_u_5, {
					["ImageTransparency"] = 1
				})
				p28.startImageFadeTween:Play()
				p28.endImageFadeTween = v_u_11:Create(p28.endImage, v_u_5, {
					["ImageTransparency"] = 1
				})
				p28.endImageFadeTween:Play()
				for v32 = 1, #p28.middleImages do
					p28.middleImageFadeTweens[v32] = v_u_11:Create(p28.middleImages[v32], v_u_5, {
						["ImageTransparency"] = 1
					})
					p28.middleImageFadeTweens[v32]:Play()
				end
			end
		end
	else
		return
	end
end
function v_u_20.FadeThumbstickFrame(p33, p34, p35)
	p33.fadeInAndOutHalfDuration = p34 * 0.5
	p33.fadeInAndOutBalance = p35
	p33.tweenInAlphaStart = tick()
end
function v_u_20.InputInFrame(p36, p37)
	local v38 = p36.thumbstickFrame.AbsolutePosition
	local v39 = v38 + p36.thumbstickFrame.AbsoluteSize
	local v40 = p37.Position
	return v40.X >= v38.X and v40.Y >= v38.Y and v40.X <= v39.X and v40.Y <= v39.Y
end
function v_u_20.DoFadeInBackground(p41)
	-- upvalues: (ref) v_u_18
	local v42 = v_u_18:FindFirstChildOfClass("PlayerGui")
	local v43 = false
	if v42 then
		if v42.CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeLeft or v42.CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeRight then
			v43 = p41.hasFadedBackgroundInLandscape
			p41.hasFadedBackgroundInLandscape = true
		elseif v42.CurrentScreenOrientation == Enum.ScreenOrientation.Portrait then
			v43 = p41.hasFadedBackgroundInPortrait
			p41.hasFadedBackgroundInPortrait = true
		end
	end
	if not v43 then
		p41.fadeInAndOutHalfDuration = 0.3
		p41.fadeInAndOutBalance = 0.5
		p41.tweenInAlphaStart = tick()
	end
end
function v_u_20.DoMove(p44, p45)
	-- upvalues: (copy) v_u_1
	local v46
	if p45.Magnitude < p44.radiusOfDeadZone then
		v46 = v_u_1
	else
		local v47 = p45.Unit * (1 - math.max(0, (p44.radiusOfMaxSpeed - p45.Magnitude) / p44.radiusOfMaxSpeed))
		v46 = Vector3.new(v47.X, 0, v47.Y)
	end
	p44.moveVector = v46
end
function v_u_20.LayoutMiddleImages(p48, p49, p50)
	-- upvalues: (copy) v_u_4
	local v51 = p48.thumbstickSize / 2 + p48.middleSize
	local v52 = p50 - p49
	local v53 = v52.Magnitude - p48.thumbstickRingSize / 2 - p48.middleSize
	local v54 = v52.Unit
	local v55 = p48.middleSpacing
	if p48.middleSpacing * v_u_4 < v53 then
		v55 = v53 / v_u_4
	end
	for v56 = 1, v_u_4 do
		local v57 = p48.middleImages[v56]
		local v58 = v51 + v55 * (v56 - 1)
		if v51 + v55 * (v56 - 2) < v53 then
			local v59 = p50 - v54 * v58
			local v60 = math.clamp(1 - (v58 - v53) / v55, 0, 1)
			v57.Visible = true
			v57.Position = UDim2.new(0, v59.X, 0, v59.Y)
			v57.Size = UDim2.new(0, p48.middleSize * v60, 0, p48.middleSize * v60)
		else
			v57.Visible = false
		end
	end
end
function v_u_20.MoveStick(p61, p62)
	local v63 = Vector2.new(p62.X, p62.Y) - p61.thumbstickFrame.AbsolutePosition
	p61.endImage.Position = UDim2.new(0, v63.X, 0, v63.Y)
	p61:LayoutMiddleImages(Vector2.new(p61.moveTouchStartPosition.X, p61.moveTouchStartPosition.Y) - p61.thumbstickFrame.AbsolutePosition, v63)
end
function v_u_20.BindContextActions(p_u_64)
	-- upvalues: (copy) v_u_11, (ref) v_u_14, (copy) v_u_9, (copy) v_u_2, (copy) v_u_8
	local function v_u_67(p65)
		-- upvalues: (copy) p_u_64, (ref) v_u_11
		if p_u_64.moveTouchObject then
			return Enum.ContextActionResult.Pass
		end
		if not p_u_64:InputInFrame(p65) then
			return Enum.ContextActionResult.Pass
		end
		if p_u_64.isFirstTouch then
			p_u_64.isFirstTouch = false
			local v66 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
			v_u_11:Create(p_u_64.startImage, v66, {
				["Size"] = UDim2.new(0, 0, 0, 0)
			}):Play()
			v_u_11:Create(p_u_64.endImage, v66, {
				["Size"] = UDim2.new(0, p_u_64.thumbstickSize, 0, p_u_64.thumbstickSize), 
				["ImageColor3"] = Color3.new(0, 0, 0)
			}):Play()
		end
		p_u_64.moveTouchLockedIn = false
		p_u_64.moveTouchObject = p65
		p_u_64.moveTouchStartPosition = p65.Position
		p_u_64.moveTouchFirstChanged = true
		p_u_64:DoFadeInBackground()
		return Enum.ContextActionResult.Pass
	end
	local function v_u_71(p68)
		-- upvalues: (copy) p_u_64
		if p68 ~= p_u_64.moveTouchObject then
			return Enum.ContextActionResult.Pass
		end
		if p_u_64.moveTouchFirstChanged then
			p_u_64.moveTouchFirstChanged = false
			local v69 = Vector2.new(p68.Position.X - p_u_64.thumbstickFrame.AbsolutePosition.X, p68.Position.Y - p_u_64.thumbstickFrame.AbsolutePosition.Y)
			p_u_64.startImage.Visible = true
			p_u_64.startImage.Position = UDim2.new(0, v69.X, 0, v69.Y)
			p_u_64.endImage.Visible = true
			p_u_64.endImage.Position = p_u_64.startImage.Position
			p_u_64:FadeThumbstick(true)
			p_u_64:MoveStick(p68.Position)
		end
		p_u_64.moveTouchLockedIn = true
		local v70 = Vector2.new(p68.Position.X - p_u_64.moveTouchStartPosition.X, p68.Position.Y - p_u_64.moveTouchStartPosition.Y)
		if 0 < math.abs(v70.X) or 0 < math.abs(v70.Y) then
			p_u_64:DoMove(v70)
			p_u_64:MoveStick(p68.Position)
		end
		return Enum.ContextActionResult.Sink
	end
	v_u_9:BindActionAtPriority("DynamicThumbstickAction", function(_, p72, p73)
		-- upvalues: (copy) v_u_67, (ref) v_u_14, (copy) p_u_64, (copy) v_u_71
		if p72 == Enum.UserInputState.Begin then
			return v_u_67(p73)
		elseif p72 == Enum.UserInputState.Change then
			if v_u_14 then
				if p73 == p_u_64.moveTouchObject then
					return Enum.ContextActionResult.Sink
				else
					return Enum.ContextActionResult.Pass
				end
			else
				return v_u_71(p73)
			end
		else
			if p72 == Enum.UserInputState.End then
				if p73 == p_u_64.moveTouchObject then
					p_u_64:OnInputEnded()
					if p_u_64.moveTouchLockedIn then
						return Enum.ContextActionResult.Sink
					end
				end
				return Enum.ContextActionResult.Pass
			end
			if p72 == Enum.UserInputState.Cancel then
				p_u_64:OnInputEnded()
			end
			return
		end
	end, false, v_u_2, Enum.UserInputType.Touch)
	if v_u_14 then
		p_u_64.TouchMovedCon = v_u_8.TouchMoved:Connect(function(p74, _)
			-- upvalues: (copy) v_u_71
			v_u_71(p74)
		end)
	end
end
function v_u_20.UnbindContextActions(p75)
	-- upvalues: (copy) v_u_9
	v_u_9:UnbindAction("DynamicThumbstickAction")
	if p75.TouchMovedCon then
		p75.TouchMovedCon:Disconnect()
	end
end
function v_u_20.Create(p_u_76, p77)
	-- upvalues: (ref) v_u_17, (copy) v_u_4, (copy) v_u_3, (copy) v_u_10, (copy) v_u_8, (copy) v_u_7, (ref) v_u_18
	if p_u_76.thumbstickFrame then
		p_u_76.thumbstickFrame:Destroy()
		p_u_76.thumbstickFrame = nil
		if p_u_76.onRenderSteppedConn then
			p_u_76.onRenderSteppedConn:Disconnect()
			p_u_76.onRenderSteppedConn = nil
		end
	end
	p_u_76.thumbstickSize = 45
	p_u_76.thumbstickRingSize = 20
	p_u_76.middleSize = 10
	p_u_76.middleSpacing = p_u_76.middleSize + 4
	p_u_76.radiusOfDeadZone = 2
	p_u_76.radiusOfMaxSpeed = 20
	local v78 = p77.AbsoluteSize
	if 500 < math.min(v78.X, v78.Y) then
		p_u_76.thumbstickSize = p_u_76.thumbstickSize * 2
		p_u_76.thumbstickRingSize = p_u_76.thumbstickRingSize * 2
		p_u_76.middleSize = p_u_76.middleSize * 2
		p_u_76.middleSpacing = p_u_76.middleSpacing * 2
		p_u_76.radiusOfDeadZone = p_u_76.radiusOfDeadZone * 2
		p_u_76.radiusOfMaxSpeed = p_u_76.radiusOfMaxSpeed * 2
	end
	local v_u_79 = v_u_17 and 100 or 0
	local function v_u_81(p80)
		-- upvalues: (copy) p_u_76, (copy) v_u_79
		if p80 then
			p_u_76.thumbstickFrame.Size = UDim2.new(1, v_u_79, 0.4, v_u_79)
			p_u_76.thumbstickFrame.Position = UDim2.new(0, -v_u_79, 0.6, 0)
		else
			p_u_76.thumbstickFrame.Size = UDim2.new(0.4, v_u_79, 0.6666666666666666, v_u_79)
			p_u_76.thumbstickFrame.Position = UDim2.new(0, -v_u_79, 0.3333333333333333, 0)
		end
	end
	p_u_76.thumbstickFrame = Instance.new("Frame")
	p_u_76.thumbstickFrame.BorderSizePixel = 0
	p_u_76.thumbstickFrame.Name = "DynamicThumbstickFrame"
	p_u_76.thumbstickFrame.Visible = false
	p_u_76.thumbstickFrame.BackgroundTransparency = 1
	p_u_76.thumbstickFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	p_u_76.thumbstickFrame.Active = false
	v_u_81(false)
	p_u_76.startImage = Instance.new("ImageLabel")
	p_u_76.startImage.Name = "ThumbstickStart"
	p_u_76.startImage.Visible = true
	p_u_76.startImage.BackgroundTransparency = 1
	p_u_76.startImage.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
	p_u_76.startImage.ImageRectOffset = Vector2.new(1, 1)
	p_u_76.startImage.ImageRectSize = Vector2.new(144, 144)
	p_u_76.startImage.ImageColor3 = Color3.new(0, 0, 0)
	p_u_76.startImage.AnchorPoint = Vector2.new(0.5, 0.5)
	p_u_76.startImage.Position = UDim2.new(0, p_u_76.thumbstickRingSize * 3.3 + v_u_79, 1, -p_u_76.thumbstickRingSize * 2.8 - v_u_79)
	p_u_76.startImage.Size = UDim2.new(0, p_u_76.thumbstickRingSize * 3.7, 0, p_u_76.thumbstickRingSize * 3.7)
	p_u_76.startImage.ZIndex = 10
	p_u_76.startImage.Parent = p_u_76.thumbstickFrame
	p_u_76.endImage = Instance.new("ImageLabel")
	p_u_76.endImage.Name = "ThumbstickEnd"
	p_u_76.endImage.Visible = true
	p_u_76.endImage.BackgroundTransparency = 1
	p_u_76.endImage.Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
	p_u_76.endImage.ImageRectOffset = Vector2.new(1, 1)
	p_u_76.endImage.ImageRectSize = Vector2.new(144, 144)
	p_u_76.endImage.AnchorPoint = Vector2.new(0.5, 0.5)
	p_u_76.endImage.Position = p_u_76.startImage.Position
	p_u_76.endImage.Size = UDim2.new(0, p_u_76.thumbstickSize * 0.8, 0, p_u_76.thumbstickSize * 0.8)
	p_u_76.endImage.ZIndex = 10
	p_u_76.endImage.Parent = p_u_76.thumbstickFrame
	for v82 = 1, v_u_4 do
		p_u_76.middleImages[v82] = Instance.new("ImageLabel")
		p_u_76.middleImages[v82].Name = "ThumbstickMiddle"
		p_u_76.middleImages[v82].Visible = false
		p_u_76.middleImages[v82].BackgroundTransparency = 1
		p_u_76.middleImages[v82].Image = "rbxasset://textures/ui/Input/TouchControlsSheetV2.png"
		p_u_76.middleImages[v82].ImageRectOffset = Vector2.new(1, 1)
		p_u_76.middleImages[v82].ImageRectSize = Vector2.new(144, 144)
		p_u_76.middleImages[v82].ImageTransparency = v_u_3[v82]
		p_u_76.middleImages[v82].AnchorPoint = Vector2.new(0.5, 0.5)
		p_u_76.middleImages[v82].ZIndex = 9
		p_u_76.middleImages[v82].Parent = p_u_76.thumbstickFrame
	end
	local v_u_83 = nil
	local function v87()
		-- upvalues: (ref) v_u_83, (copy) v_u_81
		if v_u_83 then
			v_u_83:Disconnect()
			v_u_83 = nil
		end
		local v_u_84 = workspace.CurrentCamera
		if v_u_84 then
			v_u_83 = v_u_84:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				-- upvalues: (copy) v_u_84, (ref) v_u_81
				local v85 = v_u_84.ViewportSize
				v_u_81(v85.X < v85.Y)
			end)
			local v86 = v_u_84.ViewportSize
			v_u_81(v86.X < v86.Y)
		end
	end
	workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v87)
	if workspace.CurrentCamera then
		v87()
	end
	p_u_76.moveTouchStartPosition = nil
	p_u_76.startImageFadeTween = nil
	p_u_76.endImageFadeTween = nil
	p_u_76.middleImageFadeTweens = {}
	p_u_76.onRenderSteppedConn = v_u_10.RenderStepped:Connect(function()
		-- upvalues: (copy) p_u_76
		if p_u_76.tweenInAlphaStart == nil then
			if p_u_76.tweenOutAlphaStart ~= nil then
				local v88 = tick() - p_u_76.tweenOutAlphaStart
				local v89 = p_u_76.fadeInAndOutHalfDuration * 2 - p_u_76.fadeInAndOutHalfDuration * 2 * p_u_76.fadeInAndOutBalance
				p_u_76.thumbstickFrame.BackgroundTransparency = 0.65 + 0.35 * math.min(v88 / v89, 1)
				if v89 < v88 then
					p_u_76.tweenOutAlphaStart = nil
				end
			end
		else
			local v90 = tick() - p_u_76.tweenInAlphaStart
			local v91 = p_u_76.fadeInAndOutHalfDuration * 2 * p_u_76.fadeInAndOutBalance
			p_u_76.thumbstickFrame.BackgroundTransparency = 1 - 0.35 * math.min(v90 / v91, 1)
			if v91 < v90 then
				p_u_76.tweenOutAlphaStart = tick()
				p_u_76.tweenInAlphaStart = nil
				return
			end
		end
	end)
	p_u_76.onTouchEndedConn = v_u_8.TouchEnded:connect(function(p92)
		-- upvalues: (copy) p_u_76
		if p92 == p_u_76.moveTouchObject then
			p_u_76:OnInputEnded()
		end
	end)
	v_u_7.MenuOpened:connect(function()
		-- upvalues: (copy) p_u_76
		if p_u_76.moveTouchObject then
			p_u_76:OnInputEnded()
		end
	end)
	local v_u_93 = v_u_18:FindFirstChildOfClass("PlayerGui")
	while not v_u_93 do
		v_u_18.ChildAdded:wait()
		v_u_93 = v_u_18:FindFirstChildOfClass("PlayerGui")
	end
	local v_u_94 = nil
	local v_u_95 = v_u_93.CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeLeft and true or v_u_93.CurrentScreenOrientation == Enum.ScreenOrientation.LandscapeRight
	v_u_94 = v_u_93:GetPropertyChangedSignal("CurrentScreenOrientation"):Connect(function()
		-- upvalues: (copy) v_u_95, (ref) v_u_93, (ref) v_u_94, (copy) p_u_76
		if v_u_95 and v_u_93.CurrentScreenOrientation == Enum.ScreenOrientation.Portrait or not v_u_95 and v_u_93.CurrentScreenOrientation ~= Enum.ScreenOrientation.Portrait then
			v_u_94:disconnect()
			p_u_76.fadeInAndOutHalfDuration = 2.5
			p_u_76.fadeInAndOutBalance = 0.05
			p_u_76.tweenInAlphaStart = tick()
			if v_u_95 then
				p_u_76.hasFadedBackgroundInPortrait = true
				return
			end
			p_u_76.hasFadedBackgroundInLandscape = true
		end
	end)
	p_u_76.thumbstickFrame.Parent = p77
	if game:IsLoaded() then
		p_u_76.fadeInAndOutHalfDuration = 2.5
		p_u_76.fadeInAndOutBalance = 0.05
		p_u_76.tweenInAlphaStart = tick()
	else
		coroutine.wrap(function()
			-- upvalues: (copy) p_u_76
			game.Loaded:Wait()
			p_u_76.fadeInAndOutHalfDuration = 2.5
			p_u_76.fadeInAndOutBalance = 0.05
			p_u_76.tweenInAlphaStart = tick()
		end)()
	end
end
return v_u_20
