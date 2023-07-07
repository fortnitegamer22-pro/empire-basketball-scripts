-- decompiled by Sentinel (took 333.856µs)
local v1 = game.Players.LocalPlayer;
(v1.Character or v1.CharacterAdded:Wait()):WaitForChild("Humanoid")
local v2 = v1.Character
game:GetService("UserInputService")
local v3 = game.ReplicatedStorage.Remotes
local _ = v2.HumanoidRootPart
v2:SetAttribute("Direction")
while true do
	task.wait(0.1)
	v3.ChangeDirection:FireServer()
end
