-- decompiled by Sentinel (took 460.926µs)
local v1 = {}
local _ = script.Parent
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.SendMessage(p3, p4, p5)
	p3.SayMessageRequest:FireServer(p4, p5)
end
function v_u_2.RegisterSayMessageFunction(p6, p7)
	p6.SayMessageRequest = p7
end
function v1.new()
	-- upvalues: (copy) v_u_2
	local v8 = setmetatable({}, v_u_2)
	v8.SayMessageRequest = nil
	return v8
end
return v1.new()
