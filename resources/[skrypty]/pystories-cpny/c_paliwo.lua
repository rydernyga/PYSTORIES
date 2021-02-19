--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

-- Kod odpowiadający za odejmowanie paliwa oraz dodawanie paliwa
-- Wszelkie inne rzeczy są w systemie pojazdów // Split
local time=getTickCount()
local isBike={[509]=true,[481]=true,[510]=true}

local function naliczaj(veh)
	if getTickCount()-time>5000 then
		time = getTickCount()
		local fuel = getElementData(veh, "vehicle:fuel") or 0
		local mileage = getElementData(veh,"vehicle:mileage") or 0
		local vx,vy,vz = getElementVelocity(veh)
		local spd=((vx^2 + vy^2 + vz^2)^(0.5)/2)
		if spd>0 then
			fuel = fuel-(spd*2)/3
			setElementData(veh, "vehicle:fuel", fuel)
			mileage = mileage+(spd)
			setElementData(veh, "vehicle:mileage", mileage)
		end
	end
end

addEventHandler("onClientRender", root, function()
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if not vehicle then return end
	if isBike[getElementModel(vehicle)] then return end
	if not getVehicleEngineState(vehicle) then return end
	if getElementData(vehicle,"vehicle:fuel") and getElementData(vehicle,"vehicle:fuel") or getElementData(vehicle,"vehicle:mileage") and getElementData(vehicle,"vehicle:mileage") then
		naliczaj(vehicle)
		if getElementData(vehicle,"vehicle:fuel")<1 then
			setVehicleEngineState(vehicle, false)
		end

	end
end)
