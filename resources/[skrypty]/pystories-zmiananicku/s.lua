--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

miz=3
maz=22
cena=0
function cmd(plr,cmd,nick)
if getElementData(plr,"player:sid") then
if not nick then outputChatBox("* Użycie: /zmiennick <nowy pseudonim>", plr, 255, 255, 255) return end
if getPlayerMoney(plr) < cena then outputChatBox("* Aby zmienić pseudonim musisz posiadać "..cena.." PLN!",plr,255,255,255) return end
if string.len(nick) < miz then outputChatBox("* Nick musi zawierać minimum "..miz.." znaki!",plr,255,255,255) return end
if string.len(nick) > maz then outputChatBox("* Nick może zawierać maksymalnie "..maz.." znaków!",plr,255,255,255) return end
if getElementData(plr, "player:faction") == "SAPD" or getElementData(plr, "player:faction") == "PSP" or getElementData(plr, "player:faction") == "TAXI" or getElementData(plr, "player:faction") == "TSA" or getElementData(plr, "player:faction") == "SAFD" or getElementData(plr, "player:faction") == "SAMA" or getElementData(plr, "player:faction") == "SAMC" then outputChatBox("* Nie możesz być na duty frakcji !", plr, 255, 255, 255) return end
local sel=exports["pystories-db"]:dbGet("SELECT * FROM pystories_users WHERE login=?", nick)
if sel and #sel > 0 then outputChatBox("* Ktoś już ma taki login!", plr,255,255,255) return end
outputChatBox("* Informacje dot. nowego pseudonimu",plr,255,255,255)
outputChatBox("* Nowy nick: "..nick.."", plr,255,255,255)
outputChatBox("* Aby zmienić nick wpisz /zmieniam",plr,255,255,255)
addCommandHandler("zmieniam",akceptuj)
setElementData(plr,"nowy:nick",nick)
end
end
addCommandHandler("zmiennick", cmd)

function akceptuj(plr)
if getPlayerMoney(plr) < cena then outputChatBox("* Aby zmienić pseudonim musisz posiadać "..cena.." PLN!",plr,255,255,255) return end
if getElementData(plr, "nowy:nick") == false or not getElementData(plr, "nowy:nick") then outputChatBox("* Errrror! #502",plr,255,255,255) return end
takePlayerMoney(plr, cena)
exports['pystories-db']:dbSet("UPDATE pystories_users set login2=? where id=?",getElementData(plr, "nowy:nick"),getElementData(plr,"player:sid"))
removeCommandHandler("zmieniam")
outputChatBox("* Twój nowy pseudonim to "..getElementData(plr, "nowy:nick")..", pamiętaj że to nie jest twój login!", plr, 255, 255,255)
local sel=exports["pystories-db"]:dbGet("SELECT * FROM pystories_users WHERE login=?", getPlayerName(plr):gsub("#%x%x%x%x%x%x",""))
exports["pystories-db"]:dbSet("INSERT INTO pseudonim (prawdziwylogin,login,zmienilna,kiedy) VALUES (?,?,?,NOW())",sel[1].login,getPlayerName(plr):gsub("#%x%x%x%x%x%x",""),getElementData(plr, "nowy:nick"))
setPlayerName(plr,getElementData(plr, "nowy:nick"))
removeElementData(plr,"nowy:nick")
end
