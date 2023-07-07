-- decompiled by Sentinel (took 343.144µs)
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("HDAdminSetup")):GetMain()
v1.humanoidRigType = (v1.player.Character or v1.player.CharacterAdded:Wait()):WaitForChild("Humanoid").RigType
wait(1)
for v2, _ in pairs(v1.commandSpeeds) do
	if v1.commandsActive[v2] then
		v1.commandsActive[v2] = nil
		v1:GetModule("cf"):ActivateClientCommand(v2)
	end
end
