--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local settings = {
['swearFilter'] = {
	['enabled'] = true,
	['swears'] = { -- Allows you to set the blocked swear words, syntax is ['WORD'] = 'REPLACEMENT'
		['kurwa'] = '****',
		['cwel'] = '****',
		['kurwą'] = '****',
		['c w e l'] = '****',
		['k u r w a'] = '****',
		['cwelem'] = '******',
		['c w e l e m'] = '****',
		['k u r w ą'] = '****',
		['szmata'] = '****',
		['dziwka'] = '****',
		['japierdole'] = '****',
		['jajebie'] = '****',
		['jebie'] = '****',
		['jebany'] = '****',
		['jeban'] = '****',
		['kurwo'] = '****',
		['frajer'] = '****',
		['frajerze'] = '****',
		['pierdolona'] = '****',
		['ja pierdole'] = '****',
		['pierdol'] = '****',
		['pierdolenie'] = '****',
		['chuj'] = '****',
		['szmato'] = '****',
		['dziwko'] = '****',
		['pedał'] = '****',
		['pedal'] = '****',
		['pedały'] = '****',
		['frjerzy'] = '****',
		['frajerka'] = '****',
		['pizda'] = '****',
		['pizdy'] = '****',
		['pizdochlap'] = '****',
		['spierdalaj'] = '****',
		['suka'] = '****',
		['sukinsyn'] = '****',
		['wyjebie'] = '****',
		['wyjebane'] = '****',
		['wypierdalaj'] = '****',
		['chuju'] = '****',
		['chuje'] = '****',
		['kórwa'] = '****',
		['kórva'] = '****',
		['kurva'] = '****',
		['skurwielu'] = '****',
		['sukinsyn'] = '****',
		['zjebany'] = '****',
		['zjebane'] = '****',
		['zjebani'] = '****',
		['wypierdalajcie'] = '****',
		['wkurwia'] = '****',
		['wkurwiacie'] = '****',
		['wkurwiajcie'] = '****',
		['wkórwiajcie'] = '****',
		['fkórwiajcie'] = '****',
		['fkurwiajcie'] = '****',
		['wkórwiacie'] = '****',
		['wkórwiony'] = '****',
		['wkurviony'] = '****',
		['wkórviony'] = '****',
		['jebne'] = '****',
		['jebany'] = '****',
		['jebana'] = '****',
		['jebnięty'] = '****',
		['zajebany'] = '****',
		['zjebusie'] = '****',
		['wykurwinator'] = '****',
		['wykurwiacie'] = '****',
		['wykurwiaj'] = '****',
		}
},
['antiSpamFilter'] = {
	['enabled'] = true,
	['execeptionGroups'] = 'Admin,Ghoul', -- Groups which can spam, eg. 'Admin,SuperModerator,Moderator'
	['chatTimeOut'] = 1.5 -- Set in seconds.
},
}

local spam = { }

local wiadomosci = { }

local words = {"22003",":220","78.157","23.235","22015","22010","22020","22017","mtasa://"}

local stopChat = false

addEventHandler('onPlayerChat', root, function(msg, type)
	cancelEvent()
	if stopChat then
	cancelEvent()
	outputChatBox('* Chat jest aktualnie wyłączony.', source, 255, 0, 0, true)
	return end
	if not getElementData(source,"player:sid") then
	outputChatBox("* Musisz być zalogowany(a) !", source)
	return end
	--[[if settings['swearFilter']['enabled'] then
		for i, v in pairs(settings['swearFilter']['swears']) do
			while msg:lower():find(i:lower(),1,true) do
				local start, end_ = msg:lower():find(i:lower(),1,true)
				local found = msg:sub(start,end_)
				msg = msg:gsub(found,v)
			end
		end
	end--]]
	local tick=getTickCount()
	if type==0 then
		cancelEvent()
		--[[if ninjaban(msg) then
		cancelEvent()
		triggerClientEvent(root, "admin:rendering", root, "* "..getPlayerName(source):gsub("#%x%x%x%x%x%x","").."("..getElementData(source,"id")..") został(a) wyrzucony(a) przez ANTY-REKLAMA")
		kickPlayer (source, "ANTY-REKLAMA")
		return end--]]
		if ninjaban(msg) then
		cancelEvent()
		--kickPlayer (plr, "ANTY-REKLAMA")
		kickPlayer(plr, "Anty-Reklama")
		triggerClientEvent(root, "admin:rendering", root, "* ["..getElementData(plr,"id").."]"..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." został(a) wyrzucony(a) przez System, powód: Reklama")
		return end
		if not isElement(source) then return end
		local x,y,z=getElementPosition(source)
		local sphere=createColSphere(x,y,z, 30)
		local players=getElementsWithinColShape(sphere, 'player')
		if getElementData(source, "mute:player") then
			outputChatBox("* Jesteś wyciszony!", source)
			return
		end
		for i,v in pairs(players) do
			local id=getElementData(source,"id")
			local level = tonumber(getElementData(source, "player:level"))
			local p_level = tonumber(getElementData(source, "premium:level"))
			if not level and not p_level then
			outputChatBox("#FFFFFF[#FFFFFF"..getElementData(source,"id").."#FFFFFF] #FFFFFF"..getPlayerName(source):gsub("#%x%x%x%x%x%x","")..":#FFFFFF "..msg:gsub("#%x%x%x%x%x%x",""), v, _, _, _, true)
			elseif level == 1 then
			cancelEvent()
			outputChatBox("#FFFFFF[#01bf34"..getElementData(source,"id").."#FFFFFF] #FFFFFF"..getPlayerName(source):gsub("#%x%x%x%x%x%x","")..":#FFFFFF "..msg:gsub("#%x%x%x%x%x%x",""), v, _, _, _, true)
			elseif level == 2 then
			cancelEvent()
			outputChatBox("#FFFFFF[#ff0000"..getElementData(source,"id").."#FFFFFF] #FFFFFF"..getPlayerName(source):gsub("#%x%x%x%x%x%x","")..":#FFFFFF "..msg:gsub("#%x%x%x%x%x%x",""), v, _, _, _, true)
			elseif level == 3 then
			cancelEvent()
			outputChatBox("#FFFFFF[#a31303"..getElementData(source,"id").."#FFFFFF] #FFFFFF"..getPlayerName(source):gsub("#%x%x%x%x%x%x","")..":#FFFFFF "..msg:gsub("#%x%x%x%x%x%x",""), v, _, _, _, true)
			elseif level == 4 then
			cancelEvent()
			outputChatBox("#FFFFFF[#8F00FF"..getElementData(source,"id").."#FFFFFF] #FFFFFF"..getPlayerName(source):gsub("#%x%x%x%x%x%x","")..":#FFFFFF "..msg:gsub("#%x%x%x%x%x%x",""), v, _, _, _, true)
			elseif p_level == 1 then
			cancelEvent()
			outputChatBox("#FFFFFF[#C0FF00"..getElementData(source,"id").."#FFFFFF] #FFFFFF"..getPlayerName(source):gsub("#%x%x%x%x%x%x","")..":#FFFFFF "..msg:gsub("#%x%x%x%x%x%x",""), v, _, _, _, true)
		end
		end
		destroyElement(sphere)
		
		local desc = string.format("[LOCAL] [%d]%s: %s",getElementData(source,"id"),getPlayerName(source):gsub("#%x%x%x%x%x%x",""),msg:gsub("#%x%x%x%x%x%x",""))
		triggerClientEvent(root, "onDebugMessage", resourceRoot, desc:gsub("#%x%x%x%x%x%x",""),1, "CZAT")
		triggerEvent("admin:addText", resourceRoot, desc:gsub("#%x%x%x%x%x%x",""))
		outputServerLog(desc)
		--zapiszlog2("[LOCAL] "..getPlayerName(source)..": "..msg.."")
		triggerClientEvent("onChatbubblesMessageIncome",source,msg:gsub("#%x%x%x%x%x%x",""),0)
	elseif type==1 then
		cancelEvent()
		if ninjaban(msg) then
		cancelEvent()
		triggerClientEvent(root, "admin:rendering", root, "* "..getPlayerName(source):gsub("#%x%x%x%x%x%x","").."("..getElementData(source,"id")..") został(a) wyrzucony(a) przez ANTY-REKLAMA")
		kickPlayer (source, "ANTY-REKLAMA")
		return end
		local x,y,z=getElementPosition(source)
		local sphere=createColSphere(x,y,z, 30)
		local players=getElementsWithinColShape(sphere, 'player')
		destroyElement(sphere)
		for i,v in pairs(players) do
			outputChatBox("** "..getPlayerName(source):gsub("#%x%x%x%x%x%x","").." "..msg:gsub("#%x%x%x%x%x%x",""), v, 255, 128, 255)
		end
		local q = string.format("[ME] ["..getElementData(source,"id").."]"..getPlayerName(source)..": "..msg:gsub("#%x%x%x%x%x%x",""))
		triggerEvent("admin:addText", resourceRoot, q:gsub("#%x%x%x%x%x%x",""))
		triggerClientEvent("onDebugMessage", resourceRoot, q,1, "/ME")
		outputServerLog(q)
	end
end)

addCommandHandler('do', function(source, cmd, ...)
	local text=table.concat({...}, ' ')
	if not text then return end
		if ninjaban(msg) then
		cancelEvent()
		triggerClientEvent(root, "admin:rendering", root, "* "..getPlayerName(source):gsub("#%x%x%x%x%x%x","").."("..getElementData(source,"id")..") został(a) wyrzucony(a) przez ANTY-REKLAMA")
		kickPlayer (source, "ANTY-REKLAMA")
		return end
	local msg=table.concat({...}, " ")
	local x,y,z=getElementPosition(source)
	local sphere=createColSphere(x,y,z, 30)
	local players=getElementsWithinColShape(sphere, 'player')
	destroyElement(sphere)

	for i,v in ipairs(players) do
		outputChatBox("** "..msg.." (( "..getPlayerName(source):gsub("#%x%x%x%x%x%x","").." )) **", v, 0, 160, 255)
	end
	triggerClientEvent("onDebugMessage", resourceRoot, "* "..getPlayerName(source):gsub("#%x%x%x%x%x%x","").."(("..msg.."))",1, "/ME")
	triggerEvent("admin:addText", resourceRoot, "[DO] "..getPlayerName(source):gsub("#%x%x%x%x%x%x","").." (("..msg.."))",math.random(0,99))
	outputServerLog("[DO] "..getPlayerName(source):gsub("#%x%x%x%x%x%x","").." (("..msg.."))",math.random(0,99))
end)

addCommandHandler('vmoje', function(plr, cmd)
	local sid=getElementData(plr,'player:sid')
	if not sid then return end
	outputChatBox('* Twoje pojazdy (zrespione na mapie): ', plr)
	outputChatBox('====================================', plr)

	local vehicles=getElementsByType('vehicle')
	for i,v in pairs(vehicles) do
		if getElementData(v,'vehicle:ownedPlayer') and getElementData(v,'vehicle:ownedPlayer')==sid then
			outputChatBox("* Nazwa: "..getVehicleNameFromModel(getElementModel(v))..", ID: "..getElementData(v,"vehicle:id"), plr)
		end
	end
end)


function ninjaban(ip)
    -- must pass in a string value
    if ip == nil or type(ip) ~= "string" then
        return false
    end

    -- check for format 1.11.111.111 for ipv4
    local chunks = {ip:match("(%d+)%.(%d+)%.(%d+)%.(%d+)")}
    if (#chunks == 4) then
        for _,v in pairs(chunks) do
            if (tonumber(v) < 0 or tonumber(v) > 255) then
                return false
			else
			return true
			end
        end
    else
        return false
    end

    return false
end

function RGBToHex(red, green, blue, alpha)
		return string.format("#%.2X%.2X%.2X", red,green,blue)
end