-- decompiled by Sentinel (took 1.982546ms)
local v1 = game.Players.LocalPlayer
local v_u_2 = v1.Character or v1.CharacterAdded:Wait()
local v_u_3 = script.Parent
local v_u_4 = v_u_3.Template
local v_u_5 = game:GetService("TweenService")
local v_u_6 = {
	["Bronze"] = Color3.fromRGB(102, 62, 29), 
	["Silver"] = Color3.fromRGB(130, 130, 130), 
	["Gold"] = Color3.fromRGB(130, 119, 0), 
	["Diamond"] = Color3.fromRGB(24, 91, 136)
}
local v_u_7 = {
	["Bronze"] = Color3.fromRGB(214, 134, 64), 
	["Silver"] = Color3.fromRGB(175, 175, 175), 
	["Gold"] = Color3.fromRGB(255, 255, 0), 
	["Diamond"] = Color3.fromRGB(20, 200, 255)
}
local v_u_8 = {
	["Unchallenged Finisher"] = {
		["ID"] = "rbxassetid://13117019587"
	}, 
	["Quick Handles"] = {
		["ID"] = "rbxassetid://13117046772"
	}, 
	["Ankle Breaker"] = {
		["ID"] = "rbxassetid://13117121521"
	}, 
	["Sharp Sight"] = {
		["ID"] = "rbxassetid://13117233280", 
		["Position"] = UDim2.new(0, 0, -0.01, 0)
	}, 
	["Levitation"] = {
		["ID"] = "rbxassetid://13117266402"
	}, 
	["Steady Scorer"] = {
		["ID"] = "rbxassetid://13158274495"
	}, 
	["Electromagnet"] = {
		["ID"] = "rbxassetid://13158290045"
	}, 
	["Space Creator"] = {
		["ID"] = "rbxassetid://13158298045"
	}, 
	["Deep Shooter"] = {
		["ID"] = "rbxassetid://13158413945"
	}, 
	["Inside Shooter"] = {
		["ID"] = "rbxassetid://13158422997"
	}, 
	["Acrobat"] = {
		["ID"] = "rbxassetid://13158484164"
	}, 
	["Posterizer"] = {
		["ID"] = "rbxassetid://13285836368"
	}, 
	["Finishing Ace"] = {
		["ID"] = "rbxassetid://13285923053"
	}, 
	["Dimer"] = {
		["ID"] = "rbxassetid://13564653475"
	}, 
	["Thief"] = {
		["ID"] = "rbxassetid://13564700098"
	}, 
	["Shot-Contestor"] = {
		["ID"] = "rbxassetid://13564743427"
	}, 
	["Consistent Finisher"] = {
		["ID"] = "rbxassetid://13564780088"
	}, 
	["Hot Finisher"] = {
		["ID"] = "rbxassetid://13564802689"
	}, 
	["Hot Shot"] = {
		["ID"] = "rbxassetid://13564824017"
	}, 
	["Rebounder"] = {
		["ID"] = "rbxassetid://13564863540"
	}, 
	["Contact Expert"] = {
		["ID"] = "rbxassetid://13564879971"
	}
}
local function v_u_13(p9, p10)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_8, (copy) v_u_5
	for _, v11 in pairs(v_u_3:GetChildren()) do
		if v11.Name ~= "Template" and v11.Name == p9 then
			v11:Destroy()
		end
	end
	if p10 ~= "No" then
		local v_u_12 = v_u_4:Clone()
		v_u_12.Name = p9
		v_u_12.Visible = true
		v_u_12.Parent = v_u_3
		v_u_12.BackgroundColor3 = v_u_6[p10]
		v_u_12.TextLabel.Text = p9
		if v_u_8[v_u_12.Name] then
			v_u_12.ImageLabel.Image = v_u_8[v_u_12.Name].ID
			if v_u_8[v_u_12.Name].Position then
				v_u_12.ImageLabel.Position = v_u_8[v_u_12.Name].Position
			end
		end
		v_u_12.InputBegan:Connect(function()
			-- upvalues: (ref) v_u_5, (copy) v_u_12
			v_u_5:Create(v_u_12.TextLabel, TweenInfo.new(0.25), {
				["TextTransparency"] = 0
			}):Play()
		end)
		v_u_12.InputEnded:Connect(function()
			-- upvalues: (ref) v_u_5, (copy) v_u_12
			v_u_5:Create(v_u_12.TextLabel, TweenInfo.new(0.15), {
				["TextTransparency"] = 1
			}):Play()
		end)
	end
end
local function v_u_16(p14, p15)
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_7, (copy) v_u_2, (copy) v_u_6
	v_u_5:Create(v_u_3[p14], TweenInfo.new(0.2), {
		["BackgroundColor3"] = v_u_7[p15]
	}):Play()
	v_u_5:Create(v_u_3[p14].ImageLabel, TweenInfo.new(0.2), {
		["ImageTransparency"] = 0
	}):Play()
	if p14 == "Quick Handles" then
		repeat
			task.wait(2.35)
		until v_u_2:GetAttribute("Dribbling") == false
	else
		task.wait(2.35)
	end
	v_u_5:Create(v_u_3[p14], TweenInfo.new(0.3), {
		["BackgroundColor3"] = v_u_6[p15]
	}):Play()
	v_u_5:Create(v_u_3[p14].ImageLabel, TweenInfo.new(0.2), {
		["ImageTransparency"] = 0.5
	}):Play()
end
game.ReplicatedStorage.Remotes.SendBadges.OnClientEvent:Connect(function(p17, p18, p19)
	-- upvalues: (copy) v_u_13, (copy) v_u_16
	if p19.Type == "ShowBadge" then
		v_u_13(p17 or "Dimer", p18 or "Diamond")
	elseif p19.Type == "LightBadge" then
		v_u_16(p17 or "Dimer", p18 or "Diamond")
	end
end)
