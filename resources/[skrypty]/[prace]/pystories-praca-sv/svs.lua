--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local b=createElement("text")
setElementData(b,"name","PRACA: Kierowca Street-View\nZAROBEK:\nOD 75PLN-150PLN\nOPIS: Identyfikowanie mapy")
setElementPosition(b,-1990.74, 957.88, 45.45)


local zone = createColSphere(-1986.58, 955.03, 45.54,3 )
createBlip(-1984.40, 953.92, 45.45, 46,2,0,0,0,0,0,275)
local m1 = createMarker(-1990.74, 957.88, 45.45-1, "cylinder", 1.5, 35, 142, 35)
vehs = {}
local code = "StreetView"
veh_obj = {}

function removePreviousVehicles(plr)
    for i,v in ipairs(getElementsByType("vehicle", resourceRoot)) do
        local sby = getElementData(v, "zrespilGracz")
        if sby and sby == plr and getPedOccupiedVehicle(plr) ~= v then
            destroyElement(v)
        end
    end
end


addEventHandler("onMarkerHit", m1, function(el, md)
    if getElementData(el, "vehicle_job_owner2") then
        outputChatBox("Wystąpił błąd #6969, zgłoś się do CEO!", el)
        return
    end

    if not md or getElementType(el) ~= "player" or getPedOccupiedVehicle(el) then return end
    if getElementData(el,"player:job") then return end
	if #getElementsWithinColShape(zone,"vehicle") >= 1 then outputChatBox("*Parking zajęty czekaj aż wyjedzie!",el) return end
    local x,y,z = getElementPosition(el)
    local bus = createVehicle(400, -1986.58, 955.03, 45.54, 360.0, 0.0, 179.3)
	setElementFrozen(el,true)
    setElementData(bus, "vehicle_job_owner2", el)
    setElementData(bus, "vehicle:fuel", 100000)
    setElementData(bus, "vehicle:mileage", math.random(50000,80000))
    setVehicleHandling(bus, "maxVelocity", 80.0)
	setElementData(el,"player:job",code)
   setTimer(warpPedIntoVehicle,200,1,el,bus)
	toggleControl(el,"enter_exit",false)
	 setTimer(toggleControl,2000,1,el, "enter_exit",true)
    setTimer(setElementFrozen,2000,1,el, false)
    triggerClientEvent(el, "STARTJobBus", resourceRoot, bus)

    vehs[el] = bus
	veh_obj[bus] = createObject(3031,0,0,0)
	attachElements(veh_obj[bus],bus,0.3,-0.9,1.6,0,0,90)
 end)

addEvent("STOPJobBus", true)
addEventHandler("STOPJobBus", resourceRoot, function()
    local pojazd = getPedOccupiedVehicle(client)
    if pojazd then
        destroyElement(pojazd)
    end
end)

addEventHandler("onPlayerVehicleExit",resourceRoot,function()
destroyElement(source)
end)

addEvent("destroyVeh", true)
addEventHandler("destroyVeh", getRootElement(),
function()
     if vehs[client] then
          if isElement(vehs[client]) then destroyElement(vehs[client]) end
     end
end)

addEventHandler("onElementDestroy",resourceRoot,function()
  if getElementType(source) == "vehicle" then
	if veh_obj[source] then destroyElement(veh_obj[source]); veh_obj[source] = nil end
  end
end)

addEvent("onPlayerQuit", true)
addEventHandler ( "onPlayerQuit", getRootElement(), function()
     if vehs[source] then
          if isElement(vehs[source]) then destroyElement(vehs[source]) end
    end
end)
