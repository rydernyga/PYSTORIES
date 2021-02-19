--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

function refreshgui(element)
	local uid=getElementData(element,"player:sid")
	if not uid then return end
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_vehicles WHERE ownedPlayer=?", uid)
	triggerClientEvent(element, "org:refresh", resourceRoot, result)
end

addEvent("org:check", true)
addEventHandler("org:check", resourceRoot, function(id,name)
	-- Pobieramy SID gracza
	local uid=getElementData(client,"player:sid")
	if not uid then return end
	-- Sprawdzamy czy jest jeszcze właścicielem
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_vehicles WHERE id=? AND ownedPlayer=?", id, uid)
	if #result < 0 then 
		outputChatBox("* Nie jesteś właścicielem pojazdu.", client, 255, 0, 0)
		return
	end
	local org = getElementData(client,"player:organization")
	if not org then outputChatBox("* Nie jesteś w organizacji !",client,255,0,0) return end
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_vehicles WHERE id=? AND parking=0", id, org)
	if #result > 0 then 
		outputChatBox("* Pojazd nie jest w przechowalni !.", client, 255, 0, 0)
		return
	end
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_vehicles WHERE id=? AND ownedPlayer=?", id, uid)
	if #result > 0 then 
		if result[1].ownedGroup ~= "0" then 
			local query=exports["pystories-db"]:dbSet("UPDATE pystories_vehicles SET ownedGroup=0 WHERE id=? AND ownedPlayer=?", id, uid)
			outputChatBox("* Zmieniłeś(aś) pojazdowi "..name.."("..id..") przypis na siebie", client)
			refreshgui(client)
			return
		end
	local query=exports["pystories-db"]:dbSet("UPDATE pystories_vehicles SET ownedGroup=? WHERE id=? AND ownedPlayer=?", org, id, uid)
	if query then
		outputChatBox("* Zmieniłeś(aś) pojazdowi "..name.."("..id..") przypis na organizacje", client)
		refreshgui(client)
	end
	end
end)

addEvent("org:download", true)
addEventHandler("org:download", resourceRoot, refreshgui)