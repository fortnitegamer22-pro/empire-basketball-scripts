-- decompiled by Sentinel (took 718.61µs)
local v1 = {
	["Notices"] = true
}
for _, v2 in pairs(script.Parent.Parent:GetChildren()) do
	if v2:IsA("Frame") then
		if v1[v2.Name] then
			v2.Visible = true
		else
			v2.Visible = false
		end
	elseif v2:IsA("Folder") then
		for _, v3 in pairs(v2:GetChildren()) do
			if v3:IsA("Frame") then
				v3.Visible = false
			end
		end
	end
end
