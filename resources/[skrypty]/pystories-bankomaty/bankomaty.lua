--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

addEvent("onPlayerRequestATMInfo", true)
addEventHandler("onPlayerRequestATMInfo", resourceRoot, function()
	local dbid=getElementData(client,"player:sid")
	if not dbid then
		triggerClientEvent(client,"doFillATMInfo", resourceRoot, false)
		return
	end
	local sr=exports["DB2"]:pobierzWyniki("SELECT bank_money FROM pystories_users WHERE id="..(tonumber(dbid) or 0).." LIMIT 1")
	if not sr or not sr.bank_money then
		triggerClientEvent(client,"doFillATMInfo", resourceRoot, false)
		return
	end
	triggerClientEvent(client,"doFillATMInfo", resourceRoot, true, tonumber(sr.bank_money))
end)

addEvent("doATMOperation", true)
addEventHandler("doATMOperation", resourceRoot, function(kwota)
	-- kwota dodatnia - wplata
	-- kwota ujemna - wyplata
	if kwota>0 and kwota>getPlayerMoney(client) then return end -- komunikat bledu po stronie klienta
	local dbid=getElementData(client,"player:sid")
	if not dbid then return end -- nie powinno sie zdarzyc
	if kwota>0 then
		if getPlayerMoney(client)<kwota then return end
		takePlayerMoney(client, kwota)
		exports["DB2"]:zapytanie("UPDATE pystories_users SET bank_money=bank_money+"..(tonumber(kwota) or 0).." WHERE id="..tonumber(dbid).." LIMIT 1")
		--triggerEvent("broadcastCaptionedEvent", client, getPlayerName(client).." wpłaca pieniądze do bankomatu", 3, 20, true)
		outputChatBox("* Wpłaciłeś(aś) pieniądze do bankomatu.", client, 255,0,0)
	elseif kwota<0 then
		local sr=exports["DB2"]:pobierzWyniki("SELECT `bank_money` FROM `pystories_users` WHERE id="..tonumber(dbid).." LIMIT 1")
		if not sr or not sr.bank_money then return end -- nie opwinno sie wydarzyc
		sr.bank_money=tonumber(sr.bank_money)
		if (sr.bank_money<math.abs(kwota)) then
			outputChatBox("* Nie posiadasz tyle środków na koncie !", client, 255,0,0)
--			triggerClientEvent(client,"onAnnouncement3", root, "Nie masz tyle środków na koncie!", 5)
			return
		end
		outputChatBox("* Wypłaciłeś(aś) pieniądze z bankomatu.", client, 255,0,0)
		exports["DB2"]:zapytanie("UPDATE pystories_users SET bank_money=bank_money-"..math.abs(tonumber(kwota)).." WHERE id="..tonumber(dbid).." LIMIT 1")
		givePlayerMoney(client, math.abs(kwota))
	end
	

end)

