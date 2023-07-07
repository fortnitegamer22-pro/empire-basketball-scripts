-- decompiled by Sentinel (took 540.621µs)
local v_u_1 = game.Players.LocalPlayer
local v_u_2 = game:GetService("TweenService")
game:GetService("MarketplaceService")
script.Parent.TextButton.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_1
	game:GetService("MarketplaceService"):PromptProductPurchase(v_u_1, 1549499609)
end)
script.Parent.Parent.NoButton.TextButton.MouseButton1Click:Connect(function()
	-- upvalues: (copy) v_u_2
	v_u_2:Create(script.Parent.Parent, TweenInfo.new(0.4), {
		["Position"] = UDim2.fromScale(0.322, 1.2)
	}):Play()
end)
