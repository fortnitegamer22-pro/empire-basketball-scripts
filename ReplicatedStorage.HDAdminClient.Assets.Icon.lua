-- decompiled by Sentinel (took 32.960917ms)
game:GetService("LocalizationService")
local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("Debris")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("HttpService")
local v_u_5 = game:GetService("RunService")
local v_u_6 = game:GetService("TextService")
local v_u_7 = game:GetService("StarterGui")
local v_u_8 = game:GetService("GuiService")
game:GetService("LocalizationService")
local _ = game:GetService("Players").LocalPlayer
local v9 = script
local v10 = require(v9.TopbarPlusReference)
local v11 = v10.getObject()
local v12
if v11 then
	v12 = v11.Value
else
	v12 = v11
end
if v12 and v12 ~= v9 then
	return require(v12)
end
if not v11 then
	v10.addToReplicatedStorage()
end
local v_u_13 = {}
v_u_13.__index = v_u_13
local v_u_14 = require(v9.IconController)
local v_u_15 = require(v9.Signal)
local v_u_16 = require(v9.Maid)
local v_u_17 = require(v9.TopbarPlusGui)
local v18 = require(v9.Themes)
local v_u_19 = v_u_17.ActiveItems
local v_u_20 = v_u_17.TopbarContainer
local v_u_21 = v_u_20.IconContainer
local v_u_22 = v18.Default
local v_u_23 = {}
function v_u_13.new()
	-- upvalues: (copy) v_u_13, (copy) v_u_16, (copy) v_u_21, (copy) v_u_20, (copy) v_u_23, (copy) v_u_7, (copy) v_u_14, (copy) v_u_1, (copy) v_u_15, (copy) v_u_4, (copy) v_u_22, (copy) v_u_3, (copy) v_u_5
	local v_u_24 = {}
	local v25 = v_u_13
	setmetatable(v_u_24, v25)
	local v26 = v_u_16.new()
	v_u_24._maid = v26
	v_u_24._hoveringMaid = v26:give(v_u_16.new())
	v_u_24._dropdownClippingMaid = v26:give(v_u_16.new())
	v_u_24._menuClippingMaid = v26:give(v_u_16.new())
	local v_u_27 = {}
	v_u_24.instances = v_u_27
	local v28 = v26:give(v_u_21:Clone())
	v28.Visible = true
	v28.Parent = v_u_20
	v_u_27.iconContainer = v28
	v_u_27.iconButton = v28.IconButton
	v_u_27.iconImage = v_u_27.iconButton.IconImage
	v_u_27.iconLabel = v_u_27.iconButton.IconLabel
	v_u_27.fakeIconLabel = v_u_27.iconButton.FakeIconLabel
	v_u_27.iconGradient = v_u_27.iconButton.IconGradient
	v_u_27.iconCorner = v_u_27.iconButton.IconCorner
	v_u_27.iconOverlay = v28.IconOverlay
	v_u_27.iconOverlayCorner = v_u_27.iconOverlay.IconOverlayCorner
	v_u_27.noticeFrame = v_u_27.iconButton.NoticeFrame
	v_u_27.noticeLabel = v_u_27.noticeFrame.NoticeLabel
	v_u_27.captionContainer = v28.CaptionContainer
	v_u_27.captionFrame = v_u_27.captionContainer.CaptionFrame
	v_u_27.captionLabel = v_u_27.captionContainer.CaptionLabel
	v_u_27.captionCorner = v_u_27.captionFrame.CaptionCorner
	v_u_27.captionOverlineContainer = v_u_27.captionContainer.CaptionOverlineContainer
	v_u_27.captionOverline = v_u_27.captionOverlineContainer.CaptionOverline
	v_u_27.captionOverlineCorner = v_u_27.captionOverline.CaptionOverlineCorner
	v_u_27.captionVisibilityBlocker = v_u_27.captionFrame.CaptionVisibilityBlocker
	v_u_27.captionVisibilityCorner = v_u_27.captionVisibilityBlocker.CaptionVisibilityCorner
	v_u_27.tipFrame = v28.TipFrame
	v_u_27.tipLabel = v_u_27.tipFrame.TipLabel
	v_u_27.tipCorner = v_u_27.tipFrame.TipCorner
	v_u_27.dropdownContainer = v28.DropdownContainer
	v_u_27.dropdownFrame = v_u_27.dropdownContainer.DropdownFrame
	v_u_27.dropdownList = v_u_27.dropdownFrame.DropdownList
	v_u_27.menuContainer = v28.MenuContainer
	v_u_27.menuFrame = v_u_27.menuContainer.MenuFrame
	v_u_27.menuList = v_u_27.menuFrame.MenuList
	v_u_27.clickSound = v28.ClickSound
	v_u_24._settings = {
		["action"] = {
			["toggleTransitionInfo"] = {}, 
			["resizeInfo"] = {}, 
			["repositionInfo"] = {}, 
			["captionFadeInfo"] = {}, 
			["tipFadeInfo"] = {}, 
			["dropdownSlideInfo"] = {}, 
			["menuSlideInfo"] = {}
		}, 
		["toggleable"] = {
			["iconBackgroundColor"] = {
				["instanceNames"] = { "iconButton" }, 
				["propertyName"] = "BackgroundColor3"
			}, 
			["iconBackgroundTransparency"] = {
				["instanceNames"] = { "iconButton" }, 
				["propertyName"] = "BackgroundTransparency"
			}, 
			["iconCornerRadius"] = {
				["instanceNames"] = { "iconCorner", "iconOverlayCorner" }, 
				["propertyName"] = "CornerRadius"
			}, 
			["iconGradientColor"] = {
				["instanceNames"] = { "iconGradient" }, 
				["propertyName"] = "Color"
			}, 
			["iconGradientRotation"] = {
				["instanceNames"] = { "iconGradient" }, 
				["propertyName"] = "Rotation"
			}, 
			["iconImage"] = {
				["callMethods"] = { v_u_24._updateIconSize }, 
				["instanceNames"] = { "iconImage" }, 
				["propertyName"] = "Image"
			}, 
			["iconImageColor"] = {
				["instanceNames"] = { "iconImage" }, 
				["propertyName"] = "ImageColor3"
			}, 
			["iconImageTransparency"] = {
				["instanceNames"] = { "iconImage" }, 
				["propertyName"] = "ImageTransparency"
			}, 
			["iconScale"] = {
				["instanceNames"] = { "iconButton" }, 
				["propertyName"] = "Size"
			}, 
			["forcedIconSizeX"] = {}, 
			["forcedIconSizeY"] = {}, 
			["iconSize"] = {
				["callSignals"] = { v_u_24.updated }, 
				["callMethods"] = { v_u_24._updateIconSize }, 
				["instanceNames"] = { "iconContainer" }, 
				["propertyName"] = "Size", 
				["tweenAction"] = "resizeInfo"
			}, 
			["iconOffset"] = {
				["instanceNames"] = { "iconButton" }, 
				["propertyName"] = "Position"
			}, 
			["iconText"] = {
				["callMethods"] = { v_u_24._updateIconSize }, 
				["instanceNames"] = { "iconLabel" }, 
				["propertyName"] = "Text"
			}, 
			["iconTextColor"] = {
				["instanceNames"] = { "iconLabel" }, 
				["propertyName"] = "TextColor3"
			}, 
			["iconFont"] = {
				["callMethods"] = { v_u_24._updateIconSize }, 
				["instanceNames"] = { "iconLabel" }, 
				["propertyName"] = "Font"
			}, 
			["iconImageYScale"] = {
				["callMethods"] = { v_u_24._updateIconSize }
			}, 
			["iconImageRatio"] = {
				["callMethods"] = { v_u_24._updateIconSize }
			}, 
			["iconLabelYScale"] = {
				["callMethods"] = { v_u_24._updateIconSize }
			}, 
			["noticeCircleColor"] = {
				["instanceNames"] = { "noticeFrame" }, 
				["propertyName"] = "ImageColor3"
			}, 
			["noticeCircleImage"] = {
				["instanceNames"] = { "noticeFrame" }, 
				["propertyName"] = "Image"
			}, 
			["noticeTextColor"] = {
				["instanceNames"] = { "noticeLabel" }, 
				["propertyName"] = "TextColor3"
			}, 
			["noticeImageTransparency"] = {
				["instanceNames"] = { "noticeFrame" }, 
				["propertyName"] = "ImageTransparency"
			}, 
			["noticeTextTransparency"] = {
				["instanceNames"] = { "noticeLabel" }, 
				["propertyName"] = "TextTransparency"
			}, 
			["baseZIndex"] = {
				["callMethods"] = { v_u_24._updateBaseZIndex }
			}, 
			["order"] = {
				["callSignals"] = { v_u_24.updated }, 
				["instanceNames"] = { "iconContainer" }, 
				["propertyName"] = "LayoutOrder"
			}, 
			["alignment"] = {
				["callSignals"] = { v_u_24.updated }, 
				["callMethods"] = { v_u_24._updateDropdown }
			}, 
			["iconImageVisible"] = {
				["instanceNames"] = { "iconImage" }, 
				["propertyName"] = "Visible"
			}, 
			["iconImageAnchorPoint"] = {
				["instanceNames"] = { "iconImage" }, 
				["propertyName"] = "AnchorPoint"
			}, 
			["iconImagePosition"] = {
				["instanceNames"] = { "iconImage" }, 
				["propertyName"] = "Position", 
				["tweenAction"] = "resizeInfo"
			}, 
			["iconImageSize"] = {
				["instanceNames"] = { "iconImage" }, 
				["propertyName"] = "Size", 
				["tweenAction"] = "resizeInfo"
			}, 
			["iconImageTextXAlignment"] = {
				["instanceNames"] = { "iconImage" }, 
				["propertyName"] = "TextXAlignment"
			}, 
			["iconLabelVisible"] = {
				["instanceNames"] = { "iconLabel" }, 
				["propertyName"] = "Visible"
			}, 
			["iconLabelAnchorPoint"] = {
				["instanceNames"] = { "iconLabel" }, 
				["propertyName"] = "AnchorPoint"
			}, 
			["iconLabelPosition"] = {
				["instanceNames"] = { "iconLabel" }, 
				["propertyName"] = "Position", 
				["tweenAction"] = "resizeInfo"
			}, 
			["iconLabelSize"] = {
				["instanceNames"] = { "iconLabel" }, 
				["propertyName"] = "Size", 
				["tweenAction"] = "resizeInfo"
			}, 
			["iconLabelTextXAlignment"] = {
				["instanceNames"] = { "iconLabel" }, 
				["propertyName"] = "TextXAlignment"
			}, 
			["iconLabelTextSize"] = {
				["instanceNames"] = { "iconLabel" }, 
				["propertyName"] = "TextSize"
			}, 
			["noticeFramePosition"] = {
				["instanceNames"] = { "noticeFrame" }, 
				["propertyName"] = "Position"
			}, 
			["clickSoundId"] = {
				["instanceNames"] = { "clickSound" }, 
				["propertyName"] = "SoundId"
			}, 
			["clickVolume"] = {
				["instanceNames"] = { "clickSound" }, 
				["propertyName"] = "Volume"
			}, 
			["clickPlaybackSpeed"] = {
				["instanceNames"] = { "clickSound" }, 
				["propertyName"] = "PlaybackSpeed"
			}, 
			["clickTimePosition"] = {
				["instanceNames"] = { "clickSound" }, 
				["propertyName"] = "TimePosition"
			}
		}, 
		["other"] = {
			["captionBackgroundColor"] = {
				["instanceNames"] = { "captionFrame" }, 
				["propertyName"] = "BackgroundColor3"
			}, 
			["captionBackgroundTransparency"] = {
				["instanceNames"] = { "captionFrame" }, 
				["propertyName"] = "BackgroundTransparency", 
				["group"] = "caption"
			}, 
			["captionBlockerTransparency"] = {
				["instanceNames"] = { "captionVisibilityBlocker" }, 
				["propertyName"] = "BackgroundTransparency", 
				["group"] = "caption"
			}, 
			["captionOverlineColor"] = {
				["instanceNames"] = { "captionOverline" }, 
				["propertyName"] = "BackgroundColor3"
			}, 
			["captionOverlineTransparency"] = {
				["instanceNames"] = { "captionOverline" }, 
				["propertyName"] = "BackgroundTransparency", 
				["group"] = "caption"
			}, 
			["captionTextColor"] = {
				["instanceNames"] = { "captionLabel" }, 
				["propertyName"] = "TextColor3"
			}, 
			["captionTextTransparency"] = {
				["instanceNames"] = { "captionLabel" }, 
				["propertyName"] = "TextTransparency", 
				["group"] = "caption"
			}, 
			["captionFont"] = {
				["instanceNames"] = { "captionLabel" }, 
				["propertyName"] = "Font"
			}, 
			["captionCornerRadius"] = {
				["instanceNames"] = { "captionCorner", "captionOverlineCorner", "captionVisibilityCorner" }, 
				["propertyName"] = "CornerRadius"
			}, 
			["tipBackgroundColor"] = {
				["instanceNames"] = { "tipFrame" }, 
				["propertyName"] = "BackgroundColor3"
			}, 
			["tipBackgroundTransparency"] = {
				["instanceNames"] = { "tipFrame" }, 
				["propertyName"] = "BackgroundTransparency", 
				["group"] = "tip"
			}, 
			["tipTextColor"] = {
				["instanceNames"] = { "tipLabel" }, 
				["propertyName"] = "TextColor3"
			}, 
			["tipTextTransparency"] = {
				["instanceNames"] = { "tipLabel" }, 
				["propertyName"] = "TextTransparency", 
				["group"] = "tip"
			}, 
			["tipFont"] = {
				["instanceNames"] = { "tipLabel" }, 
				["propertyName"] = "Font"
			}, 
			["tipCornerRadius"] = {
				["instanceNames"] = { "tipCorner" }, 
				["propertyName"] = "CornerRadius"
			}, 
			["dropdownSize"] = {
				["instanceNames"] = { "dropdownContainer" }, 
				["propertyName"] = "Size", 
				["unique"] = "dropdown"
			}, 
			["dropdownCanvasSize"] = {
				["instanceNames"] = { "dropdownFrame" }, 
				["propertyName"] = "CanvasSize"
			}, 
			["dropdownMaxIconsBeforeScroll"] = {
				["callMethods"] = { v_u_24._updateDropdown }
			}, 
			["dropdownMinWidth"] = {
				["callMethods"] = { v_u_24._updateDropdown }
			}, 
			["dropdownSquareCorners"] = {
				["callMethods"] = { v_u_24._updateDropdown }
			}, 
			["dropdownBindToggleToIcon"] = {}, 
			["dropdownToggleOnLongPress"] = {}, 
			["dropdownToggleOnRightClick"] = {}, 
			["dropdownCloseOnTapAway"] = {}, 
			["dropdownHidePlayerlistOnOverlap"] = {}, 
			["dropdownListPadding"] = {
				["callMethods"] = { v_u_24._updateDropdown }, 
				["instanceNames"] = { "dropdownList" }, 
				["propertyName"] = "Padding"
			}, 
			["dropdownAlignment"] = {
				["callMethods"] = { v_u_24._updateDropdown }
			}, 
			["dropdownScrollBarColor"] = {
				["instanceNames"] = { "dropdownFrame" }, 
				["propertyName"] = "ScrollBarImageColor3"
			}, 
			["dropdownScrollBarTransparency"] = {
				["instanceNames"] = { "dropdownFrame" }, 
				["propertyName"] = "ScrollBarImageTransparency"
			}, 
			["dropdownScrollBarThickness"] = {
				["instanceNames"] = { "dropdownFrame" }, 
				["propertyName"] = "ScrollBarThickness"
			}, 
			["dropdownIgnoreClipping"] = {
				["callMethods"] = { v_u_24._dropdownIgnoreClipping }
			}, 
			["menuSize"] = {
				["instanceNames"] = { "menuContainer" }, 
				["propertyName"] = "Size", 
				["unique"] = "menu"
			}, 
			["menuCanvasSize"] = {
				["instanceNames"] = { "menuFrame" }, 
				["propertyName"] = "CanvasSize"
			}, 
			["menuMaxIconsBeforeScroll"] = {
				["callMethods"] = { v_u_24._updateMenu }
			}, 
			["menuBindToggleToIcon"] = {}, 
			["menuToggleOnLongPress"] = {}, 
			["menuToggleOnRightClick"] = {}, 
			["menuCloseOnTapAway"] = {}, 
			["menuListPadding"] = {
				["callMethods"] = { v_u_24._updateMenu }, 
				["instanceNames"] = { "menuList" }, 
				["propertyName"] = "Padding"
			}, 
			["menuDirection"] = {
				["callMethods"] = { v_u_24._updateMenu }
			}, 
			["menuScrollBarColor"] = {
				["instanceNames"] = { "menuFrame" }, 
				["propertyName"] = "ScrollBarImageColor3"
			}, 
			["menuScrollBarTransparency"] = {
				["instanceNames"] = { "menuFrame" }, 
				["propertyName"] = "ScrollBarImageTransparency"
			}, 
			["menuScrollBarThickness"] = {
				["instanceNames"] = { "menuFrame" }, 
				["propertyName"] = "ScrollBarThickness"
			}, 
			["menuIgnoreClipping"] = {
				["callMethods"] = { v_u_24._menuIgnoreClipping }
			}
		}
	}
	v_u_24._groupSettings = {}
	for _, v29 in pairs(v_u_24._settings) do
		for v30, v31 in pairs(v29) do
			local v32 = v31.group
			if v32 then
				local v33 = v_u_24._groupSettings[v32]
				if not v33 then
					v33 = {}
					v_u_24._groupSettings[v32] = v33
				end
				table.insert(v33, v30)
				v31.forcedGroupValue = v_u_23[v32]
				v31.useForcedGroupValue = true
			end
		end
	end
	v_u_24._settingsDictionary = {}
	v_u_24._uniqueSettings = {}
	v_u_24._uniqueSettingsDictionary = {}
	v_u_24.uniqueValues = {}
	local v62 = {
		["dropdown"] = function(_, p34, p35, p36)
			-- upvalues: (copy) v_u_24, (ref) v_u_7, (ref) v_u_14, (ref) v_u_1
			local v37 = v_u_24:get("dropdownSlideInfo")
			local v38 = v_u_24:get("dropdownBindToggleToIcon")
			local v39
			if v_u_24:get("dropdownHidePlayerlistOnOverlap") == true then
				v39 = v_u_24:get("alignment") == "right"
			else
				v39 = false
			end
			local _ = v_u_24.instances.dropdownContainer
			local v40 = v_u_24.instances.dropdownFrame
			local v41 = true
			local v42 = not v_u_24.isSelected
			if v38 == false then
				v42 = not v_u_24.dropdownOpen
			end
			local v43 = v_u_24._longPressing or v_u_24._rightClicking
			if not v_u_24._tappingAway and (not v42 or v43) then
				if not v43 then
					::l14::
					if 0 < #v_u_24.dropdownIcons and v41 and v39 then
						if v_u_7:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList) then
							v_u_14._bringBackPlayerlist = v_u_14._bringBackPlayerlist and v_u_14._bringBackPlayerlist + 1 or 1
							v_u_24._bringBackPlayerlist = true
							v_u_7:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
						end
					elseif v_u_24._bringBackPlayerlist and not v41 and v_u_14._bringBackPlayerlist then
						local v44 = v_u_14
						v44._bringBackPlayerlist = v44._bringBackPlayerlist - 1
						if v_u_14._bringBackPlayerlist <= 0 then
							v_u_14._bringBackPlayerlist = nil
							v_u_7:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
						end
						v_u_24._bringBackPlayerlist = nil
					end
					local v45 = v_u_1:Create(p34, v37, {
						[p35] = p36
					})
					local v_u_46 = nil
					v_u_46 = v45.Completed:Connect(function()
						-- upvalues: (ref) v_u_46
						v_u_46:Disconnect()
					end)
					v45:Play()
					if not v41 then
						v_u_24._dropdownCanvasPos = v40.CanvasPosition
					end
					v40.ScrollingEnabled = v41
					v_u_24.dropdownOpen = v41
					v_u_24:_decideToCallSignal("dropdown")
					return
				end
				if not v_u_24.dropdownOpen then
					goto l14
				end
			end
			local v47 = v_u_24:get("dropdownSize")
			local v48 = v47 and v47.X.Offset / 1 or 0
			p36 = UDim2.new(0, v48, 0, 0)
			v41 = false
			goto l14
		end, 
		["menu"] = function(_, p49, p50, p51)
			-- upvalues: (copy) v_u_24, (ref) v_u_1
			local v52 = v_u_24:get("menuSlideInfo")
			local v53 = v_u_24:get("menuBindToggleToIcon")
			local _ = v_u_24.instances.menuContainer
			local v54 = v_u_24.instances.menuFrame
			local v55 = true
			local v56 = not v_u_24.isSelected
			if v53 == false then
				v56 = not v_u_24.menuOpen
			end
			local v57 = v_u_24._longPressing or v_u_24._rightClicking
			if not v_u_24._tappingAway and (not v56 or v57) then
				if not v57 then
					::l10::
					if v55 ~= v_u_24.menuOpen then
						v_u_24.updated:Fire()
					end
					if v55 then
						if v52.EasingDirection == Enum.EasingDirection.Out then
							v52 = TweenInfo.new(v52.Time, v52.EasingStyle, Enum.EasingDirection.In)
						end
					end
					local v58 = v_u_1:Create(p49, v52, {
						[p50] = p51
					})
					local v_u_59 = nil
					v_u_59 = v58.Completed:Connect(function()
						-- upvalues: (ref) v_u_59
						v_u_59:Disconnect()
					end)
					v58:Play()
					if v55 then
						if v_u_24._menuCanvasPos then
							v54.CanvasPosition = v_u_24._menuCanvasPos
						end
					else
						v_u_24._menuCanvasPos = v54.CanvasPosition
					end
					v54.ScrollingEnabled = v55
					v_u_24.menuOpen = v55
					v_u_24:_decideToCallSignal("menu")
					return
				end
				if not v_u_24.menuOpen then
					goto l10
				end
			end
			local v60 = v_u_24:get("menuSize")
			local v61 = v60 and v60.Y.Offset / 1 or 0
			p51 = UDim2.new(0, 0, 0, v61)
			v55 = false
			goto l10
		end
	}
	for v63, v64 in pairs(v_u_24._settings) do
		for v65, v66 in pairs(v64) do
			if v63 == "toggleable" then
				v66.values = v66.values or {
					["deselected"] = nil, 
					["selected"] = nil
				}
			else
				v66.value = nil
			end
			v66.additionalValues = {}
			v66.type = v63
			v_u_24._settingsDictionary[v65] = v66
			local v67 = v66.unique
			if v67 then
				local v68 = v_u_24._uniqueSettings[v67] or {}
				table.insert(v68, v65)
				v_u_24._uniqueSettings[v67] = v68
				v_u_24._uniqueSettingsDictionary[v65] = v62[v67]
			end
		end
	end
	v_u_24.updated = v26:give(v_u_15.new())
	v_u_24.selected = v26:give(v_u_15.new())
	v_u_24.deselected = v26:give(v_u_15.new())
	v_u_24.toggled = v26:give(v_u_15.new())
	v_u_24.userSelected = v26:give(v_u_15.new())
	v_u_24.userDeselected = v26:give(v_u_15.new())
	v_u_24.userToggled = v26:give(v_u_15.new())
	v_u_24.hoverStarted = v26:give(v_u_15.new())
	v_u_24.hoverEnded = v26:give(v_u_15.new())
	v_u_24.dropdownOpened = v26:give(v_u_15.new())
	v_u_24.dropdownClosed = v26:give(v_u_15.new())
	v_u_24.menuOpened = v26:give(v_u_15.new())
	v_u_24.menuClosed = v26:give(v_u_15.new())
	v_u_24.notified = v26:give(v_u_15.new())
	v_u_24._endNotices = v26:give(v_u_15.new())
	v_u_24._ignoreClippingChanged = v26:give(v_u_15.new())
	local function v_u_75(p_u_69, p70)
		-- upvalues: (copy) v_u_24
		local v71 = v_u_24._parentIcon
		v_u_24:set(p_u_69 .. "IgnoreClipping", p70)
		if p70 == true and v71 then
			local v_u_73 = v71._ignoreClippingChanged:Connect(function(_, p72)
				-- upvalues: (ref) v_u_24, (copy) p_u_69
				v_u_24:set(p_u_69 .. "IgnoreClipping", p72)
			end)
			local v_u_74 = nil
			v_u_74 = v_u_24[p_u_69 .. "Closed"]:Connect(function()
				-- upvalues: (ref) v_u_74, (copy) v_u_73
				v_u_74:Disconnect()
				v_u_73:Disconnect()
			end)
		end
	end
	v_u_24.dropdownOpened:Connect(function()
		-- upvalues: (copy) v_u_75
		v_u_75("dropdown", true)
	end)
	v_u_24.dropdownClosed:Connect(function()
		-- upvalues: (copy) v_u_75
		v_u_75("dropdown", false)
	end)
	v_u_24.menuOpened:Connect(function()
		-- upvalues: (copy) v_u_75
		v_u_75("menu", true)
	end)
	v_u_24.menuClosed:Connect(function()
		-- upvalues: (copy) v_u_75
		v_u_75("menu", false)
	end)
	v_u_24.deselectWhenOtherIconSelected = true
	v_u_24.name = ""
	v_u_24.isSelected = false
	v_u_24.presentOnTopbar = true
	v_u_24.accountForWhenDisabled = false
	v_u_24.enabled = true
	v_u_24.hovering = false
	v_u_24.tipText = nil
	v_u_24.captionText = nil
	v_u_24.totalNotices = 0
	v_u_24.notices = {}
	v_u_24.dropdownIcons = {}
	v_u_24.menuIcons = {}
	v_u_24.dropdownOpen = false
	v_u_24.menuOpen = false
	v_u_24.locked = false
	v_u_24.topPadding = UDim.new(0, 4)
	v_u_24.targetPosition = nil
	v_u_24.toggleItems = {}
	v_u_24.lockedSettings = {}
	v_u_24.UID = v_u_4:GenerateGUID(true)
	v_u_24.blockBackBehaviourChecks = {}
	v_u_24._draggingFinger = false
	v_u_24._updatingIconSize = true
	v_u_24._previousDropdownOpen = false
	v_u_24._previousMenuOpen = false
	v_u_24._bindedToggleKeys = {}
	v_u_24._bindedEvents = {}
	v_u_24:setName("UnnamedIcon")
	v_u_24:setTheme(v_u_22, true)
	v_u_27.iconButton.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_24
		if not v_u_24.locked then
			if v_u_24.isSelected then
				v_u_24:deselect()
				v_u_24.userDeselected:Fire()
				v_u_24.userToggled:Fire(false)
				return true
			end
			v_u_24:select()
			v_u_24.userSelected:Fire()
			v_u_24.userToggled:Fire(true)
		end
	end)
	v_u_27.iconButton.MouseButton2Click:Connect(function()
		-- upvalues: (copy) v_u_24
		v_u_24._rightClicking = true
		if v_u_24:get("dropdownToggleOnRightClick") == true then
			v_u_24:_update("dropdownSize")
		end
		if v_u_24:get("menuToggleOnRightClick") == true then
			v_u_24:_update("menuSize")
		end
		v_u_24._rightClicking = false
	end)
	v_u_27.iconButton.MouseButton1Down:Connect(function()
		-- upvalues: (copy) v_u_24
		if not v_u_24.locked then
			v_u_24:_updateStateOverlay(0.7, Color3.new(0, 0, 0))
		end
	end)
	v_u_27.iconButton.MouseButton1Up:Connect(function()
		-- upvalues: (copy) v_u_24
		if not v_u_24.overlayLocked then
			v_u_24:_updateStateOverlay(0.9, Color3.new(1, 1, 1))
		end
	end)
	v_u_3.InputBegan:Connect(function(p76, p77)
		-- upvalues: (copy) v_u_24
		if not p77 and ({
			[Enum.UserInputType.MouseButton1] = true, 
			[Enum.UserInputType.MouseButton2] = true, 
			[Enum.UserInputType.MouseButton3] = true, 
			[Enum.UserInputType.Touch] = true
		})[p76.UserInputType] then
			v_u_24._tappingAway = true
			if v_u_24.dropdownOpen and v_u_24:get("dropdownCloseOnTapAway") == true then
				v_u_24:_update("dropdownSize")
			end
			if v_u_24.menuOpen and v_u_24:get("menuCloseOnTapAway") == true then
				v_u_24:_update("menuSize")
			end
			v_u_24._tappingAway = false
		end
		if v_u_24._bindedToggleKeys[p76.KeyCode] and not (p77 or v_u_24.locked) then
			if v_u_24.isSelected then
				v_u_24:deselect()
				v_u_24.userDeselected:Fire()
				v_u_24.userToggled:Fire(false)
				return
			end
			v_u_24:select()
			v_u_24.userSelected:Fire()
			v_u_24.userToggled:Fire(true)
		end
	end)
	v_u_24.hoverStarted:Connect(function(_, _)
		-- upvalues: (copy) v_u_24
		v_u_24.hovering = true
		if not v_u_24.locked then
			v_u_24:_updateStateOverlay(0.9, Color3.fromRGB(255, 255, 255))
		end
		v_u_24:_updateHovering()
	end)
	v_u_24.hoverEnded:Connect(function()
		-- upvalues: (copy) v_u_24
		v_u_24.hovering = false
		v_u_24:_updateStateOverlay(1)
		v_u_24._hoveringMaid:clean()
		v_u_24:_updateHovering()
	end)
	v_u_27.iconButton.MouseEnter:Connect(function(p78, p79)
		-- upvalues: (copy) v_u_24
		v_u_24.hoverStarted:Fire(p78, p79)
	end)
	v_u_27.iconButton.MouseLeave:Connect(function()
		-- upvalues: (copy) v_u_24
		v_u_24.hoverEnded:Fire()
	end)
	v_u_27.iconButton.SelectionGained:Connect(function()
		-- upvalues: (copy) v_u_24
		v_u_24.hoverStarted:Fire()
	end)
	v_u_27.iconButton.SelectionLost:Connect(function()
		-- upvalues: (copy) v_u_24
		v_u_24.hoverEnded:Fire()
	end)
	v_u_27.iconButton.MouseButton1Down:Connect(function()
		-- upvalues: (copy) v_u_24, (ref) v_u_5, (copy) v_u_27
		if v_u_24._draggingFinger then
			v_u_24.hoverStarted:Fire()
		end
		local v_u_80 = nil
		local v_u_81 = nil
		local v_u_82 = tick() + 0.7
		v_u_80 = v_u_5.Heartbeat:Connect(function()
			-- upvalues: (copy) v_u_82, (ref) v_u_81, (ref) v_u_80, (ref) v_u_24
			if v_u_82 <= tick() then
				v_u_81:Disconnect()
				v_u_80:Disconnect()
				v_u_24._longPressing = true
				if v_u_24:get("dropdownToggleOnLongPress") == true then
					v_u_24:_update("dropdownSize")
				end
				if v_u_24:get("menuToggleOnLongPress") == true then
					v_u_24:_update("menuSize")
				end
				v_u_24._longPressing = false
			end
		end)
		v_u_81 = v_u_27.iconButton.MouseButton1Up:Connect(function()
			-- upvalues: (ref) v_u_81, (ref) v_u_80
			v_u_81:Disconnect()
			v_u_80:Disconnect()
		end)
	end)
	if v_u_3.TouchEnabled then
		v_u_27.iconButton.MouseButton1Up:Connect(function()
			-- upvalues: (copy) v_u_24
			if v_u_24.hovering then
				v_u_24.hoverEnded:Fire()
			end
		end)
		v_u_3.TouchMoved:Connect(function(_, p83)
			-- upvalues: (copy) v_u_24
			if not p83 then
				v_u_24._draggingFinger = true
			end
		end)
		v_u_3.TouchEnded:Connect(function()
			-- upvalues: (copy) v_u_24
			v_u_24._draggingFinger = false
		end)
	end
	v_u_24._updatingIconSize = false
	v_u_24:_updateIconSize()
	v_u_14.iconAdded:Fire(v_u_24)
	return v_u_24
end
function v_u_13.mimic(p84)
	-- upvalues: (copy) v_u_14, (copy) v_u_13
	local v85 = p84 .. "Mimic"
	local v86 = v_u_14.getIcon(v85)
	if v86 then
		return v86
	end
	local v87 = v_u_13.new()
	v87:setName(v85)
	if p84 == "Chat" then
		v87:setOrder(-1)
		v87:setImage("rbxasset://textures/ui/TopBar/chatOff.png", "deselected")
		v87:setImage("rbxasset://textures/ui/TopBar/chatOn.png", "selected")
		v87:setImageYScale(0.625)
	end
	return v87
end
function v_u_13.set(p88, p89, p90, p91, p92)
	local v93 = p88._settingsDictionary[p89]
	local v94 = v93 ~= nil
	assert(v94, ("setting \'%s\' does not exist"):format(p89))
	if type(p91) == "string" then
		p91 = p91:lower()
	end
	local v95 = p88:get(p89, p91)
	if p91 == "hovering" then
		v93.hoveringValue = p90
		if p92 ~= "_ignorePrevious" then
			v93.additionalValues["previous_" .. p91] = v95
		end
		if type(p92) == "string" then
			v93.additionalValues[p92 .. "_" .. p91] = v95
		end
		p88:_update(p89)
	else
		local v96
		if v93.type == "toggleable" then
			local v97 = {}
			if p91 == "deselected" or p91 == "selected" then
				table.insert(v97, p91)
				v96 = p91
			else
				table.insert(v97, "deselected")
				table.insert(v97, "selected")
				v96 = nil
			end
			for _, v98 in pairs(v97) do
				v93.values[v98] = p90
				if p92 ~= "_ignorePrevious" then
					v93.additionalValues["previous_" .. v98] = v95
				end
				if type(p92) == "string" then
					v93.additionalValues[p92 .. "_" .. v98] = v95
				end
			end
		else
			v93.value = p90
			if type(p92) == "string" then
				if p92 ~= "_ignorePrevious" then
					v93.additionalValues.previous = v95
				end
				v93.additionalValues[p92] = v95
				v96 = p91
			else
				v96 = p91
			end
		end
		if v95 == p90 then
			return p88, "Value was already set"
		end
		local v99 = p88:getToggleState()
		if not p88._updateAfterSettingAll and v93.instanceNames and (v99 == v96 or v96 == nil) then
			if p89 == "iconSize" then
				if v95 then
					v95 = v95.X.Scale == 1
				end
			else
				v95 = false
			end
			p88:_update(p89, v99, v93.tweenAction and not v95 and p88:get(v93.tweenAction) or TweenInfo.new(0))
		end
	end
	if v93.callMethods then
		for _, v100 in pairs(v93.callMethods) do
			v100(p88, p90, p91)
		end
	end
	if v93.callSignals then
		for _, v101 in pairs(v93.callSignals) do
			v101:Fire()
		end
	end
	return p88
end
function v_u_13.setAdditionalValue(p102, p103, p104, p105, p106)
	local v107 = p102._settingsDictionary[p103]
	local v108 = v107 ~= nil
	assert(v108, ("setting \'%s\' does not exist"):format(p103))
	local v109 = p104 .. "_"
	if p106 then
		v109 = v109 .. p106
	end
	for v110, _ in pairs(v107.additionalValues) do
		if string.match(v110, v109) then
			v107.additionalValues[v110] = p105
		end
	end
end
function v_u_13.get(p111, p112, p113, p114)
	local v115 = p111._settingsDictionary[p112]
	local v116 = v115 ~= nil
	assert(v116, ("setting \'%s\' does not exist"):format(p112))
	local v117 = nil
	local v118 = nil
	if typeof(p113) == "string" then
		p113 = p113:lower()
	end
	if p113 == "hovering" then
		if p114 == nil then
			v117 = v115.hoveringValue
			if type(p114) == "string" then
				v118 = v115.additionalValues[p114 .. "_" .. p113]
			else
				v118 = false
			end
		end
	end
	if v115.type == "toggleable" then
		local v119 = (p113 == "deselected" or p113 == "selected") and p113 and p113 or p111:getToggleState()
		if v118 == nil then
			if type(p114) == "string" then
				v118 = v115.additionalValues[p114 .. "_" .. v119]
			else
				v118 = false
			end
		end
		if v117 == nil then
			return v115.values[v119], v118
		end
	else
		if v118 == nil then
			if type(p114) == "string" then
				v118 = v115.additionalValues[p114]
			else
				v118 = false
			end
		end
		if v117 == nil then
			v117 = v115.value
		end
	end
	return v117, v118
end
function v_u_13.getHovering(p120, p121)
	local v122 = p120._settingsDictionary[p121]
	local v123 = v122 ~= nil
	assert(v123, ("setting \'%s\' does not exist"):format(p121))
	return v122.hoveringValue
end
function v_u_13.getToggleState(p124, p125)
	return (p125 or p124.isSelected) and "selected" or "deselected"
end
function v_u_13.getIconState(p126)
	return p126.hovering and "hovering" or p126:getToggleState()
end
function v_u_13._update(p127, p128, p129, p130)
	-- upvalues: (copy) v_u_1
	local v131 = p127._settingsDictionary[p128]
	local v132 = v131 ~= nil
	assert(v132, ("setting \'%s\' does not exist"):format(p128))
	local v133 = p129 or p127:getToggleState()
	local v134 = not v131.value and v131.values
	if v134 then
		v134 = v131.values[v133]
	end
	if p127.hovering then
		if v131.hoveringValue then
			v134 = v131.hoveringValue
		end
	end
	if v134 ~= nil then
		local v135 = p130 or v131.tweenAction and v131.tweenAction ~= "" and p127:get(v131.tweenAction) or p127:get("toggleTransitionInfo") or TweenInfo.new(0.15)
		local v136 = v131.propertyName
		local v137 = {
			["string"] = true, 
			["NumberSequence"] = true, 
			["Text"] = true, 
			["EnumItem"] = true, 
			["ColorSequence"] = true
		}
		local v138 = p127._uniqueSettingsDictionary[p128]
		local v139
		if v131.useForcedGroupValue then
			v139 = v131.forcedGroupValue
		else
			v139 = v134
		end
		if v131.instanceNames then
			for _, v140 in pairs(v131.instanceNames) do
				local v141 = p127.instances[v140]
				local v142 = v141[v136]
				local v143 = v137[typeof(v142)] or typeof(v141) == "table"
				if v138 then
					v138(p128, v141, v136, v139)
				elseif v143 then
					v141[v136] = v134
				else
					v_u_1:Create(v141, v135, {
						[v136] = v139
					}):Play()
				end
				if p128 == "iconSize" and v141[v136] ~= v139 then
					p127.updated:Fire()
				end
			end
		end
	end
end
function v_u_13._updateAll(p144, p145, p146)
	for v147, v148 in pairs(p144._settingsDictionary) do
		if v148.instanceNames then
			p144:_update(v147, p145, p146)
		end
	end
	p144:_updateIconSize()
	p144:_updateCaptionSize()
	p144:_updateTipSize()
end
function v_u_13._updateHovering(p149, p150)
	for v151, v152 in pairs(p149._settingsDictionary) do
		if v152.instanceNames and v152.hoveringValue ~= nil then
			p149:_update(v151, nil, p150)
		end
	end
end
function v_u_13._updateStateOverlay(p153, p154, p155)
	local v156 = p153.instances.iconOverlay
	v156.BackgroundTransparency = p154 or 1
	v156.BackgroundColor3 = p155 or Color3.new(1, 1, 1)
end
function v_u_13.setTheme(p157, p158, p159)
	p157._updateAfterSettingAll = p159
	for v160, v161 in pairs(p158) do
		if v160 == "toggleable" then
			for v162, v163 in pairs(v161.deselected) do
				if not p157.lockedSettings[v162] then
					p157:set(v162, v163, "both")
				end
			end
			for v164, v165 in pairs(v161.selected) do
				if not p157.lockedSettings[v164] then
					p157:set(v164, v165, "selected")
				end
			end
		else
			for v166, v167 in pairs(v161) do
				if not p157.lockedSettings[v166] then
					local v168 = p157._settingsDictionary[v166]
					if v160 == "action" and v168 == nil then
						p157._settingsDictionary[v166] = {}
					end
					p157:set(v166, v167)
				end
			end
		end
	end
	p157._updateAfterSettingAll = nil
	if p159 then
		p157:_updateAll()
	end
	return p157
end
function v_u_13.getInstance(p169, p170)
	return p169.instances[p170]
end
function v_u_13.setInstance(p171, p172, p173)
	local v174 = p171.instances[p172]
	p171.instances[p172] = p173
	if v174 then
		v174:Destroy()
	end
	return p171
end
function v_u_13.getSettingDetail(p175, p176)
	for _, v177 in pairs(p175._settings) do
		for v178, v179 in pairs(v177) do
			if v178 == p176 then
				return v179
			end
		end
	end
	return false
end
function v_u_13.modifySetting(p180, p181, p182)
	local v183 = p180:getSettingDetail(p181)
	for v184, v185 in pairs(p182) do
		v183[v184] = v185
	end
	return p180
end
function v_u_13.convertLabelToNumberSpinner(p186, p_u_187)
	p186:set("iconLabelSize", UDim2.new(1, 0, 1, 0))
	p_u_187.Parent = p186:getInstance("iconButton")
	local v188 = {}
	setmetatable(v188, {
		["__newindex"] = function(_, p189, p190)
			-- upvalues: (copy) p_u_187
			for _, v191 in pairs(p_u_187.Frame:GetDescendants()) do
				if v191:IsA("TextLabel") then
					v191[p189] = p190
				end
			end
		end
	})
	p186:getInstance("iconButton").ZIndex = 0
	p186:setInstance("iconLabel", v188)
	p186:modifySetting("iconText", {
		["instanceNames"] = {}
	})
	p186:setInstance("iconLabelSpinner", p_u_187.Frame)
	for _, v192 in pairs({
		"iconLabelVisible", 
		"iconLabelAnchorPoint", 
		"iconLabelPosition", 
		"iconLabelSize"
	}) do
		p186:modifySetting(v192, {
			["instanceNames"] = { "iconLabelSpinner" }
		})
	end
	p186:_updateAll()
	return p186
end
function v_u_13.setEnabled(p193, p194)
	p193.enabled = p194
	p193.instances.iconContainer.Visible = p194
	p193.updated:Fire()
	return p193
end
function v_u_13.setName(p195, p196)
	p195.name = p196
	p195.instances.iconContainer.Name = p196
	return p195
end
function v_u_13.setProperty(p197, p198, p199)
	p197[p198] = p199
	return p197
end
function v_u_13._playClickSound(p200)
	-- upvalues: (copy) v_u_2
	local v201 = p200.instances.clickSound
	if v201.SoundId ~= nil and 0 < #v201.SoundId and 0 < v201.Volume then
		local v202 = v201:Clone()
		v202.Parent = v201.Parent
		v202:Play()
		v_u_2:AddItem(v202, v201.TimeLength)
	end
end
function v_u_13.select(p_u_203, p204)
	-- upvalues: (copy) v_u_14, (copy) v_u_3, (copy) v_u_16, (copy) v_u_8
	p_u_203.isSelected = true
	p_u_203:_setToggleItemsVisible(true, p204)
	p_u_203:_updateNotice()
	p_u_203:_updateAll()
	p_u_203:_playClickSound()
	if 0 < #p_u_203.dropdownIcons or 0 < #p_u_203.menuIcons then
		v_u_14:_updateSelectionGroup()
	end
	if v_u_3.GamepadEnabled then
		for _, v205 in pairs(p_u_203.toggleItems) do
			if 0 < #v205 then
				local v_u_206 = v_u_16.new()
				v_u_8:AddSelectionTuple(p_u_203.UID, unpack(v205))
				v_u_8.SelectedObject = v205[1]
				local v207 = v_u_14
				v207.activeButtonBCallbacks = v207.activeButtonBCallbacks + 1
				v_u_206:give(v_u_3.InputEnded:Connect(function(p208, _)
					-- upvalues: (copy) p_u_203, (ref) v_u_8
					local v209 = false
					for _, v210 in pairs(p_u_203.blockBackBehaviourChecks) do
						if v210() == true then
							v209 = true
							break
						end
					end
					if p208.KeyCode == Enum.KeyCode.ButtonB and not v209 then
						v_u_8.SelectedObject = p_u_203.instances.iconButton
						p_u_203:deselect()
					end
				end))
				v_u_206:give(p_u_203.deselected:Connect(function()
					-- upvalues: (copy) v_u_206
					v_u_206:clean()
				end))
				v_u_206:give(function()
					-- upvalues: (ref) v_u_14
					local v211 = v_u_14
					v211.activeButtonBCallbacks = v211.activeButtonBCallbacks - 1
					if v_u_14.activeButtonBCallbacks < 0 then
						v_u_14.activeButtonBCallbacks = 0
					end
				end)
			end
		end
	end
	p_u_203.selected:Fire()
	p_u_203.toggled:Fire(p_u_203.isSelected)
	return p_u_203
end
function v_u_13.deselect(p212, p213)
	-- upvalues: (copy) v_u_14, (copy) v_u_3, (copy) v_u_8
	p212.isSelected = false
	p212:_setToggleItemsVisible(false, p213)
	p212:_updateNotice()
	p212:_updateAll()
	p212:_playClickSound()
	if 0 < #p212.dropdownIcons or 0 < #p212.menuIcons then
		v_u_14:_updateSelectionGroup()
	end
	p212.deselected:Fire()
	p212.toggled:Fire(p212.isSelected)
	if v_u_3.GamepadEnabled then
		v_u_8:RemoveSelectionGroup(p212.UID)
	end
	return p212
end
function v_u_13.notify(p_u_214, p_u_215, p_u_216)
	-- upvalues: (copy) v_u_15, (copy) v_u_4
	coroutine.wrap(function()
		-- upvalues: (ref) p_u_215, (copy) p_u_214, (ref) v_u_15, (ref) p_u_216, (ref) v_u_4
		if not p_u_215 then
			p_u_215 = p_u_214.deselected
		end
		if p_u_214._parentIcon then
			p_u_214._parentIcon:notify(p_u_215)
		end
		local v_u_217 = v_u_15.new()
		local v218 = p_u_214._endNotices:Connect(function()
			-- upvalues: (copy) v_u_217
			v_u_217:Fire()
		end)
		local v219 = p_u_215:Connect(function()
			-- upvalues: (copy) v_u_217
			v_u_217:Fire()
		end)
		p_u_216 = p_u_216 or v_u_4:GenerateGUID(true)
		local v220 = {
			["completeSignal"] = v_u_217, 
			["clearNoticeEvent"] = p_u_215
		}
		p_u_214.notices[p_u_216] = v220
		local v221 = p_u_214
		v221.totalNotices = v221.totalNotices + 1
		p_u_214:_updateNotice()
		p_u_214.notified:Fire(p_u_216)
		v_u_217:Wait()
		v218:Disconnect()
		v219:Disconnect()
		v_u_217:Disconnect()
		local v222 = p_u_214
		v222.totalNotices = v222.totalNotices - 1
		p_u_214.notices[p_u_216] = nil
		p_u_214:_updateNotice()
	end)()
	return p_u_214
end
function v_u_13._updateNotice(p223)
	local v224 = p223.totalNotices >= 1
	if not p223.isSelected then
		if 0 < #p223.dropdownIcons or 0 < #p223.menuIcons then
			v224 = 0 < p223.totalNotices and true or v224
		end
	end
	if p223.isSelected then
		if 0 < #p223.dropdownIcons or 0 < #p223.menuIcons then
			v224 = false
		end
	end
	local v225 = v224 and 0 or 1
	p223:set("noticeImageTransparency", v225)
	p223:set("noticeTextTransparency", v225)
	p223.instances.noticeLabel.Text = p223.totalNotices < 100 and p223.totalNotices or "99+"
end
function v_u_13.clearNotices(p226)
	p226._endNotices:Fire()
	return p226
end
function v_u_13.disableStateOverlay(p227, p228)
	local v229 = p228 == nil and true or p228
	p227.instances.iconOverlay.Visible = not v229
	return p227
end
function v_u_13.setLabel(p230, p231, p232)
	p230:set("iconText", p231 or "", p232)
	return p230
end
function v_u_13.setCornerRadius(p233, p234, p235, p236)
	local v237 = p233.instances.iconCorner.CornerRadius
	p233:set("iconCornerRadius", UDim.new(p234 or v237.Scale, p235 or v237.Offset), p236)
	return p233
end
function v_u_13.setImage(p238, p239, p240)
	return p238:set("iconImage", tonumber(p239) and "http://www.roblox.com/asset/?id=" .. p239 or p239 or "", p240)
end
function v_u_13.setOrder(p241, p242, p243)
	return p241:set("order", tonumber(p242) or 1, p243)
end
function v_u_13.setLeft(p244, p245)
	return p244:set("alignment", "left", p245)
end
function v_u_13.setMid(p246, p247)
	return p246:set("alignment", "mid", p247)
end
function v_u_13.setRight(p248, p249)
	-- upvalues: (copy) v_u_14
	if not p248.internalIcon then
		v_u_14.setupHealthbar()
	end
	return p248:set("alignment", "right", p249)
end
function v_u_13.setImageYScale(p250, p251, p252)
	return p250:set("iconImageYScale", tonumber(p251) or 0.63, p252)
end
function v_u_13.setImageRatio(p253, p254, p255)
	return p253:set("iconImageRatio", tonumber(p254) or 1, p255)
end
function v_u_13.setLabelYScale(p256, p257, p258)
	return p256:set("iconLabelYScale", tonumber(p257) or 0.45, p258)
end
function v_u_13.setBaseZIndex(p259, p260, p261)
	return p259:set("baseZIndex", tonumber(p260) or 1, p261)
end
function v_u_13._updateBaseZIndex(p262, p263)
	local v264 = p262.instances.iconContainer
	local v265 = (tonumber(p263) or v264.ZIndex) - v264.ZIndex
	if v265 == 0 then
		return "The baseValue is the same"
	end
	for _, v266 in pairs(p262.instances) do
		if v266:IsA("GuiObject") then
			v266.ZIndex = v266.ZIndex + v265
		end
	end
	return true
end
function v_u_13.setSize(p267, p268, p269, p270)
	if tonumber(p268) then
		p267.forcefullyAppliedXSize = true
		p267:set("forcedIconSizeX", tonumber(p268), p270)
	else
		p267.forcefullyAppliedXSize = false
		p267:set("forcedIconSizeX", 32, p270)
	end
	if tonumber(p269) then
		p267.forcefullyAppliedYSize = true
		p267:set("forcedIconSizeY", tonumber(p269), p270)
	else
		p267.forcefullyAppliedYSize = false
		p267:set("forcedIconSizeY", 32, p270)
	end
	local v271 = tonumber(p268) or 32
	local v272 = tonumber(p269) or (p269 == "_NIL" or not v271) and 32 or v271
	p267:set("iconSize", UDim2.new(0, v271, 0, v272), p270)
	return p267
end
function v_u_13.setXSize(p273, p274, p275)
	p273:setSize(p274, "_NIL", p275)
	return p273
end
function v_u_13.setYSize(p276, p277, p278)
	p276:setSize("_NIL", p277, p278)
	return p276
end
function v_u_13._getContentText(p279, p280)
	-- upvalues: (copy) v_u_14
	p279.instances.fakeIconLabel.Text = p280
	local v281 = p279.instances.fakeIconLabel.ContentText
	local v282 = p279.instances.iconLabel
	local v283
	if typeof(v282) == "Instance" then
		v283 = v_u_14.translator:Translate(p279.instances.iconLabel, v281)
	else
		v283 = false
	end
	if typeof(v283) == "string" then
		if v283 ~= "" then
			v281 = v283
		end
	end
	p279.instances.fakeIconLabel.Text = ""
	return v281
end
function v_u_13._updateIconSize(p284, _, p285)
	-- upvalues: (copy) v_u_6
	if p284._destroyed then
		return
	else
		local v286 = {
			["iconImage"] = p284:get("iconImage", p285) or "_NIL", 
			["iconText"] = p284:get("iconText", p285) or "_NIL", 
			["iconFont"] = p284:get("iconFont", p285) or "_NIL", 
			["iconSize"] = p284:get("iconSize", p285) or "_NIL", 
			["forcedIconSizeX"] = p284:get("forcedIconSizeX", p285) or "_NIL", 
			["iconImageYScale"] = p284:get("iconImageYScale", p285) or "_NIL", 
			["iconImageRatio"] = p284:get("iconImageRatio", p285) or "_NIL", 
			["iconLabelYScale"] = p284:get("iconLabelYScale", p285) or "_NIL"
		}
		for _, v287 in pairs(v286) do
			if v287 == "_NIL" then
				return
			end
		end
		local v288 = p284.instances.iconContainer
		if v288.Parent then
			local v289 = v286.iconSize.X.Offset
			local v290 = v286.iconSize.X.Scale
			local v291 = v289 + v290 * v288.Parent.AbsoluteSize.X
			local v292 = v286.forcedIconSizeX
			local v293 = 0 < v290 and v291 and v291 or p284.forcefullyAppliedXSize and v292 and v292 or 9999
			local v294 = v286.iconSize.Y.Offset + v286.iconSize.Y.Scale * v288.Parent.AbsoluteSize.Y
			local v295 = v294 * v286.iconLabelYScale
			local v296 = v_u_6:GetTextSize(p284:_getContentText(v286.iconText), v295, v286.iconFont, Vector2.new(10000, v295)).X
			local v297 = v294 * v286.iconImageYScale * v286.iconImageRatio
			local v298 = v286.iconImage ~= ""
			local v299 = v286.iconText ~= ""
			local v300 = 0.5
			local v301 = nil
			local v302 = v295 / 2
			if v298 and not v299 then
				p284:set("iconImageVisible", true, p285)
				p284:set("iconImageAnchorPoint", Vector2.new(0.5, 0.5), p285)
				p284:set("iconImagePosition", UDim2.new(0.5, 0, 0.5, 0), p285)
				p284:set("iconImageSize", UDim2.new(v286.iconImageYScale * v286.iconImageRatio, 0, v286.iconImageYScale, 0), p285)
				p284:set("iconLabelVisible", false, p285)
				v301 = 0
				v300 = 0.45
			elseif v298 or not v299 then
				if v298 then
					if v299 then
						local v303 = 12 + v297 + 8
						v301 = v303 + v296 + 12
						p284:set("iconImageVisible", true, p285)
						p284:set("iconImageAnchorPoint", Vector2.new(0, 0.5), p285)
						p284:set("iconImagePosition", UDim2.new(0, 12, 0.5, 0), p285)
						p284:set("iconImageSize", UDim2.new(0, v297, v286.iconImageYScale, 0), p285)
						p284:set("iconLabelVisible", true, p285)
						p284:set("iconLabelAnchorPoint", Vector2.new(0, 0.5), p285)
						p284:set("iconLabelPosition", UDim2.new(0, v303, 0.5, 0), p285)
						p284:set("iconLabelSize", UDim2.new(1, -v303 - 12, v286.iconLabelYScale, v302), p285)
						p284:set("iconLabelTextXAlignment", Enum.TextXAlignment.Left, p285)
					end
				end
			else
				v301 = v296 + 24
				p284:set("iconLabelVisible", true, p285)
				p284:set("iconLabelAnchorPoint", Vector2.new(0, 0.5), p285)
				p284:set("iconLabelPosition", UDim2.new(0, 12, 0.5, 0), p285)
				p284:set("iconLabelSize", UDim2.new(1, -24, v286.iconLabelYScale, v302), p285)
				p284:set("iconLabelTextXAlignment", Enum.TextXAlignment.Center, p285)
				p284:set("iconImageVisible", false, p285)
			end
			if v301 and not p284._updatingIconSize then
				p284._updatingIconSize = true
				local v304 = 0 < v290 and v290 and v290 or 0
				local v305 = 0 < v290 and 0 or math.clamp(v301, v292, v293)
				p284:set("iconSize", UDim2.new(v304, v305, v286.iconSize.Y.Scale, v286.iconSize.Y.Offset), p285, "_ignorePrevious")
				local v306 = p284._parentIcon
				if v306 then
					local v307 = UDim2.new(0, v301, 0, v286.iconSize.Y.Offset)
					if 0 < #v306.dropdownIcons then
						p284:setAdditionalValue("iconSize", "beforeDropdown", v307, p285)
						v306:_updateDropdown()
					end
					if 0 < #v306.menuIcons then
						p284:setAdditionalValue("iconSize", "beforeMenu", v307, p285)
						v306:_updateMenu()
					end
				end
				p284._updatingIconSize = false
			end
			p284:set("iconLabelTextSize", v295, p285)
			p284:set("noticeFramePosition", UDim2.new(v300, 0, 0, -2), p285)
			p284._updatingIconSize = false
		end
	end
end
function v_u_13.bindEvent(p_u_308, p309, p_u_310)
	local v311 = p_u_308[p309]
	local v312
	if v311 then
		if typeof(v311) == "table" then
			v312 = v311.Connect
		else
			v312 = false
		end
	else
		v312 = v311
	end
	assert(v312, "argument[1] must be a valid topbarplus icon event name!")
	local v313 = typeof(p_u_310) == "function"
	assert(v313, "argument[2] must be a function!")
	p_u_308._bindedEvents[p309] = v311:Connect(function(...)
		-- upvalues: (copy) p_u_310, (copy) p_u_308
		p_u_310(p_u_308, ...)
	end)
	return p_u_308
end
function v_u_13.unbindEvent(p314, p315)
	local v316 = p314._bindedEvents[p315]
	if v316 then
		v316:Disconnect()
		p314._bindedEvents[p315] = nil
	end
	return p314
end
function v_u_13.bindToggleKey(p317, p318)
	local v319 = typeof(p318) == "EnumItem"
	assert(v319, "argument[1] must be a KeyCode EnumItem!")
	p317._bindedToggleKeys[p318] = true
	return p317
end
function v_u_13.unbindToggleKey(p320, p321)
	local v322 = typeof(p321) == "EnumItem"
	assert(v322, "argument[1] must be a KeyCode EnumItem!")
	p320._bindedToggleKeys[p321] = nil
	return p320
end
function v_u_13.lock(p_u_323)
	p_u_323.instances.iconButton.Active = false
	p_u_323.locked = true
	task.defer(function()
		-- upvalues: (copy) p_u_323
		if p_u_323.locked then
			p_u_323.overlayLocked = true
		end
	end)
	return p_u_323
end
function v_u_13.unlock(p324)
	p324.instances.iconButton.Active = true
	p324.locked = false
	p324.overlayLocked = false
	return p324
end
function v_u_13.debounce(p325, p326)
	p325:lock()
	task.wait(p326)
	p325:unlock()
	return p325
end
function v_u_13.autoDeselect(p327, p328)
	p327.deselectWhenOtherIconSelected = p328 == nil and true or p328
	return p327
end
function v_u_13.setTopPadding(p329, p330, p331)
	p329.topPadding = UDim.new(p331 or 0, p330 or 4)
	p329.updated:Fire()
	return p329
end
function v_u_13.bindToggleItem(p332, p333)
	if not (p333:IsA("GuiObject") or p333:IsA("LayerCollector")) then
		error("Toggle item must be a GuiObject or LayerCollector!")
	end
	p332.toggleItems[p333] = true
	p332:updateSelectionInstances()
	return p332
end
function v_u_13.updateSelectionInstances(p334)
	for v335, _ in pairs(p334.toggleItems) do
		local v336 = {}
		for _, v337 in pairs(v335:GetDescendants()) do
			if (v337:IsA("TextButton") or v337:IsA("ImageButton")) and v337.Active then
				table.insert(v336, v337)
			end
		end
		p334.toggleItems[v335] = v336
	end
end
function v_u_13.addBackBlocker(p338, p339)
	local v340 = p338.blockBackBehaviourChecks
	table.insert(v340, p339)
	return p338
end
function v_u_13.unbindToggleItem(p341, p342)
	p341.toggleItems[p342] = nil
	return p341
end
function v_u_13._setToggleItemsVisible(p343, p344, p345)
	for v346, _ in pairs(p343.toggleItems) do
		if not p345 or p345.toggleItems[v346] == nil then
			v346[v346:IsA("LayerCollector") and "Enabled" or "Visible"] = p344
		end
	end
end
function v_u_13.call(p347, p348)
	task.spawn(p348, p347)
	return p347
end
function v_u_13.give(p349, p350)
	local v351
	if typeof(p350) == "function" then
		v351 = p350(p349)
		if typeof(p350) == "function" then
			v351 = nil
		end
	else
		v351 = p350
	end
	if v351 ~= nil then
		p349._maid:give(v351)
	end
	return p349
end
v_u_23.tip = 1
function v_u_13.setTip(p_u_352, p353)
	-- upvalues: (copy) v_u_19, (copy) v_u_16
	local v354 = typeof(p353) == "string" and true or p353 == nil
	local v355 = "Expected string, got " .. typeof(p353)
	assert(v354, v355)
	local v356 = p353 or ""
	local v357 = v356 ~= ""
	p_u_352.tipText = p353
	p_u_352.instances.tipLabel.Text = v356
	p_u_352.instances.tipFrame.Parent = v357 and v_u_19 or p_u_352.instances.iconContainer
	p_u_352._maid.tipFrame = p_u_352.instances.tipFrame
	p_u_352:_updateTipSize()
	local v358 = v_u_16.new()
	p_u_352._maid.tipMaid = v358
	if v357 then
		v358:give(p_u_352.hoverStarted:Connect(function()
			-- upvalues: (copy) p_u_352
			if not p_u_352.isSelected then
				p_u_352:displayTip(true)
			end
		end))
		v358:give(p_u_352.hoverEnded:Connect(function()
			-- upvalues: (copy) p_u_352
			p_u_352:displayTip(false)
		end))
		v358:give(p_u_352.selected:Connect(function()
			-- upvalues: (copy) p_u_352
			if p_u_352.hovering then
				p_u_352:displayTip(false)
			end
		end))
	end
	p_u_352:displayTip(p_u_352.hovering and v357)
	return p_u_352
end
function v_u_13._updateTipSize(p359)
	-- upvalues: (copy) v_u_6
	local v360 = p359.tipText or ""
	local v361 = v360 ~= ""
	local v362 = v_u_6:GetTextSize(p359:_getContentText(v360), 12, Enum.Font.GothamSemibold, Vector2.new(1000, 14))
	p359.instances.tipFrame.Size = v361 and UDim2.new(0, v362.X + 6, 0, 20) or UDim2.new(0, 0, 0, 0)
end
function v_u_13.displayTip(p363, p364)
	-- upvalues: (copy) v_u_3, (copy) v_u_14, (copy) v_u_17
	if not v_u_3.TouchEnabled or p363._draggingFinger then
		local v365 = p363.tipVisible or false
		if typeof(p364) ~= "boolean" then
			p364 = v365
		end
		p363.tipVisible = p364
		local v_u_366 = p363.instances.tipFrame
		if p364 then
			local function v382(p367, p368)
				-- upvalues: (ref) v_u_3, (copy) v_u_366, (ref) v_u_14, (ref) v_u_17
				local v369 = workspace.CurrentCamera
				if v369 then
					v369 = v369.ViewportSize
				end
				local v370, v371
				if v_u_3.TouchEnabled then
					local v372 = p367 - v_u_366.Size.X.Offset / 2
					local v373 = v369.X - v_u_366.Size.X.Offset
					local v374 = p368 + 55 + 60
					local v375 = v_u_366.AbsoluteSize.Y + 55 + 64 + 3
					local v376 = v369.Y - v_u_366.Size.Y.Offset
					v370 = math.clamp(v372, 0, v373)
					v371 = math.clamp(v374, v375, v376)
				elseif v_u_14.controllerModeEnabled then
					local v377 = v_u_17.Indicator
					local v378 = v377.AbsolutePosition
					v370 = v378.X - v_u_366.Size.X.Offset / 2 + v377.AbsoluteSize.X / 2
					v371 = v378.Y + 90
				else
					local v379 = v369.X - v_u_366.Size.X.Offset - 48
					local v380 = v_u_366.Size.Y.Offset + 3
					local v381 = v369.Y
					v370 = math.clamp(p367, 0, v379)
					v371 = math.clamp(p368, v380, v381)
				end
				v_u_366.Position = UDim2.new(0, v370, 0, v371 - 20)
			end
			local v383 = v_u_3:GetMouseLocation()
			if v383 then
				v382(v383.X, v383.Y)
			end
			p363._hoveringMaid:give(p363.instances.iconButton.MouseMoved:Connect(v382))
		end
		for _, v384 in pairs(p363._groupSettings.tip) do
			p363._settingsDictionary[v384].useForcedGroupValue = not p364
			p363:_update(v384)
		end
	end
end
v_u_23.caption = 1
function v_u_13.setCaption(p_u_385, p386)
	-- upvalues: (copy) v_u_19, (copy) v_u_16
	local v387 = typeof(p386) == "string" and true or p386 == nil
	local v388 = "Expected string, got " .. typeof(p386)
	assert(v387, v388)
	local v389 = p386 or ""
	local v390 = v389 ~= ""
	p_u_385.captionText = p386
	p_u_385.instances.captionLabel.Text = v389
	p_u_385.instances.captionContainer.Parent = v390 and v_u_19 or p_u_385.instances.iconContainer
	p_u_385._maid.captionContainer = p_u_385.instances.captionContainer
	p_u_385:_updateIconSize(nil, p_u_385:getIconState())
	local v391 = v_u_16.new()
	p_u_385._maid.captionMaid = v391
	if v390 then
		v391:give(p_u_385.hoverStarted:Connect(function()
			-- upvalues: (copy) p_u_385
			if not p_u_385.isSelected then
				p_u_385:displayCaption(true)
			end
		end))
		v391:give(p_u_385.hoverEnded:Connect(function()
			-- upvalues: (copy) p_u_385
			p_u_385:displayCaption(false)
		end))
		v391:give(p_u_385.selected:Connect(function()
			-- upvalues: (copy) p_u_385
			if p_u_385.hovering then
				p_u_385:displayCaption(false)
			end
		end))
		local v392 = p_u_385.instances.iconContainer
		v391:give(v392:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: (copy) p_u_385
			if p_u_385.hovering then
				p_u_385:displayCaption()
			end
		end))
		v391:give(v392:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
			-- upvalues: (copy) p_u_385
			if p_u_385.hovering then
				p_u_385:displayCaption()
			end
		end))
	end
	p_u_385:_updateCaptionSize()
	p_u_385:displayCaption(p_u_385.hovering and v390)
	return p_u_385
end
function v_u_13._updateCaptionSize(p393)
	-- upvalues: (copy) v_u_6
	local v394 = p393:get("iconSize")
	local v395 = p393:get("captionFont")
	if v394 and v395 then
		local v396 = v394.Y.Offset
		local v397 = v394.Y.Scale
		local v398 = p393.instances.iconContainer
		local v399 = p393.instances.captionContainer
		if (p393.captionText or "") ~= "" then
			local v400 = v396 + v397 * v398.Parent.AbsoluteSize.Y
			local v401 = p393.instances.captionLabel
			local v402 = v400 * 0.8 * 0.58
			local v403 = v_u_6:GetTextSize(p393:_getContentText(p393.captionText), v402, v395, Vector2.new(10000, v402)).X
			v401.TextSize = v402
			v401.Size = UDim2.new(0, v403, 0.58, 0)
			v399.Size = UDim2.new(0, v403 + 12, 0, v400 * 0.8)
			return
		end
		v399.Size = UDim2.new(0, 0, 0, 0)
	end
end
function v_u_13.displayCaption(p404, p405)
	-- upvalues: (copy) v_u_3
	if not v_u_3.TouchEnabled or p404._draggingFinger then
		local v406 = 8
		if p404._draggingFinger then
			v406 = v406 + 55
		end
		local v407 = p404.instances.iconContainer
		local v408 = p404.instances.captionContainer
		v408.Position = UDim2.new(0, v407.AbsolutePosition.X + v407.AbsoluteSize.X / 2 - v408.AbsoluteSize.X / 2, 0, v407.AbsolutePosition.Y + v407.AbsoluteSize.Y * 2 + v406)
		local v409 = p404.captionVisible or false
		if typeof(p405) ~= "boolean" then
			p405 = v409
		end
		p404.captionVisible = p405
		p404:get("captionFadeInfo")
		for _, v410 in pairs(p404._groupSettings.caption) do
			p404._settingsDictionary[v410].useForcedGroupValue = not p405
			p404:_update(v410)
		end
	end
end
function v_u_13.join(p411, p412, p413, p414)
	-- upvalues: (copy) v_u_14
	if p411._parentIcon then
		p411:leave()
	end
	local v415 = p413 and p413:lower() or "dropdown"
	local v416 = p413:sub(1, 1):upper()
	local v417 = p413:sub(2)
	local v418 = "before" .. v416 .. v417
	local v419 = p412.instances[p413 .. "Frame"]
	p411.presentOnTopbar = false
	p411.joinedFeatureName = p413
	p411._parentIcon = p412
	p411.instances.iconContainer.Parent = v419
	for v420, v421 in pairs(p411.notices) do
		p412:notify(v421.clearNoticeEvent, v420)
	end
	if p413 == "dropdown" then
		local v422 = p412:get("dropdownSquareCorners")
		p411:set("iconSize", UDim2.new(1, 0, 0, p411:get("iconSize", "deselected").Y.Offset), "deselected", v418)
		p411:set("iconSize", UDim2.new(1, 0, 0, p411:get("iconSize", "selected").Y.Offset), "selected", v418)
		if v422 then
			p411:set("iconCornerRadius", UDim.new(0, 0), "deselected", v418)
			p411:set("iconCornerRadius", UDim.new(0, 0), "selected", v418)
		end
		p411:set("captionBlockerTransparency", 0.4, nil, v418)
	end
	local v423 = p412[v415 .. "Icons"]
	table.insert(v423, p411)
	if not p414 then
		if p413 == "dropdown" then
			p412:_updateDropdown()
		elseif p413 == "menu" then
			p412:_updateMenu()
		end
	end
	p412.deselectWhenOtherIconSelected = false
	v_u_14:_updateSelectionGroup()
	p411:_decideToCallSignal("dropdown")
	p411:_decideToCallSignal("menu")
	return p411
end
function v_u_13.leave(p_u_424)
	-- upvalues: (copy) v_u_20, (copy) v_u_14
	if not p_u_424._destroyed and p_u_424.instances.iconContainer.Parent ~= nil then
		local v_u_425 = { "iconSize", "captionBlockerTransparency", "iconCornerRadius" }
		local v_u_426 = p_u_424._parentIcon
		p_u_424.instances.iconContainer.Parent = v_u_20
		p_u_424.presentOnTopbar = true
		p_u_424.joinedFeatureName = nil
		local function v435(p427, p428, p429)
			-- upvalues: (copy) p_u_424, (copy) v_u_425, (copy) v_u_426
			for v430, v431 in pairs(p427) do
				if v431 == p_u_424 then
					for _, v432 in pairs(v_u_425) do
						for _, v433 in pairs({ "deselected", "selected" }) do
							local _, v434 = p_u_424:get(v432, v433, p428)
							if v434 then
								p_u_424:set(v432, v434, v433)
							end
						end
					end
					table.remove(p427, v430)
					p429(v_u_426)
					if #p427 == 0 then
						p_u_424._parentIcon.deselectWhenOtherIconSelected = true
						return
					end
					break
				end
			end
		end
		v435(v_u_426.dropdownIcons, "beforeDropdown", v_u_426._updateDropdown)
		v435(v_u_426.menuIcons, "beforeMenu", v_u_426._updateMenu)
		for v436, _ in pairs(p_u_424.notices) do
			local v437 = v_u_426.notices[v436]
			if v437 then
				v437.completeSignal:Fire()
			end
		end
		p_u_424._parentIcon = nil
		v_u_14:_updateSelectionGroup()
		p_u_424:_decideToCallSignal("dropdown")
		p_u_424:_decideToCallSignal("menu")
		return p_u_424
	end
end
function v_u_13._decideToCallSignal(p438, p439)
	local v440 = p438[p439 .. "Open"]
	local v441 = string.sub(p439, 1, 1):upper()
	local v442 = p439:sub(2)
	local v443 = "_previous" .. v441 .. v442 .. "Open"
	local v444 = p438[v443]
	local v445 = #p438[p439 .. "Icons"]
	if v440 and 0 < v445 and v444 == false then
		p438[v443] = true
		p438[p439 .. "Opened"]:Fire()
	elseif (not v440 or v445 == 0) and v444 == true then
		p438[v443] = false
		p438[p439 .. "Closed"]:Fire()
	end
end
function v_u_13._ignoreClipping(p446, p447)
	-- upvalues: (copy) v_u_19
	local v448 = p446:get(p447 .. "IgnoreClipping")
	if p446._parentIcon then
		local v449 = p446["_" .. p447 .. "ClippingMaid"]
		local v_u_450 = p446.instances[p447 .. "Container"]
		v449:clean()
		if v448 then
			local v_u_451 = Instance.new("Frame")
			v_u_451.Name = v_u_450.Name .. "FakeFrame"
			v_u_451.ClipsDescendants = true
			v_u_451.BackgroundTransparency = 1
			v_u_451.Size = v_u_450.Size
			v_u_451.Position = v_u_450.Position
			v_u_451.Parent = v_u_19
			for _, v452 in pairs(v_u_450:GetChildren()) do
				v452.Parent = v_u_451
			end
			v449:give(v_u_450:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: (copy) v_u_450, (copy) v_u_451
				local v453 = v_u_450.AbsoluteSize
				v_u_451.Size = UDim2.new(0, v453.X, 0, v453.Y)
			end))
			local v454 = v_u_450.AbsoluteSize
			v_u_451.Size = UDim2.new(0, v454.X, 0, v454.Y)
			v449:give(v_u_450:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				-- upvalues: (copy) v_u_450, (copy) v_u_451
				local v455 = v_u_450.absolutePosition
				v_u_451.Position = UDim2.new(0, v455.X, 0, v455.Y + 36)
			end))
			local v456 = v_u_450.absolutePosition
			v_u_451.Position = UDim2.new(0, v456.X, 0, v456.Y + 36)
			v449:give(function()
				-- upvalues: (copy) v_u_451, (copy) v_u_450
				for _, v457 in pairs(v_u_451:GetChildren()) do
					v457.Parent = v_u_450
				end
				v_u_451.Name = "Destroying..."
				v_u_451:Destroy()
			end)
		end
	end
	p446._ignoreClippingChanged:Fire(p447, v448)
end
function v_u_13.setDropdown(p458, p459)
	for _, v460 in pairs(p458.dropdownIcons) do
		v460:leave()
	end
	if type(p459) == "table" then
		for _, v461 in pairs(p459) do
			v461:join(p458, "dropdown", true)
		end
	end
	p458:_updateDropdown()
	return p458
end
function v_u_13._updateDropdown(p462)
	local v463 = {
		["maxIconsBeforeScroll"] = p462:get("dropdownMaxIconsBeforeScroll") or "_NIL", 
		["minWidth"] = p462:get("dropdownMinWidth") or "_NIL", 
		["padding"] = p462:get("dropdownListPadding") or "_NIL", 
		["dropdownAlignment"] = p462:get("dropdownAlignment") or "_NIL", 
		["iconAlignment"] = p462:get("alignment") or "_NIL", 
		["scrollBarThickness"] = p462:get("dropdownScrollBarThickness") or "_NIL"
	}
	for _, v464 in pairs(v463) do
		if v464 == "_NIL" then
			return
		end
	end
	local v465 = v463.padding.Offset
	local v466 = p462.instances.dropdownContainer
	local v467 = p462.instances.dropdownFrame
	local _ = p462.instances.dropdownList
	local v468 = #p462.dropdownIcons
	local v469
	if v463.maxIconsBeforeScroll < v468 then
		v469 = v463.maxIconsBeforeScroll or v468
	else
		v469 = v468
	end
	local v470 = -v465
	local v471 = v463.minWidth
	table.sort(p462.dropdownIcons, function(p472, p473)
		return p472:get("order") < p473:get("order")
	end)
	local v474 = 0
	for v475 = 1, v468 do
		local v476 = p462.dropdownIcons[v475]
		local _, v477 = v476:get("iconSize", nil, "beforeDropdown")
		local v478 = v477.Y.Offset + v465
		if v475 <= v469 then
			v474 = v474 + v478
		end
		if v475 == v468 then
			v474 = v474 + v478 / 4
		end
		v470 = v470 + v478
		local v479 = v477.X.Offset
		if v471 >= v479 then
			v479 = v471
		end
		local v480 = v475 == 1 and p462 and p462 or p462.dropdownIcons[v475 - 1]
		local v481 = p462.dropdownIcons[v475 + 1]
		local v482 = v476.instances.iconButton
		if v480 then
			v480 = v480.instances.iconButton
		end
		v482.NextSelectionUp = v480
		local v483 = v476.instances.iconButton
		if v481 then
			v481 = v481.instances.iconButton
		end
		v483.NextSelectionDown = v481
		v471 = v479
	end
	local v484 = v469 == v468 and 0 or v470
	p462:set("dropdownCanvasSize", UDim2.new(0, 0, 0, v484))
	p462:set("dropdownSize", UDim2.new(0, (v471 + 4) * 2, 0, v474))
	local v485 = v463.dropdownAlignment:lower()
	local v486 = {
		["left"] = {
			["AnchorPoint"] = Vector2.new(0, 0), 
			["PositionXScale"] = 0, 
			["ThicknessMultiplier"] = 0
		}, 
		["mid"] = {
			["AnchorPoint"] = Vector2.new(0.5, 0), 
			["PositionXScale"] = 0.5, 
			["ThicknessMultiplier"] = 0.5
		}, 
		["right"] = {
			["AnchorPoint"] = Vector2.new(0.5, 0), 
			["PositionXScale"] = 1, 
			["FrameAnchorPoint"] = Vector2.new(0, 0), 
			["FramePositionXScale"] = 0, 
			["ThicknessMultiplier"] = 1
		}
	}
	local v487 = v486[v485] or v486[v463.iconAlignment:lower()]
	v466.AnchorPoint = v487.AnchorPoint
	v466.Position = UDim2.new(v487.PositionXScale, 0, 1, v465 + 0)
	local v488 = v463.scrollBarThickness * v487.ThicknessMultiplier
	local v489 = v467.VerticalScrollBarPosition == Enum.VerticalScrollBarPosition.Right and v488 and v488 or -v488
	v467.AnchorPoint = v487.FrameAnchorPoint or v487.AnchorPoint
	v467.Position = UDim2.new(v487.FramePositionXScale or v487.PositionXScale, v489, 0, 0)
	p462._dropdownCanvasPos = Vector2.new(0, 0)
end
function v_u_13._dropdownIgnoreClipping(p490)
	p490:_ignoreClipping("dropdown")
end
function v_u_13.setMenu(p491, p492)
	for _, v493 in pairs(p491.menuIcons) do
		v493:leave()
	end
	if type(p492) == "table" then
		for _, v494 in pairs(p492) do
			v494:join(p491, "menu", true)
		end
	end
	p491:_updateMenu()
	return p491
end
function v_u_13._getMenuDirection(p495)
	local v496 = (p495:get("menuDirection") or "_NIL"):lower()
	local v497 = (p495:get("alignment") or "_NIL"):lower()
	if v496 ~= "left" then
		v496 = v496 ~= "right" and (v497 == "left" and "right" or "left") or v496
	end
	return v496
end
function v_u_13._updateMenu(p498)
	-- upvalues: (copy) v_u_14
	local v499 = {
		["maxIconsBeforeScroll"] = p498:get("menuMaxIconsBeforeScroll") or "_NIL", 
		["direction"] = p498:get("menuDirection") or "_NIL", 
		["iconAlignment"] = p498:get("alignment") or "_NIL", 
		["scrollBarThickness"] = p498:get("menuScrollBarThickness") or "_NIL"
	}
	for _, v500 in pairs(v499) do
		if v500 == "_NIL" then
			return
		end
	end
	local v501 = v_u_14[v499.iconAlignment .. "Gap"]
	local v502 = p498.instances.menuContainer
	local v503 = p498.instances.menuFrame
	local v504 = p498.instances.menuList
	local v505 = #p498.menuIcons
	local v506 = p498:_getMenuDirection()
	local v507
	if v499.maxIconsBeforeScroll < v505 then
		v507 = v499.maxIconsBeforeScroll or v505
	else
		v507 = v505
	end
	local v508 = -v501
	local v513 = v506 == "right" and function(p509, p510)
		return p509:get("order") < p510:get("order")
	end or function(p511, p512)
		return p511:get("order") > p512:get("order")
	end
	table.sort(p498.menuIcons, v513)
	local v514 = 0
	local v515 = 0
	for v516 = 1, v505 do
		local v517 = p498.menuIcons[v516]
		local v518 = v517:get("iconSize")
		local v519 = v518.X.Offset + v501
		if v516 <= v507 then
			v514 = v514 + v519
		end
		if v516 == v507 then
			if v516 ~= v505 then
				v514 = v514 - 2
			end
		end
		v508 = v508 + v519
		local v520 = v518.Y.Offset
		if v515 >= v520 then
			v520 = v515
		end
		local v521 = p498.menuIcons[v516 - 1]
		local v522 = p498.menuIcons[v516 + 1]
		local v523 = v517.instances.iconButton
		if v521 then
			v521 = v521.instances.iconButton
		end
		v523.NextSelectionRight = v521
		local v524 = v517.instances.iconButton
		if v522 then
			v522 = v522.instances.iconButton
		end
		v524.NextSelectionLeft = v522
		v515 = v520
	end
	local v525 = v507 == v505 and 0 or v508 + v501
	p498:set("menuCanvasSize", UDim2.new(0, v525, 0, 0))
	p498:set("menuSize", UDim2.new(0, v514, 0, v515 + v499.scrollBarThickness + 3))
	local v526 = ({
		["left"] = {
			["containerAnchorPoint"] = Vector2.new(1, 0), 
			["containerPosition"] = UDim2.new(0, -4, 0, 0), 
			["canvasPosition"] = Vector2.new(v525, 0)
		}, 
		["right"] = {
			["containerAnchorPoint"] = Vector2.new(0, 0), 
			["containerPosition"] = UDim2.new(1, v501 - 2, 0, 0), 
			["canvasPosition"] = Vector2.new(0, 0)
		}
	})[v506]
	v502.AnchorPoint = v526.containerAnchorPoint
	v502.Position = v526.containerPosition
	v503.CanvasPosition = v526.canvasPosition
	p498._menuCanvasPos = v526.canvasPosition
	v504.Padding = UDim.new(0, v501)
end
function v_u_13._menuIgnoreClipping(p527)
	p527:_ignoreClipping("menu")
end
function v_u_13.destroy(p528)
	-- upvalues: (copy) v_u_14
	if not p528._destroyed then
		v_u_14.iconRemoved:Fire(p528)
		p528:clearNotices()
		if p528._parentIcon then
			p528:leave()
		end
		p528:setDropdown()
		p528:setMenu()
		p528._destroyed = true
		p528._maid:clean()
	end
end
v_u_13.Destroy = v_u_13.destroy
return v_u_13
