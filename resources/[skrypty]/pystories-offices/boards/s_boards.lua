--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

-- Odświeżanie tabeli
function refreshingb(client)
	-- Pobieramy UID gracza
	local sid=getElementData(client,"player:sid")
	if not sid then return end

	-- Pobieramy wyniki
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_vehicles WHERE ownedPlayer=?", sid)
	triggerClientEvent(client, "board:refresh", resourceRoot, result)
end

addEvent("board:new", true)
addEventHandler("board:new", resourceRoot, function(id,name,board,cost)
	-- Pobieramy UID gracza
	local sid=getElementData(client,"player:sid")
	if not sid then return end
	-- Sprawdzamy czy jest jeszcze właścicielem
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_vehicles WHERE id=? AND ownedPlayer=?", id, sid)
	if #result < 0 then 
		outputChatBox("* Nie jesteś właścicielem pojazdu.", client, 255, 0, 0)
		return
	end
	local query=exports["pystories-db"]:dbSet("UPDATE pystories_vehicles SET plateText=? WHERE id=? AND ownedPlayer=?", board, id, sid)
	if query then
		takePlayerMoney(client, cost)
		outputChatBox("* Zmieniłeś(aś) pojazdowi "..name.."("..id..") tablicę rejestracyjną na: "..board, client)
		refreshingb(client)
	end
end)

addEvent("board:download", true)
addEventHandler("board:download", resourceRoot, refreshingb)