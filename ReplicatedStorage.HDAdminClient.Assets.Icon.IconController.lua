-- decompiled by Sentinel (took 23.839011ms)
local v_u_1 = game:GetService("StarterGui")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("HapticService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("UserInputService")
local v_u_6 = game:GetService("TweenService")
local v_u_7 = game:GetService("Players")
local v_u_8 = game:GetService("VRService")
local v_u_9 = game:GetService("VoiceChatService")
local v_u_10 = game:GetService("LocalizationService")
local v_u_11 = script.Parent
local v12 = require(v_u_11.TopbarPlusReference)
local v13 = v12.getObject()
local v14
if v13 then
	v14 = v13.Value
else
	v14 = v13
end
if v14 and v14.IconController ~= script then
	return require(v14.IconController)
end
if not v13 then
	v12.addToReplicatedStorage()
end
local v_u_15 = {}
local v16 = require(v_u_11.Signal)
local v_u_17 = require(v_u_11.TopbarPlusGui)
local v_u_18 = {}
local v_u_19 = false
local v_u_20 = nil
local v_u_21 = false
local v_u_22 = nil
local v_u_23 = nil
local v_u_24 = v_u_4:IsStudio()
local v_u_25 = v_u_7.LocalPlayer
local v_u_26 = false
local v_u_27 = false
local function v28()
	-- upvalues: (ref) v_u_22, (copy) v_u_15
	if workspace.CurrentCamera then
		if v_u_22 and v_u_22.Connected then
			v_u_22:Disconnect()
		end
		v_u_22 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v_u_15.updateTopbar)
	end
end
local v_u_29 = {}
v_u_29.left = {
	["startScale"] = 0, 
	["getOffset"] = function()
		-- upvalues: (copy) v_u_15, (copy) v_u_1, (ref) v_u_26, (copy) v_u_24
		local v30 = 48 + v_u_15.leftOffset
		local v31, v32 = xpcall(function()
			-- upvalues: (ref) v_u_1
			return v_u_1:GetCore("TopbarEnabled")
		end, function(_)
			return true
		end)
		if v31 and v32 then
			local v33 = v_u_1:GetCoreGuiEnabled("Chat")
			if v33 then
				v30 = v30 + 44
			end
			if v_u_26 then
				if not v_u_24 then
					if v33 then
						return v30 + 67
					end
					v30 = v30 + 43
				end
			end
		end
		return v30
	end, 
	["getStartOffset"] = function()
		-- upvalues: (copy) v_u_15, (copy) v_u_29
		local v34 = v_u_15.leftGap
		return v_u_29.left.getOffset() + v34
	end, 
	["records"] = {}
}
v_u_29.mid = {
	["startScale"] = 0.5, 
	["getOffset"] = function()
		return 0
	end, 
	["getStartOffset"] = function(p35)
		-- upvalues: (copy) v_u_15
		local v36 = v_u_15.midGap
		return -p35 / 2 + v36 / 2
	end, 
	["records"] = {}
}
v_u_29.right = {
	["startScale"] = 1, 
	["getOffset"] = function()
		-- upvalues: (copy) v_u_15, (copy) v_u_25, (copy) v_u_1, (copy) v_u_8
		local v37 = v_u_15.rightOffset
		local v38 = v_u_25.Character
		if v38 then
			v38 = v38:FindFirstChild("Humanoid")
		end
		local v39 = v38 and v38.RigType == Enum.HumanoidRigType.R6 and true or false
		local v40, v41 = xpcall(function()
			-- upvalues: (ref) v_u_1
			return v_u_1:GetCore("TopbarEnabled")
		end, function(_)
			return true
		end)
		if v40 and v41 or v_u_8.VREnabled then
			if v_u_1:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList) or v_u_1:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
				::l11::
				v37 = v37 + 48
				goto l9
			end
			if not v39 then
				if v_u_1:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu) then
					goto l11
				end
			end
		end
		::l9::
		return v37
	end, 
	["getStartOffset"] = function(p42)
		-- upvalues: (copy) v_u_29
		return -p42 - v_u_29.right.getOffset()
	end, 
	["records"] = {}
}
v_u_15.topbarEnabled = true
v_u_15.controllerModeEnabled = false
local v43, v44 = xpcall(function()
	-- upvalues: (copy) v_u_1
	return v_u_1:GetCore("TopbarEnabled")
end, function(_)
	return true
end)
v_u_15.previousTopbarEnabled = v43 and v44
v_u_15.leftGap = 12
v_u_15.midGap = 12
v_u_15.rightGap = 12
v_u_15.leftOffset = 0
v_u_15.rightOffset = 0
v_u_15.voiceChatEnabled = false
v_u_15.mimicCoreGui = true
v_u_15.healthbarDisabled = false
v_u_15.activeButtonBCallbacks = 0
v_u_15.disableButtonB = false
v_u_15.translator = v_u_10:GetTranslatorForPlayer(v_u_25)
v_u_15.iconAdded = v16.new()
v_u_15.iconRemoved = v16.new()
v_u_15.controllerModeStarted = v16.new()
v_u_15.controllerModeEnded = v16.new()
v_u_15.healthbarDisabledSignal = v16.new()
local v_u_45 = 0
v_u_15.iconAdded:Connect(function(p_u_46)
	-- upvalues: (copy) v_u_18, (copy) v_u_15, (ref) v_u_45
	v_u_18[p_u_46] = true
	if v_u_15.gameTheme then
		p_u_46:setTheme(v_u_15.gameTheme)
	end
	p_u_46.updated:Connect(function()
		-- upvalues: (ref) v_u_15
		v_u_15.updateTopbar()
	end)
	p_u_46.selected:Connect(function()
		-- upvalues: (ref) v_u_15, (copy) p_u_46
		local v47 = v_u_15.getIcons()
		for _, v48 in pairs(v47) do
			if p_u_46.deselectWhenOtherIconSelected and v48 ~= p_u_46 and v48.deselectWhenOtherIconSelected and v48:getToggleState() == "selected" then
				v48:deselect(p_u_46)
			end
		end
	end)
	v_u_45 = v_u_45 + 1
	p_u_46:setOrder(v_u_45)
	if v_u_15.controllerModeEnabled then
		v_u_15._enableControllerModeForIcon(p_u_46, true)
	end
	v_u_15:_updateSelectionGroup()
	v_u_15.updateTopbar()
end)
v_u_15.iconRemoved:Connect(function(p49)
	-- upvalues: (copy) v_u_18, (copy) v_u_15
	v_u_18[p49] = nil
	p49:setEnabled(false)
	p49:deselect()
	p49.updated:Fire()
	v_u_15:_updateSelectionGroup()
end)
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v28)
function v_u_15.setGameTheme(p50)
	-- upvalues: (copy) v_u_15
	v_u_15.gameTheme = p50
	local v51 = v_u_15.getIcons()
	for _, v52 in pairs(v51) do
		v52:setTheme(p50)
	end
end
function v_u_15.setDisplayOrder(p53)
	-- upvalues: (copy) v_u_17
	v_u_17.DisplayOrder = tonumber(p53) or v_u_17.DisplayOrder
end
v_u_15.setDisplayOrder(10)
function v_u_15.getIcons()
	-- upvalues: (copy) v_u_18
	local v54 = {}
	for v55, _ in pairs(v_u_18) do
		table.insert(v54, v55)
	end
	return v54
end
function v_u_15.getIcon(p56)
	-- upvalues: (copy) v_u_18
	for v57, _ in pairs(v_u_18) do
		if v57.name == p56 then
			return v57
		end
	end
	return false
end
function v_u_15.disableHealthbar(p58)
	-- upvalues: (copy) v_u_15
	local v59 = p58 == nil and true or p58
	v_u_15.healthbarDisabled = v59
	v_u_15.healthbarDisabledSignal:Fire(v59)
end
function v_u_15.disableControllerOption(p60)
	-- upvalues: (ref) v_u_27, (copy) v_u_15
	v_u_27 = p60 == nil and true or p60
	if v_u_15.getIcon("_TopbarControllerOption") then
		v_u_15._determineControllerDisplay()
	end
end
function v_u_15.canShowIconOnTopbar(p61)
	return (p61.enabled == true or p61.accountForWhenDisabled) and p61.presentOnTopbar and true or false
end
function v_u_15.getMenuOffset(p62)
	-- upvalues: (copy) v_u_15
	local v63 = v_u_15[p62:get("alignment") .. "Gap"]
	local v64 = 0
	local v65 = 0
	local v66 = 0
	local v67
	if p62.menuOpen then
		v67 = p62:get("menuSize").X.Offset
		local v68 = p62:_getMenuDirection()
		if v68 == "right" then
			return v64, v65 + v67 + v63 / 6, v66
		end
		if v68 == "left" then
			v64 = v67 + 4
			v65 = v65 + v63 / 3
		else
			v67 = v66
		end
	else
		v67 = v66
	end
	return v64, v65, v67
end
local v_u_69 = false
function v_u_15.updateTopbar()
	-- upvalues: (copy) v_u_15, (ref) v_u_21, (ref) v_u_69, (copy) v_u_4, (copy) v_u_29, (copy) v_u_18, (copy) v_u_17, (copy) v_u_6
	local function v_u_77(p70, p71)
		-- upvalues: (ref) v_u_15
		local v72 = (p70:get("iconSize", p70:getIconState()) or UDim2.new(0, 32, 0, 32)).X.Offset + v_u_15[p71 .. "Gap"]
		local v73 = 0
		if p70._parentIcon == nil then
			local v74, v75, v76 = v_u_15.getMenuOffset(p70)
			v73 = v73 + v74
			v72 = v72 + v75 + v76
		end
		return v72, v73
	end
	if v_u_21 then
		v_u_69 = true
		return false
	end
	task.defer(function()
		-- upvalues: (ref) v_u_21, (ref) v_u_4, (ref) v_u_29, (ref) v_u_18, (ref) v_u_15, (copy) v_u_77, (ref) v_u_17, (ref) v_u_6, (ref) v_u_69
		v_u_21 = true
		v_u_4.Heartbeat:Wait()
		v_u_21 = false
		for _, v78 in pairs(v_u_29) do
			v78.records = {}
		end
		for v79, _ in pairs(v_u_18) do
			if v_u_15.canShowIconOnTopbar(v79) then
				local v80 = v_u_29[v79:get("alignment")].records
				table.insert(v80, v79)
			end
		end
		local v81 = workspace.CurrentCamera.ViewportSize
		for v82, v83 in pairs(v_u_29) do
			local v84 = v83.records
			if 1 < #v84 then
				if v83.reverseSort then
					table.sort(v84, function(p85, p86)
						return p85:get("order") > p86:get("order")
					end)
				else
					table.sort(v84, function(p87, p88)
						return p87:get("order") < p88:get("order")
					end)
				end
			end
			local v89 = 0
			for _, v90 in pairs(v84) do
				v89 = v89 + v_u_77(v90, v82)
			end
			local v91 = v83.getStartOffset(v89, v82)
			local v92 = v_u_17.TopbarContainer.AbsoluteSize.X
			local v93 = v91
			for _, v94 in pairs(v84) do
				local v95, v96 = v_u_77(v94, v82)
				local _ = v83.startScale * v92 + v93 + v96
				v93 = v93 + v95
			end
			for _, v97 in pairs(v84) do
				local v98 = v97.instances.iconContainer
				local v99, v100 = v_u_77(v97, v82)
				local v101 = v97.topPadding
				local v102 = UDim2.new(v83.startScale, v91 + v100, v101.Scale, v101.Offset)
				string.match(v97.name, "_overflowIcon-")
				local v103 = v97:get("repositionInfo")
				if v103 then
					v_u_6:Create(v98, v103, {
						["Position"] = v102
					}):Play()
				else
					v98.Position = v102
				end
				v91 = v91 + v99
				v97.targetPosition = UDim2.new(0, v102.X.Scale * v81.X + v102.X.Offset, 0, v102.Y.Scale * v81.Y + v102.Y.Offset)
			end
		end
		local function v_u_112(p104, p105, p106)
			-- upvalues: (ref) v_u_15
			local v107 = p106 or 0
			local v108 = p104:get("iconSize", p104:getIconState()).X.Offset
			local v109, v110 = v_u_15.getMenuOffset(p104)
			local v111 = p105 == "left" and -v107 - v109
			if not v111 then
				if p105 == "right" then
					v111 = v108 + v107 + v110
				else
					v111 = false
				end
			end
			return p104.targetPosition.X.Offset + v111
		end
		local function v120(p113, p114)
			-- upvalues: (ref) v_u_15
			local v115, v116 = p113:get("iconSize", p113:getIconState(), "beforeDropdown")
			local v117 = p113:get("iconSize", "hovering")
			if p113.wasHoveringBeforeOverflow then
				if v116 then
					if v117 then
						if v117.X.Offset <= v116.X.Offset then
							v117 = v116
						end
					else
						v117 = v116
					end
				else
					v117 = v116
				end
			else
				v117 = v116
			end
			if p114 then
				v115 = v117 or v115
			end
			local v118, v119 = v_u_15.getMenuOffset(p113)
			return v115.X.Offset + v118 + v119
		end
		for v_u_121, v122 in pairs(v_u_29) do
			local v_u_123 = v122.overflowIcon
			if v_u_123 then
				local v124 = v_u_15[v_u_121 .. "Gap"]
				local v125 = v_u_121 == "left" and "right" or "left"
				local v126 = v_u_29[v125]
				local v127 = v_u_15.getIcon("_overflowIcon-" .. v125)
				local v128 = v_u_123:get("iconSize", v_u_123:getIconState()).X.Offset
				local v129, v130 = v_u_15.getMenuOffset(v_u_123)
				local v131 = v_u_121 == "left" and -0 - v129
				if not v131 then
					if v_u_121 == "right" then
						v131 = v128 + 0 + v130
					else
						v131 = false
					end
				end
				local v_u_132 = v_u_123.targetPosition.X.Offset + v131
				if v_u_123.enabled then
					v_u_132 = v_u_112(v_u_123, v125, v124)
				end
				local v133 = v126.getOffset()
				if not v_u_123.enabled then
					v133 = v133 + 10
				end
				local v134 = v_u_121 == "left" and v81.X - v133
				if v134 then
					v133 = v134
				elseif v_u_121 ~= "right" then
					v133 = false
				end
				local v_u_135 = v133
				local v136 = v_u_135
				local v137
				if v_u_121 == "left" and v136 < v_u_132 then
					v137 = true
				elseif v_u_121 == "right" then
					v137 = v_u_132 < v136
				else
					v137 = false
				end
				local v_u_138 = v137
				local function v147(p139)
					-- upvalues: (ref) v_u_15, (copy) v_u_123, (copy) v_u_112, (copy) v_u_121, (ref) v_u_135, (ref) v_u_132, (ref) v_u_138
					local v140 = #p139
					for v141 = 1, v140 do
						local v142 = p139[v140 + 1 - v141]
						if v_u_15.canShowIconOnTopbar(v142) then
							local v143 = string.match(v142.name, "_overflowIcon-")
							if v143 and v140 ~= 1 then
								return
							end
							if not v143 or v142.enabled then
								local v144 = v_u_112(v142, v_u_121, v_u_123.enabled and 0 or 10)
								local v145
								if v_u_121 == "left" and v144 < v_u_135 then
									v145 = true
								elseif v_u_121 == "right" then
									v145 = v_u_135 < v144
								else
									v145 = false
								end
								if v145 then
									v_u_135 = v144
									local v146
									if v_u_121 == "left" and v144 < v_u_132 then
										v146 = true
									elseif v_u_121 == "right" then
										v146 = v_u_132 < v144
									else
										v146 = false
									end
									if v146 then
										v_u_138 = true
									end
								end
							end
						end
					end
				end
				v147(v_u_29[v125].records)
				v147(v_u_29.mid.records)
				if v_u_138 then
					local v148 = v122.records
					local v149 = #v148
					for v150 = 1, v149 do
						local v151 = v_u_121 == "left" and v148[v149 + 1 - v150]
						if not v151 then
							if v_u_121 == "right" then
								v151 = v148[v150]
							else
								v151 = false
							end
						end
						if v151 ~= v_u_123 then
							if v_u_15.canShowIconOnTopbar(v151) then
								local v152 = v_u_123:get("iconSize", v_u_123:getIconState()).X.Offset
								if v_u_123.enabled then
									v124 = v124 + v124 + v152
								end
								local v153 = v_u_112(v151, v125, v124)
								local v154
								if v_u_121 == "left" and v_u_135 <= v153 then
									v154 = true
								elseif v_u_121 == "right" then
									v154 = v153 <= v_u_135
								else
									v154 = false
								end
								if v154 then
									if not v_u_123.enabled then
										local v155 = v_u_123.instances.iconContainer
										local v156 = v155.Position.Y
										local v157 = v_u_112(v151, v125, v_u_121 == "left" and -v155.Size.X.Offset or 0)
										v155.Position = UDim2.new(0, v157, v156.Scale, v156.Offset)
										v_u_123:setEnabled(true)
									end
									if 0 < #v151.dropdownIcons then
										v151._overflowConvertedToMenu = true
										local v158 = v151.isSelected
										v151:deselect()
										local v159 = {}
										for _, v160 in pairs(v151.dropdownIcons) do
											table.insert(v159, v160)
										end
										for _, v161 in pairs(v151.dropdownIcons) do
											v161:leave()
										end
										v151:setMenu(v159)
										if v158 and v_u_123.isSelected then
											v151:select()
										end
									end
									if v151.hovering then
										v151.wasHoveringBeforeOverflow = true
									end
									v151:join(v_u_123, "dropdown")
									if 0 < #v151.menuIcons then
										if v151.menuOpen then
											v151:deselect()
											v151:select()
											v_u_123:select()
										end
									end
								end
								break
							end
						end
					end
				else
					local v162 = nil
					local v163 = nil
					local v164 = #v_u_123.dropdownIcons
					if not v127 or not v127.enabled or #v122.records ~= 1 or #v126.records == 1 then
						for _, v165 in pairs(v_u_123.dropdownIcons) do
							local v166 = v165:get("order")
							if v163 == nil then
								v162 = v166
								v163 = v165
							elseif v_u_121 == "left" and v166 < v162 then
								v162 = v166
								v163 = v165
							elseif v_u_121 == "right" then
								if v162 < v166 then
									v162 = v166
									v163 = v165
								end
							end
						end
					end
					if v163 then
						local v167 = v120(v163, true)
						local v168 = v_u_123:get("iconSize", v_u_123:getIconState()).X.Offset
						local v169, v170 = v_u_15.getMenuOffset(v_u_123)
						local v171 = v125 == "left" and -0 - v169
						if not v171 then
							if v125 == "right" then
								v171 = v168 + 0 + v170
							else
								v171 = false
							end
						end
						local v172 = v_u_123.targetPosition.X.Offset + v171
						if v164 == 1 then
							v172 = v_u_112(v_u_123, v_u_121, v124 - 10)
						end
						local v173 = v_u_135 - v172
						if v167 < math.abs(v173) - v124 * 2 then
							if #v_u_123.dropdownIcons == 1 then
								v_u_123:setEnabled(false)
							end
							local v174 = v_u_123.instances.iconContainer
							local v175 = v174.Position.Y
							v174.Position = UDim2.new(0, v172, v175.Scale, v175.Offset)
							v163:leave()
							v163.wasHoveringBeforeOverflow = nil
							if v163._overflowConvertedToMenu then
								v163._overflowConvertedToMenu = nil
								local v176 = {}
								for _, v177 in pairs(v163.menuIcons) do
									table.insert(v176, v177)
								end
								for _, v178 in pairs(v163.menuIcons) do
									v178:leave()
								end
								v163:setDropdown(v176)
							end
						end
					end
				end
			end
		end
		if v_u_69 then
			v_u_69 = false
			v_u_15.updateTopbar()
		end
		return true
	end)
end
function v_u_15.setTopbarEnabled(p179, p180)
	-- upvalues: (copy) v_u_17, (ref) v_u_19, (copy) v_u_1, (copy) v_u_15, (ref) v_u_20, (ref) v_u_23, (copy) v_u_3, (copy) v_u_4, (copy) v_u_18, (copy) v_u_2
	local v181 = p180 == nil and true or p180
	local v182 = v_u_17.Indicator
	if v181 and not p179 then
		v_u_19 = true
	elseif v181 and p179 then
		v_u_19 = false
	end
	local v183, v184 = xpcall(function()
		-- upvalues: (ref) v_u_1
		return v_u_1:GetCore("TopbarEnabled")
	end, function(_)
		return true
	end)
	local v185 = v183 and v184 or not v_u_15.mimicCoreGui
	if v_u_15.controllerModeEnabled then
		if p179 then
			if v_u_17.TopbarContainer.Visible or v_u_19 or v_u_20 or not v185 then
				return
			elseif v181 then
				v182.Visible = v185
			else
				v182.Active = false
				if v_u_23 and v_u_23.Connected then
					v_u_23:Disconnect()
				end
				if v_u_3:IsVibrationSupported(Enum.UserInputType.Gamepad1) and v_u_3:IsMotorSupported(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small) then
					v_u_3:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small, 1)
					delay(0.2, function()
						-- upvalues: (ref) v_u_3
						pcall(function()
							-- upvalues: (ref) v_u_3
							v_u_3:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small, 0)
						end)
					end)
				end
				v_u_17.TopbarContainer.Visible = true
				v_u_17.TopbarContainer:TweenPosition(UDim2.new(0, 0, 0, 37), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
				v_u_15:_updateSelectionGroup()
				v_u_4.Heartbeat:Wait()
				local v186 = nil
				local v187 = 0
				for v188, _ in pairs(v_u_18) do
					if v_u_15.canShowIconOnTopbar(v188) then
						if v186 == nil or v188:get("order") < v186:get("order") then
							if v188.enabled then
								v186 = v188
							end
						end
					end
					local v189 = -27 + v188.instances.iconContainer.AbsoluteSize.Y + 50
					if v187 < v189 then
						v187 = v189
					end
				end
				if v_u_2:GetEmotesMenuOpen() then
					v_u_2:SetEmotesMenuOpen(false)
				end
				if v_u_2:GetInspectMenuEnabled() then
					v_u_2:CloseInspectMenu()
				end
				local v190 = v_u_15._previousSelectedObject or v186.instances.iconButton
				v_u_15._setControllerSelectedObject(v190)
				v182.Image = "rbxassetid://5278151071"
				v182:TweenPosition(UDim2.new(0.5, 0, 0, v187 + 32), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
			end
		else
			if v181 then
				v182.Visible = false
			elseif v185 then
				v182.Visible = true
				v182.Active = true
				v_u_23 = v182.InputBegan:Connect(function(p191)
					-- upvalues: (ref) v_u_15
					if p191.UserInputType == Enum.UserInputType.MouseButton1 then
						v_u_15.setTopbarEnabled(true, false)
					end
				end)
			else
				v182.Visible = false
			end
			if v_u_17.TopbarContainer.Visible then
				v_u_2.AutoSelectGuiEnabled = true
				v_u_15:_updateSelectionGroup(true)
				v_u_17.TopbarContainer:TweenPosition(UDim2.new(0, 0, 0, -v_u_17.TopbarContainer.Size.Y.Offset + 32), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true, function()
					-- upvalues: (ref) v_u_17
					v_u_17.TopbarContainer.Visible = false
				end)
				v182.Image = "rbxassetid://5278151556"
				v182:TweenPosition(UDim2.new(0.5, 0, 0, 5), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.1, true)
			end
		end
	else
		local v192 = v_u_17.TopbarContainer
		if v185 then
			v192.Visible = p179
		else
			v192.Visible = false
		end
	end
end
function v_u_15.setGap(p193, p194)
	-- upvalues: (copy) v_u_15
	local v195 = tonumber(p193) or 12
	local v196 = tostring(p194):lower()
	if v196 == "left" or v196 == "mid" or v196 == "right" then
		v_u_15[v196 .. "Gap"] = v195
		v_u_15.updateTopbar()
	else
		v_u_15.leftGap = v195
		v_u_15.midGap = v195
		v_u_15.rightGap = v195
		v_u_15.updateTopbar()
	end
end
function v_u_15.setLeftOffset(p197)
	-- upvalues: (copy) v_u_15
	v_u_15.leftOffset = tonumber(p197) or 0
	v_u_15.updateTopbar()
end
function v_u_15.setRightOffset(p198)
	-- upvalues: (copy) v_u_15
	v_u_15.rightOffset = tonumber(p198) or 0
	v_u_15.updateTopbar()
end
local v_u_199 = v_u_7.LocalPlayer
local v_u_200 = {}
v_u_199.CharacterAdded:Connect(function()
	-- upvalues: (ref) v_u_200
	for _, v201 in pairs(v_u_200) do
		v201:destroy()
	end
	v_u_200 = {}
end)
function v_u_15.clearIconOnSpawn(p_u_202)
	-- upvalues: (copy) v_u_199, (ref) v_u_200
	coroutine.wrap(function()
		-- upvalues: (ref) v_u_199, (ref) v_u_200, (copy) p_u_202
		if not v_u_199.Character then
			v_u_199.CharacterAdded:Wait()
		end
		local v203 = v_u_200
		local v204 = p_u_202
		table.insert(v203, v204)
	end)()
end
function v_u_15._updateSelectionGroup(_, p205)
	-- upvalues: (copy) v_u_15, (copy) v_u_2
	if v_u_15._navigationEnabled then
		v_u_2:RemoveSelectionGroup("TopbarPlusIcons")
	end
	if p205 then
		v_u_2.CoreGuiNavigationEnabled = v_u_15._originalCoreGuiNavigationEnabled
		v_u_2.GuiNavigationEnabled = v_u_15._originalGuiNavigationEnabled
		v_u_15._navigationEnabled = nil
	elseif v_u_15.controllerModeEnabled then
		local v206 = v_u_15.getIcons()
		local v207 = {}
		for _, v208 in pairs(v206) do
			if not v208.joinedFeatureName or v208._parentIcon[v208.joinedFeatureName .. "Open"] == true then
				local v209 = v208.instances.iconButton
				table.insert(v207, v209)
			end
		end
		v_u_2:AddSelectionTuple("TopbarPlusIcons", table.unpack(v207))
		if not v_u_15._navigationEnabled then
			v_u_15._originalCoreGuiNavigationEnabled = v_u_2.CoreGuiNavigationEnabled
			v_u_15._originalGuiNavigationEnabled = v_u_2.GuiNavigationEnabled
			v_u_2.CoreGuiNavigationEnabled = false
			v_u_2.GuiNavigationEnabled = true
			v_u_15._navigationEnabled = true
		end
	end
end
function v_u_15._setControllerSelectedObject(p_u_210)
	-- upvalues: (copy) v_u_15, (copy) v_u_2
	local v_u_211 = v_u_15._controllerSetCount and v_u_15._controllerSetCount + 1 or 0
	v_u_15._controllerSetCount = v_u_211
	v_u_2.SelectedObject = p_u_210
	task.delay(0.1, function()
		-- upvalues: (ref) v_u_15, (copy) v_u_211, (ref) v_u_2, (copy) p_u_210
		if v_u_211 == v_u_15._controllerSetCountS then
			v_u_2.SelectedObject = p_u_210
		end
	end)
end
function v_u_15._enableControllerMode(p212)
	-- upvalues: (copy) v_u_17, (copy) v_u_15, (copy) v_u_2, (copy) v_u_1, (ref) v_u_23, (copy) v_u_18
	local v213 = v_u_17.Indicator
	v_u_15.getIcon("_TopbarControllerOption")
	if v_u_15.controllerModeEnabled ~= p212 then
		v_u_15.controllerModeEnabled = p212
		if p212 then
			v_u_17.TopbarContainer.Position = UDim2.new(0, 0, 0, 5)
			v_u_17.TopbarContainer.Visible = false
			local v214 = v_u_2:IsTenFootInterface() and 3 or 1.3
			v213.Position = UDim2.new(0.5, 0, 0, 5)
			v213.Size = UDim2.new(0, 18 * v214, 0, 18 * v214)
			v213.Image = "rbxassetid://5278151556"
			local v215, v216 = xpcall(function()
				-- upvalues: (ref) v_u_1
				return v_u_1:GetCore("TopbarEnabled")
			end, function(_)
				return true
			end)
			v213.Visible = v215 and v216 or not v_u_15.mimicCoreGui
			v213.Position = UDim2.new(0.5, 0, 0, 5)
			v213.Active = true
			v_u_23 = v213.InputBegan:Connect(function(p217)
				-- upvalues: (ref) v_u_15
				if p217.UserInputType == Enum.UserInputType.MouseButton1 then
					v_u_15.setTopbarEnabled(true, false)
				end
			end)
		else
			v_u_17.TopbarContainer.Position = UDim2.new(0, 0, 0, 0)
			local v218 = v_u_17.TopbarContainer
			local v219, v220 = xpcall(function()
				-- upvalues: (ref) v_u_1
				return v_u_1:GetCore("TopbarEnabled")
			end, function(_)
				return true
			end)
			v218.Visible = v219 and v220 or not v_u_15.mimicCoreGui
			v213.Visible = false
			v_u_15._setControllerSelectedObject(nil)
		end
		for v221, _ in pairs(v_u_18) do
			v_u_15._enableControllerModeForIcon(v221, p212)
		end
	end
end
function v_u_15._enableControllerModeForIcon(p222, p223)
	-- upvalues: (copy) v_u_2
	local v224 = p222._parentIcon
	local v225 = p222.joinedFeatureName
	if v224 then
		p222:leave()
	end
	if p223 then
		local v226 = v_u_2:IsTenFootInterface() and 3 or 1.3
		local v227 = p222:get("iconSize", "deselected")
		local v228 = p222:get("iconSize", "selected")
		local v229 = p222:getHovering("iconSize")
		p222:set("iconSize", UDim2.new(0, v227.X.Offset * v226, 0, v227.Y.Offset * v226), "deselected", "controllerMode")
		p222:set("iconSize", UDim2.new(0, v228.X.Offset * v226, 0, v228.Y.Offset * v226), "selected", "controllerMode")
		if v229 then
			p222:set("iconSize", UDim2.new(0, v228.X.Offset * v226, 0, v228.Y.Offset * v226), "hovering", "controllerMode")
		end
		p222:set("alignment", "mid", "deselected", "controllerMode")
		p222:set("alignment", "mid", "selected", "controllerMode")
	else
		for _, v230 in pairs({ "deselected", "selected", "hovering" }) do
			local _, v231 = p222:get("alignment", v230, "controllerMode")
			if v231 then
				p222:set("alignment", v231, v230)
			end
			local _, v232 = p222:get("iconSize", v230, "controllerMode")
			if v232 then
				p222:set("iconSize", v232, v230)
			end
		end
	end
	if v224 then
		p222:join(v224, v225)
	end
end
local v_u_233 = false
function v_u_15.setupHealthbar()
	-- upvalues: (ref) v_u_233, (copy) v_u_4, (copy) v_u_11, (copy) v_u_1, (copy) v_u_15, (copy) v_u_199
	if not v_u_233 then
		v_u_233 = true
		task.defer(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_11, (ref) v_u_1, (ref) v_u_15, (ref) v_u_199
			v_u_4.Heartbeat:Wait()
			require(v_u_11).new():setProperty("internalIcon", true):setName("_FakeHealthbar"):setRight():setOrder(-420):setSize(80, 32):lock():set("iconBackgroundTransparency", 1):give(function(p_u_234)
				-- upvalues: (ref) v_u_1, (ref) v_u_15, (ref) v_u_199
				local v235 = Instance.new("Frame")
				v235.Name = "HealthContainer"
				v235.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				v235.BorderSizePixel = 0
				v235.AnchorPoint = Vector2.new(0, 0.5)
				v235.Position = UDim2.new(0, 0, 0.5, 0)
				v235.Size = UDim2.new(1, 0, 0.2, 0)
				v235.Visible = true
				v235.ZIndex = 11
				v235.Parent = p_u_234.instances.iconButton
				local v236 = Instance.new("UICorner")
				v236.CornerRadius = UDim.new(1, 0)
				v236.Parent = v235
				local v237 = v235:Clone()
				v237.Name = "HealthFrame"
				v237.BackgroundColor3 = Color3.fromRGB(167, 167, 167)
				v237.BorderSizePixel = 0
				v237.AnchorPoint = Vector2.new(0.5, 0.5)
				v237.Position = UDim2.new(0.5, 0, 0.5, 0)
				v237.Size = UDim2.new(1, -2, 1, -2)
				v237.Visible = true
				v237.ZIndex = 12
				v237.Parent = v235
				local v_u_238 = v237:Clone()
				v_u_238.Name = "HealthBar"
				v_u_238.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				v_u_238.BorderSizePixel = 0
				v_u_238.AnchorPoint = Vector2.new(0, 0.5)
				v_u_238.Position = UDim2.new(0, 0, 0.5, 0)
				v_u_238.Size = UDim2.new(0.5, 0, 1, 0)
				v_u_238.Visible = true
				v_u_238.ZIndex = 13
				v_u_238.Parent = v237
				local v_u_239 = Color3.fromRGB(27, 252, 107)
				local v_u_240 = Color3.fromRGB(250, 235, 0)
				local v_u_241 = Color3.fromRGB(255, 28, 0)
				local v_u_242 = true
				local function v_u_278(p243)
					-- upvalues: (ref) v_u_1, (ref) v_u_15, (ref) v_u_242, (copy) p_u_234, (copy) v_u_239, (copy) v_u_240, (copy) v_u_241, (copy) v_u_238
					if p243 then
						local v_u_244 = p243:WaitForChild("Humanoid", 10)
						if v_u_244 then
							local function v277()
								-- upvalues: (ref) v_u_1, (copy) v_u_244, (ref) v_u_15, (ref) v_u_242, (ref) p_u_234, (ref) v_u_239, (ref) v_u_240, (ref) v_u_241, (ref) v_u_238
								local v245 = v_u_1:GetCoreGuiEnabled(Enum.CoreGuiType.Health)
								local v246 = v_u_244.Health / v_u_244.MaxHealth
								if v246 == 1 or v_u_15.healthbarDisabled or v_u_242 and v245 == false then
									if p_u_234.enabled then
										p_u_234:setEnabled(false)
									end
								else
									if v246 < 1 then
										if not p_u_234.enabled then
											p_u_234:setEnabled(true)
										end
										v_u_242 = false
										if v245 then
											v_u_1:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
										end
									end
									local v247 = 1.25 * v246 + -0.125
									local v248 = 1 < v247 and 1 or v247 < 0 and 0 or v247
									local v249 = 0.5 < v246 and v_u_239 or v_u_240
									local v250 = 0.5 < v246 and v_u_240 or v_u_241
									local v251 = (1 - v248) * 2
									local v252 = 0.5 < v246 and 1 - v251 or 2 - v251
									local v253 = nil or 2
									local v254 = Color3.new
									local v255 = v250.R
									local v256 = math.pow(v255, v253)
									local v257 = v250.G
									local v258 = math.pow(v257, v253)
									local v259 = v250.B
									local v260 = v254(v256, v258, (math.pow(v259, v253)))
									local v261 = Color3.new
									local v262 = v249.R
									local v263 = math.pow(v262, v253)
									local v264 = v249.G
									local v265 = math.pow(v264, v253)
									local v266 = v249.B
									local v267 = v260:Lerp(v261(v263, v265, (math.pow(v266, v253))), v252)
									local v268 = 1 / v253
									local v269 = Color3.new
									local v270 = v267.R
									local v271 = math.pow(v270, v268)
									local v272 = v267.G
									local v273 = math.pow(v272, v268)
									local v274 = v267.B
									local v275 = v269(v271, v273, (math.pow(v274, v268)))
									local v276 = UDim2.new(v246, 0, 1, 0)
									v_u_238.BackgroundColor3 = v275
									v_u_238.Size = v276
								end
							end
							v_u_244.HealthChanged:Connect(v277)
							v_u_15.healthbarDisabledSignal:Connect(v277)
							v277()
						end
					else
						return
					end
				end
				v_u_199.CharacterAdded:Connect(function(p279)
					-- upvalues: (copy) v_u_278
					v_u_278(p279)
				end)
				task.spawn(v_u_278, v_u_199.Character)
			end)
		end)
	end
end
function v_u_15._determineControllerDisplay()
	-- upvalues: (copy) v_u_5, (copy) v_u_15, (ref) v_u_27
	local v280 = v_u_5.MouseEnabled
	local v281 = v_u_5.GamepadEnabled
	local v282 = v_u_15.getIcon("_TopbarControllerOption")
	if v280 and v281 then
		if v_u_27 then
			v282:setEnabled(false)
		else
			v282:setEnabled(true)
		end
	elseif v280 and not v281 then
		v282:setEnabled(false)
		v_u_15._enableControllerMode(false)
		v282:deselect()
	elseif not v280 and v281 then
		v282:setEnabled(false)
		v_u_15._enableControllerMode(true)
	end
end
coroutine.wrap(function()
	-- upvalues: (copy) v_u_4, (copy) v_u_11, (copy) v_u_5, (copy) v_u_15, (copy) v_u_2, (copy) v_u_1, (copy) v_u_17, (copy) v_u_29, (copy) v_u_9, (copy) v_u_199, (ref) v_u_26, (copy) v_u_24
	v_u_4.Heartbeat:Wait()
	local v283 = require(v_u_11)
	local v_u_284 = v283.new():setProperty("internalIcon", true):setName("_TopbarControllerOption"):setOrder(100):setImage(11162828670):setRight():setEnabled(false):setTip("Controller mode"):setProperty("deselectWhenOtherIconSelected", false)
	v_u_5:GetPropertyChangedSignal("MouseEnabled"):Connect(v_u_15._determineControllerDisplay)
	v_u_5.GamepadConnected:Connect(v_u_15._determineControllerDisplay)
	v_u_5.GamepadDisconnected:Connect(v_u_15._determineControllerDisplay)
	v_u_15._determineControllerDisplay()
	local function v286()
		-- upvalues: (copy) v_u_284, (ref) v_u_15
		local v285 = v_u_284.isSelected
		v_u_284:setTip(v285 and "Normal mode" or "Controller mode")
		v_u_15._enableControllerMode(v285)
	end
	v_u_284.selected:Connect(v286)
	v_u_284.deselected:Connect(v286)
	v_u_5.InputBegan:Connect(function(p287, _)
		-- upvalues: (ref) v_u_15, (ref) v_u_2, (ref) v_u_1, (ref) v_u_17
		if v_u_15.controllerModeEnabled then
			if p287.KeyCode == Enum.KeyCode.DPadDown then
				if not v_u_2.SelectedObject then
					local v288, v289 = xpcall(function()
						-- upvalues: (ref) v_u_1
						return v_u_1:GetCore("TopbarEnabled")
					end, function(_)
						return true
					end)
					if v288 and v289 or not v_u_15.mimicCoreGui then
						v_u_15.setTopbarEnabled(true, false)
					end
				end
			elseif p287.KeyCode == Enum.KeyCode.ButtonB and not v_u_15.disableButtonB then
				if v_u_15.activeButtonBCallbacks == 1 and v_u_17.Indicator.Image == "rbxassetid://5278151556" then
					v_u_15.activeButtonBCallbacks = 0
					v_u_2.SelectedObject = nil
				end
				if v_u_15.activeButtonBCallbacks == 0 then
					v_u_15._previousSelectedObject = v_u_2.SelectedObject
					v_u_15._setControllerSelectedObject(nil)
					v_u_15.setTopbarEnabled(false, false)
				end
			end
			p287:Destroy()
		end
	end)
	for v290, v291 in pairs(v_u_29) do
		if v290 ~= "mid" then
			local v292 = "_overflowIcon-" .. v290
			local v293 = v283.new():setProperty("internalIcon", true):setImage(6069276526):setName(v292):setEnabled(false)
			v291.overflowIcon = v293
			v293.accountForWhenDisabled = true
			if v290 == "left" then
				v293:setOrder(math.huge)
				v293:setLeft()
				v293:set("dropdownAlignment", "right")
			elseif v290 == "right" then
				v293:setOrder(-math.huge)
				v293:setRight()
				v293:set("dropdownAlignment", "left")
			end
			v293.lockedSettings = {
				["iconImage"] = true, 
				["order"] = true, 
				["alignment"] = true
			}
		end
	end
	task.defer(function()
		-- upvalues: (ref) v_u_9, (ref) v_u_199, (ref) v_u_15, (ref) v_u_26, (ref) v_u_24
		while true do
			local v294, v295 = pcall(function()
				-- upvalues: (ref) v_u_9, (ref) v_u_199
				return v_u_9:IsVoiceEnabledForUserIdAsync(v_u_199.UserId)
			end)
			local v_u_296 = v294
			local v_u_297 = v295
			if v_u_296 then
				break
			end
			task.wait(1)
		end
		if v_u_15.voiceChatEnabled and v_u_296 and v_u_297 then
			v_u_26 = true
			v_u_15.updateTopbar()
		end
		v_u_199.PlayerGui:WaitForChild("TopbarPlus", 999)
		task.delay(10, function()
			-- upvalues: (ref) v_u_15, (ref) v_u_296, (ref) v_u_297, (ref) v_u_26, (ref) v_u_24
			if v_u_15.voiceChatEnabled and v_u_296 and v_u_297 then
				v_u_26 = true
				v_u_15.updateTopbar()
			end
			if v_u_15.voiceChatEnabled == nil and v_u_296 and v_u_297 and v_u_24 then
				warn("\226\154\160\239\184\143TopbarPlus Action Required\226\154\160\239\184\143 If VoiceChat is enabled within your experience it\'s vital you set IconController.voiceChatEnabled to true ``require(game.ReplicatedStorage.Icon.IconController).voiceChatEnabled = true`` otherwise the BETA label will not be accounted for within your live servers. This warning will disappear after doing so. Feel free to delete this warning if you have not enabled VoiceChat within your experience.")
			end
		end)
	end)
	if not v_u_24 then
		local v298 = game.CreatorId
		local v_u_299 = game:GetService("GroupService")
		if game.CreatorType == Enum.CreatorType.Group then
			local v300, v301 = pcall(function()
				-- upvalues: (copy) v_u_299
				return v_u_299:GetGroupInfoAsync(game.CreatorId).Owner
			end)
			if v300 then
				v298 = v301.Id
			end
		end
		local v302 = require(v_u_11.VERSION)
		if v_u_199.UserId ~= v298 then
			local v_u_303 = game:GetService("MarketplaceService")
			local v304, v305 = pcall(function()
				-- upvalues: (copy) v_u_303
				return v_u_303:GetProductInfo(game.PlaceId)
			end)
			if v304 and v305 then
				local v306 = v305.Name
				print(("\n\n\n\226\154\189 %s uses TopbarPlus %s\n\240\159\141\141 TopbarPlus was developed by ForeverHD and the Nanoblox Team\n\240\159\154\128 You can learn more and take a free copy by searching for \'TopbarPlus\' on the DevForum\n\n"):format(v306, v302))
			end
		end
	end
end)()
coroutine.wrap(function()
	-- upvalues: (copy) v_u_7, (copy) v_u_1, (copy) v_u_15
	local v307 = v_u_7.LocalPlayer.PlayerScripts:WaitForChild("ChatScript", 4) or game:GetService("Chat"):WaitForChild("ChatScript", 4)
	if v307 then
		local v308 = v307:FindFirstChild("ChatMain")
		if v308 then
			require(v308).CoreGuiEnabled:connect(function()
				-- upvalues: (ref) v_u_1, (ref) v_u_15
				local v309, v310 = xpcall(function()
					-- upvalues: (ref) v_u_1
					return v_u_1:GetCore("TopbarEnabled")
				end, function(_)
					return true
				end)
				local v311 = v309 and v310
				if v311 == v_u_15.previousTopbarEnabled then
					v_u_15.updateTopbar()
					return "SetCoreGuiEnabled was called instead of SetCore"
				end
				if v_u_15.mimicCoreGui then
					v_u_15.previousTopbarEnabled = v311
					if v_u_15.controllerModeEnabled then
						v_u_15.setTopbarEnabled(false, false)
					else
						v_u_15.setTopbarEnabled(v311, false)
					end
				end
				v_u_15.updateTopbar()
			end)
			local v312, v313 = xpcall(function()
				-- upvalues: (ref) v_u_1
				return v_u_1:GetCore("TopbarEnabled")
			end, function(_)
				return true
			end)
			local v314 = v312 and v313
			local v315 = v314 or not v_u_15.mimicCoreGui and true or v314
			v_u_15.setTopbarEnabled(v315, false)
		end
	else
		return
	end
end)()
v_u_2.MenuClosed:Connect(function()
	-- upvalues: (copy) v_u_8, (ref) v_u_20, (copy) v_u_15
	if not v_u_8.VREnabled then
		v_u_20 = false
		if not v_u_15.controllerModeEnabled then
			v_u_15.setTopbarEnabled(v_u_15.topbarEnabled, false)
		end
	end
end)
v_u_2.MenuOpened:Connect(function()
	-- upvalues: (copy) v_u_8, (ref) v_u_20, (copy) v_u_15
	if not v_u_8.VREnabled then
		v_u_20 = true
		v_u_15.setTopbarEnabled(false, false)
	end
end)
if workspace.CurrentCamera then
	if v_u_22 and v_u_22.Connected then
		v_u_22:Disconnect()
	end
	v_u_22 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v_u_15.updateTopbar)
end
task.spawn(function()
	-- upvalues: (copy) v_u_10, (copy) v_u_199, (copy) v_u_15
	local v316, v317 = pcall(function()
		-- upvalues: (ref) v_u_10, (ref) v_u_199
		return v_u_10:GetTranslatorForPlayerAsync(v_u_199)
	end)
	local function v320()
		-- upvalues: (ref) v_u_15
		local v318 = v_u_15.getIcons()
		for _, v319 in pairs(v318) do
			v319:_updateAll()
		end
	end
	if v316 then
		v_u_15.translator = v317
		v317:GetPropertyChangedSignal("LocaleId"):Connect(v320)
		task.spawn(v320)
		task.delay(1, v320)
		task.delay(10, v320)
	end
end)
return v_u_15
