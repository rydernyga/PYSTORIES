--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

createBlip(-1754.13,962.74,24.88,46,2,255,0,0,255,0,100)

local m1 = createMarker(-1754.13,962.74,24.88-1, "cylinder", 1.5, 35, 142, 35,100)
local t = createElement('text')
setElementPosition(t,-1754.13,962.74,24.88)
setElementData(t,"name","PRACA: Kierowca PKS\nZAROBEK:\nGRACZ od 100PLN do 175 \n PREMIUM zarabia x1.3")
local vehs = {}

local code = "Autobusy"
        local zone = createColSphere( -1751.31,951.90,25.89, 6 )
addEventHandler("onMarkerHit", m1, function(el, md)
    if getElementData(el, "vehicle_job_owner") then
        return
    end
    
    if not md or getElementType(el) ~= "player" or getPedOccupiedVehicle(el) then return end
    if getElementData(el,"player:job") then return end
	if #getElementsWithinColShape(zone,"vehicle") >= 1 then outputChatBox("[#00ff00INFORMACJA#ffffff]Ktoś już zajmuje to miejsce, poczekaj aż odjedzie.",el,255,255,255,true) return end
    local x,y,z = getElementPosition(el)
    local autbus = createVehicle(437, -1751.31,951.90,25.89, 0.00, 0, 270 )
	setElementFrozen(el,true)
	setElementData(autbus,"vehicle:desc","Praca dorywcza\n Kierowca autobusu")
    setElementData(autbus, "vehicle_job_owner", el)
    setElementData(autbus, "vehicle:fuel", 100000)
    setElementData(autbus, "vehicle:mileage", math.random(1000,1233))
    setVehicleHandling(autbus, "maxVelocity", 80.0)
	setElementData(el,"player:job",code)
	--warpPedIntoVehicle( el, autobus)
    setTimer(warpPedIntoVehicle,200,1,el,autbus)
    setTimer(setElementFrozen,1000,1,el, false)
    triggerClientEvent(el, "STARTJobBus", resourceRoot, autbus)

    vehs[el] = autbus
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