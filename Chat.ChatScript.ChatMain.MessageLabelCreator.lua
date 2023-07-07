-- decompiled by Sentinel (took 2.351685ms)
local v1 = {}
local v_u_2 = game:GetService("Chat")
local v3 = v_u_2:WaitForChild("ClientChatModules")
local v_u_4 = v3:WaitForChild("MessageCreatorModules")
local v_u_5 = require(v_u_4:WaitForChild("Util"))
local v6 = script.Parent
require(v3:WaitForChild("ChatSettings"))
local v_u_7 = require(v6:WaitForChild("ObjectPool"))
require(v6:WaitForChild("MessageSender"))
local v_u_8 = {}
v_u_8.__index = v_u_8
function mergeProps(p9, p10)
	if p9 then
		for v11, v12 in pairs(p9) do
			p10[v11] = v12
		end
	end
end
function ReturnToObjectPoolRecursive(p13, p14)
	local v15 = p13:GetChildren()
	for v16 = 1, #v15 do
		ReturnToObjectPoolRecursive(v15[v16], p14)
	end
	p13.Parent = nil
	p14:ReturnInstance(p13)
end
function GetMessageCreators()
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v17 = {}
	local v18 = v_u_4:GetChildren()
	for v19 = 1, #v18 do
		if v18[v19]:IsA("ModuleScript") then
			if v18[v19].Name ~= "Util" then
				local v20 = require(v18[v19])
				v17[v20[v_u_5.KEY_MESSAGE_TYPE]] = v20[v_u_5.KEY_CREATOR_FUNCTION]
			end
		end
	end
	return v17
end
function v_u_8.WrapIntoMessageObject(p21, p22, p23)
	-- upvalues: (copy) v_u_5
	local v24 = p23[v_u_5.KEY_BASE_FRAME]
	local v25
	if v_u_5.KEY_BASE_MESSAGE then
		v25 = p23[v_u_5.KEY_BASE_MESSAGE]
	else
		v25 = nil
	end
	return {
		["ID"] = p22.ID, 
		["BaseFrame"] = v24, 
		["BaseMessage"] = v25, 
		["UpdateTextFunction"] = p23[v_u_5.KEY_UPDATE_TEXT_FUNC] or function()
			warn("NO MESSAGE RESIZE FUNCTION")
		end, 
		["GetHeightFunction"] = p23[v_u_5.KEY_GET_HEIGHT], 
		["FadeInFunction"] = p23[v_u_5.KEY_FADE_IN], 
		["FadeOutFunction"] = p23[v_u_5.KEY_FADE_OUT], 
		["UpdateAnimFunction"] = p23[v_u_5.KEY_UPDATE_ANIMATION], 
		["ObjectPool"] = p21.ObjectPool, 
		["Destroyed"] = false, 
		["Destroy"] = function(p26)
			ReturnToObjectPoolRecursive(p26.BaseFrame, p26.ObjectPool)
			p26.Destroyed = true
		end
	}
end
function v_u_8.CreateMessageLabel_Chat(p27, p_u_28, p29, p30)
	-- upvalues: (copy) v_u_2
	p_u_28.Channel = p29
	local v_u_31 = nil
	pcall(function()
		-- upvalues: (ref) v_u_31, (ref) v_u_2, (copy) p_u_28
		v_u_31 = v_u_2:InvokeChatCallback(Enum.ChatCallbackType.OnClientFormattingMessage, p_u_28)
	end)
	p_u_28.ExtraData = p_u_28.ExtraData or {}
	mergeProps(v_u_31, p_u_28.ExtraData)
	local v32 = p_u_28.MessageType
	if p27.MessageCreators[v32] then
		local v33 = p27.MessageCreators[v32](p_u_28, p29, p30)
		if v33 then
			return p27:WrapIntoMessageObject(p_u_28, v33)
		end
	elseif p27.DefaultCreatorType then
		local v34 = p27.MessageCreators[p27.DefaultCreatorType](p_u_28, p29, p30)
		if v34 then
			return p27:WrapIntoMessageObject(p_u_28, v34)
		end
	else
		error("No message creator available for message type: " .. v32)
	end
end
function v_u_8.CreateMessageLabel(p35, p_u_36, p37)
	-- upvalues: (copy) v_u_2
	p_u_36.Channel = p37
	local v_u_38 = nil
	pcall(function()
		-- upvalues: (ref) v_u_38, (ref) v_u_2, (copy) p_u_36
		v_u_38 = v_u_2:InvokeChatCallback(Enum.ChatCallbackType.OnClientFormattingMessage, p_u_36)
	end)
	p_u_36.ExtraData = p_u_36.ExtraData or {}
	mergeProps(v_u_38, p_u_36.ExtraData)
	local v39 = p_u_36.MessageType
	if p35.MessageCreators[v39] then
		local v40 = p35.MessageCreators[v39](p_u_36, p37)
		if v40 then
			return p35:WrapIntoMessageObject(p_u_36, v40)
		end
	elseif p35.DefaultCreatorType then
		local v41 = p35.MessageCreators[p35.DefaultCreatorType](p_u_36, p37)
		if v41 then
			return p35:WrapIntoMessageObject(p_u_36, v41)
		end
	else
		error("No message creator available for message type: " .. v39)
	end
end
function v1.new()
	-- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_5
	local v42 = setmetatable({}, v_u_8)
	v42.ObjectPool = v_u_7.new(50)
	v42.MessageCreators = GetMessageCreators()
	v42.DefaultCreatorType = v_u_5.DEFAULT_MESSAGE_CREATOR
	v_u_5:RegisterObjectPool(v42.ObjectPool)
	return v42
end
function v1.GetStringTextBounds(_, p43, p44, p45, p46)
	-- upvalues: (copy) v_u_5
	return v_u_5:GetStringTextBounds(p43, p44, p45, p46)
end
return v1
