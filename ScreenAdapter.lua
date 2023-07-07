-- decompiled by Sentinel (took 1.308944ms)
local v_u_1 = _G.HDAdminMain
local v_u_2 = 0
local v_u_3 = {
	[v_u_1.gui.MainFrame] = 0.78, 
	[v_u_1.gui.MenuTemplates.Template5] = 0.78, 
	[v_u_1.gui.MenuTemplates.Template6] = 0.78, 
	[v_u_1.gui.MenuTemplates.Template7] = 0.78, 
	[v_u_1.gui.MenuTemplates.Template9] = 0.78, 
	[v_u_1.gui.MenuTemplates.Template10] = 1.17, 
	[v_u_1.gui.MenuTemplates.Template11] = 1.17, 
	[v_u_1.gui.MenuTemplates.Template12] = 0.78
}
local v_u_4 = {
	["Phone"] = 1, 
	["Tablet"] = 0.8, 
	["Computer"] = 0.6
}
local function v_u_10()
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_3
	local v5 = v_u_4.Computer
	if v_u_1.device == "Mobile" then
		if v_u_1.tablet then
			v5 = v_u_4.Tablet
		else
			v5 = v_u_4.Phone
		end
	end
	for v6, v7 in pairs(v_u_3) do
		local v8
		if 1 < v7 then
			v8 = v5 / 1.5
		else
			v8 = v5
		end
		v6.Position = UDim2.new(0, 0, (1 - v8) / 2, 0)
		v6.Size = UDim2.new(0, 0, v8, 0)
		local v9 = v6.AbsoluteSize.Y * v7
		v6.Position = UDim2.new(0.5, -v9 / 2, v6.Position.Y.Scale, v6.Position.Y.Offset)
		v6.Size = UDim2.new(0, v9, v6.Size.Y.Scale, v6.Size.Y.Offset)
	end
end
v_u_1.gui.Changed:Connect(function(p11)
	-- upvalues: (ref) v_u_2, (copy) v_u_10, (copy) v_u_1
	if p11 == "AbsoluteSize" then
		v_u_2 = v_u_2 + 1
		wait(0.5)
		v_u_2 = v_u_2 - 1
		if v_u_2 == 0 then
			v_u_10()
			v_u_1:GetModule("PageAbout"):CreateCredits()
		end
	end
end)
v_u_10()
return {}
