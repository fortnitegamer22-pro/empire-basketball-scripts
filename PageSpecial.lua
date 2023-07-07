-- decompiled by Sentinel (took 1.802627ms)
local v_u_1 = {}
local v_u_2 = _G.HDAdminMain
local v_u_3 = {
	["donor"] = v_u_2.gui.MainFrame.Pages.Special.Donor
}
local v4 = v_u_3.donor.TemplateGame
local v_u_5 = v_u_3.donor["A Space"]
local v_u_6 = v_u_3.donor["AZ Space"]
local v_u_7 = v_u_3.donor["AG Unlock"]
local v_u_8 = v_u_2.warnings.Teleport
local v_u_9 = {}
for _, v10 in pairs(v_u_2.commandInfo) do
	if v10.RankName == "Donor" then
		table.insert(v_u_9, v10)
	end
end
local v11 = {}
repeat
	wait()
	local v12 = v_u_2:GetModule("cf")
until v12.RandomiseTable
local v13 = v12:RandomiseTable(v11, 86400)
for v14, v15 in pairs(v13) do
	local v_u_16 = v15[1]
	local v_u_17 = v15[2]
	local v18 = v14 / 2
	local v19 = math.ceil(v18)
	local v20 = v14 % 2
	local v21
	if v20 == 1 then
		v21 = v4:Clone()
		v21.Name = "AI Game" .. v19
		v21.Visible = true
		v21.Parent = v_u_3.donor
	else
		v21 = v_u_3.donor["AI Game" .. v19]
	end
	local v22 = v21["GameImage" .. v20]
	local v23 = v21["GameName" .. v20]
	local v_u_24 = "https://assetgame.roblox.com/Game/Tools/ThumbnailAsset.ashx?aid=" .. v_u_16 .. "&fmt=png&wd=420&ht=420"
	v22.Image = v_u_24
	v23.Text = v_u_17
	v22.Visible = true
	v23.Visible = true
	local v25 = v22.Select
	local v_u_26 = v22.ClickFrame
	v25.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_8, (copy) v_u_24, (copy) v_u_17, (copy) v_u_16, (copy) v_u_2
		v_u_8.ImageLabel.Image = v_u_24
		v_u_8.TeleportTo.TextLabel.Text = v_u_17 .. "?"
		v_u_8.MainButton.PlaceId.Value = v_u_16
		v_u_2:GetModule("cf"):ShowWarning("Teleport")
	end)
	v25.MouseEnter:Connect(function()
		-- upvalues: (copy) v_u_2, (copy) v_u_26
		if not v_u_2.warnings.Visible then
			v_u_26.Visible = true
		end
	end)
	v25.MouseLeave:Connect(function()
		-- upvalues: (copy) v_u_26
		v_u_26.Visible = false
	end)
	v_u_8.Visible = true
end
v_u_3.donor["AG Unlock"].Unlock.MouseButton1Down:Connect(function()
	-- upvalues: (copy) v_u_2
	v_u_2.marketplaceService:PromptGamePassPurchase(v_u_2.player, v_u_2.products.Donor)
end)
function v_u_1.SetupDonorCommands(_)
	-- upvalues: (copy) v_u_2, (copy) v_u_9, (copy) v_u_3, (copy) v_u_1
	v_u_2:GetModule("PageCommands"):SetupCommands(v_u_9, v_u_3.donor, 0)
	v_u_1:UpdateDonorFrame()
end
function v_u_1.UpdateDonorFrame(_)
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6, (copy) v_u_5
	if v_u_2.pdata.Donor then
		v_u_7.Visible = false
	else
		v_u_7.Visible = true
	end
	v_u_3.donor.CanvasSize = UDim2.new(0, 0, 0, v_u_6.AbsolutePosition.Y - v_u_5.AbsolutePosition.Y + v_u_6.AbsoluteSize.Y * 1)
end
return v_u_1
