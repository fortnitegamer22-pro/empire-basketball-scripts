-- decompiled by Sentinel (took 2.651163ms)
local v_u_1 = game:GetService("Players")
local v_u_2 = v_u_1.LocalPlayer
while not v_u_2 do
	v_u_1.ChildAdded:wait()
	v_u_2 = v_u_1.LocalPlayer
end
local v3 = script.Parent.Parent
local v_u_4 = require(v3:WaitForChild("ChatSettings"))
local v5 = require(v3:WaitForChild("ChatConstants"))
local v_u_6 = require(script.Parent:WaitForChild("Util"))
local v_u_7 = utf8.char(57344)
local v_u_8 = nil
pcall(function()
	-- upvalues: (ref) v_u_8
	v_u_8 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
function IsPlayerVerified(p9)
	-- upvalues: (copy) v_u_1
	local v_u_10 = v_u_1:GetPlayerByUserId(p9)
	if v_u_10 then
		local v11, v12 = pcall(function()
			-- upvalues: (copy) v_u_10
			return v_u_10.HasVerifiedBadge
		end)
		if v11 then
			return v12
		else
			return false
		end
	else
		return false
	end
end
function AppendVerifiedBadge(p13)
	-- upvalues: (copy) v_u_7
	return p13 .. v_u_7
end
function CreateMessageLabel(p_u_14, p15)
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (ref) v_u_2, (ref) v_u_8
	local v16 = p_u_14.FromSpeaker
	local v17
	if v_u_4.PlayerDisplayNamesEnabled then
		if p_u_14.SpeakerDisplayName then
			v17 = p_u_14.SpeakerDisplayName
		else
			v17 = v16
		end
	else
		v17 = v16
	end
	if IsPlayerVerified(p_u_14.SpeakerUserId) then
		v17 = AppendVerifiedBadge(v17)
	end
	local _ = p_u_14.Message
	local v18 = p_u_14.ExtraData or {}
	local v19 = v18.Font or v_u_4.DefaultFont
	local v20 = v18.TextSize or v_u_4.ChatWindowTextSize
	local v21 = v18.ChatColor or v_u_4.DefaultMessageColor
	local v22 = v18.ChannelColor or v21
	local v23 = string.format("[%s]:", v17)
	v_u_6:GetStringTextBounds(v23, v19, v20)
	local v_u_24 = v_u_6:GetNumberOfSpaces(v23, v19, v20) + 1
	local v_u_25, v_u_26 = v_u_6:CreateBaseMessage("", v19, v20, v21)
	local v27 = v_u_6:AddNameButtonToBaseMessage(v_u_26, v18.NameColor or v_u_4.DefaultNameColor, v23, v16)
	local v28
	if p15 == p_u_14.OriginalChannel then
		v28 = nil
	else
		local v29 = p_u_14.OriginalChannel
		if p_u_14.FromSpeaker ~= v_u_2.Name then
			v29 = string.format("From %s", p_u_14.FromSpeaker)
		end
		if v_u_8.tryLocalize then
			v29 = v_u_8:tryLocalize(v29)
		end
		local v30 = string.format("{%s}", v29)
		v28 = v_u_6:AddChannelButtonToBaseMessage(v_u_26, v22, v30, p_u_14.OriginalChannel)
		v27.Position = UDim2.new(0, v28.Size.X.Offset + v_u_6:GetStringTextBounds(" ", v19, v20).X, 0, 0)
		v_u_24 = v_u_24 + v_u_6:GetNumberOfSpaces(v30, v19, v20) + 1
	end
	local function v32(p31)
		-- upvalues: (copy) p_u_14, (copy) v_u_26, (ref) v_u_24
		if p_u_14.IsFiltered then
			v_u_26.Text = string.rep(" ", v_u_24) .. p31.Message
		else
			v_u_26.Text = string.rep(" ", v_u_24) .. string.rep("_", p31.MessageLengthUtf8 or p31.MessageLength)
		end
	end
	v32(p_u_14)
	local function v34(p33)
		-- upvalues: (ref) v_u_6, (copy) v_u_26, (copy) v_u_25
		return v_u_6:GetMessageHeight(v_u_26, v_u_25, p33)
	end
	local v35 = {
		[v27] = {
			["TextTransparency"] = {
				["FadedIn"] = 0, 
				["FadedOut"] = 1
			}, 
			["TextStrokeTransparency"] = {
				["FadedIn"] = 0.75, 
				["FadedOut"] = 1
			}
		}, 
		[v_u_26] = {
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
	if v28 then
		v35[v28] = {
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
	local v36, v37, v38 = v_u_6:CreateFadeFunctions(v35)
	return {
		[v_u_6.KEY_BASE_FRAME] = v_u_25, 
		[v_u_6.KEY_BASE_MESSAGE] = v_u_26, 
		[v_u_6.KEY_UPDATE_TEXT_FUNC] = v32, 
		[v_u_6.KEY_GET_HEIGHT] = v34, 
		[v_u_6.KEY_FADE_IN] = v36, 
		[v_u_6.KEY_FADE_OUT] = v37, 
		[v_u_6.KEY_UPDATE_ANIMATION] = v38
	}
end
return {
	[v_u_6.KEY_MESSAGE_TYPE] = v5.MessageTypeWhisper, 
	[v_u_6.KEY_CREATOR_FUNCTION] = CreateMessageLabel
}
