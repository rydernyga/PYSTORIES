--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local districtsBus = {
	-- TRASA LAS VENTURAS --
    {1392.68, 1190.70, 10.76},
	{1465.73, 1130.76, 10.67},
	{1504.71, 980.35, 10.67},
	{1564.66, 870.68, 12.93},
	{1564.98, 692.90, 10.67},
	{1385.65, 655.91, 10.67},
	{1350.63, 767.81, 10.67},
	{1456.84, 650.70, 10.69},
	{1570.10, 751.38, 10.67},
	{1569.48, 923.47, 10.67},
	{1569.62, 1120.28, 10.67},
	{1649.87, 1189.14, 10.67},
	{1714.66, 1270.74, 10.67},
	{1714.37, 1443.89, 10.67},
	{1945.30, 1450.56, 10.67},
	{2059.99, 1458.63, 10.67},
	{2154.58, 1880.72, 10.68},
	{2155.07, 2200.53, 10.67},
	{2183.42, 2347.94, 10.67},
	{2108.02, 2277.60, 10.67},
	{2119.74, 2126.73, 10.67},
	{1927.48, 2105.77, 10.74},
	{1839.87, 2055.50, 10.81},
	{1747.75, 2175.87, 10.76},
	{1579.03, 2176.02, 10.68},
	{1559.86, 2396.40, 10.67},
	{1384.00, 2384.70, 10.68},
	{1415.06, 2310.68, 10.67},
	{1565.41, 2300.96, 10.67},
	{1550.22, 2175.56, 10.68},
	{1525.21, 2063.19, 10.68},
	{1383.39, 2039.77, 10.67},
	{1396.54, 1869.25, 10.69},
	{1642.94, 1863.01, 10.67},
	{1671.29, 1708.97, 10.67},
	{1736.63, 1639.04, 9.34},
	{1729.94, 1315.06, 10.68},
	{1643.80, 1194.86, 10.67},
	{1502.84, 1136.95, 10.73},
	{1395.39, 1196.90, 10.72},
	{1371.83, 1156.24, 10.82},
	-- TRASA LAS VENTURAS --
}

local jobTarget
local jobMarker
local jobVehicle
local maxTarget = #districtsBus

function finishJob()
    if jobMarker and isElement(jobMarker) then
        destroyElement(jobMarker)
        jobMarker = nil
    end
    
    if jobTarget and isElement(jobTarget) then
        destroyElement(jobTarget)
        jobTarget = nil
        jobTarget = 0
        
    end
    
triggerServerEvent("destroyVeh", localPlayer)

end


function busDriver(el, md)
    if el ~= localPlayer or not md then return end
    if jobTarget > maxTarget and getPedOccupiedVehicle(el) then return end
    if jobTarget == maxTarget and not getPedOccupiedVehicle(el) then return end
    
    if jobTarget == #districtsBus then
        finishJob()
        playSoundFrontEnd(5)
        outputChatBox("* Zakończyłeś(aś) pracę.")
		destroyElement(blip)
		setElementData(el, "blokada:reczny_latdziur", false)
    else
        showMarker()
        playSoundFrontEnd(12)
		setTimer(function()
        --triggerServerEvent("givePlayerMoney", localPlayer, 12, 0)
		if getElementData(localPlayer,"player:premium") then
		triggerServerEvent("givePlayerMoney", localPlayer, 350, 0)
		setElementData(localPlayer,"player:srp", getElementData(localPlayer,"player:srp")+math.random(0,1))
		else
		triggerServerEvent("givePlayerMoney", localPlayer, 300, 0)
		setElementData(localPlayer,"player:srp", getElementData(localPlayer,"player:srp")+math.random(0,1))
		end
		end, 8000, 1)
    end
end

function showMarker()
    if jobMarker and isElement(jobMarker) then
		local veh=getPedOccupiedVehicle(localPlayer)
		if not veh then return end
		if getVehicleController(veh) ~= localPlayer then return end
        --outputChatBox("* Załatałeś(aś) dziure. Jedź do kolejnej dziury.")
        --destroyElement(jobMarker)
        --jobMarker = nil
		
		outputChatBox("* Łatasz dziurę, odczekaj 10 sekund.")
		--destroyElement(blip)
		setElementFrozen(veh, true)
		setTimer(function()
		setElementFrozen(veh, false)
		outputChatBox("* Załatałeś(aś) dziure. Jedź do kolejnej dziury.")
        --destroyElement(jobMarker)
        --jobMarker = nil
		end, 8000, 1)
		destroyElement(jobMarker)
		destroyElement(blip)
        jobMarker = nil
		
    end
    
    jobTarget = jobTarget + 1
    jobMarker = createMarker(districtsBus[jobTarget][1], districtsBus[jobTarget][2], districtsBus[jobTarget][3], "checkpoint", 2.5, 255, 255, 255)
    blip = createBlipAttachedTo(jobMarker, 41)
	
    if districtsBus[jobTarget+1] then
        ile = districtsBus[jobTarget+1]
        setMarkerTarget(jobMarker, ile[1], ile[2], ile[3])
    end
    
    addEventHandler("onClientMarkerHit", jobMarker, busDriver)
end

addEvent("STARTJobBus", true)
addEventHandler("STARTJobBus", resourceRoot, function(veh)
    outputChatBox("* Rozpocząłeś(aś) pracę.")
    jobVehicle = veh
    jobTarget = 0
    showMarker()
end)

addEventHandler("onClientResourceStop", resourceRoot, function()
    if jobVehicle and getElementData(localPlayer, "player:job") then
        setElementData(localPlayer, "player:job", false)
    end
end)

addEventHandler("onClientVehicleExit", resourceRoot, function(plr, seat)
    if seat == 0 then
        if plr == localPlayer then
            finishJob()
			destroyElement(blip)
            outputChatBox("* Zakończyłeś(aś) pracę")
			setElementData(el, "blokada:reczny_latdziur", false)
        end
    end
end)