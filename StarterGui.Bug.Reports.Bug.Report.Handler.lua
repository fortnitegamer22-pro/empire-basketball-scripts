-- decompiled by Sentinel (took 2.238645ms)
local _ = game.Players.LocalPlayer
local v1 = script.Parent
local v_u_2 = v1:WaitForChild("Report.Frame")
local v3 = v1:WaitForChild("Open.Report.Frame")
local v_u_4 = v_u_2:WaitForChild("Report.Input.Box")
local v_u_5 = v_u_2:WaitForChild("Current.Characters")
local v_u_6 = v_u_2:WaitForChild("Send.Button")
local v_u_7 = v_u_2:WaitForChild("Please.Wait")
local v_u_8 = v_u_2:WaitForChild("Report.Status")
local v_u_9 = game:GetService("TweenService")
local v_u_10 = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BugReport")
function GetSpaces(p11)
	local v12 = 0
	for _, v13 in p11:split("") do
		if v13 == "" then
			v12 = v12 + 1
		end
	end
	return v12
end
v_u_4:GetPropertyChangedSignal("Text"):Connect(function()
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v14 = v_u_4.Text
	v_u_5.Text = #v14:split("") - GetSpaces(v14) .. "/200"
	v_u_5.TextColor3 = #v_u_4.Text:split("") < 20 and Color3.fromRGB(255, 0, 0) or 200 < #v_u_4.Text:split("") - GetSpaces(v14) and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(85, 255, 0)
end)
local v_u_15 = 0
v_u_6.MouseButton1Down:Connect(function()
	-- upvalues: (ref) v_u_15, (copy) v_u_8, (copy) v_u_6, (copy) v_u_10, (copy) v_u_4, (copy) v_u_7, (copy) v_u_2
	if 10 <= tick() - v_u_15 then
		v_u_8.Text = ""
		v_u_6.Text = "Sending.."
		local v16 = v_u_10:InvokeServer({
			["Report"] = v_u_4.Text
		})
		if v16 ~= true and v16 ~= nil then
			v_u_6.Text = "Send"
			if type(v16) == "string" then
				v_u_8.Visible = true
				v_u_8.Text = v16
				v_u_8.TextColor3 = Color3.fromRGB(255, 0, 0)
			end
			return
		end
		v_u_15 = tick()
		v_u_8.Text = "Report Sent"
		v_u_8.TextColor3 = Color3.fromRGB(85, 255, 0)
		v_u_8.Visible = true
		task.delay(10, function()
			-- upvalues: (ref) v_u_8
			v_u_8.Visible = false
		end)
		v_u_6.Visible = false
		v_u_7.Visible = true
		task.delay(0.5, function()
			-- upvalues: (ref) v_u_2
			v_u_2:SetAttribute("Opened", false)
		end)
		for v17 = 150, 0, -1 do
			task.wait()
			v_u_7.Text = v17
			task.wait(1)
		end
		v_u_6.Text = "Send"
		v_u_6.Visible = true
		v_u_7.Visible = false
	end
end)
local v_u_18 = v_u_10:InvokeServer("GetRequestTime")
if v_u_18 ~= nil then
	v_u_7.Visible = true
	v_u_6.Visible = false
	task.spawn(function()
		-- upvalues: (copy) v_u_18, (copy) v_u_7, (copy) v_u_6
		for v19 = 150 - math.floor(v_u_18), 0, -1 do
			v_u_7.Text = v19
			task.wait(1)
		end
		v_u_7.Visible = false
		v_u_6.Visible = true
	end)
end
local v_u_20 = v_u_2.Size
v_u_2.Size = UDim2.fromScale(v_u_20.X.Scale * 0.9, v_u_20.Y.Scale * 0.9)
v_u_2:GetAttributeChangedSignal("Opened"):Connect(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_9, (copy) v_u_20
	local v21 = v_u_2:GetAttribute("Opened")
	if v21 == true then
		v_u_2.Visible = true
	end
	local v22 = v_u_9:Create(v_u_2, TweenInfo.new(0.5), {
		["GroupTransparency"] = v21 and 0 or 1, 
		["Size"] = v21 and v_u_20 or UDim2.fromScale(v_u_20.X.Scale * 0.9, v_u_20.Y.Scale * 0.9)
	})
	v22:Play()
	if v21 == false then
		repeat
			task.wait()
		until v22.PlaybackState == Enum.PlaybackState.Completed or v_u_2:GetAttribute("Opened") == true
		if v_u_2:GetAttribute("Opened") == false then
			v_u_2.Visible = false
		end
	end
end)
v3.Button.MouseButton1Down:Connect(function()
	-- upvalues: (copy) v_u_2
	v_u_2:SetAttribute("Opened", not v_u_2:GetAttribute("Opened"))
end)
