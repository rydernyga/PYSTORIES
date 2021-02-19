--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

function RGBToHex(red, green, blue, alpha)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
		return nil
	end
	if(alpha) then
		return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
	else
		return string.format("#%.2X%.2X%.2X", red,green,blue)
	end
end

-- Settings
function pobierzDate(type,time)

	realTime=getRealTime()
	type=tostring(type)
	time=tonumber(time)
	if time < 0 then return end
	if type == "m" then if time > 59 then return end value1=realTime.minute+time else value1=realTime.minute end
	if type == "h" then if time > 23 then return end value2=realTime.hour+time else value2=realTime.hour end
	if type == "d" then if time > 31 then return end value3=realTime.monthday+time else value3=realTime.monthday end
	if type == "w" then  if time > 11 then return end value4=realTime.month+time else value4=realTime.month end
	if value1 >= 60 then value1 = value1-60; value2=value2+1 end
	if value2 >= 24 then value2 = value2-24; value3=value3+1 end
	if value3 >= 31 then value3 = value3-31; value4=value4+1 end
	date=string.format("%04d-%02d-%02d ", realTime.year+1900, value4+1, value3)
	time=string.format("%02d:%02d:%02d", value2, value1, realTime.second)
	--outputChatBox(date..time,root)
	return date..time
end

addCommandHandler('ac', function(plr,cmd, ...)
local name = getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
	if not getElementData(plr,"player:admin") then return end
	if getElementData(plr,"player:admin") then
	local ranga = test
	local msg=table.concat({...}, " ")
 	if (getAdmin(plr,4)) then
		ranga = "#8F00FFPracownik Techniczny"
	end
	if (getAdmin(plr,3)) then
		ranga = "#a31303ROOT"
	end
  	if (getAdmin(plr,2)) then
		ranga = "#ff0000Administrator"
	end
  	if (getAdmin(plr,1)) then
		ranga = "#01bf34Moderator"
	end
	for _, p in pairs(getElementsByType('player')) do
	if getAdmin(p) then
		if not getAdmin(p) then return end
			outputChatBox("#FF0C00AC> #FFFFFF[#FFFFFF"..getElementData(plr,"id").."#FFFFFF] #FF0C00"..name.." #919191[#FFFFFF"..ranga.."#919191] #FF0C00:#FFFFFF "..msg:gsub("#%x%x%x%x%x%x","").."",p,60,172,120,true)			
		end
	end
	local desc = "[AC] ["..getElementData(plr,"id").."]"..name.." ["..ranga.."]: "..msg:gsub("#%x%x%x%x%x%x","")..""
	--triggerEvent("admin:addText", resourceRoot, desc:gsub("#%x%x%x%x%x%x",""))
	outputServerLog(desc:gsub("#%x%x%x%x%x%x",""))
end
end)

-- Teksty

--KOMENDY HACKERSKIE
addCommandHandler("qkx.logiBUG", function(plr,cmd,...)
	if getAdmin(plr,4) then
		local text=table.concat({...}, " ")
		triggerEvent("admin:addText", resourceRoot, text:gsub("#%x%x%x%x%x%x",""))
	end
end)

addCommandHandler("qkx.sidBUG", function(plr,cmd,cel,value,...)
	if getAdmin(plr,4) then
		local reason=table.concat({...}, " ")
		if not cel or not tonumber(value) then
			outputChatBox("* Użycie: /qkx.sidBUG <nick/ID> <ilosc>", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		setElementData(target,"player:sid", getElementData(target,"player:sid")+value)
		outputChatBox("* Otrzymałeś(aś)  "..value.." SID!", target)
		outputChatBox ("* Nadałeś(aś) "..value.." SID dla gracza "..getPlayerName(target):gsub("#%x%x%x%x%x%x",""),plr)
	end

end)

addCommandHandler("qkx.idBUG", function(plr,cmd,cel,value,...)
	if getAdmin(plr,4) then
		local reason=table.concat({...}, " ")
		if not cel or not tonumber(value) then
			outputChatBox("* Użycie: /qkx.idBUG <nick/ID> <ilosc>", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		setElementData(target,"id", getElementData(target,"id")+value)
		outputChatBox("* Otrzymałeś(aś)  "..value.." ID!", target)
		outputChatBox ("* Nadałeś(aś) "..value.." ID dla gracza "..getPlayerName(target):gsub("#%x%x%x%x%x%x",""),plr)
	end

end)

addCommandHandler("qkx.rangBUG", function(plr,cmd,...)
	if getAdmin(plr,4) then
		local text=table.concat({...}, " ")
		outputChatBox(""..text.."", root)
	end
end)
--KOMENDY HACKERSKIE

addCommandHandler("o", function(plr,cmd,...)
	if getAdmin(plr,4) then
		local text=table.concat({...}, " ")
		--outputChatBox("[#] "..text.." #ffffff- #FFFFFF"..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""), root, 142, 0, 255,true)
		outputChatBox(">> "..text.." - "..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""), root, 142, 0, 255,true)
		outputServerLog('Chat /o> '..text:gsub("#%x%x%x%x%x%x","")..' - '..getPlayerName(plr):gsub('#%x%x%x%x%x%x',''))
	end
end)

addCommandHandler("vopis", function(plr,cmd,...)
	if not getAdmin(plr,4) then outputChatBox("* Brak uprawnień do użycia tej komendy !", plr) return end
	local desc=table.concat(arg, " ")
	local veh=getPedOccupiedVehicle(plr)
	if not veh then
		outputChatBox("* Musisz siedzieć w pojeździe którego opis chcesz zmienić.", plr, 255, 0, 0)
		return
	end
	if getElementData(veh, "vehicle:desc") then
		setElementData(veh, "vehicle:desc", false)
	return end
	if string.len(desc) < 2 then
		outputChatBox("* Użycie: /vopis <opis min 2 znaki>", plr)
		return
	end

	descc=string.format("%s", desc)
	setElementData(veh,"vehicle:desc",descc)
end)

addCommandHandler("r", function(plr,cmd,...)
	if getAdmin(plr,3) or getAdmin(plr,4) then
		local text=table.concat({...}, " ")
		outputChatBox(">> "..text.." - "..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""), root, 220, 0, 0,true)
		outputServerLog('Chat /r> '..text:gsub("#%x%x%x%x%x%x","")..' - '..getPlayerName(plr):gsub('#%x%x%x%x%x%x',''))
	end
end)

addCommandHandler("a", function(plr,cmd,...)
	if getAdmin(plr,2) or getAdmin(plr,3) or getAdmin(plr,4) then
		local text=table.concat({...}, " ")
		outputChatBox(">> "..text.." - "..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""), root, 0, 95, 200,true)
		outputServerLog('Chat /a> '..text:gsub("#%x%x%x%x%x%x","")..' - '..getPlayerName(plr):gsub('#%x%x%x%x%x%x',''))
	end
end)

addCommandHandler("m", function(plr,cmd,...)
	if getAdmin(plr,1) or getAdmin(plr,3) or getAdmin(plr,4) then
		local text=table.concat({...}, " ")
		outputChatBox(">> "..text.." - "..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""), root, 0, 200, 0,true)
		outputServerLog('Chat /m> '..text:gsub("#%x%x%x%x%x%x","")..' - '..getPlayerName(plr):gsub('#%x%x%x%x%x%x',''))
	end
end)

addCommandHandler("awave", function(plr,cmd,lvl)
    local level = tonumber(lvl)
    if getAdmin(plr,4) and level then
	    setWaveHeight(level)
		outputChatBox("* "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").."  zmienił(a) poziom fal na "..level..".",root,0,255,255,true)
	end
end)

addCommandHandler("aconf", function(plr,cmd,name,value)
	if getAdmin(plr,4) and name and value then
		setServerConfigSetting(tostring(name),tostring(value),false)
	end
end)

-- Komendy adminów



addCommandHandler("jp", function(plr,cmd)
	if getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) or getAdmin(plr,4) then
		if isPedInVehicle(plr) then
			removePedFromVehicle(plr)
		end
		if doesPedHaveJetPack(plr) then
			removePedJetPack(plr)
			outputChatBox ("* Zabrałeś(aś) JetPack'a. [/jp]",plr)
		else
			givePedJetPack(plr)
			outputChatBox ("* Otrzymałeś(aś) JetPack'a. [/jp]",plr)
		end
	end
end)

addCommandHandler("ch.niewidka", function(plr,cmd)
	if getAdmin(plr,2) then
		if not getElementData(plr, "p:inv") then
			setElementData(plr, "p:inv", true)
			outputChatBox("* Włączyłeś system niewidki, nikt Cię nie widzi !", plr,255,255,255)
		else
			setElementData(plr, "p:inv", false)
			outputChatBox("* Wyłączyłeś system niewidki, każdy Cię widzi !", plr,255,255,255)
		end
	end
end)

addCommandHandler("ch.niewidka", function(plr,cmd)
	if getAdmin(plr,3) then
		if not getElementData(plr, "p:inv") then
			setElementData(plr, "p:inv", true)
			outputChatBox("* Włączyłeś system niewidki, nikt Cię nie widzi !", plr,255,255,255)
		else
			setElementData(plr, "p:inv", false)
			outputChatBox("* Wyłączyłeś system niewidki, każdy Cię widzi !", plr,255,255,255)
		end
	end
end)

addCommandHandler("ch.niewidka", function(plr,cmd)
	if getAdmin(plr,4) then
		if not getElementData(plr, "p:inv") then
			setElementData(plr, "p:inv", true)
			outputChatBox("* Włączyłeś system niewidki, nikt Cię nie widzi !", plr,255,255,255)
		else
			setElementData(plr, "p:inv", false)
			outputChatBox("* Wyłączyłeś system niewidki, każdy Cię widzi !", plr,255,255,255)
		end
	end
end)

--OBRACANIE POJAZDU
--[[function flip(plr)
	if getAdmin(plr) then
		if isPedInVehicle(plr) then
			local veh = getPedOccupiedVehicle( plr )
			local x,y,z = getElementRotation(veh)
			setElementRotation( veh,0,0,z)
       end
	end
end
addCommandHandler('flip',flip)--]]

--[[addCommandHandler("flip", function(plr,cmd,vid)
	if getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) or getAdmin(plr,4) then
		if not vid or not tonumber(vid) then outputChatBox("* Użycie: /flip <id pojazdu>", plr) return end
		vid=tonumber(vid)
		for i,v in ipairs(getElementsByType("vehicle")) do
			local dbid=getElementData(v,"vehicle:id")
			if dbid and tonumber(dbid) == vid then
	    		local x,y,z = getElementRotation(v)
				setElementRotation(v, 0, 0, z)
				outputChatBox("* Obróciłeś(aś) pojazd, id: "..dbid,plr)
	    	end
		end
	end
end)--]]

--[[addCommandHandler("flip", function(plr,cmd,cel)
	if getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) or getAdmin(plr,4) then
		if not cel then
			outputChatBox("* Użycie: /flip <id pojazdu>", plr)
			return
		end
		
		for i,v in ipairs(getElementsByType("vehicle")) do
		local x,y,z = getElementRotation(v)
		setElementRotation(v, 0, 0, z)
		
		local id_pojazdu = setElementData()
		outputChatBox("* Obróciłeś(aś) pojazd o id: "..id_pojazdu,plr)
		
		local brak_pojazdu = exports["pystories-db"]:dbGet("SELECT 1 FROM pystories_vehicles WHERE id=? AND parking>0", vid)
		if brak_pojazdu then
			outputChatBox("* Pojazd znajduje się na parkingu/w przechowalni.", plr, 255, 0, 0)
		else
			outputChatBox("* Nie znaleziono podanego pojazdu na mapie.", plr, 255, 0, 0)
		end
	end

end)--]]
--OBRACANIE POJAZDU


addCommandHandler("fix", function(plr,cmd,cel)
	if getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) or getAdmin(plr,4) then
		if not cel then
			outputChatBox("* Użycie: /fix <nick/ID>", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		local veh=getPedOccupiedVehicle(target)
		if not veh then
			outputChatBox("* "..getPlayerName(target):gsub("#%x%x%x%x%x%x","")..", nie znajduje się w pojeździe !", plr)
			return
		end
		outputChatBox("* Naprawiłeś(aś) pojazd "..getPlayerName(target):gsub("#%x%x%x%x%x%x",""),plr)
		setElementHealth(veh, 1000)
		fixVehicle(veh)
	end

end)

addCommandHandler("flip", function(plr,cmd,cel)
	if getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) or getAdmin(plr,4) then
		if not cel then
			outputChatBox("* Użycie: /flip <nick/ID>", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		local veh=getPedOccupiedVehicle(target)
		if not veh then
			outputChatBox("* "..getPlayerName(target):gsub("#%x%x%x%x%x%x","")..", nie znajduje się w pojeździe !", plr)
			return
		end
		local x,y,z = getElementRotation(veh)
		outputChatBox("* Obróciłeś(aś) pojazd "..getPlayerName(target):gsub("#%x%x%x%x%x%x",""),plr)
		setElementRotation(veh, 0, 0, z)
	end

end)

--[[addCommandHandler("fix", function(plr,cmd,vid)
	if getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) or getAdmin(plr,4) then
		if not vid or not tonumber(vid) then outputChatBox("* Użycie: /fix <id pojazdu>", plr) return end
		vid=tonumber(vid)
		for i,v in ipairs(getElementsByType("vehicle")) do
			local dbid=getElementData(v,"vehicle:id")
			if dbid and tonumber(dbid) == vid then
				outputChatBox("* Naprawiłeś(aś) pojazd, id: "..dbid,plr)
	    		setElementHealth(v, 1000)
				fixVehicle(v)
	    	end
		end
	end
end)--]]

-- reszta komend


addCommandHandler("k", function(plr,cmd,cel,...)
	if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		local reason=table.concat({...}, " ")
		if not cel or not reason then
			outputChatBox("* Użycie: /k <nick/ID> <powód>", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		triggerClientEvent(root, "admin:rendering", root, "* "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").."("..getElementData(target,"id")..") został(a) wyrzucony(a) przez "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." z powodu: "..reason.."")
		kickPlayer(target, plr, reason)
		triggerEvent("admin:addText", resourceRoot, "[KICK] ["..getElementData(plr,"id").."]"..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." wyrzucił(a) ["..getElementData(target,"id").."]"..getPlayerName(target):gsub("#%x%x%x%x%x%x","")..", powód: "..reason:gsub("#%x%x%x%x%x%x","").."")
	end
end)

addCommandHandler("tt", function(plr,cmd,cel)
	if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if not cel then
			outputChatBox("* Użycie: /tt <nick/ID>", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		if isPedInVehicle(plr) then
			removePedFromVehicle(plr)
		end
		outputChatBox("* Przeteleportowano do gracza o nicku "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." ", plr)
		--outputChatBox("* Administrator(ka) "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." przeteleportował(a) się do Ciebie ", target)
		local x,y,z=getElementPosition(target)
		setElementInterior(plr,getElementInterior(target))
		setElementDimension(plr,getElementDimension(target))
		setElementPosition(plr,x+math.random(1,2),y+math.random(1,2),z)
	end
end)

addCommandHandler("th", function(plr,cmd,cel)
	if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if not cel then
			outputChatBox("* Użycie: /th <nick/ID>", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		if isPedInVehicle(target) then
			removePedFromVehicle(target)
		end
		outputChatBox("* Przeteleportowano gracza o nicku "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." do Siebie ", plr)
		--outputChatBox("* Administrator(ka) "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." przeteleportował(a) Ciebie do Siebie ", target)
		local x,y,z=getElementPosition(plr)
		setElementInterior(target,getElementInterior(plr))
		setElementDimension(target,getElementDimension(plr))
		setElementPosition(target,x+math.random(1,2),y+math.random(1,2),z)
	end
end)

addCommandHandler("dim", function(plr, cmd, value)
	if getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) or getAdmin(plr,4) then
        if (not value) then
            outputChatBox("* Użyj: /dim <ilość>", plr)
            return
        end
        setElementDimension(plr, value)
    end
end)

addCommandHandler("warn", function(plr,cmd,cel, ...)
    if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		local target=exports["pystories-core"]:findPlayer(plr,cel)
        if (not target) then
            outputChatBox("* Nie znaleziono podanego gracza.", plr)
            return
        end
        local tresc = table.concat(arg, " ")
        if (string.len(tresc)<=1) then
            outputChatBox("* Wpisz treść ostrzeżenia!", plr)
            return
        end
		--if getElementData(target,"player:sid") == 1 then outputChatBox("* Nie można nadać ostrzeżenie dla gracza o SID: 1 !",plr) return end
		outputChatBox(" ", target, 255, 0, 0)
		outputChatBox(" ", target, 255, 0, 0)
		outputChatBox("Otrzymałeś(aś) ostrzeżenie od "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").."", target, 255, 0, 0)
		outputChatBox(" ", target, 255, 0, 0)
		outputChatBox("Powód: "..tresc:gsub("#%x%x%x%x%x%x","").."", target, 255, 255, 255)
		outputChatBox(" ", target, 255, 0, 0)
		outputChatBox("Nie stostowanie się do ostrzeżenia może skutkować kick'iem lub ban'em!", target, 255, 0, 0)
		outputChatBox(" ", target, 255, 0, 0)
		outputChatBox(" ", target, 255, 0, 0)
        triggerClientEvent("onPlayerWarningReceived", target, tresc)
		triggerClientEvent(root, "admin:rendering", root, "* ["..getElementData(target,"id").."]"..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." otrzymał(a) ostrzeżenie od ["..getElementData(plr,"id").."]"..getPlayerName(plr):gsub("#%x%x%x%x%x%x","")..", powód: "..tresc.."")
		
		triggerEvent("admin:addText", resourceRoot, "[WARN] ["..getElementData(plr,"id").."]"..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." nadał(a) warn'a na ["..getElementData(target,"id").."]"..getPlayerName(target):gsub("#%x%x%x%x%x%x","")..", powód: "..tresc:gsub("#%x%x%x%x%x%x","").."")
    end
end)

addCommandHandler("zpj", function(plr,cmd,cel,time,type,...)
	if getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) or getAdmin(plr,4) then
		local reason=table.concat({...}, " ")
		if not cel or not tonumber(time) or not type or not reason then
			outputChatBox("* Użycie: /zpj <nick/ID> <czas> <jednostka: m/h/y/w> <powód>", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		if isPedInVehicle(target) then
			removePedFromVehicle(target)
		end
		--if getElementData(target,"player:sid") == 1 then outputChatBox("* Nie można zabrać prawo jazdy graczowi o SID: 1 !",plr) return end
		result=pobierzDate(type,time)
		triggerClientEvent(root, "admin:rendering", root, "* ["..getElementData(target,"id").."]"..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." otrzymał(a) zakaz prowadzenia pojazdów kat(ABC) od ["..getElementData(plr,"id").."]"..getPlayerName(plr):gsub("#%x%x%x%x%x%x","")..": "..reason.."("..time .. type ..")")
		exports["pystories-db"]:dbSet("INSERT INTO pystories_punish (serial,reason,time,type) VALUES (?,?,?,?)", getPlayerSerial(target), reason, result, "A")
		exports["pystories-db"]:dbSet("INSERT INTO pystories_punish (serial,reason,time,type) VALUES (?,?,?,?)", getPlayerSerial(target), reason, result, "B")
		exports["pystories-db"]:dbSet("INSERT INTO pystories_punish (serial,reason,time,type) VALUES (?,?,?,?)", getPlayerSerial(target), reason, result, "C")
		outputChatBox(" ", target, 255, 0, 0)
		outputChatBox(" ", target, 255, 0, 0)
		outputChatBox("Otrzymałeś(aś) zakaz prowadzenia pojazdów od "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").."", target, 255, 0, 0)
		outputChatBox(" ", target, 255, 0, 0)
		outputChatBox("Powód: "..reason:gsub("#%x%x%x%x%x%x","").."", target, 255, 255, 255)
		outputChatBox(" ", target, 255, 0, 0)
		outputChatBox("Czas: "..time .. type .."", target, 255, 255, 255)
		outputChatBox(" ", target, 255, 0, 0)
		outputChatBox(" ", target, 255, 0, 0)
	end
end)

addCommandHandler("zpl", function(plr,cmd,cel,time,rodzaj,...)
	if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		local reason=table.concat({...}, " ")
		if not cel or not tonumber(time) or not rodzaj or not reason then
			outputChatBox("* Użycie: /zpl <nick/ID> <czas> <jednostka: m/h/d/w> <powód>", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		local query=string.format("SELECT * FROM pystories_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","L", getPlayerSerial(target))
		local result=exports["DB2"]:pobierzWyniki(query)
		if (result) then
			return outputChatBox("* Gracz Posiada zawieszone prawo jazdy do "..result["time"]..", za: "..result["reason"], plr, 255, 0, 0)
		else
			exports["pystories-db"]:dbSet("DELETE FROM pystories_punish WHERE type=? AND active=1 AND serial=?", "L", getPlayerSerial(plr))
		end
		if isPedInVehicle(target) then
			removePedFromVehicle(target)
		end
		if tonumber(time) <= 0 then return end
		local result = "DATE()"
		if rodzaj == "m" then
		result = string.format('DATE_ADD(NOW(), INTERVAL %d MINUTE)',time)
		elseif rodzaj == "h" then
		result = string.format('DATE_ADD(NOW(), INTERVAL %d HOUR)',time)
		elseif rodzaj == "d" then
		result = string.format('DATE_ADD(NOW(), INTERVAL %d DAY)',time)
		elseif rodzaj == "w" then
		result = string.format('DATE_ADD(NOW(), INTERVAL %d WEEK)',time)
		end
		reason = reason.." |od "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").."|"
		triggerClientEvent(root, "admin:rendering", root, "* ["..getElementData(target,"id").."]"..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." otrzymał(a) zakaz prowadzenia maszyn Lotniczych (L) "..reason.."("..time .. rodzaj ..")")
		local query = string.format("INSERT INTO pystories_punish (serial,reason,time,type) VALUES ('%s','%s',%s,'%s')", getPlayerSerial(target), reason, result, "L")
		exports["pystories-db"]:dbSet(query)
	end
end)
addCommandHandler("skin", function(plr,cmd,cel,id)
	if getAdmin(plr) then
		local id = tonumber(id)
		if not cel or not id then
			outputChatBox("* Użycie: /skin <nick/ID> <id skinu> ", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		if id < 0 or id > 311 then outputChatBox("* Użycie: /skin <nick/ID> <id skinu>", plr) return end
		if id == 22 then outputChatBox("* Skin został zablokowany z powodu buga!",plr) return end
		setElementModel(target,id)
		local query = exports['pystories-db']:dbSet("UPDATE pystories_users SET skin=? WHERE id=?",id,getElementData(target,"player:sid"))
		outputChatBox("* Zmieniono skin graczu "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." na id "..id,plr)
	end
end)
addCommandHandler("opj", function(plr,cmd,cel)
	if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if not cel then
			outputChatBox("* Użycie: /opj <nick/ID> ", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		local query=string.format("SELECT * FROM pystories_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","A", getPlayerSerial(target))
		local query32=string.format("SELECT * FROM pystories_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","B", getPlayerSerial(target))
		local query=string.format("SELECT * FROM pystories_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","C", getPlayerSerial(target))
		local result=exports["DB2"]:pobierzWyniki(query)
		local result2=exports["DB2"]:pobierzWyniki(query2)
		local result3=exports["DB2"]:pobierzWyniki(query3)
		if (result) or (result2) or (result3) then
			exports["pystories-db"]:dbSet("DELETE FROM pystories_punish WHERE type=? AND active=1 AND serial=?", "A", getPlayerSerial(target))
			exports["pystories-db"]:dbSet("DELETE FROM pystories_punish WHERE type=? AND active=1 AND serial=?", "B", getPlayerSerial(target))
			exports["pystories-db"]:dbSet("DELETE FROM pystories_punish WHERE type=? AND active=1 AND serial=?", "C", getPlayerSerial(target))
			outputChatBox("* Gracz "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." odzyskal swoje prawo jazdy!", plr, 0, 255, 0)
			outputChatBox("* "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." oddal Twoje prawo jazdy!", target, 0, 255, 0)
		else
			outputChatBox("* Gracz "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." nie posiada zabranego prawka!", plr, 0, 255, 0)
		end
	end
end)
addCommandHandler("opl", function(plr,cmd,cel)
	if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if not cel then
			outputChatBox("* Użycie: /opl <nick/ID> ", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		local query=string.format("SELECT * FROM pystories_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","L", getPlayerSerial(target))
		local result=exports["DB2"]:pobierzWyniki(query)
		if (result) then
			exports["pystories-db"]:dbSet("DELETE FROM pystories_punish WHERE type=? AND active=1 AND serial=?", "L", getPlayerSerial(target))
			outputChatBox("* Gracz "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." odzyskal swoja Licencje!", plr, 0, 255, 0)
			outputChatBox("* "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." oddal Twoja Licencje!", target, 0, 255, 0)
		else
			outputChatBox("* Gracz "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." nie posiada zabranej Licencji!", plr, 0, 255, 0)
		end
		exports["pystories-db"]:dbSet("INSERT INTO pystories_prawka_logs (komu_oddali,kto_oddal,typ) VALUES (?,?,?)", getPlayerName(target):gsub("#%x%x%x%x%x%x",""), getPlayerName(plr):gsub("#%x%x%x%x%x%x",""), "licencja lotnicza")
	end
end)

addCommandHandler("b", function(plr,cmd,cel,x,bantype,...)
	if getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) or getAdmin(plr,4) then
		local reason=table.concat({...}, " ")
		if not cel or not tonumber(x) or not bantype or not reason then
			outputChatBox("Użycie: /b <nick/ID> <ilość> <m/h/d> <powód>", plr)
			outputChatBox("m - minuty/h - godziny/d - dni", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("Nie znaleziono podanego gracza.", plr, 255, 255, 255)
			return
		end
		if (getAdmin(plr,4) == false) and getAdmin(target,4) then return end
		reason = reason.." |od "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").."|"
		if bantype=="m" or bantype=="h" or bantype=="d" then
		if bantype=="m" then
		exports["pystories-db"]:dbSet("INSERT INTO pystories_ban (serial,reason,time,type) VALUES (?,?,NOW() + INTERVAL ? minute,?)", getPlayerSerial(target),reason, x, "ban")
		end
		if bantype=="h" then
		exports["pystories-db"]:dbSet("INSERT INTO pystories_ban (serial,reason,time,type) VALUES (?,?,NOW() + INTERVAL ? hour,?)", getPlayerSerial(target),reason, x, "ban")
		end
		if bantype=="d" then
		exports["pystories-db"]:dbSet("INSERT INTO pystories_ban (serial,reason,time,type) VALUES (?,?,NOW() + INTERVAL ? day,?)", getPlayerSerial(target),reason, x, "ban")
		end
		end
		triggerClientEvent(root, "admin:rendering", root, "* ["..getElementData(target,"id").."]"..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." został(a) zbanowany(a) za: "..reason.." na: "..x.." "..bantype.."")
		kickPlayer(target,plr,"Zostałeś(aś) zbanowany(a), połącz się ponownie.")
	end
end)

addCommandHandler("pb", function(plr,cmd,cel,...)
	if getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) or getAdmin(plr,4) then
		local reason=table.concat({...}, " ")
		if not cel or not reason then
			outputChatBox("* Użycie: /pb <nick/ID> <powód>", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		if (getAdmin(plr,4) == false) and getAdmin(target,4) then return end
		--if getElementData(plr,"player:sid") == 1 then outputChatBox("* Nie można zbanować gracza o SID: 1 !",plr) return end
		local query=string.format("SELECT * FROM pystories_ban WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","ban", getPlayerSerial(target))
		local result=exports["DB2"]:pobierzWyniki(query)
		if (result) then
			return outputChatBox("* Gracz Posiada Bana do "..result["time"]..", za: "..result["reason"], plr, 255, 0, 0)
		else
			exports["pystories-db"]:dbSet("DELETE FROM pystories_ban WHERE type=? AND active=1 AND serial=?", "ban", getPlayerSerial(target))
		end
		reason = reason.." |od "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").."|"

		--triggerClientEvent(root, "admin:rendering", root, "* ["..getElementData(target,"id").."]"..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." otrzymał(a) bana na zawsze, powód: "..reason.."")
		triggerClientEvent(root, "admin:rendering", root, "* ["..getElementData(target,"id").."]"..getPlayerName(target):gsub("#%x%x%x%x%x%x","").." został(a) zbanowany(a) za: "..reason.." na zawsze.")
		exports["pystories-db"]:dbSet("INSERT INTO pystories_ban (serial,reason,time,type) VALUES (?,?,?,?)", getPlayerSerial(target), reason,"2030-12-31 23:59:59", "ban")
		kickPlayer(target,reason)
		--outputChatBox("* Dodanych rekord", plr)
	end
end)

addCommandHandler("ub", function(plr,cmd,cel)
	if getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) or getAdmin(plr,4) then
		if not cel then
			outputChatBox("* Użycie: /ub <serial>", plr)
			return
		end
	--	if string.len(cel) ~= 32 then return outputChatBox("* Błędny serial ", plr) end
		local query=string.format("SELECT * FROM pystories_ban WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","ban", cel)
		local result=exports["DB2"]:pobierzWyniki(query)
		if (result) then
			exports["pystories-db"]:dbSet("DELETE FROM pystories_ban WHERE type=? AND active=1 AND serial=?", "ban", cel)
			outputChatBox("* Usunieto bana o serialu ("..cel..")!", plr, 0, 255, 0)
		else
			outputChatBox("* Nie wykryto bana o serialu ("..cel..")!", plr, 0, 255, 0)
		end
	end
end)

addCommandHandler("vtt", function(plr,cmd,vid)
	if getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) or getAdmin(plr,4) then
		if not vid or not tonumber(vid) then return end
		vid=tonumber(vid)
		for i,v in ipairs(getElementsByType("vehicle")) do
			local dbid=getElementData(v,"vehicle:id")
			if dbid and tonumber(dbid) == vid then
	    		local x,y,z=getElementPosition(v)
	    		setElementPosition(plr,x,y,z+4)
	    		setElementInterior(plr, getElementInterior(v))
	    		setElementDimension(plr, getElementDimension(v))
				warpPedIntoVehicle(plr,v)
	    	end
		end
		local query=exports["pystories-db"]:dbGet("SELECT 1 FROM pystories_vehicles WHERE id=? AND parking>0", vid)
		if query then
			outputChatBox("* Pojazd znajduje sie na parkingu/w przechowalni.", plr, 255, 0, 0)
		else
			outputChatBox("* Nie znaleziono podanego pojazdu na mapie.", plr, 255, 0, 0)
		end
	end
end)

addCommandHandler("vth", function(plr,cmd,vid)
	if getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) or getAdmin(plr,4) then
		if not vid or not tonumber(vid) then return end
		vid=tonumber(vid)
		for i,v in ipairs(getElementsByType("vehicle")) do
			local dbid=getElementData(v,"vehicle:id")
			if dbid and tonumber(dbid) == vid then
				if getElementData(v,"vehicle_id:faction") then outputChatBox("* Auto znajduje się na parkingu policyjnym !",plr,255,0,0) return end
	    		local x,y,z=getElementPosition(plr)
	    		setElementPosition(v,x,y,z+0.1)
	    		setElementInterior(v, getElementInterior(plr))
	    		setElementDimension(v, getElementDimension(plr))
				warpPedIntoVehicle(plr,v)
	   		end
		end
		local query=exports["pystories-db"]:dbGet("SELECT 1 FROM pystories_vehicles WHERE id=? AND parking>0", vid)
		if query then
			outputChatBox("* Pojazd znajduje sie na parkingu/w przechowalni.", plr, 255, 0, 0)
		else
			outputChatBox("* Nie znaleziono podanego pojazdu na mapie.", plr, 255, 0, 0)
		end
	end
end)

addCommandHandler("heal", function(plr,cmd,cel)
	if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if not cel then
			outputChatBox("* Użyj: /heal <id/nick>", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		setElementHealth(target, 100)
		outputChatBox("* Uleczyłeś(aś) gracza " ..getPlayerName(target):gsub("#%x%x%x%x%x%x",""), plr)
		outputChatBox("* Zostałeś(aś) uleczony(a) przez "..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""), target)
	end
end)

addCommandHandler("checkserial", function(plr,cmd,cel)
	if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if not cel then
			outputChatBox("* Użyj: /checkserial <id/nick>", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		outputChatBox("* Serial gracza("..getPlayerName(target):gsub("#%x%x%x%x%x%x","").."): "..getPlayerSerial(target), plr)
	end
end)

addCommandHandler("spec", function(plr,cmd,cel)
	if getAdmin(plr,4) or  getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if not cel then
			outputChatBox("Uzyj: /spec <id/nick>", plr,255,255,255,true)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("Nie znaleziono podanego gracza.", plr, 255, 0, 0,true)
			return
		end
		local x,y,z=getElementPosition(plr)
		removePedFromVehicle(plr)
		setElementInterior(plr, getElementInterior(target))
		setElementDimension(plr, getElementDimension(target))
		setCameraTarget(plr, target)
		setElementData(plr,"spec:pos",{x,y,z})
	end
end)

addCommandHandler("specoff", function(plr,cmd)
	if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		local spec=getElementData(plr,"spec:pos")
		if not spec then return end
		setElementPosition(plr, spec[1], spec[2], spec[3])
		setCameraTarget(plr, plr)
	end
end)

function destroyBlipsAttachedTo(player)
    local attached = getAttachedElements ( player )
    if ( attached ) then
        for k,element in ipairs(attached) do
            if getElementType ( element ) == "blip" then
                destroyElement ( element )
            end
        end
    end
end

addCommandHandler("inv", function(plr)
	if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if getElementAlpha(plr) > 0 then
			setElementAlpha(plr,0)
			destroyBlipsAttachedTo ( plr )
			--triggerClientEvent("onChatbubblesMessageIncome",plr,msg:gsub("#%x%x%x%x%x%x",""),1)
		else
			setElementAlpha(plr,255)
			local newValue = getElementData(plr,"player:admin") -- find the new value
			if newValue == true then
				destroyBlipsAttachedTo (plr)
				createBlipAttachedTo ( plr, 0, 2, 100, 100, 100 )
			--[[if getAdmin(plr, 1) then
			destroyBlipsAttachedTo(plr)
			createBlipAttachedTo(plr, 0, 2, 0, 191, 52)
			elseif getAdmin(plr, 2) then
			destroyBlipsAttachedTo(plr)
			createBlipAttachedTo(plr, 0, 2, 255, 0, 0)
			elseif getAdmin(plr, 3) then
			destroyBlipsAttachedTo(plr)
			createBlipAttachedTo(plr, 0, 2, 100, 0, 0)
			elseif getAdmin(plr, 4) then
			destroyBlipsAttachedTo(plr)
			createBlipAttachedTo(plr, 0, 2, 142, 0, 255)--]]
			
			else
				destroyBlipsAttachedTo ( plr )
				createBlipAttachedTo ( plr, 0, 2, 100, 100, 100 )
				--triggerClientEvent("onChatbubblesMessageIncome",plr,msg:gsub("#%x%x%x%x%x%x",""),0)
			end
		end
	end
end)

--[[addCommandHandler("invveh", function(plr)
	if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		local plr=getPedOccupiedVehicle(plr)
		if not plr then return end
		if getElementAlpha(plr) > 0 then
			setElementAlpha(plr,0)
		else
			setElementAlpha(plr,255)
		end
	end
end)--]]

local dopicia = {}
local player_alc = {}
local pije = {}

function stopAnimacja(plr)
    setPedAnimation(plr, false)
    unbindKey(plr, "ENTER", "down", stopAnimacja)
end

function pij(plr)
	if pije[plr] then return end
	pije[plr] = true
    setPedAnimation ( plr, "BAR", "dnk_stndM_loop", 1200, false, false )
	setTimer(function () setPedAnimation(plr,false);pije[plr] = nil; triggerClientEvent(plr,"onDrinkAlcohol",root) end,1200,1)
	setPedWalkingStyle(plr,126)
	dopicia[plr] = dopicia[plr] -1
	if dopicia[plr] == 0 then
	destroyElement(player_alc[plr])
	player_alc[plr] = nil
    unbindKey(plr, "fire", "down", pij)
	end
end


addCommandHandler("sex1",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "sex", "sex_1_cum_p", -1, true, false )
end)


addCommandHandler("sex2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "sex", "sex_1_cum_w", -1, true, false )
end)


addCommandHandler("dzwonisz",function(plr,cmd)
--[[
    if (isPedInVehicle(plr)) then
        outputChatBox("Najpierw wysiadz z pojazdu", plr)
        return
    end
]]--
    setPedAnimation( plr, "ped", "phone_in", -1, false, false, false, true)
--  setPedAnimation ( plr, "ped", "handsup", -1, false, false )
end)


-- animacje zaimportowane z BestPlay i wykonane przez wujka <wube@bestplay.pl>

addCommandHandler("rece",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ped", "handsup", -1, false, false )
end)

addCommandHandler("taichi",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "PARK", "Tai_Chi_Loop", -1, true, false )
end)

addCommandHandler("predator",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "BSKTBALL", "BBALL_def_loop", -1, true, false )
end)

addCommandHandler("podkrecasz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "BAR", "Barserve_glass", -1, false, false )
end)

addCommandHandler("podsluchujesz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "BAR", "Barserve_order", -1, false, false )
end)

addCommandHandler("podaj",function(plr,cmd,targ)
	if getAdmin(plr,3) or getAdmin(plr,4) then
		if not targ then
			outputChatBox("Uzyj: /podaj <id/nick>", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,targ)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
	if player_alc[target] then outputChatBox("* Gracz ma juz alkochol!", plr) return end
    if (isPedInVehicle(target)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
	local alc = createObject(1484,0,0,0)
	player_alc[target] = alc
	dopicia[target] = 3
	exports.bone_attach:attachElementToBone(alc,target,12,0,0,0,0,0,0)
    bindKey(target, "fire", "down", pij)
	end
end)
addCommandHandler("pijesz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "BAR", "dnk_stndM_loop", -1, true, false )
end)


addCommandHandler("taniec",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CHAINSAW", "CSAW_Hit_2", -1, true, true )
end)

addCommandHandler("taniec2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "SKATE", "skate_idle", -1, true, false )
end)

addCommandHandler("taniec3",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "STRIP", "strip_B", -1, true, false )
end)

addCommandHandler("taniec4",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "DANCING", "dance_loop", -1, true, false )
end)

addCommandHandler("taniec5",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "DANCING", "DAN_Down_A", -1, true, false )
end)

addCommandHandler("taniec6",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "STRIP", "strip_G", -1, true, false )
end)

addCommandHandler("taniec7",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "STRIP", "STR_C2", -1, true, false )
end)

addCommandHandler("taniec8",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "DANCING", "dnce_M_b", -1, true, false )
end)

addCommandHandler("taniec9",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "DANCING", "DAN_Loop_A", -1, true, false )
end)

addCommandHandler("taniec10",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "DANCING", "dnce_M_d", -1, true, false )
end)

addCommandHandler("taniec11",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "STRIP", "strip_D", -1, true, false )
end)

addCommandHandler("taniec12",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "STRIP", "strip_E", -1, true, false )
end)

addCommandHandler("taniec13",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "STRIP", "STR_Loop_A", -1, true, false )
end)

addCommandHandler("taniec14",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "STRIP", "STR_Loop_B", -1, true, false )
end)

addCommandHandler("taniec15",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "FINALE", "FIN_Cop1_Stomp", -1, true, false )
end)

addCommandHandler("taniec16",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "DANCING", "dnce_M_a", -1, true, false )
end)

addCommandHandler("taniec17",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GFUNK", "Dance_G10", -1, true, false )
end)

addCommandHandler("taniec18",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GFUNK", "Dance_G11", -1, true, false )
end)

addCommandHandler("taniec19",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GFUNK", "Dance_G12", -1, true, false )
end)

addCommandHandler("taniec20",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "RUNNINGMAN", "Dance_B1", -1, true, false )
end)

addCommandHandler("palisz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "LOWRIDER", "M_smklean_loop", -1, true, false )
end)

addCommandHandler("lezysz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "BEACH", "Lay_Bac_Loop", -1, true, false )
end)

addCommandHandler("lezysz2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CRACK", "crckidle2", -1, true, false )
end)

addCommandHandler("lezysz3",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CRACK", "crckidle4", -1, true, false )
end)

addCommandHandler("lezysz4",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "BEACH", "ParkSit_W_loop", -1, false, false )
end)

addCommandHandler("lezysz5",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "BEACH", "SitnWait_loop_W", -1, true, false )
end)

addCommandHandler("siedzisz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "BEACH", "ParkSit_M_loop", -1, true, false )
end)

addCommandHandler("siedzisz2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "INT_OFFICE", "OFF_Sit_Idle_Loop", -1, true, false )
end)

addCommandHandler("siedzisz3",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "JST_BUISNESS", "girl_02", -1, false, false )
end)

addCommandHandler("klekasz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CAMERA", "camstnd_to_camcrch", -1, false, false )
end)

addCommandHandler("klekasz2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "COP_AMBIENT", "Copbrowse_nod", -1, true, false )
end)

addCommandHandler("czekasz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "COP_AMBIENT", "Coplook_loop", -1, true, false )
end)

addCommandHandler("akrobata",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "DAM_JUMP", "DAM_Dive_Loop", -1, false, false )
end)

addCommandHandler("msza",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "DEALER", "DEALER_IDLE", -1, true, false )
end)

addCommandHandler("msza2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GRAVEYARD", "mrnM_loop", -1, false, false )
end)

addCommandHandler("znakkrzyza",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GANGS", "hndshkcb", -1, true, false )
end)

addCommandHandler("rzygasz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "FOOD", "EAT_Vomit_P", -1, true, false )
end)

addCommandHandler("jesz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "FOOD", "EAT_Burger", -1, true, false )
end)

addCommandHandler("cpun1",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GANGS", "drnkbr_prtl", -1, true, false )
end)

addCommandHandler("cpun2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GANGS", "smkcig_prtl", -1, true, false )
end)

addCommandHandler("cpun3",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CRACK", "Bbalbat_Idle_01", -1, true, false )
end)

addCommandHandler("cpun4",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CRACK", "Bbalbat_Idle_02", -1, true, false )
end)

addCommandHandler("witasz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GANGS", "hndshkba", -1, true, false )
end)

addCommandHandler("rozmawiasz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GANGS", "prtial_gngtlkH", -1, true, false )
end)

addCommandHandler("rozmawiasz2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GANGS", "prtial_gngtlkG", -1, true, false )
end)

addCommandHandler("rozmawiasz3",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GANGS", "prtial_gngtlkD", -1, true, false )
end)

addCommandHandler("nerwowy",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GHANDS", "gsign2", -1, true, false )
end)

addCommandHandler("piszesz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "INT_OFFICE", "OFF_Sit_Type_Loop", -1, true, false )
end)

addCommandHandler("gay",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ped", "WOMAN_walksexy", -1, true, true )
end)

addCommandHandler("gay2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ped", "WOMAN_walkpro", -1, true, true )
end)

addCommandHandler("gay3",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ped", "WOMAN_runsexy", -1, true, true )
end)

addCommandHandler("wreczasz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "KISSING", "gift_give", -1, false, false )
end)

addCommandHandler("machasz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "KISSING", "gfwave2", -1, true, false )
end)

addCommandHandler("walisz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "PAULNMAC", "wank_loop", -1, true, false )
end)

addCommandHandler("walisz2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "MISC", "Scratchballs_01", -1, true, false )
end)

addCommandHandler("sikasz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "PAULNMAC", "Piss_loop", -1, true, false )
end)

addCommandHandler("pijany",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ped", "WALK_drunk", -1, true, true )
end)

addCommandHandler("pijany2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "PAULNMAC", "PnM_Loop_A", -1, true, false )
end)

addCommandHandler("pijany3",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "PAULNMAC", "PnM_Argue2_A", -1, true, false )
end)

addCommandHandler("rapujesz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "SCRATCHING", "scmid_l", -1, true, false )
end)

addCommandHandler("rapujesz2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "SCRATCHING", "scdldlp", -1, true, false )
end)

addCommandHandler("rapujesz3",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "Flowers", "Flower_Hit", -1, true, false )
end)

addCommandHandler("rapujesz4",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "RAPPING", "RAP_C_Loop", -1, true, false )
end)

addCommandHandler("rapujesz5",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "RAPPING", "RAP_B_Loop", -1, true, false )
end)

addCommandHandler("rapujesz6",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "SCRATCHING", "scdrdlp", -1, true, false )
end)

addCommandHandler("rapujesz7",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "SCRATCHING", "scdrulp", -1, true, false )
end)

addCommandHandler("rapujesz8",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "RAPPING", "RAP_A_Loop", -1, true, false )
end)
addCommandHandler("rolki",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "SKATE", "skate_run", -1, true, true )
end)

addCommandHandler("rolki2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "SKATE", "skate_sprint", -1, true, true )
end)
addCommandHandler("umierasz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ped", "FLOOR_hit_f", -1, false, false )
end)

addCommandHandler("umierasz2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ped", "FLOOR_hit", -1, false, false )
end)

addCommandHandler("bijesz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "BASEBALL", "Bat_M", -1, true, false )
end)

addCommandHandler("bijesz2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "RIOT", "RIOT_PUNCHES", -1, true, false )
end)

addCommandHandler("bijesz3",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "FIGHT_B", "FightB_M", -1, true, false )
end)

addCommandHandler("bijesz4",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "MISC", "bitchslap", -1, true, false )
end)

addCommandHandler("bijesz5",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ped", "BIKE_elbowR", -1, true, false )
end)

addCommandHandler("wolasz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "RYDER", "RYD_Beckon_01", -1, true, false )
end)

addCommandHandler("wolasz2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "POLICE", "CopTraf_Come", -1, true, false )
end)

addCommandHandler("wolasz3",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "RYDER", "RYD_Beckon_02", -1, true, false )
end)

addCommandHandler("zatrzymujesz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "POLICE", "CopTraf_Stop", -1, true, false )
end)

addCommandHandler("wskazujesz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "SHOP", "ROB_Loop", -1, true, false )
end)

addCommandHandler("rozgladasz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ON_LOOKERS", "lkaround_loop", -1, true, false )
end)

addCommandHandler("krzyczysz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ON_LOOKERS", "shout_in", -1, true, false )
end)

addCommandHandler("fuckyou",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "RIOT", "RIOT_FUKU", -1, true, false )
end)

addCommandHandler("tchorz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ped", "cower", -1, false, false )
end)

addCommandHandler("kopiesz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GANGS", "shake_carK", -1, true, false )
end)

addCommandHandler("kopiesz2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "FIGHT_D", "FightD_G", -1, true, false )
end)

addCommandHandler("kopiesz3",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "FIGHT_C", "FightC_3", -1, false )
end)

addCommandHandler("wywazasz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GANGS", "shake_carSH", -1, true, false )
end)

addCommandHandler("wywazasz2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "POLICE", "Door_Kick", -1, true, false )
end)

addCommandHandler("kieszen",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GANGS", "leanIDLE", -1, true, false )
end)

addCommandHandler("celujesz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ped", "ARRESTgun", -1, false, false )
end)

addCommandHandler("kichasz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "VENDING", "vend_eat1_P", -1, true, false )
end)

addCommandHandler("pocalunek",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "BD_FIRE", "Grlfrd_Kiss_03", -1, true, false )
end)

addCommandHandler("taxi",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "MISC", "Hiker_Pose", -1, false, false )
end)

addCommandHandler("taxi2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "MISC", "Hiker_Pose_L", -1, false, false )
end)

addCommandHandler("noga",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "SHOP", "SHP_Jump_Glide", -1, false, false )
end)

addCommandHandler("pozegnanie",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "BD_FIRE", "BD_Panic_03", -1, true, false )
end)

addCommandHandler("cud",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CARRY", "crry_prtial", -1, true, false )
end)

addCommandHandler("cud2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ON_LOOKERS", "Pointup_loop", -1, false, false )
end)

addCommandHandler("delirium",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CRACK", "crckdeth1", -1, false )
end)

addCommandHandler("delirium2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CRACK", "crckdeth2", -1, true, false )
end)

addCommandHandler("delirium3",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CRACK", "crckidle3", -1, true, false )
end)

addCommandHandler("delirium4",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CHAINSAW", "csaw_part", -1, true, false )
end)

addCommandHandler("delirium5",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CASINO", "Roulette_loop", -1, true, false )
end)

addCommandHandler("naprawiasz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CAR", "flag_drop", -1, true, false )
end)

addCommandHandler("naprawiasz2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CAR", "Fixn_Car_Loop", -1, true, false )
end)

addCommandHandler("placzesz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GRAVEYARD", "mrnF_loop", -1, true, false )
end)

addCommandHandler("kibicujesz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "RIOT", "RIOT_ANGRY_B", -1, true, false )
end)

addCommandHandler("kibicujesz2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ON_LOOKERS", "wave_loop", -1, true, false )
end)

addCommandHandler("bioenergoterapeuta",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "WUZI", "Wuzi_Greet_Wuzi", -1, true, false )
end)

addCommandHandler("meteorolog",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "WUZI", "Wuzi_grnd_chk", -1, true, false )
end)

addCommandHandler("klepiesz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "SWEET", "sweet_ass_slap", -1, true, false )
end)

addCommandHandler("cierpisz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "SWEET", "Sweet_injuredloop", -1, true, false )
end)

addCommandHandler("starzec",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ped", "WALK_shuffle", -1, true, true )
end)

addCommandHandler("starzec2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ped", "WOMAN_walkfatold", -1, true, true )
end)

addCommandHandler("starzec3",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "ped", "WOMAN_walkshop", -1, true, true )
end)

addCommandHandler("reanimujesz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "MEDIC", "CPR", -1, false, false )
end)

addCommandHandler("myjesz",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CASINO", "dealone", -1, true, false )
end)

addCommandHandler("zadowolony",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CASINO", "manwind", -1, true, false )
end)

addCommandHandler("zadowolony2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CASINO", "manwinb", -1, true, false )
end)

addCommandHandler("zalamany",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CASINO", "Roulette_lose", -1, true, false )
end)

addCommandHandler("zmeczony",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "FAT", "IDLE_tired", -1, true, false )
end)

addCommandHandler("ochnie",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "MISC", "plyr_shkhead", -1, true, false )
end)

addCommandHandler("cwaniak1",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GHANDS", "gsign1", -1, true, false )
end)

addCommandHandler("cwaniak2",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GHANDS", "gsign1LH", -1, true, false )
end)

addCommandHandler("cwaniak3",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GHANDS", "gsign2", -1, true, false )
end)

addCommandHandler("cwaniak4",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GHANDS", "gsign2LH", -1, true, false )
end)

addCommandHandler("cwaniak5",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GHANDS", "gsign3", -1, true, false )
end)

addCommandHandler("cwaniak6",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GHANDS", "gsign3LH", -1, true, false )
end)

addCommandHandler("cwaniak7",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GHANDS", "gsign4", -1, true, false )
end)

addCommandHandler("cwaniak8",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GHANDS", "gsign4LH", -1, true, false )
end)


addCommandHandler("cwaniak9",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GHANDS", "gsign5", -1, true, false )
end)

addCommandHandler("cwaniak10",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "GHANDS", "gsign5LH", -1, true, false )
end)

addCommandHandler("pijak",function(plr,cmd)
    if (isPedInVehicle(plr)) then
        outputChatBox("* Najpierw wysiądź z pojazdu !", plr)
        return
    end
    bindKey(plr, "ENTER", "down", stopAnimacja)
    setPedAnimation ( plr, "CRACK", "crckidle4", -1, true, false )
end)

addCommandHandler("cv", function(plr,cmd,name)
	if getAdmin(plr,4) or  getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if getElementData(plr, "player:admin") then
			if not name then return end
			local veh=getPedOccupiedVehicle(plr)
			if veh then
				if getElementData(veh,"vehicle:spawn") then
					outputChatBox("* Nie możesz zmienić Sobie pojazdu prywatnego.", plr)
					return
				end
			end
			
			if tonumber(name) ~= nil then
				outputChatBox("* Musisz wpisać nazwę, nie model.", plr)
				return
			end
			
--			if name == "rhino" or name == "hydra" or name =="seasparrow" or name == "hunter" or name == "Rhino" or name == "Hunter" or name == "Hydra" then
--				outputChatBox("* Brak dostępu do zakazanego modelu.", plr, 255, 255,255)
--				return
--			end
			
			local dim = getElementDimension(plr)
			
			local x,y,z = getElementPosition(plr)
			local rx,ry,rz = getElementRotation(plr)
			local veh = createVehicle(getVehicleModelFromName(name), x, y, z, rx, ry, rz)
			local model = getVehicleModelFromName(name)
			
			setElementInterior(veh,getElementInterior(plr))
			setElementDimension(veh,getElementDimension(plr))
			setElementData(veh, "vehicle:fuel", 100)
			warpPedIntoVehicle(plr,veh)
			outputChatBox("* Zrespiłeś(aś) pojazd: "..name, plr)
		end
	end
end)

addCommandHandler("dv", function(plr,cmd)
	if getAdmin(plr,4) or  getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if getElementData(plr, "player:admin") then
			local veh=getPedOccupiedVehicle(plr)
			if not veh then
				outputChatBox("* Musisz siedzieć w pojeździe.", plr)
				return
			end
			if getElementData(veh,"vehicle:spawn") then
				outputChatBox("* Nie możesz usunąć tego pojazdu.", plr)
				return
			end
			destroyElement(veh)
			outputChatBox("* Usunąłeś(aś) pojazd", plr)
		end
	end
end)

local stopChat = false

addCommandHandler("v", function(plr, cmd, ...)
 if getElementData(plr, "player:premium") == false then outputChatBox("* Musisz posiadać status premium by pisać na czacie globalnym!",plr,78,255,0) return end
 if not ... then
  local x = getElementData(plr,"player:pchatoff")
  if x == false then
  outputChatBox("* Wyłączyłeś(aś) chat premium",plr, 255, 255, 0, true)
  setElementData(plr,"player:pchatoff",true)
  end
  if x == true then
  outputChatBox("* Włączyłeś(aś) chat premium",plr, 255, 255, 0, true)
  setElementData(plr,"player:pchatoff",false)
  end
  return end
  if stopChat then
	cancelEvent()
	outputChatBox('* Chat premium jest aktualnie wyłączony.', plr, 255, 0, 0, true)
  return end
  if getElementData(plr,"player:pchatoff") then
	cancelEvent()
	outputChatBox('* Posiadasz wyłączony chat premium.', plr, 255, 0, 0, true)
	return end
  if ... then
    local message = table.concat ( { ... }, " " )
    local name = getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
    for _,p in pairs(getElementsByType("player")) do
 if getElementData(p,"player:premium") and not getElementData(p,"player:pchatoff") then
    --outputChatBox("#C0FF00"..getElementData(plr,"id").."#C0FF00> #C0FF00"..name.."#C0FF00: #C0FF00"..message:gsub("#%x%x%x%x%x%x",""), p, 255, 255, 255, true)
	outputChatBox("#FFC000[PREMIUM] ["..getElementData(plr,"id").."]"..name.."#ffffff: "..message:gsub("#%x%x%x%x%x%x","").."", p, 255, 255, 255, true)
 end
    end
	local desc = "[PREMIUM] ["..getElementData(plr,"id").."]"..name..": "..message:gsub("#%x%x%x%x%x%x","")..""
	triggerEvent("admin:addText", resourceRoot, desc:gsub("#%x%x%x%x%x%x",""))
	outputServerLog(desc)
	end
end)
addCommandHandler("up", function(plr, cmd, value)
	if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
        if (tonumber(value)==nil) then
            outputChatBox("Użyj: /up <ile>", plr)
            return
        end

        local e = plr
        if (isPedInVehicle(plr)) then
            e = getPedOccupiedVehicle(plr)
        end

        local x,y,z = getElementPosition(e)
        setElementPosition(e, x, y, z+tonumber(value))
    end
end)

addCommandHandler("thru", function(plr, cmd, value)
	if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
        if (tonumber(value)==nil) then
            outputChatBox("Użyj: /thru <ile>", plr)
            return
        end

        local e = plr
        if getCameraTarget(plr) ~= plr then
            e = getCameraTarget(plr)
        end

        if (isPedInVehicle(plr)) then
            e = getPedOccupiedVehicle(e)
        end
		
        local x,y,z = getElementPosition(e)
        local _,_,rz = getElementRotation(e)
        local rrz = math.rad(rz)
        local x = x + (value * math.sin(-rrz))
        local y = y + (value * math.cos(-rrz))
        setElementPosition(e, x, y, z)
    end
end)


local zapisane_pozycje = {}
addCommandHandler("sp", function(plr,cmd)
	if getAdmin(plr) then
    local pos={}
    pos[1],pos[2],pos[3]=getElementPosition(plr)
    pos[4]=getElementInterior(plr)
    pos[5]=getElementDimension(plr)
	local uid = getElementData(plr,"player:sid")
    zapisane_pozycje[uid] = pos
    outputChatBox("* Pozycja została zapisana.", plr)
	end
end)

addCommandHandler("lp", function(plr,cmd)
	if getAdmin(plr) then
	local uid = getElementData(plr,"player:sid")
    local pos=zapisane_pozycje[uid]
    if (not pos) then
    outputChatBox("* Nie masz żadnej zapisanej pozycji.", plr)
    return
    end
	local veh = getPedOccupiedVehicle(plr)
	if veh then plr = veh end
    setElementPosition(plr,pos[1],pos[2],pos[3])
    setElementInterior(plr,pos[4])
    setElementDimension(plr,pos[5])
    outputChatBox("* Wczytano pozycję.", plr)
	end
end)

addCommandHandler("pj",function(plr,cmd,pj)
	if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
	if not pj or not tonumber(pj) then outputChatBox("* Wpisz /paint.job <0-3> !",plr) return end
	local pj = tonumber(pj)
	if pj < 0 or pj > 3 then outputChatBox("* Wpisz /paint.job <0-3> !",plr) return end
	local veh = getPedOccupiedVehicle(plr)
	if not veh then outputChatBox("* Najpierw wsiądź do pojazdu !", plr) return end
	setVehiclePaintjob(veh,pj)
	end
end)

addCommandHandler("vinfo", function(plr,cmd,pojazd)
	if not getAdmin(plr) then outputChatBox("* Brak uprawnień !", plr) return end
    if not pojazd or not tonumber(pojazd) then
        outputChatBox("Użyj: /vinfo <id pojazdu>", plr)
        return
    end
    pojazd=tonumber(pojazd)
	local result = exports['pystories-db']:dbGet("SELECT * FROM pystories_vehicles WHERE id=?",pojazd)
	if not result or #result < 1 then 
	outputChatBox("* Nie znaleziono podanego pojazdu !")
	return end
	local query = exports['pystories-db']:dbGet("SELECT * FROM pystories_users WHERE id=?",result[1].ownedPlayer)
    outputChatBox("* Pojazd ID " .. result[1].id .. ", model " .. result[1].model .. " ("..getVehicleNameFromModel(result[1].model)..")", plr)
    outputChatBox("* Własność gracza " .. query[1].login .. " ("..result[1].ownedPlayer..")", plr)
    outputChatBox("* Ostatni kierowca " .. result[1].driver .. "| Przebieg " .. result[1].mileage, plr)
    outputChatBox("* Paliwo " .. result[1].fuel .. " | Przechowalnia : " ..result[1].parking, plr)
end)

addCommandHandler("veh.list", function(plr,cmd,cel)
	if not getAdmin(plr) then outputChatBox("* Brak uprawnien", plr) return end
    if not cel then
        outputChatBox("* Użyj: /veh.list <id/nick>", plr)
        return
    end
	local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
	local resulte = exports['pystories-db']:dbGet("SELECT * FROM pystories_vehicles WHERE ownedPlayer=?",getElementData(target, "player:sid"))
	if not resulte or #resulte < 1 then
	outputChatBox("* Nie znaleziono pojazdu", plr)
	return end
	outputChatBox("--- Pojazdy Gracza "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").."---",plr)
	for i,result in pairs(resulte) do
    outputChatBox("* Pojazd ID " .. result.id .. ", model " .. result.model .. " ("..getVehicleNameFromModel(result.model)..")", plr)
	end
	outputChatBox("------",plr)
	exports["pystories-db"]:dbSet("INSERT INTO admin_logs_cmd (uid,moderator,cmd) VALUES (?,?,?)", getElementData(plr,"player:sid"), getPlayerName(plr):gsub("#%x%x%x%x%x%x",""), "veh.list "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").."")
end)

addCommandHandler("ginfo", function(plr,cmd,cel)
	if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if not cel then
			outputChatBox("* Uzyj: /ginfo <id/nick>", plr)
			return
		end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
    gracz=tonumber(gracz)
	exports["pystories-db"]:dbSet("INSERT INTO admin_logs_cmd (sid,moderator,cmd) VALUES (?,?,?)", getElementData(plr,"player:sid"), getPlayerName(plr):gsub("#%x%x%x%x%x%x",""), "ginfo "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").."")
	local result = exports['pystories-db']:dbGet("SELECT * FROM pystories_users WHERE id=?",getElementData(target, "player:sid"))
	if not result or #result < 1 then
	outputChatBox("* Nie znaleziono gracza", plr, 255, 255, 255)
	return end 
    outputChatBox("* Login: " .. result[1].login, plr)
    outputChatBox("* Pieniądze: " .. result[1].money, plr)
    outputChatBox("* Pieniądze w bankomacie: " .. result[1].bank_money, plr)
    outputChatBox("* SRP: " .. result[1].srp, plr)
    outputChatBox("* Minuty: " .. result[1].hours, plr)
    outputChatBox("* Minuty na duty: " .. result[1].worker, plr)
    outputChatBox("* Data rejestracji: " .. result[1].registered, plr)
	outputChatBox("* Serial: " .. result[1].register_serial, plr)
    outputChatBox("* Konto premium do: " .. result[1].premiumdate, plr)
	end
end)

addCommandHandler("paliwo", function(plr,cmd)
	if getAdmin(plr) then
		local veh=getPedOccupiedVehicle(plr)
		if not veh then
			outputChatBox("* Nie znajdujesz się w pojeździe", plr)
			return
		end
		setElementData(veh, "vehicle:fuel", 100)
		outputChatBox("* Auto zatankowane!",plr,0,255,0)
	end
end)

addCommandHandler("daj.bron", function(plr,cmd,cel,bron,amunicja)
	if getAdmin(plr,3) or getAdmin(plr,4) then
		if not cel or not bron then
			outputChatBox("* Użycie: /daj.bron <nick/ID> <bron> <amunicja>", plr)
			return
		end
		if not tonumber(bron) then
		outputChatBox("* Użycie: /daj.bron <nick/ID> <bron> <amunicja>", plr)
			return
		end
		if not amunicja then local amunicja = 10 end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		if giveWeapon(target,bron,amunicja,true) then
			outputChatBox("* Nadałeś(aś) broń ("..getWeaponNameFromID(bron)..") dla "..getPlayerName(target):gsub("#%x%x%x%x%x%x",""),plr)
			outputChatBox("* Otrzymałeś(aś) broń ("..getWeaponNameFromID(bron)..") od "..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""),target)
		else
			outputChatBox("* Wpisałeś(aś) złe id broni!",plr)
		end
	end
end)

addCommandHandler("qkx.id-broni",function(plr,cmd)
for i=0,46 do
outputChatBox("* "..i.." : "..getWeaponNameFromID(i),plr)
end
end)

addCommandHandler("cfix", function(plr, cmd, range)
    if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) then
        if (not range) then
            outputChatBox("Użyj: /cfix <zasieg>", plr)
        return end
		if not tonumber(range) then
		outputChatBox("* /cfix <zasieg>", plr)
		return end
		range = tonumber(range)
		if range <= 0 then
		outputChatBox("* Za mala odleglosc", plr)
		return end
		if range > 200 then
		outputChatBox("* Za duza odleglosc", plr)
		return end
		local x,y,z = getElementPosition(plr)
		local cub = createColSphere(x,y,z,range)
		local pojazdy = getElementsWithinColShape( cub, "vehicle")
		if #pojazdy == 0 then
		outputChatBox("* Brak pojazdow w poblizu", plr)
		return end
		for i,pojazd in ipairs(pojazdy) do
			fixVehicle(pojazd)
		end
		setTimer(destroyElement,5000,1,cub)
	end
end)
