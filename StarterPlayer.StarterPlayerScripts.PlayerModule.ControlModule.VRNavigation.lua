-- decompiled by Sentinel (took 5.933121ms)
local v_u_1 = game:GetService("VRService")
local v_u_2 = game:GetService("UserInputService")
local v_u_3 = game:GetService("RunService")
local v4 = game:GetService("Players")
local v_u_5 = game:GetService("PathfindingService")
local v_u_6 = game:GetService("ContextActionService")
local v_u_7 = game:GetService("StarterGui")
local v_u_8 = nil
local v_u_9 = v4.LocalPlayer
local v_u_10 = Vector3.new(0, 0, 0)
local v_u_11 = Vector3.new(1, 0, 1)
local v_u_12 = Instance.new("BindableEvent")
v_u_12.Name = "MovementUpdate"
v_u_12.Parent = script
coroutine.wrap(function()
	-- upvalues: (ref) v_u_8
	local v13 = script.Parent:WaitForChild("PathDisplay")
	if v13 then
		v_u_8 = require(v13)
	end
end)()
local v_u_14 = require(script.Parent:WaitForChild("BaseCharacterController"))
local v_u_15 = setmetatable({}, v_u_14)
v_u_15.__index = v_u_15
function v_u_15.new(p16)
	-- upvalues: (copy) v_u_14, (copy) v_u_15
	local v17 = setmetatable(v_u_14.new(), v_u_15)
	v17.CONTROL_ACTION_PRIORITY = p16
	v17.navigationRequestedConn = nil
	v17.heartbeatConn = nil
	v17.currentDestination = nil
	v17.currentPath = nil
	v17.currentPoints = nil
	v17.currentPointIdx = 0
	v17.expectedTimeToNextPoint = 0
	v17.timeReachedLastPoint = tick()
	v17.moving = false
	v17.isJumpBound = false
	v17.moveLatch = false
	v17.userCFrameEnabledConn = nil
	return v17
end
function v_u_15.SetLaserPointerMode(_, p_u_18)
	-- upvalues: (copy) v_u_7
	pcall(function()
		-- upvalues: (ref) v_u_7, (copy) p_u_18
		v_u_7:SetCore("VRLaserPointerMode", p_u_18)
	end)
end
function v_u_15.GetLocalHumanoid(_)
	-- upvalues: (copy) v_u_9
	local v19 = v_u_9.Character
	if v19 then
		for _, v20 in pairs(v19:GetChildren()) do
			if v20:IsA("Humanoid") then
				return v20
			end
		end
		return nil
	end
end
function v_u_15.HasBothHandControllers(_)
	-- upvalues: (copy) v_u_1
	local v21 = v_u_1:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)
	if v21 then
		v21 = v_u_1:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand)
	end
	return v21
end
function v_u_15.HasAnyHandControllers(_)
	-- upvalues: (copy) v_u_1
	return v_u_1:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) or v_u_1:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand)
end
function v_u_15.IsMobileVR(_)
	-- upvalues: (copy) v_u_2
	return v_u_2.TouchEnabled
end
function v_u_15.HasGamepad(_)
	-- upvalues: (copy) v_u_2
	return v_u_2.GamepadEnabled
end
function v_u_15.ShouldUseNavigationLaser(p22)
	if p22:IsMobileVR() then
		return true
	elseif p22:HasBothHandControllers() then
		return false
	else
		return p22:HasAnyHandControllers() and true or not p22:HasGamepad()
	end
end
function v_u_15.StartFollowingPath(p23, p24)
	-- upvalues: (copy) v_u_12
	currentPath = p24
	currentPoints = currentPath:GetPointCoordinates()
	currentPointIdx = 1
	moving = true
	timeReachedLastPoint = tick()
	local v25 = p23:GetLocalHumanoid()
	if v25 and v25.Torso and 1 <= #currentPoints then
		expectedTimeToNextPoint = (currentPoints[1] - v25.Torso.Position).magnitude / v25.WalkSpeed
	end
	v_u_12:Fire("targetPoint", p23.currentDestination)
end
function v_u_15.GoToPoint(p26, p27)
	-- upvalues: (copy) v_u_12
	currentPath = true
	currentPoints = { p27 }
	currentPointIdx = 1
	moving = true
	local v28 = p26:GetLocalHumanoid()
	timeReachedLastPoint = tick()
	expectedTimeToNextPoint = (v28.Torso.Position - p27).magnitude / v28.WalkSpeed
	v_u_12:Fire("targetPoint", p27)
end
function v_u_15.StopFollowingPath(p29)
	-- upvalues: (copy) v_u_10
	currentPath = nil
	currentPoints = nil
	currentPointIdx = 0
	moving = false
	p29.moveVector = v_u_10
end
function v_u_15.TryComputePath(_, p30, p31)
	-- upvalues: (copy) v_u_5
	local v32 = nil
	local v33 = 0
	while true do
		if v32 or v33 >= 5 then
			return v32
		end
		v32 = v_u_5:ComputeSmoothPathAsync(p30, p31, 200)
		v33 = v33 + 1
		if v32.Status == Enum.PathStatus.ClosestNoPath or v32.Status == Enum.PathStatus.ClosestOutOfRange then
			return nil
		end
		if v32 then
			if v32.Status == Enum.PathStatus.FailStartNotEmpty then
				p30 = p30 + (p31 - p30).Unit
				v32 = nil
			end
		end
		if v32 then
			if v32.Status == Enum.PathStatus.FailFinishNotEmpty then
				p31 = p31 + Vector3.new(0, 1, 0)
				v32 = nil
			end
		end
	end
end
function v_u_15.OnNavigationRequest(p34, p35, _)
	-- upvalues: (ref) v_u_8
	local v36 = p35.Position
	local v37 = p34.currentDestination
	local v38 = v36.x
	local v39
	if v38 == v38 then
		if v38 == (1 / 0) then
			v39 = false
		else
			v39 = v38 ~= (-1 / 0)
		end
	else
		v39 = false
	end
	if v39 then
		local v40 = v36.y
		if v40 == v40 then
			if v40 == (1 / 0) then
				v39 = false
			else
				v39 = v40 ~= (-1 / 0)
			end
		else
			v39 = false
		end
		if v39 then
			local v41 = v36.z
			if v41 == v41 then
				if v41 == (1 / 0) then
					v39 = false
				else
					v39 = v41 ~= (-1 / 0)
				end
			else
				v39 = false
			end
		end
	end
	if v39 then
		p34.currentDestination = v36
		local v42 = p34:GetLocalHumanoid()
		if v42 and v42.Torso then
			local v43 = v42.Torso.Position
			if (p34.currentDestination - v43).magnitude < 12 then
				p34:GoToPoint(p34.currentDestination)
			elseif v37 and 4 >= (p34.currentDestination - v37).magnitude then
				if moving then
					p34.currentPoints[#currentPoints] = p34.currentDestination
					return
				end
				p34:GoToPoint(p34.currentDestination)
			else
				local v44 = p34:TryComputePath(v43, p34.currentDestination)
				if v44 then
					p34:StartFollowingPath(v44)
					if v_u_8 then
						v_u_8.setCurrentPoints(p34.currentPoints)
						v_u_8.renderPath()
						return
					end
				else
					p34:StopFollowingPath()
					if v_u_8 then
						v_u_8.clearRenderedPath()
						return
					end
				end
			end
		else
			return
		end
	else
		return
	end
end
function v_u_15.OnJumpAction(p45, _, p46, _)
	if p46 == Enum.UserInputState.Begin then
		p45.isJumping = true
	end
	return Enum.ContextActionResult.Sink
end
function v_u_15.BindJumpAction(p_u_47, p48)
	-- upvalues: (copy) v_u_6
	if p48 then
		if not p_u_47.isJumpBound then
			p_u_47.isJumpBound = true
			v_u_6:BindActionAtPriority("VRJumpAction", function()
				-- upvalues: (copy) p_u_47
				return p_u_47:OnJumpAction()
			end, false, p_u_47.CONTROL_ACTION_PRIORITY, Enum.KeyCode.ButtonA)
			return
		end
	elseif p_u_47.isJumpBound then
		p_u_47.isJumpBound = false
		v_u_6:UnbindAction("VRJumpAction")
	end
end
function v_u_15.ControlCharacterGamepad(p49, _, p50, p51)
	-- upvalues: (copy) v_u_10, (ref) v_u_8, (copy) v_u_12
	if p51.KeyCode == Enum.KeyCode.Thumbstick1 then
		if p50 ~= Enum.UserInputState.Cancel then
			if p50 == Enum.UserInputState.End then
				p49.moveVector = v_u_10
				if p49:ShouldUseNavigationLaser() then
					p49:BindJumpAction(false)
					p49:SetLaserPointerMode("Navigation")
				end
				if p49.moveLatch then
					p49.moveLatch = false
					v_u_12:Fire("offtrack")
				end
			else
				p49:StopFollowingPath()
				if v_u_8 then
					v_u_8.clearRenderedPath()
				end
				if p49:ShouldUseNavigationLaser() then
					p49:BindJumpAction(true)
					p49:SetLaserPointerMode("Hidden")
				end
				if 0.22 < p51.Position.magnitude then
					p49.moveVector = Vector3.new(p51.Position.X, 0, -p51.Position.Y)
					if 0 < p49.moveVector.magnitude then
						p49.moveVector = p49.moveVector.unit * math.min(1, p51.Position.magnitude)
					end
					p49.moveLatch = true
				end
			end
			return Enum.ContextActionResult.Sink
		end
		p49.moveVector = v_u_10
	end
end
function v_u_15.OnHeartbeat(p52, p53)
	-- upvalues: (copy) v_u_11, (ref) v_u_8, (copy) v_u_12
	local v54 = p52.moveVector
	local v55 = p52:GetLocalHumanoid()
	if v55 and v55.Torso then
		if p52.moving then
			if p52.currentPoints then
				local v56 = v55.Torso.Position
				local v57 = (currentPoints[1] - v56) * v_u_11
				local v58 = v57.magnitude
				local v59 = v57 / v58
				if v58 < 1 then
					local v60 = currentPoints[1]
					local v61 = 0
					for v62, v63 in pairs(currentPoints) do
						if v62 ~= 1 then
							v61 = v61 + (v63 - v60).magnitude / v55.WalkSpeed
							v60 = v63
						end
					end
					table.remove(currentPoints, 1)
					currentPointIdx = currentPointIdx + 1
					if #currentPoints == 0 then
						p52:StopFollowingPath()
						if v_u_8 then
							v_u_8.clearRenderedPath()
						end
						return
					end
					if v_u_8 then
						v_u_8.setCurrentPoints(currentPoints)
						v_u_8.renderPath()
					end
					expectedTimeToNextPoint = (currentPoints[1] - v56).magnitude / v55.WalkSpeed
					timeReachedLastPoint = tick()
				else
					local v64 = { game.Players.LocalPlayer.Character, workspace.CurrentCamera }
					local v65, v66, _ = workspace:FindPartOnRayWithIgnoreList(Ray.new(v56 - Vector3.new(0, 1, 0), v59 * 3), v64)
					if v65 then
						local v67 = Vector3.new(0, 100, 0)
						local _, v68, _ = workspace:FindPartOnRayWithIgnoreList(Ray.new(v66 + v59 * 0.5 + v67, -v67), v64)
						local v69 = v68.Y - v56.Y
						if v69 < 6 and -2 < v69 then
							v55.Jump = true
						end
					end
					if tick() - timeReachedLastPoint > expectedTimeToNextPoint + 2 then
						p52:StopFollowingPath()
						if v_u_8 then
							v_u_8.clearRenderedPath()
						end
						v_u_12:Fire("offtrack")
					end
					v54 = p52.moveVector:Lerp(v59, p53 * 10)
				end
			end
		end
		local v70 = v54.x
		local v71
		if v70 == v70 then
			if v70 == (1 / 0) then
				v71 = false
			else
				v71 = v70 ~= (-1 / 0)
			end
		else
			v71 = false
		end
		if v71 then
			local v72 = v54.y
			if v72 == v72 then
				if v72 == (1 / 0) then
					v71 = false
				else
					v71 = v72 ~= (-1 / 0)
				end
			else
				v71 = false
			end
			if v71 then
				local v73 = v54.z
				if v73 == v73 then
					if v73 == (1 / 0) then
						v71 = false
					else
						v71 = v73 ~= (-1 / 0)
					end
				else
					v71 = false
				end
			end
		end
		if v71 then
			p52.moveVector = v54
		end
	end
end
function v_u_15.OnUserCFrameEnabled(p74)
	if p74:ShouldUseNavigationLaser() then
		p74:BindJumpAction(false)
		p74:SetLaserPointerMode("Navigation")
	else
		p74:BindJumpAction(true)
		p74:SetLaserPointerMode("Hidden")
	end
end
function v_u_15.Enable(p_u_75, p76)
	-- upvalues: (copy) v_u_10, (copy) v_u_1, (copy) v_u_3, (copy) v_u_6
	p_u_75.moveVector = v_u_10
	p_u_75.isJumping = false
	if p76 then
		p_u_75.navigationRequestedConn = v_u_1.NavigationRequested:Connect(function(p77, p78)
			-- upvalues: (copy) p_u_75
			p_u_75:OnNavigationRequest(p77, p78)
		end)
		p_u_75.heartbeatConn = v_u_3.Heartbeat:Connect(function(p79)
			-- upvalues: (copy) p_u_75
			p_u_75:OnHeartbeat(p79)
		end)
		v_u_6:BindAction("MoveThumbstick", function(p80, p81, p82)
			-- upvalues: (copy) p_u_75
			return p_u_75:ControlCharacterGamepad(p80, p81, p82)
		end, false, p_u_75.CONTROL_ACTION_PRIORITY, Enum.KeyCode.Thumbstick1)
		v_u_6:BindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2)
		p_u_75.userCFrameEnabledConn = v_u_1.UserCFrameEnabled:Connect(function()
			-- upvalues: (copy) p_u_75
			p_u_75:OnUserCFrameEnabled()
		end)
		p_u_75:OnUserCFrameEnabled()
		v_u_1:SetTouchpadMode(Enum.VRTouchpad.Left, Enum.VRTouchpadMode.VirtualThumbstick)
		v_u_1:SetTouchpadMode(Enum.VRTouchpad.Right, Enum.VRTouchpadMode.ABXY)
		p_u_75.enabled = true
	else
		p_u_75:StopFollowingPath()
		v_u_6:UnbindAction("MoveThumbstick")
		v_u_6:UnbindActivate(Enum.UserInputType.Gamepad1, Enum.KeyCode.ButtonR2)
		p_u_75:BindJumpAction(false)
		p_u_75:SetLaserPointerMode("Disabled")
		if p_u_75.navigationRequestedConn then
			p_u_75.navigationRequestedConn:Disconnect()
			p_u_75.navigationRequestedConn = nil
		end
		if p_u_75.heartbeatConn then
			p_u_75.heartbeatConn:Disconnect()
			p_u_75.heartbeatConn = nil
		end
		if p_u_75.userCFrameEnabledConn then
			p_u_75.userCFrameEnabledConn:Disconnect()
			p_u_75.userCFrameEnabledConn = nil
		end
		p_u_75.enabled = false
	end
end
return v_u_15
