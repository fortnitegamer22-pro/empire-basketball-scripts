-- decompiled by Sentinel (took 1.661501ms)
local v1 = script.Parent.Parent
local v_u_2 = require(v1:WaitForChild("ChatSettings"))
local v_u_3 = require(script.Parent:WaitForChild("Util"))
pcall(function()
	ChatLocalization = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
function CreateWelcomeMessageLabel(p4, p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v6 = p4.Message
	if ChatLocalization then
		if ChatLocalization.LocalizeFormattedMessage then
			v6 = ChatLocalization:LocalizeFormattedMessage(v6)
		end
	end
	local v7 = p4.ExtraData or {}
	local v8 = v7.Font or v_u_2.DefaultFont
	local v9 = v7.FontSize or v_u_2.ChatWindowTextSize
	local v10 = v7.ChatColor or v_u_2.DefaultMessageColor
	local v11 = v7.ChannelColor or v10
	local v_u_12, v_u_13 = v_u_3:CreateBaseMessage(v6, v8, v9, v10)
	local v14
	if p5 == p4.OriginalChannel then
		v14 = nil
	else
		local v15 = p4.OriginalChannel
		if ChatLocalization.tryLocalize then
			v15 = ChatLocalization:tryLocalize(p4.OriginalChannel)
		end
		local v16 = string.format("{%s}", v15)
		v14 = v_u_3:AddChannelButtonToBaseMessage(v_u_13, v11, v16, p4.OriginalChannel)
		v_u_13.Text = string.rep(" ", v_u_3:GetNumberOfSpaces(v16, v8, v9) + 1) .. v6
	end
	local function v18(p17)
		-- upvalues: (ref) v_u_3, (copy) v_u_13, (copy) v_u_12
		return v_u_3:GetMessageHeight(v_u_13, v_u_12, p17)
	end
	local v19 = {
		[v_u_13] = {
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
	if v14 then
		v19[v14] = {
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
	local v20, v21, v22 = v_u_3:CreateFadeFunctions(v19)
	return {
		[v_u_3.KEY_BASE_FRAME] = v_u_12, 
		[v_u_3.KEY_BASE_MESSAGE] = v_u_13, 
		[v_u_3.KEY_UPDATE_TEXT_FUNC] = nil, 
		[v_u_3.KEY_GET_HEIGHT] = v18, 
		[v_u_3.KEY_FADE_IN] = v20, 
		[v_u_3.KEY_FADE_OUT] = v21, 
		[v_u_3.KEY_UPDATE_ANIMATION] = v22
	}
end
return {
	[v_u_3.KEY_MESSAGE_TYPE] = require(v1:WaitForChild("ChatConstants")).MessageTypeWelcome, 
	[v_u_3.KEY_CREATOR_FUNCTION] = CreateWelcomeMessageLabel
}
