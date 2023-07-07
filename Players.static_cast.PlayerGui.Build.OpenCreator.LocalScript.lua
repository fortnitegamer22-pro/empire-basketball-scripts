-- decompiled by Sentinel (took 380.271µs)
local v1 = script.Parent.TextButton
local v_u_2 = false
v1.MouseButton1Click:Connect(function()
	-- upvalues: (ref) v_u_2
	if not v_u_2 then
		game.ReplicatedStorage.Remotes.Teleport:FireServer()
		v_u_2 = false
		task.wait(2.5)
		v_u_2 = true
	end
end)
