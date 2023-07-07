-- decompiled by Sentinel (took 21.775559ms)
local v_u_1 = {}
local v_u_2 = _G.HDAdminMain
local v_u_3 = v_u_2.warnings.UnBan
local v_u_4 = v_u_2.warnings.PermRank
local v_u_5 = v_u_2.gui.MenuTemplates
local v_u_6 = 1
local function v_u_12(p7, p8)
	for _, v9 in pairs(p7:GetDescendants()) do
		if v9:IsA("GuiObject") and v9:FindFirstChild("OriginalZIndex") == nil then
			local v10 = Instance.new("IntValue")
			v10.Name = "OriginalZIndex"
			local v11 = v9.ZIndex
			if p8 then
				v11 = v11 + 10000
			end
			v10.Value = v11
			v10.Parent = v9
		end
	end
end
local function v_u_17(_, p13)
	-- upvalues: (copy) v_u_2
	for v14, v15 in pairs(v_u_2.commandMenus) do
		for _, v16 in pairs(v15:GetDescendants()) do
			if v16:IsA("GuiObject") and v16:FindFirstChild("OriginalZIndex") and (not p13 or v15 == p13) then
				v16.ZIndex = v16.OriginalZIndex.Value + (v14 - 1) * 10 - 1000
			end
		end
	end
end
function v_u_1.ReplicateEffect(_, p18, p19)
	-- upvalues: (copy) v_u_2
	v_u_2.signals.ReplicateEffect:FireServer(p18, p19)
end
function v_u_1.RankChangedUpdater(_)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	v_u_1:UpdateIconVisiblity()
	v_u_2:GetModule("PageAbout"):UpdateRankName()
	v_u_2:GetModule("GUIs"):DisplayPagesAccordingToRank(true)
	if v_u_2.initialized then
		v_u_2:GetModule("PageCommands"):CreateCommands()
	end
end
function v_u_1.UpdateIconVisiblity(_)
	-- upvalues: (copy) v_u_2
	local v20 = v_u_2.pdata.Rank >= v_u_2.settings.RankRequiredToViewIcon
	v_u_2:GetModule("TopbarIcon"):setEnabled(v20)
end
function v_u_1.DeactivateCommand(_, p21)
	-- upvalues: (copy) v_u_2
	v_u_2.commandsAllowedToUse[p21] = nil
	v_u_2.commandsActive[p21] = nil
	if not v_u_2.commandsToDisableCompletely[p21] then
		local v22 = v_u_2.gui:FindFirstChild("CommandMenu" .. p21)
		v_u_2:GetModule("cf"):DestroyCommandMenuFrame(v22)
	end
end
function v_u_1.EndCommand(_, p23)
	-- upvalues: (copy) v_u_2
	v_u_2.commandsActive[p23] = nil
	v_u_2:GetModule("cf"):UpdateCommandMenu(p23)
end
function v_u_1.ActivateClientCommand(_, p_u_24, p25)
	-- upvalues: (copy) v_u_2
	if v_u_2.commandsAllowedToUse[p_u_24] and not (v_u_2.commandsActive[p_u_24] or p25 and p25.DontForceActivate and v_u_2.gui:FindFirstChild("CommandMenu" .. p_u_24)) then
		v_u_2.commandsActive[p_u_24] = true
		spawn(function()
			-- upvalues: (ref) v_u_2, (copy) p_u_24
			v_u_2:GetModule("cf"):UpdateCommandMenu(p_u_24)
			local v26 = v_u_2:GetModule("ClientCommands")[p_u_24]
			local v27 = v26 and v26.Activate
			if v27 then
				v27(v26)
			end
			v_u_2.commandsActive[p_u_24] = nil
		end)
	end
end
function v_u_1.GetCF(_, p28, p29)
	local v30 = p28.CFrame
	local v31 = CFrame.new(v30.p)
	local v32, v33, v34 = (workspace.CurrentCamera.CFrame - workspace.CurrentCamera.CFrame.p):toEulerAnglesXYZ()
	local v35 = CFrame.Angles
	if p29 then
		v32 = v34 or v32
	end
	return v31 * v35(v32, v33, v34)
end
function v_u_1.GetNextMovement(_, p36, p37)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	local v38 = Vector3.new()
	local v39 = {
		["Left"] = Vector3.new(-1, 0, 0), 
		["Right"] = Vector3.new(1, 0, 0), 
		["Forwards"] = Vector3.new(0, 0, -1), 
		["Backwards"] = Vector3.new(0, 0, 1), 
		["Up"] = Vector3.new(0, 1, 0), 
		["Down"] = Vector3.new(0, -1, 0)
	}
	if v_u_2.device == "Computer" then
		for _, v40 in pairs(v_u_2.movementKeysPressed) do
			local v41 = v39[v40]
			if v41 then
				v38 = v38 + v41
			end
		end
	else
		local v42 = v_u_2:GetModule("cf"):GetHumanoid()
		local v43 = v_u_2:GetModule("cf"):GetHRP()
		if v42 then
			local v44 = v42.MoveDirection
			for v45, v46 in pairs(v39) do
				local _ = v45 == "Forwards" or v45 == "Backwards"
				if ((v_u_1:GetCF(v43, true) * CFrame.new(v46) - v43.CFrame.p).p - v44).magnitude <= 1.05 then
					if v44 ~= Vector3.new(0, 0, 0) then
						v38 = v38 + v46
					end
				end
			end
		end
	end
	return CFrame.new(v38 * p37 * p36), v38
end
function v_u_1.GetAssetImage(_, p47)
	return "https://www.roblox.com/asset-thumbnail/image?assetId=" .. p47 .. "&width=420&height=420&format=png"
end
function v_u_1.GetUserImage(_, p48)
	return "https://www.roblox.com/headshot-thumbnail/image?userId=" .. p48 .. "&width=420&height=420&format=png"
end
function v_u_1.ShowPermRankedUser(_, p49)
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_2
	local v50 = p49[1]
	local v51 = p49[2]
	local v52 = p49[3]
	v_u_4.PlrName.Text = v50
	v_u_4.PlrImage.Image = v_u_1:GetUserImage(v51)
	v_u_4.RankedBy.TextLabel.Text = v_u_2:GetModule("cf"):GetName(v52)
	v_u_2:GetModule("cf"):ShowWarning("PermRank")
end
function v_u_1.ShowBannedUser(_, p53)
	-- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_2
	local v54 = p53[1]
	local v55 = p53[2]
	local v56 = p53[3]
	local v57 = p53[4]
	local v58 = v_u_3.Reason.TextLabel
	v_u_3.PlrName.Text = v54
	v_u_3.PlrImage.Image = v_u_1:GetUserImage(v55)
	v_u_3.BannedBy.TextLabel.Text = v_u_2:GetModule("cf"):GetName(v57)
	v58.Text = "\'" .. v56 .. "\'"
	if v58.Text == "" or v58.Text == " " then
		v58.Text = "Empty"
		v58.Font = Enum.Font.SourceSansItalic
	else
		v58.Font = Enum.Font.SourceSans
	end
	v_u_2:GetModule("cf"):ShowWarning("UnBan")
end
function v_u_1.ShowWarning(_, p59)
	-- upvalues: (copy) v_u_2
	for _, v60 in pairs(v_u_2.warnings:GetChildren()) do
		if v60.Name == p59 then
			v60.Visible = true
			v_u_2.warnings.Visible = true
		else
			v60.Visible = false
		end
	end
end
function v_u_1.SetCameraSubject(_, p61)
	-- upvalues: (copy) v_u_2
	local v62 = v_u_2:GetModule("cf"):GetFace()
	if v62 then
		local v63 = v62.Transparency
		v_u_2.camera.CameraSubject = p61
		v62.Transparency = v63
	end
end
function v_u_1.DestroyCommandMenuFrame(_, p64)
	-- upvalues: (copy) v_u_2
	if p64 then
		for v65, v66 in pairs(v_u_2.commandMenus) do
			if v66 == p64 then
				table.remove(v_u_2.commandMenus, v65)
			end
		end
		p64:Destroy()
	end
end
function v_u_1.UpdateCommandMenu(_, p67, p68)
	-- upvalues: (copy) v_u_2
	if p68 == nil then
		p68 = v_u_2.gui:FindFirstChild("CommandMenu" .. p67)
	end
	if p68 then
		local v69 = p68.MainFrame
		if v69:FindFirstChild("Status") then
			if v_u_2.commandsToDisableCompletely[p67] and v_u_2.commandsAllowedToUse[p67] or v_u_2.commandsActive[p67] then
				v69.Status.TextLabel.Text = "On"
				v69.Status.TextLabel.TextColor3 = Color3.fromRGB(0, 225, 0)
				v69.ChangeStatus.TextLabel.Text = "DISABLE"
				return
			end
			v69.Status.TextLabel.Text = "Off"
			v69.Status.TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
			v69.ChangeStatus.TextLabel.Text = "ENABLE"
		end
	end
end
function v_u_1.CreateNewCommandMenu(_, p_u_70, p_u_71, p72, p73)
	-- upvalues: (copy) v_u_2, (ref) v_u_6, (copy) v_u_5, (copy) v_u_1, (copy) v_u_12, (copy) v_u_17
	local v74 = tonumber(p72)
	local v_u_75 = v_u_2:GetModule("cf"):FindValue({
		4, 
		5, 
		8, 
		11, 
		12
	}, v74)
	local v76 = v_u_2:GetModule("cf"):FindValue({ 4 }, v74)
	local v77 = v_u_2:GetModule("cf"):FindValue({
		5, 
		6, 
		7, 
		9, 
		12
	}, v74)
	local v78 = "CommandMenu" .. p_u_70
	if v76 then
		local v79 = v_u_6
		v78 = "CommandMenu" .. p_u_70 .. v79
		v_u_6 = v_u_6 + 1
	end
	local v80 = v_u_2.gui:FindFirstChild(v78)
	if v80 then
		if v77 then
			v80:Destroy()
			v80 = nil
		end
	end
	if not v80 then
		local v81 = v_u_5["Template" .. v74]
		local v82 = v81.MainFrame
		local v_u_83 = v81:Clone()
		v_u_83.Name = v78
		local v84 = v_u_83.DragBar
		local v_u_85 = v_u_83.MainFrame
		local v87 = string.upper(string.gsub(p_u_70, "%u", function(p86)
			return " " .. p86
		end))
		v84.Title.Text = v87
		v_u_2:GetModule("InputHandler"):MakeFrameDraggable(v_u_83)
		v84.Close.MouseButton1Down:Connect(function()
			-- upvalues: (copy) v_u_75, (ref) v_u_1, (ref) v_u_83
			if v_u_75 then
				v_u_1:DestroyCommandMenuFrame(v_u_83)
			else
				v_u_83.Visible = false
			end
		end)
		local v_u_88 = v_u_85.Position.Y.Scale
		local v_u_89 = -(1 - v84.Size.Y.Scale - v_u_88)
		local v_u_90 = v84:FindFirstChild("Minimise")
		if v_u_90 then
			v_u_90.MouseButton1Down:Connect(function()
				-- upvalues: (copy) v_u_90, (ref) v_u_2, (copy) v_u_85, (copy) v_u_89, (copy) v_u_88
				if v_u_90.TextLabel.Text == "-" then
					v_u_2.tweenService:Create(v_u_85, TweenInfo.new(0.5), {
						["Position"] = UDim2.new(0, 0, v_u_89, -1)
					}):Play()
					v_u_90.TextLabel.Text = "+"
				else
					v_u_2.tweenService:Create(v_u_85, TweenInfo.new(0.5), {
						["Position"] = UDim2.new(0, 0, v_u_88, 0)
					}):Play()
					v_u_90.TextLabel.Text = "-"
				end
			end)
		end
		local function v_u_100(p91, p92, p93)
			-- upvalues: (ref) v_u_2
			local v94 = p93[1]
			local v95 = p93[2]
			local v96 = p93[3]
			local v97 = p93[4]
			local v98 = p93[5]
			if not p91:FindFirstChild(p92) then
				p92 = v94[p91.Name]
			end
			if p91.Name == "AC Server" and p92 == "All" and v_u_2.pdata.Rank < v_u_2.commandRanks.globalvote then
				v_u_2:GetModule("Notices"):Notice("Error", v_u_2.hdAdminCoreName, "Must be \'" .. v_u_2:GetModule("cf"):GetRankName(v_u_2.commandRanks.globalvote) .. "\' to use ;globalVote")
			else
				for _, v99 in pairs(p91:GetChildren()) do
					if v99:IsA("TextButton") then
						v95(v99, p92, p91)
					end
				end
				if v97 and v98 then
					v96.CanvasSize = UDim2.new(0, 0, 0, v97.AbsolutePosition.Y - v98.AbsolutePosition.Y + v97.AbsoluteSize.Y)
				end
			end
		end
		local function v123(p101, p102, p103, p_u_104, p105, p106, p107)
			-- upvalues: (copy) v_u_100, (ref) v_u_2
			local v_u_108 = false
			p103.Focused:Connect(function()
				-- upvalues: (ref) v_u_108
				v_u_108 = true
			end)
			p103.FocusLost:Connect(function()
				-- upvalues: (ref) v_u_108
				wait()
				v_u_108 = false
			end)
			for v109, _ in pairs(p101) do
				local v_u_110 = p102[v109]
				for _, v_u_111 in pairs(v_u_110:GetChildren()) do
					if v_u_111:IsA("TextButton") then
						v_u_111.MouseButton1Down:Connect(function()
							-- upvalues: (ref) v_u_108, (ref) v_u_100, (copy) v_u_110, (copy) v_u_111, (copy) p_u_104
							if not v_u_108 then
								v_u_100(v_u_110, v_u_111.Name, p_u_104)
							end
						end)
					end
				end
				p105(v_u_110)
			end
			if p106 then
				for _, v_u_112 in pairs(p106:GetChildren()) do
					local v_u_113 = v_u_112:FindFirstChild("TextBox")
					if v_u_113 then
						local v_u_114 = v_u_113.Text
						v_u_113.Focused:Connect(function()
							-- upvalues: (ref) v_u_108
							v_u_108 = true
						end)
						v_u_113.FocusLost:connect(function(_)
							-- upvalues: (copy) v_u_113, (copy) v_u_112, (ref) v_u_114, (ref) v_u_108
							local v115 = tonumber(v_u_113.Text)
							if v115 then
								if v115 < 0 then
									v115 = 0
								elseif v_u_112.Name == "Minutes" and 60 < v115 then
									v115 = 60
								elseif v_u_112.Name == "Hours" and 24 < v115 then
									v115 = 24
								elseif v_u_112.Name == "Days" then
									v115 = 100000 < v115 and 100000 or v115
								end
								v_u_114 = v115
							end
							v_u_113.Text = v_u_114
							wait()
							v_u_108 = false
						end)
					end
				end
			end
			if not p107 then
				::l15::
				return
			end
			local v116 = string.lower(p107)
			local v117, v118
			if false then
				if not v122 then
					for _, v121 in pairs(v_u_2.players:GetChildren()) do
						v117 = string.lower(v121.Name)
						v118 = #v116
						if string.sub(v117, 1, v118) == v116 then
							v122 = v121.Name
							break
						end
					end
				end
				p103.Text = v122 or ""
				goto l15
			end
			for _, v122 in pairs(v_u_2.qualifiers) do
				if v122 == v116 then
					break
				end
				if false then
					if not v122 then
						for _, v121 in pairs(v_u_2.players:GetChildren()) do
							v117 = string.lower(v121.Name)
							v118 = #v116
							if string.sub(v117, 1, v118) == v116 then
								v122 = v121.Name
								break
							end
						end
					end
					p103.Text = v122 or ""
					goto l15
				end
			end
			local v122 = p107
			break
		end
		local function v136(p_u_124, p_u_125, p_u_126, p_u_127, p_u_128, p_u_129)
			-- upvalues: (ref) v_u_1
			local v_u_130 = p_u_124.FinalResult
			local v131 = v_u_130.Frame
			local _ = v131.Example
			local v_u_132 = v131.Loading
			local v_u_133 = v131.Broadcast
			v_u_130.Visible = false
			v131.CloseX.MouseButton1Down:Connect(function()
				-- upvalues: (copy) v_u_130
				v_u_130.Visible = false
			end)
			v_u_133.MouseButton1Down:Connect(function()
				-- upvalues: (copy) v_u_132, (copy) v_u_133, (copy) p_u_129, (ref) v_u_1, (copy) p_u_124
				v_u_132.Visible = true
				v_u_133.Visible = false
				p_u_129()
				v_u_1:DestroyCommandMenuFrame(p_u_124)
			end)
			p_u_125.MouseButton1Down:Connect(function()
				-- upvalues: (copy) p_u_126, (copy) p_u_125, (copy) p_u_127, (copy) p_u_128
				p_u_126.Visible = true
				p_u_125.Visible = false
				local v134 = p_u_127()
				if type(v134) == "table" then
					p_u_128(v134)
				else
					local v135 = tostring(v134) or "Error"
					p_u_126.TextLabel.Text = v135
					wait(1)
					p_u_126.TextLabel.Text = "Loading..."
				end
				p_u_126.Visible = false
				p_u_125.Visible = true
			end)
		end
		local function v_u_148(p_u_137, p_u_138)
			-- upvalues: (ref) v_u_1, (ref) v_u_2
			local v139 = p_u_137.AnswerTemplate
			v139.Visible = false
			p_u_137.Question.TextLabel.Text = p_u_138.Question
			for _, v140 in pairs(p_u_137:GetChildren()) do
				if v140:IsA("TextButton") and v140 ~= v139 then
					v140:Destroy()
				end
			end
			for v_u_141, v142 in pairs(p_u_138.Answers) do
				local v143 = v139:Clone()
				v143.Visible = true
				v143.Name = "Answer" .. v_u_141
				v143.TextLabel.Text = v_u_141 .. ". " .. v142
				v143.BackgroundColor3 = v_u_1:GetLabelBackgroundColor(v_u_141)
				local v_u_144 = v143.Fade
				if p_u_138.Remote then
					v143.MouseButton1Up:Connect(function()
						-- upvalues: (copy) p_u_137, (copy) p_u_138, (copy) v_u_141
						p_u_137.Parent.Parent.Visible = false
						pcall(function()
							-- upvalues: (ref) p_u_138, (ref) v_u_141
							p_u_138.Remote:FireServer(v_u_141)
						end)
					end)
				end
				v143.InputBegan:Connect(function(_)
					-- upvalues: (ref) v_u_2, (copy) v_u_144
					v_u_2.tweenService:Create(v_u_144, TweenInfo.new(0.2), {
						["BackgroundTransparency"] = 0.8
					}):Play()
				end)
				v143.InputEnded:Connect(function(_)
					-- upvalues: (ref) v_u_2, (copy) v_u_144
					v_u_2.tweenService:Create(v_u_144, TweenInfo.new(0.2), {
						["BackgroundTransparency"] = 1
					}):Play()
				end)
				v143.Parent = p_u_137
			end
			spawn(function()
				-- upvalues: (copy) p_u_137, (copy) p_u_138
				wait(0.1)
				local v145 = p_u_137
				local v146 = p_u_137["Answer" .. #p_u_138.Answers]
				local v147 = p_u_137.Question
				v145.CanvasSize = UDim2.new(0, 0, 0, v146.AbsolutePosition.Y - v147.AbsolutePosition.Y + v146.AbsoluteSize.Y)
			end)
		end
		if v74 == 1 then
			local v149 = UDim2.new(1, -255, 1, -155)
			if v_u_2.device ~= "Mobile" and v_u_83.Position ~= v149 then
				v_u_83.Position = v149
				v_u_83.Size = UDim2.new(0, 250, 0, 150)
			end
			local v_u_150 = v_u_85.InfoFrame
			v_u_150.Visible = false
			v_u_85.Desc.Visible = false
			v_u_85.InputFrame.Visible = false
			local v151 = p_u_71[1]
			if v151 == "Info" then
				v_u_85.Desc.Text = p_u_71[2]
				v_u_85.Desc.Visible = true
			elseif v151 == "Input" then
				local v152 = p_u_71[2]
				local v_u_153 = v_u_85.InputFrame.Frame.TextBox
				local v_u_154 = v_u_2.commandSpeeds[p_u_70]
				v_u_85.InputFrame.InputName.Text = v152 .. ":"
				v_u_153.Text = v_u_154
				if v_u_2.infoFramesViewed[v152] then
					v_u_2.infoFramesViewed[v152] = nil
					if v152 == "Speed" then
						local v155 = v_u_2.device == "Computer" and {
							{ "Movement", "WASD" }, 
							{ "Toggle flight", "E" }, 
							{ "Up & Down", "R & F" }
						} or {
							{ "Movement", "Thumbstick" }, 
							{ "Toggle flight", "Double-jump" }
						}
						for v156 = 1, 3 do
							local v157 = v_u_150["Info" .. v156]
							local v158 = v155[v156]
							if v158 then
								v157.Text = v158[1] .. ":"
								v157.TextLabel.Text = v158[2]
								v157.Visible = true
							else
								v157.Visible = false
							end
						end
						v_u_150.Okay.MouseButton1Down:Connect(function()
							-- upvalues: (copy) v_u_150
							v_u_150.Visible = false
						end)
						v_u_150.Visible = true
					end
				end
				local v_u_159 = v_u_153.Text
				v_u_153.FocusLost:Connect(function()
					-- upvalues: (copy) v_u_153, (copy) v_u_154, (ref) v_u_2, (copy) p_u_70, (ref) v_u_159
					local v160 = tonumber(v_u_153.Text) or v_u_154
					v_u_153.Text = "..."
					if not v_u_2.signals.RequestCommand:InvokeServer(v_u_2.pdata.Prefix .. p_u_70 .. " me " .. v160) then
						v_u_153.Text = v_u_159
					end
					v_u_159 = v_u_153.Text
				end)
				v_u_85.InputFrame.Visible = true
			end
			v_u_1:UpdateCommandMenu(p_u_70, v_u_83)
			v_u_85.ChangeStatus.MouseButton1Down:Connect(function()
				-- upvalues: (copy) v_u_85, (ref) v_u_2, (copy) p_u_70, (ref) v_u_1, (ref) v_u_83
				v_u_85.Loading.Visible = true
				if v_u_2.commandsToDisableCompletely[p_u_70] then
					local v161
					if v_u_85.ChangeStatus.TextLabel.Text == "DISABLE" then
						v161 = "!Un" .. p_u_70
					else
						v161 = "!" .. p_u_70
					end
					v_u_2.signals.RequestCommand:InvokeServer(v161)
					wait(1)
				elseif v_u_2.commandsActive[p_u_70] then
					v_u_2.commandsActive[p_u_70] = nil
				else
					v_u_2:GetModule("cf"):ActivateClientCommand(p_u_70)
					wait(0.5)
				end
				v_u_1:UpdateCommandMenu(p_u_70, v_u_83)
				v_u_85.Loading.Visible = false
			end)
		elseif v74 == 2 then
			if p_u_70 == "cmdbar2" then
				v84.Title.Text = "CMDBAR2"
			end
			if v_u_2.device ~= "Mobile" then
				v_u_83.Position = UDim2.new(0, 5, 1, -75)
				v_u_83.Size = UDim2.new(0, 315, 0, 70)
			end
			local v162 = v_u_85.SearchFrame
			local v_u_163 = v162.TextBox
			local v164 = {
				["maxSuggestions"] = 3, 
				["mainParent"] = v_u_85.Parent, 
				["textBox"] = v_u_163, 
				["rframe"] = v162.ResultsFrame, 
				["suggestionPos"] = 1, 
				["suggestionDisplayed"] = 0, 
				["forceExecute"] = false, 
				["highlightColor"] = Color3.fromRGB(50, 50, 50), 
				["otherColor"] = Color3.fromRGB(80, 80, 80), 
				["suggestionLabels"] = {}, 
				["currentBarCommand"] = nil
			}
			v_u_2:GetModule("CmdBar"):SetupTextbox(p_u_70, v164)
			local v_u_165 = v_u_85.Loading
			v_u_85.Execute.MouseButton1Down:Connect(function()
				-- upvalues: (copy) v_u_165, (copy) v_u_163, (ref) v_u_2
				v_u_165.Visible = true
				if 1 < #v_u_163.Text then
					local v166 = v_u_163.Text
					local v167 = string.sub(v166, 1, 1)
					if v167 ~= v_u_2.settings.UniversalPrefix then
						if v167 ~= v_u_2.pdata.Prefix then
							v166 = v_u_2.pdata.Prefix .. v166
						end
					end
					if string.sub(v166, -1) == " " then
						v166 = string.sub(v166, 1, -1)
					end
					v_u_2.signals.RequestCommand:InvokeServer(v166)
				end
				v_u_165.Visible = false
			end)
		elseif v74 == 3 then
			if p_u_70 == "cmdbar2" then
				v84.Title.Text = "CMDBAR2"
			end
			if v_u_2.device ~= "Mobile" then
				v_u_83.Position = UDim2.new(0, 5, 1, -110)
				v_u_83.Size = UDim2.new(0, 315, 0, 105)
			end
			local v168 = v_u_85.PlayerFrame.SearchFrame
			local v_u_169 = v168.TextBox
			v_u_169.Text = v_u_2.player.Name
			local v170 = {
				["maxSuggestions"] = 3, 
				["mainParent"] = v_u_85.Parent, 
				["textBox"] = v_u_169, 
				["rframe"] = v168.ResultsFrame, 
				["suggestionPos"] = 1, 
				["suggestionDisplayed"] = 0, 
				["forceExecute"] = false, 
				["highlightColor"] = Color3.fromRGB(50, 50, 50), 
				["otherColor"] = Color3.fromRGB(80, 80, 80), 
				["suggestionLabels"] = {}, 
				["currentBarCommand"] = nil, 
				["specificArg"] = "player"
			}
			v_u_2:GetModule("CmdBar"):SetupTextbox(p_u_70, v170)
			local v_u_171 = v_u_85.MessageFrame.SearchFrame.TextBox
			v_u_171.FocusLost:connect(function(p172)
				-- upvalues: (copy) v_u_169, (ref) v_u_2, (copy) v_u_171
				if p172 then
					local v173 = v_u_169.Text
					if string.sub(v173, -1) == " " then
						v173 = string.sub(v173, 1, -1)
					end
					local v174 = v_u_2.pdata.Prefix
					local v175 = v_u_2.pdata.SplitKey
					local v176 = v_u_2.pdata.SplitKey
					local v177 = v_u_171.Text
					local v178 = v174 .. "talk" .. v175 .. v173 .. v176 .. v177
					v_u_171.Text = ""
					v_u_2.signals.RequestCommand:InvokeServer(v178)
				end
			end)
		elseif v74 == 4 then
			local v_u_179 = p_u_71[1]
			local v180 = p_u_71[2]
			local v_u_181 = v_u_85.ReplyFrame.TextBox
			local v_u_182 = v_u_85.Send
			v84.Title.Text = "Message from " .. v_u_179.Name
			v_u_85.MessageFrame.Message.Text = v180
			v_u_181.Changed:connect(function(p183)
				-- upvalues: (copy) v_u_181, (copy) v_u_182
				if p183 == "Text" then
					if 0 < #v_u_181.Text then
						v_u_182.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						v_u_182.AutoButtonColor = true
						return
					end
					v_u_182.TextLabel.TextColor3 = Color3.fromRGB(125, 125, 125)
					v_u_182.AutoButtonColor = false
				end
			end)
			v_u_182.MouseButton1Down:Connect(function()
				-- upvalues: (copy) v_u_182, (ref) v_u_1, (ref) v_u_83, (ref) v_u_2, (copy) v_u_179, (copy) v_u_181
				if v_u_182.AutoButtonColor then
					v_u_1:DestroyCommandMenuFrame(v_u_83)
					v_u_2.signals.ReplyToPrivateMessage:InvokeServer({ v_u_179, v_u_181.Text })
				end
			end)
		elseif v74 == 5 then
			local v184 = v82.ScrollFrame.AbsoluteSize.Y / 11
			local v_u_185 = math.ceil(v184)
			local v_u_186 = v82.ScrollFrame.Template
			local v_u_187 = v_u_185 / 3
			local v_u_188 = v_u_85.ScrollFrame
			local v_u_189 = v_u_85.LoadMore
			local v_u_190 = v_u_189.Displaying
			local v_u_191 = v_u_189.Load
			v_u_188.Template:Destroy()
			v_u_83.Parent = v_u_2.gui
			local v_u_192 = {}
			local v_u_193 = 0
			local v_u_194 = 0
			local function v_u_204(p195, p196)
				-- upvalues: (ref) v_u_193, (ref) v_u_192, (ref) v_u_2, (copy) v_u_185, (ref) v_u_194, (copy) v_u_188, (copy) v_u_190, (copy) v_u_189
				local v197 = p195 + p196 - 1
				local v198 = #v_u_192
				v_u_193 = math.min(v197, v198)
				for v199 = p195, v_u_193 do
					local v200 = v_u_192[v199]
					local v201 = v200.TextLabel
					local v202 = v_u_2.textService:GetTextSize(v201.Text, tonumber(v201.TextSize), v201.Font, Vector2.new(math.huge, v_u_185)).X
					if v_u_194 < v202 then
						v_u_194 = v202
					end
					v200.Parent = v_u_188
				end
				v_u_190.Text = ("%d/%d"):format(v_u_193, #v_u_192)
				local v203 = v_u_193 < #v_u_192
				v_u_189.Visible = v203
				v_u_188.Size = v203 and UDim2.new(1, 0, 0.84, 0) or UDim2.new(1, 0, 0.92, 0)
				v_u_188.CanvasSize = UDim2.new(0, v_u_194, 0, v_u_193 * v_u_185)
			end
			v_u_191.MouseButton1Click:Connect(function()
				-- upvalues: (copy) v_u_204, (ref) v_u_193
				v_u_204(v_u_193 + 1, 20)
			end)
			local function v_u_206()
				-- upvalues: (ref) v_u_192, (copy) v_u_188, (copy) v_u_190, (ref) v_u_193, (ref) v_u_194, (copy) v_u_191
				v_u_192 = {}
				for _, v205 in pairs(v_u_188:GetChildren()) do
					if v205.Name ~= "UIListLayout" then
						v205:Destroy()
					end
				end
				v_u_190.Text = "0/0"
				v_u_193 = 0
				v_u_194 = 0
				v_u_191.Visible = true
			end
			local function v_u_218(p207)
				-- upvalues: (copy) v_u_206, (copy) v_u_186, (ref) v_u_1, (copy) v_u_185, (copy) v_u_187, (ref) v_u_192, (copy) v_u_204
				v_u_206()
				for v208, v209 in pairs(p207) do
					local v210 = v_u_186:Clone()
					local v211 = v210.TextLabel
					local v212 = v209.message
					local v213 = v209.timeAdded
					local v214 = os.date("*t", v213)
					local v215 = v209.speakerName
					local v216 = v214.hour
					local v217 = v214.min
					if v216 < 10 then
						v216 = "0" .. v216
					end
					if v217 < 10 then
						v217 = "0" .. v217
					end
					v211.Text = "[" .. v216 .. ":" .. v217 .. "] " .. v215 .. ": " .. v212
					v210.BackgroundColor3 = v_u_1:GetLabelBackgroundColor(v208)
					v210.Visible = true
					v210.Name = "Record" .. v208
					v210.Size = UDim2.new(1, 0, 0, v_u_185)
					v211.Position = UDim2.new(0, v_u_187, 0.15, 0)
					v211.Size = UDim2.new(1, -v_u_187 * 2, 0.7, 0)
					v_u_192[#v_u_192 + 1] = v210
				end
				v_u_204(1, 20)
			end
			v_u_218(p_u_71)
			local v_u_219 = true
			local v_u_220 = v_u_85.SearchBar.Frame.TextBox
			v_u_220.FocusLost:connect(function(_)
				-- upvalues: (ref) v_u_219, (copy) v_u_220, (copy) p_u_71, (copy) v_u_218, (ref) v_u_12, (copy) v_u_188, (ref) v_u_17, (ref) v_u_2
				if v_u_219 then
					v_u_219 = false
					local v221 = string.lower(v_u_220.Text)
					local v222 = {}
					for _, v223 in pairs(p_u_71) do
						local v224 = string.lower
						local v225 = v223.message
						local v226 = v223.timeAdded
						local v227 = os.date("*t", v226)
						local v228 = v223.speakerName
						local v229 = v227.hour
						local v230 = v227.min
						if v229 < 10 then
							v229 = "0" .. v229
						end
						if v230 < 10 then
							v230 = "0" .. v230
						end
						local v231 = v224("[" .. v229 .. ":" .. v230 .. "] " .. v228 .. ": " .. v225)
						if string.find(v231, v221, 1, true) then
							table.insert(v222, v223)
						end
					end
					v_u_218(v222)
					v_u_12(v_u_188)
					v_u_17(v_u_2.commandMenus, v_u_188)
					wait(0.5)
					v_u_219 = true
				end
			end)
		elseif v74 == 6 then
			local v_u_232 = v_u_85.ScrollFrame
			local v233 = {
				["AG Server"] = "Current", 
				["AJ Length"] = "Infinite"
			}
			local v_u_234 = {}
			local v235 = v_u_232["AC Target Player"].SearchFrame
			local v_u_236 = v235.TextBox
			local v237 = p_u_71.targetPlayer
			local v_u_238 = v_u_232["AJA Time"]
			local v_u_239 = v_u_232["AA Space"]
			local v_u_240 = v_u_232["AZ Space"]
			local v241 = v_u_232["AX Ban"]
			local v_u_242 = v_u_232["AM Reason"].SearchFrame.TextBox
			local v_u_246 = {
				v233, 
				function(p243, p244, p245)
					-- upvalues: (copy) v_u_234, (copy) v_u_238
					if p243.Name == p244 then
						p243.BackgroundTransparency = 0.1
						p243.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						v_u_234[p245.Name] = p244
						if p245.Name == "AJ Length" then
							if p243.Name == "Time" then
								v_u_238.Visible = true
							else
								v_u_238.Visible = false
							end
						end
					else
						p243.BackgroundTransparency = 0.8
						p243.TextLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
					end
				end, 
				v_u_232, 
				v_u_240, 
				v_u_239
			}
			v123(v233, v_u_232, v_u_236, v_u_246, function(p247)
				-- upvalues: (copy) v_u_100, (copy) p_u_71, (copy) v_u_246
				if p247.Name == "AG Server" then
					v_u_100(p247, p_u_71.server, v_u_246)
				elseif p247.Name == "AJ Length" then
					v_u_100(p247, p_u_71.length, v_u_246)
				end
			end, v_u_238, v237)
			local v248 = {
				["maxSuggestions"] = 3, 
				["mainParent"] = v_u_85.Parent, 
				["textBox"] = v_u_236, 
				["rframe"] = v235.ResultsFrame, 
				["suggestionPos"] = 1, 
				["suggestionDisplayed"] = 0, 
				["forceExecute"] = false, 
				["highlightColor"] = Color3.fromRGB(50, 50, 50), 
				["otherColor"] = Color3.fromRGB(80, 80, 80), 
				["suggestionLabels"] = {}, 
				["currentBarCommand"] = nil, 
				["specificArg"] = "player"
			}
			v_u_2:GetModule("CmdBar"):SetupTextbox(p_u_70, v248)
			local v249 = p_u_71.timeDetails
			if v249 then
				v249:gsub("%d+%a", function(p250)
					-- upvalues: (ref) v_u_2, (copy) v_u_238
					local v251 = tonumber(p250:match("%d+"))
					if v251 then
						local v252 = p250:match("%a")
						local _, v253, v254 = v_u_2:GetModule("cf"):GetTimeAmount(v252, v251)
						v_u_238[v253].TextBox.Text = v254
					end
				end)
			end
			local v255 = p_u_71.reason
			if v255 and v255 ~= "" and v255 ~= " " then
				v_u_242.Text = v255
			end
			v241.MouseButton1Down:Connect(function()
				-- upvalues: (copy) v_u_242, (copy) v_u_236, (copy) v_u_238, (copy) v_u_234, (ref) v_u_1, (ref) v_u_83, (ref) v_u_2
				local v256 = v_u_242.Text
				local v257 = v_u_236.Text
				local v258 = v_u_238.Minutes.TextBox.Text
				local v259 = v_u_238.Hours.TextBox.Text
				local v260 = v_u_238.Days.TextBox.Text
				local v261 = {
					["server"] = v_u_234["AG Server"], 
					["length"] = v_u_234["AJ Length"], 
					["lengthTime"] = v258 .. "m" .. v259 .. "h" .. v260 .. "d"
				}
				v_u_1:DestroyCommandMenuFrame(v_u_83)
				local v262 = v_u_2.signals.RequestCommand
				local v263 = v_u_2.pdata.Prefix
				local v264 = v_u_2.pdata.SplitKey
				local v265 = v_u_2.pdata.SplitKey
				v262:InvokeServer(v263 .. "directBan" .. v264 .. v257 .. v265 .. v256, v261)
			end)
			spawn(function()
				-- upvalues: (copy) v_u_232, (copy) v_u_240, (copy) v_u_239
				wait(0.1)
				local v266 = v_u_240
				local v267 = v_u_239
				v_u_232.CanvasSize = UDim2.new(0, 0, 0, v266.AbsolutePosition.Y - v267.AbsolutePosition.Y + v266.AbsoluteSize.Y)
			end)
		elseif v74 == 7 then
			local v268 = v_u_85.ScrollFrame
			local v269 = {
				["AG DisplayFrom"] = "Enabled"
			}
			local v_u_270 = {}
			local v271 = v268["AJ MessageColor"].SearchFrame
			local v_u_272 = v271.TextBox
			local v273 = v268["AX Submit"]
			local v274 = v268["AZ Loading"]
			local v275 = v268["AF Title"]
			local v_u_276 = v268["AC MessageTitle"].SearchFrame.TextBox
			local v_u_277 = v268["AM Message"].SearchFrame.TextBox
			local v_u_281 = { v269, function(p278, p279, p280)
					-- upvalues: (copy) v_u_270
					if p278.Name == p279 then
						p278.BackgroundTransparency = 0.1
						p278.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						v_u_270[p280.Name] = p279
					else
						p278.BackgroundTransparency = 0.8
						p278.TextLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
					end
				end, v268 }
			v275.TextLabel.Text = "Display \'From " .. v_u_2.player.Name .. "\'"
			v123(v269, v268, v_u_272, v_u_281, function(p282)
				-- upvalues: (copy) v_u_100, (copy) v_u_281
				if p282.Name == "AG DisplayFrom" then
					v_u_100(p282, "Enabled", v_u_281)
				end
			end)
			local v283 = {
				["maxSuggestions"] = 3, 
				["mainParent"] = v_u_85.Parent, 
				["textBox"] = v_u_272, 
				["rframe"] = v271.ResultsFrame, 
				["suggestionPos"] = 1, 
				["suggestionDisplayed"] = 0, 
				["forceExecute"] = false, 
				["highlightColor"] = Color3.fromRGB(50, 50, 50), 
				["otherColor"] = Color3.fromRGB(80, 80, 80), 
				["suggestionLabels"] = {}, 
				["currentBarCommand"] = nil, 
				["specificArg"] = "color"
			}
			v_u_2:GetModule("CmdBar"):SetupTextbox(p_u_70, v283)
			local v_u_284 = v_u_83.FinalResult
			local v_u_285 = v_u_284.Frame.Example
			v136(v_u_83, v273, v274, function()
				-- upvalues: (copy) v_u_270, (ref) v_u_2, (copy) v_u_276, (copy) v_u_272, (copy) v_u_277
				local v286 = v_u_270["AG DisplayFrom"] == "Enabled"
				return v_u_2.signals.RetrieveBroadcastData:InvokeServer({
					["Title"] = v_u_276.Text, 
					["DisplayFrom"] = v286, 
					["Color"] = v_u_272.Text, 
					["Message"] = v_u_277.Text
				})
			end, function(p287)
				-- upvalues: (copy) v_u_285, (ref) v_u_1, (copy) v_u_284
				v_u_285.Title.Text = p287.Title
				local v288 = p287.DisplayFrom
				v_u_285.Pic.Visible = v288
				v_u_285.SubTitle.Visible = v288
				if v288 then
					v_u_285.Pic.Image = v_u_1:GetUserImage(p287.SenderId)
					v_u_285.SubTitle.Text = "From " .. p287.SenderName
				end
				v_u_285.Desc.TextColor3 = Color3.new(p287.Color[1], p287.Color[2], p287.Color[3])
				v_u_285.Desc.Text = p287.Message
				v_u_284.Visible = true
			end, function()
				-- upvalues: (ref) v_u_2
				v_u_2.signals.ExecuteBroadcast:InvokeServer()
			end)
		elseif v74 == 8 then
			local v289 = p_u_71[1]
			local v290 = p_u_71[2]
			local v291 = p_u_71[3] or {}
			local v292 = v84.Mute
			local v_u_293 = v292.TextLabel
			local v_u_294 = Instance.new("Sound")
			v_u_294.SoundId = "rbxassetid://" .. v_u_2.pdata.AlertSoundId
			v_u_294.Volume = v_u_2.pdata.AlertVolume
			v_u_294.Pitch = v_u_2.pdata.AlertPitch
			v_u_294.Looped = true
			v_u_294.Parent = v_u_83
			v_u_294:Play()
			v84.Title.Text = v289
			v_u_85.MessageFrame.Message.Text = v290
			v292.MouseButton1Down:Connect(function()
				-- upvalues: (copy) v_u_293, (copy) v_u_294
				if v_u_293.Text == "\240\159\148\138" then
					v_u_293.Text = "\240\159\148\135"
					v_u_294:Pause()
				else
					v_u_293.Text = "\240\159\148\138"
					v_u_294:Play()
				end
			end)
			print(("Alert \'%s\' with message \'%s\' was broadcasted by \'%s\' (@%s, %s) who is rank \'%s\' in game %s"):format(v289, v290, tostring(v291[1]), tostring(v291[2]), tostring(v291[3]), tostring(v291[4]), game.PlaceId))
		elseif v74 == 9 then
			local v_u_295 = v_u_85.ScrollFrame
			local v_u_296 = {
				["AC Server"] = "Current", 
				["AG ShowResultsTo"] = "You"
			}
			local v_u_297 = {}
			local v_u_298 = v_u_295["AD Target Player"]
			local v299 = v_u_298.SearchFrame
			local v_u_300 = v299.TextBox
			local v301 = p_u_71.targetPlayer
			local v_u_302 = v_u_295["AA Space"]
			local v_u_303 = v_u_295["AZ Space"]
			local v304 = v_u_295["AZ Loading"]
			local v305 = v_u_295["AX Submit"]
			local v_u_306 = v_u_295["AP Question"].SearchFrame.TextBox
			local v_u_311 = {
				v_u_296, 
				function(p307, p308, p309)
					-- upvalues: (copy) v_u_297, (copy) v_u_298
					local v310 = p309.Name
					if p307.Name == p308 then
						p307.BackgroundTransparency = 0.1
						p307.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						v_u_297[p309.Name] = p308
						if v310 == "AC Server" then
							if p307.Name == "Current" then
								v_u_298.Visible = true
							else
								v_u_298.Visible = false
							end
						end
					else
						p307.BackgroundTransparency = 0.8
						p307.TextLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
					end
				end, 
				v_u_295, 
				v_u_303, 
				v_u_302
			}
			v123(v_u_296, v_u_295, v_u_300, v_u_311, function(p312)
				-- upvalues: (copy) v_u_100, (copy) p_u_71, (copy) v_u_311, (copy) v_u_296
				if p312.Name == "AC Server" then
					v_u_100(p312, p_u_71.server, v_u_311)
				elseif v_u_296[p312.Name] then
					v_u_100(p312, v_u_296[p312.Name], v_u_311)
				end
			end, nil, v301)
			local v313 = {
				["maxSuggestions"] = 3, 
				["mainParent"] = v_u_85.Parent, 
				["textBox"] = v_u_300, 
				["rframe"] = v299.ResultsFrame, 
				["suggestionPos"] = 1, 
				["suggestionDisplayed"] = 0, 
				["forceExecute"] = false, 
				["highlightColor"] = Color3.fromRGB(50, 50, 50), 
				["otherColor"] = Color3.fromRGB(80, 80, 80), 
				["suggestionLabels"] = {}, 
				["currentBarCommand"] = nil, 
				["specificArg"] = "player"
			}
			v_u_2:GetModule("CmdBar"):SetupTextbox(p_u_70, v313)
			local v314 = p_u_71.question
			if v314 and v314 ~= "" and v314 ~= " " then
				v_u_306.Text = v314
			end
			local v_u_315 = v_u_295["AS Answer"]
			local v316 = v_u_295["AT AddAnswer"]
			local v_u_317 = {}
			v_u_315.Visible = false
			local function v_u_323(p318)
				-- upvalues: (copy) v_u_317, (copy) v_u_295, (copy) v_u_303, (copy) v_u_302
				for v319, v320 in pairs(v_u_317) do
					if v320 == p318 then
						table.remove(v_u_317, v319)
						break
					end
				end
				p318:Destroy()
				local v321 = v_u_303
				local v322 = v_u_302
				v_u_295.CanvasSize = UDim2.new(0, 0, 0, v321.AbsolutePosition.Y - v322.AbsolutePosition.Y + v321.AbsoluteSize.Y)
			end
			local function v_u_328()
				-- upvalues: (copy) v_u_315, (copy) v_u_295, (copy) v_u_323, (copy) v_u_317, (copy) v_u_303, (copy) v_u_302
				local v_u_324 = v_u_315:Clone()
				v_u_324.Visible = true
				v_u_324.Parent = v_u_295
				v_u_324.RemoveBox.MouseButton1Down:Connect(function()
					-- upvalues: (ref) v_u_323, (copy) v_u_324
					v_u_323(v_u_324)
				end)
				local v325 = v_u_317
				table.insert(v325, v_u_324)
				local v326 = v_u_303
				local v327 = v_u_302
				v_u_295.CanvasSize = UDim2.new(0, 0, 0, v326.AbsolutePosition.Y - v327.AbsolutePosition.Y + v326.AbsoluteSize.Y)
				return v_u_324
			end
			local v329 = p_u_71.answers
			if type(v329) == "table" then
				for _, v330 in pairs(v329) do
					if v330 and v330 ~= "" and v330 ~= " " then
						v_u_328().SearchFrame.TextBox.Text = v330
						if 10 <= #v_u_317 then
							break
						end
					end
				end
			end
			v316.Add.MouseButton1Down:Connect(function()
				-- upvalues: (copy) v_u_317, (ref) v_u_2, (copy) v_u_328, (copy) v_u_295
				if 10 <= #v_u_317 then
					v_u_2:GetModule("Notices"):Notice("Error", v_u_2.hdAdminCoreName, "Cannot exceed " .. 10 .. " answers!")
				else
					local v331 = v_u_328()
					v_u_295.CanvasPosition = Vector2.new(0, v_u_295.CanvasPosition.Y + v331.AbsoluteSize.Y)
				end
			end)
			local v_u_332 = v_u_295["AC VoteTime"].SearchFrame.TextBox
			local v_u_333 = v_u_332.Text
			v_u_332.FocusLost:connect(function(_)
				-- upvalues: (copy) v_u_332, (ref) v_u_333
				local v334 = tonumber(v_u_332.Text)
				local v335
				if v334 then
					v335 = v334 < 1 and 1 or 60 < v334 and 60 or v334
				else
					v335 = v_u_333
				end
				v_u_332.Text = v335
				v_u_333 = v335
			end)
			spawn(function()
				-- upvalues: (copy) v_u_295, (copy) v_u_303, (copy) v_u_302
				wait(0.1)
				local v336 = v_u_303
				local v337 = v_u_302
				v_u_295.CanvasSize = UDim2.new(0, 0, 0, v336.AbsolutePosition.Y - v337.AbsolutePosition.Y + v336.AbsoluteSize.Y)
			end)
			local v_u_338 = v_u_83.FinalResult
			local v_u_339 = v_u_338.Frame.Example
			v136(v_u_83, v305, v304, function()
				-- upvalues: (copy) v_u_332, (copy) v_u_306, (copy) v_u_297, (copy) v_u_300, (copy) v_u_317, (ref) v_u_2
				local v340 = v_u_332.Text
				local v341 = v_u_306.Text
				local v342 = v_u_297["AC Server"]
				local v343 = v_u_297["AG ShowResultsTo"]
				local v344 = v_u_300.Text:gsub(" ", function(_)
					return ""
				end)
				local v345 = {}
				for _, v346 in pairs(v_u_317) do
					local v347 = v346.SearchFrame.TextBox.Text
					table.insert(v345, v347)
				end
				return v_u_2.signals.RetrievePollData:InvokeServer({
					["VoteTime"] = v340, 
					["Question"] = v341, 
					["Answers"] = v345, 
					["Server"] = v342, 
					["ShowResultsTo"] = v343, 
					["PlayerArg"] = v344
				})
			end, function(p348)
				-- upvalues: (copy) v_u_148, (copy) v_u_339, (copy) v_u_338
				v_u_148(v_u_339, p348)
				v_u_338.Visible = true
			end, function()
				-- upvalues: (ref) v_u_2
				v_u_2.signals.ExecutePoll:InvokeServer()
			end)
		elseif v74 == 10 then
			v_u_2.audio.Notice:Play()
			local v349 = v_u_85.ScrollFrame
			local v350 = v349.Question.TextLabel
			local v_u_351 = v84.Title
			local v_u_352 = p_u_71.VoteTime
			local v_u_353 = v_u_352 + 1
			v_u_148(v349, p_u_71)
			v350.Text = p_u_71.Question
			coroutine.wrap(function()
				-- upvalues: (copy) v_u_352, (copy) v_u_351, (copy) p_u_71, (copy) v_u_353, (ref) v_u_1, (ref) v_u_83
				for v354 = 1, v_u_352 do
					local v355 = v_u_351
					local v356 = string.upper(p_u_71.SenderName)
					local v357 = v_u_353 - v354
					v355.Text = v356 .. "\'S POLL (" .. v357 .. ")"
					wait(1)
				end
				v_u_1:DestroyCommandMenuFrame(v_u_83)
			end)()
		elseif v74 == 11 then
			v_u_2.audio.Notice:Play()
			local v358 = v_u_2:GetModule("cf"):RandomiseTable({
				Color3.fromRGB(220, 30, 30), 
				Color3.fromRGB(220, 93, 29), 
				Color3.fromRGB(188, 161, 23), 
				Color3.fromRGB(107, 186, 22), 
				Color3.fromRGB(19, 179, 46), 
				Color3.fromRGB(20, 197, 197), 
				Color3.fromRGB(24, 120, 255), 
				Color3.fromRGB(101, 24, 255), 
				Color3.fromRGB(217, 24, 255), 
				Color3.fromRGB(255, 24, 128)
			})
			local v_u_359 = v_u_85.ScrollFrame
			local v360 = v_u_359.Question.TextLabel
			local _ = v84.Title
			v360.Text = p_u_71.Question
			local v361 = v_u_359.ResultTemplate
			v361.Visible = false
			local v362 = #p_u_71.Results
			for v363, v_u_364 in pairs(p_u_71.Results) do
				local v_u_365 = v361:Clone()
				v_u_365.Visible = true
				v_u_365.Name = "Answer" .. v363
				v_u_365.Bar.BackgroundColor3 = v358[v363]
				local v366 = v_u_364.Answer
				local v_u_367 = v363 .. ". " .. v366 .. " ("
				if v363 == v362 then
					v_u_367 = v_u_364.Answer .. " ("
					v_u_365.Bar.BackgroundColor3 = Color3.fromRGB(175, 175, 175)
				end
				v_u_365.TextLabel.Text = v_u_367 .. "0)"
				v_u_365.BackgroundColor3 = v_u_1:GetLabelBackgroundColor(v363)
				v_u_365.Bar.Size = UDim2.new(0, 0, 1, 0)
				delay((v363 - 1) / 10, function()
					-- upvalues: (ref) v_u_2, (copy) v_u_365, (copy) v_u_364, (ref) v_u_367
					local v368 = TweenInfo.new(2, Enum.EasingStyle.Quart)
					local v369 = Instance.new("IntValue")
					v369.Value = 0
					v_u_2.tweenService:Create(v_u_365.Bar, v368, {
						["Size"] = UDim2.new(v_u_364.Percentage, 0, 1, 0)
					}):Play()
					v_u_2.tweenService:Create(v369, v368, {
						["Value"] = v_u_364.Votes
					}):Play()
					v369.Changed:Connect(function(p370)
						-- upvalues: (ref) v_u_365, (ref) v_u_367
						v_u_365.TextLabel.Text = v_u_367 .. p370 .. ")"
					end)
					wait(2)
					v369:Destroy()
				end)
				v_u_365.Parent = v_u_359
			end
			spawn(function()
				-- upvalues: (copy) v_u_359, (copy) p_u_71
				wait(0.1)
				local v371 = v_u_359
				local v372 = v_u_359["Answer" .. #p_u_71.Answers]
				local v373 = v_u_359.Question
				v371.CanvasSize = UDim2.new(0, 0, 0, v372.AbsolutePosition.Y - v373.AbsolutePosition.Y + v372.AbsoluteSize.Y)
			end)
		elseif v74 == 12 then
			local v374 = v_u_85.ScrollFrame
			local v_u_375 = {
				["AC Server"] = "Current"
			}
			local v_u_376 = {}
			local v_u_377 = v374["AD Target Player"]
			local v378 = v_u_377.SearchFrame
			local v_u_379 = v378.TextBox
			local v380 = p_u_71.targetPlayer
			local v381 = v374["AA Space"]
			local v382 = v374["AZ Space"]
			local v_u_383 = v374["AX Space"]
			local v384 = v374["AZ Loading"]
			local v385 = v374["AX Submit"]
			local v_u_386 = v374["AG MessageTitle"].SearchFrame.TextBox
			local v_u_387 = v374["AM Message"].SearchFrame.TextBox
			local v_u_392 = {
				v_u_375, 
				function(p388, p389, p390)
					-- upvalues: (copy) v_u_376, (copy) v_u_377, (copy) v_u_383
					local v391 = p390.Name
					if p388.Name == p389 then
						p388.BackgroundTransparency = 0.1
						p388.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						v_u_376[p390.Name] = p389
						if v391 == "AC Server" then
							if p388.Name == "Current" then
								v_u_377.Visible = true
								v_u_383.Visible = false
							else
								v_u_377.Visible = false
								v_u_383.Visible = true
							end
						end
					else
						p388.BackgroundTransparency = 0.8
						p388.TextLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
					end
				end, 
				v374, 
				v382, 
				v381
			}
			v123(v_u_375, v374, v_u_379, v_u_392, function(p393)
				-- upvalues: (copy) v_u_100, (copy) p_u_71, (copy) v_u_392, (copy) v_u_375
				if p393.Name == "AC Server" then
					v_u_100(p393, p_u_71.server, v_u_392)
				elseif v_u_375[p393.Name] then
					v_u_100(p393, v_u_375[p393.Name], v_u_392)
				end
			end, nil, v380)
			local v394 = {
				["maxSuggestions"] = 3, 
				["mainParent"] = v_u_85.Parent, 
				["textBox"] = v_u_379, 
				["rframe"] = v378.ResultsFrame, 
				["suggestionPos"] = 1, 
				["suggestionDisplayed"] = 0, 
				["forceExecute"] = false, 
				["highlightColor"] = Color3.fromRGB(50, 50, 50), 
				["otherColor"] = Color3.fromRGB(80, 80, 80), 
				["suggestionLabels"] = {}, 
				["currentBarCommand"] = nil, 
				["specificArg"] = "player"
			}
			v_u_2:GetModule("CmdBar"):SetupTextbox(p_u_70, v394)
			local v395 = p_u_71.message
			if v395 and v395 ~= "" and v395 ~= " " then
				v_u_387.Text = v395
			end
			v_u_386.Text = "Alert from " .. v_u_2.player.Name
			local v_u_396 = v_u_83.FinalResult
			local v_u_397 = v_u_396.Frame.Example
			v136(v_u_83, v385, v384, function()
				-- upvalues: (copy) v_u_386, (copy) v_u_387, (copy) v_u_376, (copy) v_u_379, (ref) v_u_2
				local v398 = {
					["Title"] = v_u_386.Text, 
					["Message"] = v_u_387.Text, 
					["Server"] = v_u_376["AC Server"], 
					["PlayerArg"] = v_u_379.Text:gsub(" ", function(_)
						return ""
					end)
				}
				return v_u_2.signals.RetrieveAlertData:InvokeServer(v398)
			end, function(p399)
				-- upvalues: (copy) v_u_397, (copy) v_u_396
				v_u_397.Title.Text = p399.Title
				v_u_397.Message.Text = p399.Message
				v_u_396.Visible = true
			end, function()
				-- upvalues: (ref) v_u_2
				v_u_2.signals.ExecuteAlert:InvokeServer()
			end)
		end
		v_u_12(v_u_83, p73)
		local v400 = v_u_2.commandMenus
		local v401 = v_u_83
		table.insert(v400, v401)
		v_u_17(v_u_2.commandMenus)
		v80 = v_u_83
	end
	v80.Parent = v_u_2.gui
	v80.Visible = true
end
function v_u_1.GetMousePoint(_, _)
	-- upvalues: (copy) v_u_2
	local v402 = v_u_2.camera:ScreenPointToRay(v_u_2.lastHitPosition.X, v_u_2.lastHitPosition.Y)
	local v403 = Ray.new(v402.Origin, v402.Direction * 100)
	local v404, v405 = workspace:FindPartOnRay(v403, v_u_2.player.Character)
	return v404, v405
end
function v_u_1.GetLabelBackgroundColor(_, p406)
	if p406 % 2 == 0 then
		return Color3.fromRGB(50, 50, 50)
	else
		return Color3.fromRGB(40, 40, 40)
	end
end
function v_u_1.GenerateTagFromId(_, p407)
	-- upvalues: (copy) v_u_2
	local v408 = v_u_2.alphabet
	local v409 = #v408
	local v410 = p407 / #v408
	local v411 = math.ceil(v410)
	local v412 = p407 / #v408 ^ 2
	local v413 = math.ceil(v412)
	local v414 = v408[p407 % v409] or v408[v409]
	local v415 = v408[v411 % v409] or v408[v409]
	return (v408[v413 % v409] or v408[v409]) .. v415 .. v414
end
function v_u_1.ClearPage(_, p416)
	for _, v417 in pairs(p416:GetChildren()) do
		if v417.Name == "UIListLayout" then
			::l4::
			if v417:IsA("Frame") then
				v417.Visible = false
			end
		else
			local v418 = v417.Name
			if string.sub(v418, 1, 8) == "Template" then
				goto l4
			end
			v417:Destroy()
		end
	end
end
function v_u_1.UpdateClientData(_)
	-- upvalues: (copy) v_u_2
	v_u_2.pdata = v_u_2.rfunction:InvokeServer("RetrievePlayerData")
end
return v_u_1
