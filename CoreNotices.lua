-- decompiled by Sentinel (took 1.380073ms)
local v1 = {}
local v_u_2 = _G.HDAdminMain
function v1.GetNotice(_, p3)
	-- upvalues: (copy) v_u_2
	return ({
		["WelcomeRank"] = {
			v_u_2.hdAdminCoreName, 
			"Your rank is \'%s\'! Click to view the commands.", 
			{ "ShowSpecificPage", "Commands", "Commands" }
		}, 
		["WelcomeDonor"] = {
			v_u_2.hdAdminCoreName, 
			"Your\'re a Donor! Click to view Donor Commands.", 
			{ "ShowSpecificPage", "Special", "Donor" }
		}, 
		["SetRank"] = { v_u_2.hdAdminCoreName, "You\'ve been %sed to \'%s\'!" }, 
		["UnlockRank"] = { v_u_2.hdAdminCoreName, "You\'ve unlocked the rank \'%s\'!" }, 
		["UnRank"] = { v_u_2.hdAdminCoreName, "You\'ve been unranked!" }, 
		["ParserInvalidCommandRank"] = { v_u_2.hdAdminCoreName, "\'%s\' is not a valid command! Try \'%srank plr %s\' instead." }, 
		["ParserInvalidCommandNormal"] = { v_u_2.hdAdminCoreName, "\'%s\' is not a valid command!", "" }, 
		["ParserInvalidPrefix"] = { v_u_2.hdAdminCoreName, "Invalid prefix! Try \'%s%s\' instead." }, 
		["ParserInvalidVipServer"] = { v_u_2.hdAdminCoreName, "You cannot use \'%s\' in VIP Servers." }, 
		["ParserInvalidDonor"] = { v_u_2.hdAdminCoreName, "You must be a Donor to use that command!" }, 
		["ParserInvalidLoop"] = { v_u_2.hdAdminCoreName, "You do not have permission to use Loop commands!" }, 
		["ParserInvalidRank"] = { v_u_2.hdAdminCoreName, "You do not have permission to use \'%s\'" }, 
		["ParserCommandBlock"] = { v_u_2.hdAdminCoreName, "Commands are temporarily disabled.\'" }, 
		["ParserInvalidRigType"] = { v_u_2.hdAdminCoreName, "%s must be %s to use that command." }, 
		["ParserPlayerRankBlocked"] = { v_u_2.hdAdminCoreName, "You do not have the permissions to use \'%s\' on %s!" }, 
		["ParserSpeakerRank"] = { v_u_2.hdAdminCoreName, "You %sed %s to \'%s\'" }, 
		["ParserSpeakerUnrank"] = { v_u_2.hdAdminCoreName, "You unranked %s" }, 
		["ParserPlrPunished"] = { v_u_2.hdAdminCoreName, "%s must be unpunished to use that command." }, 
		["ReceivedPM"] = { v_u_2.hdAdminCoreName, "You have a message from %s! Click to open." }, 
		["RemovePermRank"] = { v_u_2.hdAdminCoreName, "Successfully unranked %s!" }, 
		["BroadcastSuccessful"] = { v_u_2.hdAdminCoreName, "Broadcast successful! Your announcement will appear shortly." }, 
		["BroadcastFailed"] = { v_u_2.hdAdminCoreName, "Broadcast failed to send." }, 
		["InformPrefix"] = { v_u_2.hdAdminCoreName, "The server prefix is \'%s\'" }, 
		["GetSoundSuccess"] = { v_u_2.hdAdminCoreName, "The ID of the sound playing is: %s" }, 
		["GetSoundFail"] = { v_u_2.hdAdminCoreName, "No sound is playing!" }, 
		["UnderControl"] = { v_u_2.hdAdminCoreName, "You\'re being controlled by %s!" }, 
		["ClickToTeleport"] = { "Teleport", "Click to teleport to \'%s\' [%s]" }, 
		["BanSuccess"] = {
			v_u_2.hdAdminCoreName, 
			"Successfully banned %s! Click to view the Banland.", 
			{ "ShowSpecificPage", "Admin", "Banland" }
		}, 
		["UnBanSuccess"] = { v_u_2.hdAdminCoreName, "Successfully unbanned %s!" }, 
		["QualifierLimitToSelf"] = { v_u_2.hdAdminCoreName, "\'%ss\' can only use commands on theirself!" }, 
		["QualifierLimitToOnePerson"] = { v_u_2.hdAdminCoreName, "\'%ss\' can only use commands on one person at a time!" }, 
		["ScaleLimit"] = { v_u_2.hdAdminCoreName, "The ScaleLimit is %s for ranks below \'%s\'" }, 
		["RequestsLimit"] = { v_u_2.hdAdminCoreName, "You\'re sending requests too fast!" }, 
		["AlertFail"] = { v_u_2.hdAdminCoreName, "Alert failed to send." }, 
		["PollFail"] = { v_u_2.hdAdminCoreName, "Poll failed to send." }, 
		["GearBlacklist"] = { v_u_2.hdAdminCoreName, "Cannot insert gear: %s. This item has been blacklisted." }, 
		["BanFailLength"] = { v_u_2.hdAdminCoreName, "%sBan Length must be greater than 0!" }, 
		["BanFailVIPServer"] = { v_u_2.hdAdminCoreName, "%s\'permBan\' is prohibited on VIP Servers!" }, 
		["BanFailAllServers"] = { v_u_2.hdAdminCoreName, "You do not have permission to ban players from \'all servers\'." }, 
		["BanFailAlreadyBanned"] = { v_u_2.hdAdminCoreName, "%splayer has already been banned!" }, 
		["BanFailPermission"] = { v_u_2.hdAdminCoreName, "You do not have permission to ban %s" }, 
		["BanFailDataNotFound"] = { v_u_2.hdAdminCoreName, "%sData not found." }, 
		["RestoreDefaultSettings"] = { "Settings", "Successfully restored all settings to default!" }, 
		["CommandBarLocked"] = { v_u_2.hdAdminCoreName, "You do not have permission to use the commandBar%s! Rank required: \'%s\'" }, 
		["FollowFail"] = { v_u_2.hdAdminCoreName, "Failed to teleport. %s is not in-game." }, 
		["SaveMap1"] = { v_u_2.hdAdminCoreName, "Saving a copy of the map..." }, 
		["SaveMap2"] = { v_u_2.hdAdminCoreName, "Map successfully saved!" }, 
		["CommandLimit"] = { v_u_2.hdAdminCoreName, "The %s limit is %s for ranks below \'%s\'" }, 
		["CommandLimitPerMinute"] = { v_u_2.hdAdminCoreName, "Sending commands too fast! CommandLimitPerMinute exceeded." }, 
		["template"] = { v_u_2.hdAdminCoreName, "" }
	})[p3]
end
return v1
