local bikesPoints={
    {462, -1923.78, 864.34, 35.01, 359.5, 0.0, 267.4},
	{462, -1921.11, 864.28, 35.01, 0.4, 0.0, 269.5},
	{462, -1918.44, 864.27, 35.01, 359.5, 0.0, 270.9},
	
	{462, -1915.23, 865.02, 35.01, 359.5, 360.0, 359.1},
	{462, -1915.13, 867.78, 35.01, 359.5, 360.0, 0.3},
	{462, -1915.13, 870.63, 35.01, 359.5, 360.0, 359.3},
	
--	{462, x, y, z, rx, ry, rz},
}

function OBikes()
    local object={}

    for _,v in pairs(bikesPoints) do
        --local blip=createBlip(v[2], v[3], v[4], 46)
           local vehicle = createVehicle(v[1], v[2], v[3], v[4], v[5], v[6], v[7])
            setElementFrozen(vehicle, true)
            setElementData(vehicle,"vehicle:desc","-=-=-=-=-=-=-\nPubliczna\nMotorynka\n-=-=-=-=-=-=-")
			setVehicleColor(vehicle, 0, 100, 0, 255, 255, 255 )
            setVehicleHandling(vehicle,"maxVelocity", 41)
			setElementData(vehicle,"vehicle:fuel",100)
    end

    function object:respawn(plr)
        setElementData(vehicle,"vehicle:desc","-=-=-=-=-=-=-\nPubliczna\nMotorynka\n-=-=-=-=-=-=-")
        setElementFrozen(source, true)
		setElementDimension(source,0)
		setElementInterior(source,0)
		setElementData(source,"vehicle:fuel",100)
		setVehicleOverrideLights(source,1)
    end
    addEventHandler("onVehicleRespawn", resourceRoot, function() object:respawn() end)

    function object:enter(plr,seat)
        setElementFrozen(source,false)
        toggleVehicleRespawn(source, true)
        setVehicleIdleRespawnDelay(source, 15000)
    end
    addEventHandler("onVehicleEnter", resourceRoot, function(plr,seat) object:enter(plr,seat) end)
end
OBikes()