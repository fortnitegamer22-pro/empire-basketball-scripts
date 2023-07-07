-- decompiled by Sentinel (took 9.511246ms)
local v_u_1 = {}
v_u_1.__index = v_u_1
local v_u_2 = {}
v_u_2.__index = v_u_2
local v_u_3 = nil
local function v_u_6(p4, ...)
	-- upvalues: (ref) v_u_3
	local v5 = v_u_3
	v_u_3 = nil
	p4(...)
	v_u_3 = v5
end
local function v_u_7()
	-- upvalues: (ref) v_u_3, (copy) v_u_6
	v_u_3 = coroutine.running()
	while true do
		v_u_6(coroutine.yield())
	end
end
function v_u_1.new()
	-- upvalues: (copy) v_u_1
	return setmetatable({
		["_active"] = true, 
		["_head"] = nil
	}, v_u_1)
end
function v_u_1.Is(p8)
	-- upvalues: (copy) v_u_1
	local v9
	if typeof(p8) == "table" then
		v9 = getmetatable(p8) == v_u_1
	else
		v9 = false
	end
	return v9
end
function v_u_1.IsActive(p10)
	return p10._active == true
end
function v_u_1.Connect(p11, p12)
	-- upvalues: (copy) v_u_2
	assert(typeof(p12) == "function", "Must be function")
	if p11._active ~= true then
		return setmetatable({
			["Connected"] = false, 
			["_node"] = nil
		}, v_u_2)
	end
	local v13 = p11._head
	local v14 = {
		["_signal"] = p11, 
		["_connection"] = nil, 
		["_handler"] = p12, 
		["_next"] = v13, 
		["_prev"] = nil
	}
	if v13 ~= nil then
		v13._prev = v14
	end
	p11._head = v14
	local v15 = setmetatable({
		["Connected"] = true, 
		["_node"] = v14
	}, v_u_2)
	v14._connection = v15
	return v15
end
function v_u_1.ConnectOnce(p16, p_u_17)
	assert(typeof(p_u_17) == "function", "Must be function")
	local v_u_18 = nil
	v_u_18 = p16:Connect(function(...)
		-- upvalues: (ref) v_u_18, (copy) p_u_17
		v_u_18:Disconnect()
		p_u_17(...)
	end)
end
function v_u_1.Wait(p19)
	local v_u_20 = coroutine.running()
	local v_u_21 = nil
	v_u_21 = p19:Connect(function(...)
		-- upvalues: (ref) v_u_21, (ref) v_u_20
		v_u_21:Disconnect()
		task.spawn(v_u_20, ...)
	end)
	return coroutine.yield()
end
function v_u_1.Fire(p22, ...)
	-- upvalues: (ref) v_u_3, (copy) v_u_7
	local v23 = p22._head
	while v23 ~= nil do
		if v23._connection ~= nil then
			if v_u_3 == nil then
				task.spawn(v_u_7)
			end
			task.spawn(v_u_3, v23._handler, ...)
		end
		v23 = v23._next
	end
end
function v_u_1.DisconnectAll(p24)
	local v25 = p24._head
	while v25 ~= nil do
		local v26 = v25._connection
		if v26 ~= nil then
			v26.Connected = false
			v26._node = nil
			v25._connection = nil
		end
		v25 = v25._next
	end
	p24._head = nil
end
function v_u_1.Destroy(p27)
	if p27._active == true then
		p27:DisconnectAll()
		p27._active = false
	end
end
function v_u_2.Disconnect(p28)
	if p28.Connected == true then
		p28.Connected = false
		local v29 = p28._node
		local v30 = v29._prev
		local v31 = v29._next
		if v31 ~= nil then
			v31._prev = v30
		end
		if v30 == nil then
			v29._signal._head = v31
		else
			v30._next = v31
		end
		v29._connection = nil
		p28._node = nil
	end
end
v_u_2.destroy = v_u_2.Disconnect
v_u_2.Destroy = v_u_2.Disconnect
v_u_2.disconnect = v_u_2.Disconnect
v_u_1.destroy = v_u_1.Destroy
v_u_1.Disconnect = v_u_1.Destroy
v_u_1.disconnect = v_u_1.Destroy
v_u_1.connect = v_u_1.Connect
v_u_1.wait = v_u_1.Wait
v_u_1.fire = v_u_1.Fire
return v_u_1
