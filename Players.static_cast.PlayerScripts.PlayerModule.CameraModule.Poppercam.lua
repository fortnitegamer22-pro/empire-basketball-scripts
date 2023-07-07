-- decompiled by Sentinel (took 1.634205ms)
local v_u_1 = require(script.Parent:WaitForChild("ZoomController"))
local v_u_2 = {}
v_u_2.__index = v_u_2
local v_u_3 = CFrame.new()
function v_u_2.new()
	-- upvalues: (copy) v_u_2
	return setmetatable({
		["lastCFrame"] = nil
	}, v_u_2)
end
function v_u_2.Step(p4, p5, p6)
	-- upvalues: (copy) v_u_3
	local v7 = p4.lastCFrame or p6
	p4.lastCFrame = p6
	local v_u_8 = p6.Position
	local _, _, _, v9, v10, v11, v12, v13, v14, v15, v16, v17 = p6:GetComponents()
	local v_u_18 = CFrame.new(0, 0, 0, v9, v10, v11, v12, v13, v14, v15, v16, v17)
	local _, _, _, v19, v20, v21, v22, v23, v24, v25, v26, v27 = v7:GetComponents()
	local v_u_28 = (v_u_8 - v7.p) / p5
	local v29, v30 = (v_u_18 * CFrame.new(0, 0, 0, v19, v20, v21, v22, v23, v24, v25, v26, v27):inverse()):ToAxisAngle()
	local v_u_31 = v29 * v30 / p5
	return {
		["extrapolate"] = function(p32)
			-- upvalues: (copy) v_u_28, (copy) v_u_8, (copy) v_u_31, (ref) v_u_3, (copy) v_u_18
			local v33 = v_u_28 * p32 + v_u_8
			local v34 = v_u_31 * p32
			local v35 = v34.Magnitude
			local v36
			if 0.00001 < v35 then
				v36 = CFrame.fromAxisAngle(v34, v35)
			else
				v36 = v_u_3
			end
			return v36 * v_u_18 + v33
		end, 
		["posVelocity"] = v_u_28, 
		["rotVelocity"] = v_u_31
	}
end
function v_u_2.Reset(p37)
	p37.lastCFrame = nil
end
local v_u_38 = require(script.Parent:WaitForChild("BaseOcclusion"))
local v_u_39 = setmetatable({}, v_u_38)
v_u_39.__index = v_u_39
function v_u_39.new()
	-- upvalues: (copy) v_u_38, (copy) v_u_39, (copy) v_u_2
	local v40 = setmetatable(v_u_38.new(), v_u_39)
	v40.focusExtrapolator = v_u_2.new()
	return v40
end
function v_u_39.GetOcclusionMode(_)
	return Enum.DevCameraOcclusionMode.Zoom
end
function v_u_39.Enable(p41, _)
	p41.focusExtrapolator:Reset()
end
function v_u_39.Update(p42, p43, p44, p45, _)
	-- upvalues: (copy) v_u_1
	local v46 = CFrame.new(p45.p, p44.p) * CFrame.new(0, 0, 0, -1, 0, 0, 0, 1, 0, 0, 0, -1)
	return v46 * CFrame.new(0, 0, (v_u_1.Update(p43, v46, (p42.focusExtrapolator:Step(p43, v46))))), p45
end
function v_u_39.CharacterAdded(_, _, _) end
function v_u_39.CharacterRemoving(_, _, _) end
function v_u_39.OnCameraSubjectChanged(_, _) end
return v_u_39
