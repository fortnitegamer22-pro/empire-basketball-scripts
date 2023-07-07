-- decompiled by Sentinel (took 723.552µs)
local v1 = {}
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.GetInstance(p3, p4)
	if p3.InstancePoolsByClass[p4] == nil then
		p3.InstancePoolsByClass[p4] = {}
	end
	local v5 = #p3.InstancePoolsByClass[p4]
	if 0 >= v5 then
		return Instance.new(p4)
	end
	table.remove(p3.InstancePoolsByClass[p4])
	return p3.InstancePoolsByClass[p4][v5]
end
function v_u_2.ReturnInstance(p6, p7)
	if p6.InstancePoolsByClass[p7.ClassName] == nil then
		p6.InstancePoolsByClass[p7.ClassName] = {}
	end
	if #p6.InstancePoolsByClass[p7.ClassName] < p6.PoolSizePerType then
		table.insert(p6.InstancePoolsByClass[p7.ClassName], p7)
	else
		p7:Destroy()
	end
end
function v1.new(p8)
	-- upvalues: (copy) v_u_2
	local v9 = setmetatable({}, v_u_2)
	v9.InstancePoolsByClass = {}
	v9.Name = "ObjectPool"
	v9.PoolSizePerType = p8
	return v9
end
return v1
