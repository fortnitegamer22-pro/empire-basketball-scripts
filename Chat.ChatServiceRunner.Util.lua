-- decompiled by Sentinel (took 1.934458ms)
local v1 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatConstants")).StandardPriority
local v_u_2 = v1 == nil and 10 or v1
local v3 = {}
v3.__index = v3
local v_u_4 = {}
local v_u_5 = {}
v_u_5.__index = v_u_5
function v_u_5.RebuildProcessCommandsPriorities(p6)
	-- block 9
	p6.RegisteredPriorites = {}
	local v7, v8, v9
	-- GenericForInit
v7, v8, v9 = pairs(p6.FunctionMap)
[internal control] = v9
-- end GenericForInit
	::l2::
	local v10, v11
	-- GenericForNext
v10, v11 = v7(v8, [internal control])
if v10 ~= nil
[internal control] = v10
-- end GenericForNext
	::l0::
	local v12 = true
	::l5::
	if not v12 then
		table.insert(p6.RegisteredPriorites, v10)
	end
	goto l2
	::l1::
	local v13, v14, v15
	-- GenericForInit
v13, v14, v15 = pairs(v11)
[internal control] = v15
-- end GenericForInit
	local v16, v17
	-- GenericForNext
v16, v17 = v13(v14, [internal control])
if v16 ~= nil
[internal control] = v16
-- end GenericForNext
	-- block 2
	goto l5
	::l3::
	v12 = false
	goto l5
	-- block 4
	goto l0
	::l5::
	goto l1
	::l6::
	goto l3
	::l7::
	goto l8
	::l8::
	table.sort(p6.RegisteredPriorites, function(p18, p19)
		return p19 < p18
	end)
	return
	-- block 10
	goto l6
	-- block 11
	goto l7
end
function v_u_5.HasFunction(p20, p21)
	return p20.RegisteredFunctions[p21] ~= nil
end
function v_u_5.RemoveFunction(p22, p23)
	p22.RegisteredFunctions[p23] = nil
	p22.FunctionMap[p22.RegisteredFunctions[p23]][p23] = nil
	p22:RebuildProcessCommandsPriorities()
end
function v_u_5.AddFunction(p24, p25, p26, p27)
	-- upvalues: (ref) v_u_2
	if p27 == nil then
		p27 = v_u_2
	end
	if p24.RegisteredFunctions[p25] then
		error(p25 .. " is already in use!")
	end
	p24.RegisteredFunctions[p25] = p27
	if p24.FunctionMap[p27] == nil then
		p24.FunctionMap[p27] = {}
	end
	p24.FunctionMap[p27][p25] = p26
	p24:RebuildProcessCommandsPriorities()
end
function v_u_5.GetIterator(p_u_28)
	local v_u_29 = 1
	local v_u_30 = nil
	local v_u_31 = nil
	return function()
		-- upvalues: (ref) v_u_29, (copy) p_u_28, (ref) v_u_30, (ref) v_u_31
		while true do
			if v_u_29 > #p_u_28.RegisteredPriorites then
				return
			end
			local v32 = p_u_28.RegisteredPriorites[v_u_29]
			local v33, v34 = next(p_u_28.FunctionMap[v32], v_u_30)
			v_u_30 = v33
			v_u_31 = v34
			if v_u_30 ~= nil then
				return v_u_30, v_u_31, v32
			end
			v_u_29 = v_u_29 + 1
		end
	end
end
function v_u_4.new()
	-- upvalues: (copy) v_u_5
	local v35 = setmetatable({}, v_u_5)
	v35.RegisteredFunctions = {}
	v35.RegisteredPriorites = {}
	v35.FunctionMap = {}
	return v35
end
function v3.NewSortedFunctionContainer(_)
	-- upvalues: (copy) v_u_4
	return v_u_4.new()
end
return v3
