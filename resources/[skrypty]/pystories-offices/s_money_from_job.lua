--[[
Developed by Yolos 
All rights reserved!
You cannot use this without permission!
--]]
local Frakcje = {     ----- ILOSC PLNOW ZA 1 PRZEPRACOWANA MINUTE!!!!!!!!!!!!!!!!!!
["SAPD"] = 200,
["PSP"] = 300,
["SAMC"] = 250,
["ASA"] = 75,
["TSA"] = 75,
}




local marker=createMarker(358.61, 182.73, 1008.38-1, "cylinder", 1.2, 255, 255, 0)
setElementInterior(marker,3)
setElementDimension(marker,1)
local text=createElement('text')
setElementPosition(text,358.61, 182.73, 1008.38)
setElementData(text,"name","Tutaj odbierzesz wypłate z frakcji!")
setElementInterior(text,3)
setElementDimension(text,1)

addEventHandler("onMarkerHit", marker, function(el,md)
	local sid = getElementData(el,"player:sid")
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_factions WHERE sid=?", sid)
	if #result > 0 then
		if Frakcje[result[1].code] then
			if getElementData(el,"player:workinjob") and getElementData(el,"player:workinjob") >= 1 then
				local money = (Frakcje[result[1].code] * getElementData(el,"player:workinjob"))
				outputChatBox("* Otrzymujesz "..money.."  PLN za przepracowanych "..getElementData(el,"player:workinjob").." minut!",el)
				givePlayerMoney(el,money)
				setElementData(el,"player:workinjob",0)
			else
				outputChatBox("* Nie masz nic do odebrania!",el)
			end
		else
			outputChatBox("* Nie jesteś w frakcji, która może odbierać wypłaty!",el)
		end
	end
end)