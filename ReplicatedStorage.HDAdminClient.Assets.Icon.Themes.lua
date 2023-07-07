-- decompiled by Sentinel (took 245.774µs)
local v1 = {}
for _, v2 in pairs(script:GetChildren()) do
	if v2:IsA("ModuleScript") then
		v1[v2.Name] = require(v2)
	end
end
return v1
