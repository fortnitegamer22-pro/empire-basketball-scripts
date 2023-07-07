-- decompiled by Sentinel (took 7.583034ms)
local v_u_1 = {}
local v_u_2 = _G.HDAdminMain
local v_u_3 = v_u_2.gui.MainFrame.Pages.Commands
local v_u_4 = {
	["commands"] = v_u_3.Commands, 
	["morphs"] = v_u_3.Morphs, 
	["details"] = v_u_3.Details
}
local v_u_5 = v_u_4.commands.TemplateOne
local v_u_6 = v_u_4.commands.TemplateTwo
local v_u_7 = v_u_4.morphs.Template
local v_u_8 = {
	"Aliases", 
	"Undo", 
	"Desc", 
	"Rank", 
	"Loop", 
	"Tags", 
	"Credit"
}
local v_u_9 = {
	"Aliases", 
	"UnFunction", 
	"Description", 
	"Rank", 
	"Loopable", 
	"Tags", 
	"Contributors"
}
local v_u_10 = true
v_u_3.SearchBar.Frame.TextBox.FocusLost:connect(function(_)
	-- upvalues: (ref) v_u_10, (copy) v_u_4, (copy) v_u_1
	if v_u_10 then
		v_u_10 = false
		local v11 = nil
		for _, v12 in pairs(v_u_4) do
			if v12.Position.X.Scale == 0 then
				v11 = v12
			end
		end
		if v11 then
			v_u_1["Create" .. v11.Name]()
		end
		wait(0.5)
		v_u_10 = true
	end
end)
local v_u_13 = false
function v_u_1.SetupCommands(_, p14, p_u_15, p16)
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9
	local v17 = v_u_5.TextLabel.TextBounds.Y
	for v18, v_u_19 in pairs(p14) do
		string.lower(v_u_19.Name)
		p16 = p16 + 1
		local v_u_20
		if p_u_15.Name == "Donor" then
			v_u_20 = "AE Command" .. p16
		else
			v_u_20 = v_u_2:GetModule("cf"):GenerateTagFromId(p16)
		end
		local v_u_21 = v_u_5:Clone()
		v_u_21.BackgroundColor3 = v_u_2:GetModule("cf"):GetLabelBackgroundColor(v18)
		v_u_21.TextLabel.TextColor3 = Color3.fromRGB(235, 235, 235)
		local v_u_22 = false
		if v_u_19.Prefixes[1] == v_u_2.settings.UniversalPrefix then
			v_u_21.TextLabel.Text = v_u_2.settings.UniversalPrefix .. v_u_19.Name
			v_u_22 = true
		else
			v_u_21.TextLabel.Text = v_u_2.pdata.Prefix .. v_u_19.Name
		end
		local v23 = v_u_21.TextLabel
		local v24 = v_u_2.textService:GetTextSize(v23.Text, v17, v23.Font, v23.AbsoluteSize)
		if v_u_19.SpecialColor then
			v23.Text = v_u_19.OriginalName
			local v25 = v_u_2.textService:GetTextSize(v23.Text, v17, v23.Font, v23.AbsoluteSize)
			local v26 = v23:Clone()
			v26.ZIndex = v26.ZIndex + 2
			v26.Position = v23.Position + UDim2.new(0, v25.X, 0, 0)
			v26.TextColor3 = v_u_19.SpecialColor
			v26.Name = "ColorLabel"
			v26.Text = v_u_19.SpecialColorName
			v26.Parent = v_u_21
		end
		local v27 = {}
		local v28 = v23:Clone()
		v28.Position = v23.Position + UDim2.new(0, v24.X + 5, 0, 0)
		v28.TextColor3 = Color3.fromRGB(175, 175, 175)
		v28.Name = "DetailsLabel"
		for _, v29 in pairs(v_u_19.Args) do
			if (not v_u_22 or v29 ~= "player") and v29 ~= "details" then
				local v30 = "<" .. (v29 == "playerarg" and "player" or v29 == "userid" and "userId/username" or v29) .. ">"
				table.insert(v27, v30)
			end
		end
		v28.Text = table.concat(v27, "  ")
		v28.Parent = v_u_21
		v_u_21.Name = v_u_20
		v_u_21.Arrow.Text = "\226\150\186"
		v_u_21.Visible = true
		local v_u_31 = {}
		local v32 = Instance.new("TextButton")
		v32.BackgroundTransparency = 1
		v32.ZIndex = v_u_21.ZIndex + 5
		v32.Size = UDim2.new(1, 0, 1, 0)
		v32.Text = ""
		local function v_u_63()
			-- upvalues: (ref) v_u_31, (copy) p_u_15, (ref) v_u_6, (copy) v_u_21, (ref) v_u_8, (copy) v_u_19, (ref) v_u_9, (ref) v_u_20, (ref) v_u_2, (ref) v_u_22
			if 0 < #v_u_31 then
				p_u_15.CanvasSize = p_u_15.CanvasSize - UDim2.new(0, 0, 0, #v_u_31 * v_u_6.AbsoluteSize.Y)
				for _, v33 in pairs(v_u_31) do
					v33:Destroy()
				end
				v_u_31 = {}
			end
			if v_u_21.Arrow.Text == "\226\150\186" then
				v_u_21.Arrow.Text = "\226\150\188"
				local v34 = 0
				for v35, v36 in pairs(v_u_8) do
					local v37 = v_u_19[v_u_9[v35]]
					if v37 then
						if type(v37) ~= "table" and type(v37) ~= "string" or 0 < #v37 then
							v34 = v34 + 1
							local v38 = v_u_6:Clone()
							local v39 = v_u_20
							local v40 = v_u_2.alphabet[v34]
							v38.Name = v39 .. " Info" .. v40
							v38.Title.Text = v36 .. ":"
							if v34 % 2 == 0 then
								v38.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
							else
								v38.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
							end
							local v41 = v38.TextLabel
							v38.Parent = p_u_15
							local v42 = v_u_2.pdata.Prefix
							if v_u_22 then
								v42 = v_u_2.settings.UniversalPrefix
							end
							if v36 == "Loop" then
								if v37 == true then
									v41.Text = "Yes"
								else
									v41.Text = "No"
								end
							elseif v36 == "Undo" then
								v41.Text = v42 .. v_u_19.UnFunction
							elseif v36 == "Alias" then
								local v43 = {}
								for _, v44 in pairs(v37) do
									local v45 = v42 .. v44
									table.insert(v43, v45)
								end
								v41.Text = table.concat(v43, " | ")
							elseif type(v37) == "table" then
								v41.Text = table.concat(v37, ", ")
							elseif v36 == "Rank" then
								if v_u_19.RankName == "Donor" then
									v41.Text = v_u_19.Rank
								else
									local v46 = v_u_19.Rank
									local v47 = v_u_19.RankName
									v41.Text = v46 .. " (" .. v47 .. ")"
								end
							else
								v41.Text = v37
								if v36 == "Desc" then
									local v48 = v38.Title.AbsoluteSize
									local v49 = v38.AbsoluteSize
									local v50 = (v38.Title.AbsolutePosition.Y - v38.AbsolutePosition.Y) / 2
									local v51 = v41.AbsoluteSize
									local v52 = v51.Y
									local v53 = v41.Font
									local v54 = Vector2.new(v51.X, v51.Y * 100)
									local v55 = v_u_2.textService:GetTextSize(v37, v52, v53, v54)
									v38.UIAspectRatioConstraint:Destroy()
									v41.Size = UDim2.new(0, v55.X, 0, v55.Y)
									v38.Title.Size = UDim2.new(0, v48.X, 0, v48.Y)
									local v56 = UDim2.new
									local v57 = v49.X
									local v58 = v49.Y
									local v59 = v55.Y
									local v60 = v51.Y
									v38.Size = v56(0, v57, 0, v58 + v59 - math.ceil(v60))
									v38.Title.Position = UDim2.new(v38.Title.Position.X.Scale, 0, 0, v50)
									v38.TextLabel.Position = UDim2.new(v38.TextLabel.Position.X.Scale, 0, 0, v50)
								end
							end
							v38.Visible = true
							local v61 = v_u_31
							table.insert(v61, v38)
						end
					end
				end
				local v62 = #v_u_31 * v_u_6.AbsoluteSize.Y
				p_u_15.CanvasSize = p_u_15.CanvasSize + UDim2.new(0, 0, 0, v62)
				if v_u_21.AbsolutePosition.Y > p_u_15.AbsolutePosition.Y + p_u_15.AbsoluteSize.Y - v62 / 1.5 then
					p_u_15.CanvasPosition = p_u_15.CanvasPosition + Vector2.new(0, v62)
					return
				end
			else
				v_u_21.Arrow.Text = "\226\150\186"
			end
		end
		if v_u_2.device == "Mobile" then
			v32.MouseButton1Click:Connect(function()
				-- upvalues: (copy) v_u_63
				v_u_63()
			end)
		else
			v32.MouseButton1Down:Connect(function()
				-- upvalues: (copy) v_u_63
				v_u_63()
			end)
		end
		v32.Parent = v_u_21
		v_u_21.Parent = p_u_15
	end
	return p16
end
function v_u_1.CreateCommands(_)
	-- upvalues: (ref) v_u_13, (copy) v_u_2, (copy) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_1
	if not v_u_13 then
		v_u_13 = true
		v_u_2:GetModule("cf"):ClearPage(v_u_4.commands)
		local v64 = {}
		local v65 = {}
		local v66 = 0
		local v67 = v_u_3.SearchBar.Frame.TextBox.Text
		for v68, v69 in pairs(v_u_2.settings.Ranks) do
			local v70 = v69[1]
			local v71 = v69[2]
			table.insert(v65, {
				v70, 
				v71, 
				{}
			})
			v64[v71] = v68
		end
		for _, v72 in pairs(v_u_2.commandInfo) do
			local v73 = string.lower(v72.Name)
			if v72.RankName ~= "Donor" then
				local v74 = false
				if 0 < #v67 then
					for _, v75 in pairs(v72.Aliases) do
						local v76 = string.lower
						local v77 = #v75
						if v76((string.sub(v67, 1, v77))) == v75 then
							v74 = true
							break
						end
					end
				end
				if string.match(v73, v67) or v74 then
					local v78 = v64[v72.RankName]
					if not v78 then
						local v79 = v72.Rank
						for _, v80 in pairs(v_u_2.settings.Ranks) do
							local v81 = v80[1]
							local v82 = v80[2]
							if v79 < v81 then
								v78 = v64[v82]
								break
							end
						end
					end
					if v78 then
						local v83 = v65[v78][3]
						table.insert(v83, v72)
					end
				end
			end
		end
		for _, v84 in pairs(v65) do
			local v85 = v84[1]
			local v86 = v84[2]
			local v87 = v84[3]
			if 0 < #v87 then
				if not v_u_2.settings.OnlyShowUsableCommands or v85 <= v_u_2.pdata.Rank then
					local v88 = v_u_5:Clone()
					v88.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
					v88.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					if v85 == 5 then
						v88.TextLabel.Text = v86
					else
						v88.TextLabel.Text = v86 .. " +"
					end
					local v89 = v66 + 1
					v88.Name = v_u_2:GetModule("cf"):GenerateTagFromId(v89)
					v88.TextLabel.Position = v88.Arrow.Position
					v88.Arrow:Destroy()
					v88.Visible = true
					v88.Parent = v_u_4.commands
					v66 = v_u_1:SetupCommands(v87, v_u_4.commands, v89)
				end
			end
		end
		v_u_4.commands.CanvasSize = UDim2.new(0, 0, 0, v66 * v_u_5.AbsoluteSize.Y)
		coroutine.wrap(function()
			-- upvalues: (ref) v_u_13
			wait(0.5)
			v_u_13 = false
		end)()
	end
end
function v_u_1.CreateVoiceChat(_) end
function v_u_1.CreateMorphs(_)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3, (copy) v_u_7
	v_u_2:GetModule("cf"):ClearPage(v_u_4.morphs)
	local v90 = {}
	local v91 = v_u_3.SearchBar.Frame.TextBox.Text
	for v92, _ in pairs(v_u_2.morphNames) do
		local v93 = string.lower(v92)
		if string.match(v93, v91) then
			table.insert(v90, v92)
		end
	end
	table.sort(v90)
	local v94 = v_u_2.pdata.Prefix .. "morph <player> <morphName>"
	table.insert(v90, 1, v94)
	for v95, v96 in pairs(v90) do
		local v97 = v_u_7:Clone()
		if v95 == 1 then
			v97.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
			v97.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		else
			v97.BackgroundColor3 = v_u_2:GetModule("cf"):GetLabelBackgroundColor(v95)
			v97.TextLabel.TextColor3 = Color3.fromRGB(235, 235, 235)
		end
		v97.TextLabel.Text = v96
		v97.Name = v96
		v97.Visible = true
		v97.Parent = v_u_4.morphs
	end
	v_u_4.morphs.CanvasSize = UDim2.new(0, 0, 0, #v90 * v_u_7.AbsoluteSize.Y)
end
local v_u_98 = {
	{
		{ 0, "Colors" }
	}, 
	{
		{ 0, "Qualifiers (select certain players)" }, 
		{ "Me" }, 
		{ "All" }, 
		{ "Random" }, 
		{ "Admins/NonAdmins" }, 
		{ "Friends/NonFriends" }, 
		{ "NBC/BC/TBC/OBC/Premium(prem)" }, 
		{ "R6/R15" }, 
		{ "Rthro/NonRthro" }, 
		{ "@(RankName)" }, 
		{ "%(TeamName)" }
	}, 
	{
		{ 0, "Shortcuts" }, 
		{ "\' (Quote) to toggle cmdbar (computer)" }, 
		{ "; (Semicolon) to toggle cmdbar2 (computer)" }
	}, 
	{
		{ 0, "Tips" }, 
		{ "/e for silent commands   (/e ;jump me)" }, 
		{ "Batch commands   (;jump me ;kill me)" }, 
		{ "Select multiple players   (;jump me,bc,r15)" }, 
		{ "Shorten names   (;jump ForeverHD = ;jump for)" }, 
		{ "Cases do not matter   (;jUmP mE = ;jump me)" }
	}
}
local v99 = nil
for v100, v101 in pairs(v_u_98) do
	if v101[1][1] == 0 then
		if v101[1][2] == "Colors" then
			v99 = v100
		end
	end
end
for _, v102 in pairs(v_u_2.settings.Colors) do
	local v103 = v102[1]
	local v104 = v102[2]
	local v105 = { v104 .. " (" .. v103 .. ")" }
	local v106 = v_u_98[v99]
	table.insert(v106, v105)
	local v107 = v_u_2.colors
	table.insert(v107, v104)
end
function v_u_1.CreateDetails(_)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_98, (copy) v_u_7
	v_u_2:GetModule("cf"):ClearPage(v_u_4.details)
	local v108 = 0
	for _, v109 in pairs(v_u_98) do
		for v110, v111 in pairs(v109) do
			local v112 = v_u_7:Clone()
			if v110 == 1 then
				v112.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
				v112.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				v112.TextLabel.Text = v111[2]
			else
				v112.BackgroundColor3 = v_u_2:GetModule("cf"):GetLabelBackgroundColor(v110)
				v112.TextLabel.TextColor3 = Color3.fromRGB(235, 235, 235)
				v112.TextLabel.Text = v111[1]
			end
			v112.Visible = true
			v112.Parent = v_u_4.details
			v108 = v108 + 1
		end
	end
	v_u_4.details.CanvasSize = UDim2.new(0, 0, 0, v108 * v_u_7.AbsoluteSize.Y)
end
return v_u_1
