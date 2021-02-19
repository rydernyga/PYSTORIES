--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

mk1 = 65000
mk2 = 85000
rh = 100000


local licz = {}
local t=createElement('text')
setElementData(t,'name','Automatyczny montaż tuningu mechanicznego')
setElementPosition(t,-2052.77, 159.02, 28.84+0.5)

--createBlip(-1770.96,1205.90,25.13, 53) -- fancy workshop blip

addEvent("mk1", true)
addEventHandler("mk1", root, function()
pojazd = getPedOccupiedVehicle(source)
if not pojazd then return end
if (getPlayerMoney(source) > tonumber(mk1)) then
  local id = getElementData(pojazd, "vehicle:id")
  exports["pystories-db"]:dbSet("UPDATE ogrpg_vehicles SET mk1=1 WHERE id=?", id)
		 outputChatBox("* Pomyślnie zamontowano MK1.", source,true)
     outputChatBox("* Oddaj auto do przecho aby zobaczyć efekty!", source,true)
		 takePlayerMoney( source, mk1 )
	else
		 outputChatBox("* Nie stać Cię na to.", source,true)
end
end
)


addEvent("mk2", true)
addEventHandler("mk2", root, function()
pojazd = getPedOccupiedVehicle(source)
if not pojazd then return end
if (getPlayerMoney(source) > tonumber(mk2)) then
  local id = getElementData(pojazd, "vehicle:id")
  exports["pystories-db"]:dbSet("UPDATE ogrpg_vehicles SET mk2=1 WHERE id=?", id)
     outputChatBox("* Pomyślnie zamontowano MK2.", source,true)
     outputChatBox("* Oddaj auto do przecho aby zobaczyć efekty!", source,true)
     takePlayerMoney( source, mk2 )
  else
     outputChatBox("* Nie stać Cię na to.", source,true)
end
end
)

addEvent("rh", true)
addEventHandler("rh", root, function()
pojazd = isPedInVehicle(source)
if not pojazd then return end
if (getPlayerMoney(source) > tonumber(rh)) then
  local id = getElementData(pojazd, "vehicle:id")
  exports["pystories-db"]:dbSet("UPDATE ogrpg_vehicles SET naped=1 WHERE id=?", id)
     outputChatBox("* Pomyślnie zamontowano napęd 4x4.", source,true)
     outputChatBox("* Oddaj auto do przecho aby zobaczyć efekty!", source,true)
     takePlayerMoney( source, rh)
  else
     outputChatBox("* Nie stać Cię na to.", source,true)
end
end
)

