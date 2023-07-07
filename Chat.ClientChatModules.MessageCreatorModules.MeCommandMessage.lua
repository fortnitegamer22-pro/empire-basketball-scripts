-- decompiled by Sentinel (took 1.554701ms)
local v1 = script.Parent.Parent
local v_u_2 = require(v1:WaitForChild("ChatSettings"))
local v_u_3 = require(script.Parent:WaitForChild("Util"))
function CreateMeCommandMessageLabel(p_u_4, p5)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local _ = p_u_4.Message
	local v6 = p_u_4.ExtraData or {}
	local v7 = v6.Font or Enum.Font.SourceSansItalic
	local v8 = v6.TextSize or v_u_2.ChatWindowTextSize
	local v9 = Color3.new(1, 1, 1)
	local v10 = v6.ChannelColor or v9
	local v_u_11, v_u_12 = v_u_3:CreateBaseMessage("", v7, v8, v9)
	local v_u_13, v14
	if p5 == p_u_4.OriginalChannel then
		v_u_13 = 0
		v14 = nil
	else
		local v15 = string.format("{%s}", p_u_4.OriginalChannel)
		v14 = v_u_3:AddChannelButtonToBaseMessage(v_u_12, v10, v15, p_u_4.OriginalChannel)
		v_u_13 = v_u_3:GetNumberOfSpaces(v15, v7, v8) + 1
	end
	local function v17(p16)
		-- upvalues: (copy) p_u_4, (copy) v_u_12, (ref) v_u_13
		if p_u_4.IsFiltered then
			v_u_12.Text = string.rep(" ", v_u_13) .. p16.FromSpeaker .. " " .. string.sub(p16.Message, 5)
		else
			v_u_12.Text = string.rep(" ", v_u_13) .. string.rep("_", utf8.len(utf8.nfcnormalize(p16.FromSpeaker)) + (p16.MessageLengthUtf8 or p16.MessageLength) - 4)
		end
	end
	v17(p_u_4)
	local function v19(p18)
		-- upvalues: (ref) v_u_3, (copy) v_u_12, (copy) v_u_11
		return v_u_3:GetMessageHeight(v_u_12, v_u_11, p18)
	end
	local v20 = {
		[v_u_12] = {
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
		v20[v14] = {
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
	local v21, v22, v23 = v_u_3:CreateFadeFunctions(v20)
	return {
		[v_u_3.KEY_BASE_FRAME] = v_u_11, 
		[v_u_3.KEY_BASE_MESSAGE] = v_u_12, 
		[v_u_3.KEY_UPDATE_TEXT_FUNC] = v17, 
		[v_u_3.KEY_GET_HEIGHT] = v19, 
		[v_u_3.KEY_FADE_IN] = v21, 
		[v_u_3.KEY_FADE_OUT] = v22, 
		[v_u_3.KEY_UPDATE_ANIMATION] = v23
	}
end
return {
	[v_u_3.KEY_MESSAGE_TYPE] = require(v1:WaitForChild("ChatConstants")).MessageTypeMeCommand, 
	[v_u_3.KEY_CREATOR_FUNCTION] = CreateMeCommandMessageLabel
}
