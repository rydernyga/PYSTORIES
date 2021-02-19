--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local jobs={
	["tuner-sf"]={
		code="tuner-sf",
		desc="-",
		desc2="Praca Tunera",
		positionMarker={-2272.03, -159.40, 35.32},
		text="* Nie jesteś zatrudniony(a) jako tuner w tym warsztacie.",
		cuboid={-2301.8146972656, -180.19532775879, 34.492546081543, 31.5, 64.3, 10},
		maxEmployees=2,
	},
}

for i,v in pairs(jobs) do
    local marker=createMarker(v.positionMarker[1], v.positionMarker[2], v.positionMarker[3]-0.90, "cylinder", 1.2, 78, 255, 0, 155)
    setElementDimension(marker, v.positionMarker[5] or 0)
    setElementInterior(marker, v.positionMarker[4] or 0)
    setElementData(marker,"m:duty",v.code or 0)
	local cs= createColCuboid(v.cuboid[1],v.cuboid[2],v.cuboid[3],v.cuboid[4],v.cuboid[5],v.cuboid[6])
	setElementData(cs,"m:duty",v.code)
	addEventHandler ( "onColShapeLeave", cs, function(el,md)
	if getElementData(el,"player:duty") == getElementData(source,"m:duty") then
	    setElementData(el,"player:duty",false)
        outputChatBox("* Zakończyłeś(aś) prace.", el)
		local skin=getElementData(el,"player:skin")
        setElementModel(el,skin)
	end
	end)
	local t=createElement("text")
    setElementDimension(t, v.positionMarker[5] or 0)
    setElementInterior(t, v.positionMarker[4] or 0)
    setElementData(t,"name",v.desc.."\n"..v.desc2)
    setElementPosition(t,v.positionMarker[1],v.positionMarker[2],v.positionMarker[3])
end

addEventHandler("onMarkerHit", resourceRoot, function(el,md)
	if getElementType(el)~="player" then return end
    local duty=getElementData(source,"m:duty")
    if not duty then return end
    local uid=getElementData(el,"player:uid")
    if not getPlayerJob(el,duty) then
        outputChatBox(jobs[duty].text, el, 255, 0, 0)
        return
    end
    if not getElementData(el,"player:duty") then
        if jobs[duty].getEmployees then
            if getEmployees(duty) >= jobs[duty].maxEmployees then
                outputChatBox("* W tej pracy pracuje już maksymalna ilość osób ("..jobs[duty].maxEmployees..")", el, 255, 0, 0)
                return
            end
        end
        if jobs[duty].weapon then giveWeapon(el,jobs[duty].weapon,1000) end
        setElementData(el,"player:duty",duty)
        outputChatBox("* Rozpocząłeś(aś) pracę.", el)
        exports["pystories-db"]:dbSet("UPDATE ogrpg_jobs SET actived=NOW() WHERE code=? and uid=?",duty,uid)
    else
		if getElementData(el,"player:duty") ~= getElementData(source,"m:duty") then outputChatBox("* Idź i zwolnij się z frakcji !",el) return end
        if jobs[duty].weapon then takeWeapon(el,jobs[duty].weapon) end
        setElementData(el,"player:duty",false)
        outputChatBox("* Zakończyłeś(aś) prace.", el)
		local skin=getElementData(el,"player:skin")
        setElementModel(el,skin)
    end
end)




