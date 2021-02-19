--[[
Developed by Yolos 
All rights reserved!
You cannot use this without permission!
--]]
local LIMIT=3 -- tylko gracz może kupić trzy pojazdy

local cmd="rejestruj"
local marker=nil
local timer=nil
local cena=1250
local pozycjeMarkerow={
	-- Opis nad markerem, x,y,z, int, dim
	{"Rejestracja pojazdów \n Koszt: "..cena.."PLN", 358.83, 169.02, 1008.38,3,1 }, -- urzad
}

for i,v in pairs(pozycjeMarkerow) do
	local mkr=createMarker(v[2], v[3], v[4]-1, "cylinder", 1.2, 96, 96, 96, 255)
	setElementDimension(mkr, v[6] or 0)
	setElementInterior(mkr, v[5] or 0)
	setElementData(mkr, "rejestracja:pojazdów", true)
	
	marker = mkr
	
	local t=createElement("text")
	setElementData(t,"name", v[1])
	setElementPosition(t,v[2],v[3],v[4])
	setElementDimension(t, v[6] or 0)
	setElementInterior(t, v[5] or 0)
	addEventHandler ("onMarkerHit", mkr, function(el,md)
	outputChatBox("* Aby zarejestrować pojazd: ", el)
	outputChatBox("* Wpisz /rejestruj <id pojazdu> ", el)
	outputChatBox("* Koszt Rejestracji to 1250 PLN", el)
	setElementData(el, "rejestracja:pojazdow", true)
end)
	addEventHandler ("onMarkerLeave", mkr, function(el,md)
	outputChatBox("* Wyszedłeś(aś) z markera ", el)
	setElementData(el, "rejestracja:pojazdow", false)
end)
end



addCommandHandler(cmd, function(plr,_,id)
	if getElementData(plr, "rejestracja:pojazdow") == false then 
		outputChatBox("* Nie jesteś w miejscu przeznaczonym do tego.", plr, 255, 0, 0)
		return
	end
	id=tonumber(id)
	if not id then
		outputChatBox("* Użycie: /rejestruj <id pojazdu>", plr)
		return
	end
	if getPlayerMoney(plr) < cena then
		outputChatBox("* Nie posiadasz "..cena.." PLN! Potrzebnych do rejestracji pojazdu", plr, 255, 0, 0)
		return
	end
	local result=exports["pystories-db"]:dbGet("SELECT * FROM ogrpg_vehicles WHERE id=? AND parking=0 LIMIT 1;", id)
	if result and #result > 0 then
		outputChatBox("* Wystapil bład #69 zgłoś go ROOT'owi.", plr, 255, 0, 0) -- WYCIAGNIETE AUTO NIE ZAREJESTROWANE WTF???
		return
	end
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_vehicles WHERE id=? AND parking=1 LIMIT 1;", id)
	if result and #result > 0 then
		local v=result[1]
		if v.ownedPlayer ~= getElementData(plr,"player:sid") then
		outputChatBox("* Nie jesteś właścicielem tego pojazdu.", plr, 255, 0, 0)
		return end
		if v.registered == "true" then
		outputChatBox("* Auto jest zarejestrowane.", plr, 255, 0, 0)
		return end
		local query=exports["pystories-db"]:dbSet("UPDATE pystories_vehicles SET registered=? WHERE id=?","true",id)
		if query then
		takePlayerMoney(plr,cena)
		outputChatBox("* Auto zostało pomyślnie zarejestrowane.", plr, 0, 255, 0)
		else
		outputChatBox("* Wystapil blad #96 powiadom ROOT'owi",plr,255,0,0)
		return end
	end
end)

