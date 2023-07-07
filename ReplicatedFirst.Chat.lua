-- decompiled by Sentinel (took 5.227902ms)
local _, _, _, _, _, _, v_u_1, _, _, _, _, _, _, _, _, _, _, v_u_2, _, _, v_u_3, v_u_4, v_u_5, _, _, _, _, _, _, _, _, _, _, _, _, _, v_u_6, _, _, _, _, v_u_7, v_u_8, v_u_9 = unpack(require(script.Func))
local v_u_10 = game:GetService("TextService")
local v_u_11 = game.Players.LocalPlayer
local function v_u_16(p12, p13, p14)
	-- upvalues: (copy) v_u_9, (copy) v_u_7, (copy) v_u_16
	if p12:IsA("TextLabel") or p12:IsA("TextButton") then
		v_u_9(v_u_7, p12, {
			["BackgroundTransparency"] = 1, 
			["TextTransparency"] = 1, 
			["TextStrokeTransparency"] = 1
		}, p13)
	elseif p12:IsA("ImageLabel") or p12:IsA("ImageButton") then
		v_u_9(v_u_7, p12, {
			["BackgroundTransparency"] = 1, 
			["ImageTransparency"] = 1
		}, p13)
	elseif p12:IsA("Frame") or p12:IsA("ScrollingFrame") then
		v_u_9(v_u_7, p12, {
			["BackgroundTransparency"] = 1
		}, p13)
	end
	for _, v15 in next, p12:GetChildren() do
		v_u_16(v15, p13)
	end
	if p14 then
		wait(p13)
		if p12 then
			p12:Destroy()
		end
	end
end
local function v_u_24(p17, p18)
	-- upvalues: (copy) v_u_11, (copy) v_u_1, (copy) v_u_3, (copy) v_u_5
	if p17 and p17.Adornee then
		local v19 = (p18 - p17.Adornee.Position).magnitude
		if v19 < 65 then
			local v20 = v_u_11 == v_u_1:GetPlayerFromCharacter(p17.Adornee.Parent)
			p17.Enabled = true
			p17.Size = v_u_3(0, 300, 0, 600)
			p17.StudsOffset = v_u_5(0, v20 and 1.5 or 2.5, v20 and 2 or 0)
			for _, v21 in next, p17:children() do
				v21.Visible = v21.Name ~= "Small"
			end
			return
		end
		if v19 < 100 and 1 < #p17:GetChildren() then
			local v22 = v_u_11 == v_u_1:GetPlayerFromCharacter(p17.Adornee.Parent)
			p17.Enabled = true
			p17.Size = v_u_3(4, 0, 3, 0)
			p17.StudsOffset = v_u_5(0, v22 and 2 or 3, v22 and 2 or 0)
			for _, v23 in next, p17:children() do
				v23.Visible = v23.Name == "Small"
			end
			return
		end
		p17.Enabled = false
	end
end
local v_u_25 = {}
local v_u_26 = Rect.new(3, 3, 4, 4)
function _G.ChatBubble(p27, p28, p29)
	-- upvalues: (copy) v_u_1, (copy) v_u_11, (copy) v_u_25, (copy) v_u_6, (copy) v_u_5, (copy) v_u_3, (copy) v_u_26, (copy) v_u_8, (copy) v_u_24, (copy) v_u_2, (copy) v_u_10, (copy) v_u_4, (copy) v_u_16
	if p27 and 0 < #p28:gsub("%s", "") then
		local v_u_30 = v_u_1:GetPlayerFromCharacter(p27.Parent)
		local v31 = v_u_30 == v_u_11
		local v_u_32 = v_u_25[v_u_30 or p27.Parent]
		local v33 = workspace.CurrentCamera.CoordinateFrame.p
		if not v_u_32 then
			local v_u_34 = v_u_6("BillboardGui", workspace.CurrentCamera, "Chat Bubble")({
				["Adornee"] = p27, 
				["StudsOffset"] = v_u_5(0, v31 and 1.5 or 2.5, v31 and 2 or 0), 
				["Size"] = v_u_3(0, 300, 0, 600)
			})
			v_u_6("ImageLabel", v_u_34, "Small")({
				["Visible"] = false, 
				["BackgroundTransparency"] = 1, 
				["Size"] = v_u_3(1, 0, 1, 0), 
				["Position"] = v_u_3(0, 0, 1, -40), 
				["Image"] = "rbxassetid://526696244", 
				["SliceCenter"] = v_u_26, 
				["ScaleType"] = "Slice", 
				["ImageTransparency"] = 0.2, 
				["ZIndex"] = 9, 
				v_u_6("TextLabel")({
					["BackgroundTransparency"] = 1, 
					["Font"] = "SourceSansBold", 
					["TextSize"] = 24, 
					["TextStrokeTransparency"] = 0.9, 
					["ZIndex"] = 10, 
					["Size"] = v_u_3(1, -16, 1, 0), 
					["Position"] = v_u_3(0, 8, 0, 0), 
					["Text"] = "...", 
					["TextScaled"] = true
				})
			})
			v_u_25[v_u_30 or p27.Parent] = v_u_34
			table.insert(v_u_25, v_u_34)
			if v_u_30 then
				v_u_30.Changed:connect(function()
					-- upvalues: (copy) v_u_30, (ref) v_u_1, (ref) v_u_34
					if not v_u_30 or v_u_30.Parent ~= v_u_1 then
						v_u_34:Destroy()
					end
				end)
				v_u_30.CharacterAdded:connect(function(p35)
					-- upvalues: (ref) v_u_34, (ref) v_u_8
					v_u_34.Adornee = v_u_8(p35, "Head")
				end)
				v_u_32 = v_u_34
			else
				v_u_32 = v_u_34
			end
		end
		v_u_24(v_u_32, v33)
		local v36 = p29 or v_u_2(1, 1, 1)
		local v37 = p28 == p28:upper() and "SourceSansBold" or "SourceSans"
		local v38 = v_u_2(1 - v36.r * 0.875, 1 - v36.g * 0.875, 1 - v36.b * 0.875)
		if 125 < #p28 then
			p28 = p28:sub(1, 125) .. "..."
		end
		local v39 = v_u_10:GetTextSize(p28, 24, v37, v_u_4(292, 120))
		local v_u_40 = v_u_6("ImageLabel", v_u_32, "Bubble")({
			["AnchorPoint"] = v_u_4(0, 1), 
			["BackgroundTransparency"] = 1, 
			["Position"] = v_u_3(0.5, -(v39.x + 16) / 2, 0.5, 0), 
			["Size"] = v_u_3(0, v39.x + 16, 0, v39.y + 8), 
			["Image"] = "rbxassetid://526696244", 
			["SliceCenter"] = v_u_26, 
			["ScaleType"] = "Slice", 
			["ImageColor3"] = v36, 
			["ImageTransparency"] = 0.2, 
			["ZIndex"] = 9, 
			v_u_6("TextLabel")({
				["BackgroundTransparency"] = 1, 
				["Font"] = v37, 
				["TextSize"] = 24, 
				["TextStrokeTransparency"] = 0.9, 
				["TextColor3"] = v38, 
				["TextStrokeColor3"] = v38, 
				["ZIndex"] = 10, 
				["Size"] = v_u_3(1, -16, 1, 0), 
				["Position"] = v_u_3(0, 8, 0, 0), 
				["Text"] = p28, 
				["TextWrapped"] = true
			})
		})
		delay(v31 and 8 or 15, function()
			-- upvalues: (ref) v_u_16, (copy) v_u_40, (ref) v_u_32
			v_u_16(v_u_40, 0.5, true)
			if #v_u_32:GetChildren() < 2 then
				v_u_32.Enabled = false
			end
		end)
		local v41 = v_u_32:GetChildren()
		local v42 = v39.y + 12
		for _, v43 in next, v41, nil do
			if v43.Name ~= "Small" and v43 ~= v_u_40 then
				v43:TweenPosition(v43.Position - v_u_3(0, 0, 0, v42), "Out", "Quad", 0.2, true)
			end
		end
		if 3 < #v41 then
			v_u_16(v41[#v41 - 2], 0.5, true)
		end
	end
end
local v_u_44 = nil
if workspace.CurrentCamera then
	v_u_44 = workspace.CurrentCamera.Changed:connect(function(p45)
		-- upvalues: (copy) v_u_25, (copy) v_u_24
		if p45 == "CoordinateFrame" then
			local v46 = workspace.CurrentCamera.CoordinateFrame.p
			for v47, v48 in next, v_u_25, nil do
				if v48 and v48.Parent then
					v_u_24(v48, v46)
				else
					v_u_25[v47] = nil
					if v48 then
						v48:Destroy()
					end
				end
			end
		end
	end)
end
workspace.Changed:connect(function(p49)
	-- upvalues: (ref) v_u_44, (copy) v_u_25, (copy) v_u_24
	if p49 == "CurrentCamera" then
		if v_u_44 then
			v_u_44:disconnect()
		end
		if workspace.CurrentCamera then
			v_u_44 = workspace.CurrentCamera.Changed:connect(function(p50)
				-- upvalues: (ref) v_u_25, (ref) v_u_24
				if p50 == "CoordinateFrame" then
					local v51 = workspace.CurrentCamera.CoordinateFrame.p
					for v52, v53 in next, v_u_25, nil do
						if v53 and v53.Parent then
							v_u_24(v53, v51)
						else
							v_u_25[v52] = nil
							if v53 then
								v53:Destroy()
							end
						end
					end
				end
			end)
		end
	end
end)
