--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

function getEmployees(code)
    local number=0
    for i,v in ipairs(getElementsByType("player")) do
        if getElementData(v,"player:duty") == code then
            number=number+1
        end
    end
    return number
end

function getPlayerJob(el,code)
    local uid=getElementData(el,"player:sid")
    local result=exports["pystories-db"]:dbGet("SELECT * FROM ogrpg_jobs WHERE code=? AND uid=? LIMIT 1;", code, uid) -- pobieramy tylko JEDEN rekord
    if result and #result > 0 then
        return result[1].code
    else
        return false
    end
end

function getPlayerjob(el,code)
    local uid=getElementData(el,"player:sid")
    local result=exports["pystories-db"]:dbGet("SELECT * FROM ogrpg_jobs WHERE code=? AND uid=? LIMIT 1;", code, uid) -- pobieramy tylko JEDEN rekord
    if result and #result > 0 then
        return result[1].code
    else
        return false
    end
end