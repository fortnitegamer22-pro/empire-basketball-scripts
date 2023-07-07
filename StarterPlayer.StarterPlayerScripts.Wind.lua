-- decompiled by Sentinel (took 1.461037ms)
repeat
	task.wait()
until game:IsLoaded()
local v_u_1 = game.Workspace.CurrentCamera
local v2 = game:GetService("RunService")
local v_u_3 = {}
local v_u_4 = Vector3.new(1, 0, 1)
function GetLifetime()
	return math.random(3.625, 10.875)
end
function NewWindParticle()
	-- upvalues: (copy) v_u_1, (ref) v_u_4, (copy) v_u_3
	local v5 = {}
	local v6 = v_u_1.CFrame * CFrame.new(math.random(-27, 27), math.random(-2, 5), math.random(-9, 40.5))
	v5.Particle = script.WindParticle:Clone()
	v5.StartingY = v5.Particle.CFrame.Position.Y
	v5.T = math.pi / 2
	v5.LifeTime = GetLifetime()
	v5.CreationTime = tick()
	v5.Direction = v_u_4 * 0.075
	if math.random(1, 2) == 1 then
		v5.Direction = -v5.Direction
	end
	v5.Particle.CFrame = CFrame.new(v6.Position, v6.Position + v5.Direction * 2)
	local v7 = v5.Particle.Attachment0
	v7.WorldPosition = v7.WorldPosition - Vector3.new(0, -1.5, 0)
	local _ = v5.Particle.Trail.Transparency
	v5.Particle.Parent = workspace
	table.insert(v_u_3, v5)
end
function Handle(p8, _)
	-- upvalues: (copy) v_u_3
	local v9 = p8.Particle
	v9.CFrame = v9.CFrame * CFrame.new(p8.Direction.X, p8.StartingY * math.sin(p8.T * 2) * 0.4, p8.Direction.Z)
	p8.T = p8.T + 0.02
	if tick() - p8.CreationTime >= p8.LifeTime then
		p8.Particle.Trail.Enabled = false
	end
	if tick() - p8.CreationTime >= p8.LifeTime + 1.5 then
		p8.Particle:Destroy()
		table.remove(v_u_3, table.find(v_u_3, p8))
	end
end
local v_u_10 = 0
local v_u_11 = tick()
v2.RenderStepped:Connect(function(p12)
	-- upvalues: (ref) v_u_11, (ref) v_u_4, (ref) v_u_10, (copy) v_u_3
	if 30 <= tick() - v_u_11 then
		repeat
			task.wait()
			v_u_4 = Vector3.new(math.random(-1, 1), 0, math.random(-1, 1))
		until 0 < v_u_4.Magnitude
		v_u_11 = tick()
	end
	if 0.2 <= tick() - v_u_10 then
		task.spawn(function()
			NewWindParticle()
		end)
		v_u_10 = tick()
	end
	for _, v13 in v_u_3, nil, nil do
		Handle(v13, p12)
	end
end)
