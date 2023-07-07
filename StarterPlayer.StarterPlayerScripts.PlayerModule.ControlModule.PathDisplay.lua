-- decompiled by Sentinel (took 1.816504ms)
local v_u_1 = {
	["spacing"] = 8, 
	["image"] = "rbxasset://textures/Cursors/Gamepad/Pointer.png", 
	["imageSize"] = Vector2.new(2, 2)
}
local v_u_2 = {}
local v_u_3 = {}
local v_u_4 = Instance.new("Model")
v_u_4.Name = "PathDisplayPoints"
local v5 = Instance.new("Part")
v5.Anchored = true
v5.CanCollide = false
v5.Transparency = 1
v5.Name = "PathDisplayAdornee"
v5.CFrame = CFrame.new(0, 0, 0)
v5.Parent = v_u_4
local v_u_6 = {}
local v_u_7 = 30
for v8 = 1, v_u_7 do
	local v9 = Instance.new("ImageHandleAdornment")
	v9.Archivable = false
	v9.Adornee = v5
	v9.Image = v_u_1.image
	v9.Size = v_u_1.imageSize
	v_u_6[v8] = v9
end
local function v_u_16(p10, _)
	-- upvalues: (ref) v_u_7, (copy) v_u_6, (copy) v_u_4
	if v_u_7 == 0 then
		return nil
	end
	local v11, v12, v13 = workspace:FindPartOnRayWithIgnoreList(Ray.new(p10 + Vector3.new(0, 2, 0), (Vector3.new(0, -8, 0))), { game.Players.LocalPlayer.Character, workspace.CurrentCamera })
	if not v11 then
		return nil
	end
	local v14 = CFrame.new(v12, v12 + v13)
	local v15 = v_u_6[1]
	if v15 then
		v_u_6[1] = v_u_6[v_u_7]
		v_u_6[v_u_7] = nil
		v_u_7 = v_u_7 - 1
	else
		v15 = nil
	end
	v15.CFrame = v14
	v15.Parent = v_u_4
	return v15
end
function v_u_1.setCurrentPoints(p17)
	-- upvalues: (ref) v_u_2
	if typeof(p17) == "table" then
		v_u_2 = p17
	else
		v_u_2 = {}
	end
end
function v_u_1.clearRenderedPath()
	-- upvalues: (ref) v_u_3, (ref) v_u_7, (copy) v_u_6, (copy) v_u_4
	for _, v18 in ipairs(v_u_3) do
		v18.Parent = nil
		v_u_7 = v_u_7 + 1
		v_u_6[v_u_7] = v18
	end
	v_u_3 = {}
	v_u_4.Parent = nil
end
function v_u_1.renderPath()
	-- upvalues: (copy) v_u_1, (ref) v_u_2, (ref) v_u_3, (copy) v_u_16, (copy) v_u_4
	v_u_1.clearRenderedPath()
	if v_u_2 and #v_u_2 ~= 0 then
		local v19 = #v_u_2
		v_u_3[1] = v_u_16(v_u_2[v19], true)
		if v_u_3[1] then
			local v20 = 0
			while true do
				local v21 = v_u_2[v19]
				local v22 = v_u_2[v19 - 1]
				if v19 < 2 then
					break
				end
				local v23 = v22 - v21
				local v24 = v23.magnitude
				if v24 < v20 then
					v20 = v20 - v24
					v19 = v19 - 1
				else
					local v25 = v_u_16(v21 + v23.unit * v20, false)
					if v25 then
						v_u_3[#v_u_3 + 1] = v25
					end
					v20 = v20 + v_u_1.spacing
				end
			end
			v_u_4.Parent = workspace.CurrentCamera
		end
	else
		return
	end
end
return v_u_1
