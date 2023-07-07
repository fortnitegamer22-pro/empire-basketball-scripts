-- decompiled by Sentinel (took 5.137102ms)
local v1, v2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled")
end)
local v_u_3 = v1 and v2
local v_u_4 = game:GetService("Players")
local v5 = script.Parent.Parent
local v_u_6 = require(v5:WaitForChild("ChatSettings"))
local v_u_7 = require(script.Parent:WaitForChild("Util"))
local v_u_8 = utf8.char(57344)
function IsPlayerVerified(p9)
	-- upvalues: (copy) v_u_4
	local v_u_10 = v_u_4:GetPlayerByUserId(p9)
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
	-- upvalues: (copy) v_u_8
	return p13 .. v_u_8
end
function CreateMessageLabel(p_u_14, p15, p_u_16)
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (ref) v_u_3
	local v17 = p_u_14.FromSpeaker
	local v18
	if v_u_6.PlayerDisplayNamesEnabled then
		if p_u_14.SpeakerDisplayName then
			v18 = p_u_14.SpeakerDisplayName
		else
			v18 = v17
		end
	else
		v18 = v17
	end
	if IsPlayerVerified(p_u_14.SpeakerUserId) then
		v18 = AppendVerifiedBadge(v18)
	end
	local _ = p_u_14.Message
	local v19 = p_u_14.ExtraData or {}
	local v20 = v19.Font or v_u_6.DefaultFont
	local v21 = v19.TextSize or v_u_6.ChatWindowTextSize
	local v22 = v19.ChatColor or v_u_6.DefaultMessageColor
	local v23 = v19.ChannelColor or v22
	local v24 = v19.Tags or {}
	local v25 = string.format("[%s]:", v18)
	v_u_7:GetStringTextBounds(v25, v20, v21)
	local v_u_26 = v_u_7:GetNumberOfSpaces(v25, v20, v21) + 1
	local v_u_27, v_u_28 = v_u_7:CreateBaseMessage("", v20, v21, v22)
	local v_u_29 = v_u_7:AddNameButtonToBaseMessage(v_u_28, v19.NameColor or v_u_6.DefaultNameColor, v25, v17)
	local v_u_30 = UDim2.new(0, 0, 0, 0)
	local v31
	if p15 == p_u_14.OriginalChannel then
		v31 = nil
	else
		local v32 = string.format("{%s}", p_u_14.OriginalChannel)
		v31 = v_u_7:AddChannelButtonToBaseMessage(v_u_28, v23, v32, p_u_14.OriginalChannel)
		v_u_30 = UDim2.new(0, v31.Size.X.Offset + v_u_7:GetStringTextBounds(" ", v20, v21).X, 0, 0)
		v_u_26 = v_u_26 + v_u_7:GetNumberOfSpaces(v32, v20, v21) + 1
	end
	local v33 = {}
	for _, v34 in pairs(v24) do
		local v35 = string.format("[%s] ", v34.TagText or "???")
		local v36 = v_u_7:AddTagLabelToBaseMessage(v_u_28, v34.TagColor or Color3.fromRGB(255, 0, 255), v35)
		v36.Position = v_u_30
		v_u_26 = v_u_26 + v_u_7:GetNumberOfSpaces(v35, v20, v21)
		v_u_30 = v_u_30 + UDim2.new(0, v36.Size.X.Offset, 0, 0)
		table.insert(v33, v36)
	end
	v_u_29.Position = v_u_30
	local v_u_37 = false
	local v_u_38 = nil
	if v_u_3 then
		pcall(function()
			-- upvalues: (ref) v_u_38, (ref) v_u_7, (copy) v_u_28, (ref) v_u_30, (copy) v_u_29
			v_u_38 = v_u_7:AddTranslationButtonToBaseMessage(v_u_28)
			v_u_30 = v_u_30 + UDim2.new(0, v_u_29.Size.X.Offset + 2, 0, 0)
			v_u_38.Position = v_u_30
		end)
	end
	local function v_u_40(p39)
		-- upvalues: (ref) v_u_37, (copy) p_u_14, (copy) v_u_28, (ref) v_u_26
		v_u_37 = false
		if p_u_14.IsFiltered then
			v_u_28.Text = string.rep(" ", v_u_26) .. p39.Message
		else
			v_u_28.Text = string.rep(" ", v_u_26) .. string.rep("_", p39.MessageLengthUtf8 or p39.MessageLength)
		end
	end
	local function v42(p41)
		-- upvalues: (ref) v_u_3, (copy) p_u_14, (ref) v_u_38, (ref) v_u_26, (ref) v_u_37, (copy) v_u_40, (copy) v_u_28
		if v_u_3 then
			p_u_14.TranslatedMessage = p41.TranslatedMessage
			if p41.TranslatedMessage then
				if v_u_38 == nil then
					return
				else
					if v_u_38.Visible == false then
						v_u_26 = v_u_26 + 6
					end
					v_u_38.Visible = true
					v_u_37 = true
					if p41.TranslatedMessage == "" then
						v_u_40(p41)
					else
						v_u_28.Text = string.rep(" ", v_u_26) .. p41.TranslatedMessage
					end
				end
			else
				v_u_40(p41)
				return
			end
		elseif p_u_14.IsFiltered then
			v_u_28.Text = string.rep(" ", v_u_26) .. p41.Message
		else
			v_u_28.Text = string.rep(" ", v_u_26) .. string.rep("_", p41.MessageLengthUtf8 or p41.MessageLength)
		end
	end
	if v_u_3 and v_u_38 ~= nil then
		local v_u_44 = v_u_38.MouseButton1Click:connect(function()
			-- upvalues: (ref) v_u_37, (copy) p_u_14, (ref) v_u_38, (ref) v_u_26, (copy) v_u_40, (copy) v_u_28, (copy) p_u_16
			if v_u_37 or not p_u_14.TranslatedMessage then
				v_u_40(p_u_14)
			else
				local v43 = p_u_14
				if v_u_38 ~= nil then
					if v_u_38.Visible == false then
						v_u_26 = v_u_26 + 6
					end
					v_u_38.Visible = true
					v_u_37 = true
					if v43.TranslatedMessage == "" then
						v_u_40(v43)
					else
						v_u_28.Text = string.rep(" ", v_u_26) .. v43.TranslatedMessage
					end
				end
			end
			if p_u_16 then
				p_u_16()
			end
		end)
		local v_u_45 = nil
		v_u_45 = v_u_38.Changed:connect(function(p46)
			-- upvalues: (copy) v_u_44, (ref) v_u_45
			if p46 == "Parent" then
				v_u_44:Disconnect()
				v_u_45:Disconnect()
			end
		end)
	end
	v42(p_u_14)
	local function v48(p47)
		-- upvalues: (ref) v_u_7, (copy) v_u_28, (copy) v_u_27
		return v_u_7:GetMessageHeight(v_u_28, v_u_27, p47)
	end
	local v49 = {
		[v_u_29] = {
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
	if v_u_3 and v_u_38 ~= nil then
		v49[v_u_38] = {
			["ImageTransparency"] = {
				["FadedIn"] = 0, 
				["FadedOut"] = 1
			}
		}
	end
	v49[v_u_28] = {
		["TextTransparency"] = {
			["FadedIn"] = 0, 
			["FadedOut"] = 1
		}, 
		["TextStrokeTransparency"] = {
			["FadedIn"] = 0.75, 
			["FadedOut"] = 1
		}
	}
	for v50, v51 in pairs(v33) do
		string.format("Tag%d", v50)
		v49[v51] = {
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
	if v31 then
		v49[v31] = {
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
	local v52, v53, v54 = v_u_7:CreateFadeFunctions(v49)
	return {
		[v_u_7.KEY_BASE_FRAME] = v_u_27, 
		[v_u_7.KEY_BASE_MESSAGE] = v_u_28, 
		[v_u_7.KEY_UPDATE_TEXT_FUNC] = v42, 
		[v_u_7.KEY_GET_HEIGHT] = v48, 
		[v_u_7.KEY_FADE_IN] = v52, 
		[v_u_7.KEY_FADE_OUT] = v53, 
		[v_u_7.KEY_UPDATE_ANIMATION] = v54
	}
end
return {
	[v_u_7.KEY_MESSAGE_TYPE] = require(v5:WaitForChild("ChatConstants")).MessageTypeDefault, 
	[v_u_7.KEY_CREATOR_FUNCTION] = CreateMessageLabel
}
