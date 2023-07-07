-- decompiled by Sentinel (took 2.879523ms)
local v_u_1 = game:GetService("Chat")
local v2 = game:GetService("Players")
local v_u_3 = require(script.Parent:WaitForChild("Util"))
local v_u_4 = nil
pcall(function()
	-- upvalues: (ref) v_u_4, (copy) v_u_1
	v_u_4 = require(v_u_1.ClientChatModules.ChatLocalization)
end)
v_u_4 = v_u_4 == nil and {
	["Get"] = function(_, _, p5)
		return p5
	end
} or v_u_4
local v_u_6 = v2.LocalPlayer
local v7, v8 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserPlayEmoteChatTextUpdates")
end)
local v_u_9 = v7 and v8
local v_u_10 = {
	["wave"] = true, 
	["point"] = true, 
	["dance"] = true, 
	["dance2"] = true, 
	["dance3"] = true, 
	["laugh"] = true, 
	["cheer"] = true
}
local v_u_11 = {
	["NotSupported"] = "InGame.Chat.Response.EmotesNotSupported", 
	["R15Only"] = "InGame.Chat.Response.EmotesWrongAvatarType", 
	["SwitchToR15"] = "InGame.Chat.ErrorMessageSwitchToR15", 
	["NoMatchingEmote"] = "InGame.Chat.Response.EmoteNotAvailable", 
	["TemporarilyUnavailable"] = "InGame.Chat.Response.EmotesTemporarilyUnavailable", 
	["AnimationPlaying"] = "InGame.Chat.ErrorMessageAnimationPlaying"
}
local v_u_12 = {
	[v_u_11.NotSupported] = "You can\'t use Emotes here.", 
	[v_u_11.R15Only] = "Only R15 avatars can use Emotes.", 
	[v_u_11.SwitchToR15] = "Switch to your R15 avatar to play Emote.", 
	[v_u_11.NoMatchingEmote] = "You can\'t use that Emote.", 
	[v_u_11.TemporarilyUnavailable] = "You can\'t use Emotes right now.", 
	[v_u_11.AnimationPlaying] = "You cannot play Emotes during this action."
}
local v_u_13 = Color3.fromRGB(245, 50, 50)
return {
	[v_u_3.KEY_COMMAND_PROCESSOR_TYPE] = v_u_3.COMPLETED_MESSAGE_PROCESSOR, 
	[v_u_3.KEY_PROCESSOR_FUNCTION] = function(p14, p15, _)
		-- upvalues: (copy) v_u_10, (copy) v_u_6, (copy) v_u_11, (ref) v_u_4, (copy) v_u_12, (copy) v_u_13, (copy) v_u_3, (ref) v_u_9
		local v16
		if string.sub(p14, 1, 3) == "/e " then
			v16 = string.sub(p14, 4)
		elseif string.sub(p14, 1, 7) == "/emote " then
			v16 = string.sub(p14, 8)
		else
			v16 = nil
		end
		if not v16 then
			return false
		end
		if v_u_10[v16] then
			return true
		end
		local v_u_17 = p15:GetCurrentChannel()
		if not v_u_17 then
			return true
		end
		local v18 = v_u_6.Character
		if not v18 then
			local v19 = v_u_11.TemporarilyUnavailable
			v_u_3:SendSystemMessageToSelf(v_u_4:Get(v19, v_u_12[v19]), v_u_17, {
				["ChatColor"] = v_u_13
			})
			return true
		end
		local v20 = v18:FindFirstChild("Animate")
		if not v20 then
			local v21 = v_u_11.NotSupported
			v_u_3:SendSystemMessageToSelf(v_u_4:Get(v21, v_u_12[v21]), v_u_17, {
				["ChatColor"] = v_u_13
			})
			return true
		end
		if not v20:FindFirstChild("PlayEmote") then
			local v22 = v_u_11.NotSupported
			v_u_3:SendSystemMessageToSelf(v_u_4:Get(v22, v_u_12[v22]), v_u_17, {
				["ChatColor"] = v_u_13
			})
			return true
		end
		local v_u_23 = v18:FindFirstChildOfClass("Humanoid")
		if not v_u_23 then
			local v24 = v_u_11.TemporarilyUnavailable
			v_u_3:SendSystemMessageToSelf(v_u_4:Get(v24, v_u_12[v24]), v_u_17, {
				["ChatColor"] = v_u_13
			})
			return true
		end
		if v_u_23.RigType ~= Enum.HumanoidRigType.R15 then
			if v_u_9 then
				local v25 = v_u_11.SwitchToR15
				v_u_3:SendSystemMessageToSelf(v_u_4:Get(v25, v_u_12[v25]), v_u_17, {
					["ChatColor"] = v_u_13
				})
			else
				local v26 = v_u_11.R15Only
				v_u_3:SendSystemMessageToSelf(v_u_4:Get(v26, v_u_12[v26]), v_u_17, {
					["ChatColor"] = v_u_13
				})
			end
			return true
		end
		local v27 = v_u_23:FindFirstChildOfClass("HumanoidDescription")
		if not v27 then
			local v28 = v_u_11.TemporarilyUnavailable
			v_u_3:SendSystemMessageToSelf(v_u_4:Get(v28, v_u_12[v28]), v_u_17, {
				["ChatColor"] = v_u_13
			})
			return true
		end
		local v29 = {}
		for v30, _ in pairs((v27:GetEmotes())) do
			v29[string.lower(v30)] = v30
		end
		local v31 = tonumber(v16)
		if v31 then
			for _, v32 in pairs((v27:GetEquippedEmotes())) do
				if v32.Slot == v31 then
					v16 = v32.Name
				end
			end
		end
		local v_u_33 = v29[string.lower(v16)]
		if v_u_33 then
			spawn(function()
				-- upvalues: (copy) v_u_23, (ref) v_u_33, (copy) v_u_17, (ref) v_u_11, (ref) v_u_4, (ref) v_u_12, (ref) v_u_13, (ref) v_u_3, (ref) v_u_9
				local v34, v35 = pcall(function()
					-- upvalues: (ref) v_u_23, (ref) v_u_33
					return v_u_23:PlayEmote(v_u_33)
				end)
				if v34 then
					if not v35 then
						if v_u_9 then
							local v36 = v_u_11.AnimationPlaying
							v_u_3:SendSystemMessageToSelf(v_u_4:Get(v36, v_u_12[v36]), v_u_17, {
								["ChatColor"] = v_u_13
							})
							return
						end
						local v37 = v_u_11.TemporarilyUnavailable
						v_u_3:SendSystemMessageToSelf(v_u_4:Get(v37, v_u_12[v37]), v_u_17, {
							["ChatColor"] = v_u_13
						})
					end
				else
					local v38 = v_u_11.NotSupported
					v_u_3:SendSystemMessageToSelf(v_u_4:Get(v38, v_u_12[v38]), v_u_17, {
						["ChatColor"] = v_u_13
					})
				end
			end)
			return true
		end
		local v39 = v_u_11.NoMatchingEmote
		v_u_3:SendSystemMessageToSelf(v_u_4:Get(v39, v_u_12[v39]), v_u_17, {
			["ChatColor"] = v_u_13
		})
		return true
	end
}
