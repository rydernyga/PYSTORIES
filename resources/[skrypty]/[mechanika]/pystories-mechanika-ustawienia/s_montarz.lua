--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

addEvent("montazElementu", true)
addEventHandler("montazElementu", root, function(veh, typ, czesc, koszt, nazwaCzesci)
	if tostring(typ) == "naprawa" then
		zgoda=true
		zgoda2=false
		if czesc == "all" then
			setElementHealth(veh, 10000)
			fixVehicle(veh)
			setElementHealth(veh, 10000)
			setVehicleDoorState(veh, 0, 0)
			setVehicleDoorState(veh, 1, 0)
			setVehicleDoorState(veh, 2, 0)
			setVehicleDoorState(veh, 3, 0)
			setVehicleDoorState(veh, 4, 0)
			setVehicleDoorState(veh, 5, 0)
			setVehiclePanelState(veh, 4, 0)
			setVehiclePanelState(veh, 5, 0)
			setVehiclePanelState(veh, 6, 0)
			setVehicleLightState(veh, 0, 0)
			setVehicleLightState(veh, 1, 0)
			setVehicleLightState(veh, 2, 0)
			setVehicleLightState(veh, 3, 0)
		else
			if czesc == 1 then setElementHealth(veh, 10000) end
			if czesc == 2 then setVehicleDoorState(veh, 0, 0) end
			if czesc == 3 then setVehicleDoorState(veh, 1, 0) end
			if czesc == 4 then setVehicleDoorState(veh, 2, 0) end
			if czesc == 5 then setVehicleDoorState(veh, 3, 0) end
			if czesc == 6 then setVehicleDoorState(veh, 4, 0) end
			if czesc == 7 then setVehicleDoorState(veh, 5, 0) end
			if czesc == 8 then setVehiclePanelState(veh, 4, 0) end
			if czesc == 9 then setVehiclePanelState(veh, 5, 0) end
			if czesc == 10 then setVehiclePanelState(veh, 6, 0) end
			if czesc == 11 then setVehicleLightState(veh, 0, 0) end
			if czesc == 12 then setVehicleLightState(veh, 1, 0) end
			if czesc == 13 then setVehicleLightState(veh, 2, 0) end
			if czesc == 14 then setVehicleLightState(veh, 3, 0) end
		end
	end
	local id=getElementData(veh,"vehicle:id")
	if not id then return end
	if tostring(typ) == "swiatla" then
		zgoda=true
		zgoda2=false
		setVehicleHeadLightColor(veh, czesc[1], czesc[2], czesc[3])
		query=string.format("UPDATE pystories_vehicles SET headlights='%d,%d,%d' WHERE id=?", czesc[1], czesc[2], czesc[3], id)
		exports["pystories-db"]:dbSet(query) -- set rekords
	end
	if tostring(typ) == "kolor" then
		zgoda=false
		zgoda2=false
		local c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12=getVehicleColor(veh, true)
		setVehicleColor(veh, czesc[1], czesc[2], czesc[3],c4,c5,c6,c7,c8,c9,c10,c11,c12)
		query=string.format("UPDATE pystories_vehicles SET color='%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d' WHERE id=?", czesc[1], czesc[2], czesc[3],c4,c5,c6,c7,c8,c9,c10,c11,c12, id)
		exports["pystories-db"]:dbSet(query) -- set rekords
	end
	if tostring(typ) == "kolor2" then
		zgoda=false
		zgoda2=false
		local c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12=getVehicleColor(veh, true)
		setVehicleColor(veh, c1,c2,c3,czesc[1], czesc[2], czesc[3],c7,c8,c9,c10,c11,c12)
		query=string.format("UPDATE pystories_vehicles SET color='%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d' WHERE id=?", c1,c2,c3,czesc[1], czesc[2], czesc[3],c7,c8,c9,c10,c11,c12, id)
		exports["pystories-db"]:dbSet(query) -- set rekords
	end
	if tostring(typ) == "tuning" then
		if getPlayerMoney(client)<tonumber(koszt) then
			local brakhajsu = string.format("* Nie stać cię na %s brakuję Ci %d PLN", nazwaCzesci, triggerServerEvent("takePlayerMoney", client, koszt, 0))
			outputChatBox(brakhajsu, client)
		return end
		local driver=getVehicleController(veh)
		if driver then
			removeVehicleUpgrade(veh,czesc)
			outputChatBox("* Zamontowano częśc: "..nazwaCzesci.."("..czesc.."), koszt: "..koszt.." PLN", driver)
		else
			outputChatBox("* Brak kierowcy w pojedzie", client) return
		end
		takePlayerMoney(client, koszt)
		--triggerServerEvent("takePlayerMoney", client, koszt, 0)
		zgoda=true
		zgoda2=false
		addVehicleUpgrade(veh, czesc)
		upgrades=getVehicleUpgrades(veh)
		if not upgrades then upgrades={} end
		upgrades=table.concat(upgrades, ",")
		query=string.format("UPDATE pystories_vehicles SET tuning='%s' WHERE id=?", upgrades, id)
		exports["pystories-db"]:dbSet(query) -- set rekords
	end
	if tostring(typ) == "demtuning" then
		driver=getVehicleController(veh)
		if not driver then outputChatBox("* Brak kierowcy w pojedzie", client) return end
		if getElementData(veh,"vehicle:ownedPlayer") ~= getElementData(driver,"player:sid") then outputChatBox("* Kierowca nie jest włascicielem!",client) return end
		if removeVehicleUpgrade(veh,czesc) == true then
			if driver then
				removeVehicleUpgrade(veh,czesc)
				givePlayerMoney(driver,koszt)
				--triggerServerEvent("givePlayerMoney", driver, koszt, 0)
				outputChatBox("* Zdemontowano częśc: "..nazwaCzesci.."("..czesc.."), zwrot: "..koszt.." PLN", driver)
			end
			zgoda=false
			zgoda2=true
			upgrades=getVehicleUpgrades(veh)
			if not upgrades then upgrades={} end
			upgrades=table.concat(upgrades, ",")
			query=string.format("UPDATE pystories_vehicles SET tuning='%s' WHERE id=?", upgrades, id)
			exports["pystories-db"]:dbSet(query) -- set rekords
		end
	end
	if zgoda == true then
		text="Warsztat> Zamontowano "..typ..", dla pojazdu id "..id..", koszt "..koszt.." PLN"
		triggerClientEvent("onDebugMessage", resourceRoot, text,5, "INNE")
		triggerEvent("admin:logs", root, text)
		--triggerEvent("admin:addText", resourceRoot, text:gsub("#%x%x%x%x%x%x",""))
	end
	if zgoda2 == true then
		text="Warsztat> Zdemontowano "..czesc..", dla pojazdu id "..id..", koszt "..koszt.." PLN"
		triggerClientEvent("onDebugMessage", resourceRoot, text,5, "INNE")
		triggerEvent("admin:logs", root, text)
		--triggerEvent("admin:addText", resourceRoot, text:gsub("#%x%x%x%x%x%x",""))
	end
end)
