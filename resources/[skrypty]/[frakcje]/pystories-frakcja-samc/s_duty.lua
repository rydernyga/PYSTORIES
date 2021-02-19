--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local marker=createMarker(3940.48, -1183.77, 8.37-0.9, 'cylinder', 1.5, 255, 0, 0)
setElementDimension(marker, 0)
setElementInterior(marker, 1)

local t=createElement('text')
setElementData(t,'name','Służba\nSan Andreas Medical Center\n[SAMC]')
setElementDimension(t, 0)
setElementInterior(t, 1)
setElementPosition(t,3940.48, -1183.77, 8.37)





local licz = {}


function isPlayerInFaction(plr)
	local sid=getElementData(plr,'player:sid')
	if not sid then return end

	local result=exports['pystories-db']:dbGet('SELECT 1 FROM pystories_factions WHERE code=? AND sid=? LIMIT 1;', "SAMC", sid)
	if result[1] then
		return true
	else
		return false
	end
end

addEventHandler('onMarkerHit', marker, function(el,md)
	if isPlayerInFaction(el) then
		if not getElementData(el,'player:duty') then
			setElementModel(el,274)
			exports['pystories-frakcja-ustawienia']:rozpocznijnaliczanie(el)
			setElementData(el,'player:faction','SAMC')
			local rank = exports['pystories-frakcja-ustawienia']:getPlayerFactionRank(el,'SAMC')
			setElementData(el,"player:rank",rank)
		else
			exports['pystories-frakcja-ustawienia']:zatrzymajnaliczanie(el)
			takeWeapon(el,41)
			setElementData(el, 'player:faction', false)
	       setElementData(el,"player:rank",false)
           local skin=getElementData(el,"player:skin")
           setElementModel(el, skin)
             setPlayerName(el,getElementData(el,"last:nick"))
           setElementData(el,"last:nick",getPlayerName(el))
           setElementData(el,"last:color",tostring(getPlayerNametagColor(el)))
			--setPlayerNametagColor(el,false)
		end
	else
		outputChatBox('Nie jesteś zatrudniony jako SAMC.', el, 255, 0, 0)
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

