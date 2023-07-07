-- decompiled by Sentinel (took 2.635029ms)
local v1 = {}
local v_u_2 = _G.HDAdminMain
function v1.SetupMainVariables(_, p3)
	-- upvalues: (copy) v_u_2
	v_u_2.hdAdminGroup = {
		["Id"] = 4676369, 
		["Info"] = {}
	}
	v_u_2.hdAdminGroupInfo = {}
	v_u_2.settingsBanRecords = {}
	v_u_2.alphabet = {
		"a", 
		"b", 
		"c", 
		"d", 
		"e", 
		"f", 
		"g", 
		"h", 
		"i", 
		"j", 
		"k", 
		"l", 
		"m", 
		"n", 
		"o", 
		"p", 
		"q", 
		"r", 
		"s", 
		"t", 
		"u", 
		"v", 
		"w", 
		"x", 
		"y", 
		"z"
	}
	v_u_2.UserIdsFromName = {}
	v_u_2.UsernamesFromUserId = {}
	v_u_2.validSettings = {
		"Theme", 
		"NoticeSoundId", 
		"NoticeVolume", 
		"NoticePitch", 
		"ErrorSoundId", 
		"ErrorVolume", 
		"ErrorPitch", 
		"AlertSoundId", 
		"AlertVolume", 
		"AlertPitch", 
		"Prefix"
	}
	v_u_2.commandInfoToShowOnClient = {
		"Name", 
		"Contributors", 
		"Prefixes", 
		"Rank", 
		"Aliases", 
		"Tags", 
		"Description", 
		"Args", 
		"Loopable"
	}
	v_u_2.products = {
		["Donor"] = 5745895, 
		["OldDonor"] = 2649766
	}
	v_u_2.materials = {
		"Plastic", 
		"Wood", 
		"Concrete", 
		"CorrodedMetal", 
		"DiamondPlate", 
		"Foil", 
		"Grass", 
		"Ice", 
		"Marble", 
		"Granite", 
		"Brick", 
		"Pebble", 
		"Sand", 
		"Fabric", 
		"SmoothPlastic", 
		"Metal", 
		"WoodPlanks", 
		"Cobblestone", 
		"Neon", 
		"Glass"
	}
	v_u_2.rankTypes = {
		["Auto"] = 4, 
		["Perm"] = 3, 
		["Server"] = 2, 
		["Temp"] = 1
	}
	if p3 == "Server" then
		v_u_2.pd = {}
		v_u_2.sd = {}
		v_u_2.permissions = {
			["specificUsers"] = {}, 
			["gamepasses"] = {}, 
			["assets"] = {}, 
			["groups"] = {}, 
			["friends"] = 0, 
			["freeAdmin"] = 0, 
			["vipServerOwner"] = 0, 
			["vipServerPlayer"] = 0, 
			["owner"] = true
		}
		v_u_2.commandInfo = {}
		v_u_2.commandRanks = {}
		v_u_2.infoOnAllCommands = {
			["Contributors"] = {}, 
			["Tags"] = {}, 
			["Prefixes"] = {}, 
			["Aliases"] = {}
		}
		v_u_2.morphNames = {}
		v_u_2.toolNames = {}
		v_u_2.commands = {}
		v_u_2.playersRanked = {}
		v_u_2.playersUnranked = {}
		v_u_2.settings.UniversalPrefix = "!"
		v_u_2.serverAdmins = {}
		v_u_2.owner = {}
		v_u_2.ownerId = game.CreatorId
		if game.CreatorType == Enum.CreatorType.Group then
			local v4 = nil
			local v5 = nil
			for _ = 1, 10 do
				v4, v5 = pcall(function()
					-- upvalues: (ref) v_u_2
					return v_u_2.groupService:GetGroupInfoAsync(game.CreatorId).Owner
				end)
				if v4 then
					break
				end
				task.wait(1)
			end
			if v4 then
				v_u_2.ownerId = v5.Id
				v_u_2.ownerName = v5.Name
			end
		end
		v_u_2.gameName = 0 < game.PlaceId and v_u_2.marketplaceService:GetProductInfo(game.PlaceId, Enum.InfoType.Asset).Name or "GameNameFailedToLoad"
		v_u_2.listOfTools = {}
		v_u_2.ranksAllowedToJoin = 0
		v_u_2.permissionToReplyToPrivateMessage = {}
		v_u_2.logs = {
			["command"] = {}, 
			["chat"] = {}
		}
		v_u_2.isStudio = v_u_2.runService:IsStudio()
		v_u_2.serverBans = {}
		v_u_2.blacklistedVipServerCommands = {}
		v_u_2.banned = {}
		v_u_2.commandBlocks = {}
		for v_u_6 = 1, 3 do
			pcall(function()
				-- upvalues: (ref) v_u_2, (copy) v_u_6
				v_u_2.physicsService:CreateCollisionGroup("Group" .. v_u_6)
			end)
		end
		v_u_2.physicsService:CollisionGroupSetCollidable("Group1", "Group2", false)
	elseif p3 == "Client" then
		v_u_2.qualifiers = {
			"me", 
			"all", 
			"others", 
			"random", 
			"admins", 
			"nonAdmins", 
			"friends", 
			"nonFriends", 
			"NBC", 
			"BC", 
			"TBC", 
			"OBC", 
			"R6", 
			"R15", 
			"rthro", 
			"nonRthro"
		}
		v_u_2.colors = {}
		v_u_2.topbarEnabled = true
		v_u_2.blur = Instance.new("BlurEffect", v_u_2.camera)
		v_u_2.blur.Size = 0
		v_u_2.commandMenus = {}
		v_u_2.commandsToDisableCompletely = {
			["laserEyes"] = true
		}
		v_u_2.commandsActive = {}
		v_u_2.commandsAllowedToUse = {}
		v_u_2.commandsWithMenus = {
			["Type1"] = {
				["laserEyes"] = { "Info", "Press and hold to activate." }, 
				["fly"] = { "Input", "Speed" }, 
				["fly2"] = { "Input", "Speed" }, 
				["noclip"] = { "Input", "Speed" }, 
				["noclip2"] = { "Input", "Speed" }
			}, 
			["Type2"] = {
				["cmdbar2"] = {}
			}, 
			["Type3"] = {
				["bubbleChat"] = {}
			}
		}
		v_u_2.commandSpeeds = {
			["fly"] = 50, 
			["fly2"] = 50, 
			["noclip"] = 100, 
			["noclip2"] = 25
		}
		for v7, v8 in pairs(v_u_2.commandSpeeds) do
			local v9 = v_u_2.settings.CommandLimits[v7]
			if v9 then
				local v10 = v9.Limit
				if v10 < v8 then
					v_u_2.commandSpeeds[v7] = v10
				end
			end
		end
		v_u_2.infoFramesViewed = {
			["Speed"] = true
		}
	end
	table.sort(v_u_2.settings.Ranks, function(p11, p12)
		return p11[1] < p12[1]
	end)
end
return v1
