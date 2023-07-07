-- decompiled by Sentinel (took 731.633µs)
local v1 = {}
local v_u_2 = _G.HDAdminMain
function v1.GetRankName(_, p3)
	-- upvalues: (copy) v_u_2
	return v_u_2:GetModule("cf"):GetRankName(p3)
end
function v1.GetRankId(_, p4)
	-- upvalues: (copy) v_u_2
	return v_u_2:GetModule("cf"):GetRankId(p4)
end
function v1.Notice(_, p5, p6)
	-- upvalues: (copy) v_u_2
	if v_u_2.player then
		if p6 then
			v_u_2:GetModule("Notices"):Notice("Notice", "Game Notice", p6)
			return
		end
	else
		v_u_2:GetModule("cf"):Notice(p5, "Game Notice", p6)
	end
end
function v1.Error(_, p7, p8)
	-- upvalues: (copy) v_u_2
	if v_u_2.player then
		if p8 then
			v_u_2:GetModule("Notices"):Notice("Error", "Game Notice", p8)
			return
		end
	else
		v_u_2.signals.Error:FireClient(p7, { "Game Notice", p8 })
	end
end
return v1
