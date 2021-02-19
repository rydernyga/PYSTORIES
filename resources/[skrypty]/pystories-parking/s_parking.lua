--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

--[[
addEventHandler("onResourceStart", resourceRoot, 
function ()
	CuboidNumber_0 = createColCuboid(-1951.8657226563, 613.52954101563, 33.78190612793, 14.4, 7.3, 6.2)
end
)
--]]

--[[
addEventHandler("onResourceStart", resourceRoot, 
function ()
	CuboidNumber_0 = createColCuboid(-1966.6160888672, 613.84454345703, 33.78190612793, 14.4, 7.3, 6.2)
end
)
--]]


local marker=createMarker(-1945.00, 617.12, 35.02-2, "cylinder", 6.4, 255,255,255,20)
createBlip(-1968.79, 620.47, 35.17, 35,2,0,0,0,0,0,250)
local mdestroy = createColCuboid(-1951.8657226563, 613.52954101563, 33.78190612793, 14.4, 7.3, 6.2)
local t=createElement("text")
setElementData(t,"scale",1.5)
setElementData(t,"name","Pozostawianie pojazdów")
setElementPosition(t,-1945.00, 617.12, 35.02)

addEvent("onParkingGetRekords", true)
addEventHandler("onParkingGetRekords", root, function()
    local sid=getElementData(source,"player:sid")
    if not sid then return end
	local org = getElementData(source,"player:organization")
    local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_vehicles WHERE (ownedPlayer=? OR ownedGroup=?) AND parking=1",sid,org or "Brak")
    if #result > 0 then
        triggerClientEvent(source, "onParkingGetVehicles", source, result)
    end
end)

addEventHandler("onColShapeHit", mdestroy, function(el,md)
    if getElementType(el) == "player" then
        local veh=getPedOccupiedVehicle(el)
        if not veh then return end
        if getVehicleController(veh) ~= el then return end
        local id=getElementData(veh,"vehicle:id")
        if not id then return end
        if isTimer(timeroddania) then return end
        setElementFrozen(veh,true)
        outputChatBox("* Trwa zapisywanie pojazdu...", el)
        toggleControl(el,"enter_exit",false)
        timeroddania=setTimer(function()
			setElementFrozen(veh,false)
			local id=getElementData(veh,"vehicle:id")
			if not id then return end
            exports["pystories-vehicles"]:onSaveVehicle(veh)
            destroyElement(veh)
            exports["pystories-db"]:dbSet("UPDATE pystories_vehicles SET parking=1 WHERE id=?", id)
            toggleControl(el,"enter_exit",true)
            outputChatBox("* Pomyślnie zapisano pojazd.", el)
        end, 3000, 1)
	elseif getElementType(el) == "vehicle" then
		local peds= getVehicleOccupants(el)
		if #peds > 0 then return end
		local id=getElementData(el,"vehicle:id")
        if not id then return end
        if isTimer(timeroddania) then return end
        timeroddania=setTimer(function()
			setElementFrozen(el,false)
			local id=getElementData(el,"vehicle:id")
			if not id then return end
            exports["pystories-vehicles"]:onSaveVehicle(el)
            destroyElement(el)
            exports["pystories-db"]:dbSet("UPDATE pystories_vehicles SET parking=1 WHERE id=?", id)
            outputChatBox("* Pomyślnie zapisano pojazd.", el, 255, 255 ,255 ,true)
        end, 3000, 1)
		setElementFrozen(el,true)
		setVehicleLocked(el,true)
    end
end)

addEvent("onParkingVehicleSpawn", true)
addEventHandler("onParkingVehicleSpawn", root, function(id)
    if not id then return end
    local spawn=exports["pystories-vehicles"]:onRespawnVehicles(_,id,{-1959.97, 617.08, 35.37, 1.1, 0.0, 179.1})
    if spawn then
    --addEventHandler("onClientRender",root,render1)  
	outputChatBox("* Pomyślnie wyciągnięto pojazd z przechowalni.",el)
	end
end)