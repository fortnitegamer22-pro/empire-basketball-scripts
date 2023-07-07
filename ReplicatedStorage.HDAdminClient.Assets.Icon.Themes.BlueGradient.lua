-- decompiled by Sentinel (took 696.72µs)
local v1 = Color3.fromRGB(0, 170, 255)
local v2 = Color3.fromRGB(0, 120, 180)
local v3 = Color3.fromRGB(255, 255, 255)
local v4 = {
	["action"] = {
		["resizeInfo"] = TweenInfo.new(0.2, Enum.EasingStyle.Back), 
		["repositionInfo"] = TweenInfo.new(0.2, Enum.EasingStyle.Back)
	}
}
local v5 = {
	["deselected"] = {
		["iconGradientColor"] = ColorSequence.new(v1, v2), 
		["iconGradientRotation"] = 90, 
		["noticeCircleColor"] = v1, 
		["noticeCircleImage"] = "http://www.roblox.com/asset/?id=4882430005", 
		["noticeTextColor"] = v3, 
		["captionOverlineColor"] = v1
	}, 
	["selected"] = {
		["iconBackgroundColor"] = Color3.fromRGB(255, 255, 255), 
		["iconBackgroundTransparency"] = 0.1, 
		["iconGradientColor"] = ColorSequence.new(v1, v2), 
		["iconGradientRotation"] = 90, 
		["iconImageColor"] = Color3.fromRGB(255, 255, 255), 
		["iconTextColor"] = Color3.fromRGB(255, 255, 255), 
		["noticeCircleColor"] = v3, 
		["noticeTextColor"] = v1
	}
}
v4.toggleable = v5
v4.other = {}
return v4
