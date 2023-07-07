-- decompiled by Sentinel (took 3.104515ms)
local v_u_1 = require(script.Parent:WaitForChild("CameraUtils"))
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new()
	-- upvalues: (copy) v_u_2
	local v3 = setmetatable({}, v_u_2)
	v3.transparencyDirty = false
	v3.enabled = false
	v3.lastTransparency = nil
	v3.descendantAddedConn = nil
	v3.descendantRemovingConn = nil
	v3.toolDescendantAddedConns = {}
	v3.toolDescendantRemovingConns = {}
	v3.cachedParts = {}
	return v3
end
function v_u_2.HasToolAncestor(p4, p5)
	if p5.Parent == nil then
		return false
	end
	assert(p5.Parent, "")
	return p5.Parent:IsA("Tool") or p4:HasToolAncestor(p5.Parent)
end
function v_u_2.IsValidPartToModify(p6, p7)
	if p7:IsA("BasePart") or p7:IsA("Decal") then
		return not p6:HasToolAncestor(p7)
	else
		return false
	end
end
function v_u_2.CachePartsRecursive(p8, p9)
	if p9 then
		if p8:IsValidPartToModify(p9) then
			p8.cachedParts[p9] = true
			p8.transparencyDirty = true
		end
		for _, v10 in pairs(p9:GetChildren()) do
			p8:CachePartsRecursive(v10)
		end
	end
end
function v_u_2.TeardownTransparency(p11)
	for v12, _ in pairs(p11.cachedParts) do
		v12.LocalTransparencyModifier = 0
	end
	p11.cachedParts = {}
	p11.transparencyDirty = true
	p11.lastTransparency = nil
	if p11.descendantAddedConn then
		p11.descendantAddedConn:disconnect()
		p11.descendantAddedConn = nil
	end
	if p11.descendantRemovingConn then
		p11.descendantRemovingConn:disconnect()
		p11.descendantRemovingConn = nil
	end
	for v13, v14 in pairs(p11.toolDescendantAddedConns) do
		v14:Disconnect()
		p11.toolDescendantAddedConns[v13] = nil
	end
	for v15, v16 in pairs(p11.toolDescendantRemovingConns) do
		v16:Disconnect()
		p11.toolDescendantRemovingConns[v15] = nil
	end
end
function v_u_2.SetupTransparency(p_u_17, p_u_18)
	p_u_17:TeardownTransparency()
	if p_u_17.descendantAddedConn then
		p_u_17.descendantAddedConn:disconnect()
	end
	p_u_17.descendantAddedConn = p_u_18.DescendantAdded:Connect(function(p19)
		-- upvalues: (copy) p_u_17, (copy) p_u_18
		if p_u_17:IsValidPartToModify(p19) then
			p_u_17.cachedParts[p19] = true
			p_u_17.transparencyDirty = true
		elseif p19:IsA("Tool") then
			if p_u_17.toolDescendantAddedConns[p19] then
				p_u_17.toolDescendantAddedConns[p19]:Disconnect()
			end
			p_u_17.toolDescendantAddedConns[p19] = p19.DescendantAdded:Connect(function(p20)
				-- upvalues: (ref) p_u_17
				p_u_17.cachedParts[p20] = nil
				if p20:IsA("BasePart") or p20:IsA("Decal") then
					p20.LocalTransparencyModifier = 0
				end
			end)
			if p_u_17.toolDescendantRemovingConns[p19] then
				p_u_17.toolDescendantRemovingConns[p19]:disconnect()
			end
			p_u_17.toolDescendantRemovingConns[p19] = p19.DescendantRemoving:Connect(function(p21)
				-- upvalues: (ref) p_u_18, (ref) p_u_17
				wait()
				if p_u_18 and p21 and p21:IsDescendantOf(p_u_18) and p_u_17:IsValidPartToModify(p21) then
					p_u_17.cachedParts[p21] = true
					p_u_17.transparencyDirty = true
				end
			end)
		end
	end)
	if p_u_17.descendantRemovingConn then
		p_u_17.descendantRemovingConn:disconnect()
	end
	p_u_17.descendantRemovingConn = p_u_18.DescendantRemoving:connect(function(p22)
		-- upvalues: (copy) p_u_17
		if p_u_17.cachedParts[p22] then
			p_u_17.cachedParts[p22] = nil
			p22.LocalTransparencyModifier = 0
		end
	end)
	p_u_17:CachePartsRecursive(p_u_18)
end
function v_u_2.Enable(p23, p24)
	if p23.enabled ~= p24 then
		p23.enabled = p24
	end
end
function v_u_2.SetSubject(p25, p26)
	local v27 = nil
	if p26 then
		if p26:IsA("Humanoid") then
			v27 = p26.Parent
		end
	end
	if p26 then
		if p26:IsA("VehicleSeat") then
			if p26.Occupant then
				v27 = p26.Occupant.Parent
			end
		end
	end
	if v27 then
		p25:SetupTransparency(v27)
	else
		p25:TeardownTransparency()
	end
end
function v_u_2.Update(p28, p29)
	-- upvalues: (copy) v_u_1
	local v30 = workspace.CurrentCamera
	if v30 and p28.enabled then
		local v31 = (v30.Focus.p - v30.CoordinateFrame.p).magnitude
		local v32 = v31 < 2 and 1 - (v31 - 0.5) / 1.5 or 0
		local v33 = v32 < 0.5 and 0 or v32
		if p28.lastTransparency and v33 < 1 and p28.lastTransparency < 0.95 then
			local v34 = 2.8 * p29
			v33 = p28.lastTransparency + math.clamp(v33 - p28.lastTransparency, -v34, v34)
		else
			p28.transparencyDirty = true
		end
		local v35 = math.clamp(v_u_1.Round(v33, 2), 0, 1)
		if p28.transparencyDirty or p28.lastTransparency ~= v35 then
			for v36, _ in pairs(p28.cachedParts) do
				v36.LocalTransparencyModifier = v35
			end
			p28.transparencyDirty = false
			p28.lastTransparency = v35
		end
	end
end
return v_u_2
