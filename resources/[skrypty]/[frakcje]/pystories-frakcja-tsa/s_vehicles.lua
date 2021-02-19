--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

--addCommandHandler("restart-taxi",function(plr,cmd) if isPlayerInTaxiFaction(plr) then restartResource(getThisResource()) end end)

local TAXI1 = {
		{-1527.22, 457.20, 7.15, 359.6, 0.0, 0.0},
		{-1527.11, 450.01, 7.19, 359.7, 360.0, 1.2},
		{-1526.99, 442.94, 7.19, 359.7, 0.0, 0.1},
		{-1526.93, 435.72, 7.19, 359.7, 0.0, 0.2},
}
local TAXI2 = {
		{-1526.59, 392.62, 6.89, 359.9, 360.0, 0.1},
		{-1527.07, 385.78, 6.89, 359.9, 0.0, 359.8},
}		
local TAXI3 = {
		{-1526.61, 428.70, 6.97, 359.7, 360.0, 1.4},
		{-1526.62, 421.61, 6.97, 359.7, 360.0, 0.0},
		{-1526.72, 414.19, 6.97, 359.7, 360.0, 0.2},
		{-1526.54, 407.59, 6.97, 359.7, 0.0, 0.6},
		{-1526.46, 400.23, 6.97, 359.7, 0.0, 0.6},
}
--[[local TAXI4 = {
		{-1535.29,365.40,7.19, -0.00, 0.00, 360.00,487},
		{-1550.29,365.40,7.19, -0.00, 0.00, 360.00,487},
		{-1565.29,365.40,7.19, -0.00, 0.00, 360.00,487},
}]]

local TAXI_LIDER = {
		--{-1589.08,367.51,6.8, 0.00, 0.00, 30},
		--{-1595.08,367.51,6.8, 0.00, 0.00, 30},
		--{-1601.08,367.51,6.8, 0.00, 0.00, 30},
}

taxi_object = {}
for i,v in pairs(TAXI1) do
	local vehicle = createVehicle(438, v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)

	removeVehicleSirens(vehicle)
	setElementData(vehicle,"vehicle:rank", 5)
	setElementData(vehicle,"vehicle:duty","TSA")
	setVehicleColor(vehicle, 255,192,0)
	addVehicleUpgrade(vehicle, 1096)
	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:fuel", 500)
	setElementData(vehicle,"vehicle:desc","TSA\n[SF_A-" .. i.."]\nPrzejazd darmowy!")
	setElementData(vehicle,"dbid", i)
	setVehiclePlateText(vehicle,"TSA-" .. i)
	--taxi_object[vehicle] = createObject(2051,0,0,0)
	--attachElements(taxi_object[vehicle],vehicle,0,0.98,0.15,0,0,0)

--	local flaga = createObject(2993,v[1], v[2], v[3])
--	attachElements(flaga,vehicle,1.01,-2,0.04,45,0,0)
end
for i,v in pairs(TAXI2) do
	local vehicle=createVehicle(560, v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	setVehicleColor( vehicle, 255, 255, 0, 255,255,255, 0,0,0 ,0,0,0 )
	setElementData(vehicle,"vehicle:rank", 15)
	setElementData(vehicle,"vehicle:duty","TSA")
	addVehicleUpgrade(vehicle, 1096)
	setVehicleColor(vehicle, 255,200,0)


	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:fuel", 500)
	setElementData(vehicle,"vehicle:desc","TSA\n[SF_B-" .. i.."]\nPrzejazd darmowy!")
	setElementData(vehicle,"dbid", i)
	--setElementData(vehicle,"vehicle:masked", 2)
	setVehiclePlateText(vehicle,"TSA-" .. i)

	--taxi_object[vehicle] = createObject(2052,0,0,0)
	--attachElements(taxi_object[vehicle],vehicle,0,0,0.92,0,0,90)

--	local flaga = createObject(2993,v[1], v[2], v[3])
--	attachElements(flaga,vehicle,0.91,-2,0.09,45,0,0)
end

for i,v in pairs(TAXI3) do
	local vehicle=createVehicle(420, v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	setVehicleColor( vehicle, 255, 160, 0, 255,255,255, 0,0,0 ,0,0,0 )
	setElementData(vehicle,"vehicle:rank", 10)
	setElementData(vehicle,"vehicle:duty","TSA")
	addVehicleUpgrade(vehicle, 1096)
	setVehicleColor(vehicle, 255,192,0)


	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:fuel", 500)
	setElementData(vehicle,"vehicle:desc","TSA\n[SF_C-" .. i.."]\nPrzejazd darmowy!")
	setElementData(vehicle,"dbid", i)
	setVehiclePlateText(vehicle,"TSA-C" .. i)
	--	taxi_object[vehicle] = createObject(2051,0,0,0)
	--attachElements(taxi_object[vehicle],vehicle,0,0.5,0.21,0,0,0)

--	local flaga = createObject(2993,v[1], v[2], v[3])
--	attachElements(flaga,vehicle,1.01,-2,0.04,45,0,0)
end

for i,v in pairs(TAXI4) do
	local vehicle=createVehicle(v[7], v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	setVehicleColor( vehicle, 255, 255, 255, 255,255,255, 0,0,0 ,0,0,0 )
	setElementData(vehicle,"vehicle:rank", 30)
	setElementData(vehicle,"vehicle:duty","TSA")
	setVehicleColor(vehicle, 255,255,0,0,0,0)


	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:fuel", 500)
	setElementData(vehicle,"vehicle:desc","TSA\n[SF_LOT-" .. i.."]\nPrzelot darmowy!")
	setElementData(vehicle,"dbid", i)
	setVehiclePlateText(vehicle,"TSA-" .. i)
end

for i,v in pairs(TAXI_LIDER) do
	local vehicle=createVehicle(541, v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleColor( vehicle, 255, 255, 0, 255,255,255, 0,0,0 ,0,0,0 )
	setElementData(vehicle,"vehicle:rank", 90)
	setElementData(vehicle,"vehicle:duty","TSA")
	setVehicleColor(vehicle, 255,200,0,255,255,255)
	addVehicleUpgrade(vehicle, 1096)


	setElementFrozen(vehicle,true)
	setElementData(vehicle,"pojazd_mk1",1)
	setElementData(vehicle,"pojazd_mk2",1)
	setElementData(vehicle,"vehicle:fuel", 500)
	setElementData(vehicle,"vehicle:desc","TSA\nZarząd")
	setElementData(vehicle,"dbid", i)
	--setElementData(vehicle,"vehicle:masked", 2)
	setVehiclePlateText(vehicle,"TSA-" .. i)
	--taxi_object[vehicle] = createObject(1163,0,0,0)
	--attachElements(taxi_object[vehicle],vehicle,0,-2,0.51,0,0,0)
end

for i,v in pairs(tesla) do
	local vehicle = createVehicle(507, v[1], v[2], v[3]+0.20)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)

	setElementData(vehicle,"vehicle:rank", 20)
	setElementData(vehicle,"vehicle:duty","TSA")
	setVehicleColor(vehicle, 255,192,0)
	setVehicleHeadLightColor(vehicle, 255,192,0)
	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:fuel", 500)
	setElementData(vehicle,"vehicle:desc","TSA\n[SF_T-" .. i.."]\nPrzejazd darmowy!\nWE INVITE YOU TO\nTESLA MOTORS")
	setVehiclePlateText(vehicle,"TSA-T" .. i)
	--taxi_object[vehicle] = createObject(2052,0,0,0)
	--attachElements(taxi_object[vehicle],vehicle,0,0,0.82,0,0,90)

--	local flaga = createObject(2993,v[1], v[2], v[3])
--	attachElements(flaga,vehicle,1.01,-2,0.04,45,0,0)
end



setTimer(function()
 	for i,vehicle in pairs(getElementsByType("vehicle", resourceRoot)) do
		setVehicleDamageProof(vehicle,true)
		local x,y,z = getElementPosition(vehicle)
		local r1,r2,r3 = getElementRotation(vehicle)
		setVehicleRespawnPosition(vehicle,x,y,z,r1,r2,r3)
		toggleVehicleRespawn(vehicle,true)
		setVehicleIdleRespawnDelay(vehicle,1000 * 60 * 60)
  	end
end,2000,1)
