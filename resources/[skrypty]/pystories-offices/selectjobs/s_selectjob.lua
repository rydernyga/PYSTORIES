--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

-- Odświeżanie tabeli


function getyesterday()
	local realTime=getRealTime()
	date=string.format("%04d-%02d-%02d", realTime.year+1900, realTime.month+1, realTime.monthday-1)
	return date
end

function getday()
	local realTime=getRealTime()
	date=string.format("%04d-%02d-%02d", realTime.year+1900, realTime.month+1, realTime.monthday)
	return date
end

function refreshing(client)
	local result=exports["pystories-db"]:dbGet("SELECT * FROM ogrpg_office")
	if result and #result > 0 then
		triggerClientEvent(client, "jobs:refresh", resourceRoot, result)
	end
end


setTimer(function()
	local result = exports['pystories-db']:dbGet("SELECT * from ogrpg_jobs WHERE actived<NOW() - INTERVAL 1 DAY;")
	if result and #result > 0 then
	for i,v in pairs(result) do
		exports['pystories-db']:dbSet("DELETE FROM ogrpg_jobs WHERE code=? and uid=?? and actived=?",v.code,v.uid,v.actived)
		exports['pystories-db']:dbSet("UPDATE ogrpg_office set spaces=spaces-1 where code=?",v.code)
		outputDebugString("pystories-offices.s_selectjob.lua> Wyczyszczono prace z nieaktywnych osób!")
	end
	end
end, 86400000, 0) -- 86400000 24h 86400000


addEvent("jobs:download", true)
addEventHandler("jobs:download", resourceRoot, refreshing)

addEvent("jobs:hire", true)
addEventHandler("jobs:hire", resourceRoot, function(_,name,code)
	-- Pobieramy UID gracza
	local uid=getElementData(client,"player:sid")
	if not uid then return end
	-- Sprawdzamy czy ktoś istnieje w jakieś frakcji
	local result=exports["pystories-db"]:dbGet("SELECT * FROM ogrpg_jobs WHERE uid=?", uid)
	if #result > 0 then 
		outputChatBox("* Już jesteś w jakieś pracy zatrudniony(a).", client, 255, 0, 0)
		return
	end
	-- Sprawdzamy czy praca ma jakieś wolne miejsca
	local result=exports["pystories-db"]:dbGet("SELECT * FROM ogrpg_office WHERE code=?", code)
	if #result > 0 then
		if result[1].spaces == result[1].maxspaces then
			outputChatBox("* W tej pracy nie ma wolnych miejsc.", client, 255, 0, 0)
			return
		end
	end
	-- Dodajemy gracza do frakcji i następnie odświeżamy wniki dodajemym dodatkowe miejsca itp.
	local query=exports["pystories-db"]:dbSet("INSERT ogrpg_jobs (code,uid) VALUES (?,?)", code, uid)
	if query then
		exports["pystories-db"]:dbSet("UPDATE ogrpg_office SET spaces=spaces+1 WHERE code=?", code)
		outputChatBox("* Otrzymujesz stałą pracę w "..name.."", client)
		refreshing(client)
    end
end)

addEvent("jobs:slow", true)
addEventHandler("jobs:slow", resourceRoot, function(_,name,code)
	-- Pobieramy UID gracza
	local uid=getElementData(client,"player:sid")
	if not uid then return end
	-- Sprawdzamy czy ktoś istnieje w jakieś frakcji
	local result=exports["pystories-db"]:dbGet("SELECT * FROM ogrpg_jobs WHERE uid=?", uid)
	if #result > 0 then
		-- Sprawdzamy czy praca ma jakieś wolne miejsca
		local query=string.format("SELECT * FROM ogrpg_office WHERE code=%q", result[1].code)
		local result2=exports["DB2"]:pobierzWyniki(query)
		if #result2 > 0 then
			if result2["spaces"] == 0 then
				outputChatBox("* Wystąpił błąd, ponieważ nie byłeś zatrudniony?", client, 255, 0, 0)
				return
			end
		end
		-- Usuwamy gracza z frakcji i następnie odświeżamy wniki usuwamy miejsce itp.
		local result3=exports["pystories-db"]:dbSet("DELETE FROM ogrpg_jobs WHERE code=? AND uid=?", result[1].code, uid)
		if query then
			exports["pystories-db"]:dbSet("UPDATE ogrpg_office SET spaces=? WHERE code=?", result2["spaces"]-1, result[1].code)
			outputChatBox("* Zwolniłeś(aś) się ze stałej pracy w "..name, client)
			refreshing(client)
		end
	else
		outputChatBox("* Nie jesteś w żadnej pracy zatrudniony(a).", client, 255, 0, 0)
	end
end )


