--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local b=createElement("text")
setElementData(b,"name","PRACA: Drwal\nZAROBEK:\nGRACZ 250PLN | PREMIUM 350PLN\nOPIS: Zbieranie drzew")
setElementPosition(b,300.12, 1141.27, 9.14)

createBlip(300.12, 1141.27, 9.14, 46,2,0,0,0,0,0,275)

local zone = createColCuboid(310.7600402832, 1144.9151611328, 7.1291146278381, 9, 11.7, 7.4)

local m1 = createMarker(300.12, 1141.27, 9.14-1, "cylinder", 1.5, 35, 142, 150)
vehs = {}


function removePreviousVehicles(plr)
    for i,v in ipairs(getElementsByType("vehicle", resourceRoot)) do
        local sby = getElementData(v, "zrespilGracz")
        if sby and sby == plr and getPedOccupiedVehicle(plr) ~= v then
            destroyElement(v)
        end
    end
end

addEventHandler("onMarkerHit", m1, function(el, md)
    if getElementData(el, "zrespilGracz") then
        --outputChatBox("Praca w trakcie przygotowania.", el)
        return
    end
    
    if not md or getElementType(el) ~= "player" or getPedOccupiedVehicle(el) then return end
	if #getElementsWithinColShape(zone,"vehicle") >= 1 then outputChatBox("* Miejsce respu zajęte, poczekaj aż ktoś wyjedzie.",el) return end
    
    local x,y,z = getElementPosition(el)
    local bus = createVehicle(543, 314.92, 1151.88, 8.37+0.8, 0.81, -0.00, 85.51)
 
	setElementData(bus,"vehicle:desc","Praca Drwala\n! Proszę zachować ostrożność !")
    setElementData(bus, "zrespilGracz", el)
    setElementData(bus, "vehicle:fuel", 100)
    setElementData(bus, "vehicle:mileage", math.random(9018,31892))
	setElementData(bus, "blokada:reczny_drwal", true)
	--setVehiclePlateText(bus, " PRACA" )
	setVehicleColor(bus, 0, 100, 0 )
	setVehicleHandling(bus,"maxVelocity", 100.00) -- 40 + 10 = 50km/h
    
    warpPedIntoVehicle(el, bus)
    removePreviousVehicles(el)
    triggerClientEvent(el, "STARTJobBus", resourceRoot, bus)
    --setVehicleHandling(bus,"maxVelocity", 100.00) -- 40 + 10 = 50km/h

    vehs[el] = bus
end)

addEvent("STOPJobBus", true)
addEventHandler("STOPJobBus", resourceRoot, function()
    local pojazd = getPedOccupiedVehicle(localPlayer)
    if pojazd then
        destroyElement(pojazd)
    end
end)

addEvent("destroyVeh", true)
addEventHandler("destroyVeh", getRootElement(),
function()
     if vehs[source] then
          if isElement(vehs[source]) then destroyElement(vehs[source]) end
     end
end)

addEvent("onPlayerQuit", true)
addEventHandler ( "onPlayerQuit", getRootElement(), function()
     if vehs[source] then
          if isElement(vehs[source]) then destroyElement(vehs[source]) end
    end
end)