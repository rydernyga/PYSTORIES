--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local missionPed
local missionBlip
local missionMarker
local missionVehicle
local screenW, screenH = guiGetScreenSize()

local code="Kosiarki"

local miejscakosiara2 = {
{-2477.98, -300.95, 41.19},
{-2506.71, -312.32, 39.72},
{-2525.96, -287.78, 38.62},
{-2520.62, -252.33, 38.50},
{-2491.20, -240.59, 39.41},
{-2450.82, -238.24, 40.69},
{-2409.06, -237.48, 40.11},
{-2438.76, -292.16, 39.92},
{-2471.39, -300.55, 41.36},
{-2478.44, -320.81, 41.72},
{-2479.99, -267.35, 39.26},
{-2443.68, -239.29, 40.71},
{-2461.71, -263.64, 39.60},
{-2513.34, -264.73, 38.89},
{-2508.26, -232.28, 38.73},
{-2484.73, -232.89, 39.95},
   
}
--local missionZaladunek=createMarker(-2382.81,-59.88,35.32-0.90,"cylinder",5,0,128,128)

local jobText=createElement("text")
setElementPosition(jobText, -2462.50, -319.02, 41.85)
setElementData(jobText, "name", "PRACA: Kierowca Kosiarki\nZAROBEK:\nGRACZ 50PLN | PREMIUM 85PLN\nOPIS: Koszenie trawy")

addEvent("startJobek", true)
addEventHandler("startJobek", resourceRoot, function(veh)
	if getElementData(localPlayer,"player:job") ~= code then return end
	missionVehicle=veh
	showMarker()
	exports["community-notyfikacje"]:addNotification("* Rozpocząłeś(aś) pracę.")
end)



function finishJob(plr,value1,value2)
	if plr ~= getLocalPlayer() then return end
	if getElementData(localPlayer,"player:job") ~= code then return end
	if value1 == true then
		if isElement(missionMarker) and missionMarker then
			destroyElement(missionMarker)
			missionMarker=nil
		end
		if isElement(missionBlip) and missionBlip then
			destroyElement(missionBlip)
			missionBlip=nil
		end
	end
	if value2 == true then
		if isElement(missionVehicle) and missionVehicle then
			triggerServerEvent("destroyVehicle", root, missionVehicle)
			missionVehicle=nil
		end
	end
end

addEvent("onFinish", true)
addEventHandler("onFinish", resourceRoot, function(plr)
	if plr~=localPlayer then return end
	finishJob(plr, true,true)
end)

function showNextPoint(el,md)
	if not md or el~=localPlayer then return end
	local veh=getPedOccupiedVehicle(el)
	if not veh then return end
	if getVehicleController(veh) ~= localPlayer then return end
	finishJob(el,true,false)
	setTimer(function()
		finishJob(true,false)
		--[[if getElementData(veh,"praca:punkt") == 5 then
			triggerServerEvent("givePlayerMoney", el, 46, 0)
			setElementData(veh,"praca:punkt", 0)
		else
			local xd = getElementData(veh, "praca:punkt") or 0
			setElementData(veh,"praca:punkt", xd+1)
			triggerServerEvent("givePlayerMoney", el, 46, 0)
		end--]]
		
		if getElementData(el,"player:premium") then
		exports["community-notyfikacje"]:addNotification("* Skosiłeś(aś) trawę i otrzymujesz 85 PLN.")
		triggerServerEvent("givePlayerMoney", el, 85, 0)
		setElementData(el,"player:srp", getElementData(el,"player:srp")+math.random(0,1))
		else
		exports["community-notyfikacje"]:addNotification("* Skosiłeś(aś) trawę i otrzymujesz 50 PLN.")
		triggerServerEvent("givePlayerMoney", el, 50, 0)
		setElementData(el,"player:srp", getElementData(el,"player:srp")+math.random(0,1))
		end
		showMarker()
	end, 100, 1)
end

function showMarker()
	local losuj = math.random(2, #miejscakosiara2)
	rnd=miejscakosiara2
	missionMarker=createMarker(rnd[losuj][1], rnd[losuj][2], rnd[losuj][3]-1, "checkpoint", 1.8, 255, 255, 255)
	missionBlip=createBlipAttachedTo(missionMarker, 12)
	addEventHandler("onClientMarkerHit", missionMarker, showNextPoint)
end


addEventHandler("onClientVehicleExit", resourceRoot, function(plr,seat)
	if seat~=0 then return end
	if plr~=localPlayer then return end
	finishJob(plr, true,true)
	setElementData(plr,"player:job",false)
	--outputChatBox("* Zakonczyles prace", 255, 0, 0)
	exports["community-notyfikacje"]:addNotification("* Zakończyłeś(aś) pracę.")
end)

local zone = createColCuboid(-2530.3452148438, -334.13607788086, 34.222534179688, 137.4, 105, 21.7)
function ucieczka( theElement, matchingDimension )
    if ( theElement == getLocalPlayer() ) then 
		if getElementData(theElement,"player:job") ~= code then return end
		finishJob(theElement, true,true)
		setElementData(theElement,"player:job",false)
		exports["community-notyfikacje"]:addNotification("* Opuściłeś(aś) miejsce pracy.")
    end
end
addEventHandler("onClientColShapeLeave",zone,ucieczka)


addEventHandler("onClientVehicleExplode", resourceRoot, function()
	if getElementModel(source) ~= 572 then return end
	local plr=getVehicleController(source)
	if plr~=localPlayer then return end
	finishJob(plr, true,true)
	setElementData(plr,"player:job",false)
	--outputChatBox("* Zakonczyles prace", 255, 0, 0)
	exports["community-notyfikacje"]:addNotification("* Zakończyłeś(aś) pracę.")
end)


addEventHandler("onClientResourceStop", resourceRoot, function()
	if getElementData(localPlayer, "player:job")==code then
		setElementFrozen(localPlayer, false)
		setElementData(localPlayer, "player:job", false)
	end
end,false,"high")



local jobOnline=true -- czy praca włączona
local jobMarker=createMarker(-2462.50, -319.02, 41.85-1, "cylinder", 1.5, 96, 96, 96) -- marker
createBlip(-2462.50, -319.02, 41.85, 46,2,0,0,0,0,0,275)


addCommandHandler("rozpocznij", function(cmd)
	plr=localPlayer
	if isPedInVehicle(plr) then return end
	if not isElementWithinMarker(plr,jobMarker) then return end
	if jobOnline == false then
		exports["community-notyfikacje"]:addNotification("* Praca jest wyłączona.")
		return
	end
	if getElementData(plr,"player:job") then
		exports["community-notyfikacje"]:addNotification("* Już posiadasz aktywą pracę.")
		return
	end
	setElementData(plr,"player:job", code)
	triggerServerEvent("startJobS", root,localPlayer)
end)

addEventHandler("onClientMarkerHit", jobMarker, function(el,md)
	if el~=localPlayer then return end
	if getElementType(el) == "player" then
		if isPedInVehicle(el) then return end
		exports["community-notyfikacje"]:addNotification("* Aby rozpocząć pracę wpisz /rozpocznij !")
	end
end)