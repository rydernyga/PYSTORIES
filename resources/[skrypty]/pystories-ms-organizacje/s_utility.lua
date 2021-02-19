--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

function getOnlinePlayersinOrganization(org)
    local number=0
    for i,v in ipairs(getElementsByType("player")) do
        if getElementData(v,"player:organization") == org then
            number=number+1
        end
    end
    return number
end

function getPlayerOrganization(el)
    local uid=getElementData(el,"player:sid")
    local result=exports["pystories-db"]:dbGet("SELECT * FROM ms_organizacje WHERE uid=? LIMIT 1;", uid) -- pobieramy tylko JEDEN rekord
    if result and #result > 0 then
        return result[1].name
    else
        return false
    end
end

function getPlayerOrganizationRank(el,org)
    local uid=getElementData(el,"player:sid")
    local result=exports["pystories-db"]:dbGet("SELECT * FROM ms_organizacje WHERE code=? AND uid=? LIMIT 1;", org, uid) -- pobieramy tylko JEDEN rekord
    if result and #result > 0 then
        return result[1].rank
    else
        return false
    end
end

