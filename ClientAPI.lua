-- decompiled by Sentinel (took 447.541µs)
local v1 = {}
local v_u_2 = _G.HDAdminMain
function v1.SetTopbarTransparency(_, p3)
	local _ = tonumber(p3) or 0.5
end
function v1.SetTopbarEnabled(_, p4)
	-- upvalues: (copy) v_u_2
	local v5 = type(p4) ~= "boolean" and true or p4
	local v6 = v_u_2:GetModule("TopbarIcon")
	if v6 then
		v6:setEnabled(v5)
	end
end
return v1
