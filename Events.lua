-- decompiled by Sentinel (took 699.167µs)
local _ = _G.HDAdminMain
local v_u_8 = {
	["DoubleJumped"] = function(p_u_1, p2, ...)
		local v_u_3 = 0
		local v_u_4 = true
		p2:GetPropertyChangedSignal("Jump"):Connect(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_3, (copy) p_u_1
			if v_u_4 then
				v_u_4 = false
				v_u_3 = v_u_3 + 1
				if v_u_3 == 4 then
					p_u_1:Fire()
				end
				wait()
				v_u_4 = true
				wait(0.2)
				v_u_3 = v_u_3 - 1
			end
		end)
	end, 
	["EventName"] = function(_, _, ...) end, 
	["New"] = function(_, p5, p6, ...)
		-- upvalues: (copy) v_u_8
		local v7 = Instance.new("BindableEvent")
		v_u_8[p5](v7, p6, ...)
		v7.Parent = p6
		return v7
	end
}
return v_u_8
