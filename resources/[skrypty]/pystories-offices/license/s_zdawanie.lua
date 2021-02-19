--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

--[[local marker2=createMarker(-2050.29,-106.16,35.24,"corona",2,170,200,0)

addEventHandler("onMarkerHit", marker2, function(el,md)
 setElementPosition(el,-2044.69,-94.57,35.17 )
end)--]]

--local zone = createColCuboid(-157.62562561035, 1108.4052734375, 18.613729476929, 7, 9.8, 6.4)

addEvent("license:do",true)
addEventHandler("license:do", resourceRoot, function(cost,selected)
	if tonumber(cost) <= getPlayerMoney(client) then
		takePlayerMoney(client,cost)
	end

	local veh=nil
	--if #getElementsWithinColShape(zone,"vehicle") >= 1 then outputChatBox("* Miejsce respu zajęte, poczekaj aż ktoś wyjedzie.",client) return end
	if selected == "A" then veh=createVehicle(586, -2458.13, -123.61, 25.45, 356.3, 0.1, 90.9)
	elseif selected == "B" then veh=createVehicle(436, -2458.30, -123.22, 25.70, 356.1, 0.1, 90.9)
	elseif selected == "C" then veh=createVehicle(414, -2458.74, -123.69, 26.01, 356.8, 0.2, 90.9)
	elseif selected == "L" then veh=createVehicle(593, 324.69, 2543.67, 17.28, 359.4, 360.0, 179.0) end
	if not veh then return end
	if selected == "L" then
	setElementData(veh,"vehicle:desc","Egzamin Licencji Lotniczej\nKategoria "..selected.."\n! Proszę zachować ostrożność !")
	else
	setElementData(veh,"vehicle:desc","Egzamin Prawa Jazdy\nKategoria "..selected.."\n! Proszę zachować ostrożność !")
	end
	setElementData(veh,"vehicle:mileage",16442)
	setElementData(veh,"vehicle:fuel",100)
	setElementData(veh,"vehicle:lic",true)

	setElementDimension(client,0)
	setElementInterior(client,0)
	showPlayerHudComponent(client, "radar", true)
	warpPedIntoVehicle(client,veh)
	triggerClientEvent(client, "license:start", resourceRoot, selected, veh)
	--outputChatBox("* "..getPlayerName(client).." rozpoczął(ęła) egzamin prawa jazdy, kategoria: "..selected.."", root, 255, 0, 0)
end)

addEvent("license:vehdel", true)
addEventHandler("license:vehdel", resourceRoot, function(veh)
	destroyElement(veh)
end)

addEventHandler("onPlayerQuit", root, function()
	local veh=getPedOccupiedVehicle(source)
	if not veh then return end
	if getVehicleController(veh) ~= source then return end
	if not getElementData(veh,"vehicle:lic") then return end
	destroyElement(veh)
end)

addEventHandler("onVehicleDamage", resourceRoot, function(loss)
	local kierowca=getVehicleController(source)
	if not kierowca then return end
	if not getElementData(source,"vehicle:lic") then return end
	destroyElement(source)
	outputChatBox("* Uszkodziłeś(aś) pojazd, nie zdajesz egzaminu!", kierowca, 255, 0, 0)
	triggerClientEvent(kierowca, "license:finish", resourceRoot, true)
end)

addEventHandler("onVehicleStartExit", resourceRoot, function()
	cancelEvent()
end)

addCommandHandler("lotgp", function(plr,cmd)
	local x,y,z=getElementPosition(plr)
	local p=string.format("{%.02f, %.02f, %.02f},", x,y,z)
	outputChatBox(p, plr)
end)

addCommandHandler("lotgp2", function(plr,cmd)
	local veh=getPedOccupiedVehicle(plr)
	if not veh then return end
	local x,y,z=getElementPosition(veh)
	local rx,ry,rz=getElementRotation(veh)
	local p=string.format("%.02f, %.02f, %.02f, %.02f, %.02f, %.02f", x,y,z,rx,ry,rz)
	outputChatBox(p, plr)
end)