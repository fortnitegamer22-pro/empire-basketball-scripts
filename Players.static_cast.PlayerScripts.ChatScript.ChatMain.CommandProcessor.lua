-- decompiled by Sentinel (took 1.393569ms)
local v1 = {}
local v_u_2 = {}
v_u_2.__index = v_u_2
local v3 = game:GetService("Chat"):WaitForChild("ClientChatModules")
local v_u_4 = v3:WaitForChild("CommandModules")
local v_u_5 = require(v_u_4:WaitForChild("Util"))
local _ = script.Parent
local v_u_6 = require(v3:WaitForChild("ChatSettings"))
function v_u_2.SetupCommandProcessors(p7)
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v8 = v_u_4:GetChildren()
	for v9 = 1, #v8 do
		if v8[v9]:IsA("ModuleScript") then
			if v8[v9].Name ~= "Util" then
				local v10 = require(v8[v9])
				local v11 = v10[v_u_5.KEY_COMMAND_PROCESSOR_TYPE]
				local v12 = v10[v_u_5.KEY_PROCESSOR_FUNCTION]
				if v11 == v_u_5.IN_PROGRESS_MESSAGE_PROCESSOR then
					table.insert(p7.InProgressMessageProcessors, v12)
				elseif v11 == v_u_5.COMPLETED_MESSAGE_PROCESSOR then
					table.insert(p7.CompletedMessageProcessors, v12)
				end
			end
		end
	end
end
function v_u_2.ProcessCompletedChatMessage(p13, p14, p15)
	-- upvalues: (copy) v_u_6
	for v16 = 1, #p13.CompletedMessageProcessors do
		if p13.CompletedMessageProcessors[v16](p14, p15, v_u_6) then
			return true
		end
	end
	return false
end
function v_u_2.ProcessInProgressChatMessage(p17, p18, p19, p20)
	-- upvalues: (copy) v_u_6
	for v21 = 1, #p17.InProgressMessageProcessors do
		local v22 = p17.InProgressMessageProcessors[v21](p18, p19, p20, v_u_6)
		if v22 then
			return v22
		end
	end
	return nil
end
function v1.new()
	-- upvalues: (copy) v_u_2
	local v23 = setmetatable({}, v_u_2)
	v23.CompletedMessageProcessors = {}
	v23.InProgressMessageProcessors = {}
	v23:SetupCommandProcessors()
	return v23
end
return v1
