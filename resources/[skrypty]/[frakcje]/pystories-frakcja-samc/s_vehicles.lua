--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

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

{-1640.32, 649.72, -5.52, 359.7, 0.0, 268.8, 597},
{-1640.31, 653.80, -5.52, 359.7, 0.0, 269.4, 597},
--{-1640.31, 653.80, -5.52, 359.7, 0.0, 269.4, 597},
{-1640.34, 657.85, -5.52, 359.7, 0.0, 270.1, 597},
{-1640.35, 661.99, -5.52, 359.7, 0.0, 268.9, 597},

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

{-1632.80, 693.77, -5.52, 359.7, 0.0, 180.1, 597},
{-1628.71, 693.72, -5.52, 359.7, 0.0, 179.6, 597},
{-1624.65, 693.78, -5.52, 359.7, 0.0, 179.6, 597},
{-1620.61, 693.78, -5.52, 359.7, 360.0, 179.4, 597},
{-1616.54, 693.80, -5.52, 359.7, 0.0, 179.2, 597},

}

for i,v in pairs(asamc_ambulansy) do
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

for i,v in pairs(samc_premiery) do
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

for i,v in pairs(samc_sultany) do
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
		setElementData(vehicle,"vehicle:duty","SAMC")
  	end
end,1000,1)

--[[local szkolenia = {
	{-2542.27,607.71,14.45, 0, 0, 180},
}

for i,v in pairs(szkolenia) do
	local vehicle=createVehicle(431, v[1], v[2], v[3])
	setVehicleColor(vehicle,255, 255, 0,255,0,0)
	addVehicleUpgrade(vehicle, 1078)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
    setVehicleColor(vehicle,255, 255, 0,255,0,0)
	setElementData(vehicle,"vehicle:rank",3)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:desc","Szkolenia SAMC")
        addVehicleUpgrade(vehicle, 1025)
end

local karetki = {
	{-2588.53, 622.43, 14.61, 0.04, 359.61, 270.13},
	{-2588.68, 627.49, 14.61, 0.04, 359.61, 270.91},
	{-2588.77, 632.68, 14.60, 0.04, 359.61, 270.92},
	
}

for i,v in pairs(karetki) do
	local vehicle=createVehicle(416, v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	removeVehicleSirens(vehicle)
	addVehicleSirens(vehicle, 6, 2, true, false, false, true ) 
	setVehicleSirens(vehicle, 1, -0.400, 0.900, 1.200, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 2, 0.000, 0.900, 1.200, 255, 255, 255, 255, 255 )
	setVehicleSirens(vehicle, 3, 0.400, 0.900, 1.200, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 4, 0.900, -3.700, 1.400, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 5, -0.900, -3.700, 1.400, 255, 0, 0, 255, 255 )
	setVehicleColor( vehicle,255, 255, 0,0,128,255 )
    addVehicleUpgrade(vehicle, 1025)
	setElementData(vehicle,"vehicle:rank",2)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:desc","SAMC-" ..i)
end



local karetki_2 = {
	{-2588.93, 637.89, 14.60, 0.08, 359.62, 269.95},
	{-2589.17, 643.09, 14.60, 0.04, 359.61, 271.01},
	{-2589.42, 648.20, 14.60, 0.04, 359.64, 270.53},
}

for i,v in pairs(karetki_2) do
	local vehicle=createVehicle(416, v[1], v[2], v[3])
	setVehicleColor(vehicle,255, 255, 0,255,0,0)
	addVehicleUpgrade(vehicle, 1078)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
    addVehicleSirens(vehicle, 6, 2, true, false, false, true ) 
	setVehicleSirens(vehicle, 1, -0.400, 0.900, 1.200, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 2, 0.000, 0.900, 1.200, 255, 255, 255, 255, 255 )
	setVehicleSirens(vehicle, 3, 0.400, 0.900, 1.200, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 4, 0.900, -3.700, 1.400, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 5, -0.900, -3.700, 1.400, 255, 0, 0, 255, 255 )
    setVehicleColor(vehicle,255, 255, 0,255,0,0)
	setElementData(vehicle,"vehicle:rank",3)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:desc","SAMC-" .. i)
        addVehicleUpgrade(vehicle, 1025)
end


local karetki_1 = {
	{-2571.47, 622.30, 14.60, 0.04, 359.61, 270.05},
	{-2571.70, 627.49, 14.60, 0.04, 359.61, 270.87},
    {-2571.64, 632.82, 14.61, 0.04, 359.61, 271.46},
	
}

for i,v in pairs(karetki_1) do
	local vehicle=createVehicle(416, v[1], v[2], v[3])
	--setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	addVehicleSirens(vehicle, 6, 2, false, false, false, true ) 
 
	setVehicleSirens(vehicle, 1, -0.800, 2.400, 0.000, 255, 255, 255, 255, 255 )

	setVehicleSirens(vehicle, 2, 0.800, 2.400, 0.000, 255, 255, 255, 255, 255 )

	setVehicleSirens(vehicle, 3, -1.000, -2.600, 0.000, 255, 0, 0, 255, 255 )

	setVehicleSirens(vehicle, 4, 1.000, -2.600, 0.000, 255, 0, 0, 255, 255 )

	setVehicleSirens(vehicle, 5, -0.400, 0.350, 0.690, 255, 0, 0, 255, 255 )

	setVehicleSirens(vehicle, 6, 0.600, 0.350, 0.690, 0, 0, 255, 255, 255 )
	--setVehicleColor( vehicle, 255, 0, 0, 0,0,0)
	setElementData(vehicle,"vehicle:rank",1)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:desc","SAMC-" .. i)
        addVehicleUpgrade(vehicle, 1025)
end

local helikoptery = {
	{-2643.47, 673.41, 67.40, 3.33, 0.00, 89.53},
    {-2673.41, 617.12, 67.40, 3.33, 359.93, 179.21},
}

for i,v in pairs(helikoptery) do
	local vehicle=createVehicle(563, v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	addVehicleSirens(vehicle, 2, 2, true, false, true, false ) 
	setVehicleSirens(vehicle, 1, -0.400, 2.600, -0.200, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 2, 0.400, 2.600, -0.200, 0, 0, 255, 255, 255 )
	setVehicleColor( vehicle, 99 ,184, 255, 255,255,255)
    addVehicleUpgrade(vehicle, 1096)
	setElementData(vehicle,"vehicle:rank",7)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:desc","SAMC-" ..i)
end



local karawany = {
	{ -2589.55, 652.93, 14.28, 0.79, 0.00, 269.56},
	{-2589.28, 658.19, 14.29, 0.74, 0.00, 271.01},

}

for i,v in pairs(karawany) do
	local vehicle=createVehicle(442, v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	addVehicleSirens(vehicle, 2, 2, true, false, true, false ) 
	setVehicleSirens(vehicle, 1, -0.400, 2.600, -0.200, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 2, 0.400, 2.600, -0.200, 0, 0, 255, 255, 255 )
	setVehicleColor( vehicle, 0, 0, 0, 255,255,255)
    addVehicleUpgrade(vehicle, 1096)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:rank",1)
end



local patrol = {
	{-2545.92, 657.88, 14.19, 0.16, 359.99, 89.85},
	{-2545.98, 652.67, 14.19, 0.16, 359.99, 90.42},
	{-2545.81, 647.50, 14.19, 0.16, 359.99, 89.75},
}

for i,v in pairs(patrol) do
	local vehicle=createVehicle(507, v[1], v[2], v[3])
	setVehicleColor(vehicle,99 ,184, 255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	addVehicleSirens(vehicle, 2, 2, true, false, true, false ) 
	setVehicleSirens(vehicle, 1, -0.400, 2.600, -0.200, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 2, 0.400, 2.600, -0.200, 0, 0, 255, 255, 255 )
	setVehicleColor( vehicle, 99 ,184, 255)
    addVehicleUpgrade(vehicle, 1025)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:rank",1)
	setElementData(vehicle,"vehicle:desc","SAMC - Jednostka Patrolowa")
end


local patrol_2 = {
	{-2545.42, 622.21, 14.60, 359.74, 359.99, 90.14},
	{-2545.90, 627.10, 14.60, 359.73, 359.99, 88.85},
}

for i,v in pairs(patrol_2) do
	local vehicle=createVehicle(489, v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	addVehicleSirens(vehicle, 2, 2, true, false, true, false ) 
	setVehicleSirens(vehicle, 1, -0.400, 2.600, -0.200, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 2, 0.400, 2.600, -0.200, 0, 0, 255, 255, 255 )
	setVehicleColor( vehicle, 99 ,184, 255, 255,255,255)
    addVehicleUpgrade(vehicle, 1025)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:rank",2)
	setElementData(vehicle,"vehicle:desc","SAMC - Jednostka Patrolowa")
end



local Inspekcja = {
	{-2546.22, 637.53, 14.28, 359.76, 0.00, 88.81},

}

for i,v in pairs(Inspekcja) do
	local vehicle=createVehicle(560, v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	addVehicleSirens(vehicle, 2, 2, true, false, true, false ) 
	setVehicleSirens(vehicle, 1, -0.400, 2.600, -0.200, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 2, 0.400, 2.600, -0.200, 0, 0, 255, 255, 255 )
	setVehicleColor( vehicle, 99 ,184, 255, 255,255,255)
    addVehicleUpgrade(vehicle, 1096)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:rank",10)
	setElementData(vehicle,"vehicle:desc","SAMC - Zarząd frakcyjny")
end
--]]
