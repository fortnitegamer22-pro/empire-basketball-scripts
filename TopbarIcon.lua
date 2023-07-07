-- decompiled by Sentinel (took 829.397µs)
local v_u_1 = _G.HDAdminMain
local _ = v_u_1.playerGui
local v2 = game:GetService("ReplicatedStorage")
local v3 = v2:FindFirstChild("HDAdmin")
if v3 then
	v3 = v3:FindFirstChild("Topbar+")
end
if v3 then
	local v4 = require(v3.IconController):createIcon("HDAdmin", 4882428756, 0)
	v4:setToggleMenu(v_u_1.gui.MainFrame)
	return v4
end
local v5 = nil
local v6 = v2:FindFirstChild("TopbarPlusReference")
local v7
if v6 then
	v7 = v6.Value
else
	v7 = v_u_1.client.Assets.Icon
	v5 = require(v7.Themes.BlueGradient)
end
local v8 = require(v7).new():setImage(4882428756, "deselected"):setImage(6326373239, "selected"):setImageYScale(0.5, "selected"):bindToggleItem(v_u_1.gui.MainFrame):setOrder(0)
if v5 then
	v8:setTheme(v5)
end
task.defer(function()
	-- upvalues: (copy) v_u_1
	v_u_1:GetModule("cf"):RankChangedUpdater()
end)
return v8
