-- decompiled by Sentinel (took 8.625907ms)
local v_u_1 = _G.HDAdminMain
local _ = v_u_1.settings
local v_u_2 = {}
local v_u_3 = {}
local v_u_4 = {}
local v_u_5 = TweenInfo.new(0.7)
local v133 = {
	["ping"] = {
		["Function"] = function(_, _)
			-- upvalues: (copy) v_u_1
			local v6 = tick()
			v_u_1.signals.GetPing:InvokeServer(math.random(1, 1000))
			local v7 = (tick() - v6) / 2 * 1000 * 1000 + 0.5
			local v8 = math.floor(v7) / 1000
			v_u_1:GetModule("Notices"):Notice("Notice", v_u_1.hdAdminCoreName, "Your ping is " .. v8 .. "!")
		end
	}, 
	["blur"] = {
		["Function"] = function(_, p9)
			-- upvalues: (copy) v_u_1
			v_u_1.blur.Size = p9[2] ~= 0 and p9[2] or 20
		end, 
		["UnFunction"] = function(_, _)
			-- upvalues: (copy) v_u_1
			v_u_1.blur.Size = 0
		end
	}, 
	["showGuis"] = {
		["Function"] = function(_, _)
			-- upvalues: (ref) v_u_2
			for v10, _ in pairs(v_u_2) do
				v10.Enabled = true
			end
			v_u_2 = {}
		end
	}, 
	["hideGuis"] = {
		["Function"] = function(_, _)
			-- upvalues: (copy) v_u_1, (ref) v_u_2
			for _, v11 in pairs(v_u_1.playerGui:GetChildren()) do
				if v11:IsA("ScreenGui") and v11.Name ~= "Chat" and v11.Name ~= "HDAdminGUIs" then
					if v11.Enabled == true then
						v_u_2[v11] = true
					end
					v11.Enabled = false
				end
			end
		end
	}, 
	["view"] = {
		["Function"] = function(_, p12)
			-- upvalues: (copy) v_u_1
			local v13 = p12[1]
			local v14 = v_u_1:GetModule("cf"):GetHumanoid(v13)
			if v14 then
				v_u_1:GetModule("cf"):SetCameraSubject(v14)
			end
		end, 
		["UnFunction"] = function(p15, _)
			-- upvalues: (copy) v_u_1
			local v16 = v_u_1:GetModule("cf"):GetHumanoid(p15)
			if v16 then
				v_u_1.signals.SetCameraSubject:FireClient(p15, v16)
			end
		end
	}, 
	["nightVision"] = {
		["Function"] = function(_, _)
			-- upvalues: (copy) v_u_1
			for _, v17 in pairs(v_u_1.players:GetChildren()) do
				local v18 = v_u_1:GetModule("cf"):GetHead(v17)
				if v17.Name ~= v_u_1.player.Name and v18 then
					for _, v19 in pairs(v17.Character:GetChildren()) do
						if v19:IsA("BasePart") and v19:FindFirstChild("HDNightVision") == nil then
							for v20 = 1, 6 do
								local v21 = v_u_1.client.Assets.NightVision:Clone()
								v21.Parent = v19
								v21.Face = v20 - 1
								v21.Name = "HDAdminNightVision"
							end
						end
					end
					local v22 = v_u_1.client.Assets.Nickname:Clone()
					v22.TextLabel.Text = v17.Name
					v22.Parent = v18
					v22.Name = "HDAdminNightVision"
				end
			end
		end, 
		["UnFunction"] = function(_, _)
			-- upvalues: (copy) v_u_1
			for _, v23 in pairs(v_u_1.players:GetChildren()) do
				if v23.Character then
					for _, v24 in pairs(v23.Character:GetDescendants()) do
						if v24.Name == "HDAdminNightVision" then
							v24:Destroy()
						end
					end
				end
			end
		end
	}, 
	["cmdbar"] = {
		["Function"] = function(_, _)
			-- upvalues: (copy) v_u_1
			v_u_1:GetModule("CmdBar"):OpenCmdBar()
		end
	}, 
	["cmdbar2"] = {
		["Function"] = function(_, _)
			-- upvalues: (copy) v_u_1
			v_u_1:GetModule("cf"):CreateNewCommandMenu("cmdbar2", {}, 2)
		end
	}, 
	["rainbowFart"] = {
		["Function"] = function(_, p25)
			-- upvalues: (copy) v_u_1
			local v26 = p25[1]
			local v27 = { 174658105, 148635119 }
			local function v36(p28, p29, p30, p31, p32)
				-- upvalues: (ref) v_u_1
				local v33 = v_u_1.client.Assets.Poop:Clone()
				local v34 = Instance.new("Sound", v33)
				v34.SoundId = "rbxassetid://" .. p30
				v34.Volume = 0.5
				v34:Play()
				if not v34.IsPlaying then
					v34.Played:Wait()
				end
				wait()
				v33.CanCollide = false
				local v35 = (p31 - 1) * 0.05
				v33.Color = Color3.fromHSV(v35, 0.7, 0.7)
				v33.CFrame = p29.Seat.CFrame * CFrame.new(0, p31 * 1 - 0.5, 0)
				p28:SetPrimaryPartCFrame(v33.CFrame * CFrame.new(0, 3, 0))
				v33.Parent = p32
			end
			local v37 = v_u_1:GetModule("cf"):GetHead(v26)
			if v37 then
				local v38 = v37.CFrame
				v26.Character.Parent = nil
				local v39, v40 = v_u_1:GetModule("cf"):CreateClone(v26.Character)
				if v40.sit.Length <= 0 then
					repeat
						wait()
					until 0 < v40.sit.Length
				end
				v39.Head.CFrame = v38
				if v26 == v_u_1.player then
					v_u_1:GetModule("cf"):Movement(false)
					v_u_1:GetModule("cf"):SetCameraSubject(v39.Humanoid)
				end
				local v41 = 0
				local v42 = Instance.new("Model", workspace)
				local v43 = v_u_1.client.Assets.Toilet:Clone()
				v42.Name = v26.Name .. "\'s poop"
				v43.PrimaryPart = v43.Seat
				v43:SetPrimaryPartCFrame(v39.HumanoidRootPart.CFrame * CFrame.new(0, -1, 0))
				v43.Parent = workspace
				v43.Seat:Sit(v39.Humanoid)
				v40.sit:Play(0)
				v39.Head.face.Texture = "rbxassetid://304907108"
				wait()
				v39.PrimaryPart = v39.Head
				v39:SetPrimaryPartCFrame(v43.PrimaryPart.CFrame * CFrame.new(0, 3, 0))
				for _, v44 in pairs(v39:GetChildren()) do
					if v44:IsA("BasePart") and v44.Name ~= "HumanoidRootPart" then
						v44.Anchored = true
					end
				end
				wait(1)
				local v45 = v39.HumanoidRootPart
				local v46 = Instance.new("Sound", v45)
				v46.SoundId = "rbxassetid://" .. 174658105
				v46.Volume = 0.5
				v46:Play()
				if not v46.IsPlaying then
					v46.Played:Wait()
				end
				wait()
				wait(2)
				local v47 = v41 + 1
				v36(v39, v43, 148635119, v47, v42, v42)
				v39.Head.face.Texture = "rbxassetid://338312149"
				wait(1.5)
				v39.Head.face.Texture = "rbxassetid://316545711"
				for v48 = 1, 20 do
					if v48 == 18 then
						for _, v49 in pairs(v39:GetChildren()) do
							if v49:IsA("BasePart") and v49.Name ~= "HumanoidRootPart" then
								v49.Anchored = false
							end
						end
						local v50 = Instance.new("Explosion")
						v50.Position = v39.Head.Position
						v50.Parent = v39
						v50.DestroyJointRadiusPercent = 0
						v39:BreakJoints()
					elseif 19 < v48 then
						for _, v51 in pairs(v42:GetChildren()) do
							v51.Anchored = false
							v51.CanCollide = true
						end
					end
					v47 = v47 + 1
					if 20 <= v48 then
						wait(1.5)
					else
						v36(v39, v43, v27[math.random(1, #v27)], v47, v42)
						wait()
					end
				end
				wait(3)
				v42:Destroy()
				v43:Destroy()
				v39:Destroy()
				local v52 = v26 == v_u_1.player and v_u_1:GetModule("cf"):GetHumanoid(v26)
				if v52 then
					v_u_1:GetModule("cf"):Movement(true)
					v_u_1:GetModule("cf"):SetCameraSubject(v52)
				end
				v26.Character.Parent = workspace
			end
		end
	}, 
	["laserEyes"] = {
		["DisplayLaser"] = function(_, p53, p54)
			local v55 = p53:FindFirstChild("LeftBeam")
			if v55 then
				v55.Enabled = p54
				p53.RightBeam.Enabled = p54
				p53.MidAttachment.GlowHit.Enabled = p54
			end
		end, 
		["Activate"] = function(p56)
			-- upvalues: (copy) v_u_1
			local v57 = p56.Name
			local v58 = v_u_1:GetModule("cf"):GetHead()
			local v59 = v_u_1:GetModule("cf"):GetHumanoid()
			local v60 = v_u_1:GetModule("cf"):GetHRP()
			if v58 then
				if v59 then
					if v_u_1.mouseDown then
						local v61 = v58:FindFirstChild("HDAdminLaserHead")
						local v62 = v_u_1:GetModule("cf"):GetNeck()
						local v63 = v59.RigType == Enum.HumanoidRigType.R6
						v58.Parent.PrimaryPart = v60
						if v61 then
							if v62 then
								local v64 = tick() - 1
								local v65 = v62.C0
								local v66 = v59.HipHeight / 2.5
								local v67 = v61.LaserTarget
								local v68 = v67.MidAttachment2.Fire
								local v69 = v67.MidAttachment.Sparks
								local v70 = v_u_1.audio.Sizzle
								local v71 = v_u_1.audio.Sizzle2
								v70:Play()
								p56.DisplayLaser(v61, v67, true)
								repeat
									if true then
										local v72, v73 = v_u_1:GetModule("cf"):GetMousePoint(v_u_1.lastHitPosition)
										local v74 = CFrame.new(v73, v58.Position)
										local v75 = v_u_1.player:DistanceFromCharacter(v74.p)
										local v76
										if 30 < v75 then
											v74 = v74 * CFrame.new(0, 0, 30 - v75)
											v76 = true
										else
											v76 = false
										end
									end
									v67.CFrame = v74
									local v77 = v58.Position
									local v78 = v67.Position
									local v79 = v78.X
									local v80 = v77.Y
									local v81 = v78.Z
									local v82 = (Vector3.new(v79, v80, v81) - v58.Position).Unit
									if v58.Parent.PrimaryPart == nil then
										v58.Parent.PrimaryPart = v58.parent.HumanoidRootPart
									end
									local v83 = CFrame.new(Vector3.new(), v58.Parent.PrimaryPart.CFrame:VectorToObjectSpace(v82))
									local v84
									if v63 then
										v84 = v83 * CFrame.new(0, 1, 0) * CFrame.fromEulerAnglesXYZ(1.5707963267948966, 3.141592653589793, 0)
									else
										v84 = v83 * CFrame.new(0, v66, 0)
									end
									v62.C0 = v84
									if v64 < tick() - 0.6 then
										v64 = tick()
										v_u_1:GetModule("cf"):ReplicateEffect(p56.Name, { v74, v84 })
									end
									if v72 and not v76 and (v72.Parent:FindFirstChild("Humanoid") or v72.Name == "Handle") then
										v68.Enabled = true
										v69.Enabled = true
										if not v71.Playing then
											v71:Play()
										end
									else
										v68.Enabled = false
										v69.Enabled = false
										if v71.Playing then
											v71:Stop()
										end
									end
									wait()
								until not (v_u_1.mouseDown and v_u_1.commandsActive[v57] and v58 and v58.Parent and v62)
								v62.C0 = v65
								p56.DisplayLaser(v61, v67, false)
								v68.Enabled = false
								v69.Enabled = false
								v70:Stop()
								v71:Stop()
							end
						end
					end
				end
			end
			v_u_1.commandsActive[v57] = nil
		end, 
		["ReplicationEffect"] = function(p85, p86, p87)
			-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
			local v88 = p86[1]
			local v89 = p86[2]
			local v90 = v_u_1:GetModule("cf"):GetHead(p85)
			if v90 then
				local v91 = v90:FindFirstChild("HDAdminLaserHead")
				local v92 = v_u_1:GetModule("cf"):GetNeck(p85)
				if v91 and v92 then
					local v93 = v91.LaserTarget
					if v_u_3[p85] then
						v_u_3[p85] = v_u_3[p85] + 1
					else
						v_u_3[p85] = 1
						v_u_4[p85] = v92.C0
						local v94 = math.random(10, 40) - 15
						v93.CFrame = v88 * CFrame.new(0, 0, v94)
						v92.C0 = v89
						v93.MidAttachment.GlowHit.Rate = 50
						p87.DisplayLaser(v91, v93, true)
					end
					v_u_1.tweenService:Create(v93, v_u_5, {
						["CFrame"] = v88
					}):Play()
					v_u_1.tweenService:Create(v92, v_u_5, {
						["C0"] = v89
					}):Play()
					wait(0.7)
					v_u_3[p85] = v_u_3[p85] - 1
					if v_u_3[p85] <= 0 then
						p87.DisplayLaser(v91, v93, false)
						v92.C0 = v_u_4[p85]
						v_u_4[p85] = nil
						v_u_3[p85] = nil
					end
				end
			end
		end
	}, 
	["warp"] = {
		["Function"] = function(_, _)
			-- upvalues: (copy) v_u_1
			local v95 = 0.995
			local v96 = -0.005
			while true do
				if true then
					v_u_1.runService.RenderStepped:Wait()
					if v95 < 0.005 then
						v95 = 0.005
						v96 = 0.005
					elseif 1 < v95 then
						v95 = 1
						v96 = -0.005
					end
				end
				v_u_1.camera.CFrame = v_u_1.camera.CFrame * CFrame.new(0, 0, 0, v95, 0, 0, 0, v95, 0, 0, 0, 1)
				v95 = v95 + v96
				if 1 < v95 then
					return
				end
			end
		end
	}, 
	["fly"] = {
		["Activate"] = function(p97)
			-- upvalues: (copy) v_u_1
			v_u_1:GetModule("FlyCommand"):Fly(p97.Name)
		end
	}, 
	["fly2"] = {
		["Activate"] = function(p98)
			-- upvalues: (copy) v_u_1
			v_u_1:GetModule("FlyCommand"):Fly(p98.Name)
		end
	}, 
	["noclip"] = {
		["Activate"] = function(p99)
			-- upvalues: (copy) v_u_1
			local v100 = p99.Name
			local v101 = v_u_1:GetModule("cf"):GetHumanoid()
			local v102 = v_u_1:GetModule("cf"):GetHRP()
			if v101 and v102 then
				local v103 = tick()
				v102.Anchored = true
				v101.PlatformStand = true
				repeat
					wait()
					local v104 = tick() - v103
					local v105 = (v_u_1.camera.Focus.p - v_u_1.camera.CFrame.p).unit
					local v106 = v_u_1:GetModule("cf"):GetNextMovement(v104, v_u_1.commandSpeeds[v100])
					local v107 = v102.Position
					v102.CFrame = CFrame.new(v107, v107 + v105) * v106
					v103 = tick()
				until not v_u_1.commandsActive[v100]
				if v102 and v101 then
					v102.Anchored = false
					v102.Velocity = Vector3.new()
					v101.PlatformStand = false
				end
			end
		end
	}, 
	["noclip2"] = {
		["Activate"] = function(p108)
			-- upvalues: (copy) v_u_1
			v_u_1:GetModule("FlyCommand"):Fly(p108.Name, true)
		end
	}, 
	["clip"] = {
		["Function"] = function(_, _, _)
			-- upvalues: (copy) v_u_1
			v_u_1:GetModule("cf"):DeactivateCommand("noclip")
		end
	}, 
	["boing"] = {
		["ExpandTime"] = 4, 
		["ExpandAmount"] = 3, 
		["EndBoing"] = {}, 
		["Function"] = function(p109, p110, p111)
			-- upvalues: (copy) v_u_1
			local v112 = p110[1]
			local v113 = v_u_1:GetModule("cf"):GetHead(v112)
			local v114 = v_u_1:GetModule("cf"):GetHumanoid(v112)
			local v115 = v113 and v114 and not p111.UnFunction(p109, p110, p111) and v113:FindFirstChild("Mesh")
			if v115 then
				local v116 = {}
				local v117 = v112.Character
				for _, v118 in pairs(v117:GetChildren()) do
					if v118:IsA("Accessory") then
						table.insert(v116, v118)
						v118.Parent = nil
					end
				end
				local v119 = v115.Scale
				local v120 = v_u_1.tweenService
				local v121 = TweenInfo.new(p111.ExpandTime, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
				local v122 = {}
				local v123 = v119.X
				local v124 = v119.Y * p111.ExpandAmount
				local v125 = v119.Z
				v122.Scale = Vector3.new(v123, v124, v125)
				v120:Create(v115, v121, v122):Play()
				local v126 = Instance.new("BindableEvent")
				p111.EndBoing[v112] = v126
				v_u_1:GetModule("cf"):WaitForEvent(v126, v114.Died, v112.CharacterAdded)
				p111.EndBoing[v112] = nil
				v126:Destroy()
				if v115 then
					local v127 = v_u_1.tweenService:Create(v115, TweenInfo.new(2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
						["Scale"] = v119
					})
					v127:Play()
					v127.Completed:Wait()
				end
				for _, v128 in pairs(v116) do
					if v117 then
						v128.Parent = v117
					else
						v128:Destroy()
					end
				end
			end
		end, 
		["UnFunction"] = function(_, p129, p130)
			local v131 = p129[1]
			local v132 = p130.EndBoing[v131]
			if v132 then
				v132:Fire()
				return true
			end
		end
	}
}
for v134, v135 in pairs(v133) do
	v135.Name = v134
end
return v133
