--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

wejscie = createMarker (-1722.64,200.85,3.55+1, "arrow", 1.5, 255, 255, 0)
wyjscie = createMarker (-1720.38,188.68,32.99+1, "arrow", 1.5, 255, 255, 0)
setElementDimension(wyjscie, 0)
createBlip(-1708.28,189.06,32.99, 46,2,0,0,0,0,0,275) 
addEventHandler("onMarkerHit", wejscie, function(el, md)
    if isPedInVehicle(el) then return end
    setElementDimension(el, 0)
    setElementPosition(el, -1712.17,188.46,32.99)
end)

addEventHandler("onMarkerHit", wyjscie, function(el, md)
    if isPedInVehicle(el) then return end
    setElementDimension(el, 0)
    setElementPosition(el, -1729.55,199.88,3.55)
end)