--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

-- Get vehicle keys
function getVehicleKey(plr,veh)
	if plr and veh then
		local sid=getElementData(plr,"player:sid")
		if not sid then return end
		if getElementData(plr,"player:admin") or sid == getElementData(veh,"vehicle:ownedPlayer") then
			return true
		else
			return false
		end
	end
end
local categoryL={[592] = true,[553] = true,[577] = true,[488] = true,[511] = true,[497] = true,[548] = true,[563] = true,[512] = true,[476] = true,[593] = true,[447] = true,[425] = true,[519] = true,[520] = true,[460] = true,[417] = true,[469] = true,[487] = true,[513] = true}
addEventHandler("onVehicleStartEnter", root, function(plr,seat,jacked)
	if getElementHealth(source) < 302 then
		setElementHealth(source,302)
	end
end)
function jestwtabeli(huj,truj)
    for k,v in pairs(huj) do
        if v == truj then
           return true
        end
    end
    return false
end
addCommandHandler("vdodaj",function(plr,cmd,target)
	local veh = getPedOccupiedVehicle(plr)
	if not veh then outputChatBox("* Nie siedzisz w aucie!",plr,255,0,0) return end
	if getElementData(veh,"vehicle:ownedPlayer") ~= getElementData(plr,"player:sid") then outputChatBox("* Ten pojazd nie należy od ciebie!",plr,255,0,0) return end
	if not target then
		outputChatBox("* Zabrano dostep wszystkim graczą!",plr,255,0,0)
		setElementData(veh,"vehicle:rent",0)
	else
		local target=findPlayer(plr, target)
		if not target then
			outputChatBox("* Nie znaleziono gracza online!",plr,255,0,0)
			return
		end
		local rent = getElementData(veh,"vehicle:rent")
		if (type(rent) ~= "table") then
			local tabelka = {}
			table.insert(tabelka,getElementData(target,"player:sid"))
			setElementData(veh,"vehicle:rent",tabelka)
			outputChatBox(string.format("* Dodano gracza "..getPlayerName(target).."(SID: "..getElementData(target,"player:sid")..") do wypożyczeń"),plr)
		else
			local tabelka = rent
			if jestwtabeli(tabelka,getElementData(target,"player:sid")) then outputChatBox("* Ten gracz aktualnie posiada kluczyki do twojego pojazdu!",plr) return end
 			if #tabelka > 25 then outputChatBox("* Możesz wypożyczyć maksymalnie 25 graczą!",plr) return end
			table.insert(tabelka,getElementData(target,"player:sid"))
			setElementData(veh,"vehicle:rent",tabelka)
			outputChatBox(string.format("* Dodano gracza "..getPlayerName(target).."(SID: "..getElementData(target,"player:sid")..") do wypożyczeń"),plr)
		end
	end
end)

-- Tutaj dalsza cześc kodu
--[[addEventHandler("onVehicleStartEnter", root, function(plr,seat,jacked)
	if seat ~= 0 then return end
	if categoryL[getElementModel(source)] then return end
	local query=string.format("SELECT * FROM ogrpg_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","prawko", getPlayerSerial(plr))
	local result=exports["ogrpg-db"]:dbSet(query)
	if (result) then
		outputChatBox(" Posiadasz zawieszone prawo jazdy do "..result["time"]..", za: "..result["reason"], plr, 255, 0, 0)
		cancelEvent()
	else
		exports["ogrpg-db"]:dbSet("DELETE FROM ogrpg_punish WHERE type=? AND active=1 AND serial=?", "prawko", getPlayerSerial(plr))
	end
end)

addEventHandler("onVehicleEnter", root, function(plr,seat,jacked)
	if seat ~= 0 then return end
	if categoryL[getElementModel(source)] then return end
		local queryA=string.format("SELECT * FROM ogrpg_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","prawko", getPlayerSerial(plr))
		local resultA=exports["ogrpg-db"]:pobierzWyniki(queryA)
		if (resultA) then
			--setControlState ( plr, "enter_exit", true )
			setTimer(setControlState, 800, 1, plr,"enter_exit", true)
			setTimer(setControlState, 1800, 1, plr,"enter_exit", false)
			outputChatBox("* Posiadasz zawieszone prawo jazdy do "..resultA["time"]..", za: "..resultA["reason"], plr, 255, 0, 0)
		else
			exports["ogrpg-db"]:dbSet("DELETE FROM ogrpg_punish WHERE type=? AND active=1 AND serial=?", "prawko", getPlayerSerial(plr))
		end
end)

addEventHandler("onVehicleStartEnter", root, function(plr,seat,jacked)
	if seat ~= 0 then return end
	if not categoryL[getElementModel(source)] then return end
	local query=string.format("SELECT * FROM ogrpg_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","L", getPlayerSerial(plr))
	local result=exports["ogrpg-db"]:pobierzWyniki(query)
	if (result) then
		outputChatBox(" Posiadasz zawieszona licencje  do "..result["time"]..", za: "..result["reason"], plr, 255, 0, 0)
		cancelEvent()
	else
		exports["ogrpg-db"]:dbSet("DELETE FROM ogrpg_punish WHERE type=? AND active=1 AND serial=?", "L", getPlayerSerial(plr))
	end
end)

addEventHandler("onVehicleEnter", root, function(plr,seat,jacked)
	if seat ~= 0 then return end
	if not categoryL[getElementModel(source)] then return end
		local queryA=string.format("SELECT * FROM ogrpg_punish WHERE type=%q AND active=1 AND serial=%q AND time>NOW() LIMIT 1","L", getPlayerSerial(plr))
		local resultA=exports["ogrpg-db"]:pobierzWyniki(queryA)
		if (resultA) then
			--setControlState ( plr, "enter_exit", true )
			setTimer(setControlState, 800, 1, plr,"enter_exit", true)
			setTimer(setControlState, 1800, 1, plr,"enter_exit", false)
			outputChatBox("* Posiadasz zawieszona licencje do "..resultA["time"]..", za: "..resultA["reason"], plr, 255, 0, 0)
		else
			exports["ogrpg-db"]:dbSet("DELETE FROM ogrpg_punish WHERE type=? AND active=1 AND serial=?", "L", getPlayerSerial(plr))
		end
end)--]]

--[[addCommandHandler("vopis", function(plr,cmd,...)
	if not getElementData(plr, "player:admin") then outputChatBox("* Brak uprawnień do użycia tej komendy !", plr) return end
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
end)--]]

addEventHandler ( "onVehicleEnter", getRootElement(), function(thePlayer, seat, jacked) 
	if seat==0 then
--		setVehicleDoorOpenRatio(source, 2, 0, 500)
		if (getVehicleDoorState(source,2)==0) then
		    setVehicleDoorState(source,2,1)
		    setVehicleDoorState(source,2,0)
		end
	elseif seat==1 then
		if (getVehicleDoorState(source,3)==0) then
		    setVehicleDoorState(source,3,1)
		    setVehicleDoorState(source,3,0)
		end
	else
--		if (getVehicleDoorState(source,4)==0) then
		    setVehicleDoorState(source,4,1)
		    setVehicleDoorState(source,4,0)
--		end
--		if (getVehicleDoorState(source,5)==0) then
		    setVehicleDoorState(source,5,1)
		    setVehicleDoorState(source,5,0)
--		end

	end
end)

addEventHandler("onPlayerQuit", root, function()
	if not getElementData(source,"player:job") then return end
	local veh=getPedOccupiedVehicle(source)
	if not veh then return end
	local id=getElementData(veh,"vehicle:id")
	if not id then
	if getElementData(source,"player:job") == "Sweepers" then return end
	triggerEvent("destroyVehicle", root, veh)
	end
end)


--[[
function streamIn( element, forpl )
   element = element or source
   if ( not getVehicleOccupant(element, 0) and not getVehicleOccupant( element, 1 ) and not getVehicleOccupant( element, 2 ) and not getVehicleOccupant( element, 3 ) and not getVehicleOccupant( element, 4 ) ) then
	  local towed = getVehicleTowedByVehicle(element)
	  if towed then
		triggerClientEvent( forpl, "setElementPosForPl", forpl, element, towed ) 
	  else
		triggerClientEvent( forpl, "setElementPosForPl", forpl, element, false ) 
	  end
   else
	  local tower = getVehicleTowingVehicle(element)
	  if tower then
		triggerClientEvent( forpl, "setElementPosForPl", forpl, tower, element ) 
	  else
		triggerClientEvent( forpl, "setElementPosForPl", forpl, element, false ) 
	  end
	end
end
addEvent( "streamIn", true )

addEventHandler( "streamIn", getRootElement(), streamIn )

]]--
 
