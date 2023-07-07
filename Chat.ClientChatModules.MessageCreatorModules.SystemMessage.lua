-- decompiled by Sentinel (took 1.866288ms)
local v1 = script.Parent.Parent
local v_u_2 = require(v1:WaitForChild("ChatSettings"))
local v3 = require(v1:WaitForChild("ChatConstants"))
local v_u_4 = require(script.Parent:WaitForChild("Util"))
local v_u_5 = nil
pcall(function()
	-- upvalues: (ref) v_u_5
	v_u_5 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
function CreateSystemMessageLabel(p6, p7)
	-- upvalues: (ref) v_u_5, (copy) v_u_2, (copy) v_u_4
	local v8 = p6.Message
	if v_u_5 then
		if v_u_5.LocalizeFormattedMessage then
			v8 = v_u_5:LocalizeFormattedMessage(v8)
		end
	end
	local v9 = p6.ExtraData or {}
	local v10 = v9.Font or v_u_2.DefaultFont
	local v11 = v9.TextSize or v_u_2.ChatWindowTextSize
	local v12 = v9.ChatColor or v_u_2.DefaultMessageColor
	local v13 = v9.ChannelColor or v12
	local v_u_14, v_u_15 = v_u_4:CreateBaseMessage(v8, v10, v11, v12)
	v_u_15.AutoLocalize = true
	local v16
	if p7 == p6.OriginalChannel then
		v16 = nil
	else
		local v17
		if v_u_5 and p6.OriginalChannel == "System" then
			v17 = string.format("{%s}", (v_u_5:Get("InGame.Chat.Label.SystemMessagePrefix", "System")))
		elseif v_u_5 and p6.OriginalChannel == "Team" then
			v17 = string.format("{%s}", (v_u_5:Get("InGame.Chat.Label.TeamMessagePrefix", "System")))
		else
			v17 = string.format("{%s}", p6.OriginalChannel)
		end
		v16 = v_u_4:AddChannelButtonToBaseMessage(v_u_15, v13, v17, p6.OriginalChannel)
		v_u_15.Text = string.rep(" ", v_u_4:GetNumberOfSpaces(v17, v10, v11) + 1) .. v8
	end
	local function v19(p18)
		-- upvalues: (ref) v_u_4, (copy) v_u_15, (copy) v_u_14
		return v_u_4:GetMessageHeight(v_u_15, v_u_14, p18)
	end
	local v20 = {
		[v_u_15] = {
			["TextTransparency"] = {
				["FadedIn"] = 0, 
				["FadedOut"] = 1
			}, 
			["TextStrokeTransparency"] = {
				["FadedIn"] = 0.75, 
				["FadedOut"] = 1
			}
		}
	}
	if v16 then
		v20[v16] = {
			["TextTransparency"] = {
				["FadedIn"] = 0, 
				["FadedOut"] = 1
			}, 
			["TextStrokeTransparency"] = {
				["FadedIn"] = 0.75, 
				["FadedOut"] = 1
			}
		}
	end
	local v21, v22, v23 = v_u_4:CreateFadeFunctions(v20)
	return {
		[v_u_4.KEY_BASE_FRAME] = v_u_14, 
		[v_u_4.KEY_BASE_MESSAGE] = v_u_15, 
		[v_u_4.KEY_UPDATE_TEXT_FUNC] = nil, 
		[v_u_4.KEY_GET_HEIGHT] = v19, 
		[v_u_4.KEY_FADE_IN] = v21, 
		[v_u_4.KEY_FADE_OUT] = v22, 
		[v_u_4.KEY_UPDATE_ANIMATION] = v23
	}
end
return {
	[v_u_4.KEY_MESSAGE_TYPE] = v3.MessageTypeSystem, 
	[v_u_4.KEY_CREATOR_FUNCTION] = CreateSystemMessageLabel
}
