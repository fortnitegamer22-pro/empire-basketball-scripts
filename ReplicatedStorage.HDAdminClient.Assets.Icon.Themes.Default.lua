-- decompiled by Sentinel (took 848.169µs)
local v1 = {
	["action"] = {
		["toggleTransitionInfo"] = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
		["resizeInfo"] = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
		["repositionInfo"] = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
		["captionFadeInfo"] = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
		["tipFadeInfo"] = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
		["dropdownSlideInfo"] = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), 
		["menuSlideInfo"] = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	}
}
local v2 = {
	["deselected"] = {
		["iconBackgroundColor"] = Color3.fromRGB(0, 0, 0), 
		["iconBackgroundTransparency"] = 0.5, 
		["iconCornerRadius"] = UDim.new(0.25, 0), 
		["iconGradientColor"] = ColorSequence.new(Color3.fromRGB(255, 255, 255)), 
		["iconGradientRotation"] = 0, 
		["iconImage"] = "", 
		["iconImageColor"] = Color3.fromRGB(255, 255, 255), 
		["iconImageTransparency"] = 0, 
		["iconImageYScale"] = 0.63, 
		["iconImageRatio"] = 1, 
		["iconLabelYScale"] = 0.45, 
		["iconScale"] = UDim2.new(1, 0, 1, 0), 
		["forcedIconSizeX"] = 32, 
		["forcedIconSizeY"] = 32, 
		["iconSize"] = UDim2.new(0, 32, 0, 32), 
		["iconOffset"] = UDim2.new(0, 0, 0, 0), 
		["iconText"] = "", 
		["iconTextColor"] = Color3.fromRGB(255, 255, 255), 
		["iconFont"] = Enum.Font.GothamSemibold, 
		["noticeCircleColor"] = Color3.fromRGB(255, 255, 255), 
		["noticeCircleImage"] = "http://www.roblox.com/asset/?id=4871790969", 
		["noticeTextColor"] = Color3.fromRGB(31, 33, 35), 
		["baseZIndex"] = 1, 
		["order"] = 1, 
		["alignment"] = "left", 
		["clickSoundId"] = "rbxassetid://5273899897", 
		["clickVolume"] = 0, 
		["clickPlaybackSpeed"] = 1, 
		["clickTimePosition"] = 0.12
	}, 
	["selected"] = {
		["iconBackgroundColor"] = Color3.fromRGB(245, 245, 245), 
		["iconBackgroundTransparency"] = 0.1, 
		["iconImageColor"] = Color3.fromRGB(57, 60, 65), 
		["iconTextColor"] = Color3.fromRGB(57, 60, 65), 
		["clickPlaybackSpeed"] = 1.5
	}
}
v1.toggleable = v2
v1.other = {
	["captionBackgroundColor"] = Color3.fromRGB(0, 0, 0), 
	["captionBackgroundTransparency"] = 0.5, 
	["captionTextColor"] = Color3.fromRGB(255, 255, 255), 
	["captionTextTransparency"] = 0, 
	["captionFont"] = Enum.Font.GothamSemibold, 
	["captionOverlineColor"] = Color3.fromRGB(0, 170, 255), 
	["captionOverlineTransparency"] = 0, 
	["captionCornerRadius"] = UDim.new(0.25, 0), 
	["tipBackgroundColor"] = Color3.fromRGB(255, 255, 255), 
	["tipBackgroundTransparency"] = 0.1, 
	["tipTextColor"] = Color3.fromRGB(27, 42, 53), 
	["tipTextTransparency"] = 0, 
	["tipFont"] = Enum.Font.GothamSemibold, 
	["tipCornerRadius"] = UDim.new(0.175, 0), 
	["dropdownAlignment"] = "auto", 
	["dropdownMaxIconsBeforeScroll"] = 3, 
	["dropdownMinWidth"] = 32, 
	["dropdownSquareCorners"] = false, 
	["dropdownBindToggleToIcon"] = true, 
	["dropdownToggleOnLongPress"] = false, 
	["dropdownToggleOnRightClick"] = false, 
	["dropdownCloseOnTapAway"] = false, 
	["dropdownHidePlayerlistOnOverlap"] = true, 
	["dropdownListPadding"] = UDim.new(0, 2), 
	["dropdownScrollBarColor"] = Color3.fromRGB(25, 25, 25), 
	["dropdownScrollBarTransparency"] = 0.2, 
	["dropdownScrollBarThickness"] = 4, 
	["menuDirection"] = "auto", 
	["menuMaxIconsBeforeScroll"] = 4, 
	["menuBindToggleToIcon"] = true, 
	["menuToggleOnLongPress"] = false, 
	["menuToggleOnRightClick"] = false, 
	["menuCloseOnTapAway"] = false, 
	["menuScrollBarColor"] = Color3.fromRGB(25, 25, 25), 
	["menuScrollBarTransparency"] = 0.2, 
	["menuScrollBarThickness"] = 4
}
return v1
