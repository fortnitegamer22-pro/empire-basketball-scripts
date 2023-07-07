-- decompiled by Sentinel (took 53.387642ms)
if script.Name:match("\7") then
	wait()
	script.Parent = nil
	script.Name = ""
	for _ = 1, 9 do
		script.Name = script.Name .. string.char(math.random(255))
	end
	local function v_u_8(p_u_1, p_u_2, p3, _, _)
		-- upvalues: (ref) v_u_8
		local v4, v5 = pcall(function()
			-- upvalues: (copy) p_u_1, (copy) p_u_2
			return p_u_1[p_u_2]
		end)
		if v4 then
			return v5
		end
		if p3 then
			for _, v6 in next, p_u_1:children() do
				local v7 = v_u_8(v6, p_u_2, true)
				if v7 then
					return v7
				end
			end
		end
		return nil
	end
	local function v_u_10(p9, ...)
		return coroutine.resume(coroutine.create(p9), ...)
	end
	local v_u_11 = {
		["workspace"] = game:GetService("Workspace"), 
		["Teams"] = game:GetService("Teams"), 
		["Debris"] = game:GetService("Debris"), 
		["Content"] = game:GetService("ContentProvider"), 
		["Market"] = game:GetService("MarketplaceService"), 
		["UIS"] = game:GetService("UserInputService"), 
		["TP"] = game:GetService("TeleportService"), 
		["Collection"] = game:GetService("CollectionService"), 
		["Players"] = game:GetService("Players"), 
		["Lighting"] = game:GetService("Lighting"), 
		["Badge"] = game:GetService("BadgeService"), 
		["Run"] = game:GetService("RunService"), 
		["RStorage"] = game:GetService("ReplicatedStorage"), 
		["Insert"] = game:GetService("InsertService"), 
		["SS"] = game:GetService("SoundService"), 
		["HTTP"] = game:GetService("HttpService"), 
		["StarterGui"] = game:GetService("StarterGui"), 
		["StarterPack"] = game:GetService("StarterPack"), 
		["StarterPlayer"] = game:GetService("StarterPlayer")
	}
	local v_u_12 = Vector3.new
	local v_u_13 = Vector2.new
	local v_u_14 = UDim2.new
	local v_u_15 = CFrame.new
	local v_u_16 = CFrame.Angles
	local v_u_17 = math.rad
	local _ = math.deg
	local _ = math.random
	local v_u_18 = math.abs
	local v_u_19 = math.floor
	local _ = math.ceil
	local v_u_20 = math.min
	local v_u_21 = math.max
	local v_u_22 = Color3.new
	local v_u_23 = BrickColor.new
	local v_u_24 = "BackgroundTransparency"
	local v_u_25 = "ImageTransparency"
	local v_u_26 = "TextTransparency"
	local v_u_27 = "TextStrokeTransparency"
	local v_u_28 = "AbsolutePosition"
	local v_u_29 = "AbsoluteSize"
	local v_u_30 = "UserInputType"
	local v_u_31 = game.Players.LocalPlayer
	local v_u_32 = {}
	local v_u_33 = {}
	local v_u_34 = {}
	local v_u_35 = {}
	local v_u_36 = {}
	local v_u_37 = {}
	local v_u_38 = {}
	local _ = {
		["Color"] = v_u_22(), 
		["ColorTransparency"] = 0.8, 
		["AdminCredit"] = true, 
		["AutoCleanDelay"] = 30, 
		["CommandBar"] = true, 
		["FunCommands"] = true, 
		["Prefix"] = ":", 
		["GroupAdmin"] = {}, 
		["VIPAdmin"] = {}
	}
	for _, v39 in next, {
		313101943, 
		305266753, 
		305291549, 
		305807605, 
		305807572, 
		305807549, 
		313321271, 
		306774746
	}, nil do
		v_u_11.Content:Preload("rbxassetid://" .. v39)
	end
	repeat
		wait()
	until v_u_31:GetMouse() and workspace.CurrentCamera and v_u_8(v_u_31, "PlayerGui") and v_u_8(v_u_31, "KDonor")
	local v_u_40 = workspace.CurrentCamera
	local v_u_41 = v_u_31:GetMouse()
	local v_u_42 = v_u_31.Character
	local v_u_43 = v_u_31.PlayerGui
	local v_u_44 = v_u_31.KDonor
	local v45 = v_u_11.RStorage
	repeat
		local v_u_46 = v_u_8(v45, "b\7\n\7\n\7")
		wait()
	until v_u_46
	local v_u_47 = v_u_11.Run.RenderStepped
	local v_u_48 = {
		["s"] = script, 
		["uID"] = ""
	}
	local v_u_49 = v_u_8(v_u_46, "\7dmi\n")
	local v_u_50 = v_u_8(v_u_46, "\8\7\n")
	local v_u_51 = v_u_8(v_u_46, "log")
	local v_u_52 = v_u_8(v_u_46, "clog")
	local function v_u_54(p53)
		-- upvalues: (copy) v_u_47
		for _ = 1, p53 or 1 do
			v_u_47:wait()
		end
	end
	function v_u_48.unMapTab(p55, _)
		-- upvalues: (copy) v_u_48
		local v56 = {}
		for v57, v58 in next, p55, nil do
			if type(v58) == "table" then
				v56[tostring(v57)] = v_u_48.unMapTab(v58)
			else
				v56[tonumber(v57)] = v58
			end
		end
		return v56
	end
	function v_u_48.AssetInfo(p59)
		-- upvalues: (ref) v_u_11
		return v_u_11.Market:GetProductInfo(p59)
	end
	function v_u_48.RImage(p60, _, _)
		-- upvalues: (copy) v_u_48
		local v61 = v_u_48.AssetInfo(p60)
		if v61.AssetTypeId == 1 then
			return p60
		end
		local v62 = v61.Creator.Id
		local v63 = p60
		repeat
			v63 = v63 - 1
		until v_u_48.AssetInfo(p60).Creator.Id == v62 or 10 < p60 - v63
		return v63
	end
	function v_u_48.unCache(p64, _, _, _)
		local v65 = {}
		for v66 in p64:gmatch("%S+") do
			local v67, v68 = v66:match("(.+):(.+)")
			v65[tonumber(v67)] = tonumber(v68)
		end
		return v65
	end
	function v_u_48.Merge(p69, p70)
		for v71, v72 in next, p70, nil do
			p69[v71] = v72
		end
		return p69
	end
	function v_u_48.UpdateAdmins()
		-- upvalues: (ref) v_u_33, (copy) v_u_48, (ref) v_u_49
		v_u_33 = v_u_48.unCache(v_u_49.Value)
	end
	function v_u_48.Stroke(p73)
		-- upvalues: (copy) v_u_21
		return 0.5 < v_u_21(p73.r, p73.g) and Color3.new() or Color3.new(1, 1, 1)
	end
	function v_u_48.Hide(p74, p75, p76, p77)
		-- upvalues: (ref) v_u_25, (ref) v_u_26, (ref) v_u_27, (ref) v_u_24, (ref) v_u_8, (ref) v_u_54
		local v78 = p76 or 0.2
		if not p77 then
			local v_u_79 = {}
			local function v_u_84(p80, _)
				-- upvalues: (ref) v_u_25, (ref) v_u_26, (ref) v_u_27, (ref) v_u_24, (ref) v_u_8, (ref) v_u_79, (ref) v_u_84
				local v81 = {}
				for _, v82 in next, {
					v_u_25, 
					v_u_26, 
					v_u_27, 
					v_u_24
				}, nil do
					if v_u_8(p80, v82) and p80[v82] ~= 1 then
						v81[v82] = { p80[v82], 1 - p80[v82] }
					end
				end
				v_u_79[#v_u_79 + 1] = { p80, v81 }
				for _, v83 in next, p80:children() do
					v_u_84(v83)
				end
			end
			v_u_84(p74)
			p74.Visible = true
			p77 = v_u_79
		end
		if v78 ~= 0 then
			local v85 = tick()
			local v86 = 1 / v78
			repeat
				local v87 = (tick() - v85) * v86
				for _, v88 in next, p77, nil do
					for v89, v90 in next, v88[2], nil do
						v88[1][v89] = v90[1] + v90[2] * v87
					end
				end
				v_u_54()
			until 1 <= v87
		end
		p74.Visible = false
		if p75 then
			p74:Destroy()
		else
			for _, v91 in next, p77, nil do
				for v92, v93 in next, v91[2], nil do
					v91[1][v92] = v93[1]
				end
			end
		end
	end
	function v_u_48.Show(p94, p95, p96)
		-- upvalues: (ref) v_u_25, (ref) v_u_26, (ref) v_u_27, (ref) v_u_24, (ref) v_u_8, (ref) v_u_54
		local v97 = p95 or 0.2
		if not p96 then
			local v_u_98 = {}
			local function v_u_103(p99, _)
				-- upvalues: (ref) v_u_25, (ref) v_u_26, (ref) v_u_27, (ref) v_u_24, (ref) v_u_8, (ref) v_u_98, (ref) v_u_103
				local v100 = {}
				for _, v101 in next, {
					v_u_25, 
					v_u_26, 
					v_u_27, 
					v_u_24
				}, nil do
					if v_u_8(p99, v101) and p99[v101] ~= 1 then
						v100[v101] = { p99[v101], 1 - p99[v101] }
						p99[v101] = 1
					end
				end
				v_u_98[#v_u_98 + 1] = { p99, v100 }
				for _, v102 in next, p99:children() do
					v_u_103(v102)
				end
			end
			v_u_103(p94)
			p94.Visible = true
			p96 = v_u_98
		end
		if v97 ~= 0 then
			local v104 = tick()
			local v105 = 1 / v97
			repeat
				local v106 = 1 - (tick() - v104) * v105
				for _, v107 in next, p96, nil do
					for v108, v109 in next, v107[2], nil do
						v107[1][v108] = v109[1] + v109[2] * v106
					end
				end
				v_u_54()
			until v106 <= 0
		end
		for _, v110 in next, p96, nil do
			for v111, v112 in next, v110[2], nil do
				v110[1][v111] = v112[1]
			end
		end
	end
	function v_u_48.Drag(p_u_113, p_u_114, p_u_115, p_u_116, _, p_u_117, p_u_118)
		-- upvalues: (ref) v_u_30, (copy) v_u_13, (ref) v_u_28, (ref) v_u_41, (ref) v_u_11, (ref) v_u_29, (copy) v_u_14, (copy) v_u_20, (copy) v_u_21, (ref) v_u_54
		local v_u_119 = p_u_113.Parent
		p_u_113.InputBegan:connect(function(p120)
			-- upvalues: (ref) v_u_30, (ref) v_u_13, (copy) p_u_113, (ref) v_u_28, (ref) v_u_41, (ref) p_u_116, (ref) p_u_118, (ref) v_u_11, (ref) v_u_119, (ref) p_u_117, (copy) p_u_114, (copy) p_u_115, (ref) v_u_29, (ref) v_u_14, (ref) v_u_20, (ref) v_u_21, (ref) v_u_54
			if p120[v_u_30] == Enum[v_u_30].MouseButton1 or p120[v_u_30] == Enum[v_u_30].Touch then
				local v121 = v_u_13(p_u_113[v_u_28].X - v_u_41.X, p_u_113[v_u_28].Y - v_u_41.Y - 36)
				p_u_116 = v121
				p_u_118 = v_u_11.UIS.InputEnded:connect(function(p122)
					-- upvalues: (ref) v_u_30, (ref) p_u_116
					if p122[v_u_30] == Enum[v_u_30].MouseButton1 or p122[v_u_30] == Enum[v_u_30].Touch then
						p_u_116 = nil
					end
				end)
				while p_u_116 == v121 and p_u_113 and p_u_113.Parent == v_u_119 do
					p_u_117 = p_u_114 and p_u_115 and v_u_13(p_u_114, p_u_115) or v_u_13(p_u_113[v_u_29].X, p_u_113[v_u_29].Y)
					p_u_113.Position = v_u_14(0, v_u_21(0, (v_u_20(v_u_41.ViewSizeX - p_u_117.x, v_u_41.X + p_u_116.x))), 0, (v_u_21(0, (v_u_20(v_u_41.ViewSizeY - p_u_117.y, v_u_41.Y + p_u_116.y)))))
					v_u_54()
				end
				p_u_118:disconnect()
			end
		end)
	end
	function v_u_48.Resize(p_u_123, p_u_124, p_u_125, _, _, p_u_126, p_u_127)
		-- upvalues: (copy) v_u_48, (ref) v_u_30, (ref) v_u_41, (copy) v_u_13, (ref) v_u_11, (copy) v_u_14, (copy) v_u_21, (copy) v_u_20, (ref) v_u_54
		local v_u_128 = p_u_123.Parent
		local v129 = v_u_48.s.Resize:Clone()
		v129.Parent = p_u_123
		v129.InputBegan:connect(function(p130)
			-- upvalues: (ref) v_u_30, (ref) v_u_41, (copy) p_u_123, (ref) v_u_13, (ref) p_u_127, (ref) p_u_126, (ref) v_u_11, (ref) v_u_128, (ref) v_u_14, (copy) p_u_124, (ref) v_u_21, (ref) v_u_20, (copy) p_u_125, (ref) v_u_54
			if p130[v_u_30] == Enum[v_u_30].MouseButton1 or p130[v_u_30] == Enum[v_u_30].Touch then
				local v131 = {
					["x"] = v_u_41.X, 
					["y"] = v_u_41.Y, 
					["s"] = p_u_123.AbsoluteSize, 
					["m"] = v_u_13(v_u_41.ViewSizeX - p_u_123.AbsolutePosition.X, v_u_41.ViewSizeY - p_u_123.AbsolutePosition.Y)
				}
				p_u_127 = v131
				p_u_126 = v_u_11.UIS.InputEnded:connect(function(p132)
					-- upvalues: (ref) v_u_30, (ref) p_u_127
					if p132[v_u_30] == Enum[v_u_30].MouseButton1 or p132[v_u_30] == Enum[v_u_30].Touch then
						p_u_127 = nil
					end
				end)
				while p_u_127 == v131 and p_u_123 and p_u_123.Parent == v_u_128 do
					p_u_123.Size = v_u_14(0, v_u_20(p_u_127.m.X, (v_u_21(p_u_124 or 20, p_u_127.s.X + v_u_41.X - p_u_127.x))), 0, (v_u_20(p_u_127.m.Y, (v_u_21(p_u_125 or 20, p_u_127.s.Y + v_u_41.Y - p_u_127.y)))))
					v_u_54()
				end
				p_u_126:disconnect()
			end
		end)
	end
	function v_u_48.UpdateVar()
		-- upvalues: (ref) v_u_40, (ref) v_u_31, (ref) v_u_42, (ref) v_u_43, (ref) v_u_8, (ref) v_u_41
		v_u_40 = v_u_40 or workspace.CurrentCamera
		v_u_31 = v_u_31 or game.Players.LocalPlayer
		v_u_42 = v_u_31.Character
		local v133 = v_u_31
		repeat
			local v134 = v_u_8(v133, "PlayerGui")
			wait()
		until v134
		v_u_43 = v134
		v_u_41 = v_u_41 or v_u_31:GetMouse()
	end
	function v_u_48.MatchPlr(p135, _, p136)
		-- upvalues: (ref) v_u_11
		local v137 = "^" .. (p135 or ""):lower()
		local v138 = ""
		for _, v139 in next, v_u_11.Players:children() do
			local v140 = v139.Name:lower():match(v137)
			if v140 then
				if #v140 > #v138 then
					p136 = v139
					v138 = v140
				end
			end
		end
		return p136
	end
	function v_u_48.MatchClr(p141, _)
		-- upvalues: (copy) v_u_23
		local v142 = v_u_23(p141:sub(1, 1):upper() .. p141:sub(2))
		if v142 == v_u_23("") or not v142 then
			v142 = nil
		end
		if not v142 then
			for _, v143 in next, {
				"New Yeller", 
				"Pastel Blue", 
				"Dusty Rose", 
				"CGA brown"
			}, nil do
				if p141:lower():find("^" .. v143) then
					v142 = v_u_23(v143)
				end
			end
		end
		if not v142 then
			if p141:find("^random") then
				v142 = BrickColor.Random()
			end
		end
		if v142 then
			v142 = v142.Color
		end
		return v142
	end
	function v_u_48.Has(p144, p145)
		-- upvalues: (ref) v_u_11
		return v_u_11.Market:PlayerOwnsAsset(p144, p145)
	end
	function v_u_48.onCam(p146)
		-- upvalues: (ref) v_u_40
		return (v_u_40.CoordinateFrame:inverse() * p146).z < 0
	end
	function v_u_48.PredictCmds(p147, _)
		-- upvalues: (ref) v_u_38, (ref) v_u_37, (ref) v_u_33, (ref) v_u_31
		local v148 = p147:lower():gsub(v_u_38.Prefix, "")
		local v149 = {}
		for _, v150 in next, v_u_37, nil do
			for _, v151 in next, v150[1], nil do
				if v151:lower():find("^" .. v148) and (v_u_33[v_u_31.userId] or 0) >= (v150[3] or 0) then
					table.insert(v149, (v150[2][2] and v151 .. " " .. (v150[2][2] or "") .. "\t" or "") .. "[" .. v151 .. (0 < #v150[4] and " " .. table.concat(v150[4], " ") or "") .. "]\t" .. v150[2][1])
				end
			end
		end
		return v149
	end
	function v_u_48.getTime(p152, _)
		-- upvalues: (copy) v_u_19
		local v153 = p152 % 86400
		local v154 = { v153 % 60, v153 % 3600 / 60, v153 / 3600 }
		for v155, v156 in next, v154, nil do
			local v157 = v_u_19(v156)
			if v157 < 10 then
				v157 = "0" .. v157 or v157
			end
			v154[v155] = v157
		end
		return v154[3] .. ":" .. v154[2] .. ":" .. v154[1]
	end
	function v_u_48.getTitle(p158)
		return p158 == 8 and "Admin Creator" or 6 <= p158 and "Game Creator" or p158 == 5 and "Owner" or p158 == 4 and "Super Admin" or p158 == 3 and "Administrator" or p158 == 2 and "Moderator" or p158 == 1 and "VIP" or "Player"
	end
	function v_u_48.getNameFromId(p_u_159, _)
		-- upvalues: (copy) v_u_32, (ref) v_u_11
		local v160, v161 = pcall(function()
			-- upvalues: (ref) v_u_32, (ref) p_u_159, (ref) v_u_11
			return v_u_32[p_u_159] or v_u_11.Players:GetNameFromUserIdAsync(p_u_159)
		end)
		p_u_159 = v160
		local v162 = p_u_159 and v161 and v161 or "???"
		if v162 ~= "???" then
			v_u_32[p_u_159] = v162
		end
		return v162
	end
	function v_u_48.getWords(p163, _)
		local v164 = {}
		for v165 in p163:gmatch("%S+") do
			v164[#v164 + 1] = v165
		end
		return v164
	end
	function v_u_48.getCmds(p166, _, _)
		-- upvalues: (copy) v_u_48, (ref) v_u_38, (ref) v_u_37
		local v167 = p166:lower()
		local v168 = {}
		local v169 = 0
		for _, v170 in next, v_u_48.getWords(v167) do
			if v170:find(v_u_38.Prefix, 1, true) == 1 then
				local v171 = v170:sub(#v_u_38.Prefix + 1)
				for _, v172 in next, v_u_37, nil do
					for _, v173 in next, v172[1], nil do
						if v171 == v173:lower() then
							v169 = v169 + v167:sub(v169 + 1, #v167):find(v_u_38.Prefix .. v173:lower())
							if 0 < #v168 then
								v168[#v168][3] = v169 - 1
							end
							v168[#v168 + 1] = { v172, v169 }
						end
					end
				end
			end
		end
		return v168
	end
	local v_u_174 = {
		["LastSpace"] = 0
	}
	local v_u_175 = "ScreenGui"
	local v_u_176 = nil
	local v_u_181 = (function(p177)
		-- upvalues: (copy) v_u_175, (copy) v_u_176
		local v178 = Instance.new(v_u_175)
		for v179, v180 in next, p177, nil do
			if type(v179) == "number" then
				v180.Parent = v178
			else
				v178[v179] = v180
			end
		end
		v178.Parent = v178.Parent or v_u_176
		return v178
	end)({
		["Name"] = "KCoreUI", 
		["IgnoreGuiInset"] = true, 
		["ResetOnSpawn"] = false, 
		["Parent"] = v_u_43
	})
	local v_u_182 = "TextBox"
	local v_u_183 = nil
	local v_u_188 = (function(p184)
		-- upvalues: (copy) v_u_182, (copy) v_u_183
		local v185 = Instance.new(v_u_182)
		for v186, v187 in next, p184, nil do
			if type(v186) == "number" then
				v187.Parent = v185
			else
				v185[v186] = v187
			end
		end
		v185.Parent = v185.Parent or v_u_183
		return v185
	end)({
		["AutoLocalize"] = false, 
		["Font"] = "SourceSans", 
		["FontSize"] = "Size14", 
		["TextColor3"] = v_u_22(1, 1, 1), 
		["BackgroundColor3"] = v_u_22(), 
		[v_u_27] = 0.75, 
		[v_u_24] = 1, 
		["BorderSizePixel"] = 0, 
		["TextXAlignment"] = "Left", 
		["Size"] = v_u_14(1, -10, 0, 20), 
		["ClipsDescendants"] = true, 
		["Selectable"] = true, 
		["TextEditable"] = false, 
		["ClearTextOnFocus"] = false, 
		["ZIndex"] = 7
	})
	local v_u_189 = nil
	v_u_11.UIS.TextBoxFocused:connect(function()
		-- upvalues: (ref) v_u_189
		v_u_189 = true
	end)
	v_u_11.UIS.TextBoxFocusReleased:connect(function()
		-- upvalues: (ref) v_u_189
		v_u_189 = false
	end)
	v_u_49.Changed:connect(v_u_48.UpdateAdmins)
	v_u_50.Changed:connect(function()
		-- upvalues: (ref) v_u_34, (copy) v_u_48, (ref) v_u_50
		v_u_34 = v_u_48.unCache(v_u_50.Value)
	end)
	v_u_48.UpdateAdmins()
	v_u_34 = v_u_48.unCache(v_u_50.Value)
	v_u_42 = v_u_31.Character or v_u_31.CharacterAdded:wait()
	local v_u_190 = game:GetService("Chat"):CanUserChatAsync(v_u_31.userId)
	local v_u_191 = v_u_48.s.Chat:Clone()
	local v_u_192 = {}
	local v_u_193 = {}
	v_u_191.Parent = v_u_181
	local v_u_194 = 0
	local v_u_195 = 10
	local v_u_196 = false
	local v_u_197 = true
	local v_u_198 = false
	local v_u_199 = nil
	local v_u_200 = nil
	local v_u_201 = ""
	local v_u_202 = {}
	local v_u_203 = ""
	v_u_191.Small:Clone()
	v_u_191.Bubble:Clone().Visible = true
	local v_u_204 = v_u_191.Msg
	v_u_204.Changed:connect(function()
		-- upvalues: (copy) v_u_204, (ref) v_u_203, (ref) v_u_29
		local v205 = v_u_204.Text
		local v206
		if v205 == "" then
			if #v_u_203 == 1 then
				v206 = v205
			else
				v206 = v_u_203 or v205
			end
		else
			v206 = v205
		end
		v_u_203 = v206
		if v_u_203 ~= "" and v205 == "" then
			v_u_204.Text = v_u_203
			v_u_204:CaptureFocus()
		end
		v_u_204.TextXAlignment = v_u_204.TextBounds.X > v_u_204[v_u_29].X - 5 and "Right" or "Left"
	end)
	local v_u_207 = "Sound"
	local v_u_208 = nil
	local v_u_213 = (function(p209)
		-- upvalues: (copy) v_u_207, (copy) v_u_208
		local v210 = Instance.new(v_u_207)
		for v211, v212 in next, p209, nil do
			if type(v211) == "number" then
				v212.Parent = v210
			else
				v210[v211] = v212
			end
		end
		v210.Parent = v210.Parent or v_u_208
		return v210
	end)({
		["Parent"] = v_u_191, 
		["SoundId"] = "rbxassetid://305977837", 
		["Volume"] = 1, 
		["Pitch"] = 2
	})
	local function v_u_218(_)
		-- upvalues: (ref) v_u_193, (ref) v_u_192
		local v214 = v_u_193
		for _, v215 in next, v_u_192, nil do
			v215:Destroy()
		end
		local v216 = {}
		v_u_192 = {}
		v_u_193 = v216
		for _, v217 in next, v214, nil do
			Chat(v217[1], v217[2], 0, v217[3], v217[4])
		end
	end
	local function v_u_219()
		-- upvalues: (copy) v_u_191, (copy) v_u_14, (ref) v_u_29, (ref) v_u_192, (copy) v_u_13, (copy) v_u_21
		v_u_191.Logs.CanvasSize = v_u_14(1, 0, 1, -v_u_191.Logs[v_u_29].Y + #v_u_192 * 20)
		v_u_191.Logs.CanvasPosition = v_u_13(0, (v_u_21(0, -v_u_191.Logs[v_u_29].Y + #v_u_192 * 20)))
	end
	local function v_u_220()
		-- upvalues: (ref) v_u_196, (copy) v_u_204, (ref) v_u_26, (ref) v_u_27, (copy) v_u_191, (copy) v_u_14
		delay(v_u_196 and 0 or 0.2, function()
			-- upvalues: (ref) v_u_204, (ref) v_u_26, (ref) v_u_27, (ref) v_u_196
			v_u_204[v_u_26] = v_u_196 and 0 or 1
			v_u_204[v_u_27] = v_u_196 and 0.75 or 1
		end)
		v_u_196 = not v_u_196
		v_u_191.BG:TweenSize(v_u_14(1, -5, 1, v_u_196 and 20 or 0), "Out", "Quad", 0.2, true)
	end
	local function v_u_223(p_u_221)
		-- upvalues: (ref) v_u_197, (ref) v_u_198, (copy) v_u_10, (copy) v_u_204, (ref) v_u_54, (copy) v_u_48, (copy) v_u_191, (copy) v_u_223
		if v_u_197 == p_u_221 or v_u_198 then
			if v_u_197 ~= p_u_221 then
				v_u_197 = p_u_221
			end
		else
			v_u_198 = true
			v_u_197 = p_u_221
			v_u_10(function()
				-- upvalues: (copy) p_u_221, (ref) v_u_197, (ref) v_u_204, (ref) v_u_198, (ref) v_u_54, (ref) v_u_48, (ref) v_u_191, (ref) v_u_223
				local v222 = tick()
				if p_u_221 then
					while tick() - v222 < 1 do
						if p_u_221 ~= v_u_197 or v_u_204:IsFocused() then
							v_u_198 = false
							return
						end
						v_u_54()
					end
				end
				v_u_48[p_u_221 and "Hide" or "Show"](v_u_191.BG)
				v_u_198 = false
				if v_u_197 ~= p_u_221 then
					v_u_197 = p_u_221
					v_u_223(not p_u_221)
				end
			end)
		end
	end
	local function v_u_224()
		-- upvalues: (copy) v_u_191, (copy) v_u_14
		if 0 < v_u_191.Logs.CanvasSize.Y.Offset then
			v_u_191.Logs.Size = v_u_14(1, 0, 1, 0)
			v_u_191.Logs.ScrollBarThickness = 5
		else
			v_u_191.Logs.Size = v_u_14(1, -5, 1, 0)
			v_u_191.Logs.ScrollBarThickness = 0
		end
	end
	local function v_u_226(p225)
		-- upvalues: (copy) v_u_191, (ref) v_u_28, (ref) v_u_29
		return p225.X >= v_u_191.Logs[v_u_28].X and p225.X <= v_u_191.Logs[v_u_28].X + v_u_191.Logs[v_u_29].X and p225.Y >= v_u_191.Logs[v_u_28].Y and p225.Y <= v_u_191.Logs[v_u_28].Y + v_u_191.Logs[v_u_29].Y
	end
	local v_u_227 = {}
	local v_u_228 = {
		["red"] = v_u_22(1, 0, 0), 
		["orange"] = v_u_22(1, 0.5, 0), 
		["yellow"] = v_u_22(1, 1, 0), 
		["green"] = v_u_22(0, 1, 0), 
		["cyan"] = v_u_22(0, 1, 1), 
		["blue"] = v_u_22(0, 0, 1), 
		["purple"] = v_u_22(0.4, 0, 1), 
		["pink"] = v_u_22(1, 0, 1), 
		["black"] = v_u_22(), 
		["white"] = v_u_22(1, 1, 1), 
		["navy"] = v_u_22(0, 0, 0.4), 
		["gray"] = v_u_22(0.6, 0.6, 0.6), 
		["grey"] = v_u_22(0.4, 0.4, 0.4)
	}
	function Chat(p229, p230, p231, p232, p233)
		-- upvalues: (copy) v_u_227, (copy) v_u_22, (ref) v_u_8, (ref) v_u_11, (ref) v_u_31, (copy) v_u_213, (ref) v_u_38, (ref) v_u_193, (ref) v_u_24, (copy) v_u_191, (copy) v_u_48, (copy) v_u_14, (ref) v_u_27, (ref) v_u_192, (ref) v_u_30, (copy) v_u_204, (copy) v_u_10, (copy) v_u_219
		if v_u_227[p229] or p230 and not p230:match("[!-~]") then
			return
		else
			local v234 = (p230 or "\t"):gsub("\n", " ")
			local v235 = p231 or 0.2
			local v236 = p232 or v_u_22(1, 1, 1)
			local v237 = p233 or v_u_22(1, 1, 1)
			local v238 = p229:match("|") and ""
			local v_u_239, _ = v_u_8(v_u_11.Players, p229:match("[%w_]+$"))
			local v240
			if v_u_8(v_u_239, "KNick") then
				v240 = v_u_239.KNick.Value
			else
				v240 = p229:sub(1, v238 and -2 or -1)
			end
			local v241
			if v_u_239 then
				if 0 < v235 then
					if v238 then
						v241 = v236
					else
						v241 = not v_u_239.Neutral and v_u_239.TeamColor.Color
						if not v241 then
							local v242 = v_u_8(v_u_239, "KCClr")
							v241 = v242 and v242.Value or nil or v236
						end
						if v234:find("^%%") then
							if v_u_239.TeamColor ~= v_u_31.TeamColor then
								return
							end
							v240 = "Team " .. v240
							v237 = v_u_239.TeamColor.Color
							v234 = v234:sub(2)
						elseif v234:find("^@") then
							local v243, v244 = v234:match("%s?([%w_]+)%s(.+)")
							v234 = v244 or ""
							if v_u_31 ~= v_u_239 and v_u_31.Name:lower():find(v243:lower()) ~= 1 then
								return
							end
							if v_u_31 == v_u_239 then
								v240 = "To " .. v243
							else
								v240 = "From " .. v240
							end
							v241 = v_u_22()
							v237 = v_u_22()
						end
						if v_u_239 ~= v_u_31 then
							if v234:match(v_u_31.Name) then
								v_u_213:Play()
								v237 = v_u_22()
							end
						end
						if v_u_38.BubbleChat then
							if v_u_239 then
								if v_u_239.Character then
									if v_u_239.Character:FindFirstChild("Head") then
										_G.ChatBubble(v_u_239.Character.Head, v234:gsub("^/", ""), v237)
									end
								end
							end
						end
					end
				else
					v241 = v236
				end
			else
				v241 = v236
			end
			if v_u_38.Chat and not v234:find("^/") then
				if not v238 then
					table.insert(v_u_193, {
						v240, 
						v234, 
						v241, 
						v237
					})
				end
				local v_u_245 = "TextLabel"
				local v_u_246 = nil
				local v251 = (function(p247)
					-- upvalues: (copy) v_u_245, (copy) v_u_246
					local v248 = Instance.new(v_u_245)
					for v249, v250 in next, p247, nil do
						if type(v249) == "number" then
							v250.Parent = v248
						else
							v248[v249] = v250
						end
					end
					v248.Parent = v248.Parent or v_u_246
					return v248
				end)({
					["AutoLocalize"] = false, 
					[v_u_24] = 1, 
					["BackgroundColor3"] = v_u_22(), 
					["BorderColor3"] = v_u_22(), 
					["BorderSizePixel"] = 0, 
					["Fontsemi"] = "SourceSansBold", 
					["FontSize"] = "Size18", 
					["Parent"] = v_u_191.Logs, 
					["TextColor3"] = v241, 
					["TextStrokeColor3"] = v_u_48.Stroke(v241), 
					["Text"] = v238 or v240, 
					["TextXAlignment"] = "Left", 
					["Position"] = v_u_14(0, -20, 1, 0), 
					[v_u_27] = 0.75, 
					["ZIndex"] = 9, 
					["Visible"] = false
				})
				v251.Size = v_u_14(0, v251.TextBounds.X, 0, 20)
				local v_u_252 = "TextLabel"
				local v_u_253 = nil
				local v258 = (function(p254)
					-- upvalues: (copy) v_u_252, (copy) v_u_253
					local v255 = Instance.new(v_u_252)
					for v256, v257 in next, p254, nil do
						if type(v256) == "number" then
							v257.Parent = v255
						else
							v255[v256] = v257
						end
					end
					v255.Parent = v255.Parent or v_u_253
					return v255
				end)({
					["AutoLocalize"] = false, 
					[v_u_24] = 1, 
					["BackgroundColor3"] = v_u_22(), 
					["BorderColor3"] = v_u_22(), 
					["BorderSizePixel"] = 0, 
					["Font"] = "SourceSans" .. (v_u_239 == v_u_31 and "Italic" or ""), 
					["FontSize"] = "Size18", 
					["Parent"] = v251, 
					["TextColor3"] = v237, 
					["TextStrokeColor3"] = v_u_48.Stroke(v237), 
					["Text"] = v234, 
					["TextXAlignment"] = "Left", 
					["Position"] = v_u_14(0, v251.TextBounds.X + 8, 0, 10), 
					["Size"] = v_u_14(), 
					[v_u_27] = 0.75, 
					["ZIndex"] = 9
				})
				table.insert(v_u_192, 1, v251)
				local v_u_259 = nil
				v_u_259 = v251.InputEnded:connect(function(p260)
					-- upvalues: (ref) v_u_30, (copy) v_u_239, (ref) v_u_204, (ref) v_u_259
					if p260[v_u_30] == Enum[v_u_30].MouseButton1 and v_u_239 then
						v_u_204.Text = "@" .. v_u_239.Name .. " "
						v_u_204:CaptureFocus()
					elseif not v_u_239 then
						v_u_259:disconnect()
					end
				end)
				while v258.TextBounds.X + v251.TextBounds.X + 10 > v_u_191.Size.X.Offset do
					v258.Text = v258.Text:sub(1, -2)
				end
				if #v258.Text ~= #v234 then
					v258.Text = v258.Text:sub(1, v258.Text:find("%s%S+$") or #v258.Text)
					if v238 then
						v258.Text = v258.Text:sub(1, -3) .. "..."
					else
						Chat(v240 .. "|", v234:sub(#v258.Text + 1), v235, v241, v237)
					end
				end
				v_u_10(v_u_48.Show, v251, v235)
				for v261, v262 in next, v_u_192, nil do
					v262:TweenPosition(v_u_14(0, 2, 1, -v261 * 20), "Out", "Quad", v235, true)
				end
				if 50 < #v_u_192 then
					v_u_10(v_u_48.Hide, v_u_192[51], true, 0.2)
					table.remove(v_u_192, 51)
				end
				v_u_219()
			end
		end
	end
	local v_u_263 = {
		["wave"] = { 128777973 }, 
		["point"] = { 128853357 }, 
		["dance"] = { 182435998, 182491037, 182491065 }, 
		["dance2"] = { 182436842, 182491248, 182491277 }, 
		["dance3"] = { 182436935, 182491368, 182491423 }, 
		["laugh"] = { 129423131 }, 
		["cheer"] = { 129423030 }
	}
	local v_u_264 = nil
	local function v_u_282(p_u_265, p_u_266, p_u_267, p268, p269, _, _)
		-- upvalues: (ref) v_u_264, (copy) v_u_10, (ref) v_u_282
		local v_u_270 = p_u_266.Position
		local v271 = p269 or 0.1
		local v_u_272 = p268 or 1
		local v_u_273 = "Animation"
		local v_u_274 = nil
		local v_u_279 = p_u_265:LoadAnimation((function(p275)
			-- upvalues: (copy) v_u_273, (copy) v_u_274
			local v276 = Instance.new(v_u_273)
			for v277, v278 in next, p275, nil do
				if type(v277) == "number" then
					v278.Parent = v276
				else
					v276[v277] = v278
				end
			end
			v276.Parent = v276.Parent or v_u_274
			return v276
		end)({
			["Parent"] = p_u_265, 
			["AnimationId"] = "rbxassetid://" .. p_u_267[v_u_272]
		}))
		v_u_279:Play(v271)
		if 1 < #p_u_267 then
			local v_u_280 = false
			if v_u_264 then
				v_u_264:disconnect()
			end
			v_u_10(function()
				-- upvalues: (ref) v_u_279, (copy) p_u_266, (ref) v_u_270, (ref) v_u_280
				while v_u_279 and p_u_266 and (p_u_266.Position - v_u_270).magnitude < 0.2 do
					wait()
				end
				v_u_280 = true
				if v_u_279 then
					v_u_279:Stop()
					v_u_279:Destroy()
				end
			end)
			v_u_264 = v_u_279.KeyframeReached:connect(function(p281)
				-- upvalues: (ref) v_u_264, (ref) v_u_279, (ref) v_u_280, (ref) v_u_282, (copy) p_u_265, (copy) p_u_266, (copy) p_u_267, (ref) v_u_272
				if p281 == "End" then
					v_u_264:disconnect()
					v_u_279:Destroy()
					if not v_u_280 then
						v_u_280 = true
						v_u_282(p_u_265, p_u_266, p_u_267, v_u_272 % #p_u_267 + 1, 0)
					end
				end
			end)
		end
	end
	local function v_u_291(p283, _)
		-- upvalues: (copy) v_u_44, (ref) v_u_31, (copy) v_u_48, (copy) v_u_46, (copy) v_u_263, (ref) v_u_8, (ref) v_u_42, (ref) v_u_282, (copy) v_u_227, (copy) v_u_228, (ref) v_u_38
		if not p283:match("^/") then
			return false
		end
		local v284 = p283:sub(2):lower()
		if v284:find("^?") or v284:find("^help") then
			Chat("/[Message]", "Bubble Chat")
			Chat("%[Message]", "Team Chat")
			Chat("@[Player] [Message]", "Private Chat")
			Chat("/block [Player]", "Blocks incoming chats")
			Chat("/unblock [Player]", "Unblocks incoming chats")
			Chat("/e [Emote]", "Uses emote")
			if 0 < v_u_44.Value and v_u_31.Neutral then
				Chat("/color [Color]", "Changes your chat color")
			end
		elseif v284:find("^em?o?t?e? ") then
			if 0 < #v_u_48.getCmds(v284) then
				v_u_46:FireServer(v_u_48.uID .. "KCmdBar", v284)
			end
			if v_u_263[v284:match("(%w+)$")] and v_u_8(v_u_42, "Humanoid") and v_u_8(v_u_42, "HumanoidRootPart") then
				v_u_282(v_u_42.Humanoid, v_u_42.HumanoidRootPart, v_u_263[v284:match("(%w+)$")])
			end
		elseif v284:find("^block ") then
			local v285 = v_u_48.MatchPlr(v284:sub(7))
			if v285 then
				local v286 = v285.Name
				v_u_227[v286] = true
				Chat(v286 .. " has been blocked!")
			end
		elseif v284:find("^unblock ") then
			local v287 = v_u_48.MatchPlr(v284:sub(9))
			if v287 then
				local v288 = v287.Name
				v_u_227[v288] = nil
				Chat(v288 .. " has been unblocked!")
			end
		elseif v284:find("^color ") then
			if 0 < v_u_44.Value and v_u_31.Neutral then
				local v289 = v284:sub(7):lower()
				local v290 = v_u_228[v289] or v_u_48.MatchClr(v289)
				if v290 then
					v_u_46:FireServer(v_u_48.uID .. "KCClr", v290)
					Chat("Chat color changed!", nil, nil, v290)
				else
					Chat("Invalid color!")
				end
			end
		elseif v_u_38.BubbleChat then
			v_u_46:FireServer(v_u_48.uID .. "KChat", { v_u_31.Name, p283 })
			Chat(v_u_31.Name, p283)
		end
		return true
	end
	local v_u_292 = v_u_48.s.CommandBar:Clone()
	local v_u_293 = false
	local v_u_294 = v_u_292.CmdBar
	v_u_292.Parent = v_u_181
	v_u_294.FocusLost:connect(function(p295, _)
		-- upvalues: (ref) v_u_294, (copy) v_u_46, (copy) v_u_48, (ref) v_u_38, (ref) v_u_293, (copy) v_u_292
		local v296 = v_u_294.Text
		if p295 and v296:gsub("%s", "") ~= "" then
			v_u_46:FireServer(v_u_48.uID .. "KCmdBar", (v296:find(v_u_38.Prefix, 1, true) == 1 and "" or v_u_38.Prefix) .. v296)
		end
		if not v_u_293 and v_u_292.Visible then
			v_u_293 = true
			v_u_48.Hide(v_u_292)
			v_u_293 = false
		end
		v_u_294.Text = ""
	end)
	v_u_294.Changed:connect(function(_)
		-- upvalues: (ref) v_u_294, (copy) v_u_48, (copy) v_u_292
		local v297 = v_u_294.Text:match("%w+") or ""
		local v298 = 0 < #v297 and v_u_48.PredictCmds(v297) or {}
		for v299, v300 in next, v_u_292.List:children() do
			v300.Visible = v298[v299] and true or false
			v300.Text = v298[v299] or ""
		end
	end)
	v_u_204.Focused:connect(function()
		-- upvalues: (ref) v_u_197, (ref) v_u_198, (copy) v_u_10, (copy) v_u_204, (ref) v_u_54, (copy) v_u_48, (copy) v_u_191, (copy) v_u_223, (ref) v_u_196, (copy) v_u_220
		if v_u_197 == false or v_u_198 then
			if v_u_197 ~= false then
				v_u_197 = false
			end
		else
			local v301 = false
			v_u_198 = true
			v_u_197 = v301
			local v_u_302 = false
			v_u_10(function()
				-- upvalues: (copy) v_u_302, (ref) v_u_197, (ref) v_u_204, (ref) v_u_198, (ref) v_u_54, (ref) v_u_48, (ref) v_u_191, (ref) v_u_223
				local v303 = tick()
				if v_u_302 then
					while tick() - v303 < 1 do
						if v_u_302 ~= v_u_197 or v_u_204:IsFocused() then
							v_u_198 = false
							return
						end
						v_u_54()
					end
				end
				v_u_48[v_u_302 and "Hide" or "Show"](v_u_191.BG)
				v_u_198 = false
				if v_u_197 ~= v_u_302 then
					v_u_197 = v_u_302
					v_u_223(not v_u_302)
				end
			end)
		end
		if not v_u_196 then
			v_u_220()
		end
	end)
	v_u_204.FocusLost:connect(function(p304)
		-- upvalues: (copy) v_u_204, (ref) v_u_197, (ref) v_u_198, (copy) v_u_10, (ref) v_u_54, (copy) v_u_48, (copy) v_u_191, (copy) v_u_223, (ref) v_u_196, (copy) v_u_220, (copy) v_u_291, (ref) v_u_203, (ref) v_u_199, (ref) v_u_200, (ref) v_u_201, (ref) v_u_202, (ref) v_u_194, (copy) v_u_174, (copy) v_u_46, (ref) v_u_31, (copy) v_u_22, (ref) v_u_195, (copy) v_u_20, (copy) v_u_21
		local v305 = v_u_204.Text
		if p304 and v305 ~= "" and (v305:gsub("[%%%s]", "") == "" or v305:find("^@") and not v305:match("^@%w+%s+%w+")) then
			v_u_204:CaptureFocus()
			Chat("Invalid message!")
			return
		else
			if v_u_197 == true or v_u_198 then
				if v_u_197 ~= true then
					v_u_197 = true
				end
			else
				local v306 = true
				v_u_198 = true
				v_u_197 = v306
				local v_u_307 = true
				v_u_10(function()
					-- upvalues: (copy) v_u_307, (ref) v_u_197, (ref) v_u_204, (ref) v_u_198, (ref) v_u_54, (ref) v_u_48, (ref) v_u_191, (ref) v_u_223
					local v308 = tick()
					if v_u_307 then
						while tick() - v308 < 1 do
							if v_u_307 ~= v_u_197 or v_u_204:IsFocused() then
								v_u_198 = false
								return
							end
							v_u_54()
						end
					end
					v_u_48[v_u_307 and "Hide" or "Show"](v_u_191.BG)
					v_u_198 = false
					if v_u_197 ~= v_u_307 then
						v_u_197 = v_u_307
						v_u_223(not v_u_307)
					end
				end)
			end
			if v_u_196 then
				v_u_220()
			end
			if v_u_291(v305:sub(1, 255):lower()) then
				local v309 = nil
				local v310 = nil
				local v311 = ""
				local v312 = {}
				v_u_203 = ""
				v_u_199 = v309
				v_u_200 = v310
				v_u_201 = v311
				v_u_202 = v312
				v_u_204.Text = ""
			elseif p304 and v305 ~= "" and v_u_194 <= 7 and not v_u_174.Muted then
				local v313 = nil
				local v314 = nil
				local v315 = ""
				local v316 = {}
				v_u_203 = ""
				v_u_199 = v313
				v_u_200 = v314
				v_u_201 = v315
				v_u_202 = v316
				v_u_204.Text = ""
				v_u_46:FireServer(v_u_48.uID .. "KChat", { v_u_31.Name, v305:sub(1, 255) })
				Chat(v_u_31.Name, v305:sub(1, 255))
				v_u_194 = v_u_194 + 1
				delay(10, function()
					-- upvalues: (ref) v_u_194
					v_u_194 = v_u_194 - 1
				end)
				if 7 < v_u_194 then
					v_u_194 = 14
					v_u_204.TextColor3 = v_u_22(1, 0, 0)
					Chat("You have been muted for " .. v_u_195 .. " seconds!")
					delay(v_u_195, function()
						-- upvalues: (ref) v_u_204, (ref) v_u_195, (ref) v_u_22, (ref) v_u_20, (ref) v_u_194, (ref) v_u_21
						v_u_204.TextColor3 = v_u_22(1, 1, 1)
						v_u_195 = v_u_20(300, v_u_195 + 30)
						v_u_194 = 0
						Chat("You have been unmuted!")
						delay(60, function()
							-- upvalues: (ref) v_u_195, (ref) v_u_21
							v_u_195 = v_u_21(10, v_u_195 - 30)
						end)
					end)
				end
			end
		end
	end)
	v_u_191.BG.Resize.MouseButton1Down:connect(function()
		-- upvalues: (ref) v_u_41, (copy) v_u_191, (copy) v_u_10, (ref) v_u_28, (ref) v_u_54, (copy) v_u_14, (copy) v_u_21, (copy) v_u_20, (copy) v_u_219, (copy) v_u_224, (copy) v_u_218
		isResizing = true
		local v_u_317 = v_u_41.X
		local v_u_318 = v_u_41.Y
		local v_u_319 = v_u_191.Size.X.Offset
		local v_u_320 = v_u_191.Size.Y.Offset
		v_u_10(function()
			-- upvalues: (ref) v_u_41, (ref) v_u_191, (ref) v_u_28, (ref) v_u_54, (ref) v_u_14, (copy) v_u_319, (copy) v_u_317, (ref) v_u_21, (ref) v_u_20, (copy) v_u_320, (copy) v_u_318, (ref) v_u_219, (ref) v_u_224, (ref) v_u_218
			local v321 = v_u_41.ViewSizeX - v_u_191[v_u_28].X
			local v322 = v_u_41.ViewSizeY - v_u_191[v_u_28].Y + 15
			while isResizing do
				v_u_54()
				v_u_191.Size = v_u_14(0, v_u_20(v321, (v_u_21(205, v_u_319 + v_u_41.X - v_u_317))), 0, (v_u_20(v322, (v_u_21(200, v_u_320 + v_u_41.Y - v_u_318)))))
				v_u_219()
				v_u_224()
			end
			v_u_218()
		end)
	end)
	v_u_48.Drag(v_u_191)
	v_u_191.InputChanged:connect(function()
		-- upvalues: (ref) v_u_197, (ref) v_u_198, (copy) v_u_10, (copy) v_u_204, (ref) v_u_54, (copy) v_u_48, (copy) v_u_191, (copy) v_u_223
		if v_u_197 == false or v_u_198 then
			if v_u_197 ~= false then
				v_u_197 = false
			end
		else
			local v323 = false
			v_u_198 = true
			v_u_197 = v323
			local v_u_324 = false
			v_u_10(function()
				-- upvalues: (copy) v_u_324, (ref) v_u_197, (ref) v_u_204, (ref) v_u_198, (ref) v_u_54, (ref) v_u_48, (ref) v_u_191, (ref) v_u_223
				local v325 = tick()
				if v_u_324 then
					while tick() - v325 < 1 do
						if v_u_324 ~= v_u_197 or v_u_204:IsFocused() then
							v_u_198 = false
							return
						end
						v_u_54()
					end
				end
				v_u_48[v_u_324 and "Hide" or "Show"](v_u_191.BG)
				v_u_198 = false
				if v_u_197 ~= v_u_324 then
					v_u_197 = v_u_324
					v_u_223(not v_u_324)
				end
			end)
		end
	end)
	v_u_191.MouseEnter:connect(v_u_224)
	v_u_11.UIS.InputChanged:connect(function(p326)
		-- upvalues: (ref) v_u_38, (ref) v_u_30, (copy) v_u_226, (ref) v_u_197, (ref) v_u_198, (copy) v_u_10, (copy) v_u_204, (ref) v_u_54, (copy) v_u_48, (copy) v_u_191, (copy) v_u_223, (copy) v_u_14
		if v_u_38.Chat then
			if p326[v_u_30] == Enum[v_u_30].MouseMovement and not v_u_226(p326.Position) then
				if v_u_197 == true or v_u_198 then
					if v_u_197 ~= true then
						v_u_197 = true
					end
				else
					local v327 = true
					v_u_198 = true
					v_u_197 = v327
					local v_u_328 = true
					v_u_10(function()
						-- upvalues: (copy) v_u_328, (ref) v_u_197, (ref) v_u_204, (ref) v_u_198, (ref) v_u_54, (ref) v_u_48, (ref) v_u_191, (ref) v_u_223
						local v329 = tick()
						if v_u_328 then
							while tick() - v329 < 1 do
								if v_u_328 ~= v_u_197 or v_u_204:IsFocused() then
									v_u_198 = false
									return
								end
								v_u_54()
							end
						end
						v_u_48[v_u_328 and "Hide" or "Show"](v_u_191.BG)
						v_u_198 = false
						if v_u_197 ~= v_u_328 then
							v_u_197 = v_u_328
							v_u_223(not v_u_328)
						end
					end)
				end
				if v_u_191.Logs.ScrollBarThickness ~= 0 then
					v_u_191.Logs.Size = v_u_14(1, -5, 1, 0)
					v_u_191.Logs.ScrollBarThickness = 0
				end
			end
		end
	end)
	v_u_11.UIS.InputEnded:connect(function(p330)
		-- upvalues: (ref) v_u_30
		if p330[v_u_30] == Enum[v_u_30].MouseButton1 then
			isResizing = false
		end
	end)
	v_u_11.UIS.InputBegan:connect(function(p331, p332)
		-- upvalues: (ref) v_u_38, (copy) v_u_190, (copy) v_u_204, (ref) v_u_199, (ref) v_u_200, (ref) v_u_201, (ref) v_u_202, (ref) v_u_11, (ref) v_u_189, (copy) v_u_47, (ref) v_u_8, (ref) v_u_31, (ref) v_u_293, (ref) v_u_294, (copy) v_u_292, (copy) v_u_48, (copy) v_u_174
		if (v_u_38.Chat or v_u_38.CommandBar) and v_u_190 then
			if v_u_204:IsFocused() and p331.KeyCode ~= Enum.KeyCode.Unknown then
				if p331.KeyCode ~= Enum.KeyCode.Tab and v_u_199 then
					local v333 = nil
					local v334 = ""
					local v335 = {}
					v_u_199 = nil
					v_u_200 = v333
					v_u_201 = v334
					v_u_202 = v335
					return
				end
				if p331.KeyCode == Enum.KeyCode.Tab and 1 < #v_u_204.Text then
					if v_u_199 then
						v_u_199 = v_u_199 % #v_u_202 + 1
						if v_u_202[v_u_199] then
							v_u_204.Text = v_u_200 .. v_u_202[v_u_199]
						end
					else
						local v336 = 1
						v_u_200 = v_u_204.Text:sub(1, -2)
						v_u_199 = v336
						local v337 = v_u_200:find("%w+$")
						v_u_201 = v337 and v_u_200:sub(v337) or ""
						if #v_u_201:gsub("%s", "") < 1 then
							local v338 = nil
							v_u_202 = {}
							v_u_199 = v338
							return
						end
						v_u_200 = v_u_200:sub(1, v337 - 1)
						for _, v339 in next, v_u_11.Players:children() do
							if v339 and v339.Name:lower():find(v_u_201:lower()) == 1 then
								table.insert(v_u_202, v339.Name)
							end
						end
						if #v_u_202 < 1 then
							local v340 = nil
							v_u_202 = {}
							v_u_199 = v340
							return
						end
						if v_u_202[v_u_199] then
							v_u_204.Text = v_u_200 .. v_u_202[v_u_199]
						end
					end
					v_u_204:CaptureFocus()
					return
				end
			else
				if v_u_38.Chat and not v_u_189 and (p331.KeyCode == Enum.KeyCode.Slash or p331.KeyCode == Enum.KeyCode.Seven and v_u_11.UIS:IsKeyDown(Enum.KeyCode.LeftShift)) then
					v_u_47:wait()
					v_u_204:CaptureFocus()
					return
				end
				if (v_u_38.CommandBar or v_u_8(v_u_31, "KCmdBar")) and not v_u_189 and not p332 and p331.KeyCode == Enum.KeyCode.Semicolon and not v_u_293 then
					v_u_47:wait()
					v_u_294:CaptureFocus()
					if not v_u_292.Visible then
						v_u_293 = true
						v_u_48.Show(v_u_292)
						v_u_293 = false
						return
					end
				elseif not v_u_189 and p331.KeyCode == Enum.KeyCode.Space then
					local v341 = v_u_174.Noclip or v_u_174.Fly
					if v341 and tick() - v_u_174.LastSpace < 0.3 then
						v341.Value = not v341.Value
					end
					v_u_174.LastSpace = tick()
				end
			end
		end
	end)
	local v_u_342 = nil
	local v_u_343 = v_u_48.s.Credit:Clone()
	local v_u_344 = false
	local v_u_345 = v_u_343.Main
	v_u_343.Parent = v_u_181
	v_u_48.Drag(v_u_345, 250, 250)
	function ToggleCredit()
		-- upvalues: (ref) v_u_344, (ref) v_u_345, (copy) v_u_46, (copy) v_u_48
		if not v_u_344 then
			v_u_344 = true
			if not v_u_345.Visible then
				v_u_46:FireServer(v_u_48.uID .. "KInteract", {
					["t"] = "credit"
				})
			end
			v_u_48[v_u_345.Visible and "Hide" or "Show"](v_u_345)
			v_u_344 = false
		end
	end
	v_u_343.Toggle.MouseButton1Click:connect(ToggleCredit)
	v_u_345.Close.MouseButton1Click:connect(ToggleCredit)
	v_u_345.Trail.Visible = 0 < v_u_44.Value
	v_u_345.Hat.Visible = 2 < v_u_44.Value
	v_u_345.Shine.Visible = 3 < v_u_44.Value
	v_u_44.Changed:Connect(function()
		-- upvalues: (ref) v_u_345, (copy) v_u_44
		v_u_345.Trail.Visible = 0 < v_u_44.Value
		v_u_345.Hat.Visible = 2 < v_u_44.Value
		v_u_345.Shine.Visible = 3 < v_u_44.Value
	end)
	v_u_345.Get.MouseButton1Click:connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_31, (copy) v_u_46, (copy) v_u_48
		v_u_11.Market:PromptPurchase(v_u_31, 172732271)
		v_u_46:FireServer(v_u_48.uID .. "KInteract", {
			["t"] = "get"
		})
	end)
	for v346, v_u_347 in next, {
		{ 5391355, 10 }, 
		{ 5391356, 100 }, 
		{ 5391359, 250 }, 
		{ 5391361, 500 }, 
		{ 5411126, 1000 }
	}, nil do
		local v348 = v_u_345["D" .. v346]
		local v349, v350 = pcall(v_u_11.Market.GetProductInfo, v_u_11.Market, v_u_347[1], Enum.InfoType.GamePass)
		v348.Text = (v349 and v350.PriceInRobux or v_u_347[2]) .. " R$"
		v348.MouseButton1Click:Connect(function()
			-- upvalues: (ref) v_u_342, (copy) v_u_347, (ref) v_u_11, (ref) v_u_31
			v_u_342 = v_u_347[1]
			v_u_11.Market:PromptGamePassPurchase(v_u_31, v_u_347[1])
		end)
	end
	v_u_345.Hat.MouseButton1Click:connect(function()
		-- upvalues: (copy) v_u_46, (copy) v_u_48
		v_u_46:FireServer(v_u_48.uID .. "KHat")
	end)
	v_u_345.Trail.MouseButton1Click:connect(function()
		-- upvalues: (copy) v_u_46, (copy) v_u_48
		v_u_46:FireServer(v_u_48.uID .. "KTrail")
	end)
	v_u_345.Shine.MouseButton1Click:connect(function()
		-- upvalues: (copy) v_u_46, (copy) v_u_48
		v_u_46:FireServer(v_u_48.uID .. "KShine")
	end)
	v_u_10(function()
		-- upvalues: (ref) v_u_54, (copy) v_u_21, (copy) v_u_343, (copy) v_u_22
		local v351 = false
		while true do
			wait(1)
			local v352 = tick()
			repeat
				v_u_54()
				local v353 = tick() - v352
				local v354 = v351 and v353 and v353 or v_u_21(0, 1 - v353)
				v_u_343.Toggle.ImageColor3 = v_u_22(v354, v354, v354)
			until 1 < v353
			v351 = not v351
		end
	end)
	local v_u_355 = script.Direct:Clone()
	v_u_355.Parent = v_u_181
	v_u_355.Close.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_355
		v_u_355.Visible = false
	end)
	game:GetService("LogService").MessageOut:Connect(function(p356, p357)
		-- upvalues: (ref) v_u_342, (copy) v_u_355
		if p357 == Enum.MessageType.MessageWarning and string.find(p356, "AllowThirdPartySales") and string.find(p356, "3403354") and v_u_342 then
			v_u_355.Link.Text = "roblox.com/game-pass/" .. v_u_342
			v_u_355.Visible = true
		end
	end)
	local v_u_358 = game:GetService("PolicyService")
	local v_u_359 = game:GetService("Players")
	local v_u_360 = v_u_359.LocalPlayer
	local v361, v362 = pcall(function()
		-- upvalues: (copy) v_u_358, (copy) v_u_360
		return v_u_358:GetPolicyInfoForPlayerAsync(v_u_360)
	end)
	if v361 and v362.AllowedExternalLinkReferences and table.find(v362.AllowedExternalLinkReferences, "Discord") then
		v_u_345.Position = UDim2.new(0.5, -125, 0.5, -144)
		v_u_345.Trail.Position = UDim2.new(0, 0, 1, 268)
		v_u_345.Hat.Position = UDim2.new(0, 83, 1, 268)
		v_u_345.Shine.Position = UDim2.new(1, -82, 1, 268)
		v_u_345.Social.Visible = true
		v_u_345.Social.Text = "discord.gg/bwCC7gV"
		v_u_48.s.Help.BG.Social.Visible = true
		v_u_48.s.Help.BG.Social.Text = "discord.gg/bwCC7gV"
	end
	v_u_345.Social.Focused:Connect(function()
		-- upvalues: (copy) v_u_46, (copy) v_u_48
		v_u_46:FireServer(v_u_48.uID .. "KInteract", {
			["t"] = "socialFocused", 
			["source"] = "credit"
		})
	end)
	game:GetService("TextChatService").SendingMessage:Connect(function(p363)
		-- upvalues: (ref) v_u_38, (copy) v_u_46, (copy) v_u_48
		if string.find(p363.Text, v_u_38.Prefix, 1, true) == 1 then
			v_u_46:FireServer(v_u_48.uID .. "KCmdBar", p363.Text)
		end
	end)
	local function v_u_411(p364, p365, p366, _, _)
		-- upvalues: (copy) v_u_22, (ref) v_u_8, (copy) v_u_17, (copy) v_u_14, (ref) v_u_24, (copy) v_u_48, (copy) v_u_10, (ref) v_u_54, (copy) v_u_21, (copy) v_u_20, (copy) v_u_16
		local v367 = p365 or v_u_22()
		local v_u_368 = v_u_8(p364, "HumanoidRootPart")
		local v_u_369 = v_u_8(p364, "Humanoid")
		if p364 and v_u_368 and v_u_369 then
			local v_u_370 = CFrame.new(0, 0.925, 0.5)
			local v_u_371 = -3
			local v_u_372 = 0
			local v_u_373 = 0
			local v_u_374 = "Part"
			local v_u_375 = nil
			local v_u_380, _ = (function(p376)
				-- upvalues: (copy) v_u_374, (copy) v_u_375
				local v377 = Instance.new(v_u_374)
				for v378, v379 in next, p376, nil do
					if type(v378) == "number" then
						v379.Parent = v377
					else
						v377[v378] = v379
					end
				end
				v377.Parent = v377.Parent or v_u_375
				return v377
			end)({
				["Name"] = "KCape", 
				["Parent"] = p364, 
				["CanCollide"] = false, 
				["Transparency"] = 1, 
				["FormFactor"] = 3, 
				["Size"] = Vector3.new(1.9, 3.8, 0.2), 
				["TopSurface"] = 0, 
				["BottomSurface"] = 0
			})
			local v_u_381 = "Weld"
			local v_u_382 = nil
			local v_u_387 = (function(p383)
				-- upvalues: (copy) v_u_381, (copy) v_u_382
				local v384 = Instance.new(v_u_381)
				for v385, v386 in next, p383, nil do
					if type(v385) == "number" then
						v386.Parent = v384
					else
						v384[v385] = v386
					end
				end
				v384.Parent = v384.Parent or v_u_382
				return v384
			end)({
				["Parent"] = v_u_368, 
				["Part0"] = v_u_368, 
				["Part1"] = v_u_380, 
				["C0"] = v_u_370 * CFrame.Angles(v_u_17(v_u_371), 0, 0), 
				["C1"] = CFrame.new(0, 1.9, 0)
			})
			local v_u_388 = "SelectionBox"
			local v_u_389 = nil
			(function(p390)
				-- upvalues: (copy) v_u_388, (copy) v_u_389
				local v391 = Instance.new(v_u_388)
				for v392, v393 in next, p390, nil do
					if type(v392) == "number" then
						v393.Parent = v391
					else
						v391[v392] = v393
					end
				end
				v391.Parent = v391.Parent or v_u_389
				return v391
			end)({
				["Parent"] = v_u_380, 
				["Adornee"] = v_u_380, 
				["SurfaceColor3"] = v367, 
				["SurfaceTransparency"] = 0, 
				["Transparency"] = 1, 
				["LineThickness"] = 0
			})
			if p366 then
				local v_u_394 = "SurfaceGui"
				local v_u_395 = nil
				local function v400(p396)
					-- upvalues: (copy) v_u_394, (copy) v_u_395
					local v397 = Instance.new(v_u_394)
					for v398, v399 in next, p396, nil do
						if type(v398) == "number" then
							v399.Parent = v397
						else
							v397[v398] = v399
						end
					end
					v397.Parent = v397.Parent or v_u_395
					return v397
				end
				local v401 = {
					["Parent"] = v_u_380, 
					["Face"] = "Back"
				}
				local v_u_402 = "ImageLabel"
				local v_u_403 = nil
				__set_list(v401, 1, {(function(p404)
	-- upvalues: (copy) v_u_402, (copy) v_u_403
	local v405 = Instance.new(v_u_402)
	for v406, v407 in next, p404, nil do
		if type(v406) == "number" then
			v407.Parent = v405
		else
			v405[v406] = v407
		end
	end
	v405.Parent = v405.Parent or v_u_403
	return v405
end)({
	["Size"] = v_u_14(1, 0, 1, 0), 
	[v_u_24] = 1, 
	["Image"] = p366 and "rbxassetid://" .. v_u_48.RImage(p366) or ""
})})
				v400(v401)
			end
			local function v_u_409(p_u_408)
				-- upvalues: (ref) v_u_10, (ref) v_u_372, (ref) v_u_368, (ref) v_u_369, (copy) v_u_380, (ref) v_u_48, (ref) v_u_54, (ref) v_u_373, (ref) v_u_371, (ref) v_u_21, (ref) v_u_20, (ref) v_u_387, (copy) v_u_370, (ref) v_u_16, (ref) v_u_17, (copy) v_u_409
				v_u_10(function()
					-- upvalues: (ref) p_u_408, (ref) v_u_372, (ref) v_u_368, (ref) v_u_369
					while not p_u_408 do
						v_u_372 = (v_u_368.CFrame:inverse() * (v_u_368.CFrame + v_u_369.MoveDirection)).z * v_u_368.Velocity.magnitude
						wait()
					end
				end)
				v_u_10(function()
					-- upvalues: (ref) v_u_380, (ref) v_u_48, (ref) v_u_54, (ref) v_u_373, (ref) v_u_368, (ref) v_u_371, (ref) v_u_372, (ref) v_u_21, (ref) v_u_20, (ref) v_u_387, (ref) v_u_370, (ref) v_u_16, (ref) v_u_17, (ref) p_u_408, (ref) v_u_409
					while v_u_380 and v_u_48.onCam(v_u_380.Position) do
						v_u_54()
						v_u_373 = v_u_368.Velocity.y
						v_u_371 = v_u_20(-3, (v_u_21(v_u_371 * 0.9 + (v_u_373 + v_u_372) * 0.25, v_u_373 < 0 and -170 or -100)))
						v_u_387.C0 = v_u_370 * v_u_16(v_u_17(v_u_371), 0, 0)
					end
					p_u_408 = true
					if v_u_380 then
						while v_u_380 and not v_u_48.onCam(v_u_380.Position) do
							wait()
						end
						v_u_409()
					end
				end)
			end
			local v_u_410 = nil
			v_u_10(function()
				-- upvalues: (ref) v_u_410, (ref) v_u_372, (ref) v_u_368, (ref) v_u_369
				while not v_u_410 do
					v_u_372 = (v_u_368.CFrame:inverse() * (v_u_368.CFrame + v_u_369.MoveDirection)).z * v_u_368.Velocity.magnitude
					wait()
				end
			end)
			v_u_10(function()
				-- upvalues: (copy) v_u_380, (ref) v_u_48, (ref) v_u_54, (ref) v_u_373, (ref) v_u_368, (ref) v_u_371, (ref) v_u_372, (ref) v_u_21, (ref) v_u_20, (ref) v_u_387, (copy) v_u_370, (ref) v_u_16, (ref) v_u_17, (ref) v_u_410, (copy) v_u_409
				while v_u_380 and v_u_48.onCam(v_u_380.Position) do
					v_u_54()
					v_u_373 = v_u_368.Velocity.y
					v_u_371 = v_u_20(-3, (v_u_21(v_u_371 * 0.9 + (v_u_373 + v_u_372) * 0.25, v_u_373 < 0 and -170 or -100)))
					v_u_387.C0 = v_u_370 * v_u_16(v_u_17(v_u_371), 0, 0)
				end
				v_u_410 = true
				if v_u_380 then
					while v_u_380 and not v_u_48.onCam(v_u_380.Position) do
						wait()
					end
					v_u_409()
				end
			end)
		end
	end
	local v_u_412 = v_u_11.Collection:GetTagged("KAICrown")
	local v_u_413 = v_u_11.Collection:GetTagged("KAIRCrown")
	v_u_11.Run.Heartbeat:connect(function()
		-- upvalues: (copy) v_u_412, (copy) v_u_413, (copy) v_u_15, (copy) v_u_16
		if 0 < #v_u_412 or 0 < #v_u_413 then
			local v414 = time()
			local v415 = v414 % math.pi * 2
			local v416 = v_u_15(0, math.sin(v415) / 8, 0) * v_u_16(0, v415, 0)
			local v417 = Color3.fromHSV(v414 / 10 % 1, 1, 1)
			for v418, v419 in v_u_412, nil, nil do
				if v419 and v419.Parent then
					if v419.Handle:FindFirstChild("AccessoryWeld") then
						v419.Handle.AccessoryWeld.C1 = v416
					end
				else
					table.remove(v_u_412, v418)
				end
			end
			for v420, v421 in v_u_413, nil, nil do
				if v421 and v421.Parent then
					if v421.Handle:FindFirstChild("AccessoryWeld") then
						v421.Handle.AccessoryWeld.C1 = v416
					end
					v421.Handle.Color = v417
					v421.Handle.Fire.SecondaryColor = v417
				else
					table.remove(v_u_413, v420)
				end
			end
		end
	end)
	v_u_11.Collection:GetInstanceAddedSignal("KAICrown"):Connect(function(p422)
		-- upvalues: (copy) v_u_412
		table.insert(v_u_412, p422)
	end)
	v_u_11.Collection:GetInstanceAddedSignal("KAIRCrown"):Connect(function(p423)
		-- upvalues: (copy) v_u_413
		table.insert(v_u_413, p423)
	end)
	v_u_11.Collection:GetInstanceRemovedSignal("KAICrown"):Connect(function(p424)
		-- upvalues: (copy) v_u_412
		table.remove(v_u_412, table.find(v_u_412, p424))
	end)
	v_u_11.Collection:GetInstanceRemovedSignal("KAIRCrown"):Connect(function(p425)
		-- upvalues: (copy) v_u_413
		table.remove(v_u_413, table.find(v_u_413, p425))
	end)
	function v_u_48.HookList(p_u_426, _, p_u_427, _)
		-- upvalues: (ref) v_u_8, (copy) v_u_10, (copy) v_u_48
		local v_u_428 = v_u_8(p_u_426, "List") or v_u_8(p_u_426, "BG")
		local v_u_429 = false
		local v_u_430 = p_u_426.Hide.MouseButton1Click:connect(function()
			-- upvalues: (ref) v_u_429, (ref) v_u_428, (ref) v_u_10, (ref) v_u_48, (copy) p_u_426
			if not v_u_429 then
				v_u_429 = true
				if v_u_428.Parent.Name ~= "BG" then
					v_u_10(v_u_48[p_u_426.BG.Visible and "Hide" or "Show"], v_u_428)
				end
				v_u_48[p_u_426.BG.Visible and "Hide" or "Show"](p_u_426.BG)
				p_u_426.Hide.Text = p_u_426.BG.Visible and "-" or "+"
				v_u_429 = false
			end
		end)
		p_u_427 = p_u_426.Close.MouseButton1Click:connect(function()
			-- upvalues: (ref) v_u_430, (ref) p_u_427, (ref) v_u_48, (copy) p_u_426
			v_u_430:disconnect()
			p_u_427:disconnect()
			v_u_48.Hide(p_u_426, true)
		end)
	end
	function v_u_48.CreateList(p431, _, _, _)
		-- upvalues: (copy) v_u_48, (copy) v_u_181
		local v432 = v_u_48.s.List:Clone()
		v432.Parent = v_u_181
		v432.Title.Text = p431
		v432.Name = p431
		v_u_48.HookList(v432)
		return v432
	end
	function v_u_48.FixUI(p433)
		-- upvalues: (ref) v_u_24, (ref) v_u_38, (copy) v_u_48
		if p433.Name == "BG" or p433.Name == "Bar" then
			p433[v_u_24] = v_u_38.ColorTransparency
			p433.BackgroundColor3 = v_u_38.Color
		end
		for _, v434 in next, p433:children() do
			v_u_48.FixUI(v434)
		end
	end
	function v_u_48.UpdateUI()
		-- upvalues: (ref) v_u_38, (ref) v_u_8, (ref) v_u_31, (copy) v_u_48, (copy) v_u_181
		if not v_u_38.ForcedColor then
			if v_u_8(v_u_31, "KColor") then
				v_u_38.Color = v_u_31.KColor.Value
			end
			if v_u_8(v_u_31, "KColorTransparency") then
				v_u_38.ColorTransparency = v_u_31.KColorTransparency.Value
			end
		end
		v_u_48.FixUI(v_u_181)
		v_u_48.FixUI(v_u_48.s)
	end
	function v_u_48.UpdateSet()
		-- upvalues: (copy) v_u_48, (copy) v_u_343, (ref) v_u_38, (copy) v_u_191, (copy) v_u_190, (ref) v_u_11, (copy) v_u_181
		v_u_48.UpdateAdmins()
		v_u_343.Toggle.Visible = v_u_38.AdminCredit
		local v435 = v_u_191
		local v436 = v_u_38.Chat
		if v436 then
			v436 = v_u_190
		end
		v435.Visible = v436
		v_u_11.StarterGui:SetCoreGuiEnabled("Chat", not v_u_191.Visible)
		if v_u_181.Parent and v_u_181.Parent:FindFirstChild("Chat") then
			v_u_181.Parent.Chat.Enabled = not v_u_191.Visible
		end
		v_u_48.UpdateUI()
	end
	function v_u_48.BumpList(p437)
		-- upvalues: (copy) v_u_14
		for v438, v439 in next, p437.List:children() do
			v439.Position = v_u_14(0, 5, 0, (v438 - 1) * 20)
		end
	end
	function v_u_48.NoteCheck(p440, p441)
		local v442
		if p440[1] <= p441.X then
			if p440[2] >= p441.X then
				if p440[3] <= p441.Y then
					v442 = p440[4] >= p441.Y
				else
					v442 = false
				end
			else
				v442 = false
			end
		else
			v442 = false
		end
		return v442
	end
	function v_u_48.Note(p_u_443, p_u_444, p_u_445, p_u_446)
		-- upvalues: (copy) v_u_174, (copy) v_u_48, (copy) v_u_181, (copy) v_u_14, (copy) v_u_10, (ref) v_u_28, (ref) v_u_29, (ref) v_u_41, (ref) v_u_54
		p_u_443.MouseEnter:connect(function()
			-- upvalues: (ref) p_u_445, (ref) v_u_174, (ref) v_u_48, (copy) p_u_444, (ref) v_u_181, (ref) v_u_14, (ref) v_u_10, (ref) p_u_446, (copy) p_u_443, (ref) v_u_28, (ref) v_u_29, (ref) v_u_41, (ref) v_u_54
			p_u_445 = v_u_174.Note
			if p_u_445 then
				p_u_445:Destroy()
			end
			p_u_445 = v_u_48.s.Note:Clone()
			v_u_174.Note = p_u_445
			p_u_445.Text = p_u_444 or ""
			p_u_445.Parent = v_u_181
			p_u_445.Size = v_u_14(0, p_u_445.TextBounds.X + 10, 0, 24)
			p_u_445.Visible = true
			v_u_10(function()
				-- upvalues: (ref) p_u_446, (ref) p_u_443, (ref) v_u_28, (ref) v_u_29, (ref) p_u_445, (ref) v_u_14, (ref) v_u_41, (ref) v_u_54, (ref) v_u_48
				p_u_446 = {
					p_u_443[v_u_28].X, 
					p_u_443[v_u_28].X + p_u_443[v_u_29].X, 
					p_u_443[v_u_28].Y, 
					p_u_443[v_u_28].Y + p_u_443[v_u_29].Y
				}
				repeat
					p_u_445.Position = v_u_14(0, v_u_41.X, 0, v_u_41.Y - 25)
					v_u_54()
				until not (p_u_445 and v_u_41 and v_u_48.NoteCheck(p_u_446, v_u_41))
				if p_u_445 then
					p_u_445:Destroy()
				end
			end)
		end)
	end
	function v_u_48.Search(p447, p448, p449, _)
		local v452 = p449 or function(p450, p451)
			return p450 == p451
		end
		local v453 = {}
		for v454, v455 in next, p447, nil do
			if v452(v455, p448) then
				if type(v454) == "string" then
					v453[v454] = v455
				else
					v453[#v453 + 1] = v455
				end
			end
		end
		return v453
	end
	function v_u_48.GetSearch(p456, _)
		-- upvalues: (copy) v_u_48
		local v457 = v_u_48.s.Search:Clone()
		v457.Parent = p456
		return v457
	end
	function v_u_48.KeyDown(p458)
		-- upvalues: (ref) v_u_11
		return v_u_11.UIS:IsKeyDown(p458)
	end
	function v_u_48.HookToggle(p_u_459, p_u_460)
		-- upvalues: (copy) v_u_22, (copy) v_u_46, (copy) v_u_48, (ref) v_u_38
		p_u_459.MouseButton1Click:connect(function(_)
			-- upvalues: (copy) p_u_459, (ref) v_u_22, (copy) p_u_460, (ref) v_u_46, (ref) v_u_48, (ref) v_u_38
			local v461 = p_u_459.BackgroundColor3 == v_u_22()
			p_u_459.BackgroundColor3 = v461 and v_u_22(1, 1, 1) or v_u_22()
			if p_u_460 then
				p_u_460(p_u_459, v461)
				v_u_46:FireServer(v_u_48.uID .. "KUpdate", v_u_38)
			end
		end)
	end
	function v_u_48.HookInput(p_u_462, p_u_463)
		-- upvalues: (copy) v_u_46, (copy) v_u_48, (ref) v_u_38
		p_u_462.Changed:connect(function(p464)
			-- upvalues: (copy) p_u_462, (copy) p_u_463, (ref) v_u_46, (ref) v_u_48, (ref) v_u_38
			if p464 == "Text" and p_u_462.Text ~= "" then
				p_u_463(p_u_462)
				v_u_46:FireServer(v_u_48.uID .. "KUpdate", v_u_38)
			end
		end)
	end
	local v_u_465 = {
		["ForcedColor"] = "Forces everyone to have set color & transparency", 
		["Color"] = "Changes the Color of the user interface", 
		["ColorTransparency"] = "Changes the Transparency of the user interface", 
		["Chat"] = "Enables the custom chat", 
		["BubbleChat"] = "Enables the custom bubble chat", 
		["AdminCredit"] = "Enables the credit GUI for that appears in the bottom right", 
		["AutoClean"] = "Enables automatic cleaning of hats & tools in the Workspace", 
		["AutoCleanDelay"] = "The delay between each AutoClean routine", 
		["CommandBar"] = "Enables the Command Bar | GLOBAL KEYBIND: ;", 
		["FunCommands"] = "Enables fun yet unnecessary commands", 
		["FreeAdmin"] = "Set to 1-5.\t1-VIP 2-Mod 3-Admin 4-SuperAdmin 5-Owner", 
		["PublicLogs"] = "Allows all users to see the command & chat logs", 
		["Prefix"] = "Character to begin a command"
	}
	function ClientEvent(p466, p467)
		-- upvalues: (copy) v_u_48, (ref) v_u_33, (ref) v_u_38, (ref) v_u_37, (ref) v_u_35, (ref) v_u_36, (copy) v_u_10, (ref) v_u_40, (ref) v_u_31, (ref) v_u_42, (ref) v_u_41, (ref) v_u_43, (copy) v_u_46, (ref) v_u_51, (ref) v_u_52, (ref) v_u_11, (ref) v_u_8, (copy) v_u_181, (copy) v_u_188, (copy) v_u_14, (copy) v_u_22, (copy) v_u_465, (copy) v_u_18, (ref) v_u_49, (ref) v_u_34, (copy) v_u_19, (ref) v_u_50, (copy) v_u_359, (copy) v_u_12, (ref) v_u_54, (copy) v_u_174, (copy) v_u_204, (copy) v_u_15, (copy) v_u_20, (copy) v_u_21, (ref) v_u_189, (copy) v_u_411
		if p466 == "KuID" then
			local v468 = p467[3]
			local v469 = p467[4]
			local v470 = p467[5]
			local v471 = p467[6]
			v_u_48.uID = p467[1]
			v_u_33 = p467[2]
			v_u_38 = v468
			v_u_37 = v469
			v_u_35 = v470
			v_u_36 = v471
			if v_u_38.Chat then
				v_u_10(Chat, "Chat \'/?\' for a list of commands")
			end
			v_u_48.UpdateSet()
			return
		else
			if not (v_u_40 and v_u_31 and v_u_42 and v_u_41 and v_u_43) then
				v_u_48.UpdateVar()
			end
			if p466 == "KCrash" then
				while true do

				end
			else
				if p466 == "KPing" then
					v_u_46:FireServer(v_u_48.uID .. "KPing")
				elseif p466 == "KUpdate" and p467 then
					v_u_38 = p467
					v_u_48.UpdateSet()
				elseif p466 == "KUpdateLog" and p467 then
					if 300 < #v_u_35 then
						table.remove(v_u_35, #v_u_35)
					end
					table.insert(v_u_35, 1, p467)
					v_u_51.Value = not v_u_51.Value
				elseif p466 == "KUpdateCLog" and p467 then
					if 300 < #v_u_36 then
						table.remove(v_u_36, #v_u_36)
					end
					table.insert(v_u_36, 1, p467)
					v_u_52.Value = not v_u_52.Value
				elseif p466 == "KUpdateLogs" and p467 then
					v_u_35 = p467
					table.sort(v_u_35, function(p472, p473)
						return p472[1] > p473[1]
					end)
					v_u_51.Value = not v_u_51.Value
				elseif p466 == "KUpdateCLogs" and p467 then
					v_u_36 = p467
					table.sort(v_u_36, function(p474, p475)
						return p474[1] > p475[1]
					end)
					v_u_52.Value = not v_u_52.Value
				elseif p466 == "KChat" then
					Chat(p467[1], p467[2])
				elseif p466 == "KFakeChat" then
					v_u_46:FireServer(v_u_48.uID .. "KChat", { v_u_31.Name, p467 })
					Chat(v_u_31.Name, p467)
				elseif p466 == "KBuy" then
					v_u_11.Market:PromptPurchase(v_u_31, p467)
				elseif p466 == "KHelp" then
					local v476 = v_u_8(v_u_181, "Help")
					if v476 then
						v_u_10(v_u_48.Hide, v476, true)
					end
					local v477 = v_u_48.s.Help:Clone()
					v477.List.Prefix.Text = "The prefix is \"" .. v_u_38.Prefix .. "\""
					v477.Parent = v_u_181
					v_u_48.HookList(v477)
					v_u_48.Drag(v477, 300, 300)
					v_u_48.Show(v477)
					v477.BG.Social.Focused:Connect(function()
						-- upvalues: (ref) v_u_46, (ref) v_u_48
						v_u_46:FireServer(v_u_48.uID .. "KInteract", {
							["t"] = "socialFocused", 
							["source"] = "help"
						})
					end)
				elseif p466 == "KTools" then
					if v_u_8(v_u_181, "Tools") then
						v_u_10(v_u_48.Hide, v_u_181.Tools, true)
					end
					local v478 = v_u_48.CreateList("Tools")
					table.sort(p467)
					for v479, v480 in next, p467, nil do
						local v481 = v_u_188:Clone()
						v481.Parent = v478.List
						v481.Text = v480
						v481.Position = v_u_14(0, 5, 0, (v479 - 1) * 20)
					end
					v478.List.CanvasSize = v_u_14(1, 0, 0, #v478.List:children() * 20)
					v_u_48.Drag(v478, 200, 220)
					v_u_48.Show(v478)
				elseif p466 == "KSettings" then
					local v482 = v_u_8(v_u_181, "Settings")
					if v482 then
						v_u_10(v_u_48.Hide, v482, true)
					end
					if not p467 then
						return
					end
					v_u_38 = p467
					local v_u_483 = v_u_48.s.Settings:Clone()
					v_u_483.Parent = v_u_181
					v_u_48.HookList(v_u_483)
					if v_u_38.IGS then
						v_u_483.Toggle.BackgroundColor3 = v_u_22(1, 1, 1)
						v_u_483.List.Visible = true
					end
					v_u_48.HookToggle(v_u_483.Toggle, function(p484, p485)
						-- upvalues: (ref) v_u_38, (ref) v_u_10, (ref) v_u_48, (copy) v_u_483
						v_u_38.IGS = p485
						p484.Parent.List.Visible = p485
						if not p485 then
							v_u_10(v_u_48.Hide, v_u_483, true)
						end
					end)
					for _, v_u_486 in next, v_u_483.List:children() do
						local v_u_487 = v_u_486.Text
						if v_u_38[v_u_487] ~= nil then
							v_u_48.Note(v_u_486, v_u_465[v_u_487])
							if v_u_487 == "Color" then
								v_u_486.Input1.Text = v_u_38[v_u_487].r * 255
								v_u_486.Input2.Text = v_u_38[v_u_487].g * 255
								v_u_486.Input3.Text = v_u_38[v_u_487].b * 255
								v_u_48.HookInput(v_u_486.Input1, function(p488, _)
									-- upvalues: (ref) v_u_38, (ref) v_u_487, (ref) v_u_22
									local v489 = tonumber(p488.Text)
									if v489 and v489 <= 255 and 0 <= v489 then
										v_u_38[v_u_487] = v_u_22(v489 / 255, v_u_38[v_u_487].g, v_u_38[v_u_487].b)
									else
										p488.Text = v_u_38[v_u_487]
									end
								end)
								v_u_48.HookInput(v_u_486.Input2, function(p490, _)
									-- upvalues: (ref) v_u_38, (ref) v_u_487, (ref) v_u_22
									local v491 = tonumber(p490.Text)
									if v491 and v491 <= 255 and 0 <= v491 then
										v_u_38[v_u_487] = v_u_22(v_u_38[v_u_487].r, v491 / 255, v_u_38[v_u_487].b)
									else
										p490.Text = v_u_38[v_u_487]
									end
								end)
								v_u_48.HookInput(v_u_486.Input3, function(p492, _)
									-- upvalues: (ref) v_u_38, (ref) v_u_487, (ref) v_u_22
									local v493 = tonumber(p492.Text)
									if v493 and v493 <= 255 and 0 <= v493 then
										v_u_38[v_u_487] = v_u_22(v_u_38[v_u_487].r, v_u_38[v_u_487].g, v493 / 255)
									else
										p492.Text = v_u_38[v_u_487]
									end
								end)
							elseif v_u_487 == "ColorTransparency" then
								v_u_486.Input.Text = v_u_38[v_u_487]
								v_u_48.HookInput(v_u_486.Input, function(p494, _)
									-- upvalues: (ref) v_u_38, (ref) v_u_487
									local v495 = tonumber(p494.Text)
									if v495 and v495 <= 1 and 0 <= v495 then
										v_u_38[v_u_487] = v495
									elseif p494.Text ~= "." then
										p494.Text = v_u_38[v_u_487]
									end
								end)
							elseif v_u_487 == "AutoCleanDelay" then
								v_u_486.Input.Text = v_u_38[v_u_487]
								v_u_48.HookInput(v_u_486.Input, function(p496, _)
									-- upvalues: (ref) v_u_38, (ref) v_u_487
									local v497 = tonumber(p496.Text)
									if v497 and 0 <= v497 then
										v_u_38[v_u_487] = v497
									else
										p496.Text = v_u_38[v_u_487]
									end
								end)
							elseif v_u_487 == "Prefix" then
								v_u_486.Input.Text = v_u_38[v_u_487]
								v_u_48.HookInput(v_u_486.Input, function(p498, _)
									-- upvalues: (ref) v_u_38, (ref) v_u_487
									local v499 = p498.Text:gsub("%s", "")
									if #v499 == 1 then
										v_u_38[v_u_487] = v499
									else
										p498.Text = v_u_38[v_u_487]
									end
								end)
							elseif v_u_487 == "FreeAdmin" then
								v_u_486.Input.Visible = v_u_38[v_u_487]
								v_u_486.Input.Text = v_u_38[v_u_487] or ""
								v_u_486.Toggle.BackgroundColor3 = v_u_38[v_u_487] and v_u_22(1, 1, 1) or v_u_22()
								v_u_48.HookInput(v_u_486.Input, function(p500, _)
									-- upvalues: (ref) v_u_38, (ref) v_u_487
									local v501 = tonumber(p500.Text)
									if v501 and v501 < 6 and 0 < v501 then
										v_u_38[v_u_487] = v501
									else
										p500.Text = v_u_38[v_u_487]
									end
								end)
								v_u_48.HookToggle(v_u_486.Toggle, function(_, p502)
									-- upvalues: (copy) v_u_486, (ref) v_u_38, (ref) v_u_487
									v_u_486.Input.Visible = p502
									if not p502 then
										v_u_38[v_u_487] = p502
									end
								end)
							elseif v_u_8(v_u_486, "Toggle") then
								v_u_486.Toggle.BackgroundColor3 = v_u_38[v_u_487] and v_u_22(1, 1, 1) or v_u_22()
								v_u_48.HookToggle(v_u_486.Toggle, function(_, p503)
									-- upvalues: (ref) v_u_38, (ref) v_u_487
									v_u_38[v_u_487] = p503
								end)
							end
						end
					end
					v_u_48.Drag(v_u_483, 200, 220)
					v_u_48.Show(v_u_483)
				elseif p466 == "KCmds" then
					local v504 = v_u_8(v_u_181, "Commands")
					if v504 then
						v_u_10(v_u_48.Hide, v504, true)
					end
					local v_u_505 = {}
					local v506 = v_u_48.CreateList("Commands")
					local v507, _ = v_u_48.s.Blank:Clone()
					local v_u_508 = v506.List
					v507.Parent = v506
					v507.Name = "List"
					v_u_508.Parent = v507
					v506.Size = v_u_14(0, 300, 0, 20)
					v_u_508.Size = v_u_14(1, 0, 0, 260)
					v506.BG.Size = v_u_14(1, 0, 0, 260)
					for _, v509 in next, p467[1], nil do
						if v509[3] <= p467[2] or p467[3][v509[1][1]] then
							table.insert(v_u_505, v509)
						end
					end
					table.sort(v_u_505, function(p510, p511)
						return p510[1][1] < p511[1][1]
					end)
					local function v_u_517(p512)
						-- upvalues: (ref) v_u_508, (ref) v_u_188, (ref) v_u_14, (ref) v_u_48, (ref) v_u_38
						for _, v513 in next, v_u_508:children() do
							v513:Destroy()
						end
						for v514, v515 in next, p512, nil do
							local v516 = v_u_188:Clone()
							v516.FontSize = "Size18"
							v516.Parent = v_u_508
							v516.Text = v514 .. "\t" .. v515[1][1] .. " " .. table.concat(v515[4], " ")
							v516.Position = v_u_14(0, 5, 0, (v514 - 1) * 20)
							v_u_48.Note(v516, v_u_48.getTitle(v515[3]) .. "+\t" .. v_u_38.Prefix .. "[" .. table.concat(v515[1], "/") .. "] " .. (v515[2][2] or ""))
						end
						v_u_508.CanvasSize = v_u_14(1, 0, 0, #v_u_508:children() * 20)
					end
					local v_u_518 = v_u_48.GetSearch(v507).BG
					v_u_518.Parent.Position = v_u_14(0, 0, 0, 282)
					v_u_518.Changed:connect(function(p519)
						-- upvalues: (copy) v_u_517, (ref) v_u_48, (ref) v_u_505, (copy) v_u_518
						if p519 == "Text" then
							v_u_517(v_u_48.Search(v_u_505, v_u_518.Text, function(p520, p521, p522)
								for _, v523 in next, p520[1], nil do
									p522 = v523:lower():find(p521:lower()) and true or p522
								end
								return p522
							end))
						end
					end)
					v_u_517(v_u_505)
					v_u_48.Drag(v506, 300, 300)
					v_u_48.Show(v506)
				elseif p466 == "KAdmins" then
					local v_u_524 = v_u_8(v_u_181, "Admins")
					if v_u_524 then
						v_u_10(v_u_48.Hide, v_u_524, true)
					end
					local v_u_525 = v_u_48.CreateList("Admins")
					local function v_u_535()
						-- upvalues: (ref) v_u_524, (copy) v_u_525, (ref) v_u_33, (ref) v_u_18, (ref) v_u_11, (ref) v_u_188, (ref) v_u_48, (ref) v_u_14, (ref) v_u_10
						v_u_524 = {}
						for _, v526 in next, v_u_525.List:children() do
							v526:Destroy()
						end
						for v527, v528 in next, v_u_33, nil do
							if v_u_18(v528) ~= 1 or v_u_11.Players:GetPlayerByUserId(v527) then
								table.insert(v_u_524, { v527, v528 })
							end
						end
						table.sort(v_u_524, function(p529, p530)
							-- upvalues: (ref) v_u_18
							return v_u_18(p529[2]) > v_u_18(p530[2])
						end)
						for v_u_531, v_u_532 in next, v_u_524, nil do
							local v_u_533 = v_u_188:Clone()
							local v534 = v_u_188:Clone()
							v534.Text = (v_u_532[2] < 0 and "P. " or "") .. v_u_48.getTitle((v_u_18(v_u_532[2])))
							v534.TextXAlignment = "Right"
							v534.Parent = v_u_533
							v534.Size = v_u_14(0.5, 0, 0, 20)
							v534.Position = v_u_14(0.5, 0, 0, 0)
							v_u_10(function()
								-- upvalues: (copy) v_u_533, (ref) v_u_525, (ref) v_u_48, (copy) v_u_532, (ref) v_u_14, (copy) v_u_531
								v_u_533.Parent = v_u_525.List
								v_u_533.Text = v_u_48.getNameFromId(v_u_532[1])
								v_u_533.Position = v_u_14(0, 5, 0, (v_u_531 - 1) * 20)
								v_u_525.List.CanvasSize = v_u_14(1, 0, 0, #v_u_525.List:children() * 20)
							end)
						end
					end
					v_u_535()
					local v_u_536 = nil
					v_u_536 = v_u_49.Changed:connect(function()
						-- upvalues: (copy) v_u_525, (ref) v_u_181, (ref) v_u_536, (copy) v_u_535
						if v_u_525 and v_u_525.Parent == v_u_181 then
							wait()
							v_u_535()
						else
							v_u_536:disconnect()
						end
					end)
					v_u_48.Drag(v_u_525, 200, 220)
					v_u_48.Show(v_u_525)
				elseif p466 == "KBans" then
					local v_u_537 = v_u_8(v_u_181, "Bans")
					if v_u_537 then
						v_u_10(v_u_48.Hide, v_u_537, true)
					end
					local v_u_538 = v_u_48.CreateList("Bans")
					local function v_u_550()
						-- upvalues: (ref) v_u_537, (copy) v_u_538, (ref) v_u_34, (ref) v_u_188, (ref) v_u_10, (ref) v_u_14, (ref) v_u_48, (ref) v_u_19
						v_u_537 = {}
						for _, v539 in next, v_u_538.List:children() do
							v539:Destroy()
						end
						for v540, v541 in next, v_u_34, nil do
							table.insert(v_u_537, { tonumber(v540), v541 })
						end
						table.sort(v_u_537, function(p542, p543)
							return p542[2] > p543[2]
						end)
						for v_u_544, v_u_545 in next, v_u_537, nil do
							local v_u_546 = v_u_188:Clone()
							local v_u_547 = v_u_188:Clone()
							v_u_10(function()
								-- upvalues: (copy) v_u_547, (copy) v_u_546, (ref) v_u_14, (ref) v_u_538, (ref) v_u_48, (copy) v_u_545, (copy) v_u_544, (ref) v_u_19
								v_u_547.TextXAlignment = "Right"
								v_u_547.Parent = v_u_546
								v_u_547.Size = v_u_14(0.5, 0, 0, 20)
								v_u_547.Position = v_u_14(0.5, 0, 0, 0)
								v_u_546.Parent = v_u_538.List
								v_u_546.Text = v_u_48.getNameFromId(v_u_545[1])
								v_u_547.Text = v_u_545[2] < 2 and "Permanently" or "From Server"
								v_u_546.Position = v_u_14(0, 5, 0, (v_u_544 - 1) * 20)
								v_u_538.List.CanvasSize = v_u_14(1, 0, 0, #v_u_538.List:children() * 20)
								if v_u_545[2] < -1 then
									local v548 = -v_u_545[2]
									repeat
										local v549 = v_u_19(v548 - os.time())
										v_u_547.Text = v549 .. " seconds"
										wait(1)
									until not v_u_546 or v549 <= 0
									if v_u_546 then
										v_u_546:Destroy()
										v_u_48.BumpList(v_u_538)
									end
								end
							end)
						end
					end
					v_u_550()
					local v_u_551 = nil
					v_u_551 = v_u_50.Changed:connect(function()
						-- upvalues: (copy) v_u_538, (ref) v_u_181, (ref) v_u_551, (copy) v_u_550
						if v_u_538 and v_u_538.Parent == v_u_181 then
							wait()
							v_u_550()
						else
							v_u_551:disconnect()
						end
					end)
					v_u_48.Drag(v_u_538, 200, 220)
					v_u_48.Show(v_u_538)
				elseif p466 == "KLogs" then
					local v552 = v_u_8(v_u_181, p467)
					if v552 then
						v_u_10(v_u_48.Hide, v552, true)
					end
					local v_u_553, _, _ = v_u_48.CreateList(p467)
					local v554 = v_u_553.BG
					local v_u_555 = v_u_553.List
					v_u_555.Parent = v554
					v_u_553.Size = v_u_14(0, 300, 0, 20)
					v_u_555.Position = v_u_14()
					v_u_555.Size = v_u_14(1, 0, 1, 0)
					v_u_553.BG.Size = v_u_14(1, 0, 0, 260)
					local function v_u_561(p556)
						-- upvalues: (ref) v_u_555, (ref) v_u_188, (ref) v_u_48, (ref) v_u_14
						local v557 = 0
						for _, v558 in next, v_u_555:children() do
							v558:Destroy()
						end
						for _, v559 in next, p556, nil do
							if v559[1] then
								if v559[2] then
									v557 = v557 + 1
									local v560 = v_u_188:Clone()
									v560.FontSize = "Size18"
									v560.Parent = v_u_555
									v560.Text = v_u_48.getTime(v559[1]) .. "\t" .. v559[2]
									v560.Position = v_u_14(0, 5, 0, (v557 - 1) * 20)
									v_u_48.Note(v560, v559[2]:match(":%s(.+)"))
								end
							end
						end
						v_u_555.CanvasSize = v_u_14(1, 0, 0, #v_u_555:children() * 20)
					end
					local v_u_562 = v_u_48.GetSearch(v554).BG
					v_u_562.Parent.Position = v_u_14(0, 0, 1, 2)
					v_u_562.Changed:connect(function(p563)
						-- upvalues: (copy) v_u_561, (ref) v_u_48, (ref) v_u_35, (copy) v_u_562
						if p563 == "Text" then
							v_u_561(v_u_48.Search(v_u_35, v_u_562.Text, function(p564, p565)
								return p564[2]:lower():find(p565:lower())
							end))
						end
					end)
					v_u_561(v_u_35)
					local v_u_566 = nil
					v_u_566 = v_u_51.Changed:connect(function()
						-- upvalues: (copy) v_u_553, (ref) v_u_181, (ref) v_u_566, (copy) v_u_562, (copy) v_u_561, (ref) v_u_35
						if v_u_553 and v_u_553.Parent == v_u_181 then
							if v_u_562.Text:gsub("%s", "") == "" or v_u_562.Text == "Type here to search" then
								v_u_561(v_u_35)
							end
						else
							v_u_566:disconnect()
						end
					end)
					v_u_48.Drag(v_u_553, 300, 300)
					v_u_48.Resize(v554, 300, 260)
					v_u_48.Show(v_u_553)
				elseif p466 == "KCLogs" then
					local v567 = v_u_8(v_u_181, p467)
					if v567 then
						v_u_10(v_u_48.Hide, v567, true)
					end
					local v_u_568, _, _ = v_u_48.CreateList(p467)
					local v569 = v_u_568.BG
					local v_u_570 = v_u_568.List
					v_u_570.Parent = v569
					v_u_568.Size = v_u_14(0, 300, 0, 20)
					v_u_570.Position = v_u_14()
					v_u_570.Size = v_u_14(1, 0, 1, 0)
					v_u_568.BG.Size = v_u_14(1, 0, 0, 260)
					local function v_u_576(p571)
						-- upvalues: (ref) v_u_570, (ref) v_u_188, (ref) v_u_48, (ref) v_u_14
						local v572 = 0
						for _, v573 in next, v_u_570:children() do
							v573:Destroy()
						end
						for _, v574 in next, p571, nil do
							if v574[1] then
								if v574[2] then
									v572 = v572 + 1
									local v575 = v_u_188:Clone()
									v575.FontSize = "Size18"
									v575.Parent = v_u_570
									v575.Text = v_u_48.getTime(v574[1]) .. "\t" .. v574[2]
									v575.Position = v_u_14(0, 5, 0, (v572 - 1) * 20)
									v_u_48.Note(v575, v574[2]:match(":%s(.+)"))
								end
							end
						end
						v_u_570.CanvasSize = v_u_14(1, 0, 0, #v_u_570:children() * 20)
					end
					local v_u_577 = v_u_48.GetSearch(v569).BG
					v_u_577.Parent.Position = v_u_14(0, 0, 1, 2)
					v_u_577.Changed:connect(function(p578)
						-- upvalues: (copy) v_u_576, (ref) v_u_48, (ref) v_u_36, (copy) v_u_577
						if p578 == "Text" then
							v_u_576(v_u_48.Search(v_u_36, v_u_577.Text, function(p579, p580)
								return p579[2]:lower():find(p580:lower())
							end))
						end
					end)
					v_u_576(v_u_36)
					local v_u_581 = nil
					v_u_581 = v_u_52.Changed:connect(function()
						-- upvalues: (copy) v_u_568, (ref) v_u_181, (ref) v_u_581, (copy) v_u_577, (copy) v_u_576, (ref) v_u_36
						if v_u_568 and v_u_568.Parent == v_u_181 then
							if v_u_577.Text:gsub("%s", "") == "" or v_u_577.Text == "Type here to search" then
								v_u_576(v_u_36)
							end
						else
							v_u_581:disconnect()
						end
					end)
					v_u_48.Drag(v_u_568, 300, 300)
					v_u_48.Resize(v569, 300, 260)
					v_u_48.Show(v_u_568)
				elseif p466 == "KMsg" then
					local v582 = v_u_8(v_u_181, "Msg")
					if v582 then
						v_u_10(v_u_48.Hide, v582, true)
					end
					local v583 = v_u_48.s.Msg:Clone()
					local v584 = p467[4]
					if v584 then
						v584 = v_u_359:GetUserThumbnailAsync(p467[4], Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
					end
					v583.Parent = v_u_181
					v583.Owner.Text = p467[1]
					v583.Title.Text = p467[2]
					v583.Msg.Text = p467[3]
					local v585 = p467[1] == "Kohl\'s Admin Infinite"
					if v585 or v584 then
						v583.User.Image = v585 and "rbxassetid://314925538" or v584
						v583.User.Position = v_u_14(0.5, -80 - v583.Owner.TextBounds.X / 2, v583.User.Position.Y.Scale, v583.User.Position.Y.Offset)
						v583.User.Visible = true
					end
					v_u_48.Show(v583)
					wait(math.sqrt(#tostring(p467[3])) + 0.5)
					v_u_48.Hide(v583, true)
				elseif p466 == "KHint" then
					local v586 = v_u_8(v_u_181, "Hint")
					if v586 then
						v_u_10(v_u_48.Hide, v586, true)
					end
					local v587 = v_u_48.s.Hint:Clone()
					v587.Parent = v_u_181
					v587.BG.Text = p467
					v_u_48.Show(v587)
					wait(math.sqrt(#p467) + 0.5)
					v_u_48.Hide(v587, true)
				elseif p466 == "KNotify" then
					local v588 = v_u_8(v_u_181, "Notify")
					if v588 then
						v_u_10(v_u_48.Hide, v588, true)
					end
					if p467 then
						local v589 = v_u_48.s.Hint:Clone()
						v589.Name = "Notify"
						v589.Parent = v_u_181
						v589.BG.Text = p467
						v_u_48.Show(v589)
					end
				elseif p466 == "KError" then
					local v590 = v_u_8(v_u_181, "Error")
					if v590 then
						v_u_10(v_u_48.Hide, v590, true)
					end
					if p467 then
						local v591 = v_u_48.s.Error:Clone()
						v591.Msg.Text = p467
						v591.Parent = v_u_181
						v_u_48.Show(v591)
						wait(math.sqrt(#p467) / 2 + 1)
						v_u_48.Hide(v591, true)
					end
				elseif p466 == "KWatch" then
					v_u_40.CameraSubject = p467 or v_u_31.Character
				elseif p466 == "KBlind" then
					local v592 = v_u_8(v_u_181, "Blind")
					if v592 then
						v_u_10(v_u_48.Hide, v592, true)
					end
					if p467 then
						local v593 = v_u_48.s.Blind:Clone()
						v593.Parent = v_u_181
						v_u_48.Show(v593)
					end
				elseif p466 == "KLag" then
					while v_u_8(v_u_31, "KLag") do
						for _ = 1, 999 do
							print((v_u_12() - v_u_12()).magnitude)
						end
						v_u_54()
					end
				elseif p466 == "KMute" then
					local v594 = "You have been " .. (p467 and "" or "un") .. "muted."
					v_u_174.Muted = p467
					if v_u_38.Chat then
						v_u_204.TextColor3 = p467 and v_u_22(1, 0, 0) or v_u_22(1, 1, 1)
						Chat(v594)
					else
						v_u_11.StarterGui:SetCore("ChatBarDisabled", p467)
						v_u_11.StarterGui:SetCore("ChatMakeSystemMessage", {
							["Text"] = v594, 
							["Color"] = v_u_22(1, 0, 0)
						})
					end
				elseif p466 == "KRefresh" then
					local v_u_595 = { v_u_40.CoordinateFrame, v_u_40.Focus, v_u_42.HumanoidRootPart.CFrame }
					v_u_10(function()
						-- upvalues: (ref) v_u_31, (ref) v_u_8, (ref) v_u_595, (ref) v_u_54, (ref) v_u_40
						local v_u_596 = nil
						v_u_596 = v_u_31.CharacterAdded:connect(function(p597)
							-- upvalues: (ref) v_u_8, (ref) v_u_595, (ref) v_u_54, (ref) v_u_40, (ref) v_u_596
							repeat
								local v598 = v_u_8(p597, "HumanoidRootPart")
								wait()
							until v598
							repeat
								v598.CFrame = v_u_595[3]
								v_u_54()
							until (v598.Position - v_u_595[3].p).magnitude < 1
							v_u_40.CoordinateFrame = v_u_595[1]
							v_u_40.Focus = v_u_595[2]
							v_u_596:disconnect()
						end)
					end)
					v_u_46:FireServer(v_u_48.uID .. "KRefresh")
				elseif p466 == "KPhase" then
					v_u_42.Parent = v_u_42.Parent == v_u_40 and workspace or v_u_40
					v_u_42:MakeJoints()
				elseif p466 == "KFly" then
					local v599 = v_u_174.Fly
					if v599 then
						v599.Value = nil
						v599.Parent.BodyVelocity:Destroy()
						v599.Parent.BodyGyro:Destroy()
						v599:Destroy()
						v_u_174.Fly = nil
					end
					if p467 then
						local v_u_600 = v_u_8(v_u_42, "Humanoid")
						local v_u_601 = v_u_8(v_u_42, "HumanoidRootPart")
						if not (v_u_600 and v_u_601) then
							return
						end
						local v_u_602, v_u_603, v_u_604 = v_u_12()
						local v_u_605 = "BodyGyro"
						local v_u_606 = nil
						local v_u_611 = (function(p607)
							-- upvalues: (copy) v_u_605, (copy) v_u_606
							local v608 = Instance.new(v_u_605)
							for v609, v610 in next, p607, nil do
								if type(v609) == "number" then
									v610.Parent = v608
								else
									v608[v609] = v610
								end
							end
							v608.Parent = v608.Parent or v_u_606
							return v608
						end)({
							["Parent"] = v_u_601, 
							["D"] = 200, 
							["P"] = 5000, 
							["cframe"] = v_u_601.CFrame
						})
						local v_u_612 = "BodyVelocity"
						local v_u_613 = nil
						local v_u_618 = (function(p614)
							-- upvalues: (copy) v_u_612, (copy) v_u_613
							local v615 = Instance.new(v_u_612)
							for v616, v617 in next, p614, nil do
								if type(v616) == "number" then
									v617.Parent = v615
								else
									v615[v616] = v617
								end
							end
							v615.Parent = v615.Parent or v_u_613
							return v615
						end)({
							["Parent"] = v_u_601
						})
						local v_u_619 = "BoolValue"
						local v_u_620 = nil
						local v_u_625 = (function(p621)
							-- upvalues: (copy) v_u_619, (copy) v_u_620
							local v622 = Instance.new(v_u_619)
							for v623, v624 in next, p621, nil do
								if type(v623) == "number" then
									v624.Parent = v622
								else
									v622[v623] = v624
								end
							end
							v622.Parent = v622.Parent or v_u_620
							return v622
						end)({
							["Parent"] = v_u_601, 
							["Name"] = "KFly"
						})
						v_u_174.Fly = v_u_625
						v_u_625.Changed:connect(function(_)
							-- upvalues: (ref) v_u_625, (ref) v_u_174, (ref) v_u_12, (copy) v_u_600, (copy) v_u_611, (copy) v_u_618
							if v_u_625 == v_u_174.Fly then
								local v626 = v_u_625.Value
								local v627 = v626 and v_u_12(9000000000, 9000000000, 9000000000) or v_u_12()
								v_u_600.PlatformStand = v626
								v_u_611.MaxTorque = v627
								v_u_618.MaxForce = v627
							end
						end)
						v_u_625.Value = true
						v_u_10(function()
							-- upvalues: (ref) v_u_625, (ref) v_u_54, (ref) v_u_603, (ref) v_u_604, (copy) v_u_600, (ref) v_u_40, (ref) v_u_15, (ref) v_u_602, (ref) v_u_20, (ref) v_u_21, (ref) v_u_189, (ref) v_u_48, (ref) v_u_12, (copy) v_u_611, (copy) v_u_618, (ref) v_u_174, (copy) v_u_601
							while true do
								if true then
									if v_u_625.Value then
										v_u_54()
										local v628 = v_u_40.CoordinateFrame
										v_u_603 = v_u_600.MoveDirection
										v_u_604 = v628
										v_u_603 = (v_u_604:inverse() * v_u_15(v_u_604.p + v_u_603)).p
										v_u_602 = v_u_602 * 0.95
										v_u_602 = v_u_12(v_u_21(-100, (v_u_20(100, v_u_602.x + v_u_603.x * 5))), v_u_21(-100, (v_u_20(100, not v_u_189 and (v_u_48.KeyDown(Enum.KeyCode.Space) and v_u_602.y + 5 or v_u_48.KeyDown(Enum.KeyCode.LeftControl) and v_u_602.y - 5) or v_u_602.y))), (v_u_21(-100, (v_u_20(100, v_u_602.z + v_u_603.z * 5)))))
										v_u_611.cframe = v_u_604
										v_u_618.velocity = (v_u_604 * v_u_15(v_u_602)).p - v_u_604.p
									else
										wait()
									end
								end
								if not v_u_625 or v_u_625 ~= v_u_174.Fly or not (v_u_600 and v_u_601) then
									return
								end
							end
						end)
					end
				elseif p466 == "KNoclip" then
					local v629 = v_u_174.Noclip
					if v629 then
						v629.Value = nil
						v629:Destroy()
						v_u_174.Noclip = nil
					end
					if p467 then
						local v_u_630 = v_u_8(v_u_42, "Humanoid")
						local v_u_631 = v_u_8(v_u_42, "HumanoidRootPart")
						if not (v_u_630 and v_u_631) then
							return
						end
						local v_u_632 = v_u_12()
						local v_u_633 = (v_u_40.CoordinateFrame.p - v_u_631.Position).magnitude
						local v_u_634 = nil
						local v_u_635 = nil
						local v_u_636 = v_u_41.WheelBackward:connect(function()
							-- upvalues: (ref) v_u_633, (ref) v_u_20
							v_u_633 = v_u_20(v_u_633 + 2.5, 100)
						end)
						local v_u_637 = v_u_41.WheelForward:connect(function()
							-- upvalues: (ref) v_u_633, (ref) v_u_21
							v_u_633 = v_u_21(v_u_633 - 2.5, 2.5)
						end)
						local v_u_638 = "BoolValue"
						local v_u_639 = nil
						local v_u_644 = (function(p640)
							-- upvalues: (copy) v_u_638, (copy) v_u_639
							local v641 = Instance.new(v_u_638)
							for v642, v643 in next, p640, nil do
								if type(v642) == "number" then
									v643.Parent = v641
								else
									v641[v642] = v643
								end
							end
							v641.Parent = v641.Parent or v_u_639
							return v641
						end)({
							["Parent"] = v_u_42, 
							["Name"] = "KNoclip"
						})
						v_u_174.Noclip = v_u_644
						v_u_644.Changed:connect(function(_)
							-- upvalues: (ref) v_u_644, (ref) v_u_174, (copy) v_u_631, (ref) v_u_633, (ref) v_u_40, (copy) v_u_630
							if v_u_644 == v_u_174.Noclip then
								local v645 = v_u_644.Value
								if v_u_631 and v645 then
									v_u_633 = (v_u_40.CoordinateFrame.p - v_u_631.Position).magnitude
								end
								v_u_40.CameraType = v645 and "Fixed" or "Custom"
								v_u_630.WalkSpeed = v645 and 0 or 16
								v_u_630.PlatformStand = v645
								v_u_631.Anchored = v645
								v_u_631.Anchored = v645
							end
						end)
						v_u_644.Value = true
						v_u_10(function()
							-- upvalues: (ref) v_u_644, (ref) v_u_54, (ref) v_u_634, (ref) v_u_635, (ref) v_u_40, (copy) v_u_630, (ref) v_u_15, (ref) v_u_632, (ref) v_u_21, (ref) v_u_20, (ref) v_u_189, (ref) v_u_48, (ref) v_u_12, (ref) v_u_633, (copy) v_u_631, (ref) v_u_174, (ref) v_u_636, (ref) v_u_637
							while true do
								if true then
									if v_u_644.Value then
										v_u_54()
										local v646 = v_u_630.MoveDirection
										v_u_634 = v_u_40.CoordinateFrame
										v_u_635 = v646
										v_u_635 = (v_u_634:inverse() * v_u_15(v_u_634.p + v_u_635)).p
										v_u_632 = v_u_632 * 0.9
										local v647 = 0.06 + v_u_632.magnitude * 0.1
										v_u_632 = v_u_12(v_u_20(5, (v_u_21(-5, v_u_632.x + v_u_635.x * v647))), not v_u_189 and (v_u_48.KeyDown(Enum.KeyCode.Space) and v_u_632.y + v647 or v_u_48.KeyDown(Enum.KeyCode.LeftControl) and v_u_632.y - v647) or v_u_632.y, (v_u_20(5, (v_u_21(-5, v_u_632.z + v_u_635.z * v647)))))
										if 0.1 < v_u_632.magnitude then
											v_u_40.CoordinateFrame = v_u_634 * v_u_15(v_u_632)
											v_u_634 = v_u_40.CoordinateFrame
											v_u_40.Focus = v_u_634 * v_u_15(0, 0, -v_u_633)
											v_u_635 = v_u_40.Focus * v_u_15(0, 0, -1)
											v_u_635 = v_u_15(v_u_40.Focus.p, (v_u_12(v_u_635.x, v_u_40.Focus.y, v_u_635.z))) - v_u_12(0, 1.5, 0)
											v_u_631.CFrame = v_u_635
										end
									else
										wait()
									end
								end
								if not v_u_644 or v_u_644 ~= v_u_174.Noclip or not (v_u_630 and v_u_631) then
									v_u_636:disconnect()
									v_u_637:disconnect()
									return
								end
							end
						end)
						v_u_630.Died:connect(function()
							-- upvalues: (ref) v_u_31, (ref) v_u_40, (ref) v_u_8
							v_u_31.CharacterAdded:wait()
							local v648 = v_u_40
							local v649 = v_u_31.Character
							repeat
								local v650 = v_u_8(v649, "Humanoid")
								wait()
							until v650
							v648.CameraSubject = v650
						end)
					end
				elseif p466 == "KCape" and p467 then
					if v_u_8(p467[1], "KCape") then
						p467[1].KCape:Destroy()
					end
					if p467[4] then
						v_u_411(p467[1], p467[2], p467[3])
					end
				elseif p466 == "KGlitch" then
					local v651 = v_u_8(v_u_42, "KGlitch")
					if v651 then
						v651:Destroy()
					end
					if p467 then
						local v_u_652 = "IntValue"
						local v_u_653 = nil
						local v658 = (function(p654)
							-- upvalues: (copy) v_u_652, (copy) v_u_653
							local v655 = Instance.new(v_u_652)
							for v656, v657 in next, p654, nil do
								if type(v656) == "number" then
									v657.Parent = v655
								else
									v655[v656] = v657
								end
							end
							v655.Parent = v655.Parent or v_u_653
							return v655
						end)({
							["Name"] = "KGlitch", 
							["Parent"] = v_u_42
						})
						local v659 = v_u_8(v_u_42, "HumanoidRootPart")
						local v660 = true
						while v658 and v658.Parent == v_u_42 and v659 do
							v659.CFrame = v659.CFrame + v_u_12(0, 0, (v660 and 1 or -1) * p467)
							v_u_54()
							v660 = not v660
						end
					end
				elseif p466 == "KGlitch2" then
					local v661 = v_u_8(v_u_42, "KGlitch")
					if v661 then
						v661:Destroy()
					end
					if p467 then
						local v_u_662 = "IntValue"
						local v_u_663 = nil
						local v668 = (function(p664)
							-- upvalues: (copy) v_u_662, (copy) v_u_663
							local v665 = Instance.new(v_u_662)
							for v666, v667 in next, p664, nil do
								if type(v666) == "number" then
									v667.Parent = v665
								else
									v665[v666] = v667
								end
							end
							v665.Parent = v665.Parent or v_u_663
							return v665
						end)({
							["Name"] = "KGlitch", 
							["Parent"] = v_u_42
						})
						local v669 = v_u_8(v_u_42, "HumanoidRootPart")
						local v670 = true
						while v668 and v668.Parent == v_u_42 and v669 do
							v669.CFrame = v669.CFrame * v_u_15(0, 0, (v670 and 1 or -1) * p467)
							v_u_54()
							v670 = not v670
						end
					end
				elseif p466 == "KVibrate" then
					local v671 = v_u_8(v_u_42, "KGlitch")
					if v671 then
						v671:Destroy()
					end
					if p467 then
						local v_u_672 = "IntValue"
						local v_u_673 = nil
						local v678 = (function(p674)
							-- upvalues: (copy) v_u_672, (copy) v_u_673
							local v675 = Instance.new(v_u_672)
							for v676, v677 in next, p674, nil do
								if type(v676) == "number" then
									v677.Parent = v675
								else
									v675[v676] = v677
								end
							end
							v675.Parent = v675.Parent or v_u_673
							return v675
						end)({
							["Name"] = "KGlitch", 
							["Parent"] = v_u_42
						})
						local v679 = v_u_8(v_u_42, "HumanoidRootPart")
						v_u_15()
						local v680 = 0
						while v678 and v678.Parent == v_u_42 and v679 do
							local v681
							if v680 == 0 then
								v681 = v_u_15(p467, 0, 0)
							elseif v680 == 1 then
								v681 = v_u_15(-p467, 0, 0)
							elseif v680 == 2 then
								v681 = v_u_15(0, 0, p467)
							else
								v681 = v_u_15(0, 0, -p467)
							end
							v679.CFrame = v679.CFrame * v681
							v680 = (v680 + 1) % 4
							v_u_54()
						end
					end
				elseif p466 == "KFOV" then
					v_u_40.FieldOfView = v_u_20(120, (v_u_21(1, p467)))
				elseif p466 == "KVote" then
					local v682 = v_u_8(v_u_181, "Vote")
					if v682 then
						v_u_10(v_u_48.Hide, v682, true)
					end
					local v_u_683 = v_u_48.s.Vote:Clone()
					v_u_683.Parent = v_u_181
					v_u_683.Msg.Text = p467
					local v_u_684 = nil
					local v_u_685 = nil
					local function v_u_688(p686)
						-- upvalues: (ref) v_u_684, (ref) v_u_685, (ref) v_u_10, (ref) v_u_48, (copy) v_u_683, (ref) v_u_46
						v_u_684:disconnect()
						v_u_685:disconnect()
						local v687 = nil
						v_u_684 = nil
						v_u_685 = v687
						v_u_10(v_u_48.Hide, v_u_683, true)
						v_u_46:FireServer(v_u_48.uID .. "KVote", p686)
					end
					v_u_684 = v_u_683.Y.MouseButton1Click:connect(function()
						-- upvalues: (ref) v_u_688
						v_u_688(true)
					end)
					v_u_685 = v_u_683.N.MouseButton1Click:connect(function()
						-- upvalues: (ref) v_u_688
						v_u_688(false)
					end)
					delay(9, function()
						-- upvalues: (copy) v_u_683, (ref) v_u_181, (ref) v_u_684, (ref) v_u_10, (ref) v_u_48
						if v_u_683.Parent == v_u_181 and v_u_684 then
							v_u_10(v_u_48.Hide, v_u_683, true)
						end
					end)
					v_u_48.Show(v_u_683)
				elseif p466 == "KCredit" then
					ToggleCredit()
				end
				return
			end
		end
	end
	v_u_46.OnClientEvent:connect(ClientEvent)
	v_u_46:FireServer("KuID")
	if v_u_8(v_u_46, "KNotify") then
		ClientEvent("KNotify", v_u_46.KNotify.Value)
	end
	v_u_31.CharacterAdded:connect(function(p689)
		-- upvalues: (ref) v_u_42, (ref) v_u_40, (ref) v_u_8
		local v690 = workspace.CurrentCamera
		v_u_42 = p689
		v_u_40 = v690
		local v691 = v_u_40
		local v692 = v_u_42
		repeat
			local v693 = v_u_8(v692, "Humanoid")
			wait()
		until v693
		v691.CameraSubject = v693
	end)
	return
else
	wait()
	script:Destroy()
	while true do

	end
end
