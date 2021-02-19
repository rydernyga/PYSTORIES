--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local vehicles = {
    -- Śmieciarki SF
{-1880.10,-1741.31,22.30,1.3,0.0,30.8},
{-1866.41,-1731.72,22.30,1.3,0.0,31.7},
{-1873.11,-1736.34,22.30,1.3,360.0,31.2},
{-1887.45,-1745.64,22.30,1.3,0.0,30.8},
{-1895.14,-1750.04,22.30,1.3,0.0,34.6},
{-1903.63,-1754.18,22.29,1.3,0.0,348.9},
}

for i,v in ipairs(vehicles) do
    local veh=createVehicle(408, v[1], v[2], v[3], v[4], v[5], v[6])
    setElementFrozen(veh,true)
    setElementData(veh,"vehicle:fuel",100)
    setElementData(veh,"vehicle:desc", "Kierowca Śmieciarki\n! Proszę zachować ostrożność !")
    setElementData(veh,"vehicle:praca", "Smieciarka" )
end

addEvent("wyplacPieniadze", true) 
addEventHandler("wyplacPieniadze", getRootElement(),
function(suma) 
local nagroda = suma * 2
triggerEvent("givePlayerMoney",client,nagroda)
outputChatBox("* Rozładowałeś(aś): "..suma.."% śmieci, otrzymujesz: "..(nagroda*2).." PLN.", client)
--setElementData(source, "zapelnienie", false)
end)

addEvent("setVehFreeze", true)
addEventHandler("setVehFreeze", getRootElement(),
function(veh, bool)
setElementFrozen(veh, bool)
end)

addEventHandler("onVehicleEnter", resourceRoot, function(plr,seat)
    if seat~=0 then return end
    setElementFrozen(source,false)
end)


setTimer(function()
    for i,v in ipairs(getElementsByType("vehicle", resourceRoot)) do
        if not getVehicleController(v) then
            respawnVehicle(v)
            fixVehicle(v)
            setElementFrozen(v,true)
            setElementData(v,"vehicle:fuel",100)
            setElementData(v,"zapelnienie", false)
        end
    end
end, 15000, 0)