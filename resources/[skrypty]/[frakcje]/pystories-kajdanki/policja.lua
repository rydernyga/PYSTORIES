--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

addEvent("onKajdankiZakuj", true)
addEventHandler("onKajdankiZakuj", resourceRoot, function(kto,kogo)
  triggerClientEvent(kogo, "onKajdankiZakuj", resourceRoot, kto)
end)

addEvent("spac",true)
addEventHandler("spac", root, function()
	setPedAnimation(source, "CHAINSAW" ,"csaw_part",  0, false, true, true )
end)