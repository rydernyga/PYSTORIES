--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local czas = getTickCount()

isBike = {
    [509]=true, --Bike
    [481]=true, --BMX
    [510]=true, --Mountain bike
}

function odejmijPaliwo(pojazd)
    if getTickCount() - czas > 150 then
        czas = getTickCount()
        local paliwo = getElementData(pojazd, "vehicle:fuel") or 0
        local vx,vy,vz = getElementVelocity(pojazd)
        local spd = ((vx^2+vy^2+vz^2)^(0.5)/150)
        if spd > 0 then
            paliwo = paliwo-spd*2
            setElementData(pojazd, "vehicle:fuel", paliwo)
        end
    end
end

addEventHandler("onClientRender", root, function()
    local pojazd = getPedOccupiedVehicle(localPlayer)
    if not pojazd then return end
    if isBike[getElementModel(pojazd)] then return end
    if not getVehicleEngineState(pojazd) then return end
    if getVehicleController(pojazd) ~= localPlayer then return end
    odejmijPaliwo(pojazd)
end)

addEvent("TANKUJ",true)
addEventHandler("TANKUJ",root,function()
	if getPlayerMoney(source)>= 5 then
		takePlayerMoney(source,5)
		triggerClientEvent("TANKUJ",source)
	end
end)

function zgasSilnik()
    for i,v in ipairs(getElementsByType("vehicle")) do
    local data = getElementData(v, "vehicle:fuel")
        if data then
        if tonumber(data) < 0 then
            setVehicleEngineState(v, false)
        end
end
    end
end
setTimer(zgasSilnik, 1000, 0) 

function koniecpaliwa()
vehicle = getPedOccupiedVehicle(localPlayer)
    if vehicle and (not getElementData(vehicle,"vehicle:fuel") == false ) and getElementData(vehicle,"vehicle:fuel") <= 0 then
        setElementData(vehicle,"vehicle:fuel",0)
        setElementData(vehicle,"koniecpaliwa",true)
        setVehicleEngineState(vehicle,false)
    end
end
addEventHandler("onClientRender",root,koniecpaliwa)