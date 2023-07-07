-- decompiled by Sentinel (took 4.219317ms)
local v1 = {}
local v_u_2 = _G.HDAdminMain
local v_u_3 = Instance.new("Folder")
v_u_3.Name = "MessageContainer"
v_u_3.Parent = v_u_2.gui
for _, v4 in pairs({ "Messages", "Hints" }) do
	local v5 = Instance.new("Frame")
	v5.Size = UDim2.new(1, 0, 1, 0)
	v5.Position = UDim2.new(0, 0, 0, 0)
	v5.BackgroundTransparency = 1
	v5.Name = v4
	if v4 == "Hints" then
		Instance.new("UIListLayout").Parent = v5
	end
	v5.Parent = v_u_3
end
local function v_u_12(p6, p7, p8)
	-- upvalues: (copy) v_u_2
	for _, v9 in pairs(p6) do
		local v10
		if v9:IsA("Frame") then
			v10 = p7 < 0.35 and 0.35 or p7
		else
			v10 = p7
		end
		local v11 = {
			[v9:IsA("Frame") and "BackgroundTransparency" or v9:IsA("TextLabel") and "TextTransparency" or v9:IsA("ImageLabel") and "ImageTransparency" or nil] = v10
		}
		v_u_2.tweenService:Create(v9, TweenInfo.new(p8), v11):Play()
	end
	wait(p8)
end
local function v_u_14(p13)
	return {
		{ p13.Bg }, 
		{ p13.Title, p13.SubTitle, p13.Pic }, 
		{ p13.Desc }
	}
end
function v1.Message(_, p15)
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_12, (copy) v_u_14
	local v16 = v_u_3.Messages
	local v17 = p15[1]
	local v18 = p15[2]
	local v19 = p15[3]
	local v20 = p15[4]
	local v21 = p15[5]
	local v22 = p15[6]
	local v23 = v_u_2.templates.Message:Clone()
	for _, v24 in pairs(v23:GetChildren()) do
		v24[v24:IsA("Frame") and "BackgroundTransparency" or v24:IsA("TextLabel") and "TextTransparency" or v24:IsA("ImageLabel") and "ImageTransparency" or nil] = 1
	end
	v23.Visible = true
	if v18 == "Countdown" then
		local v_u_25 = { v23.Bg, v23.Title, v23.Desc }
		v23.Title.Text = "Countdown"
		v23.Title.TextColor3 = Color3.fromRGB(200, 200, 200)
		v23.Desc.TextColor3 = v22
		v23.Parent = v16
		spawn(function()
			-- upvalues: (ref) v_u_12, (copy) v_u_25
			v_u_12(v_u_25, 0, 0.4)
		end)
		for v26 = 1, v21 do
			v23.Desc.Text = v21 + 1 - v26
			wait(1)
		end
		v_u_12(v_u_25, 1, 0.4)
	else
		v23.Title.Text = v19
		v23.SubTitle.Text = v19
		v23.Desc.Text = v21
		v23.Desc.TextColor3 = v22
		if v18 == "Server" or v17 == nil then
			v23.Pic.Visible = false
			v23.SubTitle.Visible = false
		else
			local v27 = v_u_2.textService:GetTextSize(v19, v23.Title.TextSize, v23.Title.Font, Vector2.new(0, 0))
			v23.Pic.Position = UDim2.new(0.5, -(v27.X / 2 + 75))
			v23.Pic.Image = v_u_2:GetModule("cf"):GetUserImage(v17.UserId)
			v23.SubTitle.Text = v20
		end
		v23.Parent = v16
		local v28 = v_u_14(v23)
		for v29 = 1, #v28 do
			v_u_12(v28[v29], 0, 0.4)
		end
		wait(v_u_2:GetModule("cf"):GetMessageTime(v21))
		for v30 = 1, #v28 do
			v_u_12(v28[#v28 + 1 - v30], 1, 0.4)
		end
	end
	v23:Destroy()
end
function v1.Hint(_, p31)
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_12
	local v32 = v_u_3.Hints
	local v33 = p31[1]
	local v34 = p31[2]
	local v35 = p31[3]
	local v_u_36 = {}
	local v37 = v_u_2.templates.Hint:Clone()
	for _, v38 in pairs(v37:GetChildren()) do
		v38[v38:IsA("Frame") and "BackgroundTransparency" or v38:IsA("TextLabel") and "TextTransparency" or v38:IsA("ImageLabel") and "ImageTransparency" or nil] = 1
		table.insert(v_u_36, v38)
	end
	v37.Desc.Text = v34
	v37.Desc.TextColor3 = v35
	v37.Parent = v32
	v37.Visible = true
	if v33 == "Countdown" then
		spawn(function()
			-- upvalues: (ref) v_u_12, (copy) v_u_36
			v_u_12(v_u_36, 0, 0.6)
		end)
		for v39 = 1, v34 do
			v37.Desc.Text = v34 + 1 - v39
			wait(1)
		end
		v_u_12(v_u_36, 1, 0.6)
	else
		v37.Desc.Text = v34
		v37.Desc.TextColor3 = v35
		v37.Parent = v32
		v_u_12(v_u_36, 0, 0.6)
		wait(v_u_2:GetModule("cf"):GetMessageTime(v34))
		v_u_12(v_u_36, 1, 0.6)
	end
	v37:Destroy()
end
function v1.GlobalAnnouncement(_, p40)
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_14, (copy) v_u_12
	local v41 = v_u_3.Messages
	local v42 = v_u_2.templates.GlobalAnnouncement:Clone()
	local v43 = p40.DisplayFrom
	for _, v44 in pairs(v42:GetChildren()) do
		v44[v44:IsA("Frame") and "BackgroundTransparency" or v44:IsA("TextLabel") and "TextTransparency" or v44:IsA("ImageLabel") and "ImageTransparency" or nil] = 1
	end
	v42.Visible = true
	v42.Title.Text = p40.Title
	v42.Pic.Visible = v43
	v42.SubTitle.Visible = v43
	local v45 = v_u_2.textService:GetTextSize(v42.SubTitle.Text, v42.SubTitle.TextSize, v42.SubTitle.Font, Vector2.new(0, 0))
	v42.Pic.Position = UDim2.new(0.5, -(v45.X / 2 + 30), 0, 60)
	if v43 then
		v42.Pic.Image = v_u_2:GetModule("cf"):GetUserImage(p40.SenderId)
		v42.SubTitle.Text = "From " .. p40.SenderName
	end
	v42.Desc.TextColor3 = Color3.new(p40.Color[1], p40.Color[2], p40.Color[3])
	v42.Desc.Text = p40.Message
	v42.Parent = v41
	local v46 = v_u_14(v42)
	for v47 = 1, #v46 do
		v_u_12(v46[v47], 0, 0.4)
	end
	wait(v_u_2:GetModule("cf"):GetMessageTime(p40.Message) * 1.5)
	for v48 = 1, #v46 do
		v_u_12(v46[#v46 + 1 - v48], 1, 0.4)
	end
	v42:Destroy()
end
function v1.ClearMessageContainer(_)
	-- upvalues: (copy) v_u_3
	for _, v49 in pairs(v_u_3:GetChildren()) do
		for _, v50 in pairs(v49:GetChildren()) do
			if v50:IsA("Frame") then
				v50.Visible = false
			end
		end
	end
end
return v1
