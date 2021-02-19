--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

function isPedAiming(player)
    if isElement(player) then
        if getElementType(player) == "player" or getElementType(player) == "vehicle" then
            if getPedTask(player, "secondary", 0) == "TASK_SIMPLE_USE_GUN" then
                return true
            end
        end
    end
    return false
end