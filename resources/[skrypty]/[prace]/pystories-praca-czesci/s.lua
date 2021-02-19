--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local marker = createMarker(2474.93,-1674.80,26.06-1, "cylinder", 1.5, 255, 255, 0, 50)
setElementInterior(marker,1)
local markerPraca = createMarker(2455.28,-1683.22,20.46-1, "cylinder", 1.5, 255, 255, 0, 50)
setElementInterior(markerPraca,1)
local auto = math.random(400,402)
local vehicle = createVehicle(auto,2455.32,-1685.15,20.18,0.0,0.0,273.4)
setElementInterior(vehicle,1)
setElementData(vehicle,"vehicle:desc","W tym pojeździe montujemy częsci!")
setVehicleColor(vehicle,255,0,0)
setElementFrozen(vehicle,true)
setVehicleLocked(vehicle,true)

local rozpocznij=createElement("text")
setElementData(rozpocznij, "name", "Praca montaż części!")
setElementData(rozpocznij, "scale", 1)
setElementInterior(rozpocznij,1)
setElementPosition(rozpocznij,2474.93,-1674.80,26.06)

local montuj=createElement("text")
setElementData(montuj, "name", "Montaż częsci!")
setElementData(montuj, "scale", 1)
setElementInterior(montuj,1)
setElementPosition(montuj,2455.28,-1683.22,20.46)

function job(thePlayer)
if getElementData(thePlayer,"player:job") then outputChatBox("* Posiadasz aktywną pracę!!",thePlayer,255,0,0) return end
outputChatBox("* Ropoczynasz pracę montowania części udaj się do markera.", thePlayer, 255, 255, 0)
setElementData(thePlayer,"player:job",true)
end

function startJob(thePlayer)
local theVehicle = getPedOccupiedVehicle (thePlayer)
if not getElementData(thePlayer,"player:job") then outputChatBox("* Nie posiadasz aktywnej pracy!!",thePlayer,255,0,0) return end
if not theVehicle then
outputChatBox("* Montujesz część do pojazdu...", thePlayer, 0, 255, 0)
setElementFrozen(thePlayer, true)
setPedAnimation(thePlayer, "COP_AMBIENT", "Copbrowse_nod", -1, true, false )
setTimer(function ()
setPedAnimation(thePlayer,false)
setElementFrozen(thePlayer, false)
local rand2 = math.random(60,80)
local rnd=math.random(0,1)
outputChatBox("* Zamontowałeś część, otrzymujesz "..rand2.." EUR oraz "..rnd.." CP!", thePlayer, 0, 255, 0)
givePlayerMoney(thePlayer, rand2)
local repek = getElementData(thePlayer,"player:srp")
local repka=repek+rnd
setElementData(thePlayer,"player:srp",repka)
local tune = math.random(1073,1085)
addVehicleUpgrade(vehicle,tune)
setElementData(thePlayer,"gracz:praca",false)
end, 7000, 1)
else
outputChatBox("* Najpierw wyjdź z pojazdu!", thePlayer, 255, 0, 0)
end
end
addEventHandler("onMarkerHit", marker, job)
addEventHandler("onMarkerHit", markerPraca, startJob)

local wbij=createMarker(-144.77,1078.61,20.00+1,'arrow',1,255,0,0)
local wyjdz=createMarker(2478.70,-1676.21,26.00+1,'arrow',1,255,0,0)
setElementInterior(wyjdz,1)
createBlip(wbij, 46,2,0,0,0,0,0,275)

addEventHandler('onMarkerHit',wbij,function(el)
setElementPosition(el,2475.80,-1677.88,26.06)
setElementInterior(el,1)
end)

addEventHandler('onMarkerHit',wyjdz,function(el)
setElementPosition(el,-149.10,1079.36,19.75)
setElementInterior(el,0)
end)


local tekst=createElement("text")
setElementData(tekst, "name", "Wyjście z budynku")
setElementPosition(tekst,2478.70,-1676.21,26.00+1)
setElementInterior(tekst,1)