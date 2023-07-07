-- decompiled by Sentinel (took 3.594574ms)
local v1 = {}
local v_u_2 = _G.HDAdminMain
local v_u_3 = {
	["custom"] = v_u_2.gui.MainFrame.Pages.Settings.Custom
}
local v_u_4 = v_u_2.settings.ThemeColors or {
	{ "Red", Color3.fromRGB(150, 0, 0) }, 
	{ "Orange", Color3.fromRGB(150, 75, 0) }, 
	{ "Brown", Color3.fromRGB(120, 80, 30) }, 
	{ "Yellow", Color3.fromRGB(130, 120, 0) }, 
	{ "Green", Color3.fromRGB(0, 120, 0) }, 
	{ "Blue", Color3.fromRGB(0, 100, 150) }, 
	{ "Purple", Color3.fromRGB(100, 0, 150) }, 
	{ "Pink", Color3.fromRGB(150, 0, 100) }, 
	{ "Black", Color3.fromRGB(60, 60, 60) }
}
local v5 = 6.1 / #v_u_4
local v_u_6 = v_u_3.custom["AB ThemeSelection"]
local v_u_7 = true
local function v_u_23(p8, p9)
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_6
	if p8 == nil then
		for _, v10 in pairs(v_u_4) do
			if v10[1] == v_u_2.pdata.Theme then
				p8 = v10[1]
				p9 = v10[2]
				break
			end
		end
	end
	if p8 then
		local v11 = {}
		for _, v12 in pairs(v_u_2.gui:GetDescendants()) do
			if v12:IsA("BoolValue") and v12.Name == "Theme" then
				local v13 = v12.Parent
				table.insert(v11, v13)
			end
		end
		for _, v14 in pairs(v11) do
			local v15
			if v14.Theme.Value then
				local v16, v17, v18 = Color3.toHSV(p9)
				v15 = Color3.fromHSV(v16, v17, v18 * 1.35)
			else
				v15 = p9
			end
			if v14:IsA("TextLabel") then
				local v19, v20, v21 = Color3.toHSV(p9)
				v14.TextColor3 = Color3.fromHSV(v19, v20, v21 * 2)
			else
				v14.BackgroundColor3 = v15
			end
		end
		for _, v22 in pairs(v_u_6:GetChildren()) do
			if v22:IsA("TextButton") then
				if v22.Name == p8 then
					v22.BorderSizePixel = 1
				else
					v22.BorderSizePixel = 0
				end
			end
		end
	end
end
for _, v24 in pairs(v_u_4) do
	local v_u_25 = v24[1]
	local v_u_26 = v24[2]
	local v27 = v_u_6.ThemeTemplate:Clone()
	v27.Name = v_u_25
	v27.UIAspectRatioConstraint.AspectRatio = v5
	v27.BackgroundColor3 = v_u_26
	v27.MouseButton1Down:Connect(function()
		-- upvalues: (ref) v_u_7, (copy) v_u_2, (copy) v_u_25, (copy) v_u_23, (copy) v_u_26
		if v_u_7 then
			v_u_7 = false
			local v28 = { "Theme", v_u_25 }
			v_u_2.signals.ChangeSetting:InvokeServer(v28)
			v_u_23(v_u_25, v_u_26)
			v_u_7 = true
		end
	end)
	v27.Visible = true
	v27.Parent = v_u_6
end
local function v_u_37()
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_23
	for _, v29 in pairs(v_u_3.custom:GetChildren()) do
		local v30 = v29.Name
		local v31 = string.sub(v30, 5)
		if v29:FindFirstChild("SettingValue") then
			v29.SettingName.TextLabel.Text = v31 .. ":"
			local v32 = v_u_2.pdata[v31]
			v29.SettingValue.TextBox.Text = tostring(v32)
			local v33 = nil
			local v34 = nil
			if string.sub(v31, 1, 5) == "Error" then
				v33 = "Error"
				v34 = 6
			elseif string.sub(v31, 1, 6) == "Notice" then
				v33 = "Notice"
				v34 = 7
			end
			if v33 then
				local v35 = v_u_2.audio[v33]
				local v36 = string.sub(v31, v34)
				if v36 == "SoundId" then
					v32 = "rbxassetid://" .. v32
				end
				v35[v36] = v32
			end
		end
	end
	v_u_23()
end
for _, v_u_38 in pairs(v_u_3.custom:GetChildren()) do
	local v39 = v_u_38.Name
	local v_u_40 = string.sub(v39, 5)
	if v_u_38:FindFirstChild("SettingValue") then
		local v_u_41 = true
		local v_u_42 = v_u_38.SettingValue.TextBox
		local v_u_43 = v_u_38.SettingValue.TextLabel
		v_u_38.SettingValue.TextBox.FocusLost:connect(function(_)
			-- upvalues: (ref) v_u_41, (copy) v_u_38, (copy) v_u_42, (copy) v_u_43, (copy) v_u_2, (copy) v_u_40, (copy) v_u_37
			if v_u_41 then
				local v44 = v_u_38.SettingValue.TextBox.Text
				v_u_41 = false
				v_u_42.Visible = false
				v_u_43.Visible = true
				v_u_43.Text = "Loading..."
				local v45 = { v_u_40, v44 }
				local v46 = v_u_2.signals.ChangeSetting:InvokeServer(v45)
				if v46 == "Success" then
					v_u_37()
					local v47 = "Notice"
					local v48 = v_u_40
					local v49 = string.sub(v48, 1, 5)
					if v49 ~= "Error" then
						if v49 ~= "Alert" then
							v49 = v47
						end
					end
					if v_u_40 == "Prefix" then
						v_u_2:GetModule("PageCommands"):CreateCommands()
					end
					local v50 = "Successfully changed \'" .. v_u_40 .. "\' to \'" .. v44 .. "\'"
					if v49 == "Alert" then
						v_u_2:GetModule("cf"):CreateNewCommandMenu("settings", { "Settings Alert", v50 }, 8, true)
					else
						v_u_2:GetModule("Notices"):Notice(v49, "Settings", v50)
					end
				else
					v_u_43.Text = v46
					wait(1)
				end
				v_u_42.Visible = true
				v_u_43.Visible = false
				v_u_38.SettingValue.TextBox.Text = tostring(v_u_2.pdata[v_u_40])
				v_u_41 = true
			end
		end)
	end
end
v_u_37()
local v_u_51 = v_u_3.custom["AX Restore"]
local v_u_52 = v_u_51.Loading
local v_u_53 = 0
v_u_51.MouseButton1Down:Connect(function()
	-- upvalues: (ref) v_u_53, (copy) v_u_51, (copy) v_u_52, (copy) v_u_2, (copy) v_u_37
	if v_u_53 < 2 then
		local v54, v55, v56 = Color3.toHSV(v_u_51.BackgroundColor3)
		v_u_52.BackgroundColor3 = Color3.fromHSV(v54, v55, v56 * 0.5)
		v_u_52.Visible = true
		if v_u_53 == 0 then
			v_u_53 = 1
			v_u_52.Blocker.Visible = false
			v_u_52.TextLabel.Text = "Confirm?"
			wait(1)
		elseif v_u_53 == 1 then
			v_u_53 = 2
			v_u_52.Blocker.Visible = true
			v_u_52.TextLabel.Text = "Loading..."
			local v57 = v_u_2.signals.RestoreDefaultSettings:InvokeServer()
			if v57 == "Success" then
				v_u_37()
				v_u_2:GetModule("PageCommands"):CreateCommands()
				local v58 = v_u_2:GetModule("cf"):FormatNotice("RestoreDefaultSettings")
				v_u_2:GetModule("Notices"):Notice("Notice", v58[1], v58[2])
			else
				v_u_51.TextLabel.Text = v57
			end
			wait(1)
		end
		v_u_53 = 0
		v_u_52.Visible = false
		v_u_52.Blocker.Visible = false
	end
end)
local v59 = v_u_3.custom["AA Space"]
local v60 = v_u_3.custom["AZ Space"]
v_u_3.custom.CanvasSize = UDim2.new(0, 0, 0, v60.AbsolutePosition.Y - v59.AbsolutePosition.Y + v60.AbsoluteSize.Y * 1)
return v1
