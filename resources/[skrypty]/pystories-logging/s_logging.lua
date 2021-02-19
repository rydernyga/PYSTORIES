--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

addEvent("logging:checkAccount", true)
addEventHandler("logging:checkAccount", resourceRoot, function(login,pass)
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_users WHERE login=?", login)
	if result and #result > 0 then
		if result[1].login == login and result[1].pass == teaEncode(pass,"realm") then
			for i,player in pairs(getElementsByType("player")) do
				if getElementData(player,"player:sid") == result[1].id then
				triggerClientEvent(client, "logging:result", resourceRoot, false, "Podany login już gra.","blad")
				return
			end
			end
			--local result2=exports['ogrpg-db']:dbGet("SELECT login2 from ogrpg_users where id=?",result[1].id)
			if not result[1].login2 == false then
			setPlayerName(client, result[1].login2)
			outputChatBox("* Użyłeś komendy na zmiane nicku, twój nick zmieniono na: "..result[1].login2.."", client, 255, 255, 255)
			else
			setPlayerName(client, login)
			end
			setElementData(client, "player:sid", result[1].id)
			triggerClientEvent(client, "logging:result", resourceRoot, true, "Zalogowano pomyślnie.","git")
			triggerEvent("SprawdzDom",root,client)
			if result[1].register_serial == false then
			local query=exports["pystories-db"]:dbSet("UPDATE pystories_users SET register_serial=? WHERE login=?",getPlayerSerial(client),login)
			end
			local logs=exports["pystories-db"]:dbSet("INSERT INTO pystories_logs_login (name,serial,data) VALUES (?,?,NOW())", string.format(login.."("..result[1].id..")"),getPlayerSerial(client))
		else
			triggerClientEvent(client, "logging:result", resourceRoot, false, "Podane dane są nie prawidłowe.","blad")
		end
	else
		triggerClientEvent(client, "logging:result", resourceRoot, false, "Podany login już istnieje w bazie danych. Wymyśl inny.","blad")
	end
end)
local maks_ilosc_kont = 2 -- Maksymalna ilosc kont do rejestracji
addEvent("logging:newAccount", true)
addEventHandler("logging:newAccount", resourceRoot, function(login,pass)
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_users WHERE register_serial=?", getPlayerSerial(client))
	if result and #result >= maks_ilosc_kont then
		triggerClientEvent(client, "logging:result", resourceRoot, false, "Osiągnąłeś już limit kont.","blad")
	return end
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_users WHERE login=?", login)
	if result and #result > 0 then
		triggerClientEvent(client, "logging:result", resourceRoot, false, "Podany login już istnieje w bazie danych. Wymyśl inny.","blad")
	else
		local query=exports["pystories-db"]:dbSet("INSERT INTO pystories_users (login,pass,register_serial,changedpw) VALUES (?,?,?,??)", login, teaEncode(pass,"realm"),getPlayerSerial(client),1)
		if query then
			triggerClientEvent(client, "logging:result", resourceRoot, false, "Pomyślnie zarejestrowałeś(aś) się","git")
			setElementData(client, "player:logged", true)
		end
	end
end)

