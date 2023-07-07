-- decompiled by Sentinel (took 1.512193ms)
local v_u_1 = game:GetService("Players")
game:GetService("FriendService")
local v2 = game:GetService("Chat"):WaitForChild("ClientChatModules")
local v_u_3 = require(v2:WaitForChild("ChatSettings"))
require(v2:WaitForChild("ChatConstants"))
local v4, v_u_5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserHandleFriendJoinNotifierOnClient")
end)
if not v4 then
	v_u_5 = false
end
local v_u_6 = nil
pcall(function()
	-- upvalues: (ref) v_u_6
	v_u_6 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
v_u_6 = v_u_6 == nil and {} or v_u_6
if not (v_u_6.FormatMessageToSend and v_u_6.LocalizeFormattedMessage) then
	function v_u_6.FormatMessageToSend(_, _, p7)
		return p7
	end
end
local v_u_8 = {
	["ChatColor"] = Color3.fromRGB(255, 255, 255)
}
return function(p_u_9)
	-- upvalues: (ref) v_u_5, (copy) v_u_3, (ref) v_u_6, (copy) v_u_8, (copy) v_u_1
	local function v_u_14(p10, p11)
		-- upvalues: (copy) p_u_9, (ref) v_u_3, (ref) v_u_6, (ref) v_u_8
		local v12 = p_u_9:GetSpeaker(p10.Name)
		if v12 then
			local v13 = p11.Name
			if v_u_3.PlayerDisplayNamesEnabled then
				v13 = p11.DisplayName
			end
			v12:SendSystemMessage(v_u_6:FormatMessageToSend("GameChat_FriendChatNotifier_JoinMessage", string.format("Your friend %s has joined the game.", v13), "RBX_NAME", v13), "System", v_u_8)
		end
	end
	local v15
	if v_u_5 == false and v_u_3.ShowFriendJoinNotification ~= nil then
		v15 = v_u_3.ShowFriendJoinNotification
	else
		v15 = false
	end
	if v15 then
		v_u_1.PlayerAdded:connect(function(p_u_16)
			-- upvalues: (ref) v_u_1, (copy) v_u_14
			local v17 = v_u_1:GetPlayers()
			for v18 = 1, #v17 do
				local v_u_19 = v17[v18]
				if v_u_19 ~= p_u_16 then
					coroutine.wrap(function()
						-- upvalues: (copy) v_u_19, (copy) p_u_16, (ref) v_u_14
						if v_u_19:IsFriendsWith(p_u_16.UserId) then
							v_u_14(v_u_19, p_u_16)
						end
					end)()
				end
			end
		end)
	end
end
