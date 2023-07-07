-- decompiled by Sentinel (took 3.144268ms)
local v_u_1 = {
	["Groups"] = {
		{
			["GroupId"] = 1200769, 
			["ChatColor"] = Color3.new(1, 0.8431372549019608, 0)
		}
	}, 
	["Players"] = {
		{}
	}
}
(function()
	-- upvalues: (copy) v_u_1
	if v_u_1.Groups then
		for _, v2 in pairs(v_u_1.Groups) do
			local v_u_3 = v2.GroupId
			local v_u_4 = v2.Rank
			assert(type(v_u_4) == "nil" and true or type(v_u_4) == "number", "requiredRank must be a number or nil")
			function v2.IsInGroup(p_u_5)
				-- upvalues: (copy) v_u_4, (copy) v_u_3
				if not (p_u_5 and p_u_5.UserId) then
					return false
				end
				local _ = p_u_5.UserId
				local v_u_6 = false
				local v7, v8 = pcall(function()
					-- upvalues: (ref) v_u_4, (ref) v_u_6, (copy) p_u_5, (ref) v_u_3
					if v_u_4 then
						v_u_6 = v_u_4 < p_u_5:GetRankInGroup(v_u_3)
					else
						v_u_6 = p_u_5:IsInGroup(v_u_3)
					end
				end)
				if not v7 and v8 then
					print("Error checking in group: " .. v8)
				end
				return v_u_6
			end
		end
	end
end)()
local v_u_9 = game:GetService("Players")
local function v_u_14(p10)
	-- upvalues: (copy) v_u_1, (copy) v_u_9
	local v11 = v_u_1.Players and v_u_9:FindFirstChild(p10)
	if v11 then
		for _, v12 in pairs(v_u_1.Players) do
			if v11.UserId == v12.UserId then
				return v12.ChatColor
			end
		end
	end
	if v_u_1.Groups then
		for _, v13 in pairs(v_u_1.Groups) do
			if v13.IsInGroup(v_u_9:FindFirstChild(p10)) then
				return v13.ChatColor
			end
		end
	end
end
return function(p_u_15)
	-- upvalues: (copy) v_u_14, (copy) v_u_9
	local v_u_16 = {
		Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157), 
		Color3.new(0.00392156862745098, 0.6352941176470588, 1), 
		Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353), 
		BrickColor.new("Bright violet").Color, 
		BrickColor.new("Bright orange").Color, 
		BrickColor.new("Bright yellow").Color, 
		BrickColor.new("Light reddish violet").Color, 
		BrickColor.new("Brick yellow").Color
	}
	local function v_u_22(p17)
		local v18 = 0
		for v19 = 1, #p17 do
			local v20 = string.byte((string.sub(p17, v19, v19)))
			local v21 = #p17 - v19 + 1
			if #p17 % 2 == 1 then
				v21 = v21 - 1
			end
			if 2 <= v21 % 4 then
				v20 = -v20
			end
			v18 = v18 + v20
		end
		return v18
	end
	local function v29(p23)
		-- upvalues: (copy) p_u_15, (copy) v_u_16, (copy) v_u_22, (ref) v_u_14
		local v24 = p_u_15:GetSpeaker(p23)
		if not v24:GetExtraData("NameColor") then
			local v25 = "NameColor"
			local v26 = v24:GetPlayer()
			local v27
			if v26 and v26.Team ~= nil then
				v27 = v26.TeamColor.Color
			else
				v27 = v_u_16[(v_u_22(v24.Name) + 0) % #v_u_16 + 1]
			end
			v24:SetExtraData(v25, v27)
		end
		local v28 = not v24:GetExtraData("ChatColor") and v_u_14(p23)
		if v28 then
			v24:SetExtraData("ChatColor", v28)
		end
		if not v24:GetExtraData("Tags") then
			v24:SetExtraData("Tags", {})
		end
	end
	p_u_15.SpeakerAdded:connect(v29)
	for _, v30 in pairs(p_u_15:GetSpeakerList()) do
		v29(v30)
	end
	local v_u_31 = {}
	v_u_9.PlayerAdded:connect(function(p_u_32)
		-- upvalues: (copy) p_u_15, (copy) v_u_16, (copy) v_u_22, (copy) v_u_31
		v_u_31[p_u_32] = p_u_32.Changed:connect(function(p33)
			-- upvalues: (ref) p_u_15, (copy) p_u_32, (ref) v_u_16, (ref) v_u_22
			local v34 = p_u_15:GetSpeaker(p_u_32.Name)
			if v34 and (p33 == "TeamColor" or p33 == "Neutral" or p33 == "Team") then
				local v35 = "NameColor"
				local v36 = v34:GetPlayer()
				local v37
				if v36 and v36.Team ~= nil then
					v37 = v36.TeamColor.Color
				else
					v37 = v_u_16[(v_u_22(v34.Name) + 0) % #v_u_16 + 1]
				end
				v34:SetExtraData(v35, v37)
			end
		end)
	end)
	v_u_9.PlayerRemoving:connect(function(p38)
		-- upvalues: (copy) v_u_31
		local v39 = v_u_31[p38]
		if v39 then
			v39:Disconnect()
		end
		v_u_31[p38] = nil
	end)
end
