-- decompiled by Sentinel (took 7.487219ms)
local v_u_1 = {}
local v_u_2 = _G.HDAdminMain
local v_u_3 = v_u_2.gui.MainFrame.Pages.Admin
local v_u_4 = v_u_2.warnings.BuyFrame
local _ = v_u_2.warnings.UnBan
local v_u_5 = {
	["ranks"] = v_u_3.Ranks, 
	["serverRanks"] = v_u_3["Server Ranks"], 
	["banland"] = v_u_3.Banland
}
local v_u_6 = {
	["rankTitle"] = v_u_5.ranks.TemplateRankTitle, 
	["rankItem"] = v_u_5.ranks.TemplateRankItem, 
	["space"] = v_u_5.ranks.TemplateSpace, 
	["admin"] = v_u_5.serverRanks.TemplateAdmin, 
	["ban"] = v_u_5.banland.TemplateBan, 
	["banTitle"] = v_u_5.banland.TemplateTitle
}
local v_u_7 = {
	{ "friends", v_u_2.ownerName .. "\'s Friends", "For friends of the Owner" }, 
	{ "freeadmin", "Free Admin", "For everyone" }, 
	{ "vipserverowner", "VIP Server Owner", "For VIP Server owners" }, 
	{ "vipserverplayer", "VIP Server Player", "For VIP Server players" }
}
function v_u_1.SetupRanks(_)
	-- upvalues: (copy) v_u_1
	v_u_1:CreateRanks()
end
function v_u_1.CreateRanks(_)
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_4
	coroutine.wrap(function()
		-- upvalues: (ref) v_u_2, (ref) v_u_7, (ref) v_u_5, (ref) v_u_6, (ref) v_u_4
		local v8 = v_u_2.signals.RetrieveRanksInfo:InvokeServer()
		local v9 = v8.PermRanks
		local v10 = v8.Ranks
		local v11 = v8.Permissions
		local v12 = {}
		local v13 = {}
		for _, v14 in pairs(v10) do
			local v15 = {
				v14[1], 
				v14[2], 
				{}
			}
			table.insert(v13, 1, v15)
		end
		for v16, v17 in pairs(v13) do
			v12[v17[1]] = v16
		end
		for v18, v19 in pairs(v11) do
			if v18 == "owner" and v12[5] then
				local v20 = v13[v12[5]][3]
				local v21 = { v_u_2.ownerName, "Owner", v_u_2:GetModule("cf"):GetUserImage(v_u_2.ownerId) }
				table.insert(v20, v21)
			elseif v18 == "specificusers" then
				for v22, v23 in pairs(v19) do
					if 1 < #v22 then
						local v24 = v13[v12[v23]]
						local v25 = { v22, "Specific User", v_u_2:GetModule("cf"):GetUserImage(v_u_2:GetModule("cf"):GetUserId(v22)) }
						local v26 = v24[3]
						table.insert(v26, v25)
					end
				end
				for _, v27 in pairs(v9) do
					local v28 = not v27.RemoveRank and v13[v12[v27.Rank]]
					if v28 then
						local v29 = {
							v_u_2:GetModule("cf"):GetName(v27.UserId), 
							"PermRank", 
							v_u_2:GetModule("cf"):GetUserImage(v27.UserId), 
							v27
						}
						local v30 = v28[3]
						table.insert(v30, v29)
					end
				end
			elseif v18 == "gamepasses" then
				for v31, v32 in pairs(v19) do
					local v33 = not v_u_2:GetModule("cf"):FindValue(v_u_2.products, v31) and v13[v12[v32.Rank]]
					if v33 then
						local v34 = {
							v32.Name, 
							"Gamepass", 
							v32.IconImageAssetId, 
							tonumber(v31), 
							v32.PriceInRobux
						}
						local v35 = v33[3]
						table.insert(v35, v34)
					end
				end
			elseif v18 == "assets" then
				for v36, v37 in pairs(v19) do
					local v38 = v13[v12[v37.Rank]]
					if v38 then
						local v39 = {
							v37.Name, 
							"Asset", 
							v_u_2:GetModule("cf"):GetAssetImage(v36), 
							tonumber(v36), 
							v37.PriceInRobux
						}
						local v40 = v38[3]
						table.insert(v40, v39)
					end
				end
			elseif v18 == "groups" then
				for v41, v42 in pairs(v19) do
					for v43, v44 in pairs(v42.Roles) do
						local v45 = v44.Rank and v13[v12[v44.Rank]]
						if v45 then
							local v46 = {
								v42.Name .. " | " .. v43, 
								"Group", 
								v42.EmblemUrl, 
								tonumber(v41)
							}
							local v47 = v45[3]
							table.insert(v47, v46)
						end
					end
				end
			elseif v_u_7[v18] then
				local v48 = v_u_7[v18]
				local v49 = v11[v48[1]]
				local v50 = 0 < v49 and v13[v12[v49]]
				if v50 then
					local v51 = {}
					local v52 = v48[2]
					local v53 = v48[3]
					local v54 = string.upper
					local v55 = v48[1]
					__set_list(v51, 1, {v52, v53, v54((string.sub(v55, 1, 1)))})
					local v56 = v50[3]
					table.insert(v56, v51)
				end
			end
		end
		local v57 = v_u_2.pdata.Rank >= (v_u_2.commandRanks.permrank or 4)
		v_u_2:GetModule("cf"):ClearPage(v_u_5.ranks)
		local v58 = 0
		for _, v59 in pairs(v13) do
			local v60 = v59[1]
			local v_u_61 = v59[2]
			local v62 = v59[3]
			v58 = v58 + 1
			local v63 = v_u_6.rankTitle:Clone()
			v63.Name = "Label" .. v58
			v63.RankIdFrame.TextLabel.Text = v60
			v63.RankName.Text = v_u_61
			v63.Visible = true
			v63.Parent = v_u_5.ranks
			for _, v64 in pairs(v62) do
				v58 = v58 + 1
				local v_u_65 = v64[1]
				local v_u_66 = v64[2]
				local v_u_67 = v64[3]
				local v68 = v_u_6.rankItem:Clone()
				v68.Name = "Label" .. v58
				v68.ItemTitle.Text = v_u_65
				v68.ItemDesc.Text = v_u_66
				if #tostring(v_u_67) == 1 then
					v68.ItemIcon.Text = v_u_67
					v68.ItemIcon.Visible = true
					v68.ItemImage.Visible = false
				else
					if tonumber(v_u_67) then
						v_u_67 = "rbxassetid://" .. v_u_67
					end
					v68.ItemImage.Image = tostring(v_u_67)
				end
				v68.Unlock.Visible = false
				v68.ViewMore.Visible = false
				local v69
				if v_u_66 == "Gamepass" or v_u_66 == "Asset" then
					local v_u_70 = v64[4]
					local v_u_71 = v64[5]
					v68.ItemImage.BackgroundTransparency = 1
					v68.Unlock.Visible = true
					v68.Unlock.MouseButton1Down:Connect(function()
						-- upvalues: (ref) v_u_4, (copy) v_u_65, (ref) v_u_67, (copy) v_u_61, (ref) v_u_2, (copy) v_u_71, (copy) v_u_70, (copy) v_u_66
						v_u_4.ProductName.Text = v_u_65
						v_u_4.ProductImage.Image = v_u_67
						v_u_4.PurchaseToUnlock.TextLabel.Text = v_u_61
						v_u_4.InGame.TextLabel.Text = v_u_2.gameName
						v_u_4.MainButton.Price.Text = (v_u_71 or 0) .. " "
						v_u_4.MainButton.ProductId.Value = v_u_70
						v_u_4.MainButton.ProductType.Value = v_u_66
						v_u_2:GetModule("cf"):ShowWarning("BuyFrame")
					end)
					v69 = 0.4
				elseif v_u_66 == "PermRank" then
					local v_u_72 = v64[4]
					if v57 then
						local v73 = v68.ViewMore
						v73.Visible = true
						v73.MouseButton1Down:Connect(function()
							-- upvalues: (ref) v_u_2, (copy) v_u_65, (copy) v_u_72
							v_u_2:GetModule("cf"):ShowPermRankedUser({ v_u_65, v_u_72.UserId, v_u_72.RankedBy })
						end)
						v69 = 0.6
					else
						v69 = 0.6
					end
				else
					v69 = 0.7
				end
				v68.ItemTitle.Size = UDim2.new(v69, 0, v68.ItemTitle.Size.Y.Scale, 0)
				v68.ItemDesc.Size = UDim2.new(v69, 0, v68.ItemDesc.Size.Y.Scale, 0)
				v68.Visible = true
				v68.Parent = v_u_5.ranks
			end
		end
		if 2 <= v58 then
			for _ = 1, 2 do
				local v74 = v_u_5.ranks.Label1
				local v75 = v_u_5.ranks["Label" .. v58]
				v_u_5.ranks.CanvasSize = UDim2.new(0, 0, 0, v75.AbsolutePosition.Y + v75.AbsoluteSize.Y - v74.AbsolutePosition.Y)
			end
		end
	end)()
end
function v_u_1.CreateServerRanks(_)
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_6
	coroutine.wrap(function()
		-- upvalues: (ref) v_u_2, (ref) v_u_5, (ref) v_u_6
		local v76 = v_u_2.signals.RetrieveServerRanks:InvokeServer()
		local v77 = {}
		local v78 = {}
		for _, v79 in pairs(v_u_2.settings.Ranks) do
			local v80 = {
				v79[1], 
				v79[2], 
				{}
			}
			table.insert(v78, 1, v80)
		end
		for v81, v82 in pairs(v78) do
			v77[v82[1]] = v81
		end
		for _, v83 in pairs(v76) do
			local v84 = v83.Player
			local v85 = v83.RankId
			local v86 = v83.RankType
			local v87 = v78[v77[v85]]
			if v87 then
				local v88 = v87[3]
				table.insert(v88, { v84, v86 })
			end
		end
		for _, v89 in pairs(v78) do
			local v90 = v89[3]
			table.sort(v90, function(p91, p92)
				return p91[2] < p92[2]
			end)
		end
		v_u_2:GetModule("cf"):ClearPage(v_u_5.serverRanks)
		local v93 = {}
		for v94, v95 in pairs(v_u_2.rankTypes) do
			v93[v95] = v94
		end
		local v96 = 0
		for _, v97 in pairs(v78) do
			local _ = v97[1]
			local v98 = v97[2]
			local v99 = v97[3]
			for _, v100 in pairs(v99) do
				v96 = v96 + 1
				local v101 = v100[1]
				local v102 = v93[v100[2]]
				local v103 = v_u_6.admin:Clone()
				v103.Name = "Label" .. v96
				v103.PlrName.Text = v101.Name
				v103.PlrRank.Text = v98 .. " (" .. v102 .. ")"
				v103.PlayerImage.Image = v_u_2:GetModule("cf"):GetUserImage(v101.UserId)
				v103.BackgroundColor3 = v_u_2:GetModule("cf"):GetLabelBackgroundColor(v96)
				v103.Visible = true
				v103.Parent = v_u_5.serverRanks
			end
		end
		v_u_5.serverRanks.CanvasSize = UDim2.new(0, 0, 0, v96 * v_u_6.admin.AbsoluteSize.Y)
	end)()
end
local v_u_104 = true
function v_u_1.CreateBanland(_)
	-- upvalues: (ref) v_u_104, (copy) v_u_2, (copy) v_u_5, (copy) v_u_6
	coroutine.wrap(function()
		-- upvalues: (ref) v_u_104, (ref) v_u_2, (ref) v_u_5, (ref) v_u_6
		if v_u_104 then
			v_u_104 = false
			local v105 = 0
			if v_u_2.pdata.Rank < v_u_2.settings.ViewBanland then
				v_u_2:GetModule("cf"):ClearPage(v_u_5.banland)
				local v106 = v_u_6.banTitle:Clone()
				v106.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
				v106.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				v106.TextLabel.Text = "Must be rank \'" .. v_u_2:GetModule("cf"):GetRankName(v_u_2.settings.ViewBanland) .. "\' or higher to view the Banland"
				v106.Name = "TitleLabel"
				v106.Visible = true
				v106.Parent = v_u_5.banland
			else
				local v107 = v_u_2.signals.RetrieveBanland:InvokeServer()
				local v108 = v_u_2.pdata.Rank >= (v_u_2.commandRanks.directban or 4)
				v_u_2:GetModule("cf"):ClearPage(v_u_5.banland)
				local v109 = { "Current Server", "All Servers" }
				for v110, v111 in pairs(v107) do
					if 0 < #v111 then
						local v112 = v_u_6.banTitle:Clone()
						v112.BackgroundColor3 = Color3.fromRGB(95, 95, 95)
						v112.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						v112.TextLabel.Text = v109[v110]
						v112.Name = "TitleLabel"
						v105 = v105 + v_u_6.banTitle.AbsoluteSize.Y
						v112.Visible = true
						v112.Parent = v_u_5.banland
					end
					for v113, v_u_114 in pairs(v111) do
						local v_u_115 = v_u_114.UserId
						if 0 < v_u_115 then
							v105 = v105 + v_u_6.ban.AbsoluteSize.Y
							local v116 = v_u_114.SettingsBan
							local v_u_117 = v_u_6.ban:Clone()
							v_u_117.Name = "BanLabel"
							v_u_117.PlrName.Text = v_u_2:GetModule("cf"):GetName(v_u_115)
							local v118 = v_u_114.BanTime
							local v119
							if tonumber(v118) then
								v119 = v_u_2:GetModule("cf"):GetBanDateString(os.date("*t", v118))
							else
								v119 = v116 and "Auto Settings Ban" or "Infinite"
							end
							v_u_117.BanLength.Text = v119
							v_u_117.PlayerImage.Image = v_u_2:GetModule("cf"):GetUserImage(v_u_115)
							v_u_117.BackgroundColor3 = v_u_2:GetModule("cf"):GetLabelBackgroundColor(v113)
							local v120 = v_u_117.ViewMore
							if v108 and not v116 then
								v120.Visible = true
								v120.MouseButton1Down:Connect(function()
									-- upvalues: (ref) v_u_2, (copy) v_u_117, (copy) v_u_115, (copy) v_u_114
									v_u_2:GetModule("cf"):ShowBannedUser({
										v_u_117.PlrName.Text, 
										v_u_115, 
										v_u_114.Reason, 
										v_u_114.BannedBy
									})
								end)
							else
								v120.Visible = false
							end
							v_u_117.Visible = true
							v_u_117.Parent = v_u_5.banland
						end
					end
				end
			end
			v_u_5.banland.CanvasSize = UDim2.new(0, 0, 0, v105)
			v_u_104 = true
		end
	end)()
end
function v_u_1.UpdatePages(_)
	-- upvalues: (copy) v_u_1
	v_u_1:CreateServerRanks()
	v_u_1:CreateBanland()
	v_u_1:CreateRanks()
end
spawn(function()
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_1
	while wait(20) do
		if v_u_3.Visible and v_u_2.gui.MainFrame.Visible then
			v_u_1:UpdatePages()
		end
	end
end)
return v_u_1
