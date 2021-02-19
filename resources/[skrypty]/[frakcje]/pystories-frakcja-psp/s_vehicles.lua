--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

------------------------------------------------------------------------
local wozy_strazackie = {   
    
	-- TYLNIE WOZY STRAŻACKIE
	{-2121.24, -8.69, 35.55, 0.3, 0.0, 267.6, 407},
    {-2121.24, -19.63, 35.56, 0.3, 0.0, 271.6, 407},
	{-2121.24, -28.87, 35.56, 0.3, 0.0, 269.5, 407},
	{-2121.24, -38.07, 35.56, 0.3, 0.0, 269.9, 407},
	-- TYLNIE WOZY STRAŻACKIE
	
	-- PRZEDNIE WOZY STRAŻACKIE
	{-2108.35, -38.19, 35.56, 0.3, 0.0, 269.8, 407},
	{-2108.35, -28.41, 35.56, 0.3, 0.0, 270.8, 407},
	{-2108.35, -19.22, 35.56, 0.3, 360.0, 271.0, 407},
	{-2108.35, -9.09, 35.55, 0.3, 0.0, 269.5, 407},
	-- PRZEDNIE WOZY STRAŻACKIE

}
for i,v in pairs(wozy_strazackie) do
	local vehicle=createVehicle(v[7], v[1], v[2], v[3])
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	
	removeVehicleSirens(vehicle)
	setVehicleSirens ( vehicle, 1, 0.779, 3.197, 1.400, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 7, 2, true, false, true, true ) 
	setVehicleSirens ( vehicle, 2, -0.723, 3.184, 1.400, 255, 0, 0, 255, 255 )
	addVehicleSirens ( vehicle, 7, 2, true, false, true, true ) 
	setVehicleSirens ( vehicle, 3, 0.012, 3.184, 1.400, 255, 255, 255, 255, 255 )
	addVehicleSirens ( vehicle, 7, 2, true, false, true, true ) 
	setVehicleSirens ( vehicle, 4, -0.685, -3.102, 1.400, 0, 96, 255, 255, 255 )
	addVehicleSirens ( vehicle, 7, 2, true, false, true, true ) 
	setVehicleSirens ( vehicle, 5, 0.705, -3.104, 1.400, 0, 96, 255, 255, 255 )
	addVehicleSirens ( vehicle, 7, 2, true, false, true, true ) 
	setVehicleSirens ( vehicle, 6, 0.757, 4.100, -0.110, 255, 255, 255, 255, 255 )
	addVehicleSirens ( vehicle, 7, 2, true, false, true, true ) 
	setVehicleSirens ( vehicle, 7, -0.800, 4.100, -0.200, 255, 255, 255, 255, 255 )
	addVehicleSirens ( vehicle, 7, 2, true, false, true, true ) 
	setVehicleColor(vehicle, 255, 0, 0)
	addVehicleUpgrade(vehicle, 1025)


	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:fuel", 500)
	setElementData(vehicle,"vehicle:rank",1)
	--setElementData(vehicle,"vehicle:desc","Państwowa Straż Pożarna\n455[SF]2" .. i)
	setElementData(vehicle,"vehicle:desc","Wóz Strażacki\nPSP\nSan Fierro\n455-" .. i+610606 .."")
	setVehiclePlateText(vehicle,"S " .. i+610606)
	setElementData(vehicle,"vehicle:id", i+610606)
	setElementData(vehicle,"vehicle:ownedPlayer", 1)

end
-------------------------------------------------------------------------------

--[[

local pojazd_2 = {
	{-2120.72, -18.54, 35.56, 0.31, 0.00, 270.58,407},
}
for i,v in pairs(pojazd_2) do
	local vehicle=createVehicle(v[7], v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	
	removeVehicleSirens(vehicle)
	addVehicleSirens(vehicle, 6, 2, false, false, false, true ) 
	setVehicleSirens(vehicle, 1, -0.400, 0.900, 1.200, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 2, 0.000, 1.100, 1.200, 255, 255, 255, 255, 255 )
	setVehicleSirens(vehicle, 3, 0.400, 0.900, 1.200, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 4, 0.900, -3.750, 1.300, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 5, -0.900, -3.750, 1.300, 255, 0, 0, 255, 255 )
	setVehicleColor( vehicle, 255, 0, 0, 235,255,0, 0,0,0 ,0,0,0 )
	addVehicleUpgrade(vehicle, 1025)

    
	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:rank",2)
	setElementData(vehicle,"vehicle:desc","Wóz Strażacki\nPSP\nSan Fierro\n455-" .. i+620606 .."")
	setVehiclePlateText(vehicle,"S " .. i+620606)
	setElementData(vehicle,"vehicle:id", i+620606)
	setElementData(vehicle,"vehicle:ownedPlayer", 1)

end



local pojazd_3 = {

	{-2107.93, -28.35, 35.47, 0.04, 359.61, 270.08,416},

}
for i,v in pairs(pojazd_3) do
	local vehicle=createVehicle(v[7], v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	
	removeVehicleSirens(vehicle)
	addVehicleSirens(vehicle, 4, 2, true, false, false, true ) 
	setVehicleSirens(vehicle, 1, -0.300, 2.600, -0.200, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 2, 0.300, 2.600, -0.200, 0, 0, 255, 255, 255 )
	setVehicleSirens(vehicle, 3, -0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 4, 0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
	setVehicleColor(vehicle, 255,255,0 ,255,0,0)
	addVehicleUpgrade(vehicle, 1025)


	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:rank",2)
	setElementData(vehicle,"vehicle:desc","Wóz Strażacki\nPSP\nSan Fierro\n455-" .. i+630606 .."")
	setVehiclePlateText(vehicle,"S " .. i+630606)
	setElementData(vehicle,"vehicle:id", i+630606)
	setElementData(vehicle,"vehicle:ownedPlayer", 1)

end

local pojazd_4 = {
    {-2119.90, -9.40, 35.02, 359.14, 0.00, 270.42,552},
}
for i,v in pairs(pojazd_4) do
	local vehicle=createVehicle(v[7], v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	
	removeVehicleSirens(vehicle)

	addVehicleSirens(vehicle, 6, 2, false, false, false, true ) 
	setVehicleSirens(vehicle, 1, -0.550, 3.000, 0.585, 0, 50, 255, 255, 255 )
	setVehicleSirens(vehicle, 2, 0.550, 3.000, 0.585, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 3, -0.750, -3.200, 1.400, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 4, 0.750, -3.200, 1.400, 0, 0, 255, 255, 255 )
	setVehicleSirens(vehicle, 5, 1.240, 0.900, -0.200, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 6, -1.240, 0.900, -0.200, 0, 0, 255, 255, 255 )
	setVehicleColor(vehicle, 255,0,0,255,255,255 )
    addVehicleUpgrade(vehicle, 1025)

	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:rank",1)
	setElementData(vehicle,"vehicle:desc","Wóz Strażacki\nPSP\nSan Fierro\n455-" .. i+640606 .."")
	setVehiclePlateText(vehicle,"S " .. i+640606)
	setElementData(vehicle,"vehicle:id", i+640606)
	setElementData(vehicle,"vehicle:ownedPlayer", 1)

end


local pojazd_5 = {
	{-2108.34, -38.66, 35.14, 359.76, 0.00, 269.75,507},
}
for i,v in pairs(pojazd_5) do
	local vehicle=createVehicle(v[7], v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	
	removeVehicleSirens(vehicle)
	addVehicleSirens(vehicle, 4, 2, true, false, false, true ) 
	setVehicleSirens(vehicle, 1, -0.300, 2.600, -0.200, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 2, 0.300, 2.600, -0.200, 0, 0, 255, 255, 255 )
	setVehicleSirens(vehicle, 3, -0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 4, 0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
	setVehicleColor(vehicle, 255,0,0 )
	addVehicleUpgrade(vehicle, 1096)
	setElementData(vehicle,"vehicle:rank",19)
	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:desc","Wóz Strażacki\nPSP\nSan Fierro\n455-" .. i+650606 .."")
	setVehiclePlateText(vehicle,"S " .. i+650606)
	setElementData(vehicle,"vehicle:id", i+650606)
	setElementData(vehicle,"vehicle:ownedPlayer", 1)

end


local pojazd_6 = {
    {-2120.87, -38.93, 35.44, 359.15, 0.00, 270.97,490},
}
for i,v in pairs(pojazd_6) do
	local vehicle=createVehicle(v[7], v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	
	removeVehicleSirens(vehicle)
	addVehicleSirens(vehicle, 4, 2, true, false, false, true ) 
	setVehicleSirens(vehicle, 1, -0.300, 2.600, -0.200, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 2, 0.300, 2.600, -0.200, 0, 0, 255, 255, 255 )
	setVehicleSirens(vehicle, 3, -0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 4, 0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
	setVehicleColor( vehicle, 255, 0, 0, 235,255,0, 0,0,0 ,0,0,0 )
	addVehicleUpgrade(vehicle, 1025)
	setElementData(vehicle,"vehicle:rank",19)
	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:desc","Wóz Strażacki\nPSP\nSan Fierro\n455-" .. i+670606 .."")
	setVehiclePlateText(vehicle,"S " .. i+670606)
	setElementData(vehicle,"vehicle:id", i+670606)
	setElementData(vehicle,"vehicle:ownedPlayer", 1)

end

local pojazd_7 = {
    {-2099.42, 17.49, 35.12, 359.96, 0.00, 359.41,551},
    {-2102.90, 17.50, 35.12, 359.96, 0.00, 358.82,551},	
	
	
}
for i,v in pairs(pojazd_7) do
	local vehicle=createVehicle(v[7], v[1], v[2], v[3])
	setVehicleColor(vehicle,255,255,255,255)
	setElementRotation(vehicle, v[4], v[5], v[6])
	setVehicleEngineState(vehicle, false)
	setElementFrozen(vehicle, true)
	
	removeVehicleSirens(vehicle)
	addVehicleSirens(vehicle, 4, 2, true, false, false, true ) 
	setVehicleSirens(vehicle, 1, -0.300, 2.600, -0.200, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 2, 0.300, 2.600, -0.200, 0, 0, 255, 255, 255 )
	setVehicleSirens(vehicle, 3, -0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
	setVehicleSirens(vehicle, 4, 0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
	setVehicleColor( vehicle, 255, 0, 0, 235,255,0, 0,0,0 ,0,0,0 )
	addVehicleUpgrade(vehicle, 1096)
	setElementData(vehicle,"vehicle:rank",2)
	setElementFrozen(vehicle,true)
	setElementData(vehicle,"vehicle:fuel", 100)
	setElementData(vehicle,"vehicle:desc","Wóz Strażacki\nPSP\nSan Fierro\n455-" .. i+680606 .."")
	setVehiclePlateText(vehicle,"S " .. i+680606)
	setElementData(vehicle,"vehicle:id", i+680606)
	setElementData(vehicle,"vehicle:ownedPlayer", 1)

end
local pojazd_8 = {
    {-2106.44, 17.42, 35.04, 0.00, 0.00, 0.04,546},
    {-2109.92, 17.28, 35.04, 0.00, 0.00, 0.15,546},	
	
	
}
for i,v in pairs(pojazd_8) do
 local vehicle=createVehicle(v[7], v[1], v[2], v[3])
 setVehicleColor(vehicle,255,255,255,255)
 setElementRotation(vehicle, v[4], v[5], v[6])
 setVehicleEngineState(vehicle, false)
 setElementFrozen(vehicle, true)
 
 removeVehicleSirens(vehicle)
 addVehicleSirens(vehicle, 4, 2, true, false, false, true ) 
 setVehicleSirens(vehicle, 1, -0.300, 2.600, -0.200, 255, 0, 0, 255, 255 )
 setVehicleSirens(vehicle, 2, 0.300, 2.600, -0.200, 0, 0, 255, 255, 255 )
 setVehicleSirens(vehicle, 3, -0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
 setVehicleSirens(vehicle, 4, 0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
 setVehicleColor( vehicle, 255, 0, 0, 235,255,0, 0,0,0 ,0,0,0 )
setElementData(vehicle,"vehicle:rank",1)
addVehicleUpgrade(vehicle, 1025)
 setElementFrozen(vehicle,true)
 setElementData(vehicle,"vehicle:fuel", 100)
 setElementData(vehicle,"vehicle:desc","Wóz Strażacki\nA-PSP\nSan Fierro\n455-" .. i+730606 .."")
setVehiclePlateText(vehicle,"S " .. i+730606)
setElementData(vehicle,"vehicle:id", i+730606)
setElementData(vehicle,"vehicle:ownedPlayer", 1)
end


local pojazd_9 = {
    {-2118.61, -28.70, 35.56, 0.31, 359.93, 272.57,544},
    
}
for i,v in pairs(pojazd_9) do
 local vehicle=createVehicle(v[7], v[1], v[2], v[3])
 setVehicleColor(vehicle,255,255,255,255)
 setElementRotation(vehicle, v[4], v[5], v[6])
 setVehicleEngineState(vehicle, false)
 setElementFrozen(vehicle, true)
 
 removeVehicleSirens(vehicle)
 setElementData(vehicle,"vehicle:fire truck", true)
 addVehicleSirens(vehicle, 4, 2, true, false, false, true ) 
 setVehicleSirens(vehicle, 1, -0.300, 2.600, -0.200, 255, 0, 0, 255, 255 )
 setVehicleSirens(vehicle, 2, 0.300, 2.600, -0.200, 0, 0, 255, 255, 255 )
 setVehicleSirens(vehicle, 3, -0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
 setVehicleSirens(vehicle, 4, 0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
 setVehicleColor( vehicle, 255, 0, 0, 235,255,0, 0,0,0 ,0,0,0 )
	setElementData(vehicle,"vehicle:rank",2)
 addVehicleUpgrade(vehicle, 1025)
 setElementFrozen(vehicle,true)
 setElementData(vehicle,"vehicle:fuel", 100)
 setElementData(vehicle,"vehicle:desc","Wóz Strażacki\nA-PSP\nSan Fierro\n455-" .. i+740606 .."")
setVehiclePlateText(vehicle,"S " .. i+740606)
setElementData(vehicle,"vehicle:id", i+740606)
setElementData(vehicle,"vehicle:ownedPlayer", 1)
end


local pojazd_942 = {
    --{-2402.26,-20.06,35.57,359.1,0.0,88.4,482},
    
}
for i,v in pairs(pojazd_942) do
 local vehicle=createVehicle(v[7], v[1], v[2], v[3])
 setVehicleColor(vehicle,255,255,255,255)
 setElementRotation(vehicle, v[4], v[5], v[6])
 setVehicleEngineState(vehicle, false)
 setElementFrozen(vehicle, true)
 
 removeVehicleSirens(vehicle)
 setElementData(vehicle,"vehicle:fire truck", true)
 addVehicleSirens(vehicle, 4, 2, true, false, false, true ) 
 setVehicleSirens(vehicle, 1, -0.300, 2.600, -0.200, 255, 0, 0, 255, 255 )
 setVehicleSirens(vehicle, 2, 0.300, 2.600, -0.200, 0, 0, 255, 255, 255 )
 setVehicleSirens(vehicle, 3, -0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
 setVehicleSirens(vehicle, 4, 0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
 setVehicleColor( vehicle, 255, 0, 0, 235,255,0, 0,0,0 ,0,0,0 )
	setElementData(vehicle,"vehicle:rank",2)
 addVehicleUpgrade(vehicle, 1025)
 setElementFrozen(vehicle,true)
 setElementData(vehicle,"vehicle:fuel", 100)
 setElementData(vehicle,"vehicle:desc","Intruder\nA-PSP\nSan Fierro\n455-" .. i+750606 .."")
setVehiclePlateText(vehicle,"S " .. i+750606)
setElementData(vehicle,"vehicle:id", i+750606)
setElementData(vehicle,"vehicle:ownedPlayer", 1)
end


local pojazd_9421 = {
    --{-2402.32,-25.98,35.55,359.3,0.0,93.3,554},
    
}
for i,v in pairs(pojazd_9421) do
 local vehicle=createVehicle(v[7], v[1], v[2], v[3])
 setVehicleColor(vehicle,255,255,255,255)
 setElementRotation(vehicle, v[4], v[5], v[6])
 setVehicleEngineState(vehicle, false)
 setElementFrozen(vehicle, true)
 
 removeVehicleSirens(vehicle)
 setElementData(vehicle,"vehicle:ambulance", true)
 addVehicleSirens(vehicle, 4, 2, true, false, false, true ) 
 setVehicleSirens(vehicle, 1, -0.300, 2.600, -0.200, 255, 0, 0, 255, 255 )
 setVehicleSirens(vehicle, 2, 0.300, 2.600, -0.200, 0, 0, 255, 255, 255 )
 setVehicleSirens(vehicle, 3, -0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
 setVehicleSirens(vehicle, 4, 0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
 setVehicleColor( vehicle, 255, 0, 0, 235,255,0, 0,0,0 ,0,0,0 )
	setElementData(vehicle,"vehicle:rank",2)
 addVehicleUpgrade(vehicle, 1025)
 setElementFrozen(vehicle,true)
 setElementData(vehicle,"vehicle:fuel", 100)
 setElementData(vehicle,"vehicle:desc","Wóz Strażacki\nA-PSP\nSan Fierro\n455-" .. i+760606 .."")
setVehiclePlateText(vehicle,"S " .. i+760606)
setElementData(vehicle,"vehicle:id", i+760606)
setElementData(vehicle,"vehicle:ownedPlayer", 1)
end

local pojazd_10 = {
    --{-2148.30,-85.15,35.99, 0.31, 359.93, 272.57,431},
    
}
for i,v in pairs(pojazd_10) do
 local vehicle=createVehicle(v[7], v[1], v[2], v[3])
 setVehicleColor(vehicle,255,255,255,255)
 setElementRotation(vehicle, v[4], v[5], v[6])
 setVehicleEngineState(vehicle, false)
 setElementFrozen(vehicle, true)
 
 removeVehicleSirens(vehicle)
 setElementData(vehicle,"vehicle:fire truck", true)
 addVehicleSirens(vehicle, 4, 2, true, false, false, true ) 
 setVehicleSirens(vehicle, 1, -0.300, 2.600, -0.200, 255, 0, 0, 255, 255 )
 setVehicleSirens(vehicle, 2, 0.300, 2.600, -0.200, 0, 0, 255, 255, 255 )
 setVehicleSirens(vehicle, 3, -0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
 setVehicleSirens(vehicle, 4, 0.800, -2.500, 0.000, 255, 0, 0, 255, 255 )
 setVehicleColor( vehicle, 255, 0, 0, 235,255,0, 0,0,0 ,0,0,0 )
setElementData(vehicle,"vehicle:rank",96)
 addVehicleUpgrade(vehicle, 1025)
 setElementFrozen(vehicle,true)
 setElementData(vehicle,"vehicle:fuel", 100)
 setElementData(vehicle,"vehicle:desc","Wóz Strażacki\nSzkolenia PSP\nSan Fierro\n455-" .. i+770606 .."")
setVehiclePlateText(vehicle,"S " .. i+770606)
setElementData(vehicle,"vehicle:id", i+770606)
setElementData(vehicle,"vehicle:ownedPlayer", 1)
end

--]]

addEventHandler("onVehicleEnter", resourceRoot, function(plr,seat,jacked)
	if seat == 0 then
		--setElementFrozen(source,false)
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
		setElementData(vehicle,"vehicle:duty","PSP")
		setElementFrozen(vehicle,true)
  	end
end,2000,1)



