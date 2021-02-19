--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

createBlip(-1624.73, 690.99, 7.19, 30,2,0,0,0,0,0,275) 

function getPointFrontOfElement(element,distance)
	if not element then return end

    local x, y, z = getElementPosition ( element )
    local rx, ry, rz = getElementRotation ( element )
    x = x + (distance * (math.sin(math.rad(-rz))) )
    y = y + (distance * (math.cos(math.rad(-rz))) )
	return x,y,z
end

function getPositionFromElementAtOffset(element,x,y,z)
	if not element then return end
	if not x or not y or not z then      
		return x, y, z   
	end        
	local matrix = getElementMatrix ( element )
	local offX = x * matrix[1][1] + y * matrix[2][1] + z * matrix[3][1] + matrix[4][1]
	local offY = x * matrix[1][2] + y * matrix[2][2] + z * matrix[3][2] + matrix[4][2]
	local offZ = x * matrix[1][3] + y * matrix[2][3] + z * matrix[3][3] + matrix[4][3]
	return offX, offY, offZ
end

function getVehicleWheelPosition(vehicle,wheel)
	local x, y, z = 0, 0, 0
	local minX, minY, minZ, maxX, maxY, maxZ = getElementBoundingBox(vehicle)
	if wheel == 1 then
		x, y, z = getPositionFromElementAtOffset(vehicle, minX, maxY, minZ)
	elseif wheel == 2 then
		x, y, z = getPositionFromElementAtOffset(vehicle, minX, -maxY, minZ)		
	elseif wheel == 3 then
		x, y, z = getPositionFromElementAtOffset(vehicle, maxX, maxY, minZ)
	elseif wheel == 4 then
		x, y, z = getPositionFromElementAtOffset(vehicle, maxX, -maxY, minZ)
	end	 
	return x, y, z
end

function onClientRender()
	if isPedInVehicle(localPlayer) then	
	 	local vehicle = getPedOccupiedVehicle(localPlayer)
	 	if not vehicle then return end

		local stinger = getElementsByType("object")
		
		--local wx0, wy0, wz0 = getVehicleWheelPosition(vehicle,0)
		local wx1, wy1, wz1 = getVehicleWheelPosition(vehicle,1)
		local wx2, wy2, wz2 = getVehicleWheelPosition(vehicle,2)
		local wx3, wy3, wz3 = getVehicleWheelPosition(vehicle,3)
		local wx4, wy4, wz4 = getVehicleWheelPosition(vehicle,4)
		
		-- for visual debug wheel positions
		--dxDrawLine3D(wx1, wy1, wz1, wx2, wy2, wz2, tocolor(0,255,0))
		--dxDrawLine3D(wx3, wy3, wz3, wx4, wy4, wz4, tocolor(0,255,0))
		
		for k, v in pairs(stinger) do
			if getElementData(v,"isStinger") == true then
				local vx, vy, vz = getElementPosition(v)
				if getDistanceBetweenPoints3D(wx1, wy1, wz1, vx, vy, vz) <= 2.0 then
					setVehicleWheelStates(vehicle, 1, -1, -1, -1)	
				end
				if getDistanceBetweenPoints3D(wx2, wy2, wz2, vx, vy, vz) <= 2.0 then
					setVehicleWheelStates(vehicle, -1, 1, -1, -1)	
				end
				if getDistanceBetweenPoints3D(wx3, wy3, wz3, vx, vy, vz) <= 2.0 then
					setVehicleWheelStates(vehicle, -1, -1, 1, -1)	
				end
				if getDistanceBetweenPoints3D(wx4, wy4, wz4, vx, vy, vz) <= 2.0 then
					setVehicleWheelStates(vehicle, -1, -1, -1, 1)	
				end		
			end										
		end
	 end
end
addEventHandler("onClientRender",getRootElement(), onClientRender)

function onCreateStinger(x, y, z)
	if(getDistanceBetweenPoints3D(x, y, z, getElementPosition(localPlayer)) <= 10 ) then
		local sound = playSound3D("plant.wav", x, y, z)
		setSoundMaxDistance(sound, 10)
	end
end 
addEvent("onCreateStinger", true)
addEventHandler("onCreateStinger", getRootElement(), onCreateStinger)