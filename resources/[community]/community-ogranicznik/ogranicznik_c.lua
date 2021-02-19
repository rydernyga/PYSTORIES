--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--




local wybraneOgraniczenie=1
local ograniczenia={nil, 110, 75, 20}

local ograniczeniaModeli={
	-- Rowery --
	[509]=15,
	[510]=18,
	[481]=16,
	-- Rowery --
	
	[431]=120,
	--[525]=110, -- Holownik.
	[530]=10,
	[531]=80,
	[572]=40,
	[578]=50,
	--[586]=50,
	[462]=85,
	[440]=70,
	[455]=70,
	[514]=70,
	[403]=70,
	[514]=70,
	[515]=70,
	[407]=160,
	[544]=70,
--	[571]=10,
	-- elka
--	[589]=30,
        [524]=90,
}

local ograniczeniaWsteczneModeli={
	[531]=5,	-- tractor
	[530]=5,	-- wozek widlowy
	[572]=40,	-- kosiarka
	[571]=5,	-- kart

}

local function tempomat()
	local ograniczenie=ograniczenia[wybraneOgraniczenie]

	local v=getPedOccupiedVehicle(localPlayer)
	if not v then return end
	local vm=getElementModel(v)

	if getVehicleController(v)~=localPlayer then return end

	if not isVehicleOnGround(v) then return end




	local vx,vy,vz=getElementVelocity(v)

	if not getVehicleEngineState(v) then
--		outputDebugString(getDistanceBetweenPoints2D(0,0,vx,vy))
		if getDistanceBetweenPoints2D(0,0,vx,vy)<0.1 then
			vx,vy=0,0
			setElementVelocity(v,vx,vy,vz)
			return
		end
	end

	if ograniczeniaWsteczneModeli[vm] and getControlState("brake_reverse") and math.abs(vz)<0.03 then
		-- todo sprawdzic czy pojazd jedzie do tylu!
		local actualspeed = (vx^2 + vy^2 + vz^2)^(0.5) *1.0*180
		if actualspeed>ograniczeniaWsteczneModeli[vm] then
			setElementVelocity(v,vx*0.6,vy*0.6,vz*0.9)
		end
		return
	end


	if getVehicleType(v)~="Automobile" and not ograniczeniaModeli[vm] then return end
	if ograniczeniaModeli[vm] then
		ograniczenie=ograniczeniaModeli[vm]
	end

	if not ograniczenie then return end

	local actualspeed = (vx^2 + vy^2 + vz^2)^(0.5) *1.0*180
	if actualspeed>ograniczenie then
		setElementVelocity(v,vx*0.9,vy*0.9,vz*0.9)
	end
end

setTimer(tempomat, 50, 0)
addCommandHandler("Zmniejsz ograniczenie predkosci", function()
	if isCursorShowing() or isPedDoingGangDriveby(localPlayer) then return end
	local v=getPedOccupiedVehicle(localPlayer)
	if not v then return end
	if getVehicleController(v)~=localPlayer then return end
	if not isVehicleOnGround(v) then return end



	if getVehicleType(v)~="Automobile" then return end

	wybraneOgraniczenie=wybraneOgraniczenie-1
	if wybraneOgraniczenie<1 then wybraneOgraniczenie=#ograniczenia end
	if ograniczenia[wybraneOgraniczenie] then
		outputChatBox("* Ograniczenie prędkości ustawione na " .. ograniczenia[wybraneOgraniczenie] .. "km/h.", prl)
	else
		outputChatBox("* Ograniczenie prędkości wyłączone.", prl)
	end
end)
bindKey("mouse1","down", "Zmniejsz ograniczenie predkosci")


addCommandHandler("Zwieksz ograniczenie predkosci", function()
	if isCursorShowing() or isPedDoingGangDriveby(localPlayer) then return end
	local v=getPedOccupiedVehicle(localPlayer)
	if not v then return end
	if getVehicleType(v)~="Automobile" then return end
	if getVehicleController(v)~=localPlayer then return end
	if not isVehicleOnGround(v) then return end

	wybraneOgraniczenie=wybraneOgraniczenie+1
	if wybraneOgraniczenie>#ograniczenia then wybraneOgraniczenie=1 end
	if ograniczenia[wybraneOgraniczenie] then
		outputChatBox("* Ograniczenie prędkości ustawione na " .. ograniczenia[wybraneOgraniczenie] .. "km/h.", prl)
	else
		outputChatBox("* Ograniczenie prędkości wyłączone.", prl)
	end
end)

bindKey("mouse2","down", "Zwieksz ograniczenie predkosci")