-- decompiled by Sentinel (took 420.344µs)
local _ = game.Players.LocalPlayer.Character
local v1 = script.Parent.TextButton
local v_u_2 = false
local v_u_3 = game.ReplicatedStorage.Remotes
v1.MouseButton1Click:Connect(function()
	-- upvalues: (ref) v_u_2, (copy) v_u_3
	if not v_u_2 then
		v_u_3.Avatar.PlayerAvatar:FireServer("Hello fellow exploiter. You have been caught!")
		v_u_2 = true
		task.wait(2)
		v_u_2 = false
	end
end)
