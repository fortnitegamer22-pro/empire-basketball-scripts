-- decompiled by Sentinel (took 1.832531ms)
local v_u_1 = game:GetService("LocalizationService")
local v_u_2 = game:GetService("Chat")
local v_u_3 = {
	["System"] = "InGame.Chat.Label.SystemMessagePrefix", 
	["Team"] = "InGame.Chat.Label.TeamMessagePrefix"
}
local v_u_4 = {
	["From(%s.+)"] = {
		["English"] = "From", 
		["LocalizationKey"] = "InGame.Chat.Label.From"
	}, 
	["To(%s.+)"] = {
		["English"] = "To", 
		["LocalizationKey"] = "InGame.Chat.Label.To"
	}
}
return {
	["_hasFetchedLocalization"] = false, 
	["_getTranslator"] = function(p_u_5)
		-- upvalues: (copy) v_u_2, (copy) v_u_1
		if not (p_u_5._translator or p_u_5._hasFetchedLocalization) then
			p_u_5._hasFetchedLocalization = true
			local v6 = v_u_2:WaitForChild("ChatLocalization", 4)
			if v6 then
				p_u_5._translator = v6:GetTranslator(v_u_1.RobloxLocaleId)
				v_u_1:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
					-- upvalues: (copy) p_u_5
					p_u_5._hasFetchedLocalization = false
					p_u_5._translator = nil
				end)
			else
				warn("Missing ChatLocalization. Chat interface will not be localized.")
			end
		end
		return p_u_5._translator
	end, 
	["Get"] = function(p_u_7, p_u_8, p9, p_u_10)
		local v_u_11 = p9
		pcall(function()
			-- upvalues: (copy) p_u_7, (ref) v_u_11, (copy) p_u_8, (copy) p_u_10
			local v12 = p_u_7:_getTranslator()
			if v12 then
				v_u_11 = v12:FormatByKey(p_u_8, p_u_10)
			else
				warn("Missing Translator. Used default for", p_u_8)
			end
		end)
		return v_u_11
	end, 
	["LocalizeFormattedMessage"] = function(p13, p14)
		local v15, v16 = string.find(p14, "{RBX_LOCALIZATION_KEY}")
		if not v15 then
			return p14
		end
		local v17, v18 = string.find(p14, "{RBX_LOCALIZATION_DEFAULT}")
		if not v17 then
			return p14
		end
		local v19, v20 = string.find(p14, "{RBX_LOCALIZATION_PARAMS}")
		local v21 = string.sub(p14, v16 + 1, v17 - 1)
		if not v19 then
			return p13:Get(v21, (string.sub(p14, v18 + 1)))
		end
		local v22 = string.sub(p14, v18 + 1, v19 - 1)
		local v23 = {}
		for v24, v25 in string.gmatch(string.sub(p14, v20 + 1), "([^%s]+)=([^%s]+)") do
			v23[v24] = v25
		end
		return p13:Get(v21, v22, v23)
	end, 
	["FormatMessageToSend"] = function(_, p26, p27, p28, p29)
		if p28 and p29 then
			return "{RBX_LOCALIZATION_KEY}" .. p26 .. "{RBX_LOCALIZATION_DEFAULT}" .. p27 .. "{RBX_LOCALIZATION_PARAMS}" .. p28 .. "=" .. p29
		else
			return "{RBX_LOCALIZATION_KEY}" .. p26 .. "{RBX_LOCALIZATION_DEFAULT}" .. p27
		end
	end, 
	["tryLocalize"] = function(p30, p31)
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		if v_u_3[p31] then
			return p30:Get(v_u_3[p31], p31)
		end
		for v32, v33 in pairs(v_u_3) do
			if string.find(p31, v32) then
				return string.gsub(p31, v32, p30:Get(v33, v32), 1)
			end
		end
		for v34, v35 in pairs(v_u_4) do
			local v36 = string.find(p31, v34)
			local v37 = string.match(p31, v34)
			if v36 and v37 then
				return (1 >= v36 and "" or p31:sub(1, v36 - 1)) .. p30:Get(v35.LocalizationKey, v35.English) .. v37
			end
		end
		return p31
	end
}
