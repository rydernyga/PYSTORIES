--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

wejscie = createMarker (-2306.85, -42.31, 35.32+1, "arrow", 1.5, 255, 255, 0)

local zone = createColCuboid(2522.95239, -1307.04248, 1047.28906, 7.297119140625, 26.783203125, 4.700048828125)
local text=createElement("text")
setElementPosition(text,-2131.30, -973.76, 32.03)
setElementData(text,"name","Giełda\nSprzedaż aut.")
addEventHandler("onMarkerHit", wejscie, function(el, md)
    --if getElementType(el)== vehicle then return end
	if isPedInVehicle(el) then return end
    fadeCamera(el ,false)
	setElementFrozen(el, true)
	setTimer(function ()
	setElementDimension(el, 1)
	setElementInterior(el, 2)
    setElementPosition(el, 2526.51, -1304.45, 1048.29)
	setElementFrozen(el, false)
	showPlayerHudComponent(el, "radar", false)
	fadeCamera(el, true)
	end, 1500, 1)
end)

addEventHandler("onColShapeLeave", zone, function(el,md)
	if source~= zone then return end
	fadeCamera(el ,false)
	setElementFrozen(el, true)
	setTimer(function ()
	setElementDimension(el, 0)
	setElementInterior(el, 0)
    setElementPosition(el, -2309.21, -42.29, 35.32)
	setElementFrozen(el, false)
	showPlayerHudComponent(el, "radar", true)
	fadeCamera(el, true)
	end, 1500, 1)
end)