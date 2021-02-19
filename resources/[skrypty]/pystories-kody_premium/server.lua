--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

function getPremiumDate(plr)
	local queryA=exports['pystories-db']:dbGet("SELECT * FROM pystories_users WHERE id=? AND premiumdate>NOW() LIMIT 1", getElementData(plr,"player:sid"))
	if (queryA and #queryA > 0) then
		return queryA[1].premiumdate
	end
	return false
end

function setPremiumDay(plr,days)
	if getPremiumDate(plr) then
	local queryA=exports['pystories-db']:dbSet(string.format("UPDATE pystories_users SET premiumdate = DATE(premiumdate) + INTERVAL %d DAY WHERE id=%d",days,getElementData(plr,"player:sid")))
	return end
	local queryA=exports['pystories-db']:dbSet(string.format("UPDATE pystories_users SET premiumdate = DATE(curdate()) + INTERVAL %d DAY WHERE id=%d",days,getElementData(plr,"player:sid")))
end

function dodajkod(plr,cmd,ile,...)
	if exports['pystories-admin']:getAdmin(plr,4) then
	local kod=table.concat({...}, ' ')
	if not ... or not tonumber(ile) then outputChatBox("* Użycie: /qkx.kod-create <czas(dni)> <kod>", plr, 255, 255, 255) return end
	if string.len(kod) < 5 then outputChatBox("* Kod musi zawierać minimum 5 znaków !", plr, 255, 255, 255) return end
	if string.len(kod) > 30 then outputChatBox("* Kod nie może zawierać więcej niż 30 znaków !", plr, 255, 255, 255) return end
	if tonumber(ile) > 30 then outputChatBox("* Ilość dni nie może wynosić więcej niż 30.", plr, 255, 255, 255) return end
	local query=string.format("SELECT * FROM kody WHERE kod=%q LIMIT 1", kod)
	local result=exports["DB2"]:pobierzWyniki(query)
	if (result) then outputChatBox("* Taki kod jest już w bazie danych.", plr, 255, 255, 255) return end
	outputChatBox("* Informacje dotyczące dodanego kodu.", plr, 255, 255, 255)
	outputChatBox("* Ilość dni: "..ile..".", plr, 255, 255, 255)
	outputChatBox("* Kod: "..kod..".", plr, 255, 255, 255)
	outputChatBox("* Trwa przetwarzanie informacji..", plr, 255, 255, 255)
	setTimer ( function()
	outputChatBox("* Gotowe, kod został dodany do bazy danych.", plr, 255, 255, 255)
	exports["pystories-db"]:dbSet("INSERT INTO kody (dni,kod,uzyty) VALUES (?,?,?)", ile, kod, "NIE")
	end, 1000, 1 )
	end
end
addCommandHandler("qkx.kod-create", dodajkod)

function aktywujkod(plr,cmd,...)
local kod=table.concat({...}, ' ')
if not ... then outputChatBox("* Użycie: /aktywuj.kod <kod>", plr, 255, 255, 255) return end
local query=string.format("SELECT * FROM kody WHERE kod=%q LIMIT 1", kod)
local result=exports["DB2"]:pobierzWyniki(query)
if not (result) then outputChatBox("* Taki kod nie istnieje !", plr, 255, 255, 255) return end
if result["uzyty"]~="NIE" then outputChatBox("* Ten kod został użyty przez gracza o SID: "..result["aktywowaluid"]..".", plr, 255, 255, 255) return end
outputChatBox("* Trwa aktywacja kodu premium..", plr, 255, 255, 255)
exports['pystories-db']:dbSet("UPDATE kody SET uzyty=?, aktywowaluid=? WHERE kod=?", "TAK", getElementData(plr, "player:sid"), kod)
setTimer ( function()
triggerEvent("save:player",root,plr)
triggerEvent("load:player",root,plr)
setElementData(plr,"player:premium",true)
outputChatBox("* Aktywowano konto premium na okres: "..result["dni"].." dni.", plr, 255, 255, 255)
setPremiumDay(plr,result["dni"])
end, 1000, 1)
end
addCommandHandler("aktywuj.kod", aktywujkod)