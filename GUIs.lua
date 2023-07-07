-- decompiled by Sentinel (took 7.053428ms)
local v_u_1 = {}
local v_u_2 = _G.HDAdminMain
local v_u_3 = {
	["About"] = { "Info", "Updates", "Credits" }, 
	["Commands"] = { "Commands", "Morphs", "Details" }, 
	["Special"] = { "Donor", "Coming soon" }, 
	["Admin"] = { "Ranks", "Server Ranks", "Banland" }, 
	["Settings"] = { "Custom" }
}
local v_u_4 = v_u_2.gui.MainFrame
local _ = v_u_2.gui.CustomTopBar.ImageButton
local v_u_5 = v_u_4.Pages
local v_u_6 = v_u_5.Home
local v_u_7 = true
local function v_u_10(p8)
	-- upvalues: (copy) v_u_4
	for _, v9 in pairs(v_u_4.Pages.Home:GetChildren()) do
		if v9:FindFirstChild("Arrow") then
			v9.Arrow.Visible = p8
		end
	end
end
local function v_u_12()
	-- upvalues: (ref) v_u_6, (copy) v_u_2, (copy) v_u_4, (copy) v_u_10
	if v_u_6.Name == "Home" then
		local v11 = v_u_2.hdAdminCoreName:find(" ")
		v_u_4.DragBar.Title.Text = v_u_2.hdAdminCoreName:sub(1, v11 - 1) .. v_u_2.hdAdminCoreName:sub(v11):upper()
		v_u_4.DragBar.Back.Visible = false
		v_u_4.DragBar.Title.Position = UDim2.new(0.04, 0, 0.15, 0)
		v_u_10(true)
	else
		v_u_4.DragBar.Title.Text = string.upper(v_u_6.Name)
		v_u_4.DragBar.Back.Visible = true
		v_u_4.DragBar.Title.Position = UDim2.new(0.15, 0, 0.15, 0)
		v_u_10(false)
	end
end
local function v_u_20(p13, p14, p15)
	-- upvalues: (ref) v_u_6, (copy) v_u_2, (copy) v_u_12
	local v16 = TweenInfo.new(p15 and 0 or 0.3, Enum.EasingStyle.Quad)
	local v17 = v_u_6
	local v18 = v_u_2.tweenService:Create(v_u_6, v16, {
		["Position"] = p13
	})
	local v19 = v_u_2.tweenService:Create(p14, v16, {
		["Position"] = UDim2.new(0, 0, 0, 0)
	})
	if p14.Name == "Home" then
		p14.Position = UDim2.new(-1, 0, 0, 0)
	else
		p14.Position = UDim2.new(1, 0, 0, 0)
		if p14.Name == "Admin" then
			spawn(function()
				-- upvalues: (ref) v_u_2
				v_u_2:GetModule("PageAdmin"):UpdatePages()
			end)
		end
	end
	p14.Visible = true
	v18:Play()
	v19:Play()
	v_u_6 = p14
	v_u_12()
	v19.Completed:Wait()
	v17.Visible = false
end
v_u_4.Visible = false
for _, v_u_21 in pairs(v_u_5.Home:GetChildren()) do
	if v_u_21:IsA("TextButton") then
		local v_u_22 = v_u_21.Fade
		if v_u_2.device == "Mobile" then
			v_u_21.MouseButton1Up:Connect(function()
				-- upvalues: (ref) v_u_7, (copy) v_u_5, (copy) v_u_21, (copy) v_u_20
				if v_u_7 then
					v_u_7 = false
					local v23 = v_u_5:FindFirstChild(v_u_21.Name)
					if v23 then
						v_u_20(UDim2.new(-1, 0, 0, 0), v23)
					end
					v_u_7 = true
				end
			end)
		else
			v_u_21.MouseButton1Down:Connect(function()
				-- upvalues: (ref) v_u_7, (copy) v_u_5, (copy) v_u_21, (copy) v_u_20
				if v_u_7 then
					v_u_7 = false
					local v24 = v_u_5:FindFirstChild(v_u_21.Name)
					if v24 then
						v_u_20(UDim2.new(-1, 0, 0, 0), v24)
					end
					v_u_7 = true
				end
			end)
		end
		v_u_21.InputBegan:Connect(function(_)
			-- upvalues: (copy) v_u_21, (copy) v_u_2, (copy) v_u_22
			if not v_u_21.RankBlocker.Visible then
				v_u_2.tweenService:Create(v_u_22, TweenInfo.new(0.2), {
					["BackgroundTransparency"] = 0.8
				}):Play()
			end
		end)
		v_u_21.InputEnded:Connect(function(_)
			-- upvalues: (copy) v_u_2, (copy) v_u_22
			v_u_2.tweenService:Create(v_u_22, TweenInfo.new(0.2), {
				["BackgroundTransparency"] = 1
			}):Play()
		end)
	end
end
local function v_u_41(p25, p26, p27, p28, p29)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v30 = TweenInfo.new(p29 and 0 or 0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v31 = v_u_3[p25.Name]
	local v_u_32
	if tonumber(p26) then
		v_u_32 = p25[v31[p26]]
	else
		v_u_32 = nil
	end
	local v33 = p25[v31[p27]]
	local v34 = nil
	if v_u_32 and v_u_32:IsA("ScrollingFrame") then
		v_u_32.ScrollBarImageTransparency = 1
	end
	if v33:IsA("ScrollingFrame") then
		v33.ScrollBarImageTransparency = 0
	end
	local v35 = p25:FindFirstChild("SearchBar")
	if v35 then
		if v33.Size.Y.Scale < 0.85 then
			v35.Visible = true
		else
			v35.Visible = false
		end
	end
	for _, v36 in pairs(v31) do
		local v37 = p25[v36]
		if v37 ~= v33 and v37 ~= v_u_32 then
			v37.Position = UDim2.new(-2, 0, v37.Position.Y.Scale, 0)
		end
	end
	local v38 = p28 == "Right" and 1 or p28 == "Left" and -1 or v34
	local v_u_39 = v38 * -1
	p25.NavigateButtons.TextLabel.Text = string.upper(v33.Name)
	v33.Position = UDim2.new(v38, 0, v33.Position.Y.Scale, v33.Position.Y.Offset)
	v_u_2.tweenService:Create(v33, v30, {
		["Position"] = UDim2.new(0, 0, v33.Position.Y.Scale, 0)
	}):Play()
	if v_u_32 then
		local v_u_40 = v_u_2.tweenService:Create(v_u_32, v30, {
			["Position"] = UDim2.new(v_u_39, 0, v_u_32.Position.Y.Scale, 0)
		})
		v_u_40:Play()
		spawn(function()
			-- upvalues: (copy) v_u_40, (ref) v_u_32, (copy) v_u_39
			v_u_40.Completed:Wait()
			if v_u_32.Position.X.Scale == v_u_39 then
				v_u_32.Position = UDim2.new(-2, 0, v_u_32.Position.Y.Scale, 0)
			end
		end)
	end
end
for _, v_u_42 in pairs(v_u_5:GetChildren()) do
	if v_u_42:FindFirstChild("NavigateButtons") then
		local v_u_43 = 1
		local v_u_44 = v_u_3[v_u_42.Name]
		local v45 = 0
		for v46, v47 in pairs(v_u_44) do
			local v48 = v_u_42[v47]
			if v46 == 1 then
				v_u_42.NavigateButtons.TextLabel.Text = string.upper(v47)
			else
				v45 = 1
			end
			v48.Position = UDim2.new(v45, 0, v48.Position.Y.Scale, 0)
			v48.Visible = true
		end
		for _, v_u_49 in pairs(v_u_42.NavigateButtons:GetChildren()) do
			if v_u_49:IsA("TextButton") then
				v_u_49.MouseButton1Down:Connect(function()
					-- upvalues: (ref) v_u_43, (copy) v_u_49, (copy) v_u_44, (copy) v_u_41, (copy) v_u_42
					local v50 = v_u_43
					if v_u_49.Name == "Right" then
						v_u_43 = v_u_43 + 1
						if v_u_43 > #v_u_44 then
							v_u_43 = 1
						end
					elseif v_u_49.Name == "Left" then
						v_u_43 = v_u_43 - 1
						if v_u_43 < 1 then
							v_u_43 = #v_u_44
						end
					end
					v_u_41(v_u_42, v50, v_u_43, v_u_49.Name)
				end)
			end
		end
	end
end
for _, v_u_51 in pairs(v_u_4.DragBar:GetChildren()) do
	if v_u_51:IsA("TextButton") then
		v_u_51.MouseButton1Down:Connect(function()
			-- upvalues: (ref) v_u_7, (copy) v_u_51, (copy) v_u_2, (copy) v_u_5, (copy) v_u_1, (copy) v_u_20
			if v_u_7 then
				v_u_7 = false
				if v_u_51.Name == "Minimise" then
					if v_u_51.TextLabel.Text == "-" then
						v_u_2.tweenService:Create(v_u_5, TweenInfo.new(0.5), {
							["Position"] = UDim2.new(0, 0, -0.8, 0)
						}):Play()
						v_u_51.TextLabel.Text = "+"
					else
						v_u_5.Parent.Visible = true
						v_u_2.tweenService:Create(v_u_5, TweenInfo.new(0.5), {
							["Position"] = UDim2.new(0, 0, 0.1, 0)
						}):Play()
						v_u_51.TextLabel.Text = "-"
					end
				elseif v_u_51.Name == "Close" then
					v_u_1:CloseMainFrame()
				elseif v_u_51.Name == "Back" then
					v_u_20(UDim2.new(1, 0, 0, 0), v_u_5.Home)
				end
				v_u_7 = true
			end
		end)
	end
end
function v_u_1.OpenMainFrame(_)
	-- upvalues: (copy) v_u_2
	v_u_2:GetModule("TopbarIcon"):select()
end
function v_u_1.CloseMainFrame(_)
	-- upvalues: (copy) v_u_2
	v_u_2:GetModule("TopbarIcon"):deselect()
end
v_u_1:CloseMainFrame()
v_u_12()
function v_u_1.ShowSpecificPage(_, p52, p53)
	-- upvalues: (copy) v_u_5, (ref) v_u_6, (copy) v_u_20, (copy) v_u_3, (copy) v_u_2, (copy) v_u_1, (copy) v_u_41
	for _, v54 in pairs(v_u_5:GetChildren()) do
		if v54.Name == p52 then
			if v_u_6 == v54 then
				v54.Visible = true
			else
				v_u_20(UDim2.new(-1, 0, 0, 0), v54, true)
			end
			local v55 = v_u_3[v54.Name]
			if v55 then
				local v56 = nil
				local v57 = nil
				for v58, v59 in pairs(v55) do
					local v60 = v54[v59]
					if v60.Name == p53 then
						v57 = v58
					elseif v60.Position.X.Scale == 0 then
						v56 = v58
					end
				end
				if v56 == nil then
					for v61 = 1, #v55 do
						if v61 ~= v57 then
							v56 = v61
						end
					end
				end
				if p52 == "Admin" and v_u_6.Name == "Admin" then
					spawn(function()
						-- upvalues: (ref) v_u_2
						v_u_2:GetModule("PageAdmin"):UpdatePages()
					end)
				end
				v_u_1:OpenMainFrame()
				if v54:FindFirstChild("NavigateButtons") then
					v_u_41(v54, v56, v57, "Left", true)
				end
			end
		else
			v54.Visible = false
		end
	end
end
v_u_1:ShowSpecificPage("Home")
for _, v_u_62 in pairs(v_u_2.warnings:GetChildren()) do
	v_u_62.CloseX.MouseButton1Down:Connect(function()
		-- upvalues: (copy) v_u_2
		v_u_2.warnings.Visible = false
	end)
	local v_u_63 = v_u_62:FindFirstChild("MainButton")
	if v_u_63 then
		local v_u_64 = true
		v_u_63.MouseButton1Down:Connect(function()
			-- upvalues: (ref) v_u_64, (copy) v_u_62, (copy) v_u_63, (copy) v_u_2
			if v_u_64 then
				v_u_64 = false
				if v_u_62.Name == "BuyFrame" then
					local v65 = v_u_63.ProductId.Value
					if v_u_63.ProductType.Value == "Gamepass" then
						v_u_2.marketplaceService:PromptGamePassPurchase(v_u_2.player, v65)
					else
						v_u_2.marketplaceService:PromptPurchase(v_u_2.player, v65)
					end
				elseif v_u_62.Name == "UnBan" then
					local v66 = v_u_62
					v66.LoadingButton.Visible = true
					v66.MainButton.Visible = false
					local v67 = v_u_2.signals.RequestCommand
					local v68 = v_u_2.pdata.Prefix
					local v69 = v_u_62.PlrName.Text
					v67:InvokeServer(v68 .. "undirectban " .. v69)
					v_u_2:GetModule("PageAdmin"):CreateBanland()
					local v70 = v_u_62
					v70.LoadingButton.Visible = false
					v70.MainButton.Visible = true
					v_u_2.warnings.Visible = false
				elseif v_u_62.Name == "PermRank" then
					local v71 = v_u_62
					v71.LoadingButton.Visible = true
					v71.MainButton.Visible = false
					local v72 = v_u_62.PlrName.Text
					local v73 = { v_u_2:GetModule("cf"):GetUserId(v72), v72 }
					v_u_2.signals.RemovePermRank:InvokeServer(v73)
					v_u_2:GetModule("PageAdmin"):CreateRanks()
					local v74 = v_u_62
					v74.LoadingButton.Visible = false
					v74.MainButton.Visible = true
					v_u_2.warnings.Visible = false
				elseif v_u_62.Name == "Teleport" then
					local v75 = v_u_62
					v75.LoadingButton.Visible = true
					v75.MainButton.Visible = false
					local v76 = v_u_62.MainButton.PlaceId.Value
					v_u_2.teleportService:Teleport(v76)
					v_u_2.teleportService.TeleportInitFailed:Wait()
					local v77 = v_u_62
					v77.LoadingButton.Visible = false
					v77.MainButton.Visible = true
				end
				v_u_64 = true
			end
		end)
	end
end
v_u_2.warnings.Visible = false
function v_u_1.DisplayPagesAccordingToRank(_, _)
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	for v78, v79 in pairs(v_u_2.settings.RankRequiredToViewPage) do
		local v80 = v_u_5.Home:FindFirstChild(v78)
		local v81 = tonumber(v79) or 0
		if v80 then
			if v78 == "About" or v78 == "Special" or v_u_2.pdata.Rank >= v81 then
				v80.RankBlocker.Visible = false
			else
				v80.RankBlocker.Visible = true
				local v82 = v_u_2:GetModule("cf"):GetRankName(v81)
				v80.RankBlocker.TextLabel.Text = v82 .. "+"
			end
		end
	end
end
local v83 = v_u_2.gui.MenuTemplates
for _, v84 in pairs(v83:GetChildren()) do
	if v84:IsA("Frame") then
		v84.Visible = false
	end
end
return v_u_1
