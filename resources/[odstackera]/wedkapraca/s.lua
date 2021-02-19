--[[

    Autor: EHX or Iney.
	Job: Wedkarz
	Wersion: 1.0
	Scripts for It Just City!
	You are not permission!

]]

--[[local missionText=createElement("text")
setElementData(missionText, "name", "Praca wędkarza!")
setElementData(missionText, "scale", 2)
setElementPosition(missionText,178.76,655.57,3.85+1)

local missionText1=createElement("text")
setElementData(missionText1, "name", "Wejście\nPraca montaż części")
setElementPosition(missionText1,-144.77,1078.61,20.49+1)]]

--local blip = createBlip(190.88,634.45,3.85,46)
local blip = createBlip(190.88,634.45,3.85, 46,2,0,0,0,0,0,275)

local pkt1 = createMarker(190.88,634.45,3.85-1, "cylinder", 1.1, 255, 255, 0, 50)
local missionText1=createElement("text")
setElementData(missionText1, "name", "Miejsce łowienia")
setElementPosition(missionText1,190.88,634.45,3.85+1)
local pkt2 = createMarker(185.57,634.45,3.85-1, "cylinder", 1.1, 255, 255, 0, 50)
local missionText2=createElement("text")
setElementData(missionText2, "name", "Miejsce łowienia")
setElementPosition(missionText2,185.57,634.45,3.85+1)
local pkt3 = createMarker(180.21,634.40,3.85-1, "cylinder", 1.1, 255, 255, 0, 50)
local missionText3=createElement("text")
setElementData(missionText3, "name", "Miejsce łowienia")
setElementPosition(missionText3,180.21,634.40,3.85+1)
local pkt4 = createMarker(174.32,634.45,3.85-1, "cylinder", 1.1, 255, 255, 0, 50)
local missionText4=createElement("text")
setElementData(missionText4, "name", "Miejsce łowienia")
setElementPosition(missionText4,174.32,634.45,3.85+1)
local pkt5 = createMarker(168.16,634.45,3.85-1, "cylinder", 1.1, 255, 255, 0, 50)
local missionText5=createElement("text")
setElementData(missionText5, "name", "Miejsce łowienia")
setElementPosition(missionText5,168.16,634.45,3.85+1)
local pkt6 = createMarker(192.21,637.04,3.85-1, "cylinder", 1.1, 255, 255, 0, 50)
local missionText6=createElement("text")
setElementData(missionText6, "name", "Miejsce łowienia")
setElementPosition(missionText6,192.21,637.04,3.85+1)
local pkt7 = createMarker(165.68,637.45,3.85-1, "cylinder", 1.1, 255, 255, 0, 50)
local missionText7=createElement("text")
setElementData(missionText7, "name", "Miejsce łowienia")
setElementPosition(missionText7,165.68,637.45,3.85+1)


function startJob(thePlayer)
local theVehicle = getPedOccupiedVehicle (thePlayer)
if not theVehicle then
outputChatBox("* Rozpoczynasz połów ryb, poczekaj cierpliwie na jakąś rybę!", thePlayer, 0, 255, 0)
setElementFrozen(thePlayer, true)
setPedAnimation (thePlayer, "SWORD", "sword_block", -1, false, false, true,true)
setTimer(function ()
setPedAnimation(thePlayer,false)
setElementFrozen(thePlayer, false)
local rand1 = math.random(0,5)
if rand1 == 1 then
local rand2 = math.random(45,85)
local rnd=math.random(0,5)
outputChatBox("* Złowiłeś(aś) rybę zarabiając "..rand2.." PLN oraz "..rnd.." RP!", thePlayer, 0, 255, 0)
givePlayerMoney(thePlayer, rand2)
local repek = getElementData(thePlayer,"player:srp")
local repka=repek+rnd
setElementData(thePlayer,"player:srp",repka)
else
outputChatBox("* Żyłka zerwała się!", thePlayer, 0, 255, 0)
end
end, 5000, 1)
else
outputChatBox("* Najpierw wyjdź z pojazdu!", thePlayer, 0, 255, 0)
end
end
addEventHandler("onMarkerHit", pkt1, startJob)
addEventHandler("onMarkerHit", pkt2, startJob)
addEventHandler("onMarkerHit", pkt3, startJob)
addEventHandler("onMarkerHit", pkt4, startJob)
addEventHandler("onMarkerHit", pkt5, startJob)
addEventHandler("onMarkerHit", pkt6, startJob)
addEventHandler("onMarkerHit", pkt7, startJob)