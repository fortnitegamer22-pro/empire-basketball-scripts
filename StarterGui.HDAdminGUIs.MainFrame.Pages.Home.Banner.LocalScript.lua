-- decompiled by Sentinel (took 3.877382ms)
local v1 = game:GetService("MarketplaceService"):GetProductInfo(1128442562, Enum.InfoType.Product)
local v2 = v1.Description
if v2:match("##") then
	return
else
	local v3 = {}
	for _, v4 in pairs((v2:split(" || "))) do
		local v5 = v4:find(":")
		local v6 = v4:sub(1, v5 - 1)
		local v7 = v4:sub(v5 + 1)
		local v8 = tonumber(v7)
		local v9
		if v7:lower() == "true" then
			v9 = true
		elseif v7:lower() == "false" then
			v9 = false
		elseif v7 == "nil" then
			v9 = nil
		else
			v9 = v8 or v7
		end
		v3[v6] = v9
	end
	local v10
	if type(v3.startEpoch) == "number" then
		v10 = v3.startEpoch * 100
	else
		v10 = false
	end
	local v11
	if type(v3.runningTime) == "number" then
		v11 = v3.runningTime
	else
		v11 = false
	end
	local v12
	if type(v3.endEpoch) == "number" then
		v12 = v3.endEpoch * 100
	else
		v12 = false
	end
	if v10 then
		if v12 then
			v11 = v12
		elseif v11 then
			if v10 then
				v11 = v10 + v11
			else
				v11 = v10
			end
		end
	else
		if v11 then
			if v12 then
				v10 = v12 - v11
			else
				v10 = v12
			end
		else
			v10 = v11
		end
		v11 = v12
	end
	local v13 = v11 + (type(v3.countdownExtension) == "number" and v3.countdownExtension or 0)
	local v14 = v3.countdown == true
	local v15 = os.time()
	local v16 = game:GetService("RunService").Heartbeat
	local v17 = script.Parent
	local v18 = v17.CountFrame
	local v19 = v18.Count
	local v20 = v18.Caption
	local v21 = v17.Parent.NavigateLabel
	local v22 = v17.Parent.NoticesLabel
	local v23 = v17.TextBox
	local v24 = v17.TagIcon
	local v25 = { 60, 300, 1200 }
	local v26 = v3.tag
	if v26 then
		v23.Text = "roblox.com/games/6071412982/" .. v26
		v23.Visible = true
		v24.Visible = true
	else
		v23.Visible = false
		v24.Visible = false
	end
	v18.Visible = v14
	v20.Text = v3.countdownCaption or ""
	v17.Image = "rbxassetid://" .. v1.IconImageAssetId
	if v13 > v15 then
		while os.time() < v10 do
			v16:Wait()
		end
		v21.Visible = false
		v22.Visible = false
		v17.Visible = true
		local v27 = nil
		while os.time() < v11 do
			local v28 = os.time()
			if v28 == v27 then
				v28 = v27
			elseif v14 then
				local v29 = v11 - v28
				local v30 = v29 / 3600
				local v31 = (v30 - math.floor(v30)) * 60
				local v32 = (v31 - math.floor(v31)) * 60
				local v33 = tostring((math.floor(v30 + 1e-6)))
				if v33 == "60" then
					v33 = "00"
				elseif #v33 == 1 then
					v33 = "0" .. v33
				end
				local v34 = ":"
				local v35 = tostring((math.floor(v31 + 1e-6)))
				if v35 == "60" then
					v35 = "00"
				elseif #v35 == 1 then
					v35 = "0" .. v35
				end
				local v36 = ":"
				local v37 = tostring((math.floor(v32 + 1e-6)))
				if v37 == "60" then
					v37 = "00"
				elseif #v37 == 1 then
					v37 = "0" .. v37
				end
				v19.Text = v33 .. v34 .. v35 .. v36 .. v37
				if table.find(v25, v29) or v29 % 3600 == 0 then
					local v38 = game:GetService("ReplicatedStorage"):FindFirstChild("HDAdmin")
					if v38 then
						v38 = v38:FindFirstChild("Topbar+")
					end
					if v38 then
						v38 = require(v38.IconController)
					end
					if v38 then
						v38 = v38:getIcon("HDAdmin")
					end
					if v38 then
						if v38.toggleStatus ~= "selected" then
							v38:notify(v38.selected)
						end
					end
				end
			else
				v28 = v27
			end
			v16:Wait()
			v27 = v28
		end
		v18.Visible = false
		while os.time() < v13 do
			v16:Wait()
		end
		v21.Visible = true
		v22.Visible = true
		v17.Visible = false
	end
end
