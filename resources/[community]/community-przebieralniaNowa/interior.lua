-- Przebieralnia Fort Carson
local m = createMarker(-1882.27, 866.52, 35.17+1, "arrow", 1.5, 255, 255, 10, 100)
local b = createBlipAttachedTo(m, 45, 2, 255,0,0,255,0,475)

-- Wyjście z przebieralni Fort Carson
local m2 = createMarker(207.65, -111.27, 1005.80+0.5, "arrow", 1.5, 255, 255, 10, 1000)
setElementInterior(m2, 15)
setElementDimension(m2, 3)

addEventHandler("onMarkerHit", m, function(el,md)
	if isPedInVehicle(el) then return end
    fadeCamera(el ,false)
	setElementFrozen(el, true)
	setTimer(function ()
	outputChatBox( "* Wszedłeś(aś) do Przebieralnii.", el)
    setElementInterior(el, 15)
	setElementDimension(el, 3)
	setElementPosition(el, 207.737991,-109.019996,1005.132812)
	setElementFrozen(el, false)
	showPlayerHudComponent(el, "radar", false)
	fadeCamera(el, true)
	end, 1500, 1)
end)

addEventHandler("onMarkerHit", m2, function(el,md)
	if isPedInVehicle(el) then return end
    fadeCamera(el ,false)
	setElementFrozen(el, true)
	setTimer(function ()
	outputChatBox("* Wyszedłeś(aś) z Przebieralnii.", el)
    setElementInterior(el, 0)
	setElementDimension(el, 0)
	setElementPosition(el, -1885.78, 863.03, 35.17)
	setElementFrozen(el, false)
	showPlayerHudComponent(el, "radar", true)
	fadeCamera(el, true)
	end, 1500, 1)
end)

-- Coś innego
addEvent("changeSkin", true)
addEventHandler("changeSkin", root, function(model)
	--setElementModel(source, model)
	--setElementData(source, "gracz_ubranie", model)
	setElementModel(source, model)
	local uid=getElementData(source,"player:sid")
	local query=exports["pystories-db"]:dbSet("UPDATE pystories_users SET skin=? WHERE id=?", model, uid)
	setElementData(source, "player:skin", model)
end)