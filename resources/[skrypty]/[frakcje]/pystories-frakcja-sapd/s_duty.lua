--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local marker=createMarker(1538.24, 1598.67, 10.88-1, 'cylinder', 1.5, 0, 0, 255, 150)
setElementDimension(marker, 666)
setElementInterior(marker, 112)


local licz = {}
local t=createElement('text')
setElementData(t,'name','Służba\nSan Andreas Police Department\n[SAPD]')
setElementDimension(t, 666)
setElementInterior(t, 112)
setElementPosition(t,1538.24, 1598.67, 10.88)



function isPlayerInPoliceFaction(plr)
 local sid=getElementData(plr,'player:sid')
 if not sid then return end

 local result=exports['pystories-db']:dbGet('SELECT 1 FROM pystories_factions WHERE code=? AND sid=? LIMIT 1;', "SAPD", sid)
 if result[1] then
  return true
 else
  return false
 end
end

addEventHandler('onMarkerHit', marker, function(el,md)
 if isPlayerInPoliceFaction(el) then
  if not getElementData(el,'player:faction') then
	exports['pystories-frakcja-ustawienia']:rozpocznijnaliczanie(el)
   setElementData(el,'player:faction','SAPD')
	local rank = exports['pystories-frakcja-ustawienia']:getPlayerFactionRank(el,'SAPD')
	setElementData(el,"player:rank",rank)
	--giveWeapon(el,23,9999)
	--giveWeapon(el,22,9999)
	setElementData(el,"last:nick",getPlayerName(el))
	setElementData(el,"last:color",tostring(getPlayerNametagColor(el)))
	setPlayerName(el,"#0000CD"..getPlayerName(el):gsub("#%x%x%x%x%x%x",""))
	outputChatBox("* Rozpocząłeś(aś) służbe w Policji, udaj się do przebieralni aby zmienić skina!", el)
  else
   takeWeapon(el,23)
   --takeWeapon(el,22)
	exports['pystories-frakcja-ustawienia']:zatrzymajnaliczanie(el)
   setElementData(el, 'player:faction', false)
	setElementData(el,"player:rank",false)
   local skin=getElementData(el,"player:skin")
   setElementModel(el, skin)
   setPlayerName(el,getElementData(el,"last:nick"))
   outputChatBox("* Zakończyłeś(aś) służbe w Policji.", el)
  end
 else
  outputChatBox('* Nie jesteś zatrudniony(a) jako Policjant.', el, 255, 0, 0)
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

local bronie2 = createMarker (1568.20, 1577.70, 10.90-1, "cylinder", 1.5, 0, 255, 0, 255 )
setElementDimension(bronie2, 666)
setElementInterior(bronie2, 112)
local t=createElement("text")
setElementData(t,"name", "Wyposażenie Funkcjonariusza")
setElementPosition(t,1568.20, 1577.70, 10.90)
setElementDimension(t, 666)
setElementInterior(t, 112)


function bronie11(hitElement, matchingDimension)
	if source == bronie2 then
		if getElementData(hitElement,"player:faction") == "SAPD" then
		--if getElementData(hitElement,'player:rank') <= 4 then hitElement:outputChat("* Jesteś aktualnie podczas akademii, nie przysługuje Ci wyposażenie!") return end
			outputChatBox("* Wziąłeś(aś) swoje wyposażenie!", hitElement)
			giveWeapon(hitElement, 23, 100000)
		else
			outputChatBox ("* Nie jesteś na służbie, lub nie pracujesz w Policji", hitElement)
		end
	end
end
addEventHandler ("onMarkerHit", bronie2, bronie11)