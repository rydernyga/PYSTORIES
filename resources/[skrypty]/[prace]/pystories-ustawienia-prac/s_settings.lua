--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local obiekt={}

-- Kod służący od sprawdzania prawa jazdy
function getVehicleLicense(plr,type)
	if getElementData(plr,"player:license:pj"..type.."") ~= 1 then
		outputChatBox("* Nie posiadasz prawa jazdy kategorii "..type..", zdaj je w urzędzie miasta", plr, 255, 0, 0)
		return true
	end
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_punish WHERE serial=? AND type=? AND active=1 AND time>NOW()", getPlayerSerial(plr), tostring(type))
	if result and #result > 0 then
		v=result[1]
		outputChatBox("* Posiadasz zawieszone prawo jazdy do "..v.time.." za "..v.reason, plr)
		return true
	else
		exports["pystories-db"]:dbSet("DELETE FROM pystories_punish WHERE serial=? AND type=? AND active=1 AND time<NOW()", getPlayerSerial(plr), tostring(type))
		return false
	end
end

-- Kod służący od dawania wynagrodzenia
addEvent("givePlayerMoney", true)
addEventHandler("givePlayerMoney", root, function(value,value2)
	-- nie zalogowana osoba a fuj
	if not tonumber(value) then return end
	if not getElementData(source,"player:logged") then return end
	givePlayerMoney(source,value)
	-- Kod od reputacji
	if not value2 then
		local rnd={math.random(1,10),math.random(1,3)}
		local rep=getElementData(source,"player:reputation") or 0
		local xd=rep+rnd[2]
		setElementData(source,"player:reputation",xd)
		if rnd[1] == 1 or rnd[1] == 4 or rnd[1] == 9 then
			triggerClientEvent(source, "reputation:show", resourceRoot, rnd)
		end
	end
end)

addEvent("takePlayerMoney", true)
addEventHandler("takePlayerMoney", root, function(how)
    if not getElementData(source,"player:logged") then return end
    if not tonumber(how) then return end
    takePlayerMoney(source,how);
end)

-- Kod służący od usuwania danego pojazdu
addEvent("destroyVehicle", true)
addEventHandler("destroyVehicle", root, function(veh)
	if not veh then return end
	destroyElement(veh)
	if obiekt[veh] then 
		destroyElement(obiekt[veh])
	end
end)

-- Kod służący od usuwania obiektów z pojazdu
addEvent("removeObject", true)
addEventHandler("removeObject", root, function(veh,code)
	if obiekt[veh] then
		destroyElement(obiekt[veh])
	end
end)

-- Kod służacy do dodawania obiektów do prac
addEvent("addObject", true)
addEventHandler("addObject", root, function(veh,code)
	if code == "kamieniolom" then
		obiekt[veh]=createObject(3929, 0, 0, 0)
		setObjectScale(obiekt[veh], 3.5)
		attachElements(obiekt[veh], veh, 0, -2, 1, 90)
	end
end)