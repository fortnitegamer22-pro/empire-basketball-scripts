-- decompiled by Sentinel (took 3.333074ms)
local v1 = {}
local v_u_2 = _G.HDAdminMain
local _ = v_u_2.gui.CustomTopBar
for _, v_u_3 in pairs(v_u_2.signals:GetChildren()) do
	if v_u_3:IsA("RemoteEvent") then
		v_u_3.OnClientEvent:Connect(function(p4)
			-- upvalues: (copy) v_u_2, (copy) v_u_3
			if not v_u_2.initialized then
				v_u_2.client.Signals.Initialized.Event:Wait()
			end
			if v_u_3.Name == "ChangeStat" then
				local v5 = p4[1]
				local v6 = p4[2]
				v_u_2.pdata[v5] = v6
				if v5 == "Donor" then
					v_u_2:GetModule("PageSpecial"):UpdateDonorFrame()
					return
				end
			else
				if v_u_3.Name == "InsertStat" then
					local v7 = p4[1]
					local v8 = p4[2]
					local v9 = v_u_2.pdata[v7]
					table.insert(v9, v8)
					return
				end
				if v_u_3.Name == "RemoveStat" then
					local v10 = p4[1]
					local v11 = p4[2]
					for v12, v13 in pairs(v_u_2.pdata[v10]) do
						if tostring(v13) == tostring(v11) then
							table.remove(v_u_2.pdata[v10], v12)
							return
						end
					end
					return
				end
				if v_u_3.Name == "Notice" or v_u_3.Name == "Error" then
					v_u_2:GetModule("Notices"):Notice(v_u_3.Name, p4[1], p4[2], p4[3])
					return
				end
				if v_u_3.Name == "ShowPage" then
					v_u_2:GetModule("GUIs"):ShowSpecificPage(p4[1], p4[2])
					return
				end
				if v_u_3.Name == "ShowBannedUser" then
					v_u_2:GetModule("GUIs"):ShowSpecificPage("Admin", "Banland")
					if type(p4) == "table" then
						v_u_2:GetModule("cf"):ShowBannedUser(p4)
						return
					end
				else
					if v_u_3.Name == "SetCameraSubject" then
						v_u_2:GetModule("cf"):SetCameraSubject(p4)
						return
					end
					if v_u_3.Name == "Clear" then
						v_u_2:GetModule("Messages"):ClearMessageContainer()
						return
					end
					if v_u_3.Name == "ShowWarning" then
						v_u_2:GetModule("cf"):ShowWarning(p4)
						return
					end
					if v_u_3.Name == "Message" then
						v_u_2:GetModule("Messages"):Message(p4)
						return
					end
					if v_u_3.Name == "Hint" then
						v_u_2:GetModule("Messages"):Hint(p4)
						return
					end
					if v_u_3.Name == "GlobalAnnouncement" then
						v_u_2:GetModule("Messages"):GlobalAnnouncement(p4)
						return
					end
					if v_u_3.Name == "SetCoreGuiEnabled" then
						v_u_2.starterGui:SetCoreGuiEnabled(Enum.CoreGuiType[p4[1]], p4[2])
						return
					end
					if v_u_3.Name == "CreateLog" then
						v_u_2:GetModule("cf"):CreateNewCommandMenu(p4[1], p4[2], 5)
						return
					end
					if v_u_3.Name == "CreateAlert" then
						v_u_2:GetModule("cf"):CreateNewCommandMenu("alert", p4, 8, true)
						return
					end
					if v_u_3.Name == "CreateBanMenu" then
						v_u_2:GetModule("cf"):CreateNewCommandMenu("banMenu", p4, 6)
						return
					end
					if v_u_3.Name == "CreatePollMenu" then
						v_u_2:GetModule("cf"):CreateNewCommandMenu("pollMenu", p4, 9)
						return
					end
					if v_u_3.Name == "CreateMenu" then
						v_u_2:GetModule("cf"):CreateNewCommandMenu(p4.MenuName, p4.Data, p4.TemplateId)
						return
					end
					if v_u_3.Name == "CreateCommandMenu" then
						local v14 = p4[1]
						local v15 = p4[2]
						local v16 = p4[3]
						v_u_2:GetModule("cf"):CreateNewCommandMenu(v14, v15, v16)
						return
					end
					if v_u_3.Name == "RankChanged" then
						v_u_2:GetModule("cf"):RankChangedUpdater()
						return
					end
					if v_u_3.Name == "ExecuteClientCommand" then
						local v17 = p4[1]
						local v18 = p4[2]
						local v19 = p4[3]
						local v20 = p4[4].UnFunction and "UnFunction" or "Function"
						local v21 = v_u_2:GetModule("ClientCommands")[v19]
						local v22 = v21 and v21[v20]
						if v22 then
							v22(v17, v18, v21)
							return
						end
					elseif v_u_3.Name == "ReplicationEffectClientCommand" then
						local v23 = p4[1]
						local v24 = p4[2]
						local v25 = p4[3]
						local v26 = v_u_2:GetModule("ClientCommands")[v23]
						local v27 = v26 and v26.ReplicationEffect
						if v27 then
							v27(v24, v25, v26)
							return
						end
					elseif v_u_3.Name == "ActivateClientCommand" then
						local v28 = p4[1]
						local v29 = p4[2]
						local v30
						if v29 then
							v30 = v29.Speed ~= 0 and v29.Speed or nil
						else
							v30 = v29
						end
						if v30 then
							v_u_2.commandSpeeds[v28] = v30
							local v31 = v_u_2.gui:FindFirstChild("CommandMenufly")
							v_u_2:GetModule("cf"):DestroyCommandMenuFrame(v31)
						end
						if v_u_2.commandSpeeds[v28] then
							for v32, _ in pairs(v_u_2.commandSpeeds) do
								if v32 ~= v28 then
									v_u_2:GetModule("cf"):DeactivateCommand(v32)
								end
							end
						end
						v_u_2.commandsAllowedToUse[v28] = true
						v_u_2:GetModule("cf"):ActivateClientCommand(v28, v29)
						local v33 = nil
						local v34 = nil
						for v35, v36 in pairs(v_u_2.commandsWithMenus) do
							v34 = v36[v28]
							if v34 then
								v33 = tonumber(v35:match("%d+"))
								break
							end
						end
						if v34 then
							v_u_2:GetModule("cf"):CreateNewCommandMenu(v28, v34, v33)
							return
						end
					else
						if v_u_3.Name == "DeactivateClientCommand" then
							v_u_2:GetModule("cf"):DeactivateCommand(p4[1])
							return
						end
						if v_u_3.Name == "FadeInIcon" then
							return
						end
						if v_u_3.Name == "ChangeMainVariable" then
							v_u_2[p4[1]] = p4
						end
					end
				end
			end
		end)
	elseif v_u_3:IsA("RemoteFunction") then
		function v_u_3.OnClientInvoke(p37)
			-- upvalues: (copy) v_u_2, (copy) v_u_3
			if not v_u_2.initialized then
				v_u_2.client.Signals.Initialized.Event:Wait()
			end
			if v_u_3.Name == "GetLocalDate" then
				return os.date("*t", p37)
			end
		end
	end
end
return v1
