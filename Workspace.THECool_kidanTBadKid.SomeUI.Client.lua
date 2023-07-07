-- decompiled by Sentinel (took 609.333µs)
local v_u_1 = TweenInfo.new(0.5)
local v_u_2 = game:GetService("TweenService")
local _ = workspace.CurrentCamera.FieldOfView
local function v_u_5(p3, p4)
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	v_u_2:Create(p4, v_u_1, {
		["Size"] = UDim2.new(-p3, 0, 1, 0)
	}):Play()
end
game.ReplicatedStorage.Remotes.UpdateTakeover.OnClientEvent:Connect(function(p6)
	-- upvalues: (copy) v_u_5
	v_u_5(p6.TakeoverValue / 100, game.Players.LocalPlayer.PlayerGui.PlayerCard.Takeover.Fill)
end)
