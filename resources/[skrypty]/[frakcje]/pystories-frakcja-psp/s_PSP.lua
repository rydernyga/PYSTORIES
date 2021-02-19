--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

createBlip(-2110.86, -19.67, 45.20, 20,2,0,0,0,0,0,275) 


local t=createElement("text")
setElementData(t,"name", "! Wyposażenie PSP !")
setElementPosition(t,-2125.86, -21.86, 45.20)
setElementDimension(t, 0)
setElementInterior(t, 0)

local myMarker = createMarker(-2125.86, -21.86, 45.20-1, "cylinder", 1.5, 0, 69, 69, 250) -- create myMarker
 
function MarkerHit( hitElement, matchingDimension ) -- define MarkerHit function for the handler
	if getElementData(hitElement,"player:faction") == "PSP" then
		outputChatBox("* Wziąłeś(aś) gaśnice!", hitElement)
		giveWeapon(hitElement, 42, 9999999)
	else
		outputChatBox ("* Nie jesteś na służbie, lub nie pracujesz w Straży Pożarnej.", hitElement)
	end
end
addEventHandler( "onMarkerHit", myMarker, MarkerHit )

addEvent("onFireExtinguished",true)
addEventHandler("onFireExtinguished",root,function(plr)
local money = math.random(1,200)
outputChatBox("* Zgasiłeś(aś) pożar dostajesz "..money.." PLN.",plr)
givePlayerMoney(plr,money)
end)