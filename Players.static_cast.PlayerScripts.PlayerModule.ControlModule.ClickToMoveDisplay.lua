-- decompiled by Sentinel (took 5.369357ms)
local v1 = {}
local v_u_2 = "rbxasset://textures/ui/traildot.png"
local v_u_3 = "rbxasset://textures/ui/waypoint.png"
local v_u_4 = false
local v_u_5 = UDim2.new(0, 42, 0, 50)
local v_u_6 = Vector2.new(0, 0.5)
local v_u_7 = Vector2.new(0, 1)
local v_u_8 = Vector2.new(0, 0.5)
local v_u_9 = Vector2.new(0.1, 0.5)
local v_u_10 = Vector2.new(-0.1, 0.5)
local v_u_11 = Vector2.new(1.5, 1.5)
local v_u_12 = game:GetService("TweenService")
local v_u_13 = game:GetService("RunService")
local v_u_14 = game:GetService("Workspace")
local v_u_15 = game:GetService("Players").LocalPlayer
local function v_u_27()
	-- upvalues: (ref) v_u_11, (ref) v_u_4, (ref) v_u_2, (copy) v_u_5, (copy) v_u_6, (ref) v_u_3, (copy) v_u_8
	local v16 = Instance.new("Part")
	v16.Size = Vector3.new(1, 1, 1)
	v16.Anchored = true
	v16.CanCollide = false
	v16.Name = "TrailDot"
	v16.Transparency = 1
	local v17 = Instance.new("ImageHandleAdornment")
	v17.Name = "TrailDotImage"
	v17.Size = v_u_11
	v17.SizeRelativeOffset = Vector3.new(0, 0, -0.1)
	v17.AlwaysOnTop = v_u_4
	v17.Image = v_u_2
	v17.Adornee = v16
	v17.Parent = v16
	local v18 = Instance.new("Part")
	v18.Size = Vector3.new(2, 2, 2)
	v18.Anchored = true
	v18.CanCollide = false
	v18.Name = "EndWaypoint"
	v18.Transparency = 1
	local v19 = Instance.new("ImageHandleAdornment")
	v19.Name = "TrailDotImage"
	v19.Size = v_u_11
	v19.SizeRelativeOffset = Vector3.new(0, 0, -0.1)
	v19.AlwaysOnTop = v_u_4
	v19.Image = v_u_2
	v19.Adornee = v18
	v19.Parent = v18
	local v20 = Instance.new("BillboardGui")
	v20.Name = "EndWaypointBillboard"
	v20.Size = v_u_5
	v20.LightInfluence = 0
	v20.SizeOffset = v_u_6
	v20.AlwaysOnTop = true
	v20.Adornee = v18
	v20.Parent = v18
	local v21 = Instance.new("ImageLabel")
	v21.Image = v_u_3
	v21.BackgroundTransparency = 1
	v21.Size = UDim2.new(1, 0, 1, 0)
	v21.Parent = v20
	local v22 = Instance.new("Part")
	v22.Size = Vector3.new(2, 2, 2)
	v22.Anchored = true
	v22.CanCollide = false
	v22.Name = "FailureWaypoint"
	v22.Transparency = 1
	local v23 = Instance.new("ImageHandleAdornment")
	v23.Name = "TrailDotImage"
	v23.Size = v_u_11
	v23.SizeRelativeOffset = Vector3.new(0, 0, -0.1)
	v23.AlwaysOnTop = v_u_4
	v23.Image = v_u_2
	v23.Adornee = v22
	v23.Parent = v22
	local v24 = Instance.new("BillboardGui")
	v24.Name = "FailureWaypointBillboard"
	v24.Size = v_u_5
	v24.LightInfluence = 0
	v24.SizeOffset = v_u_8
	v24.AlwaysOnTop = true
	v24.Adornee = v22
	v24.Parent = v22
	local v25 = Instance.new("Frame")
	v25.BackgroundTransparency = 1
	v25.Size = UDim2.new(0, 0, 0, 0)
	v25.Position = UDim2.new(0.5, 0, 1, 0)
	v25.Parent = v24
	local v26 = Instance.new("ImageLabel")
	v26.Image = v_u_3
	v26.BackgroundTransparency = 1
	v26.Position = UDim2.new(0, -v_u_5.X.Offset / 2, 0, -v_u_5.Y.Offset)
	v26.Size = v_u_5
	v26.Parent = v25
	return v16, v18, v22
end
local v_u_28, v_u_29, v_u_30 = v_u_27()
local function v_u_38(p31, p32)
	-- upvalues: (copy) v_u_14, (copy) v_u_15
	local v33, v34, v35 = v_u_14:FindPartOnRayWithIgnoreList(Ray.new(p32 + Vector3.new(0, 2.5, 0), (Vector3.new(0, -10, 0))), { v_u_14.CurrentCamera, v_u_15.Character })
	if v33 then
		p31.CFrame = CFrame.new(v34, v34 + v35)
		local v36 = v_u_14.CurrentCamera
		local v37 = v36:FindFirstChild("ClickToMoveDisplay")
		if not v37 then
			v37 = Instance.new("Model")
			v37.Name = "ClickToMoveDisplay"
			v37.Parent = v36
		end
		p31.Parent = v37
	end
end
local v_u_39 = {}
v_u_39.__index = v_u_39
function v_u_39.Destroy(p40)
	p40.DisplayModel:Destroy()
end
function v_u_39.NewDisplayModel(_, p41)
	-- upvalues: (ref) v_u_28, (copy) v_u_38
	local v42 = v_u_28:Clone()
	v_u_38(v42, p41)
	return v42
end
function v_u_39.new(p43, p44)
	-- upvalues: (copy) v_u_39
	local v45 = setmetatable({}, v_u_39)
	v45.DisplayModel = v45:NewDisplayModel(p43)
	v45.ClosestWayPoint = p44
	return v45
end
local v_u_46 = {}
v_u_46.__index = v_u_46
function v_u_46.Destroy(p47)
	p47.Destroyed = true
	p47.Tween:Cancel()
	p47.DisplayModel:Destroy()
end
function v_u_46.NewDisplayModel(_, p48)
	-- upvalues: (ref) v_u_29, (copy) v_u_38
	local v49 = v_u_29:Clone()
	v_u_38(v49, p48)
	return v49
end
function v_u_46.CreateTween(p50)
	-- upvalues: (copy) v_u_12, (copy) v_u_7
	local v51 = v_u_12:Create(p50.DisplayModel.EndWaypointBillboard, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true), {
		["SizeOffset"] = v_u_7
	})
	v51:Play()
	return v51
end
function v_u_46.TweenInFrom(p52, p53)
	-- upvalues: (copy) v_u_12
	p52.DisplayModel.EndWaypointBillboard.StudsOffset = Vector3.new(0, (p53 - p52.DisplayModel.Position).Y, 0)
	local v54 = v_u_12:Create(p52.DisplayModel.EndWaypointBillboard, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		["StudsOffset"] = Vector3.new(0, 0, 0)
	})
	v54:Play()
	return v54
end
function v_u_46.new(p55, p56, p57)
	-- upvalues: (copy) v_u_46
	local v_u_58 = setmetatable({}, v_u_46)
	v_u_58.DisplayModel = v_u_58:NewDisplayModel(p55)
	v_u_58.Destroyed = false
	if p57 and 5 < (p57 - p55).Magnitude then
		v_u_58.Tween = v_u_58:TweenInFrom(p57)
		coroutine.wrap(function()
			-- upvalues: (copy) v_u_58
			v_u_58.Tween.Completed:Wait()
			if not v_u_58.Destroyed then
				v_u_58.Tween = v_u_58:CreateTween()
			end
		end)()
	else
		v_u_58.Tween = v_u_58:CreateTween()
	end
	v_u_58.ClosestWayPoint = p56
	return v_u_58
end
local v_u_59 = {}
v_u_59.__index = v_u_59
function v_u_59.Hide(p60)
	p60.DisplayModel.Parent = nil
end
function v_u_59.Destroy(p61)
	p61.DisplayModel:Destroy()
end
function v_u_59.NewDisplayModel(_, p62)
	-- upvalues: (ref) v_u_30, (copy) v_u_38, (copy) v_u_14, (copy) v_u_15
	local v63 = v_u_30:Clone()
	v_u_38(v63, p62)
	local v64, v65, v66 = v_u_14:FindPartOnRayWithIgnoreList(Ray.new(p62 + Vector3.new(0, 2.5, 0), (Vector3.new(0, -10, 0))), { v_u_14.CurrentCamera, v_u_15.Character })
	if v64 then
		v63.CFrame = CFrame.new(v65, v65 + v66)
		local v67 = v_u_14.CurrentCamera
		local v68 = v67:FindFirstChild("ClickToMoveDisplay")
		if not v68 then
			v68 = Instance.new("Model")
			v68.Name = "ClickToMoveDisplay"
			v68.Parent = v67
		end
		v63.Parent = v68
	end
	return v63
end
function v_u_59.RunFailureTween(p69)
	-- upvalues: (copy) v_u_12, (copy) v_u_9, (copy) v_u_10, (copy) v_u_8
	wait(0.125)
	local v70 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local v71 = v_u_12:Create(p69.DisplayModel.FailureWaypointBillboard, v70, {
		["SizeOffset"] = v_u_9
	})
	v71:Play()
	v_u_12:Create(p69.DisplayModel.FailureWaypointBillboard.Frame, v70, {
		["Rotation"] = 10
	}):Play()
	v71.Completed:wait()
	local v72 = v_u_12:Create(p69.DisplayModel.FailureWaypointBillboard, TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true), {
		["SizeOffset"] = v_u_10
	})
	v72:Play()
	local v73 = TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 3, true)
	v_u_12:Create(p69.DisplayModel.FailureWaypointBillboard.Frame.ImageLabel, v73, {
		["ImageColor3"] = Color3.new(0.75, 0.75, 0.75)
	}):Play()
	v_u_12:Create(p69.DisplayModel.FailureWaypointBillboard.Frame, v73, {
		["Rotation"] = -10
	}):Play()
	v72.Completed:wait()
	local v74 = TweenInfo.new(0.0625, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local v75 = v_u_12:Create(p69.DisplayModel.FailureWaypointBillboard, v74, {
		["SizeOffset"] = v_u_8
	})
	v75:Play()
	v_u_12:Create(p69.DisplayModel.FailureWaypointBillboard.Frame, v74, {
		["Rotation"] = 0
	}):Play()
	v75.Completed:wait()
	wait(0.125)
end
function v_u_59.new(p76)
	-- upvalues: (copy) v_u_59
	local v77 = setmetatable({}, v_u_59)
	v77.DisplayModel = v77:NewDisplayModel(p76)
	return v77
end
local v_u_78 = Instance.new("Animation")
v_u_78.AnimationId = "rbxassetid://2874840706"
local v_u_79 = nil
local function v_u_90(p80, p81)
	-- upvalues: (copy) v_u_39, (copy) v_u_46
	local v82 = {}
	local v83 = 1
	for v84 = 1, #p80 - 1 do
		local v85 = (p80[v84].Position - p80[#p80].Position).Magnitude < 3
		local v86
		if v84 % 2 == 0 then
			v86 = not v85
		else
			v86 = false
		end
		if v86 then
			v82[v83] = v_u_39.new(p80[v84].Position, v84)
			v83 = v83 + 1
		end
	end
	table.insert(v82, (v_u_46.new(p80[#p80].Position, #p80, p81)))
	local v87 = {}
	local v88 = 1
	for v89 = #v82, 1, -1 do
		v87[v88] = v82[v89]
		v88 = v88 + 1
	end
	return v87
end
local v_u_91 = 0
function v1.CreatePathDisplay(p_u_92, p93)
	-- upvalues: (ref) v_u_91, (copy) v_u_90, (copy) v_u_13, (copy) v_u_14, (ref) v_u_11
	v_u_91 = v_u_91 + 1
	local v_u_94 = v_u_90(p_u_92, p93)
	local function v_u_98(p95)
		-- upvalues: (copy) v_u_94
		for v96 = #v_u_94, 1, -1 do
			local v97 = v_u_94[v96]
			if v97.ClosestWayPoint > p95 then
				break
			end
			v97:Destroy()
			v_u_94[v96] = nil
		end
	end
	local v_u_99 = "ClickToMoveResizeTrail" .. v_u_91
	v_u_13:BindToRenderStep(v_u_99, Enum.RenderPriority.Camera.Value - 1, function()
		-- upvalues: (copy) v_u_94, (ref) v_u_13, (copy) v_u_99, (ref) v_u_14, (ref) v_u_11
		if #v_u_94 == 0 then
			v_u_13:UnbindFromRenderStep(v_u_99)
		else
			local v100 = v_u_14.CurrentCamera.CFrame.p
			for v101 = 1, #v_u_94 do
				local v102 = v_u_94[v101].DisplayModel:FindFirstChild("TrailDotImage")
				if v102 then
					v102.Size = v_u_11 * (1 + 1.5 * math.clamp((v_u_94[v101].DisplayModel.Position - v100).Magnitude - 10, 0, 90) / 90)
				end
			end
		end
	end)
	return function()
		-- upvalues: (copy) v_u_98, (copy) p_u_92
		v_u_98(#p_u_92)
	end, v_u_98
end
local v_u_103 = nil
function v1.DisplayFailureWaypoint(p104)
	-- upvalues: (ref) v_u_103, (copy) v_u_59
	if v_u_103 then
		v_u_103:Hide()
	end
	local v_u_105 = v_u_59.new(p104)
	v_u_103 = v_u_105
	coroutine.wrap(function()
		-- upvalues: (ref) v_u_105
		v_u_105:RunFailureTween()
		v_u_105:Destroy()
		v_u_105 = nil
	end)()
end
function v1.CreateEndWaypoint(p106)
	-- upvalues: (copy) v_u_46
	return v_u_46.new(p106)
end
function v1.PlayFailureAnimation()
	-- upvalues: (copy) v_u_15, (ref) v_u_79, (copy) v_u_78
	local v107 = v_u_15.Character
	local v108
	if v107 then
		v108 = v107:FindFirstChildOfClass("Humanoid")
	else
		v108 = nil
	end
	if v108 then
		local v109
		if v108 == nil then
			v109 = v_u_79
		else
			v_u_79 = v108:LoadAnimation(v_u_78)
			assert(v_u_79, "")
			v_u_79.Priority = Enum.AnimationPriority.Action
			v_u_79.Looped = false
			v109 = v_u_79
		end
		v109:Play()
	end
end
function v1.CancelFailureAnimation()
	-- upvalues: (ref) v_u_79
	if v_u_79 ~= nil and v_u_79.IsPlaying then
		v_u_79:Stop()
	end
end
function v1.SetWaypointTexture(p110)
	-- upvalues: (ref) v_u_2, (ref) v_u_28, (ref) v_u_29, (ref) v_u_30, (copy) v_u_27
	v_u_2 = p110
	local v111, v112, v113 = v_u_27()
	v_u_28 = v111
	v_u_29 = v112
	v_u_30 = v113
end
function v1.GetWaypointTexture()
	-- upvalues: (ref) v_u_2
	return v_u_2
end
function v1.SetWaypointRadius(p114)
	-- upvalues: (ref) v_u_11, (ref) v_u_28, (ref) v_u_29, (ref) v_u_30, (copy) v_u_27
	v_u_11 = Vector2.new(p114, p114)
	local v115, v116, v117 = v_u_27()
	v_u_28 = v115
	v_u_29 = v116
	v_u_30 = v117
end
function v1.GetWaypointRadius()
	-- upvalues: (ref) v_u_11
	return v_u_11.X
end
function v1.SetEndWaypointTexture(p118)
	-- upvalues: (ref) v_u_3, (ref) v_u_28, (ref) v_u_29, (ref) v_u_30, (copy) v_u_27
	v_u_3 = p118
	local v119, v120, v121 = v_u_27()
	v_u_28 = v119
	v_u_29 = v120
	v_u_30 = v121
end
function v1.GetEndWaypointTexture()
	-- upvalues: (ref) v_u_3
	return v_u_3
end
function v1.SetWaypointsAlwaysOnTop(p122)
	-- upvalues: (ref) v_u_4, (ref) v_u_28, (ref) v_u_29, (ref) v_u_30, (copy) v_u_27
	v_u_4 = p122
	local v123, v124, v125 = v_u_27()
	v_u_28 = v123
	v_u_29 = v124
	v_u_30 = v125
end
function v1.GetWaypointsAlwaysOnTop()
	-- upvalues: (ref) v_u_4
	return v_u_4
end
return v1
