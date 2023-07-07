-- decompiled by Sentinel (took 9.535783ms)
local v_u_1 = {}
local v_u_2 = _G.HDAdminMain
local v_u_3 = v_u_2.gui.CustomTopBar
local v_u_4 = { "Chat", "PlayerList" }
local v_u_5 = {}
local v_u_6 = v_u_2.gui.CmdBar
local v_u_7 = false
local v_u_8 = {}
local v_u_9 = 1
local v_u_10 = true
local v_u_11 = {
	["maxSuggestions"] = 5, 
	["mainParent"] = v_u_6, 
	["textBox"] = v_u_6.SearchFrame.TextBox, 
	["rframe"] = v_u_6.ResultsFrame, 
	["suggestionPos"] = 1, 
	["suggestionDisplayed"] = 0, 
	["forceExecute"] = false, 
	["highlightColor"] = Color3.fromRGB(50, 50, 50), 
	["otherColor"] = Color3.fromRGB(80, 80, 80), 
	["suggestionLabels"] = {}, 
	["currentBarCommand"] = nil
}
local function v_u_24(p_u_12)
	-- upvalues: (copy) v_u_2
	local v13 = ""
	local v_u_14 = p_u_12.suggestionLabels["Label" .. p_u_12.suggestionPos]
	if p_u_12.specificArg then
		local v15 = v_u_14.Name .. " "
		p_u_12.textBox.Text = v15
		coroutine.wrap(function()
			-- upvalues: (copy) p_u_12
			for _ = 1, 10 do
				p_u_12.textBox:ReleaseFocus()
				wait()
			end
		end)()
		wait()
		p_u_12.textBox.Text = v15
	else
		local v_u_16 = {}
		local v_u_17 = -1
		local v18 = p_u_12.textBox.Text
		local v19 = string.sub(v18, 1, 1)
		p_u_12.textBox.Text:gsub("([^" .. v_u_2.pdata.SplitKey .. "]+)", function(p20)
			-- upvalues: (ref) v_u_17, (copy) v_u_14, (copy) v_u_16
			v_u_17 = v_u_17 + 1
			if v_u_17 <= v_u_14.ArgPos - 1 then
				local v21 = v_u_16
				local v22 = p20 .. " "
				table.insert(v21, v22)
			end
		end)
		if v_u_17 == 0 then
			if v19 ~= v_u_2.settings.UniversalPrefix then
				if v19 ~= v_u_2.pdata.Prefix then
					v19 = v13
				end
			end
		else
			v19 = v13
		end
		local v23 = v19 .. table.concat(v_u_16, "") .. v_u_14.Name .. v_u_2.pdata.SplitKey
		p_u_12.textBox.Text = v23
		wait()
		p_u_12.textBox.Text = v23
		p_u_12.textBox:CaptureFocus()
		p_u_12.textBox.CursorPosition = #v23 + 1
	end
end
v_u_6.Visible = false
local function v_u_28(p_u_25)
	-- upvalues: (copy) v_u_24
	for v_u_26 = 1, p_u_25.maxSuggestions do
		local v27 = p_u_25.rframe.LabelTemplate:Clone()
		v27.Name = "Label" .. v_u_26
		v27.Visible = false
		v27.Parent = p_u_25.rframe
		v27.MouseEnter:Connect(function()
			-- upvalues: (copy) p_u_25, (copy) v_u_26
			p_u_25.suggestionPos = v_u_26
		end)
		v27.MouseButton1Up:Connect(function()
			-- upvalues: (copy) p_u_25, (copy) v_u_26, (ref) v_u_24
			p_u_25.suggestionPos = v_u_26
			v_u_24(p_u_25)
		end)
	end
end
function v_u_1.SetupTextbox(_, p29, p_u_30)
	-- upvalues: (copy) v_u_8, (copy) v_u_28, (copy) v_u_24, (copy) v_u_2, (copy) v_u_1
	local function v_u_37(p31, p32, p33, p34)
		-- upvalues: (copy) p_u_30
		local v35 = string.lower(p34)
		local v36 = #p32
		if string.sub(v35, 1, v36) == p32 then
			table.insert(p31, {
				["Name"] = p34, 
				["ArgPos"] = p33
			})
			if #p31 == p_u_30.maxSuggestions then
				return true
			end
		end
	end
	local v_u_38 = p_u_30.specificArg
	v_u_8[p29] = p_u_30
	v_u_28(p_u_30)
	p_u_30.textBox.FocusLost:connect(function(p39)
		-- upvalues: (copy) p_u_30, (ref) v_u_24, (ref) v_u_2, (ref) v_u_1
		if p_u_30.mainParent.Name == "CmdBar" and not p_u_30.specificArg then
			if 0 < p_u_30.suggestionDisplayed and not forceExecute and v_u_2.device ~= "Mobile" then
				v_u_24(p_u_30)
				return
			end
			if p39 then
				if forceExecute then
					v_u_24(p_u_30)
				end
				v_u_1:CloseCmdBar()
				if 1 < #p_u_30.textBox.Text then
					local v40 = p_u_30.textBox.Text
					local v41 = string.sub(v40, 1, 1)
					if v41 ~= v_u_2.settings.UniversalPrefix then
						if v41 ~= v_u_2.pdata.Prefix then
							v40 = v_u_2.pdata.Prefix .. v40
						end
					end
					if string.sub(v40, -1) == " " then
						v40 = string.sub(v40, 1, -1)
					end
					v_u_2.signals.RequestCommand:InvokeServer(v40)
				end
			end
		elseif 0 < p_u_30.suggestionDisplayed then
			v_u_24(p_u_30, p_u_30.specificArg)
			return
		end
	end)
	local v_u_42 = nil
	p_u_30.textBox.Changed:connect(function(p43)
		-- upvalues: (copy) v_u_38, (copy) p_u_30, (ref) v_u_2, (copy) v_u_37, (ref) v_u_42
		if p43 == "Text" then
			local v_u_44 = -1
			local v_u_45 = nil
			local v_u_46 = {}
			local v47
			if v_u_38 then
				local v48 = p_u_30.textBox.Text
				table.insert(v_u_46, v48)
				v47 = 1
			else
				p_u_30.textBox.Text:gsub("([^" .. v_u_2.pdata.SplitKey .. "]+)", function(p49)
					-- upvalues: (ref) v_u_44, (ref) v_u_45, (copy) v_u_46
					v_u_44 = v_u_44 + 1
					if v_u_44 == 0 then
						v_u_45 = p49
					elseif 0 < v_u_44 then
						local v50 = v_u_46
						table.insert(v50, p49)
					end
				end)
				if 0 < v_u_44 and not p_u_30.currentBarCommand then
					local v51 = v_u_45
					local v52 = string.sub(v51, 1, 1)
					if v52 == v_u_2.settings.UniversalPrefix or v52 == v_u_2.pdata.Prefix then
						local v53 = v_u_45
						v_u_45 = string.sub(v53, 2)
					end
					v_u_45 = string.lower(v_u_45)
					for _, v54 in pairs(v_u_2.commandInfo) do
						if string.lower(v54.Name) == v_u_45 then
							p_u_30.currentBarCommand = v54
						elseif v54.Aliases then
							for _, v55 in pairs(v54.Aliases) do
								if string.lower(v55) == v_u_45 then
									p_u_30.currentBarCommand = v54
								end
							end
						end
					end
					v47 = v_u_44
				elseif v_u_44 <= 0 then
					p_u_30.currentBarCommand = nil
					v47 = v_u_44
				else
					v47 = v_u_44
				end
			end
			local v56 = {}
			p_u_30.suggestionPos = 1
			if 1 < #p_u_30.textBox.Text or v_u_38 and 0 < #p_u_30.textBox.Text then
				if v47 == 0 then
					local v57 = string.lower
					local v58 = p_u_30.textBox.Text
					local v59 = v57((string.sub(v58, 2)))
					local v60 = string.lower
					local v61 = p_u_30.textBox.Text
					local v62 = v60((string.sub(v61, 1, 1)))
					for _, v63 in pairs(v_u_2.commandInfo) do
						local v64 = string.lower(v63.Name)
						local v65 = v63.Prefixes[1]
						local v66 = #v59
						if string.sub(v64, 1, v66) == v59 and v65 == v62 then
							local v67 = {
								["Name"] = v63.Name, 
								["Args"] = v63.Args, 
								["Prefixes"] = v63.Prefixes, 
								["ArgPos"] = 0
							}
							table.insert(v56, v67)
							if #v56 == p_u_30.maxSuggestions then
								break
							end
						end
						local v68 = v63.UnFunction
						if v68 then
							local v69 = string.lower(v68)
							local v70 = #v59
							if string.sub(v69, 1, v70) == v59 and v65 == v62 then
								local v71 = {
									["Name"] = v68, 
									["Args"] = {}, 
									["Prefixes"] = v63.Prefixes, 
									["ArgPos"] = 0
								}
								table.insert(v56, v71)
								if #v56 == p_u_30.maxSuggestions then
									break
								end
							end
						end
					end
				elseif p_u_30.currentBarCommand or v_u_38 then
					local v72
					if v_u_38 then
						v72 = v_u_38
					else
						v72 = p_u_30.currentBarCommand.Args[v47]
					end
					local v73 = string.lower(v_u_46[v47])
					local v74 = p_u_30.textBox.Text
					local v75 = string.sub(v74, -1)
					if v75 ~= " " and v75 ~= v_u_2.pdata.SplitKey then
						if v72 == "player" or v72 == "playerarg" then
							for _, v76 in pairs(v_u_2.qualifiers) do
								if v_u_37(v56, v73, v47, v76) then
									break
								end
							end
							if #v56 < p_u_30.maxSuggestions then
								for _, v77 in pairs(v_u_2.players:GetChildren()) do
									if v_u_37(v56, v73, v47, v77.Name) then
										break
									end
								end
							end
						elseif v72 == "colour" or v72 == "color" or v72 == "color3" then
							for _, v78 in pairs(v_u_2.colors) do
								if v_u_37(v56, v73, v47, v78) then
									break
								end
							end
						elseif v72 == "material" then
							for _, v79 in pairs(v_u_2.materials) do
								if v_u_37(v56, v73, v47, v79) then
									break
								end
							end
						elseif v72 == "rank" then
							for _, v80 in pairs(v_u_2.settings.Ranks) do
								if v_u_37(v56, v73, v47, v80[2]) then
									break
								end
							end
						elseif v72 == "team" or v72 == "teamcolor" then
							for _, v81 in pairs(v_u_2.teams:GetChildren()) do
								if v_u_37(v56, v73, v47, v81.Name) then
									break
								end
							end
						elseif v72 == "morph" then
							for v82, _ in pairs(v_u_2.morphNames) do
								if v_u_37(v56, v73, v47, v82) then
									break
								end
							end
						elseif v72 == "tools" or v72 == "gears" or v72 == "tool" or v72 == "gear" then
							for v83, _ in pairs(v_u_2.toolNames) do
								if v_u_37(v56, v73, v47, v83) then
									break
								end
							end
						end
					end
				end
			end
			p_u_30.suggestionDisplayed = #v56
			if p_u_30.currentBarCommand and #p_u_30.currentBarCommand.Args == v47 and 0 < p_u_30.suggestionDisplayed then
				forceExecute = true
			else
				forceExecute = false
			end
			for v84 = 1, p_u_30.maxSuggestions do
				local v85 = v56[v84]
				local v86 = p_u_30.rframe["Label" .. v84]
				if v85 then
					local v87 = v85.Args and true or false
					local v88 = false
					if v87 then
						v88 = v85.Prefixes[1] == v_u_2.settings.UniversalPrefix and true or v88
					end
					local v89 = {}
					if v87 then
						for _, v90 in pairs(v85.Args) do
							if not v88 or v90 ~= "player" or v90 == "playerarg" then
								local v91 = "<" .. v90 .. ">"
								table.insert(v89, v91)
							end
						end
					end
					local v92 = v86.TextLabel
					local v93 = v85.Name
					local v94 = table.concat(v89, " ")
					v92.Text = v93 .. " " .. v94
					if v84 == p_u_30.suggestionPos then
						v86.BackgroundColor3 = p_u_30.highlightColor
					else
						v86.BackgroundColor3 = p_u_30.otherColor
					end
					p_u_30.suggestionLabels["Label" .. v84] = v85
					if p_u_30.mainParent.Name ~= "CmdBar" then
						local v95 = p_u_30.rframe.LabelTemplate.AbsoluteSize.Y
						local v96 = v95 * v84
						local v97 = p_u_30.rframe.AbsolutePosition.Y + v96
						if v_u_2.gui.Notices.AbsoluteSize.Y < v97 + 5 then
							if not v_u_42 then
								v_u_42 = p_u_30.mainParent.Position
							end
							p_u_30.mainParent.Position = p_u_30.mainParent.Position - UDim2.new(0, 0, 0, v95)
						end
					end
					v86.Visible = true
				else
					v86.Visible = false
				end
			end
			if v_u_42 and #v56 < 1 then
				p_u_30.mainParent.Position = v_u_42
				v_u_42 = nil
			end
			if #v56 < 1 and p_u_30.mainParent.Name ~= "CmdBar" then
				p_u_30.mainParent.ClipsDescendants = true
			else
				p_u_30.mainParent.ClipsDescendants = false
			end
		end
	end)
end
v_u_1:SetupTextbox("cmdbar1", v_u_11)
function v_u_1.ToggleBar(_, p98)
	-- upvalues: (copy) v_u_2, (copy) v_u_8
	if p98 == Enum.KeyCode.Quote then
		if v_u_2.gui.CmdBar.Visible then
			v_u_2:GetModule("CmdBar"):CloseCmdBar()
		else
			v_u_2:GetModule("CmdBar"):OpenCmdBar()
		end
	else
		if p98 == Enum.KeyCode.Semicolon then
			local v99 = v_u_2.settings.Cmdbar2
			if 0 < v_u_2.pdata.Rank or v99 <= 0 then
				if v_u_2.pdata.Rank < v99 then
					local v100 = v_u_2:GetModule("cf"):FormatNotice("CommandBarLocked", "2", v_u_2:GetModule("cf"):GetRankName(v99))
					v_u_2:GetModule("Notices"):Notice("Error", v100[1], v100[2])
					return
				end
				local v101 = v_u_8.cmdbar2
				if not v101 then
					v_u_2:GetModule("ClientCommands").cmdbar2.Function()
					return
				end
				if v101.mainParent.Visible then
					v101.mainParent.Visible = false
					return
				end
				v101.mainParent.Visible = true
			end
		end
		return
	end
end
function v_u_1.OpenCmdBar(_)
	-- upvalues: (ref) v_u_11, (copy) v_u_2, (ref) v_u_7, (copy) v_u_4, (copy) v_u_5, (copy) v_u_3, (ref) v_u_9, (ref) v_u_10, (copy) v_u_6
	local v102 = v_u_11
	local v103 = v_u_2.settings.Cmdbar
	if (0 < v_u_2.pdata.Rank or v103 <= 0) and not v_u_7 then
		v_u_7 = true
		if v_u_2.pdata.Rank < v103 then
			local v104 = v_u_2:GetModule("cf"):FormatNotice("CommandBarLocked", "", v_u_2:GetModule("cf"):GetRankName(v103))
			v_u_2:GetModule("Notices"):Notice("Error", v104[1], v104[2])
			return
		end
		v102.textBox:CaptureFocus()
		for _, v105 in pairs(v_u_4) do
			v_u_5[v105] = v_u_2.starterGui:GetCoreGuiEnabled(v105)
			v_u_2.starterGui:SetCoreGuiEnabled(Enum.CoreGuiType[v105], false)
		end
		v_u_3.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		v_u_9 = v_u_3.BackgroundTransparency
		v_u_10 = v_u_3.Visible
		v_u_3.BackgroundTransparency = 0
		v_u_3.Visible = true
		v102.textBox.Text = ""
		v_u_6.Visible = true
		wait()
		v102.textBox.Text = v_u_2.pdata.Prefix
		v102.textBox.CursorPosition = 3
	end
end
function v_u_1.CloseCmdBar(_)
	-- upvalues: (ref) v_u_7, (ref) v_u_11, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5, (copy) v_u_2, (copy) v_u_3, (ref) v_u_9, (ref) v_u_10
	if v_u_7 then
		v_u_7 = false
		local v_u_106 = v_u_11
		v_u_6.Visible = false
		for _, v107 in pairs(v_u_4) do
			local v108 = v_u_5[v107]
			if v108 then
				v_u_2.starterGui:SetCoreGuiEnabled(Enum.CoreGuiType[v107], v108)
			end
		end
		v_u_3.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
		v_u_3.BackgroundTransparency = v_u_9
		v_u_3.Visible = v_u_10
		coroutine.wrap(function()
			-- upvalues: (copy) v_u_106
			for _ = 1, 10 do
				v_u_106.textBox:ReleaseFocus()
				wait()
			end
		end)()
	end
end
function v_u_1.PressedArrowKey(_, p109)
	-- upvalues: (copy) v_u_8, (copy) v_u_24
	for _, v110 in pairs(v_u_8) do
		if v110.mainParent.Visible and v110.textBox:IsFocused() then
			local v111 = v110.rframe:FindFirstChild("Label" .. v110.suggestionPos)
			if p109 == Enum.KeyCode.Down then
				v110.suggestionPos = v110.suggestionPos + 1
				if v110.suggestionPos > v110.suggestionDisplayed then
					v110.suggestionPos = 1
				end
			elseif p109 == Enum.KeyCode.Up then
				v110.suggestionPos = v110.suggestionPos - 1
				if v110.suggestionPos < 1 then
					v110.suggestionPos = v110.suggestionDisplayed
				end
			elseif p109 == Enum.KeyCode.Right then
				v_u_24(v110)
			end
			local v112 = v110.rframe["Label" .. v110.suggestionPos]
			if v112 ~= v111 then
				v111.BackgroundColor3 = v110.otherColor
				v112.BackgroundColor3 = v110.highlightColor
			end
		end
	end
end
return v_u_1
