--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

function getEmployees(code)
    local number=0
    for i,v in ipairs(getElementsByType("player")) do
        if getElementData(v,"player:faction") == code then
            number=number+1
        end
    end
    return number
end

function getPlayerFaction(el,code)
    local sid=getElementData(el,"player:sid")
    local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_factions WHERE code=? AND sid=? LIMIT 1;", code, sid) -- pobieramy tylko JEDEN rekord
    if result and #result > 0 then
        return result[1].code
    else
        return false
    end
end

function getPlayerFactionRank(el,code)
    local sid=getElementData(el,"player:sid")
    local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_factions WHERE code=? AND sid=? LIMIT 1;", code, sid) -- pobieramy tylko JEDEN rekord
    if result and #result > 0 then
        return result[1].rank
    else
        return false
    end
end


addEventHandler("onVehicleStartEnter", root, function(plr, seat, jacked)
	if seat == 0 then
		if getElementData(source,'vehicle:duty') then
			if getElementData(plr,'player:faction') ~= getElementData(source,'vehicle:duty') then
			cancelEvent()
			return end	
			if getElementData(source,'vehicle:rank') then
				if getElementData(plr,'player:rank') < getElementData(source,'vehicle:rank') then
				cancelEvent()
				return end
			end
		end
	end
end)
local licz = {}
function rozpocznijnaliczanie(el)
	if isTimer(licz[el]) then
	killTimer(licz[el])
	licz[el] = nil
	end
licz[el] = setTimer(naliczanie,60000,0,el)
end
function zatrzymajnaliczanie(el)
	if isTimer(licz[el]) then
	killTimer(licz[el])
	licz[el] = nil
	end
end
addEventHandler("onPlayerWasted",root,function()
	if isTimer(licz[source]) then
	killTimer(licz[source])
	licz[source] = nil
	end
end)

function naliczanie(el)
	if isElement(el) then
   local x = getElementData(el,"player:workinjob") or 0
   setElementData(el,"player:workinjob",x+1)
   else
	if isTimer(licz[el]) then
	killTimer(licz[el])
	licz[el] = nil
	end
   end
end

