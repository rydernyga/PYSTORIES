--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--
    
local missionTimer
local missionVehicle
local missionWysypiska = {
    {-1882.29,-1696.85,21.74},
}
local missionPoints = {
-- SF
{-1885.32, -168.34, 11.55},
{-2021.95, -47.12, 34.94},
{-2084.07, 63.80, 33.93},
{-2236.24, 113.59, 34.91},
{-2286.37, 0.77, 34.92},
{-2480.73, -195.76, 25.22},
{-2655.85, -188.80, 3.73},
{-2656.17, -170.30, 3.63},
{-2656.75, -125.38, 3.63},
{-2656.20, -89.94, 3.74},
{-2757.01, -87.42, 6.61},
{-2755.82, -120.14, 6.49},
{-2755.59, -146.41, 6.49},
{-2756.81, -178.59, 6.48},
{-2758.32, -59.72, 6.62},
{-2760.57, -17.40, 6.52},
{-2763.59, 16.19, 6.56},
{-2763.60, 55.35, 6.61},
{-2762.28, 93.71, 6.53},
{-2758.05, 142.78, 6.59},
{-2758.32, 200.33, 6.49},
{-2846.91, 701.12, 24.64},
{-2874.92, 777.23, 33.60},
{-2832.72, 909.55, 43.65},
{-2870.44, 996.81, 39.63},
{-2889.30, 1067.99, 31.09},
{-2888.35, 1150.41, 15.76},
{-2373.27, 1290.51, 20.77},
{-2114.49, 1146.04, 54.71},
{-1901.19, 1166.52, 45.04},
{-1745.47, 1296.51, 6.65},
{-1612.59, 1064.79, 6.78},
{-1630.12, 883.92, 8.77},
{-1880.13, 565.11, 34.47},

}
local countMarkers=#missionPoints
for i,v in ipairs(missionWysypiska) do
    local marker=createMarker(v[1], v[2], v[3]-1, "corona", 6,0,255,150)
    setElementData(marker,"wysypisko",true)
	local blip = createBlip(-1882.45,-1696.00,21.74, 46,2,0,0,0,0,0,275)


    local t=createElement("text")
    setElementData(t,"name","Wyładowywanie śmieci.")
    setElementPosition(t, v[1], v[2], v[3])
end

function destroyBlipsAttachedTo(eleme)
	local attached = getAttachedElements ( eleme )
	if ( attached ) then
		for k,element in ipairs(attached) do
			if getElementType ( element ) == "blip" then
				destroyElement ( element )
			end
		end
	end
end

function showMarker()
     for i,rnd in ipairs(missionPoints) do
        markerr=createMarker(rnd[1], rnd[2], rnd[3], "checkpoint", 5, 255, 255, 255, 100)
        setElementData(markerr,"wlasnosc",getPlayerName(localPlayer))
		createBlipAttachedTo(markerr, 0,2,0,255,0)
     end
end

addEventHandler("onClientVehicleExit",root,function (plr,seat)
	if plr == localPlayer and seat == 0 and getElementData(source,"zapelnienie") then
	--	triggerServerEvent("cancelJob",resourceRoot,source)
		setElementData(plr,"player:job",nil)
		for i,v in ipairs(getElementsByType("marker")) do
			if getElementData(v,"wlasnosc") == getPlayerName(plr) then
				destroyBlipsAttachedTo(v)
				destroyElement(v)
			end
		end
	end
end)

addEventHandler("onClientMarkerHit", resourceRoot, function(el,md)
    if el~=localPlayer then return end
    local veh=getPedOccupiedVehicle(localPlayer)
	if not veh then return end -- nie powinno sie wydarzyc
	if getVehicleController(veh) ~= localPlayer then return end
		if getElementData(veh,"vehicle:praca") and getElementData(veh,"vehicle:praca")=="Smieciarka" then
			if getElementData(source,"wysypisko") then
			local zapelnienie = getElementData(veh,"zapelnienie")
				if zapelnienie and zapelnienie == 0 then -- procenty
               	outputChatBox ("* Twoja śmieciarka jest pusta.")
				return
				end
			
			if countMarkers == 0 then
            showMarker()
			end
        setElementData(veh,"zapelnienie",0)
        setElementData(veh,"vehicle:desc","Kierowca Śmieciarki\n! Proszę zachować ostrożność !\n\n[ Zapełnienie Śmieciarki: 0% ]")
        triggerServerEvent("wyplacPieniadze", localPlayer, zapelnienie)
        return
		end
    if countMarkers == 0 then
        showMarker()
    else
        local zapelnienie=getElementData(veh,"zapelnienie")
        if zapelnienie and zapelnienie >= 100 then -- procenty
            outputChatBox("* Posiadasz już : "..zapelnienie.."% śmieci.")
            return
        end
        marker=source
        outputChatBox("* Trwa Ladowanie...")
		destroyBlipsAttachedTo(marker)
		destroyElement(marker)
        if not isTimer(missionTimer) then
		triggerServerEvent("setVehFreeze", localPlayer, veh, true)
            missionTimer=setTimer(function()
                countMarkers=countMarkers-1
                local poziom=getElementData(veh,"zapelnienie") or 0
                poziom=math.min(poziom+math.random(1,3),100)
                setElementData(veh,"zapelnienie", poziom)
                setElementData(veh,"vehicle:desc","Kierowca Śmieciarki\n! Proszę zachować ostrożność !\n\n[ Zapełnienie Śmieciarki: "..poziom.."% ]")
               --outputChatBox("#FFFFFF Zawartosc śmieciarki#00ABFF: "..poziom.."%", 0, 0, 0, true)
				triggerServerEvent("setVehFreeze", localPlayer, veh, false)
            end, 3000, 1)
        else
            killTimer(missionTimer)
        end
     end
end
end)

setTimer(function()
    for _,player in ipairs(getElementsByType("player")) do
        if getElementData(player,"player:job") == "Śmieciarz" then
            if not getPedOccupiedVehicle(player) and getPedOccupiedVehicle(player) ~= missionVehicle then
                for _,marker in ipairs(getElementsByType("marker", resourceRoot)) do
                    if getElementData(marker,"wlasnosc") == getPlayerName(player) then
                        destroyElement(marker)
                        setElementData(player, "player:job", false)
                    end
                end
            end
        end
    end
end, 15000, 0)

addEventHandler("onClientVehicleEnter", resourceRoot, function(plr,seat)
     if plr~=localPlayer then return end
     if seat~=0 then return end
     missionVehicle=source
     setElementData(source,"zapelnienie",0)
     setElementData(source,"vehicle:desc","Kierowca Śmieciarki\n! Proszę zachować ostrożność !\n\n[ Zapełnienie Śmieciarki: 0% ]")
     setElementData(plr,"player:job","Śmieciarz")
     outputChatBox ("* Rozpoczynasz prace jezdzij po ZIELONYCH PUNKTACH.")
     outputChatBox ("* Po uzbieraniu min 1% mozesz wysypac smieci na Wysypisku obok.")
	 outputChatBox ("* Oznaczonym Punktem W .")
     showMarker()
end)

addEventHandler("onClientResourceStop", resourceRoot, function()
    if getElementData(localPlayer,"player:job") == "Śmieciarz" then
        setElementData(localPlayer,"player:job",false)
    end
end)