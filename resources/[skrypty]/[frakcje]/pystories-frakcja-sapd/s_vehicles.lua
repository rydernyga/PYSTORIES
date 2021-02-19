--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

-- Position vehicles

function getVehicleHandlingProperty ( element, property )
    if isElement ( element ) and getElementType ( element ) == "vehicle" and type ( property ) == "string" then
        local handlingTable = getVehicleHandling ( element ) 
        local value = handlingTable[property] 
 
        if value then
            return value
        end
    end
 
    return false
end

local asapd_radiowozy = {
--{-1640.31, 653.80, -5.52, 0, 0, 90, 597},
{-1611.96,750.00,-5.62,0, 0, 180, 597},
{-1607.93,750.00,-5.62,0, 0, 180, 597},
{-1603.95,750.00,-5.62,0, 0, 180, 597},
{-1599.93,750.00,-5.62,0, 0, 180, 597},
{-1595.89,750.00,-5.62,0, 0, 180, 597},
{-1591.57,750.00,-5.62,0, 0, 180, 597},
{-1587.56,750.00,-5.61,0, 0, 180, 597},
{-1583.54,750.00,-5.62,0, 0, 180, 597},
{-1579.56,750.00,-5.62,0, 0, 180, 597},

}

local asapd_holowniki = {

{-1640.21, 670.16, -5.37, 358.0, 0.0, 269.7, 525},
{-1640.21, 674.06, -5.36, 358.3, 360.0, 269.9, 525},
{-1640.25, 678.24, -5.37, 358.0, 0.0, 270.4, 525},
{-1640.19, 682.35, -5.36, 358.3, 0.0, 270.5, 525},
{-1640.29, 686.39, -5.36, 358.2, 360.0, 269.4, 525},

}

local sapd_premiery = {

{-1608.37, 693.82, -5.50, 0.0, 0.0, 179.6, 426},
{-1604.17, 693.80, -5.50, 0.0, 0.0, 179.8, 426},
{-1600.09, 693.79, -5.50, 0.0, 0.0, 179.6, 426},
{-1596.05, 693.82, -5.50, 0.0, 0.0, 180.0, 426},

}

local sapd_sultany = {

--{-1596.70, 674.97, -5.61, 0.13, 0.00, 358.53,560},
--{-1600.68, 674.92, -5.61, 0.13, 0.00, 359.72,560},

}

local sapd_radiowozy = {

{-1572.40,742.39,-5.62,0,0,90,597},
{-1572.40,738.14,-5.62,0,0,90,597},
{-1572.40,734.28,-5.62,0,0,90,597},
{-1572.40,730.09,-5.62,0,0,90,597},
{-1572.40,726.07,-5.62,0,0,90,597},
{-1572.40,722.03,-5.62,0,0,90,597},
{-1572.40,717.71,-5.61,0,0,90,597},
{-1572.40,713.64,-5.62,0,0,90,597},
{-1572.40,709.77,-5.62,0,0,90,597},
{-1572.40,705.49,-5.62,0,0,90,597},
{-1592.21,705.01,-5.6,0,0,270,523},
{-1592.38,707.86,-5.6,0,0,270,523},
{-1592.82,710.04,-5.6,0,0,270,523},
{-1592.86,712.81,-5.6,0,0,270,523},
}


local sapd_cheetahy = {
{-1596.37,676.05,-5.40, 0,0,0,415},
{-1600.61,676.49,-5.40, 0,0,0,415},
}

for i,v in pairs(asapd_radiowozy) do
	local vehicle=createVehicle(v[7], v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)

	removeVehicleSirens(vehicle)
	setElementData(vehicle,"vehicle:police", true)
    setVehicleSirens ( vehicle, 1, 0.802, 2.300, -0.013, 255, 255, 255, 255, 255 )
	addVehicleSirens ( vehicle, 8, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 2, -0.795, 2.300, 0.000, 255, 255, 255, 255, 255 )
	addVehicleSirens ( vehicle, 8, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 3, -0.775, -2.700, 0.047, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 8, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 4, 0.768, -2.700, 0.039, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 8, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 5, 0.522, -0.405, 0.900, 0, 96, 255, 255, 255 )
	addVehicleSirens ( vehicle, 8, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 6, -0.479, -0.424, 0.900, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 8, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 7, 0.054, -1.873, 0.407, 0, 96, 255, 255, 255 )
	addVehicleSirens ( vehicle, 8, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 8, 0.053, -1.836, 0.430, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 8, 2, true, false, false, true ) 
	
	setVehicleColor( vehicle, 0, 40, 0, 100,100,100, 0,0,0 ,0,0,0 )
	addVehicleUpgrade(vehicle, 1025)
	
	setElementData(vehicle,"vehicle:rank",1)
	
	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:ownedPlayer", 1)
	setElementData(vehicle,"vehicle:id", i+660606)
	setVehiclePlateText(vehicle,"S " .. i+660606)
	setElementData(vehicle,"vehicle:desc","Radiowóz\nA-SAPD\nSan Fierro\n001-" .. i+660606 .."")
	setVehicleDamageProof(vehicle,true)
	
	local fast = getVehicleHandlingProperty(vehicle,"engineAcceleration")
	local maxfast = getVehicleHandlingProperty(vehicle,"maxVelocity")
	local masa = getVehicleHandlingProperty(vehicle,"mass")
	local masa2 = getVehicleHandlingProperty(vehicle,"turnMass")
	local xd = getVehicleHandlingProperty(vehicle,"tractionMultiplier")
	local coef = getVehicleHandlingProperty(vehicle,"dragCoeff")
	local stdg = getVehicleHandlingProperty(vehicle,"steeringLock")
	setVehicleHandling(vehicle,"engineAcceleration",fast+6.5)
	setVehicleHandling(vehicle,"maxVelocity",maxfast+115)
	setVehicleHandling(vehicle,"tractionMultiplier",xd+0.25)
	setVehicleHandling(vehicle,"mass",masa+150+100+200+55)
	setVehicleHandling(vehicle,"steeringLock",stdg+0.25)
	setVehicleHandling(vehicle,"dragCoeff",coef-0.25)
	setVehicleHandling(vehicle,"driveType", "awd")

end

for i,v in pairs(asapd_holowniki) do
	local vehicle=createVehicle(v[7], v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)

	removeVehicleSirens(vehicle)
	setElementData(vehicle,"vehicle:police", true)
    setVehicleSirens ( vehicle, 1, 0.614, -0.522, 1.400, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 3, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 2, -0.603, -0.509, 1.400, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 3, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 3, 0.015, -0.500, 1.400, 255, 156, 0, 255, 255 )
	addVehicleSirens ( vehicle, 3, 2, true, false, false, true ) 
	
	setVehicleColor( vehicle, 0, 32, 0, 0,32,0, 0,0,0 ,0,0,0 )
	addVehicleUpgrade(vehicle, 1025)
	
	setElementData(vehicle,"vehicle:rank",1)
	
	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:id", i+707010)
	setVehiclePlateText(vehicle,"S " .. i+707010)
	setElementData(vehicle,"vehicle:ownedPlayer", 1)
	setElementData(vehicle,"vehicle:desc","Holownik\nA-SAPD\nSan Fierro\n002-" .. i+707010 .."")
	setVehicleDamageProof(vehicle,true)

end

for i,v in pairs(sapd_premiery) do
	local vehicle=createVehicle(v[7], v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	setVehicleDamageProof(vehicle,true)
	removeVehicleSirens(vehicle)
	setElementData(vehicle,"vehicle:police", true)
	setVehicleSirens ( vehicle, 1, 0.798, 2.300, 0.017, 255, 255, 255, 255, 255 )
	addVehicleSirens ( vehicle, 6, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 2, -0.772, 2.300, 0.007, 255, 255, 255, 255, 255 )
	addVehicleSirens ( vehicle, 6, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 3, -0.792, -2.700, 0.025, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 6, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 4, 0.773, -2.700, 0.037, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 6, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 5, -0.093, -1.915, 0.379, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 6, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 6, 0.164, -1.931, 0.358, 0, 96, 255, 255, 255 )
	addVehicleSirens ( vehicle, 6, 2, true, false, false, true ) 
	
	-- Police Siren: 3964
	
	--police_object = createObject(3964,0,0,0)
	--attachElements(police_object,vehicle,0.75,1.15,1,0,0,0)
	
	setVehicleColor(vehicle, 0,0,25 )
	addVehicleUpgrade(vehicle, 1025)
	
	setElementData(vehicle,"vehicle:rank",5)

	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:fuel", 100)

	setElementData(vehicle,"vehicle:id", i+997010)
	setVehiclePlateText(vehicle,"S " .. i+997010)
	setElementData(vehicle,"vehicle:ownedPlayer", 1)
	setElementData(vehicle,"vehicle:desc","Premier\nSAPD\nSan Fierro\n002-".. i+997010 .."")
	
	local fast = getVehicleHandlingProperty(vehicle,"engineAcceleration")
	local maxfast = getVehicleHandlingProperty(vehicle,"maxVelocity")
	local masa = getVehicleHandlingProperty(vehicle,"mass")
	local masa2 = getVehicleHandlingProperty(vehicle,"turnMass")
	local xd = getVehicleHandlingProperty(vehicle,"tractionMultiplier")
	local coef = getVehicleHandlingProperty(vehicle,"dragCoeff")
	local stdg = getVehicleHandlingProperty(vehicle,"steeringLock")
	setVehicleHandling(vehicle,"engineAcceleration",fast+6.5)
	setVehicleHandling(vehicle,"maxVelocity",maxfast+115)
	setVehicleHandling(vehicle,"tractionMultiplier",xd+0.25)
	setVehicleHandling(vehicle,"mass",masa+150+100+200+55)
	setVehicleHandling(vehicle,"steeringLock",stdg+0.25)
	setVehicleHandling(vehicle,"dragCoeff",coef-0.25)
	setVehicleHandling(vehicle,"driveType", "awd")

end

for i,v in pairs(sapd_sultany) do
	local vehicle=createVehicle(v[7], v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	setVehicleDamageProof(vehicle,true)
	removeVehicleSirens(vehicle)
	setElementData(vehicle,"vehicle:police", true)
	setVehicleSirens ( vehicle, 1, 0.736, 2.400, -0.178, 255, 255, 255, 255, 255 )
	addVehicleSirens ( vehicle, 6, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 2, -0.727, 2.400, -0.155, 255, 255, 255, 255, 255 )
	addVehicleSirens ( vehicle, 6, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 3, -0.749, -2.300, 0.191, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 6, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 4, 0.712, -2.300, 0.168, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 6, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 5, -0.150, -1.542, 0.467, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 6, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 6, 0.185, -1.545, 0.465, 0, 96, 255, 255, 255 )
	addVehicleSirens ( vehicle, 6, 2, true, false, false, true ) 
	
	setVehicleColor(vehicle, 0,0,25 )
	addVehicleUpgrade(vehicle, 1025)
	
	setElementData(vehicle,"vehicle:rank",5)

	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:fuel", 100)

	setElementData(vehicle,"vehicle:id", i+910290)
	setVehiclePlateText(vehicle,"S " .. i+910290)
	setElementData(vehicle,"vehicle:desc","[SF]-[003-" .. i+910290 .."]")
	local acc=getVehicleHandling(vehicle)
	local val=acc["engineAcceleration"]
	setElementData(vehicle,"vehicle:ownedPlayer", 1)
	setVehicleHandling(vehicle,"maxVelocity",450)
	setVehicleHandling(vehicle,"engineAcceleration",val+5)

end

for i,v in pairs(sapd_radiowozy) do
	local vehicle=createVehicle(v[7], v[1], v[2], v[3])
	setVehicleColor(vehicle,0,0,64,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	setVehicleDamageProof(vehicle,true)
	removeVehicleSirens(vehicle)
	setElementData(vehicle,"vehicle:police", true)
	setVehicleSirens ( vehicle, 1, 0.802, 2.300, -0.013, 255, 255, 255, 255, 255 )
	addVehicleSirens ( vehicle, 8, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 2, -0.795, 2.300, 0.000, 255, 255, 255, 255, 255 )
	addVehicleSirens ( vehicle, 8, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 3, -0.775, -2.700, 0.047, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 8, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 4, 0.768, -2.700, 0.039, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 8, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 5, 0.522, -0.405, 0.900, 0, 96, 255, 255, 255 )
	addVehicleSirens ( vehicle, 8, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 6, -0.479, -0.424, 0.900, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 8, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 7, 0.054, -1.873, 0.407, 0, 96, 255, 255, 255 )
	addVehicleSirens ( vehicle, 8, 2, true, false, false, true ) 
	setVehicleSirens ( vehicle, 8, 0.053, -1.836, 0.430, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 8, 2, true, false, false, true ) 
	setVehicleColor( vehicle, 0, 0, 32, 100,100,100, 0,0,0 ,0,0,0 )
	addVehicleUpgrade(vehicle, 1025)
	
	local fast = getVehicleHandlingProperty(vehicle,"engineAcceleration")
	local maxfast = getVehicleHandlingProperty(vehicle,"maxVelocity")
	local masa = getVehicleHandlingProperty(vehicle,"mass")
	local masa2 = getVehicleHandlingProperty(vehicle,"turnMass")
	local xd = getVehicleHandlingProperty(vehicle,"tractionMultiplier")
	local coef = getVehicleHandlingProperty(vehicle,"dragCoeff")
	local stdg = getVehicleHandlingProperty(vehicle,"steeringLock")
	setVehicleHandling(vehicle,"engineAcceleration",fast+6.5)
	setVehicleHandling(vehicle,"maxVelocity",maxfast+115)
	setVehicleHandling(vehicle,"tractionMultiplier",xd+0.25)
	setVehicleHandling(vehicle,"mass",masa+150+100+200+55)
	setVehicleHandling(vehicle,"steeringLock",stdg+0.25)
	setVehicleHandling(vehicle,"dragCoeff",coef-0.25)
	setVehicleHandling(vehicle,"driveType", "awd")
	
	
	setElementData(vehicle,"vehicle:rank",2)
	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:ownedPlayer", 1)
	setElementData(vehicle,"vehicle:fuel", 100)

	setElementData(vehicle,"vehicle:id", i+808010)
	setVehiclePlateText(vehicle,"S " .. i+808010) 
	setElementData(vehicle,"vehicle:desc","Radiowóz\nSAPD\nSan Fierro\n003-" .. i+808010 .."")

end


for i,v in pairs(sapd_cheetahy) do
	local vehicle=createVehicle(v[7], v[1], v[2], v[3])
	setVehicleColor(vehicle,0,0,0,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	setVehicleDamageProof(vehicle,true)
	removeVehicleSirens(vehicle)
	setElementData(vehicle,"vehicle:police", true)
	addVehicleSirens(vehicle, 2, 2, false, false, false, false)
	setVehicleSirens(vehicle, 1, -0.3, 2.7, -0.1, 255, 0, 0, 153, 140.3)
	setVehicleSirens(vehicle, 2, 0.2, 2.7, -0.1, 0, 214.2, 255, 168.3, 140.3)
	addVehicleUpgrade(vehicle, 1025)
	
	local fast = getVehicleHandlingProperty(vehicle,"engineAcceleration")
	local maxfast = getVehicleHandlingProperty(vehicle,"maxVelocity")
	local masa = getVehicleHandlingProperty(vehicle,"mass")
	local masa2 = getVehicleHandlingProperty(vehicle,"turnMass")
	local xd = getVehicleHandlingProperty(vehicle,"tractionMultiplier")
	local coef = getVehicleHandlingProperty(vehicle,"dragCoeff")
	local stdg = getVehicleHandlingProperty(vehicle,"steeringLock")
	setVehicleHandling(vehicle,"engineAcceleration",fast+6.5)
	setVehicleHandling(vehicle,"maxVelocity",maxfast+115)
	setVehicleHandling(vehicle,"tractionMultiplier",xd+0.25)
	setVehicleHandling(vehicle,"mass",masa+150+100+200+55)
	setVehicleHandling(vehicle,"steeringLock",stdg+0.25)
	setVehicleHandling(vehicle,"dragCoeff",coef-0.25)
	setVehicleHandling(vehicle,"driveType", "awd")
	
	
	setElementData(vehicle,"vehicle:rank",2)
	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:ownedPlayer", 1)
	setElementData(vehicle,"vehicle:fuel", 100)

	setElementData(vehicle,"vehicle:id", i+808010)
	setVehiclePlateText(vehicle,"HOT-P " .. i+808010) 
end



addEventHandler("onVehicleEnter", resourceRoot, function(plr,seat,jacked)
	if seat == 0 then
		setElementData(source,"use:player",true)
		outputChatBox("* Wszedleś(aś) do pojazdu frakcyjnego, dbaj o niego i odstaw na miejsce.", plr)
		outputChatBox("* Wszelkie zostawiania pojazdów będa karane banem.", plr)
	end
end)

setTimer(function() 
 	for i,vehicle in pairs(getElementsByType("vehicle", resourceRoot)) do
		local x,y,z = getElementPosition(vehicle)
		local r1,r2,r3 = getElementRotation(vehicle)
		setVehicleRespawnPosition(vehicle,x,y,z,r1,r2,r3)
		toggleVehicleRespawn(vehicle,true)
		setVehicleIdleRespawnDelay(vehicle,3600000)
		setVehicleHandling(vehicle, "driveType", "awd")
		setElementData(vehicle,"vehicle:duty","SAPD")
  	end
end,1000,1)

-- Zsynchronizowana do licznika
function setElementSpeed(element, speed)
	if (speed == nil) then speed = 0 end
	speed = tonumber(speed)
	local vx,vy,vz = getElementVelocity(element)
	local acSpeed = ((vx^2+vy^2+vz^2)^(0.5))*180
	local diff = speed/acSpeed
	if diff ~= diff then return end -- if the number is a 'NaN' return end.
	local x,y,z = getElementVelocity(element)
	setElementVelocity(element,x*diff,y*diff,z*diff)
	return true
end

-- odmrażamy pojazdy pociagniete holownikiem!
function detachTrailer(theTruck)
    setElementFrozen(source, false)
 end
addEventHandler("onTrailerAttach", getRootElement(), detachTrailer)

