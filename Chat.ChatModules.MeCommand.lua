-- decompiled by Sentinel (took 607.339µs)
local v1 = game:GetService("Chat"):WaitForChild("ClientChatModules")
local v_u_2 = require(v1:WaitForChild("ChatConstants"))
local v_u_3 = require(v1:WaitForChild("ChatSettings"))
return function(p4)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	if v_u_3 and v_u_3.AllowMeCommand then
		p4:RegisterFilterMessageFunction("me_command", function(_, p5, _)
			-- upvalues: (ref) v_u_2
			local v6 = p5.Message
			if v6 and string.sub(v6, 1, 4):lower() == "/me " then
				p5.MessageType = v_u_2.MessageTypeMeCommand
			end
		end)
	end
end
