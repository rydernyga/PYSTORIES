--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local pointsMarkers={
	{"SAPD", 1, 1538.91, 1609.29, 10.86, 112, 666},
	--{"ASA", 1,	-1419.15,511.89,3.04, 0, 0},
	{"PSP", 1, -2116.90, -1.71, 45.20, 0, 0},
	--{"SAMC", 1, -2705.64, 691.12, 51.23, 0, 0},
	
	
}

for i,v in ipairs(pointsMarkers) do
	local marker=createMarker(v[3], v[4], v[5]-1, "cylinder", 1.2, 255, 0, 0,255)
	setElementData(marker,"marker:id",tonumber(v[2]))
	setElementInterior(marker, v[6])
	setElementDimension(marker, v[7])
	setElementData(marker,"marker:faction",v[1])
	local t=createElement("text")
	setElementPosition(t,v[3],v[4],v[5])
	setElementInterior(t, v[6])
	setElementDimension(t, v[7])
	setElementData(t,"name","Zarządzanie\nFrakcją\n"..v[1])
end

addEvent("lider:editUser", true)
addEventHandler("lider:editUser", resourceRoot, function(text,rank,faction)
	local result1=exports["pystories-db"]:dbGet("SELECT * FROM pystories_users WHERE id=?", text)
	if not result1 or #result1 < 0 then outputChatBox("* Podany użytkownik nie istnieje w bazie danych.", client, 255, 0, 0) return end 
    local result2=exports["pystories-db"]:dbGet("SELECT * FROM pystories_factions WHERE code=? AND sid=? LIMIT 1;", faction, text) -- pobieramy tylko JEDEN rekord
	if not result2 or #result2 < 0 then outputChatBox("*Podany użytkownik nie znajduje się w tej frakcji !",client,255,0,0) return end
	local query1=exports["pystories-db"]:dbSet("UPDATE `pystories_factions` SET `rank`=? WHERE `sid`=? AND `code`=?", rank, text, faction)
	if query1 then
	local resulted=exports["pystories-db"]:dbGet("SELECT * FROM pystories_factions WHERE code=?", faction)
		triggerClientEvent(client,"lider:refresh",resourceRoot,resulted)
		outputChatBox("* Pomyślnie zmieniono rangę graczowi "..result1[1].login.." we frakcji o id: "..faction.." na "..rank, client)
	end
end)
addEvent("lider:addUser", true)
addEventHandler("lider:addUser", resourceRoot, function(text,faction)
	local result1=exports["pystories-db"]:dbGet("SELECT * FROM pystories_users WHERE id=?", text)
	if not result1 or #result1 < 0 then outputChatBox("* Podany użytkownik nie istnieje w bazie danych.", client, 255, 0, 0) return end
	local result2=exports["pystories-db"]:dbGet("SELECT * FROM pystories_factions WHERE sid=? and code=?", text, faction)
	if result2 and #result2 > 0 then outputChatBox("* Podany użytkownik już znajduje się w tej frakcji.", client, 255, 0, 0) return end
	local result3=exports["pystories-db"]:dbGet("SELECT * FROM pystories_factions WHERE sid=?", text)
	if result3 and #result3 > 0 then outputChatBox("* Podany użytkownik już znajduje się w innej frakcji.", client, 255, 0, 0) return end
	outputDebugString("Faction: "..faction)
	outputDebugString("Text: "..text)
	local query1=exports["pystories-db"]:dbSet("INSERT pystories_factions (sid,code) VALUES (?,?)",text, faction)
	if query1 then
	local resulted=exports["pystories-db"]:dbGet("SELECT * FROM pystories_factions WHERE code=?", faction)
		triggerClientEvent(client,"lider:refresh",resourceRoot,resulted)
		outputChatBox("* Pomyślnie dodano gracza "..result1[1].login.." o SID: "..text.." we frakcji na 1 poziom.", client)
	end
end)
addEvent("lider:deleteUser", true)
addEventHandler("lider:deleteUser", resourceRoot, function(text,faction)
	local result1=exports["pystories-db"]:dbGet("SELECT * FROM pystories_users WHERE id=?", text)
	if not result1 or #result1 < 0 then outputChatBox("* Podany użytkownik nie istnieje w bazie danych.", client, 255, 0, 0) return end 
    local result2=exports["pystories-db"]:dbGet("SELECT * FROM pystories_factions WHERE code=? AND sid=? LIMIT 1;", faction, text) -- pobieramy tylko JEDEN rekord
	if not result2 or #result2 < 0 then outputChatBox("* Podany użytkownik nie znajduje się w tej frakcji !",client,255,0,0) return end
	local query1=exports["pystories-db"]:dbSet("DELETE FROM pystories_factions WHERE sid=? AND code=?",text, faction)
	if query1 then
	local resulted=exports["pystories-db"]:dbGet("SELECT * FROM pystories_factions WHERE code=?", faction)
	triggerClientEvent(client,"lider:refresh",resourceRoot,resulted)
		outputChatBox("* Pomyślnie usunieto gracza "..result1[1].login.." o SOD: "..text.." z frakcji." , client)
	end
end)

addEventHandler("onMarkerHit", resourceRoot, function(el,md)
	if not md or getElementType(el) ~= "player" then return end
	local code=getElementData(source,"marker:faction")
	if not code then return end
	local sid=getElementData(el,"player:sid")
	if not sid then return end
	if not getElementData(el,"player:faction") then outputChatBox("* Najpierw wejdź na słuzbe !",el) return end
	if getElementData(el,"player:faction") ~= code then outputChatBox("* Nie jesteś na służbie, lub nie posiadasz uprawnień.",el) return end
    local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_factions WHERE code=? AND sid=? LIMIT 1;", code, sid) -- pobieramy tylko JEDEN rekord
	if result and #result > 0 then
		if result[1].rank ~= 98 then outputChatBox("* Brak uprawnień do panelu lidera !",el) return end
	local resulted=exports["pystories-db"]:dbGet("SELECT * FROM pystories_factions WHERE code=?", code)
		triggerClientEvent(el, "lider:showGUI", resourceRoot,code, resulted)
	end
end)