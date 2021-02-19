--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local missionBlip
local missionPickup
local missionVehicle
local missionPoints = {
{630.94,890.23,-42.96},
{495.45,791.72,-22.04},
{724.32,762.68,-7.42},
{709.23,915.97,-18.65},
{631.59,1000.39,5.85},
{594.43,793.24,-31.32},
{609.31,820.45,-42.95},
{441.81,883.33,-5.24},
}

local copyright="--"

local function finishJob(missionValue)
    if isElement(missionBlip) then
        destroyElement(missionBlip)
        missionBlip=nil
    end
    if isElement(missionPickup) then
        destroyElement(missionPickup)
        missionPickup=nil
    end
    if missionValue then
        setElementData(localPlayer,"player:job",false)
		outputChatBox("* Praca górnika została zakończona pomyślnie.")
        triggerServerEvent("mower:stopJOB", localPlayer, missionVehicle)
        missionVehicle=nil
        missionPickup=nil
        missionBlip=nil
    end
end

addEventHandler("onClientVehicleExit",root,function (plr,seat)
if plr == localPlayer and seat == 0 and source == missionVehicle then
local vh = missionVehicle
finishJob(missionVehicle)
end
end)


function showMarker()
    el=localPlayer -- testing to job
    veh=getPedOccupiedVehicle(el)
    if not getPedOccupiedVehicle(el) then return end
    if getVehicleController(veh) == el then
        rnd=missionPoints[math.random(#missionPoints)]
        missionPickup=createMarker(rnd[1], rnd[2], rnd[3],"checkpoint",4,25,200,55)
        missionBlip=createBlip(rnd[1], rnd[2], rnd[3], 12)
        addEventHandler("onClientMarkerHit", missionPickup, function(el,md)
		outputChatBox("* Udaj się do następnego punktu zaznaczonym na mapie blipem różowego 'C'!",0,255,0)
            if el~=localPlayer then return end
            --triggerServerEvent("dodajGraczuKaseBUS", localPlayer, 235,0)
			
			if getElementData(el,"player:premium") then
			--outputChatBox("* Sprzątnąłeś(aś) śmieci z drogi i otrzymujesz 300 PLN.")
			triggerServerEvent("givePlayerMoney", el, 300, 0)
			setElementData(el,"player:srp", getElementData(el,"player:srp")+math.random(0,1))
			else
			--outputChatBox("* Sprzątnąłeś(aś) śmieci z drogi i otrzymujesz 235 PLN.")
			triggerServerEvent("givePlayerMoney", el, 235, 0)
			setElementData(el,"player:srp", getElementData(el,"player:srp")+math.random(0,1))
			end
			
            finishJob(false)
            showMarker()
        end)
    end
end

addEvent("mower:startJOB", true)
addEventHandler("mower:startJOB", resourceRoot, function(veh)
    outputChatBox("* Praca górnika została rozpoczęta pomyślnie.")
	outputChatBox("* Udaj się do punktu zaznaczonym na mapie blipem różowego 'C'!")
    missionVehicle=veh
    showMarker()
end)

addEventHandler("onClientResourceStop", resourceRoot, function()
    if getElementData(localPlayer,"player:job") and getElementData(localPlayer,"player:job") == "Górnik" then
        setElementData(localPlayer,"player:job",false)
    end
end)

fileDelete("c_job.lua")