--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local m=createMarker(816.54,857.04,12.79-1, "cylinder", 1.5, 100,0,200,75)
--local x,y,z = getElementPosition(m)
exports.customblips:createCustomBlip( x, y, 20, 20, "i/46.png" )
createBlip(816.54,857.04,12.79, 46,2,0,0,0,0,0,275)

local zone = createColCuboid(831.25268554688, 845.28582763672, 10.886642456055, 15.3, 14.6, 10.7)

local t=createElement("text")
setElementPosition(t,816.54,857.04,12.79)
setElementData(t,"name","PRACA: Górnik\nZAROBEK:\nGRACZ 235PLN | PREMIUM 300PLN\nOPIS: Przewożenie kamieniołomu")

addEvent("mower:stopJOB", true)
addEventHandler("mower:stopJOB", root, function(veh)
	if not veh then return end
	destroyElement(veh)
end)


addEventHandler("onMarkerHit", m, function(el,md)
	if getElementType(el) == "player" and md then
	if #getElementsWithinColShape(zone,"vehicle") >= 1 then outputChatBox("* Miejsce respu zajęte, poczekaj aż ktoś wyjedzie.",el) return end
		if getElementData(el,"player:job") then
			outputChatBox("* Już posiadasz aktywną pracę.",el,255,0,0)
			return
		end
		local veh=createVehicle(455, 836.05,853.97,12.90,355.3,358.2,115.4)
  		setElementData(veh,"temporary", true)
		setElementFrozen(veh,true)
  		setElementData(veh,"spawnedBy", el)
		setVehicleColor(veh,5,20,225)
		setElementData(veh,"vehicle:desc","Praca Górnika\n! Proszę zachować ostrożność !")
		setElementData(veh,"vehicle:mileage",0)
		setElementData(veh,"vehicle:fuel",50)
		warpPedIntoVehicle(el,veh)
		setElementData(el,"player:job","Górnik")
		triggerClientEvent(el, "mower:startJOB", resourceRoot, veh)
	end
end)

local function respawn()
  for i,v in ipairs(getElementsByType("vehicle", resourceRoot)) do
    if not getVehicleController(v) then
    	destroyElement(v)
    end
  end
end
setTimer(respawn, 60000, 0)