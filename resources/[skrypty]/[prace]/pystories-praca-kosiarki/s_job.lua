--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local code="Kosiarki"
local jobVehicle={572, -2468.58, -318.36, 41.30, 358.1, 0.4, 24.4} -- gdzie ma być spawnowany pojazd 
addEvent("startJobS", true)
addEventHandler("startJobS", resourceRoot, function(plr)
	if getElementData(plr,"player:job") ~= code then return end
	local veh=createVehicle(jobVehicle[1], jobVehicle[2], jobVehicle[3], jobVehicle[4], jobVehicle[5], jobVehicle[6], jobVehicle[7])
	setElementData(veh,"vehicle:mileage", 1500)
	setElementData(veh,"vehicle:fuel",100)
	setElementData(veh,"vehicle:desc", "Kierowca Kosiarki\n! Proszę zachować ostrożność !")
	warpPedIntoVehicle(plr,veh)
	triggerClientEvent(plr,"startJobek",root,veh)
end)

addEventHandler("onVehicleExplode", resourceRoot, function()
	if getElementModel(source) ~= 572 then return end
	destroyElement(source)
end)
