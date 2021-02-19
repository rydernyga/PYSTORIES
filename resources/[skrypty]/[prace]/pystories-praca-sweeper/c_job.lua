--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local czas = getTickCount()

function speeed(car)
local a1,b1,c1 = getElementVelocity(car)
local fast = ((a1^2+b1^2+c1^2)^(0.5) *180)
return fast
end
local code="Sweepers" -- kod pracy
tekstury = {
	[0] = true,
	[1] = true,
	[2] = true,
}

function render(pojazd)
local x,y,z = getElementPosition(pojazd)
fxAddWaterSplash (x,y,z-1.9)
if (getTickCount() - czas) < 6000 then return end
czas = getTickCount()
--if (not isVehicleOnGround(pojazd)) then outputDebugString("ground FALSE")  return end
if speeed(pojazd) < 30 then return end
ziemia = getGroundPosition(x,y,z) - 0.001
hit,_,_,_,_,_,_,_,material,_,target = processLineOfSight (x,y,z, x, y, ziemia,true, false, true, true, false, true  )
if hit == false then
--outputDebugString("HIT FALSE")
 return end
if (not tekstury[material]) then
--outputDebugString("MATERIAL FALSE")
return end
local smiecie = getElementData(pojazd,"vehicle:trash")
local kg = math.random(0.8,1.2)
if not getElementData(localPlayer,"player:premium") then
limit = 200
else
limit = 200
end
if smiecie >= limit then return end
setElementData(pojazd,"vehicle:trash",smiecie+kg)

setElementData(pojazd,"vehicle:desc","Napełnienie zbiornika : ["..smiecie.." kg]")
end
local function shit()
local pojazd = getPedOccupiedVehicle(localPlayer)
if not pojazd then return end
if not getVehicleEngineState(pojazd) then return end
if speeed(pojazd) < 4 then
toggleControl ("brake_reverse", false )
else
toggleControl ("brake_reverse", true )
end
render(pojazd)
end


addEventHandler("onClientVehicleEnter", resourceRoot,
    function(thePlayer, seat)
        if thePlayer == getLocalPlayer() then
			if getElementData(source,"vehicle:job") == code then
			addEventHandler("onClientRender",root,shit)
			end
		end
end)
addEventHandler("onClientVehicleExit", resourceRoot,
    function(thePlayer, seat)
        if thePlayer == getLocalPlayer() then
			if getElementData(source,"vehicle:job") == code then
			removeEventHandler("onClientRender",root,shit)
			end
		end
end)


addCommandHandler("pos",function()
	x,y,z=getElementPosition(localPlayer)
	rotacja=getElementRotation(localPlayer)
  	p=string.format("%.2f,%.2f,%.2f",x,y,z,rotacja)
	setClipboard(p)
	outputChatBox(p)
end)
