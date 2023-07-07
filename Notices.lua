-- decompiled by Sentinel (took 3.244228ms)
local v1 = {}
local v_u_2 = _G.HDAdminMain
local v_u_3 = v_u_2.gui.Notices
local v_u_4 = v_u_3.Template
local v_u_5 = true
local v_u_6 = {}
local v_u_7 = {}
local v_u_8 = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local v_u_9 = TweenInfo.new(0.625, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local v_u_10 = TweenInfo.new(0.625, Enum.EasingStyle.Back, Enum.EasingDirection.In)
if v_u_2.device ~= "Mobile" then
	v_u_4.Position = UDim2.new(1, 0, 1, -90)
	v_u_4.Size = UDim2.new(0, 245.7, 0, 90)
	v_u_4.Desc.UITextSizeConstraint.MaxTextSize = 20.25
end
local function v_u_15(_)
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_4, (copy) v_u_9, (copy) v_u_2
	for v11, v12 in pairs(v_u_7) do
		if not v12.Complete.Value then
			local v13 = v_u_8
			local v14
			if v11 == 1 then
				v14 = v_u_4.Position + UDim2.new(0, -v12.Size.X.Offset, 0, 0)
			else
				local _ = v_u_7[v11 - 1]
				v14 = UDim2.new(v12.Position.X.Scale, v12.Position.X.Offset, v12.Position.Y.Scale, v_u_4.Position.Y.Offset - (v11 - 1) * (v_u_4.Size.Y.Offset + 5))
			end
			if v14.Y.Offset > v12.Position.Y.Offset then
				v13 = v_u_9
			end
			if v14 then
				v_u_2.tweenService:Create(v12, v13, {
					["Position"] = v14
				}):Play()
			end
		end
	end
end
local function v_u_20(p16)
	-- upvalues: (copy) v_u_7, (copy) v_u_2, (copy) v_u_10, (copy) v_u_15
	if p16:FindFirstChild("Complete") and not p16.Complete.Value then
		p16.Complete.Value = true
		for v17, v18 in pairs(v_u_7) do
			if v18 == p16 then
				table.remove(v_u_7, v17)
				local v19 = v_u_2.tweenService:Create(p16, v_u_10, {
					["Position"] = p16.Position + UDim2.new(0, p16.Size.X.Offset - 0, 0, 0)
				})
				v19:Play()
				v19.Completed:Wait()
				p16:Destroy()
			end
		end
	end
	v_u_15()
end
local function v_u_29()
	-- upvalues: (ref) v_u_5, (copy) v_u_6, (copy) v_u_3, (copy) v_u_2, (copy) v_u_7, (copy) v_u_20, (copy) v_u_15
	if v_u_5 then
		v_u_5 = false
		repeat
			wait()
			if 0 < #v_u_6 then
				local v_u_21 = v_u_6[1]
				v_u_21.Parent = v_u_3
				if v_u_21.NoticeType.Value == "Error" then
					v_u_2.audio.Error:Play()
				else
					v_u_2.audio.Notice:Play()
				end
				local v22 = v_u_7
				table.insert(v22, 1, v_u_21)
				if v_u_21.Countdown.Value < 900 then
					spawn(function()
						-- upvalues: (copy) v_u_21, (ref) v_u_20
						if 0 < v_u_21.Countdown.Value then
							local v23 = os.time()
							repeat
								wait()
							until os.time() ~= v23
							local v24 = v_u_21.Desc.Text
							for v25 = 1, v_u_21.Countdown.Value do
								if not v_u_21:FindFirstChild("Desc") or v_u_21.Desc.Text == "Teleporting..." then
									break
								end
								local v26 = v_u_21.Desc
								local v27 = v_u_21.Countdown.Value + 1 - v25
								v26.Text = v24 .. " (" .. v27 .. ")"
								wait(1)
							end
						else
							local v28 = tick()
							repeat
								wait(0.1)
							until 7 <= tick() - v28
						end
						v_u_20(v_u_21)
					end)
				end
				v_u_15(true)
				wait(0.5)
				table.remove(v_u_6, 1)
			end
		until #v_u_6 < 1
		v_u_5 = true
	end
end
function v1.Notice(_, p_u_30, p_u_31, p_u_32, p_u_33)
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_20, (copy) v_u_6, (copy) v_u_29
	if not (v_u_2.pdata and v_u_2.pdata.SetupData) then
		repeat
			wait(0.1)
		until v_u_2.pdata and v_u_2.pdata.SetupData
	end
	if v_u_2.settings.DisableAllNotices ~= true then
		spawn(function()
			-- upvalues: (ref) v_u_4, (copy) p_u_31, (copy) p_u_32, (copy) p_u_30, (copy) p_u_33, (ref) v_u_2, (ref) v_u_20, (ref) v_u_6, (ref) v_u_29
			local v_u_34 = v_u_4:Clone()
			v_u_34.Visible = true
			v_u_34.Title.Text = p_u_31
			v_u_34.Desc.Text = p_u_32
			v_u_34.NoticeType.Value = p_u_30
			local v35 = p_u_33
			if type(v35) == "table" then
				local v_u_36 = true
				local v37 = p_u_33[1]
				if v37 == "ShowSpecificPage" then
					v_u_34.Countdown.Value = 20
					v_u_34.TextButton.MouseButton1Down:Connect(function()
						-- upvalues: (ref) v_u_36, (ref) v_u_2, (ref) p_u_33, (ref) v_u_20, (copy) v_u_34
						local v38
						if v_u_36 then
							v_u_36 = false
							v38 = true
						else
							v38 = nil
						end
						if v38 then
							v_u_2:GetModule("GUIs"):ShowSpecificPage(p_u_33[2], p_u_33[3])
							v_u_20(v_u_34)
						end
					end)
				elseif v37 == "Teleport" then
					v_u_34.Countdown.Value = 25
					v_u_34.TextButton.MouseButton1Down:Connect(function()
						-- upvalues: (ref) v_u_36, (ref) v_u_2, (ref) p_u_33, (copy) v_u_34
						local v39
						if v_u_36 then
							v_u_36 = false
							v39 = true
						else
							v39 = nil
						end
						if v39 then
							v_u_2.teleportService:Teleport(p_u_33[2])
							v_u_34.Desc.Text = "Teleporting..."
						end
					end)
				elseif v37 == "PM" then
					v_u_34.Countdown.Value = 999
					v_u_34.TextButton.MouseButton1Down:Connect(function()
						-- upvalues: (ref) v_u_36, (ref) v_u_2, (ref) p_u_33, (ref) v_u_20, (copy) v_u_34
						local v40
						if v_u_36 then
							v_u_36 = false
							v40 = true
						else
							v40 = nil
						end
						if v40 then
							v_u_2:GetModule("cf"):CreateNewCommandMenu("privateMessage", { p_u_33[2], p_u_33[3] }, 4)
							v_u_20(v_u_34)
						end
					end)
				end
			end
			v_u_34.CloseX.MouseButton1Down:Connect(function()
				-- upvalues: (ref) v_u_20, (copy) v_u_34
				v_u_20(v_u_34)
			end)
			local v41 = v_u_6
			table.insert(v41, v_u_34)
			v_u_29()
		end)
	end
end
return v1
