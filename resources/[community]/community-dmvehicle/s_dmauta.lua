function pojazdPusty(veh)
    local occupants = getVehicleOccupants(veh)
    local seats = getVehicleMaxPassengers(veh)
	if (not seats) then return true end
    for i=0,seats do
	local occupant = occupants[seat]
	if occupant and (getElementType(occupant)=="player" or getElementType(occupant)=="ped") then
	    return false
	end
    end
    return true
end


for i,v in ipairs(getElementsByType("vehicle")) do
    if (pojazdPusty(v)) then
        setVehicleDamageProof(v,true)
    else
	if getElementData(v,"damageproof") then setVehicleDamageProof(v, true) return end
	setVehicleDamageProof(v,false)
    end
end

addEventHandler ( "onVehicleEnter", root, function()
	if getElementData(source,"damageproof") then setVehicleDamageProof(source, true) return end
    setVehicleDamageProof(source, false)
end)

addEventHandler ( "onVehicleExit", root, function()
    if (pojazdPusty(source)) then
        setVehicleDamageProof(source, true)
    else
		if getElementData(source,"damageproof") then setVehicleDamageProof(source, true) return end
        setVehicleDamageProof(source, false)
    end
end)