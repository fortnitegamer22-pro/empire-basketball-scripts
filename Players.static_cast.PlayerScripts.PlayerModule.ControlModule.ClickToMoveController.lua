-- decompiled by Sentinel (took 16.305806ms)
local v1, v2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserExcludeNonCollidableForPathfinding")
end)
local v_u_3 = v1 and v2
local v4, v5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserClickToMoveSupportAgentCanClimb2")
end)
local v_u_6 = v4 and v5
local v_u_7 = game:GetService("UserInputService")
local v_u_8 = game:GetService("PathfindingService")
local v_u_9 = game:GetService("Players")
game:GetService("Debris")
local v_u_10 = game:GetService("StarterGui")
local v_u_11 = game:GetService("Workspace")
local v_u_12 = game:GetService("CollectionService")
local v_u_13 = game:GetService("GuiService")
local v_u_14 = true
local v_u_15 = true
local v_u_16 = false
local v_u_17 = 1
local v_u_18 = 8
local v_u_19 = {
	[Enum.KeyCode.W] = true, 
	[Enum.KeyCode.A] = true, 
	[Enum.KeyCode.S] = true, 
	[Enum.KeyCode.D] = true, 
	[Enum.KeyCode.Up] = true, 
	[Enum.KeyCode.Down] = true
}
local v_u_20 = v_u_9.LocalPlayer
local v_u_21 = require(script.Parent:WaitForChild("ClickToMoveDisplay"))
local v_u_22 = Vector3.new(0, 0, 0)
local v_u_23 = {}
local function v_u_26(p24)
	-- upvalues: (copy) v_u_26
	if p24 then
		local v25 = p24:FindFirstChildOfClass("Humanoid")
		if v25 then
			return p24, v25
		else
			return v_u_26(p24.Parent)
		end
	else
		return
	end
end
v_u_23.FindCharacterAncestor = v_u_26
local function v_u_37(p27, p28, p29)
	-- upvalues: (copy) v_u_11, (copy) v_u_26, (copy) v_u_37
	local v30 = p29 or {}
	local v31, v32, v33, v34 = v_u_11:FindPartOnRayWithIgnoreList(p27, v30)
	if not v31 then
		return nil, nil
	end
	if p28 and v31.CanCollide == false then
		local v35 = not v31 or v31:FindFirstChildOfClass("Humanoid")
		if not v35 then
			local v36
			v36, v35 = v_u_26(v31.Parent)
		end
		if v35 == nil then
			table.insert(v30, v31)
			return v_u_37(p27, p28, v30)
		end
	end
	return v31, v32, v33, v34
end
v_u_23.Raycast = v_u_37
local v_u_38 = {}
local v_u_39 = nil
local v_u_40 = nil
local v_u_41 = nil
local v_u_42 = nil
local function v_u_50(p43)
	-- upvalues: (ref) v_u_40, (ref) v_u_41, (ref) v_u_42, (ref) v_u_39, (copy) v_u_20, (copy) v_u_12
	if p43 ~= v_u_40 then
		if v_u_41 then
			v_u_41:Disconnect()
			v_u_41 = nil
		end
		if v_u_42 then
			v_u_42:Disconnect()
			v_u_42 = nil
		end
		v_u_40 = p43
		local v44 = {}
		local v45 = v_u_20
		if v45 then
			v45 = v_u_20.Character
		end
		__set_list(v44, 1, {v45})
		v_u_39 = v44
		if v_u_40 ~= nil then
			for _, v46 in ipairs((v_u_12:GetTagged(v_u_40))) do
				table.insert(v_u_39, v46)
			end
			v_u_41 = v_u_12:GetInstanceAddedSignal(v_u_40):Connect(function(p47)
				-- upvalues: (ref) v_u_39
				table.insert(v_u_39, p47)
			end)
			v_u_42 = v_u_12:GetInstanceRemovedSignal(v_u_40):Connect(function(p48)
				-- upvalues: (ref) v_u_39
				for v49 = 1, #v_u_39 do
					if v_u_39[v49] == p48 then
						v_u_39[v49] = v_u_39[#v_u_39]
						table.remove(v_u_39)
						return
					end
				end
			end)
		end
	end
end
local function v_u_61(p51)
	if p51 == nil or p51.PrimaryPart == nil then
		return
	else
		assert(p51, "")
		assert(p51.PrimaryPart, "")
		local v52 = p51.PrimaryPart.CFrame:Inverse()
		local v53 = Vector3.new(math.huge, math.huge, math.huge)
		local v54 = Vector3.new(-math.huge, -math.huge, -math.huge)
		for _, v55 in pairs(p51:GetDescendants()) do
			if v55:IsA("BasePart") then
				if v55.CanCollide then
					local v56 = v52 * v55.CFrame
					local v57 = Vector3.new(v55.Size.X / 2, v55.Size.Y / 2, v55.Size.Z / 2)
					for _, v58 in ipairs({
						Vector3.new(v57.X, v57.Y, v57.Z), 
						Vector3.new(v57.X, v57.Y, -v57.Z), 
						Vector3.new(v57.X, -v57.Y, v57.Z), 
						Vector3.new(v57.X, -v57.Y, -v57.Z), 
						Vector3.new(-v57.X, v57.Y, v57.Z), 
						Vector3.new(-v57.X, v57.Y, -v57.Z), 
						Vector3.new(-v57.X, -v57.Y, v57.Z), 
						(Vector3.new(-v57.X, -v57.Y, -v57.Z))
					}) do
						local v59 = v56 * v58
						v53 = Vector3.new(math.min(v53.X, v59.X), math.min(v53.Y, v59.Y), (math.min(v53.Z, v59.Z)))
						v54 = Vector3.new(math.max(v54.X, v59.X), math.max(v54.Y, v59.Y), (math.max(v54.Z, v59.Z)))
					end
				end
			end
		end
		local v60 = v54 - v53
		if v60.X < 0 or v60.Y < 0 or v60.Z < 0 then
			return nil
		else
			return v60
		end
	end
end
local function v_u_110(p62, p63, p64)
	-- upvalues: (ref) v_u_16, (copy) v_u_22, (copy) v_u_20, (copy) v_u_38, (ref) v_u_17, (copy) v_u_3, (copy) v_u_61, (copy) v_u_6, (copy) v_u_8, (ref) v_u_14, (copy) v_u_21, (ref) v_u_18, (copy) v_u_11, (ref) v_u_39
	local v_u_65 = {}
	local v66
	if p64 == nil then
		v66 = v_u_16
		p64 = true
	else
		v66 = p64
	end
	v_u_65.Cancelled = false
	v_u_65.Started = false
	v_u_65.Finished = Instance.new("BindableEvent")
	v_u_65.PathFailed = Instance.new("BindableEvent")
	v_u_65.PathComputing = false
	v_u_65.PathComputed = false
	v_u_65.OriginalTargetPoint = p62
	v_u_65.TargetPoint = p62
	v_u_65.TargetSurfaceNormal = p63
	v_u_65.DiedConn = nil
	v_u_65.SeatedConn = nil
	v_u_65.BlockedConn = nil
	v_u_65.TeleportedConn = nil
	v_u_65.CurrentPoint = 0
	v_u_65.HumanoidOffsetFromPath = v_u_22
	v_u_65.CurrentWaypointPosition = nil
	v_u_65.CurrentWaypointPlaneNormal = v_u_22
	v_u_65.CurrentWaypointPlaneDistance = 0
	v_u_65.CurrentWaypointNeedsJump = false
	v_u_65.CurrentHumanoidPosition = v_u_22
	v_u_65.CurrentHumanoidVelocity = 0
	v_u_65.NextActionMoveDirection = v_u_22
	v_u_65.NextActionJump = false
	v_u_65.Timeout = 0
	local v67 = v_u_20
	local v68
	if v67 then
		v68 = v67.Character
	else
		v68 = v67
	end
	local v69
	if v68 then
		v69 = v_u_38[v67]
		if not v69 or v69.Parent ~= v68 then
			v_u_38[v67] = nil
			v69 = v68:FindFirstChildOfClass("Humanoid")
			if v69 then
				v_u_38[v67] = v69
			end
		end
	else
		v69 = nil
	end
	v_u_65.Humanoid = v69
	v_u_65.OriginPoint = nil
	v_u_65.AgentCanFollowPath = false
	v_u_65.DirectPath = false
	v_u_65.DirectPathRiseFirst = false
	v_u_65.stopTraverseFunc = nil
	v_u_65.setPointFunc = nil
	v_u_65.pointList = nil
	local v70 = v_u_65.Humanoid
	if v70 then
		v70 = v_u_65.Humanoid.RootPart
	end
	if v70 then
		v_u_65.OriginPoint = v70.CFrame.Position
		local v71 = 2
		local v72 = 5
		local v73 = true
		local v74 = v_u_65.Humanoid.SeatPart
		if v74 and v74:IsA("VehicleSeat") then
			local v75 = v74:FindFirstAncestorOfClass("Model")
			if v75 then
				local v76 = v75.PrimaryPart
				v75.PrimaryPart = v74
				if p64 then
					local v77 = v75:GetExtentsSize()
					v71 = v_u_17 * 0.5 * math.sqrt(v77.X * v77.X + v77.Z * v77.Z)
					v72 = v_u_17 * v77.Y
					v_u_65.AgentCanFollowPath = true
					v_u_65.DirectPath = p64
					v73 = false
				end
				v75.PrimaryPart = v76
			end
		else
			local v78 = nil
			if v_u_3 then
				local v79 = v_u_20
				if v79 then
					v79 = v_u_20.Character
				end
				if v79 ~= nil then
					v78 = v_u_61(v79)
				end
			end
			if v78 == nil then
				local v80 = v_u_20
				if v80 then
					v80 = v_u_20.Character
				end
				v78 = v80:GetExtentsSize()
			end
			assert(v78, "")
			v71 = v_u_17 * 0.5 * math.sqrt(v78.X * v78.X + v78.Z * v78.Z)
			v72 = v_u_17 * v78.Y
			v73 = 0 < v_u_65.Humanoid.JumpPower
			v_u_65.AgentCanFollowPath = true
			v_u_65.DirectPath = v66
			v_u_65.DirectPathRiseFirst = v_u_65.Humanoid.Sit
		end
		if v_u_6 then
			v_u_65.pathResult = v_u_8:CreatePath({
				["AgentRadius"] = v71, 
				["AgentHeight"] = v72, 
				["AgentCanJump"] = v73, 
				["AgentCanClimb"] = true
			})
		else
			v_u_65.pathResult = v_u_8:CreatePath({
				["AgentRadius"] = v71, 
				["AgentHeight"] = v72, 
				["AgentCanJump"] = v73
			})
		end
	end
	function v_u_65.Cleanup(_)
		-- upvalues: (copy) v_u_65
		if v_u_65.stopTraverseFunc then
			v_u_65.stopTraverseFunc()
			v_u_65.stopTraverseFunc = nil
		end
		if v_u_65.BlockedConn then
			v_u_65.BlockedConn:Disconnect()
			v_u_65.BlockedConn = nil
		end
		if v_u_65.DiedConn then
			v_u_65.DiedConn:Disconnect()
			v_u_65.DiedConn = nil
		end
		if v_u_65.SeatedConn then
			v_u_65.SeatedConn:Disconnect()
			v_u_65.SeatedConn = nil
		end
		if v_u_65.TeleportedConn then
			v_u_65.TeleportedConn:Disconnect()
			v_u_65.TeleportedConn = nil
		end
		v_u_65.Started = false
	end
	function v_u_65.Cancel(_)
		-- upvalues: (copy) v_u_65
		v_u_65.Cancelled = true
		v_u_65:Cleanup()
	end
	function v_u_65.IsActive(_)
		-- upvalues: (copy) v_u_65
		local v81 = v_u_65.AgentCanFollowPath and v_u_65.Started
		if v81 then
			v81 = not v_u_65.Cancelled
		end
		return v81
	end
	function v_u_65.OnPathInterrupted(_)
		-- upvalues: (copy) v_u_65
		v_u_65.Cancelled = true
		v_u_65:OnPointReached(false)
	end
	function v_u_65.ComputePath(_)
		-- upvalues: (copy) v_u_65
		if v_u_65.OriginPoint then
			if v_u_65.PathComputed or v_u_65.PathComputing then
				return
			end
			v_u_65.PathComputing = true
			if v_u_65.AgentCanFollowPath then
				if v_u_65.DirectPath then
					v_u_65.pointList = { PathWaypoint.new(v_u_65.OriginPoint, Enum.PathWaypointAction.Walk), PathWaypoint.new(v_u_65.TargetPoint, v_u_65.DirectPathRiseFirst and Enum.PathWaypointAction.Jump or Enum.PathWaypointAction.Walk) }
					v_u_65.PathComputed = true
				else
					v_u_65.pathResult:ComputeAsync(v_u_65.OriginPoint, v_u_65.TargetPoint)
					v_u_65.pointList = v_u_65.pathResult:GetWaypoints()
					v_u_65.BlockedConn = v_u_65.pathResult.Blocked:Connect(function(p82)
						-- upvalues: (ref) v_u_65
						v_u_65:OnPathBlocked(p82)
					end)
					v_u_65.PathComputed = v_u_65.pathResult.Status == Enum.PathStatus.Success
				end
			end
			v_u_65.PathComputing = false
		end
	end
	function v_u_65.IsValidPath(_)
		-- upvalues: (copy) v_u_65
		v_u_65:ComputePath()
		local v83 = v_u_65.PathComputed
		if v83 then
			v83 = v_u_65.AgentCanFollowPath
		end
		return v83
	end
	v_u_65.Recomputing = false
	function v_u_65.OnPathBlocked(_, p84)
		-- upvalues: (copy) v_u_65, (ref) v_u_14, (ref) v_u_21
		if v_u_65.CurrentPoint <= p84 and not v_u_65.Recomputing then
			v_u_65.Recomputing = true
			if v_u_65.stopTraverseFunc then
				v_u_65.stopTraverseFunc()
				v_u_65.stopTraverseFunc = nil
			end
			v_u_65.OriginPoint = v_u_65.Humanoid.RootPart.CFrame.p
			v_u_65.pathResult:ComputeAsync(v_u_65.OriginPoint, v_u_65.TargetPoint)
			v_u_65.pointList = v_u_65.pathResult:GetWaypoints()
			if 0 < #v_u_65.pointList then
				v_u_65.HumanoidOffsetFromPath = v_u_65.pointList[1].Position - v_u_65.OriginPoint
			end
			v_u_65.PathComputed = v_u_65.pathResult.Status == Enum.PathStatus.Success
			if v_u_14 then
				local v85, v86 = v_u_21.CreatePathDisplay(v_u_65.pointList)
				v_u_65.stopTraverseFunc = v85
				v_u_65.setPointFunc = v86
			end
			if v_u_65.PathComputed then
				v_u_65.CurrentPoint = 1
				v_u_65:OnPointReached(true)
			else
				v_u_65.PathFailed:Fire()
				v_u_65:Cleanup()
			end
			v_u_65.Recomputing = false
		end
	end
	function v_u_65.OnRenderStepped(_, p87)
		-- upvalues: (copy) v_u_65, (ref) v_u_18, (ref) v_u_22
		if v_u_65.Started and not v_u_65.Cancelled then
			v_u_65.Timeout = v_u_65.Timeout + p87
			if v_u_18 < v_u_65.Timeout then
				v_u_65:OnPointReached(false)
				return
			end
			v_u_65.CurrentHumanoidPosition = v_u_65.Humanoid.RootPart.Position + v_u_65.HumanoidOffsetFromPath
			v_u_65.CurrentHumanoidVelocity = v_u_65.Humanoid.RootPart.Velocity
			while v_u_65.Started and v_u_65:IsCurrentWaypointReached() do
				v_u_65:OnPointReached(true)
			end
			if v_u_65.Started then
				v_u_65.NextActionMoveDirection = v_u_65.CurrentWaypointPosition - v_u_65.CurrentHumanoidPosition
				if 1e-6 < v_u_65.NextActionMoveDirection.Magnitude then
					v_u_65.NextActionMoveDirection = v_u_65.NextActionMoveDirection.Unit
				else
					v_u_65.NextActionMoveDirection = v_u_22
				end
				if v_u_65.CurrentWaypointNeedsJump then
					v_u_65.NextActionJump = true
					v_u_65.CurrentWaypointNeedsJump = false
					return
				end
				v_u_65.NextActionJump = false
			end
		end
	end
	function v_u_65.IsCurrentWaypointReached(_)
		-- upvalues: (copy) v_u_65, (ref) v_u_22
		local v88 = v_u_65.CurrentWaypointPlaneNormal == v_u_22 and true or v_u_65.CurrentWaypointPlaneNormal:Dot(v_u_65.CurrentHumanoidPosition) - v_u_65.CurrentWaypointPlaneDistance < math.max(1, 0.0625 * -v_u_65.CurrentWaypointPlaneNormal:Dot(v_u_65.CurrentHumanoidVelocity))
		if v88 then
			v_u_65.CurrentWaypointPosition = nil
			v_u_65.CurrentWaypointPlaneNormal = v_u_22
			v_u_65.CurrentWaypointPlaneDistance = 0
		end
		return v88
	end
	function v_u_65.OnPointReached(_, p89)
		-- upvalues: (copy) v_u_65
		if p89 and not v_u_65.Cancelled then
			if v_u_65.setPointFunc then
				v_u_65.setPointFunc(v_u_65.CurrentPoint)
			end
			local v90 = v_u_65.CurrentPoint + 1
			if #v_u_65.pointList < v90 then
				if v_u_65.stopTraverseFunc then
					v_u_65.stopTraverseFunc()
				end
				v_u_65.Finished:Fire()
				v_u_65:Cleanup()
			else
				local v91 = v_u_65.pointList[v_u_65.CurrentPoint]
				local v92 = v_u_65.pointList[v90]
				local v93 = v_u_65.Humanoid:GetState()
				if v93 == Enum.HumanoidStateType.FallingDown and true or v93 == Enum.HumanoidStateType.Freefall and true or v93 == Enum.HumanoidStateType.Jumping then
					local v94 = v92.Action == Enum.PathWaypointAction.Jump
					if not v94 then
						if 1 < v_u_65.CurrentPoint then
							local v95 = v91.Position - v_u_65.pointList[v_u_65.CurrentPoint - 1].Position
							local v96 = v92.Position - v91.Position
							v94 = Vector2.new(v95.x, v95.z).Unit:Dot(Vector2.new(v96.x, v96.z).Unit) < 0.996
						end
					end
					if v94 then
						v_u_65.Humanoid.FreeFalling:Wait()
						wait(0.1)
					end
				end
				v_u_65:MoveToNextWayPoint(v91, v92, v90)
			end
		else
			v_u_65.PathFailed:Fire()
			v_u_65:Cleanup()
			return
		end
	end
	function v_u_65.MoveToNextWayPoint(_, p97, p98, p99)
		-- upvalues: (copy) v_u_65, (ref) v_u_6, (ref) v_u_22
		v_u_65.CurrentWaypointPlaneNormal = p97.Position - p98.Position
		if not v_u_6 or p98.Label ~= "Climb" then
			v_u_65.CurrentWaypointPlaneNormal = Vector3.new(v_u_65.CurrentWaypointPlaneNormal.X, 0, v_u_65.CurrentWaypointPlaneNormal.Z)
		end
		if 1e-6 < v_u_65.CurrentWaypointPlaneNormal.Magnitude then
			v_u_65.CurrentWaypointPlaneNormal = v_u_65.CurrentWaypointPlaneNormal.Unit
			v_u_65.CurrentWaypointPlaneDistance = v_u_65.CurrentWaypointPlaneNormal:Dot(p98.Position)
		else
			v_u_65.CurrentWaypointPlaneNormal = v_u_22
			v_u_65.CurrentWaypointPlaneDistance = 0
		end
		v_u_65.CurrentWaypointNeedsJump = p98.Action == Enum.PathWaypointAction.Jump
		v_u_65.CurrentWaypointPosition = p98.Position
		v_u_65.CurrentPoint = p99
		v_u_65.Timeout = 0
	end
	function v_u_65.Start(_, p100)
		-- upvalues: (copy) v_u_65, (ref) v_u_21, (ref) v_u_14
		if v_u_65.AgentCanFollowPath then
			if v_u_65.Started then
				return
			else
				v_u_65.Started = true
				v_u_21.CancelFailureAnimation()
				if v_u_14 and (p100 == nil or p100) then
					local v101, v102 = v_u_21.CreatePathDisplay(v_u_65.pointList, v_u_65.OriginalTargetPoint)
					v_u_65.stopTraverseFunc = v101
					v_u_65.setPointFunc = v102
				end
				if 0 < #v_u_65.pointList then
					v_u_65.HumanoidOffsetFromPath = Vector3.new(0, v_u_65.pointList[1].Position.Y - v_u_65.OriginPoint.Y, 0)
					v_u_65.CurrentHumanoidPosition = v_u_65.Humanoid.RootPart.Position + v_u_65.HumanoidOffsetFromPath
					v_u_65.CurrentHumanoidVelocity = v_u_65.Humanoid.RootPart.Velocity
					v_u_65.SeatedConn = v_u_65.Humanoid.Seated:Connect(function(_, _)
						-- upvalues: (ref) v_u_65
						v_u_65:OnPathInterrupted()
					end)
					v_u_65.DiedConn = v_u_65.Humanoid.Died:Connect(function()
						-- upvalues: (ref) v_u_65
						v_u_65:OnPathInterrupted()
					end)
					v_u_65.TeleportedConn = v_u_65.Humanoid.RootPart:GetPropertyChangedSignal("CFrame"):Connect(function()
						-- upvalues: (ref) v_u_65
						v_u_65:OnPathInterrupted()
					end)
					v_u_65.CurrentPoint = 1
					v_u_65:OnPointReached(true)
				else
					v_u_65.PathFailed:Fire()
					if v_u_65.stopTraverseFunc then
						v_u_65.stopTraverseFunc()
					end
				end
			end
		else
			v_u_65.PathFailed:Fire()
			return
		end
	end
	local v103 = Ray.new(v_u_65.TargetPoint + v_u_65.TargetSurfaceNormal * 1.5, Vector3.new(0, -1, 0) * 50)
	local v104 = v_u_11
	local v105
	if v_u_39 then
		v105 = v_u_39
	else
		v_u_39 = {}
		assert(v_u_39, "")
		local v106 = v_u_39
		local v107 = v_u_20
		if v107 then
			v107 = v_u_20.Character
		end
		table.insert(v106, v107)
		v105 = v_u_39
	end
	local v108, v109 = v104:FindPartOnRayWithIgnoreList(v103, v105)
	if v108 then
		v_u_65.TargetPoint = v109
	end
	v_u_65:ComputePath()
	return v_u_65
end
local function v_u_113(p111)
	if p111 ~= nil then
		for _, v112 in pairs(p111:GetChildren()) do
			if v112:IsA("Tool") then
				return v112
			end
		end
	end
end
local v_u_114 = nil
local v_u_115 = nil
local v_u_116 = nil
local function v_u_125(p117, p_u_118, p_u_119, p_u_120, p_u_121)
	-- upvalues: (ref) v_u_114, (ref) v_u_115, (ref) v_u_116, (copy) v_u_113, (ref) v_u_15, (copy) v_u_21
	if v_u_114 then
		if v_u_114 then
			v_u_114:Cancel()
			v_u_114 = nil
		end
		if v_u_115 then
			v_u_115:Disconnect()
			v_u_115 = nil
		end
		if v_u_116 then
			v_u_116:Disconnect()
			v_u_116 = nil
		end
	end
	v_u_114 = p117
	p117:Start(p_u_121)
	v_u_115 = p117.Finished.Event:Connect(function()
		-- upvalues: (ref) v_u_114, (ref) v_u_115, (ref) v_u_116, (copy) p_u_119, (ref) v_u_113, (copy) p_u_120
		if v_u_114 then
			v_u_114:Cancel()
			v_u_114 = nil
		end
		if v_u_115 then
			v_u_115:Disconnect()
			v_u_115 = nil
		end
		if v_u_116 then
			v_u_116:Disconnect()
			v_u_116 = nil
		end
		local v122 = p_u_119 and v_u_113(p_u_120)
		if v122 then
			v122:Activate()
		end
	end)
	v_u_116 = p117.PathFailed.Event:Connect(function()
		-- upvalues: (ref) v_u_114, (ref) v_u_115, (ref) v_u_116, (copy) p_u_121, (ref) v_u_15, (ref) v_u_21, (copy) p_u_118
		if v_u_114 then
			v_u_114:Cancel()
			v_u_114 = nil
		end
		if v_u_115 then
			v_u_115:Disconnect()
			v_u_115 = nil
		end
		if v_u_116 then
			v_u_116:Disconnect()
			v_u_116 = nil
		end
		if p_u_121 == nil or p_u_121 then
			local v123 = v_u_15
			if v123 then
				local v124 = v_u_114
				if v124 then
					v124 = v_u_114:IsActive()
				end
				v123 = not v124
			end
			if v123 then
				v_u_21.PlayFailureAnimation()
			end
			v_u_21.DisplayFailureWaypoint(p_u_118)
		end
	end)
end
function OnTap(p126, p127, p128)
	-- upvalues: (copy) v_u_11, (copy) v_u_20, (copy) v_u_38, (copy) v_u_23, (ref) v_u_39, (copy) v_u_10, (copy) v_u_9, (ref) v_u_114, (ref) v_u_115, (ref) v_u_116, (copy) v_u_110, (copy) v_u_125, (ref) v_u_15, (copy) v_u_21, (copy) v_u_113
	local v129 = v_u_11.CurrentCamera
	local v130 = v_u_20.Character
	local v131 = v_u_20
	local v132
	if v131 then
		v132 = v131.Character
	else
		v132 = v131
	end
	local v133
	if v132 then
		v133 = v_u_38[v131]
		if not v133 or v133.Parent ~= v132 then
			v_u_38[v131] = nil
			v133 = v132:FindFirstChildOfClass("Humanoid")
			if v133 then
				v_u_38[v131] = v133
			end
		end
	else
		v133 = nil
	end
	local v134
	if v133 == nil then
		v134 = false
	else
		v134 = 0 < v133.Health
	end
	if v134 then
		if #p126 == 1 or p127 then
			if v129 then
				local v135 = v129:ScreenPointToRay(p126[1].X, p126[1].Y)
				local v136 = Ray.new(v135.Origin, v135.Direction * 1000)
				local v137 = v_u_20
				local v138
				if v137 then
					v138 = v137.Character
				else
					v138 = v137
				end
				if v138 then
					local v139 = v_u_38[v137]
					if not v139 or v139.Parent ~= v138 then
						v_u_38[v137] = nil
						local v140 = v138:FindFirstChildOfClass("Humanoid")
						if v140 then
							v_u_38[v137] = v140
						end
					end
				end
				local v141 = v_u_23.Raycast
				local v142 = true
				local v143
				if v_u_39 then
					v143 = v_u_39
				else
					v_u_39 = {}
					assert(v_u_39, "")
					local v144 = v_u_39
					local v145 = v_u_20
					if v145 then
						v145 = v_u_20.Character
					end
					table.insert(v144, v145)
					v143 = v_u_39
				end
				local v146, v147, v148 = v141(v136, v142, v143)
				local v149, v150 = v_u_23.FindCharacterAncestor(v146)
				if p128 and v150 and v_u_10:GetCore("AvatarContextMenuEnabled") and v_u_9:GetPlayerFromCharacter(v150.Parent) then
					if v_u_114 then
						v_u_114:Cancel()
						v_u_114 = nil
					end
					if v_u_115 then
						v_u_115:Disconnect()
						v_u_115 = nil
					end
					if v_u_116 then
						v_u_116:Disconnect()
						v_u_116 = nil
					end
					return
				end
				if p127 then
					v149 = nil
				else
					p127 = v147
				end
				if p127 and v130 then
					if v_u_114 then
						v_u_114:Cancel()
						v_u_114 = nil
					end
					if v_u_115 then
						v_u_115:Disconnect()
						v_u_115 = nil
					end
					if v_u_116 then
						v_u_116:Disconnect()
						v_u_116 = nil
					end
					local v151 = v_u_110(p127, v148)
					if v151:IsValidPath() then
						v_u_125(v151, p127, v149, v130)
					else
						v151:Cleanup()
						if v_u_114 and v_u_114:IsActive() then
							v_u_114:Cancel()
						end
						if v_u_15 then
							v_u_21.PlayFailureAnimation()
						end
						v_u_21.DisplayFailureWaypoint(p127)
					end
				end
			end
		else
			local v152 = 2 <= #p126 and v129 and v_u_113(v130)
			if v152 then
				v152:Activate()
			end
		end
	end
end
local v_u_153 = require(script.Parent:WaitForChild("Keyboard"))
local v_u_154 = setmetatable({}, v_u_153)
v_u_154.__index = v_u_154
function v_u_154.new(p155)
	-- upvalues: (copy) v_u_153, (copy) v_u_154, (copy) v_u_22
	local v156 = setmetatable(v_u_153.new(p155), v_u_154)
	v156.fingerTouches = {}
	v156.numUnsunkTouches = 0
	v156.mouse1Down = tick()
	v156.mouse1DownPos = Vector2.new()
	v156.mouse2DownTime = tick()
	v156.mouse2DownPos = Vector2.new()
	v156.mouse2UpTime = tick()
	v156.keyboardMoveVector = v_u_22
	v156.tapConn = nil
	v156.inputBeganConn = nil
	v156.inputChangedConn = nil
	v156.inputEndedConn = nil
	v156.humanoidDiedConn = nil
	v156.characterChildAddedConn = nil
	v156.onCharacterAddedConn = nil
	v156.characterChildRemovedConn = nil
	v156.renderSteppedConn = nil
	v156.menuOpenedConnection = nil
	v156.running = false
	v156.wasdEnabled = false
	return v156
end
function v_u_154.DisconnectEvents(p157)
	local v158 = p157.tapConn
	if v158 then
		v158:Disconnect()
	end
	local v159 = p157.inputBeganConn
	if v159 then
		v159:Disconnect()
	end
	local v160 = p157.inputChangedConn
	if v160 then
		v160:Disconnect()
	end
	local v161 = p157.inputEndedConn
	if v161 then
		v161:Disconnect()
	end
	local v162 = p157.humanoidDiedConn
	if v162 then
		v162:Disconnect()
	end
	local v163 = p157.characterChildAddedConn
	if v163 then
		v163:Disconnect()
	end
	local v164 = p157.onCharacterAddedConn
	if v164 then
		v164:Disconnect()
	end
	local v165 = p157.renderSteppedConn
	if v165 then
		v165:Disconnect()
	end
	local v166 = p157.characterChildRemovedConn
	if v166 then
		v166:Disconnect()
	end
	local v167 = p157.menuOpenedConnection
	if v167 then
		v167:Disconnect()
	end
end
function v_u_154.OnTouchBegan(p168, p169, p170)
	if p168.fingerTouches[p169] == nil and not p170 then
		p168.numUnsunkTouches = p168.numUnsunkTouches + 1
	end
	p168.fingerTouches[p169] = p170
end
function v_u_154.OnTouchChanged(p171, p172, p173)
	if p171.fingerTouches[p172] == nil then
		p171.fingerTouches[p172] = p173
		if not p173 then
			p171.numUnsunkTouches = p171.numUnsunkTouches + 1
		end
	end
end
function v_u_154.OnTouchEnded(p174, p175, _)
	if p174.fingerTouches[p175] ~= nil and p174.fingerTouches[p175] == false then
		p174.numUnsunkTouches = p174.numUnsunkTouches - 1
	end
	p174.fingerTouches[p175] = nil
end
function v_u_154.OnCharacterAdded(p_u_176, p177)
	-- upvalues: (copy) v_u_7, (copy) v_u_19, (ref) v_u_114, (ref) v_u_115, (ref) v_u_116, (copy) v_u_21, (copy) v_u_13
	p_u_176:DisconnectEvents()
	p_u_176.inputBeganConn = v_u_7.InputBegan:Connect(function(p178, p179)
		-- upvalues: (copy) p_u_176, (ref) v_u_19, (ref) v_u_114, (ref) v_u_115, (ref) v_u_116, (ref) v_u_21
		if p178.UserInputType == Enum.UserInputType.Touch then
			p_u_176:OnTouchBegan(p178, p179)
		end
		if p_u_176.wasdEnabled and p179 == false and p178.UserInputType == Enum.UserInputType.Keyboard and v_u_19[p178.KeyCode] then
			if v_u_114 then
				v_u_114:Cancel()
				v_u_114 = nil
			end
			if v_u_115 then
				v_u_115:Disconnect()
				v_u_115 = nil
			end
			if v_u_116 then
				v_u_116:Disconnect()
				v_u_116 = nil
			end
			v_u_21.CancelFailureAnimation()
		end
		if p178.UserInputType == Enum.UserInputType.MouseButton1 then
			p_u_176.mouse1DownTime = tick()
			p_u_176.mouse1DownPos = p178.Position
		end
		if p178.UserInputType == Enum.UserInputType.MouseButton2 then
			p_u_176.mouse2DownTime = tick()
			p_u_176.mouse2DownPos = p178.Position
		end
	end)
	p_u_176.inputChangedConn = v_u_7.InputChanged:Connect(function(p180, p181)
		-- upvalues: (copy) p_u_176
		if p180.UserInputType == Enum.UserInputType.Touch then
			p_u_176:OnTouchChanged(p180, p181)
		end
	end)
	p_u_176.inputEndedConn = v_u_7.InputEnded:Connect(function(p182, p183)
		-- upvalues: (copy) p_u_176, (ref) v_u_114
		if p182.UserInputType == Enum.UserInputType.Touch then
			p_u_176:OnTouchEnded(p182, p183)
		end
		if p182.UserInputType == Enum.UserInputType.MouseButton2 then
			p_u_176.mouse2UpTime = tick()
			local v184 = p182.Position
			if p_u_176.mouse2UpTime - p_u_176.mouse2DownTime < 0.25 and (v184 - p_u_176.mouse2DownPos).magnitude < 5 and (v_u_114 or p_u_176.keyboardMoveVector.Magnitude <= 0) then
				OnTap({ v184 })
			end
		end
	end)
	p_u_176.tapConn = v_u_7.TouchTap:Connect(function(p185, p186)
		if not p186 then
			OnTap(p185, nil, true)
		end
	end)
	p_u_176.menuOpenedConnection = v_u_13.MenuOpened:Connect(function()
		-- upvalues: (ref) v_u_114, (ref) v_u_115, (ref) v_u_116
		if v_u_114 then
			v_u_114:Cancel()
			v_u_114 = nil
		end
		if v_u_115 then
			v_u_115:Disconnect()
			v_u_115 = nil
		end
		if v_u_116 then
			v_u_116:Disconnect()
			v_u_116 = nil
		end
	end)
	local function v_u_189(p187)
		-- upvalues: (ref) v_u_7, (copy) p_u_176
		if v_u_7.TouchEnabled and p187:IsA("Tool") then
			p187.ManualActivationOnly = true
		end
		if p187:IsA("Humanoid") then
			local v188 = p_u_176.humanoidDiedConn
			if v188 then
				v188:Disconnect()
			end
			p_u_176.humanoidDiedConn = p187.Died:Connect(function() end)
		end
	end
	p_u_176.characterChildAddedConn = p177.ChildAdded:Connect(function(p190)
		-- upvalues: (copy) v_u_189
		v_u_189(p190)
	end)
	p_u_176.characterChildRemovedConn = p177.ChildRemoved:Connect(function(p191)
		-- upvalues: (ref) v_u_7
		if v_u_7.TouchEnabled and p191:IsA("Tool") then
			p191.ManualActivationOnly = false
		end
	end)
	for _, v192 in pairs(p177:GetChildren()) do
		v_u_189(v192)
	end
end
function v_u_154.Start(p193)
	p193:Enable(true)
end
function v_u_154.Stop(p194)
	p194:Enable(false)
end
function v_u_154.CleanupPath(_)
	-- upvalues: (ref) v_u_114, (ref) v_u_115, (ref) v_u_116
	if v_u_114 then
		v_u_114:Cancel()
		v_u_114 = nil
	end
	if v_u_115 then
		v_u_115:Disconnect()
		v_u_115 = nil
	end
	if v_u_116 then
		v_u_116:Disconnect()
		v_u_116 = nil
	end
end
function v_u_154.Enable(p_u_195, p196, p197, p198)
	-- upvalues: (copy) v_u_20, (ref) v_u_114, (ref) v_u_115, (ref) v_u_116, (copy) v_u_7, (copy) v_u_22
	if p196 then
		if not p_u_195.running then
			if v_u_20.Character then
				p_u_195:OnCharacterAdded(v_u_20.Character)
			end
			p_u_195.onCharacterAddedConn = v_u_20.CharacterAdded:Connect(function(p199)
				-- upvalues: (copy) p_u_195
				p_u_195:OnCharacterAdded(p199)
			end)
			p_u_195.running = true
		end
		p_u_195.touchJumpController = p198
		if p_u_195.touchJumpController then
			p_u_195.touchJumpController:Enable(p_u_195.jumpEnabled)
		end
	else
		if p_u_195.running then
			p_u_195:DisconnectEvents()
			if v_u_114 then
				v_u_114:Cancel()
				v_u_114 = nil
			end
			if v_u_115 then
				v_u_115:Disconnect()
				v_u_115 = nil
			end
			if v_u_116 then
				v_u_116:Disconnect()
				v_u_116 = nil
			end
			local v200 = v_u_7.TouchEnabled and v_u_20.Character
			if v200 then
				for _, v201 in pairs(v200:GetChildren()) do
					if v201:IsA("Tool") then
						v201.ManualActivationOnly = false
					end
				end
			end
			p_u_195.running = false
		end
		if p_u_195.touchJumpController and not p_u_195.jumpEnabled then
			p_u_195.touchJumpController:Enable(true)
		end
		p_u_195.touchJumpController = nil
	end
	if v_u_7.KeyboardEnabled and p196 ~= p_u_195.enabled then
		p_u_195.forwardValue = 0
		p_u_195.backwardValue = 0
		p_u_195.leftValue = 0
		p_u_195.rightValue = 0
		p_u_195.moveVector = v_u_22
		if p196 then
			p_u_195:BindContextActions()
			p_u_195:ConnectFocusEventListeners()
		else
			p_u_195:UnbindContextActions()
			p_u_195:DisconnectFocusEventListeners()
		end
	end
	p_u_195.wasdEnabled = p196 and p197 and p197 or false
	p_u_195.enabled = p196
end
function v_u_154.OnRenderStepped(p202, p203)
	-- upvalues: (ref) v_u_114
	p202.isJumping = false
	if v_u_114 then
		v_u_114:OnRenderStepped(p203)
		if v_u_114 then
			p202.moveVector = v_u_114.NextActionMoveDirection
			p202.moveVectorIsCameraRelative = false
			if v_u_114.NextActionJump then
				p202.isJumping = true
			end
		else
			p202.moveVector = p202.keyboardMoveVector
			p202.moveVectorIsCameraRelative = true
		end
	else
		p202.moveVector = p202.keyboardMoveVector
		p202.moveVectorIsCameraRelative = true
	end
	if p202.jumpRequested then
		p202.isJumping = true
	end
end
function v_u_154.UpdateMovement(p204, p205)
	-- upvalues: (copy) v_u_22
	if p205 == Enum.UserInputState.Cancel then
		p204.keyboardMoveVector = v_u_22
	elseif p204.wasdEnabled then
		p204.keyboardMoveVector = Vector3.new(p204.leftValue + p204.rightValue, 0, p204.forwardValue + p204.backwardValue)
	end
end
function v_u_154.UpdateJump(_) end
function v_u_154.SetShowPath(_, p206)
	-- upvalues: (ref) v_u_14
	v_u_14 = p206
end
function v_u_154.GetShowPath(_)
	-- upvalues: (ref) v_u_14
	return v_u_14
end
function v_u_154.SetWaypointTexture(_, p207)
	-- upvalues: (copy) v_u_21
	v_u_21.SetWaypointTexture(p207)
end
function v_u_154.GetWaypointTexture(_)
	-- upvalues: (copy) v_u_21
	return v_u_21.GetWaypointTexture()
end
function v_u_154.SetWaypointRadius(_, p208)
	-- upvalues: (copy) v_u_21
	v_u_21.SetWaypointRadius(p208)
end
function v_u_154.GetWaypointRadius(_)
	-- upvalues: (copy) v_u_21
	return v_u_21.GetWaypointRadius()
end
function v_u_154.SetEndWaypointTexture(_, p209)
	-- upvalues: (copy) v_u_21
	v_u_21.SetEndWaypointTexture(p209)
end
function v_u_154.GetEndWaypointTexture(_)
	-- upvalues: (copy) v_u_21
	return v_u_21.GetEndWaypointTexture()
end
function v_u_154.SetWaypointsAlwaysOnTop(_, p210)
	-- upvalues: (copy) v_u_21
	v_u_21.SetWaypointsAlwaysOnTop(p210)
end
function v_u_154.GetWaypointsAlwaysOnTop(_)
	-- upvalues: (copy) v_u_21
	return v_u_21.GetWaypointsAlwaysOnTop()
end
function v_u_154.SetFailureAnimationEnabled(_, p211)
	-- upvalues: (ref) v_u_15
	v_u_15 = p211
end
function v_u_154.GetFailureAnimationEnabled(_)
	-- upvalues: (ref) v_u_15
	return v_u_15
end
function v_u_154.SetIgnoredPartsTag(_, p212)
	-- upvalues: (copy) v_u_50
	v_u_50(p212)
end
function v_u_154.GetIgnoredPartsTag(_)
	-- upvalues: (ref) v_u_40
	return v_u_40
end
function v_u_154.SetUseDirectPath(_, p213)
	-- upvalues: (ref) v_u_16
	v_u_16 = p213
end
function v_u_154.GetUseDirectPath(_)
	-- upvalues: (ref) v_u_16
	return v_u_16
end
function v_u_154.SetAgentSizeIncreaseFactor(_, p214)
	-- upvalues: (ref) v_u_17
	v_u_17 = 1 + p214 / 100
end
function v_u_154.GetAgentSizeIncreaseFactor(_)
	-- upvalues: (ref) v_u_17
	return (v_u_17 - 1) * 100
end
function v_u_154.SetUnreachableWaypointTimeout(_, p215)
	-- upvalues: (ref) v_u_18
	v_u_18 = p215
end
function v_u_154.GetUnreachableWaypointTimeout(_)
	-- upvalues: (ref) v_u_18
	return v_u_18
end
function v_u_154.SetUserJumpEnabled(p216, p217)
	p216.jumpEnabled = p217
	if p216.touchJumpController then
		p216.touchJumpController:Enable(p217)
	end
end
function v_u_154.GetUserJumpEnabled(p218)
	return p218.jumpEnabled
end
function v_u_154.MoveTo(_, p219, p220, p221)
	-- upvalues: (copy) v_u_20, (copy) v_u_110, (copy) v_u_125
	local v222 = v_u_20.Character
	if v222 == nil then
		return false
	end
	local v223 = v_u_110(p219, Vector3.new(0, 1, 0), p221)
	if not (v223 and v223:IsValidPath()) then
		return false
	end
	v_u_125(v223, p219, nil, v222, p220)
	return true
end
return v_u_154
