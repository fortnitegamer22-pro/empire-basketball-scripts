-- decompiled by Sentinel (took 2.382252ms)
local v_u_1 = _G.HDAdminMain
local v2 = {}
local function v_u_6(p3, p4)
	-- upvalues: (copy) v_u_1
	for _, v5 in pairs(p3:GetDescendants()) do
		if v5:IsA("BasePart") then
			v_u_1.physicsService:SetPartCollisionGroup(v5, p4)
		end
	end
end
function v2.Fly(_, p7, p8)
	-- upvalues: (copy) v_u_1, (copy) v_u_6
	local v9 = p7 == "fly2" and "Sit" or "PlatformStand"
	local v10 = v_u_1:GetModule("cf"):GetHRP()
	local v11 = v_u_1:GetModule("cf"):GetHumanoid()
	if v10 and v11 then
		local v12 = Instance.new("BodyPosition")
		local v13 = math.huge
		local v14 = math.huge
		local v15 = math.huge
		v12.MaxForce = Vector3.new(v13, v14, v15)
		v12.Position = v10.Position + Vector3.new(0, 4, 0)
		v12.Name = "HDAdminFlyForce"
		v12.Parent = v10
		local v16 = Instance.new("BodyGyro")
		v16.D = 50
		local v17 = math.huge
		local v18 = math.huge
		local v19 = math.huge
		v16.MaxTorque = Vector3.new(v17, v18, v19)
		if p8 then
			v16.P = 2000
		else
			v16.P = 200
		end
		v16.Name = "HDAdminFlyGyro"
		v16.CFrame = v10.CFrame
		v16.Parent = v10
		local v20 = 0
		local v21 = 0
		if p8 then
			v_u_6(workspace, "Group1")
			v_u_6(v_u_1.player.Character, "Group2")
		end
		local v22 = tick()
		local v23 = v10.Position
		repeat
			local v24 = tick() - v22
			local v25 = (v_u_1.camera.Focus.p - v_u_1.camera.CFrame.p).unit
			local v26 = v_u_1.commandSpeeds[p7]
			local v27, v28 = v_u_1:GetModule("cf"):GetNextMovement(v24, v26 * 10)
			local v29 = v10.Position
			local v30 = CFrame.new(v29, v29 + v25) * v27
			local v31 = 750 + v26 * 0.2
			if p8 then
				v31 = v31 / 2
			end
			local v32
			if v27.p == Vector3.new() then
				v21 = v21 + 1
				v32 = 1
				if 6 < (v10.Position - v23).magnitude then
					if 4 <= v21 then
						v12.Position = v10.Position
					end
				end
			else
				v12.D = v31
				v32 = v20 + 1
				v12.Position = v30.p
				v21 = 0
			end
			v20 = 25 < math.abs(v32) and 25 or v32
			if v12.D == v31 then
				local _ = v20 * v28.X * -0.5
				local v33 = p8 and 0 or v20 * v28.Z
				v16.CFrame = v30 * CFrame.Angles(math.rad(v33), 0, 0)
			end
			v22 = tick()
			v23 = v10.Position
			v11[v9] = true
			wait()
		until not (v_u_1.commandsActive[p7] and v11 and v10)
		v12:Destroy()
		v16:Destroy()
		if v11 then
			v11[v9] = false
		end
		if p8 then
			v_u_6(workspace, "Group3")
		end
	end
	v_u_1.commandsActive[p7] = nil
end
return v2
