-- decompiled by Sentinel (took 7.748228ms)
local v_u_1 = {}
local v_u_2 = _G.HDAdminMain
function v_u_1.WaitForEvent(_, ...)
	local v3 = ({ ... })[1]
	local v_u_4
	if typeof(v3) == "Instance" and v3:IsA("BindableEvent") then
		v_u_4 = v3
	else
		v_u_4 = Instance.new("BindableEvent")
	end
	local v5 = {}
	for _, v6 in pairs({ ... }) do
		if v6 ~= v3 then
			v5[#v5 + 1] = v6:Connect(function()
				-- upvalues: (ref) v_u_4
				v_u_4:Fire()
			end)
		end
	end
	v_u_4.Event:Wait()
	v_u_4:Destroy()
	for _, v7 in pairs(v5) do
		v7:Disconnect()
	end
end
function v_u_1.CreateSound(_, p8)
	local v9 = Instance.new("Sound")
	for v10, v12 in pairs(p8) do
		if v10 == "SoundId" then
			local v12 = "rbxassetid://" .. v12
		end
		v9[v10] = v12
	end
	return v9
end
function v_u_1.FormatNotice2(_, p13, p14, ...)
	-- upvalues: (copy) v_u_2
	local v15 = v_u_2:GetModule("CoreNotices"):GetNotice(p13)
	v15[2] = string.format(v15[2], ...)
	v15[3] = p14
	return v15
end
function v_u_1.FormatNotice(_, p16, ...)
	-- upvalues: (copy) v_u_2
	local v17 = v_u_2:GetModule("CoreNotices"):GetNotice(p16)
	v17[2] = string.format(v17[2], ...)
	return v17
end
function v_u_1.RandomiseTable(_, p18, p19)
	local v20
	if p19 then
		local v21 = os.time() / p19
		v20 = math.floor(v21)
	else
		v20 = p19
	end
	local v22 = {}
	if p18[1] ~= nil then
		for v23 = 1, #p18 do
			if p19 then
				math.randomseed(v20 + v23)
			end
			local v24 = math.random(1, #v22 + 1)
			local v25 = p18[v23]
			table.insert(v22, v24, v25)
		end
	end
	return v22
end
function v_u_1.IsPunished(_, p26)
	return (not p26 or not p26.Character or p26.Character.Parent ~= workspace) and true or false
end
function v_u_1.UnSeatPlayer(_, p27)
	-- upvalues: (copy) v_u_1
	local v28 = v_u_1:GetHumanoid(p27)
	if v28 then
		local v29 = v28.SeatPart
		local v30 = v29 and v29:FindFirstChild("SeatWeld")
		if v30 then
			v30:Destroy()
			wait()
		end
	end
end
function v_u_1.GetBanDateString(_, p31, p32)
	-- upvalues: (copy) v_u_2
	local v33 = p31.min or p32.min
	local v34 = p31.hour or p32.hour
	local v35 = p31.day or p32.day
	local v36 = v_u_2:GetModule("cf"):GetMonths()[p31.month or p32.month]
	local v37 = p31.year or p32.year
	if v33 < 10 then
		v33 = "0" .. v33
	end
	if v34 < 10 then
		v34 = "0" .. v34
	end
	local v38 = tonumber((string.sub(v35, -1)))
	local v39 = "th"
	if v38 < 10 or 15 < v38 then
		v39 = v38 == 1 and "st" or v38 == 2 and "nd" or v38 == 3 and "rd" or v39
	end
	return v34 .. ":" .. v33 .. ", " .. v35 .. v39 .. " " .. v36 .. " " .. v37
end
function v_u_1.GetTimeAmount(_, p40, p41)
	local v42 = 0
	local v43 = ""
	local v44 = p41 < 0 and 0 or p41
	if p40 == "m" then
		v44 = 60 < v44 and 60 or v44
		v42 = v44 * 60
		v43 = "Minutes"
	elseif p40 == "h" then
		v44 = 24 < v44 and 24 or v44
		v42 = v44 * 3600
		v43 = "Hours"
	elseif p40 == "d" then
		v44 = 100000 < v44 and 100000 or v44
		v42 = v44 * 86400
		v43 = "Days"
	end
	return v42, v43, v44
end
function v_u_1.GetMonths(_)
	return {
		"January", 
		"February", 
		"March", 
		"April", 
		"May", 
		"June", 
		"July", 
		"August", 
		"September", 
		"October", 
		"November", 
		"December"
	}
end
function v_u_1.AnchorModel(_, p45, p46)
	for _, v47 in pairs(p45:GetDescendants()) do
		if v47:IsA("BasePart") and not v47.Parent:IsA("Accessory") then
			v47.Anchored = p46
		end
	end
end
function v_u_1.TweenModel(_, p_u_48, p49, p50)
	-- upvalues: (copy) v_u_2
	local v_u_51 = Instance.new("CFrameValue")
	v_u_51.Value = p_u_48:GetPrimaryPartCFrame()
	local v_u_52 = nil
	v_u_52 = v_u_51:GetPropertyChangedSignal("Value"):Connect(function()
		-- upvalues: (copy) p_u_48, (ref) v_u_52, (copy) v_u_51
		if p_u_48.PrimaryPart == nil then
			v_u_52:Disconnect()
		else
			p_u_48:SetPrimaryPartCFrame(v_u_51.Value)
		end
	end)
	local v53 = v_u_2.tweenService:Create(v_u_51, p50, {
		["Value"] = p49
	})
	v53:Play()
	v53.Completed:Connect(function()
		-- upvalues: (copy) v_u_51
		v_u_51:Destroy()
	end)
end
function v_u_1.Movement(_, p54, p55)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	if p55 == nil then
		p55 = v_u_2.player
	end
	local v56 = v_u_1:GetHRP(p55)
	local v57 = v_u_1:GetHumanoid(p55)
	if v56 and v57 then
		if not p54 then
			local v58 = v57.WalkSpeed
			v57.WalkSpeed = 0
			wait()
			v57.WalkSpeed = v58
			v56.Anchored = true
			return
		end
		v56.Anchored = false
	end
end
function v_u_1.SetFakeBodyParts(_, p59, p60)
	-- upvalues: (copy) v_u_2
	for _, v61 in pairs(p59:GetChildren()) do
		if v_u_2:GetModule("cf"):CheckBodyPart(v61) then
			local v62 = v_u_2:GetModule("MorphHandler"):CreateFakeBodyPart(p59, v61)
			for v63, v64 in pairs(p60) do
				if v63 == "Material" then
					v62.Material = v64
					if v64 == Enum.Material.Glass then
						v62.Transparency = 0.5
					else
						v62.Transparency = 0
					end
				elseif v63 == "Reflectance" then
					v62.Reflectance = v64
				elseif v63 == "Transparency" then
					v62.Transparency = v64
				elseif v63 == "Color" then
					v62.Color = v64
				end
			end
		end
	end
end
function v_u_1.CheckBodyPart(_, p65)
	if p65:IsA("BasePart") and p65.Name ~= "HumanoidRootPart" then
		local v66 = p65.Name
		if string.sub(v66, 1, 4) ~= "Fake" then
			return true
		end
	end
	return false
end
function v_u_1.CreateClone(_, p67)
	-- upvalues: (copy) v_u_2
	if p67 == nil then
		p67 = v_u_2.player.Character
	end
	local v68 = p67:FindFirstChild("Humanoid")
	if v68 then
		p67.Archivable = true
		local v69 = p67:Clone()
		local v70 = v69.Humanoid
		v69.Name = p67.Name .. "\'s HDAdminClone"
		local v71 = v69:FindFirstChild("Chest") and true or false
		for _, v72 in pairs(v69:GetDescendants()) do
			if v72:IsA("Humanoid") then
				v72.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			elseif v72:IsA("BillboardGui") then
				v72:Destroy()
			elseif v72:IsA("Weld") and v72.Part1 ~= nil then
				v72.Part0 = v72.Parent
				if v69:FindFirstChild(v72.Part1.Name) then
					v72.Part1 = v69[v72.Part1.Name]
				elseif not v71 then
					v72:Destroy()
				end
			end
		end
		v69.Parent = workspace
		local v73 = {}
		v68:GetAppliedDescription()
		if v69:FindFirstChild("Animate") then
			for _, v74 in pairs(v69.Animate:GetChildren()) do
				local v75 = v74:GetChildren()[1]
				if v75 then
					v73[v74.Name] = v70:LoadAnimation(v75)
				end
			end
			v73.idle:Play()
		end
		return v69, v73
	end
end
function v_u_1.SetTransparency(_, p76, p77, p78)
	-- upvalues: (copy) v_u_2
	local v79 = v_u_2.players:GetPlayerFromCharacter(p76)
	if (not v79 or not v_u_2.pd[v79] or not v_u_2.pd[v79].Items.UnderControl or p78) and p76 then
		local v80 = p76:FindFirstChild("FakeHead") and true or false
		for _, v81 in pairs(p76:GetDescendants()) do
			if v81:IsA("BasePart") and v81.Name ~= "HumanoidRootPart" or v81.Name == "face" and v81:IsA("Decal") then
				local v82 = v81:FindFirstChild("OriginalTransparency")
				if p77 == 1 and v81.Transparency ~= 0 and not v82 then
					local v83 = Instance.new("IntValue")
					v83.Name = "OriginalTransparency"
					v83.Value = v81.Transparency
					v83.Parent = v81
				elseif p77 == 0 and v82 then
					v81.Transparency = v82.Value
					v82:Destroy()
				elseif not v80 or p76:FindFirstChild(v81.Name .. "Fake") == nil then
					v81.Transparency = p77
				end
			elseif v81:IsA("ParticleEmitter") and v81.Name == "BodyEffect" or v81:IsA("PointLight") then
				if p77 == 1 then
					v81.Enabled = false
				elseif p77 == 0 then
					v81.Enabled = true
				end
			elseif v81:IsA("BillboardGui") then
				if p77 == 1 then
					v81.Enabled = false
				elseif p77 == 0 then
					v81.Enabled = true
				end
			end
		end
	end
end
function v_u_1.GetMessageTime(_, p84)
	return 3 + string.len(p84) / 30
end
function v_u_1.GetProductInfo(_, p_u_85)
	-- upvalues: (copy) v_u_2
	local v86, v87 = pcall(function()
		-- upvalues: (ref) v_u_2, (copy) p_u_85
		return v_u_2.marketplaceService:GetProductInfo(p_u_85)
	end)
	return not v86 and {} or v87
end
function v_u_1.CheckIfValidSound(_, p88)
	-- upvalues: (copy) v_u_1
	return v_u_1:GetProductInfo(p88).AssetTypeId == 3
end
function v_u_1.GetChar(_, p89)
	-- upvalues: (copy) v_u_2
	if p89 == nil then
		p89 = v_u_2.player
	end
	if p89 then
		return p89.Character
	end
end
function v_u_1.GetHRP(_, p90)
	-- upvalues: (copy) v_u_2
	if p90 == nil then
		p90 = v_u_2.player
	end
	if p90 and p90.Character then
		return p90.Character:FindFirstChild("HumanoidRootPart")
	end
end
function v_u_1.GetNeck(_, p91)
	-- upvalues: (copy) v_u_2
	if p91 == nil then
		p91 = v_u_2.player
	end
	local v92 = p91 and p91.Character and p91.Character:FindFirstChild("Head")
	if v92 then
		local v93 = v92:FindFirstChild("Neck")
		local v94 = p91.Character:FindFirstChild("Torso")
		if not v93 then
			if v94 then
				v93 = v94:FindFirstChild("Neck")
			end
		end
		return v93
	end
end
function v_u_1.GetHead(_, p95)
	-- upvalues: (copy) v_u_2
	if p95 == nil then
		p95 = v_u_2.player
	end
	if p95 and p95.Character then
		return p95.Character:FindFirstChild("Head")
	end
end
function v_u_1.GetFace(_, p96)
	-- upvalues: (copy) v_u_2
	if p96 == nil then
		p96 = v_u_2.player
	end
	if p96 and p96.Character then
		local v97 = p96.Character:FindFirstChild("Head")
		if v97 then
			local v98 = v97:FindFirstChild("face")
			if v98 and v98.ClassName == "Decal" then
				return v98
			end
		end
		return v97
	end
end
function v_u_1.GetHumanoid(_, p99)
	-- upvalues: (copy) v_u_2
	if p99 == nil then
		p99 = v_u_2.player
	end
	if p99 and p99.Character then
		return p99.Character:FindFirstChild("Humanoid")
	end
end
function v_u_1.GetProductInfo(_, p_u_100, p_u_101)
	-- upvalues: (copy) v_u_2
	local v_u_102 = {}
	local _, _ = pcall(function()
		-- upvalues: (ref) v_u_102, (ref) v_u_2, (copy) p_u_100, (copy) p_u_101
		v_u_102 = v_u_2.marketplaceService:GetProductInfo(p_u_100, p_u_101)
	end)
	return v_u_102
end
function v_u_1.GetFriends(_, p_u_103)
	-- upvalues: (copy) v_u_2
	local v104 = {}
	local v105, v106 = pcall(function()
		-- upvalues: (ref) v_u_2, (copy) p_u_103
		return v_u_2.players:GetFriendsAsync(p_u_103)
	end)
	if v105 then
		repeat
			local v107 = v106:GetCurrentPage()
			for _, v108 in pairs(v107) do
				v104[v108.Username] = v108.Id
			end
			if not v106.IsFinished then
				v106:AdvanceToNextPageAsync()
			end
		until v106.IsFinished
	end
	return v104
end
function v_u_1.GetRankName(_, p109)
	-- upvalues: (copy) v_u_2
	local v110 = ""
	for _, v111 in pairs(v_u_2.settings.Ranks) do
		local v112 = v111[1]
		local v113 = v111[2]
		if p109 == v112 then
			v110 = v113
		elseif p109 == "Donor" then
			v110 = p109
		end
	end
	return v110
end
function v_u_1.GetRankId(_, p114)
	-- upvalues: (copy) v_u_2
	local v115 = 0
	for _, v116 in pairs(v_u_2.settings.Ranks) do
		local v117 = v116[1]
		if p114 == v116[2] then
			v115 = v117
		end
	end
	return v115
end
function v_u_1.CheckRankExists(_, p118)
	-- upvalues: (copy) v_u_2
	for _, v119 in pairs(v_u_2.settings.Ranks) do
		if string.lower(v119[2]) == p118 then
			return true
		end
	end
	return false
end
function v_u_1.GetUserId(_, p_u_120)
	-- upvalues: (copy) v_u_2
	tick()
	local v121 = v_u_2.UserIdsFromName[p_u_120]
	if not v121 or v121 <= 1 then
		local v_u_122 = 1
		local _, _ = pcall(function()
			-- upvalues: (ref) v_u_122, (ref) v_u_2, (copy) p_u_120
			v_u_122 = v_u_2.players:GetUserIdFromNameAsync(p_u_120)
		end)
		v_u_2.UserIdsFromName[p_u_120] = v_u_122
		v121 = v_u_122
	end
	return v121
end
function v_u_1.GetName(_, p123)
	-- upvalues: (copy) v_u_2
	local v124 = tostring(p123)
	local v_u_125 = tonumber(p123)
	local v126 = v_u_2.UsernamesFromUserId[v124]
	if not v126 then
		local v_u_127 = ""
		if v_u_125 then
			local v128, _ = pcall(function()
				-- upvalues: (ref) v_u_127, (ref) v_u_2, (copy) v_u_125
				v_u_127 = v_u_2.players:GetNameFromUserIdAsync(v_u_125)
			end)
			if v128 then
				v_u_2.UsernamesFromUserId[v124] = v_u_127
				v126 = v_u_127
			else
				v126 = v_u_127
			end
		else
			v126 = v_u_127
		end
	end
	return v126
end
function v_u_1.FindValue(_, p129, p130)
	for _, v131 in pairs(p129) do
		if tostring(v131) == tostring(p130) then
			return true
		end
	end
	return false
end
return v_u_1
