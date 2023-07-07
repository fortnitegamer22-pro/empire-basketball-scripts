-- decompiled by Sentinel (took 4.252434ms)
local v1, v2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures")
end)
local v_u_3 = v1 and v2
local v4, v5 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled")
end)
local v_u_6 = v4 and v5
local v_u_7 = {
	["ScrollBarThickness"] = 4
}
local v8 = script.Parent
local v_u_9 = require(v8:WaitForChild("CurveUtil"))
local v_u_10 = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local v_u_11 = require(v8:WaitForChild("MessageLabelCreator")).new()
local v_u_12 = {}
v_u_12.__index = v_u_12
local function v_u_16()
	-- upvalues: (copy) v_u_10, (copy) v_u_7
	local v13 = Instance.new("Frame")
	v13.Selectable = false
	v13.Size = UDim2.new(1, 0, 1, 0)
	v13.BackgroundTransparency = 1
	local v14 = Instance.new("ScrollingFrame")
	v14.Selectable = v_u_10.GamepadNavigationEnabled
	v14.Name = "Scroller"
	v14.BackgroundTransparency = 1
	v14.BorderSizePixel = 0
	v14.Position = UDim2.new(0, 0, 0, 3)
	v14.Size = UDim2.new(1, -4, 1, -6)
	v14.CanvasSize = UDim2.new(0, 0, 0, 0)
	v14.ScrollBarThickness = v_u_7.ScrollBarThickness
	v14.Active = true
	v14.Parent = v13
	local v15 = Instance.new("UIListLayout")
	v15.SortOrder = Enum.SortOrder.LayoutOrder
	v15.Parent = v14
	return v13, v14, v15
end
function v_u_12.Destroy(p17)
	p17.GuiObject:Destroy()
	p17.Destroyed = true
end
function v_u_12.SetActive(p18, p19)
	p18.GuiObject.Visible = p19
end
function v_u_12.UpdateMessageFiltered(p20, p21)
	-- upvalues: (ref) v_u_3
	local v22 = nil
	local v23 = p20.MessageObjectLog
	local v24 = 1
	while true do
		if v24 > #v23 then
			v25 = v22
			break
		end
		local v25 = v23[v24]
		if v25.ID == p21.ID then
			break
		end
		v24 = v24 + 1
	end
	if v25 then
		if v_u_3 then
			if p21.Message == "" then
				p20:RemoveMessageAtIndex(v24)
			else
				v25.UpdateTextFunction(p21)
				p20:PositionMessageLabelInWindow(v25, v24)
			end
		end
		v25.UpdateTextFunction(p21)
		p20:PositionMessageLabelInWindow(v25, v24)
	end
end
function v_u_12.RefreshMessagePlacement(p26, p27)
	local v28 = nil
	local v29 = p26.MessageObjectLog
	local v30 = 1
	while true do
		if v30 > #v29 then
			v31 = v28
			break
		end
		local v31 = v29[v30]
		if v31.ID == p27.ID then
			break
		end
		v30 = v30 + 1
	end
	if v31 then
		p26:PositionMessageLabelInWindow(v31, v30)
	end
end
function v_u_12.AddMessage(p_u_32, p_u_33)
	-- upvalues: (ref) v_u_6, (copy) v_u_11
	p_u_32:WaitUntilParentedCorrectly()
	local v34
	if v_u_6 then
		v34 = v_u_11:CreateMessageLabel_Chat(p_u_33, p_u_32.CurrentChannelName, function()
			-- upvalues: (copy) p_u_32, (copy) p_u_33
			p_u_32:RefreshMessagePlacement(p_u_33)
		end)
	else
		v34 = v_u_11:CreateMessageLabel(p_u_33, p_u_32.CurrentChannelName)
	end
	if v34 ~= nil then
		table.insert(p_u_32.MessageObjectLog, v34)
		p_u_32:PositionMessageLabelInWindow(v34, #p_u_32.MessageObjectLog)
	end
end
function v_u_12.RemoveMessageAtIndex(p35, p36)
	p35:WaitUntilParentedCorrectly()
	local v37 = p35.MessageObjectLog[p36]
	if v37 then
		v37:Destroy()
		table.remove(p35.MessageObjectLog, p36)
	end
end
function v_u_12.AddMessageAtIndex(p_u_38, p_u_39, p40)
	-- upvalues: (ref) v_u_6, (copy) v_u_11
	local v41
	if v_u_6 then
		v41 = v_u_11:CreateMessageLabel_Chat(p_u_39, p_u_38.CurrentChannelName, function()
			-- upvalues: (copy) p_u_38, (copy) p_u_39
			p_u_38:RefreshMessagePlacement(p_u_39)
		end)
	else
		v41 = v_u_11:CreateMessageLabel(p_u_39, p_u_38.CurrentChannelName)
	end
	if v41 ~= nil then
		table.insert(p_u_38.MessageObjectLog, p40, v41)
		p_u_38:PositionMessageLabelInWindow(v41, p40)
	end
end
function v_u_12.RemoveLastMessage(p42)
	p42:WaitUntilParentedCorrectly()
	p42.MessageObjectLog[1]:Destroy()
	table.remove(p42.MessageObjectLog, 1)
end
function v_u_12.IsScrolledDown(p43)
	local v44 = p43.Scroller.CanvasSize.Y.Offset
	local v45 = p43.Scroller.AbsoluteWindowSize.Y
	return v44 < v45 and true or v44 - p43.Scroller.CanvasPosition.Y <= v45 + 5
end
function v_u_12.UpdateMessageTextHeight(p46, p47)
	local v48 = p47.BaseFrame
	for v49 = 1, 10 do
		if p47.BaseMessage.TextFits then
			break
		end
		v48.Size = UDim2.new(1, 0, 0, p47.GetHeightFunction(p46.Scroller.AbsoluteSize.X - v49))
	end
end
function v_u_12.PositionMessageLabelInWindow(p50, p51, p52)
	p50:WaitUntilParentedCorrectly()
	local v53 = p50:IsScrolledDown()
	local v54 = p51.BaseFrame
	local v55
	if p50.MessageObjectLog[p52 - 1] then
		if p52 == #p50.MessageObjectLog then
			v55 = p50.MessageObjectLog[p52 - 1].BaseFrame.LayoutOrder + 1
		else
			v55 = p50.MessageObjectLog[p52 - 1].BaseFrame.LayoutOrder
		end
	else
		v55 = 1
	end
	v54.LayoutOrder = v55
	v54.Size = UDim2.new(1, 0, 0, p51.GetHeightFunction(p50.Scroller.AbsoluteSize.X))
	v54.Parent = p50.Scroller
	if p51.BaseMessage then
		p50:UpdateMessageTextHeight(p51)
	end
	if v53 then
		p50.Scroller.CanvasPosition = Vector2.new(0, (math.max(0, p50.Scroller.CanvasSize.Y.Offset - p50.Scroller.AbsoluteSize.Y)))
	end
end
function v_u_12.ReorderAllMessages(p56)
	p56:WaitUntilParentedCorrectly()
	if p56.GuiObject.AbsoluteSize.Y < 1 then
		return
	else
		local v57 = p56.Scroller.CanvasPosition
		local v58 = p56:IsScrolledDown()
		for _, v59 in pairs(p56.MessageObjectLog) do
			p56:UpdateMessageTextHeight(v59)
		end
		if v58 then
			p56.Scroller.CanvasPosition = Vector2.new(0, (math.max(0, p56.Scroller.CanvasSize.Y.Offset - p56.Scroller.AbsoluteSize.Y)))
		else
			p56.Scroller.CanvasPosition = v57
		end
	end
end
function v_u_12.Clear(p60)
	for _, v61 in pairs(p60.MessageObjectLog) do
		v61:Destroy()
	end
	p60.MessageObjectLog = {}
end
function v_u_12.SetCurrentChannelName(p62, p63)
	p62.CurrentChannelName = p63
end
function v_u_12.FadeOutBackground(_, _) end
function v_u_12.FadeInBackground(_, _) end
function v_u_12.FadeOutText(p64, p65)
	-- upvalues: (copy) v_u_9
	for v66 = 1, #p64.MessageObjectLog do
		if p64.MessageObjectLog[v66].FadeOutFunction then
			p64.MessageObjectLog[v66].FadeOutFunction(p65, v_u_9)
		end
	end
end
function v_u_12.FadeInText(p67, p68)
	-- upvalues: (copy) v_u_9
	for v69 = 1, #p67.MessageObjectLog do
		if p67.MessageObjectLog[v69].FadeInFunction then
			p67.MessageObjectLog[v69].FadeInFunction(p68, v_u_9)
		end
	end
end
function v_u_12.Update(p70, p71)
	-- upvalues: (copy) v_u_9
	for v72 = 1, #p70.MessageObjectLog do
		if p70.MessageObjectLog[v72].UpdateAnimFunction then
			p70.MessageObjectLog[v72].UpdateAnimFunction(p71, v_u_9)
		end
	end
end
function v_u_12.WaitUntilParentedCorrectly(p73)
	while not p73.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
		p73.GuiObject.AncestryChanged:wait()
	end
end
function v_u_7.new()
	-- upvalues: (copy) v_u_12, (copy) v_u_16
	local v_u_74 = setmetatable({}, v_u_12)
	v_u_74.Destroyed = false
	local v75, v76, v77 = v_u_16()
	v_u_74.GuiObject = v75
	v_u_74.Scroller = v76
	v_u_74.Layout = v77
	v_u_74.MessageObjectLog = {}
	v_u_74.Name = "MessageLogDisplay"
	v_u_74.GuiObject.Name = "Frame_" .. v_u_74.Name
	v_u_74.CurrentChannelName = ""
	v_u_74.GuiObject:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: (copy) v_u_74
		spawn(function()
			-- upvalues: (ref) v_u_74
			v_u_74:ReorderAllMessages()
		end)
	end)
	local v_u_78 = true
	v_u_74.Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		-- upvalues: (copy) v_u_74, (ref) v_u_78
		local v79 = v_u_74.Layout.AbsoluteContentSize
		v_u_74.Scroller.CanvasSize = UDim2.new(0, 0, 0, v79.Y)
		if v_u_78 then
			v_u_74.Scroller.CanvasPosition = Vector2.new(0, v79.Y - v_u_74.Scroller.AbsoluteWindowSize.Y)
		end
	end)
	v_u_74.Scroller:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		-- upvalues: (ref) v_u_78, (copy) v_u_74
		v_u_78 = v_u_74:IsScrolledDown()
	end)
	return v_u_74
end
return v_u_7
