--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

function RGBToHex(red, green, blue, alpha)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
		return nil
	end
	if(alpha) then
		return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
	else
		return string.format("#%.2X%.2X%.2X", red,green,blue)
	end
end

local licz = {}
local marker=createMarker(-1301.04, 321.94, 1151.43-0.9, 'cylinder', 1.2, 255, 255, 0, 150)
setElementDimension(marker, 0)
setElementInterior(marker, 0)

local t=createElement('text')
setElementData(t, "scale", 1.0)
setElementData(t,'name','Służba\nTransport San Andreas\n[TSA]')
setElementDimension(t, 0)
setElementInterior(t, 0)
setElementPosition(t,-1301.04, 321.94, 1151.43)


local blip = createBlip(-1522.18,461.65,7.19,60,2,0,0,0,0,0,275)


function isPlayerInTaxiFaction(plr)
	local sid=getElementData(plr,'player:sid')
	if not sid then return end

	local result=exports['pystories-db']:dbGet('SELECT 1 FROM pystories_factions WHERE code=? AND sid=? LIMIT 1;', "TSA", sid)
	if result[1] then
		return true
	else
		return false
	end
end



addEventHandler('onMarkerHit', marker, function(el,md)
 if isPlayerInTaxiFaction(el) then
  if not getElementData(el,'player:faction') then
	exports['pystories-frakcja-ustawienia']:rozpocznijnaliczanie(el)
   setElementData(el,'player:faction','TSA')
	local rank = exports['pystories-frakcja-ustawienia']:getPlayerFactionRank(el,'TSA')
	setElementData(el,"player:rank",rank)
	--giveWeapon(el,23,9999)
	--giveWeapon(el,22,9999)
	setElementData(el,"last:nick",getPlayerName(el))
	setElementData(el,"last:color",tostring(getPlayerNametagColor(el)))
	setPlayerName(el,"#ffff00"..getPlayerName(el):gsub("#%x%x%x%x%x%x",""))
	outputChatBox("* Rozpocząłeś(aś) służbe w TSA.", el)
  else
  -- takeWeapon(el,23)
   --takeWeapon(el,22)
	exports['pystories-frakcja-ustawienia']:zatrzymajnaliczanie(el)
   setElementData(el, 'player:faction', false)
	setElementData(el,"player:rank",false)
   local skin=getElementData(el,"player:skin")
   setElementModel(el, skin)
   setPlayerName(el,getElementData(el,"last:nick"))
   setElementData(el,"last:nick",getPlayerName(el))
   setElementData(el,"last:color",tostring(getPlayerNametagColor(el)))
   outputChatBox("* Zakończyłeś(aś) służbe w TSA.", el)
  end
 else
  outputChatBox('* Nie jesteś zatrudniony(a) jako taksówkarz.', el, 255, 0, 0)
 end
end)

function naliczanie(el)
	if isElement(el) then
   local x = getElementData(el,"player:workinjob") or 0
   setElementData(el,"player:workinjob",x+1)
   else
	if isTimer(licz[el]) then
	killTimer(licz[el])
	licz[el] = nil
	end
   end
end

local t=createElement("text")
setElementData(t,"scale",1.0)
setElementData(t,"name","Wejście\nTSA")
setElementInterior(t,0)
setElementDimension(t,0)
setElementPosition(t,-1522.18,461.65,7.19)

local t=createElement("text")
setElementData(t,"scale",1.0)
setElementData(t,"name","Wyjście\nTSA")
setElementInterior(t,0)
setElementDimension(t,0)
setElementPosition(t,-1269.41, 366.82, 1151.43)


createObject(1498,-1523,461.32,6.2,0,0,0)
wejscie = createMarker (-1522.18,461.65,7.19+0.6, "arrow", 1.0, 255, 255, 0,0)
wyjscie = createMarker (-1269.41, 366.82, 1151.43+0.6, "arrow", 1.0, 255, 255, 0,255)
setElementDimension(wyjscie, 0)
setElementInterior(wyjscie, 0)
setElementDimension(wejscie, 0)
setElementInterior(wejscie, 0)

addEventHandler("onMarkerHit", wejscie, function(el, md)
	if getElementType(el) ~= "player" then return end
    if isPedInVehicle(el) then return end
    setElementDimension(el, 0)
    setElementInterior(el, 0)
    setElementPosition(el, -1271.49, 365.67, 1151.43)
end)

addEventHandler("onMarkerHit", wyjscie, function(el, md)
	if getElementType(el) ~= "player" then return end
    if isPedInVehicle(el) then return end
    setElementDimension(el, 0)
    setElementInterior(el, 0)
    setElementPosition(el, -1520.66,464.29,7.19)
end)





--wejscie2 = createMarker (1139.35, -1762.12, 13.60+0.6, "arrow", 1.0, 0, 0, 255,0)
--wyjscie2 = createMarker (1159.66, -1783.53, 33.63+0.6, "arrow", 1.0, 0, 0, 255,255)
setElementDimension(wyjscie, 0)
setElementInterior(wyjscie, 0)
setElementDimension(wejscie, 0)
setElementInterior(wejscie, 0)

addEventHandler("onMarkerHit", wejscie2, function(el, md)
	if getElementType(el) ~= "player" then return end
    if isPedInVehicle(el) then return end
    setElementDimension(el, 0)
    setElementInterior(el, 0)
    setElementPosition(el, 1159.95, -1785.75, 33.63)
end)

addEventHandler("onMarkerHit", wyjscie2, function(el, md)
	if getElementType(el) ~= "player" then return end
    if isPedInVehicle(el) then return end
    setElementDimension(el, 0)
    setElementInterior(el, 0)
    setElementPosition(el, 1139.60, -1758.71, 13.59)
end)
