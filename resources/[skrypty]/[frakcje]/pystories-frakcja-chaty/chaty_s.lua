--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

function globalMessage(plr, cmd, ...)
	local frakcja=getElementData(plr,'player:faction')
	if not frakcja then
		return
	end
	local msg = table.concat ( { ... }, " " )
	local admins=getElementsByType('player')
	for i,v in pairs(admins) do
	local pfrakcje=getElementData(v,'player:faction')
		if frakcja == pfrakcje then
			outputChatBox("KRÓTKOFALÓWKA> ["..getElementData(plr,"id").."] "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","")..": "..msg, v, 255, 64, 74, false)
		end
	end
		local desc = "[KRÓTKOFALÓWKA] ["..getElementData(plr,"id").."] "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").."("..getElementData(plr,"player:faction").."): "..msg:gsub("#%x%x%x%x%x%x","")..""
		triggerEvent("admin:addText", resourceRoot, desc:gsub("#%x%x%x%x%x%x",""))
		outputServerLog(desc)
end
addCommandHandler("Krótkofalówka", globalMessage)


function globalMessage(plr, cmd, ...)
	local frakcja=getElementData(plr,'player:faction')
	if not frakcja then
		return
	end
	local msg = table.concat ( { ... }, " " )
	local admins=getElementsByType('player')
	for i,v in pairs(admins) do
	local pfrakcje=getElementData(v,'player:faction')
		if pfrakcje and pfrakcje ~= false then
			outputChatBox("SŁUŻBY> ["..getElementData(plr,"id").."] "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").."("..getElementData(plr,"player:faction").."): "..msg, v, 0, 255, 50, false)
		end
	end
		local desc = "[SŁUZBY] ["..getElementData(plr,"id").."] "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").."("..getElementData(plr,"player:faction").."): "..msg:gsub("#%x%x%x%x%x%x","")..""
		triggerEvent("admin:addText", resourceRoot, desc:gsub("#%x%x%x%x%x%x",""))
		outputServerLog(desc)
end
addCommandHandler("Służby", globalMessage)

addEventHandler("onResourceStart", root, function() 
local players=getElementsByType('player')
for _, p in pairs(players) do
bindKey(p, "y", "down", "chatbox", "Krótkofalówka")
bindKey(p, "u", "down", "chatbox", "Służby")
end
end)

addEventHandler( "onPlayerSpawn", getRootElement(),
    function (_)
	bindKey(source, "y", "down", "chatbox", "Krótkofalówka")
	bindKey(source, "u", "down", "chatbox", "Służby")
    end
)






