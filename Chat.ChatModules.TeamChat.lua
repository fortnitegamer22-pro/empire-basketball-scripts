-- decompiled by Sentinel (took 2.828559ms)
local v1 = game:GetService("Chat"):WaitForChild("ClientChatModules")
local v_u_2 = require(v1:WaitForChild("ChatSettings"))
local v_u_3 = require(v1:WaitForChild("ChatConstants"))
local v_u_4 = nil
pcall(function()
	-- upvalues: (ref) v_u_4
	v_u_4 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
v_u_4 = v_u_4 == nil and {} or v_u_4
if not (v_u_4.FormatMessageToSend and v_u_4.LocalizeFormattedMessage) then
	function v_u_4.FormatMessageToSend(_, _, p5)
		return p5
	end
end
local v_u_6 = {
	["ChatColor"] = v_u_2.ErrorMessageTextColor or Color3.fromRGB(245, 50, 50)
}
return function(p_u_7)
	-- upvalues: (ref) v_u_4, (copy) v_u_3, (copy) v_u_6, (copy) v_u_2
	local v8 = game:GetService("Players")
	local v_u_9 = p_u_7:AddChannel("Team")
	v_u_9.WelcomeMessage = v_u_4:FormatMessageToSend("GameChat_TeamChat_WelcomeMessage", "This is a private channel between you and your team members.")
	v_u_9.Joinable = false
	v_u_9.Leavable = false
	v_u_9.AutoJoin = false
	v_u_9.Private = true
	v_u_9:RegisterProcessCommandsFunction("replication_function", function(p10, p11, p12)
		-- upvalues: (copy) p_u_7
		local v13 = p_u_7:GetSpeaker(p10)
		local v14 = p_u_7:GetChannel(p12)
		local v15 = v13 and v14 and v13:GetPlayer()
		if v15 then
			for _, v16 in pairs(v14:GetSpeakerList()) do
				local v17 = p_u_7:GetSpeaker(v16)
				if v17 then
					local v18 = v17:GetPlayer()
					if v18 and v15.Team == v18.Team then
						v17:SendMessage(p11, p12, p10, {
							["NameColor"] = v15.TeamColor.Color, 
							["ChatColor"] = v15.TeamColor.Color, 
							["ChannelColor"] = v15.TeamColor.Color
						})
					end
				end
			end
		end
		return true
	end, v_u_3.LowPriority)
	local function v_u_26(p19, p20, p21)
		-- upvalues: (copy) p_u_7, (ref) v_u_4, (ref) v_u_6
		local v22 = p20 == nil and "" or p20
		local v23 = p_u_7:GetSpeaker(p19)
		local v24 = v23 and v23:GetPlayer()
		if v24 then
			if v24.Team == nil then
				v23:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_TeamChat_CannotTeamChatIfNotInTeam", "You cannot team chat if you are not on a team!"), p21, v_u_6)
				return
			end
			local v25 = p_u_7:GetChannel("Team")
			if v25 then
				if not v23:IsInChannel(v25.Name) then
					v23:JoinChannel(v25.Name)
				end
				if v22 and 0 < string.len(v22) then
					v23:SayMessage(v22, v25.Name)
				end
				v23:SetMainChannel(v25.Name)
			end
		end
	end
	p_u_7:RegisterProcessCommandsFunction("team_commands", function(p27, p28, p29)
		-- upvalues: (copy) v_u_26
		local v30 = false
		if p28 == nil then
			error("Message is nil")
		end
		if p29 == "Team" then
			return false
		elseif string.sub(p28, 1, 6):lower() == "/team " or p28:lower() == "/team" then
			v_u_26(p27, string.sub(p28, 7), p29)
			return true
		elseif string.sub(p28, 1, 3):lower() == "/t " or p28:lower() == "/t" then
			v_u_26(p27, string.sub(p28, 4), p29)
			return true
		else
			if string.sub(p28, 1, 2):lower() == "% " or p28:lower() == "%" then
				v_u_26(p27, string.sub(p28, 3), p29)
				v30 = true
			end
			return v30
		end
	end, v_u_3.StandardPriority)
	local function v_u_31()
		-- upvalues: (ref) v_u_2
		if v_u_2.DefaultChannelNameColor then
			return v_u_2.DefaultChannelNameColor
		else
			return Color3.fromRGB(35, 76, 142)
		end
	end
	local function v_u_34(p32, p33)
		-- upvalues: (copy) v_u_9, (copy) v_u_31
		if p33.Neutral or p33.Team == nil then
			p32:UpdateChannelNameColor(v_u_9.Name, v_u_31())
			if p32:IsInChannel(v_u_9.Name) then
				p32:LeaveChannel(v_u_9.Name)
				return
			end
		elseif not p33.Neutral and p33.Team then
			p32:UpdateChannelNameColor(v_u_9.Name, p33.Team.TeamColor.Color)
			if not p32:IsInChannel(v_u_9.Name) then
				p32:JoinChannel(v_u_9.Name)
			end
		end
	end
	p_u_7.SpeakerAdded:connect(function(p35)
		-- upvalues: (copy) p_u_7, (copy) v_u_34
		local v36 = p_u_7:GetSpeaker(p35)
		local v37 = v36 and v36:GetPlayer()
		if v37 then
			v_u_34(v36, v37)
		end
	end)
	local v_u_38 = {}
	v8.PlayerAdded:connect(function(p_u_39)
		-- upvalues: (copy) p_u_7, (copy) v_u_34, (copy) v_u_9, (ref) v_u_4, (copy) v_u_38
		v_u_38[p_u_39] = p_u_39.Changed:connect(function(p40)
			-- upvalues: (ref) p_u_7, (copy) p_u_39, (ref) v_u_34, (ref) v_u_9, (ref) v_u_4
			local v41 = p_u_7:GetSpeaker(p_u_39.Name)
			if v41 then
				if p40 == "Neutral" then
					v_u_34(v41, p_u_39)
					return
				end
				if p40 == "Team" then
					v_u_34(v41, p_u_39)
					if v41:IsInChannel(v_u_9.Name) then
						v41:SendSystemMessage(v_u_4:FormatMessageToSend("GameChat_TeamChat_NowInTeam", string.format("You are now on the \'%s\' team.", p_u_39.Team.Name), "RBX_NAME", p_u_39.Team.Name), v_u_9.Name)
					end
				end
			end
		end)
	end)
	v8.PlayerRemoving:connect(function(p42)
		-- upvalues: (copy) v_u_38
		local v43 = v_u_38[p42]
		if v43 then
			v43:Disconnect()
		end
		v_u_38[p42] = nil
	end)
end
