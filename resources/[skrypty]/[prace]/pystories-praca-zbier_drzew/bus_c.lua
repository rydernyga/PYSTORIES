local districtsBus = {
    {301.21, 1174.47, 9.74-0.2},
	{318.07, 1170.61, 8.92-0.2},
	{376.91, 1157.90, 7.97},
	{369.80, 1141.66, 9.52},
	{362.06, 1124.33, 10.84},
	{313.37, 1095.50, 13.64},
	{284.99, 1112.96, 10.42},
	{300.23, 1120.49, 10.20},
	{320.16, 1152.54, 8.59},
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
		setElementData(el, "blokada:reczny_drwal", false)
    else
        showMarker()
        playSoundFrontEnd(12)
		setTimer(function()
        --triggerServerEvent("givePlayerMoney", localPlayer, 12, 0)
		if getElementData(localPlayer,"player:premium") then
		triggerServerEvent("givePlayerMoney", localPlayer, 350, 0)
		setElementData(localPlayer,"player:srp", getElementData(localPlayer,"player:srp")+math.random(0,1))
		else
		triggerServerEvent("givePlayerMoney", localPlayer, 250, 0)
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
		
		outputChatBox("* Zbierasz drewno, odczekaj 10 sekund.")
		--destroyElement(blip)
		setElementFrozen(veh, true)
		setTimer(function()
		setElementFrozen(veh, false)
		outputChatBox("* Zebrałeś(aś) drewno na bagażnik, jedź dalej.")
        --destroyElement(jobMarker)
        --jobMarker = nil
		end, 8000, 1)
		destroyElement(jobMarker)
		destroyElement(blip)
        jobMarker = nil
		
    end
    
    jobTarget = jobTarget + 1
    jobMarker = createMarker(districtsBus[jobTarget][1], districtsBus[jobTarget][2], districtsBus[jobTarget][3], "checkpoint", 4, 255, 255, 255)
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
			setElementData(el, "blokada:reczny_drwal", false)
        end
    end
end)