--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

-- Add a new event called onSpecialEvent
addEvent ( "change:password", true )
 
-- Define our handler function, that takes a "text" parameter and outputs it to the chatbox
function specialEventHandler ( text,text2,text3 )
	if not text then outputChatBox("* Nie podałeś(aś) hasła !",client) return end
	if not text2 then outputChatBox("* Nie podałeś(aś) hasła !",client) return end
	if not text3 then outputChatBox("* Nie podałeś(aś) hasła !",client) return end
	if text == text3 then outputChatBox("* Podałeś(aś) takie same hasło !",client) return end
	if text2 ~= text3 then outputChatBox("* Nowe hasła nie są takie same !",client) return end
	local sid = getElementData(client,"player:sid")
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_users WHERE id=?", sid)
	if result and #result > 0 then
		if result[1].id == sid and teaDecode(result[1].pass ,"realm") == text3 then outputChatBox("* Podałeś(aś) takie same hasło !",client) return end
		--if (result[1].id == sid and result[1].pass ~= teaEncode(text,"realm")) then outputChatBox("*Podales bledne~aktualne haslo do zmiany!",client) end
		local query=exports["pystories-db"]:dbSet("UPDATE pystories_users SET pass=? WHERE id=?",teaEncode(text3,"realm"),sid)
		local query=exports["pystories-db"]:dbSet("UPDATE pystories_users SET changedpw=1 WHERE id=?",sid)
		kickPlayer(client,"Zmieniono haslo!")
	else
		outputChatBox("* Wystąpił błąd poinformuj admina!! #BŁĄD 69",client)
	end
end
 
-- Add it as a handler for our event
addEventHandler ( "change:password", getRootElement(), specialEventHandler )