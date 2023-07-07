-- decompiled by Sentinel (took 1.622752ms)
local v_u_1 = game:GetService("Players")
local v_u_2 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local v_u_3 = {
	["ChattingToSelf"] = 1, 
	["NoMatches"] = 2, 
	["MultipleMatches"] = 3
}
return {
	["CommandErrorCodes"] = v_u_3, 
	["getUserNameFromChattedName"] = function(p4, p5, p6)
		-- upvalues: (copy) v_u_3, (copy) v_u_1, (copy) v_u_2
		if p5 == p4 then
			return p5, v_u_3.ChattingToSelf
		else
			local v7 = v_u_1:GetPlayers()
			for _, v8 in pairs(v7) do
				if string.lower(v8.Name) == string.lower(p4) then
					return v8.Name, nil
				end
			end
			local v9 = 0
			local v10 = nil
			if v_u_2.PlayerDisplayNamesEnabled then
				for _, v11 in pairs(v7) do
					if v11.Name ~= p5 then
						if string.lower(v11.DisplayName) == string.lower(p4) then
							v9 = v9 + 1
							v10 = v11.Name
						end
					end
				end
			end
			if v9 == 1 then
				return v10, nil
			elseif v9 == 0 then
				if p6 == p4 then
					return p6, v_u_3.ChattingToSelf
				else
					return p4, v_u_3.NoMatches
				end
			else
				if 2 <= v9 then
					return p4, v_u_3.MultipleMatches
				end
				return
			end
		end
	end, 
	["getUsersWithDisplayNameString"] = function(p12, p13)
		-- upvalues: (copy) v_u_1
		local v14 = {}
		local v15 = ""
		for _, v16 in pairs((v_u_1:GetPlayers())) do
			if v16.Name ~= p13 and string.lower(v16.DisplayName) == string.lower(p12) then
				table.insert(v14, v16.Name)
			end
		end
		for v17, v18 in pairs(v14) do
			if v17 == #v14 then
				v15 = v15 .. "@" .. v18
			else
				v15 = v15 .. "@" .. v18 .. ", "
			end
		end
		return v15
	end
}
