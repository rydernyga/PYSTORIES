--[[
	Developers: Yolos And Spli
]]

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
		if not getElementData(el,'player:faction') then
			--setElementModel(el,274)
			exports['pystories-frakcja-ustawienia']:rozpocznijnaliczanie(el)
			setElementData(el,'player:faction','SAMC')
			local rank = exports['pystories-frakcja-ustawienia']:getPlayerFactionRank(el,'SAMC')
			setElementData(el,"player:rank",rank)
			setElementData(el,"last:nick",getPlayerName(el))
			setElementData(el,"last:color",tostring(getPlayerNametagColor(el)))
			setPlayerName(el,"#00CBFF"..getPlayerName(el):gsub("#%x%x%x%x%x%x",""))
			outputChatBox("* Rozpocząłeś(aś) służbe w Pogotowiu Ratunkowym, udaj się do przebieralni aby zmienić skina!", el)
		else
			exports['pystories-frakcja-ustawienia']:zatrzymajnaliczanie(el)
			takeWeapon(el,41)
			setElementData(el, 'player:faction', false)
			setElementData(el,"player:rank",false)
			local skin=getElementData(el,"player:skin")
			setElementModel(el, skin)
			setPlayerName(el,getElementData(el,"last:nick"))
			outputChatBox("* Zakończyłeś(aś) służbe w Pogotowiu Ratunkowym.", el)
		end
	else
		outputChatBox('* Nie jesteś zatrudniony(a) jako Ratownik Medyczny.', el, 255, 0, 0)
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

