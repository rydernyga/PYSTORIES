--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local marker=createMarker(-2120.02, -42.69, 40.60-1, 'cylinder', 1.5, 0, 0, 255, 150)
setElementDimension(marker, 0)
setElementInterior(marker, 0)

local t=createElement('text')
setElementData(t,'name','Służba\nPaństwowa Straż Pożarna\n[PSP]')
setElementDimension(t, 0)
setElementInterior(t, 0)
setElementPosition(t,-2120.02, -42.69, 40.60)


function isPlayerInFaction(plr)
	local sid=getElementData(plr,'player:sid')
	if not sid then return end

	local result=exports['pystories-db']:dbGet('SELECT 1 FROM pystories_factions WHERE code=? AND sid=? LIMIT 1;', "PSP", sid)
	if result[1] then
		return true
	else
		return false
	end
end
local licz = {}

addEventHandler('onMarkerHit', marker, function(el,md)
	if isPlayerInFaction(el) then
		if not getElementData(el,'player:faction') then
			--setElementModel(el,279)
			--setPlayerNametagColor(el,0,0,255)
			exports['pystories-frakcja-ustawienia']:rozpocznijnaliczanie(el)
			setElementData(el,'player:faction','PSP')
			local rank = exports['pystories-frakcja-ustawienia']:getPlayerFactionRank(el,'PSP')
			setElementData(el,"player:rank",rank)
			setElementData(el,"last:nick",getPlayerName(el))
			setElementData(el,"last:color",tostring(getPlayerNametagColor(el)))
			setPlayerName(el,"#FF6C00"..getPlayerName(el):gsub("#%x%x%x%x%x%x",""))
			outputChatBox("* Rozpocząłeś(aś) służbe w Straży Pożarnej, udaj się do przebieralni aby zmienić skina!", el)
		else
			exports['pystories-frakcja-ustawienia']:zatrzymajnaliczanie(el)
			takeWeapon(el,42)
			removeElementData(el, 'player:faction')
			removeElementData(el,"player:rank")
			local skin=getElementData(el,"player:skin")
			setElementModel(el, skin)
			setPlayerName(el,getElementData(el,"last:nick"))
			outputChatBox("* Zakończyłeś(aś) służbe w Straży Pożarnej.", el)
		end
	else
		outputChatBox('* Nie jesteś zatrudniony(a) jako Strażak.', el, 255, 0, 0)
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
