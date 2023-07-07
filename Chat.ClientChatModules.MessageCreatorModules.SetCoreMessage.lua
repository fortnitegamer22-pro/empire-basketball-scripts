-- decompiled by Sentinel (took 1.002769ms)
local v1 = script.Parent.Parent
local v_u_2 = require(v1:WaitForChild("ChatSettings"))
local v_u_3 = require(script.Parent:WaitForChild("Util"))
function CreateSetCoreMessageLabel(p4, _)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v5 = p4.ExtraData or {}
	local v_u_6, v_u_7 = v_u_3:CreateBaseMessage(p4.Message, v5.Font or v_u_2.DefaultFont, v5.TextSize or v_u_2.ChatWindowTextSize, v5.Color or v_u_2.DefaultMessageColor)
	local v8, v9, v10 = v_u_3:CreateFadeFunctions({
		[v_u_7] = {
			["TextTransparency"] = {
				["FadedIn"] = 0, 
				["FadedOut"] = 1
			}, 
			["TextStrokeTransparency"] = {
				["FadedIn"] = 0.75, 
				["FadedOut"] = 1
			}
		}
	})
	return {
		[v_u_3.KEY_BASE_FRAME] = v_u_6, 
		[v_u_3.KEY_BASE_MESSAGE] = v_u_7, 
		[v_u_3.KEY_UPDATE_TEXT_FUNC] = nil, 
		[v_u_3.KEY_GET_HEIGHT] = function(p11)
			-- upvalues: (ref) v_u_3, (copy) v_u_7, (copy) v_u_6
			return v_u_3:GetMessageHeight(v_u_7, v_u_6, p11)
		end, 
		[v_u_3.KEY_FADE_IN] = v8, 
		[v_u_3.KEY_FADE_OUT] = v9, 
		[v_u_3.KEY_UPDATE_ANIMATION] = v10
	}
end
return {
	[v_u_3.KEY_MESSAGE_TYPE] = require(v1:WaitForChild("ChatConstants")).MessageTypeSetCore, 
	[v_u_3.KEY_CREATOR_FUNCTION] = CreateSetCoreMessageLabel
}
