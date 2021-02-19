--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local oddanie = createMarker(-1886.66, -201.31, 15.22-3,"cylinder",8.5,0,255,0)
local text = createElement('text')
setElementPosition(text,-1886.66, -201.31, 15.22)
setElementData(text,"name","Punkt oddania pojazdów")

createBlip(-1866.75, -207.17, 17.80, 58,2,0,0,0,0,0,275)




addEventHandler("onMarkerHit",oddanie,function(el,md)
if getElementType(el) ~= "player" then return end
local veh = getPedOccupiedVehicle(el)
if not veh then return end
if veh and getElementModel(veh) ~= 525 then return end
local duty = getElementData(el,"player:faction")
if not duty or (duty and duty ~= "SAPD") then return end
local tow = getVehicleTowedByVehicle(veh)
if not tow then return end
triggerClientEvent(el,"glownyparking:refresh",root,tow)
end)
addEventHandler("onMarkerLeave",oddanie,function(el,md)
if getElementType(el) ~= "player" then return end
local veh = getPedOccupiedVehicle(el)
if not veh then return end
if veh and getElementModel(veh) ~= 525 then return end
local duty = getElementData(el,"player:faction")
if not duty or (duty and duty ~= "SAPD") then return end
local tow = getVehicleTowedByVehicle(veh)
if not tow then return end
triggerClientEvent(el,"glownyparking:chowaj",root)
end)



local clicker = {}



addEvent("glownyparking:oddaj",true)
addEventHandler("glownyparking:oddaj",root,function(tabelka)
if not tabelka then return end
if clicker[tabelka[1]] then return end
if tonumber(tabelka[5]) < 200 then outputChatBox("** Minimalna suma to 200 PLN !",client) return end
if tonumber(tabelka[5]) > 15000 then outputChatBox("** Maksymalna suma to 15000 PLN !",client) return end
if getElementData(tabelka[1],"vehicle:ownedPlayer") == getElementData(client,"player:sid") then outputChatBox("** Próba oddania swojego pojazdu na parking, nie udana!",client) return end
exports['pystories-db']:dbSet("INSERT INTO pystories_vehicles_parking (idpojazdu, funkcjonariusz,rejestracja,data,powod,cena) VALUES (?, ?,?,NOW(),?,?)",tabelka[2],tabelka[3],tabelka[4],tabelka[6],tabelka[5])
exports['pystories-db']:dbSet("Update pystories_vehicles set police=1 where id=?",tabelka[2])
outputChatBox("** Pomyslnie oddano pojazd na parking policyjny, otrzymujesz 1500 PLN.",client,255,255,255)
givePlayerMoney(client,1500)
clicker[tabelka[1]] = true
setTimer(function(x) destroyElement(x); clicker[x] = nil end,350,1,tabelka[1])
end)


local odbior = createMarker(-1874.00, -218.21, 18.38-1,"cylinder",1.5,0,255,0)
local text = createElement('text')
setElementPosition(text,-1874.00, -218.21, 18.38)
setElementData(text,"name","Punkt odbioru pojazdow")

addEventHandler("onMarkerHit",odbior,function(el,md)
if getElementType(el) ~= "player" then return end
local veh = getPedOccupiedVehicle(el)
if veh then return end
local uid = getElementData(el,"player:sid")
local tabelka = exports['pystories-db']:dbGet("SELECT pystories_vehicles_parking.*,pystories_users.id,pystories_vehicles.id,pystories_vehicles.driver,pystories_vehicles.ownedPlayer from pystories_users left join pystories_vehicles on pystories_vehicles.ownedPlayer=pystories_users.id left join pystories_vehicles_parking on pystories_vehicles_parking.idpojazdu = pystories_vehicles.id where pystories_users.id=? and pystories_vehicles.police=1",uid)
if not tabelka or tabelka and #tabelka < 1 then outputChatBox("** Brak pojazdów do wybrania !",el) return end
triggerClientEvent(el,"odbior:refresh",root,tabelka)
end)

addEventHandler("onMarkerLeave",odbior,function(el,md)
if getElementType(el) ~= "player" then return end
local veh = getPedOccupiedVehicle(el)
if veh then return end
triggerClientEvent(el,"odbior:chowaj",root,tabelka)
end)

addEvent("odbior:wydaj",true)
addEventHandler("odbior:wydaj",root,function(id,cena)
if not id then return end
local money = getPlayerMoney(client)
if money < cena then outputChatBox("** Brak pieniędzy na wyciągnięcie pojazdu !",client) triggerClientEvent(client,"odbior:schowaj",root) return end
exports['pystories-db']:dbSet("DELETE from pystories_vehicles_parking where idpojazdu=?",id)
exports['pystories-db']:dbSet("Update pystories_vehicles set police=0,parking=1 where id=?",id)
local poss = {-1868.11, -216.73, 18.38, -0.00, 0.00, 359.91}
exports['pystories-vehicles']:onRespawnVehicles(_,id,poss)
outputChatBox("** Pomyslnie wybrano pojazd z parkingu policyjnego.",client,255,255,255)
takePlayerMoney(client,cena)
end)
