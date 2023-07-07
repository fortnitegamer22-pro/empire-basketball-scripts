-- decompiled by Sentinel (took 9.552284ms)
local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("Chat")
local v_u_4 = game:GetService("TextService")
local v_u_5 = v_u_1.LocalPlayer
while v_u_5 == nil do
	v_u_1.ChildAdded:wait()
	v_u_5 = v_u_1.LocalPlayer
end
local v6 = v_u_5:WaitForChild("PlayerGui")
local v7, v8 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserShouldLocalizeGameChatBubble")
end)
local v_u_9 = v7 and v8
local v10, v11 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFixBubbleChatText")
end)
local v_u_12 = v10 and v11
local v13, v14 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRoactBubbleChatBeta")
end)
local v_u_15 = v13 and v14
local v16, v17 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserPreventOldBubbleChatOverlap")
end)
local v_u_18 = v16 and v17
local v_u_19 = Enum.Font.SourceSans
local v_u_20 = Enum.FontSize.Size24
local v_u_21 = 128 - utf8.len(utf8.nfcnormalize("...")) - 1
local v_u_22 = {
	["WHITE"] = "dub", 
	["BLUE"] = "blu", 
	["GREEN"] = "gre", 
	["RED"] = "red"
}
local v_u_23 = Instance.new("ScreenGui")
v_u_23.Name = "BubbleChat"
v_u_23.ResetOnSpawn = false
v_u_23.Parent = v6
local function v_u_28()
	local v_u_24 = {
		["data"] = {}
	}
	local v_u_25 = Instance.new("BindableEvent")
	v_u_24.Emptied = v_u_25.Event
	function v_u_24.Size(_)
		-- upvalues: (copy) v_u_24
		return #v_u_24.data
	end
	function v_u_24.Empty(_)
		-- upvalues: (copy) v_u_24
		return v_u_24:Size() <= 0
	end
	function v_u_24.PopFront(_)
		-- upvalues: (copy) v_u_24, (copy) v_u_25
		table.remove(v_u_24.data, 1)
		if v_u_24:Empty() then
			v_u_25:Fire()
		end
	end
	function v_u_24.Front(_)
		-- upvalues: (copy) v_u_24
		return v_u_24.data[1]
	end
	function v_u_24.Get(_, p26)
		-- upvalues: (copy) v_u_24
		return v_u_24.data[p26]
	end
	function v_u_24.PushBack(_, p27)
		-- upvalues: (copy) v_u_24
		table.insert(v_u_24.data, p27)
	end
	function v_u_24.GetData(_)
		-- upvalues: (copy) v_u_24
		return v_u_24.data
	end
	return v_u_24
end
local function v_u_35(p29, p30, p31)
	local v34 = {
		["ComputeBubbleLifetime"] = function(_, p32, p33)
			if p33 then
				return 8 + 7 * math.min(utf8.len(utf8.nfcnormalize(p32)) / 75, 1)
			else
				return 12 + 8 * math.min(utf8.len(utf8.nfcnormalize(p32)) / 75, 1)
			end
		end, 
		["Origin"] = nil, 
		["RenderBubble"] = nil, 
		["Message"] = p29
	}
	v34.BubbleDieDelay = v34:ComputeBubbleLifetime(p29, p31)
	v34.BubbleColor = p30
	v34.IsLocalPlayer = p31
	return v34
end
function createChatBubbleMain(p36, p37)
	local v38 = Instance.new("ImageLabel")
	v38.Name = "ChatBubble"
	v38.ScaleType = Enum.ScaleType.Slice
	v38.SliceCenter = p37
	v38.Image = "rbxasset://textures/" .. tostring(p36) .. ".png"
	v38.BackgroundTransparency = 1
	v38.BorderSizePixel = 0
	v38.Size = UDim2.new(1, 0, 1, 0)
	v38.Position = UDim2.new(0, 0, 0, 0)
	return v38
end
function createChatBubbleTail(p39, p40)
	local v41 = Instance.new("ImageLabel")
	v41.Name = "ChatBubbleTail"
	v41.Image = "rbxasset://textures/ui/dialog_tail.png"
	v41.BackgroundTransparency = 1
	v41.BorderSizePixel = 0
	v41.Position = p39
	v41.Size = p40
	return v41
end
function createChatBubbleWithTail(p42, p43, p44, p45)
	local v46 = createChatBubbleMain(p42, p45)
	createChatBubbleTail(p43, p44).Parent = v46
	return v46
end
function createScaledChatBubbleWithTail(p47, p48, p49, p50)
	local v51 = createChatBubbleMain(p47, p50)
	local v52 = Instance.new("Frame")
	v52.Name = "ChatBubbleTailFrame"
	v52.BackgroundTransparency = 1
	v52.SizeConstraint = Enum.SizeConstraint.RelativeXX
	v52.Position = UDim2.new(0.5, 0, 1, 0)
	v52.Size = UDim2.new(p48, 0, p48, 0)
	v52.Parent = v51
	createChatBubbleTail(p49, UDim2.new(1, 0, 0.5, 0)).Parent = v52
	return v51
end
function createChatImposter(p53, p54, p55)
	local v56 = Instance.new("ImageLabel")
	v56.Name = "DialogPlaceholder"
	v56.Image = "rbxasset://textures/" .. tostring(p53) .. ".png"
	v56.BackgroundTransparency = 1
	v56.BorderSizePixel = 0
	v56.Position = UDim2.new(0, 0, -1.25, 0)
	v56.Size = UDim2.new(1, 0, 1, 0)
	local v57 = Instance.new("ImageLabel")
	v57.Name = "DotDotDot"
	v57.Image = "rbxasset://textures/" .. tostring(p54) .. ".png"
	v57.BackgroundTransparency = 1
	v57.BorderSizePixel = 0
	v57.Position = UDim2.new(0.001, 0, p55, 0)
	v57.Size = UDim2.new(1, 0, 0.7, 0)
	v57.Parent = v56
	return v56
end
local v_u_65 = {
	["ChatBubble"] = {}, 
	["ChatBubbleWithTail"] = {}, 
	["ScalingChatBubbleWithTail"] = {}, 
	["CharacterSortedMsg"] = (function()
		-- upvalues: (copy) v_u_28
		local v_u_58 = {
			["data"] = {}
		}
		local v_u_59 = 0
		function v_u_58.Size(_)
			-- upvalues: (ref) v_u_59
			return v_u_59
		end
		function v_u_58.Erase(_, p60)
			-- upvalues: (copy) v_u_58, (ref) v_u_59
			if v_u_58.data[p60] then
				v_u_59 = v_u_59 - 1
			end
			v_u_58.data[p60] = nil
		end
		function v_u_58.Set(_, p61, p62)
			-- upvalues: (copy) v_u_58, (ref) v_u_59
			v_u_58.data[p61] = p62
			if p62 then
				v_u_59 = v_u_59 + 1
			end
		end
		function v_u_58.Get(_, p_u_63)
			-- upvalues: (copy) v_u_58, (ref) v_u_28
			if p_u_63 then
				if not v_u_58.data[p_u_63] then
					v_u_58.data[p_u_63] = {
						["Fifo"] = v_u_28(), 
						["BillboardGui"] = nil
					}
					local v_u_64 = nil
					v_u_64 = v_u_58.data[p_u_63].Fifo.Emptied:connect(function()
						-- upvalues: (ref) v_u_64, (ref) v_u_58, (copy) p_u_63
						v_u_64:disconnect()
						v_u_58:Erase(p_u_63)
					end)
				end
				return v_u_58.data[p_u_63]
			end
		end
		function v_u_58.GetData(_)
			-- upvalues: (copy) v_u_58
			return v_u_58.data
		end
		return v_u_58
	end)()
}
local function v70(p66, p67, _, p68, p69)
	-- upvalues: (copy) v_u_65
	v_u_65.ChatBubble[p66] = createChatBubbleMain(p67, p69)
	v_u_65.ChatBubbleWithTail[p66] = createChatBubbleWithTail(p67, UDim2.new(0.5, -14, 1, p68 and -1 or 0), UDim2.new(0, 30, 0, 14), p69)
	v_u_65.ScalingChatBubbleWithTail[p66] = createScaledChatBubbleWithTail(p67, 0.5, UDim2.new(-0.5, 0, 0, p68 and -1 or 0), p69)
end
v70(v_u_22.WHITE, "ui/dialog_white", "ui/chatBubble_white_notify_bkg", false, Rect.new(5, 5, 15, 15))
v70(v_u_22.BLUE, "ui/dialog_blue", "ui/chatBubble_blue_notify_bkg", true, Rect.new(7, 7, 33, 33))
v70(v_u_22.RED, "ui/dialog_red", "ui/chatBubble_red_notify_bkg", true, Rect.new(7, 7, 33, 33))
v70(v_u_22.GREEN, "ui/dialog_green", "ui/chatBubble_green_notify_bkg", true, Rect.new(7, 7, 33, 33))
function v_u_65.SanitizeChatLine(_, p71)
	-- upvalues: (copy) v_u_21
	if v_u_21 < utf8.len(utf8.nfcnormalize(p71)) then
		return string.sub(p71, 1, utf8.offset(p71, v_u_21 + utf8.len(utf8.nfcnormalize("...")) + 1) - 1)
	else
		return p71
	end
end
local function v_u_76(p72)
	-- upvalues: (copy) v_u_23, (copy) v_u_65, (copy) v_u_22
	local v_u_73 = Instance.new("BillboardGui")
	v_u_73.Adornee = p72
	v_u_73.Size = UDim2.new(0, 400, 0, 250)
	v_u_73.StudsOffset = Vector3.new(0, 1.5, 2)
	v_u_73.Parent = v_u_23
	local v_u_74 = Instance.new("Frame")
	v_u_74.Name = "BillboardFrame"
	v_u_74.Size = UDim2.new(1, 0, 1, 0)
	v_u_74.Position = UDim2.new(0, 0, -0.5, 0)
	v_u_74.BackgroundTransparency = 1
	v_u_74.Parent = v_u_73
	local v_u_75 = nil
	v_u_75 = v_u_74.ChildRemoved:connect(function()
		-- upvalues: (copy) v_u_74, (ref) v_u_75, (copy) v_u_73
		if #v_u_74:GetChildren() <= 1 then
			v_u_75:disconnect()
			v_u_73:Destroy()
		end
	end)
	v_u_65:CreateSmallTalkBubble(v_u_22.WHITE).Parent = v_u_74
	return v_u_73
end
function v_u_65.CreateBillboardGuiHelper(_, p77, p78)
	-- upvalues: (copy) v_u_65, (copy) v_u_76
	if p77 and not v_u_65.CharacterSortedMsg:Get(p77).BillboardGui then
		if not p78 and p77:IsA("BasePart") then
			v_u_65.CharacterSortedMsg:Get(p77).BillboardGui = v_u_76(p77)
			return
		end
		if p77:IsA("Model") then
			local v79 = p77:FindFirstChild("Head")
			if v79 and v79:IsA("BasePart") then
				v_u_65.CharacterSortedMsg:Get(p77).BillboardGui = v_u_76(v79)
			end
		end
	end
end
function v_u_65.SetBillboardLODNear(_, p80)
	-- upvalues: (copy) v_u_1
	local v81 = p80.Adornee
	local v82
	if v81 and v_u_1.LocalPlayer.Character then
		v82 = v81:IsDescendantOf(v_u_1.LocalPlayer.Character)
	else
		v82 = nil
	end
	p80.Size = UDim2.new(0, 400, 0, 250)
	p80.StudsOffset = Vector3.new(0, v82 and 1.5 or 2.5, v82 and 2 or 0.1)
	p80.Enabled = true
	local v83 = p80.BillboardFrame:GetChildren()
	for v84 = 1, #v83 do
		v83[v84].Visible = true
	end
	p80.BillboardFrame.SmallTalkBubble.Visible = false
end
function v_u_65.SetBillboardLODDistant(_, p85)
	-- upvalues: (copy) v_u_1
	local v86 = p85.Adornee
	local v87
	if v86 and v_u_1.LocalPlayer.Character then
		v87 = v86:IsDescendantOf(v_u_1.LocalPlayer.Character)
	else
		v87 = nil
	end
	p85.Size = UDim2.new(4, 0, 3, 0)
	p85.StudsOffset = Vector3.new(0, 3, v87 and 2 or 0.1)
	p85.Enabled = true
	local v88 = p85.BillboardFrame:GetChildren()
	for v89 = 1, #v88 do
		v88[v89].Visible = false
	end
	p85.BillboardFrame.SmallTalkBubble.Visible = true
end
function v_u_65.SetBillboardLODVeryFar(_, p90)
	p90.Enabled = false
end
function v_u_65.SetBillboardGuiLOD(_, p91, p92)
	-- upvalues: (copy) v_u_65
	if p92 then
		if p92:IsA("Model") then
			p92 = p92:FindFirstChild("Head") or p92.PrimaryPart
		end
		local v93 = not p92 and 100000 or (p92.Position - game.Workspace.CurrentCamera.CoordinateFrame.Position).magnitude
		if v93 < 65 then
			v_u_65:SetBillboardLODNear(p91)
			return
		elseif 65 <= v93 and v93 < 100 then
			v_u_65:SetBillboardLODDistant(p91)
		else
			v_u_65:SetBillboardLODVeryFar(p91)
		end
	else
		return
	end
end
function v_u_65.CameraCFrameChanged(_)
	-- upvalues: (copy) v_u_65
	for v94, v95 in pairs(v_u_65.CharacterSortedMsg:GetData()) do
		local v96 = v95.BillboardGui
		if v96 then
			v_u_65:SetBillboardGuiLOD(v96, v94)
		end
	end
end
function v_u_65.CreateBubbleText(_, p97, p98)
	-- upvalues: (ref) v_u_12, (copy) v_u_19, (copy) v_u_20
	local v99 = Instance.new("TextLabel")
	v99.Name = "BubbleText"
	v99.BackgroundTransparency = 1
	if v_u_12 then
		v99.Size = UDim2.fromScale(1, 1)
	else
		v99.Position = UDim2.new(0, 15, 0, 0)
		v99.Size = UDim2.new(1, -30, 1, 0)
	end
	v99.Font = v_u_19
	v99.ClipsDescendants = true
	v99.TextWrapped = true
	v99.FontSize = v_u_20
	v99.Text = p97
	v99.Visible = false
	v99.AutoLocalize = p98
	if v_u_12 then
		local v100 = Instance.new("UIPadding")
		v100.PaddingTop = UDim.new(0, 12)
		v100.PaddingRight = UDim.new(0, 12)
		v100.PaddingBottom = UDim.new(0, 12)
		v100.PaddingLeft = UDim.new(0, 12)
		v100.Parent = v99
	end
	return v99
end
function v_u_65.CreateSmallTalkBubble(_, p101)
	-- upvalues: (copy) v_u_65
	local v102 = v_u_65.ScalingChatBubbleWithTail[p101]:Clone()
	v102.Name = "SmallTalkBubble"
	v102.AnchorPoint = Vector2.new(0, 0.5)
	v102.Position = UDim2.new(0, 0, 0.5, 0)
	v102.Visible = false
	local v103 = v_u_65:CreateBubbleText("...")
	v103.TextScaled = true
	v103.TextWrapped = false
	v103.Visible = true
	v103.Parent = v102
	return v102
end
function v_u_65.UpdateChatLinesForOrigin(_, p104, p105)
	-- upvalues: (copy) v_u_65
	local v106 = v_u_65.CharacterSortedMsg:Get(p104).Fifo
	local v107 = v106:Size()
	local v108 = v106:GetData()
	if #v108 > 1 then
		for v109 = #v108 - 1, 1, -1 do
			local v110 = v108[v109].RenderBubble
			if not v110 then
				return
			end
			if 1 < v107 - v109 + 1 then
				local v111 = v110:FindFirstChild("ChatBubbleTail")
				if v111 then
					v111:Destroy()
				end
				local v112 = v110:FindFirstChild("BubbleText")
				if v112 then
					v112.TextTransparency = 0.5
				end
			end
			v110:TweenPosition(UDim2.new(v110.Position.X.Scale, v110.Position.X.Offset, 1, p105 - v110.Size.Y.Offset - 14), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.1, true)
			p105 = p105 - v110.Size.Y.Offset - 14
		end
	end
end
function v_u_65.DestroyBubble(_, p_u_113, p_u_114)
	if p_u_113 then
		if p_u_113:Empty() then
			return
		else
			local v_u_115 = p_u_113:Front().RenderBubble
			if v_u_115 then
				spawn(function()
					-- upvalues: (copy) p_u_113, (copy) p_u_114, (ref) v_u_115
					while p_u_113:Front().RenderBubble ~= p_u_114 do
						wait()
					end
					v_u_115 = p_u_113:Front().RenderBubble
					local v116 = v_u_115:FindFirstChild("BubbleText")
					local v117 = v_u_115:FindFirstChild("ChatBubbleTail")
					while v_u_115 and v_u_115.ImageTransparency < 1 do
						local v118 = wait()
						if v_u_115 then
							local v119 = v118 * 1.5
							v_u_115.ImageTransparency = v_u_115.ImageTransparency + v119
							if v116 then
								v116.TextTransparency = v116.TextTransparency + v119
							end
							if v117 then
								v117.ImageTransparency = v117.ImageTransparency + v119
							end
						end
					end
					if v_u_115 then
						v_u_115:Destroy()
						p_u_113:PopFront()
					end
				end)
			else
				p_u_113:PopFront()
			end
		end
	else
		return
	end
end
function v_u_65.CreateChatLineRender(_, p120, p121, p122, p_u_123, p124)
	-- upvalues: (copy) v_u_65, (copy) v_u_4, (copy) v_u_19, (ref) v_u_12
	if p120 then
		if not v_u_65.CharacterSortedMsg:Get(p120).BillboardGui then
			v_u_65:CreateBillboardGuiHelper(p120, p122)
		end
		local v125 = v_u_65.CharacterSortedMsg:Get(p120).BillboardGui
		if v125 then
			local v_u_126 = v_u_65.ChatBubbleWithTail[p121.BubbleColor]:Clone()
			v_u_126.Visible = false
			local v_u_127 = v_u_65:CreateBubbleText(p121.Message, p124)
			v_u_127.Parent = v_u_126
			v_u_126.Parent = v125.BillboardFrame
			p121.RenderBubble = v_u_126
			local v128 = v_u_4:GetTextSize(v_u_127.Text, 24, v_u_19, Vector2.new(400, 250))
			local v129 = v128.Y / 24
			if v_u_12 then
				local v130 = math.ceil(v128.X + 24)
				local v131 = v129 * 34
				v_u_126.Size = UDim2.fromOffset(0, 0)
				v_u_126.Position = UDim2.fromScale(0.5, 1)
				v_u_126:TweenSizeAndPosition(UDim2.fromOffset(v130, v131), UDim2.new(0.5, -v130 / 2, 1, -v131), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function()
					-- upvalues: (copy) v_u_127
					v_u_127.Visible = true
				end)
				v_u_65:SetBillboardGuiLOD(v125, p121.Origin)
				v_u_65:UpdateChatLinesForOrigin(p121.Origin, -v131)
			else
				local v132 = math.max((v128.X + 30) / 400, 0.1)
				v_u_126.Size = UDim2.new(0, 0, 0, 0)
				v_u_126.Position = UDim2.new(0.5, 0, 1, 0)
				local v133 = v129 * 34
				v_u_126:TweenSizeAndPosition(UDim2.new(v132, 0, 0, v133), UDim2.new((1 - v132) / 2, 0, 1, -v133), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1, true, function()
					-- upvalues: (copy) v_u_127
					v_u_127.Visible = true
				end)
				v_u_65:SetBillboardGuiLOD(v125, p121.Origin)
				v_u_65:UpdateChatLinesForOrigin(p121.Origin, -v133)
			end
			delay(p121.BubbleDieDelay, function()
				-- upvalues: (ref) v_u_65, (copy) p_u_123, (copy) v_u_126
				v_u_65:DestroyBubble(p_u_123, v_u_126)
			end)
		end
	end
end
function v_u_65.OnPlayerChatMessage(_, p134, p135, _)
	-- upvalues: (copy) v_u_65, (copy) v_u_1, (copy) v_u_35, (copy) v_u_22
	if v_u_65:BubbleChatEnabled() then
		local v136 = v_u_1.LocalPlayer
		local v137
		if v136 == nil then
			v137 = false
		else
			v137 = p134 ~= v136
		end
		local v138 = v_u_35(v_u_65:SanitizeChatLine(p135), v_u_22.WHITE, not v137)
		if p134 then
			v138.User = p134.Name
			v138.Origin = p134.Character
		end
		if p134 and v138.Origin then
			local v139 = v_u_65.CharacterSortedMsg:Get(v138.Origin).Fifo
			v139:PushBack(v138)
			v_u_65:CreateChatLineRender(p134.Character, v138, true, v139, false)
		end
	end
end
function v_u_65.OnGameChatMessage(_, p140, p141, p142)
	-- upvalues: (ref) v_u_15, (ref) v_u_18, (copy) v_u_3, (copy) v_u_1, (copy) v_u_22, (copy) v_u_65, (copy) v_u_35, (copy) v_u_9
	if v_u_15 or v_u_18 and v_u_3.BubbleChatEnabled then
		return
	else
		local v143 = v_u_1.LocalPlayer
		local v144
		if v143 == nil then
			v144 = false
		else
			v144 = v143.Character ~= p140
		end
		local v145 = v_u_22.WHITE
		if p142 == Enum.ChatColor.Blue then
			v145 = v_u_22.BLUE
		elseif p142 == Enum.ChatColor.Green then
			v145 = v_u_22.GREEN
		elseif p142 == Enum.ChatColor.Red then
			v145 = v_u_22.RED
		end
		local v146 = v_u_35(v_u_65:SanitizeChatLine(p141), v145, not v144)
		v146.Origin = p140
		v_u_65.CharacterSortedMsg:Get(v146.Origin).Fifo:PushBack(v146)
		if v_u_9 then
			v_u_65:CreateChatLineRender(p140, v146, false, v_u_65.CharacterSortedMsg:Get(v146.Origin).Fifo, true)
		else
			v_u_65:CreateChatLineRender(p140, v146, false, v_u_65.CharacterSortedMsg:Get(v146.Origin).Fifo, false)
		end
	end
end
function v_u_65.BubbleChatEnabled(_)
	-- upvalues: (ref) v_u_15, (ref) v_u_18, (copy) v_u_3, (copy) v_u_1
	if v_u_15 or v_u_18 and v_u_3.BubbleChatEnabled then
		return false
	end
	local v147 = v_u_3:FindFirstChild("ClientChatModules")
	local v148 = v147 and v147:FindFirstChild("ChatSettings")
	if v148 then
		local v149 = require(v148)
		if v149.BubbleChatEnabled ~= nil then
			return v149.BubbleChatEnabled
		end
	end
	return v_u_1.BubbleChat
end
function v_u_65.ShowOwnFilteredMessage(_)
	-- upvalues: (copy) v_u_3
	local v150 = v_u_3:FindFirstChild("ClientChatModules")
	local v151 = v150 and v150:FindFirstChild("ChatSettings")
	if v151 then
		return require(v151).ShowUserOwnFilteredMessage
	else
		return false
	end
end
function findPlayer(p152)
	-- upvalues: (copy) v_u_1
	for _, v153 in pairs(v_u_1:GetPlayers()) do
		if v153.Name == p152 then
			return v153
		end
	end
end
v_u_3.Chatted:connect(function(p154, p155, p156)
	-- upvalues: (copy) v_u_65
	v_u_65:OnGameChatMessage(p154, p155, p156)
end)
local v_u_157
if game.Workspace.CurrentCamera then
	v_u_157 = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(_)
		-- upvalues: (copy) v_u_65
		v_u_65:CameraCFrameChanged()
	end)
else
	v_u_157 = nil
end
game.Workspace.Changed:Connect(function(p158)
	-- upvalues: (ref) v_u_157, (copy) v_u_65
	if p158 == "CurrentCamera" then
		if v_u_157 then
			v_u_157:disconnect()
		end
		if game.Workspace.CurrentCamera then
			v_u_157 = game.Workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function(_)
				-- upvalues: (ref) v_u_65
				v_u_65:CameraCFrameChanged()
			end)
		end
	end
end)
local v_u_159 = nil
function getAllowedMessageTypes()
	-- upvalues: (ref) v_u_159, (copy) v_u_3
	if v_u_159 then
		return v_u_159
	end
	local v160 = v_u_3:FindFirstChild("ClientChatModules")
	if not v160 then
		return { "Message", "Whisper" }
	end
	local v161 = v160:FindFirstChild("ChatSettings")
	if v161 then
		local v162 = require(v161)
		if v162.BubbleChatMessageTypes then
			v_u_159 = v162.BubbleChatMessageTypes
			return v_u_159
		end
	end
	local v163 = v160:FindFirstChild("ChatConstants")
	if v163 then
		local v164 = require(v163)
		v_u_159 = { v164.MessageTypeDefault, v164.MessageTypeWhisper }
	end
	return v_u_159
end
function checkAllowedMessageType(p165)
	local v166 = getAllowedMessageTypes()
	for v167 = 1, #v166 do
		if v166[v167] == p165.MessageType then
			return true
		end
	end
	return false
end
local v168 = v2:WaitForChild("DefaultChatSystemChatEvents")
v168:WaitForChild("OnNewMessage").OnClientEvent:connect(function(p169, _)
	-- upvalues: (ref) v_u_5, (copy) v_u_65
	if checkAllowedMessageType(p169) then
		local v170 = findPlayer(p169.FromSpeaker)
		if v170 then
			if p169.IsFiltered and p169.FromSpeaker ~= v_u_5.Name or p169.FromSpeaker == v_u_5.Name and not v_u_65:ShowOwnFilteredMessage() then
				v_u_65:OnPlayerChatMessage(v170, p169.Message, nil)
			end
		else
			return
		end
	else
		return
	end
end)
v168:WaitForChild("OnMessageDoneFiltering").OnClientEvent:connect(function(p171, _)
	-- upvalues: (ref) v_u_5, (copy) v_u_65
	if checkAllowedMessageType(p171) then
		local v172 = findPlayer(p171.FromSpeaker)
		if v172 then
			if p171.FromSpeaker ~= v_u_5.Name or v_u_65:ShowOwnFilteredMessage() then
				v_u_65:OnPlayerChatMessage(v172, p171.Message, nil)
			end
		else
			return
		end
	else
		return
	end
end)
