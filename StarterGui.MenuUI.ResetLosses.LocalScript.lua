-- decompiled by Sentinel (took 441.167µs)
local v_u_1 = game.Players.LocalPlayer
local _ = v_u_1.Character
local v2 = script.Parent.TextButton
local v_u_3 = false
local _ = game.ReplicatedStorage.Remotes
v2.MouseButton1Click:Connect(function()
	-- upvalues: (ref) v_u_3, (copy) v_u_1
	if not v_u_3 then
		game:GetService("MarketplaceService"):PromptProductPurchase(v_u_1, 1549499791)
		v_u_3 = true
		task.wait(2)
		v_u_3 = false
	end
end)
