--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

--[[
addCommandHandler("switchsiren",function (plr,cmd)
if getPedOccupiedVehicle(plr) and getVehicleController(getPedOccupiedVehicle(plr))==plr then
setVehicleSirensOn(getPedOccupiedVehicle(plr),not getVehicleSirensOn(getPedOccupiedVehicle(plr)))
end
end)


addCommandHandler("syrena", function (plr)
if getPedOccupiedVehicle(plr) and getVehicleController(getPedOccupiedVehicle(plr))==plr then
setElementData(getPedOccupiedVehicle(plr),"psz.sirens",not getElementData(getPedOccupiedVehicle(plr),"psz.sirens"))
end
end)


for key, value in ipairs(getElementsByType("player")) do
bindKey(value,"j","down","syrena")
end



addEventHandler("onPlayerJoin",root,function ()
--bindKey(source,"j","down","switchsiren")
bindKey(source,"j","down","syrena")
end)
]]--