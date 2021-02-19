--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

createBlip(-2431.22, 1028.69, 50.39, 46,2,0,0,0,0,0,275) 
--[[wejscie = createMarker (-2431.22, 1028.69, 50.39+1, "arrow", 1.5, 255, 255, 0)
wyjscie = createMarker (-3030.02, 5552.19, 64.16+1, "arrow", 1.5, 255, 255, 0)
setElementDimension(wyjscie, 0)


addEventHandler("onMarkerHit", wejscie, function(el, md)
    --if getElementType(el)== vehicle then return end
	if isPedInVehicle(el) then return end
	fadeCamera(el ,false)
	setElementFrozen(el, true)
	setTimer(function ()
	outputChatBox( "* Wszedłeś(aś) do Magazynu.", el)
    setElementDimension(el, 0)
    setElementPosition(el, -3030.00, 5546.04, 64.16)
	setElementFrozen(el, false)
	showPlayerHudComponent(el, "radar", false)
	fadeCamera(el, true)
	end, 1500, 1)
end)
addEventHandler("onMarkerHit", wyjscie, function(el, md)
    if getElementType(el)== vehicle then return end
	if isPedInVehicle(el) then return end
    fadeCamera(el ,false)
	setElementFrozen(el, true)
	setTimer(function ()
	outputChatBox("* Wyszedłeś(aś) z Magazynu.", el)
    setElementDimension(el, 0)
    setElementPosition(el, -2431.10, 1032.35, 50.39)
	setElementFrozen(el, false)
	showPlayerHudComponent(el, "radar", true)
	fadeCamera(el, true)
	end, 1500, 1)
end)]]--



wejscie = createMarker (-2431.22, 1028.69, 50.39+1, "arrow", 1.5, 255, 255, 0)
wyjscie = createMarker (-3030.02, 5552.19, 64.16+1, "arrow", 1.5, 255, 255, 0)
setElementDimension(wyjscie, 0)

addEventHandler("onMarkerHit", wejscie, function(el, md)
    if isPedInVehicle(el) then return end
    setElementDimension(el, 0)
    setElementPosition(el, -3030.00, 5546.04, 64.16)
    showPlayerHudComponent(el, "radar", false)
end)

addEventHandler("onMarkerHit", wyjscie, function(el, md)
    if isPedInVehicle(el) then return end
    setElementDimension(el, 0)
    setElementPosition(el, -2431.10, 1032.35, 50.39)
    showPlayerHudComponent(el, "radar", true)
end)