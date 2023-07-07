-- decompiled by Sentinel (took 1.404657ms)
local v_u_1 = game:GetService("StarterGui")
local v_u_2 = game:GetService("RunService")
local function v_u_5(p3, ...)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v4 = {}
	for _ = 1, 8 do
		v4 = { pcall(v_u_1[p3], v_u_1, ...) }
		if v4[1] then
			break
		end
		v_u_2.Stepped:Wait()
	end
	return unpack(v4)
end
pcall(function()
	-- upvalues: (ref) v_u_5
	assert(v_u_5("SetCore", "ResetButtonCallback", false))
end)
game:GetService("RunService").RenderStepped:Connect(function()
	pcall(function()
		game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
	end)
end)
