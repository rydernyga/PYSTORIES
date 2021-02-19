--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local code = "StreetView"
local districtsBus = {
{-1986.92, 935.31, 45.30},
{-2002.48, 924.51, 45.30},
{-2008.31, 887.55, 45.30},
{-2008.17, 834.59, 45.30},
{-2007.89, 759.92, 45.30},
{-1984.33, 728.10, 45.30},
{-1913.74, 727.53, 45.30},
{-1895.93, 758.23, 45.30-0.2},
{-1895.81, 814.11, 35.51-0.4},
{-1895.44, 867.77, 35.02},
{-1895.12, 909.97, 35.02},
{-1868.51, 920.64, 35.02},
{-1814.47, 920.15, 24.74},
{-1790.50, 957.41, 24.73},
{-1790.08, 1042.79, 31.16-1},
{-1790.48, 1092.34, 45.30},
{-1747.34, 1100.14, 45.29},
{-1710.80, 1122.96, 44.09-0.8},
{-1710.91, 1170.81, 25.47-0.5},
{-1738.79, 1191.10, 24.98},
{-1806.16, 1190.50, 24.97},
{-1864.76, 1181.62, 44.22-0.8},
{-1941.06, 1181.27, 45.30},
{-1968.86, 1134.57, 50.21-0.4},
{-1969.36, 1079.88, 55.57},
{-1929.44, 1051.48, 50.92-0.3},
{-1888.07, 1040.56, 45.18-0.3},
{-1898.95, 973.68, 35.02},
{-1911.91, 934.74, 35.03-0.2},
{-1957.99, 934.49, 43.10-0.4},
{-1979.58, 941.75, 45.45-0.2},
{-1980.02, 955.66, 45.45-0.1},
}

local districtsBus2 = {
{-1940.01,921.71,39.24},
{-1918.25,921.77,35.30},
{-1873.55,920.85,34.40},
{-1830.21,921.74,27.66},
{-1792.37,920.30,24.13},
{-1750.56,919.85,24.13},
{-1703.84,919.37,24.12},
{-1608.36,920.03,6.91},
{-1571.94,919.95,6.45},
{-1557.97,897.63,6.41},
{-1561.05,847.03,6.41},
{-1560.72,792.25,6.41},
{-1561.59,706.85,6.42},
{-1561.71,636.45,6.42},
{-1561.69,548.99,6.41},
{-1581.02,476.50,6.41},
{-1640.80,416.68,6.40},
{-1688.51,369.31,6.41},
{-1736.65,321.10,6.41},
{-1761.54,324.92,6.72},
{-1799.57,363.97,16.42},
{-1841.32,405.57,16.39},
{-1866.00,414.77,16.40},
{-1883.92,385.32,19.00},
{-1888.02,359.35,23.60},
{-1923.19,345.56,30.49},
{-1972.00,348.54,33.71},
{-2000.67,367.25,34.40},
{-2000.15,408.43,34.39},
{-2000.26,455.13,34.39},
{-2000.71,510.18,34.39},
{-2001.49,561.81,34.39},
{-2001.77,641.63,38.29},
{-2002.10,717.69,44.72},
{-2002.42,773.01,44.68},
{-2002.10,841.61,44.67},
{-2001.19,897.08,44.67},
{-1985.10,922.65,44.65},
{-1981.08,949.85,44.82},
}


local districtsBus3 = {
{-1986.15,935.47,44.64},
{-1997.22,932.23,44.66},
{-2000.65,955.81,44.68},
{-2001.36,988.82,48.08},
{-2001.50,1031.64,55.07},
{-2001.57,1055.50,54.94},
{-2032.11,1079.15,54.95},
{-2069.78,1079.17,54.95},
{-2113.51,1079.33,54.96},
{-2162.22,1079.51,54.96},
{-2214.05,1079.71,54.96},
{-2268.87,1079.91,54.96},
{-2319.33,1082.72,54.94},
{-2397.18,1110.72,54.98},
{-2464.99,1116.94,54.95},
{-2539.95,1122.37,54.95},
{-2575.11,1120.57,54.93},
{-2589.79,1099.46,55.24},
{-2601.55,1074.21,61.19},
{-2608.33,1036.87,71.72},
{-2608.11,987.01,77.51},
{-2609.43,922.16,64.47},
{-2587.75,905.96,64.22},
{-2548.83,906.18,64.21},
{-2506.96,906.20,64.18},
{-2476.46,906.21,62.51},
{-2451.35,906.22,57.79},
{-2425.51,906.24,47.10},
{-2404.96,906.25,44.74},
{-2391.33,893.09,44.68},
{-2390.82,864.99,42.51},
{-2390.36,833.14,36.80},
{-2351.73,806.69,39.53},
{-2324.60,806.38,43.92},
{-2284.98,806.60,48.61},
{-2252.95,807.01,48.68},
{-2199.87,807.01,51.52},
{-2166.29,806.86,64.97},
{-2138.05,806.75,68.82},
{-2105.43,806.64,68.79},
{-2081.72,806.55,68.79},
{-2049.71,806.44,57.16},
{-2027.29,806.42,48.08},
{-2002.61,836.54,44.68},
{-2001.70,868.51,44.66},
{-2001.02,896.36,44.68},
{-1987.78,915.32,44.68},
{-1980.89,952.91,44.79},
}







local jobTarget
local jobMarker
local jobVehicle
local maxTarget = #districtsBus
function odleglosc()
	local x,y,z = getElementPosition(localPlayer)
	local mx,my,mz = getElementPosition(jobMarker)
	local distance = getDistanceBetweenPoints3D(x,y,z,mx,my,mz)
	if distance > 600 then
        addEventHandler("onClientRender",root,render2)
        setTimer(renderstop2,2000,1)
		--outputChatBox("Odjechałeś za daleko od punktu.")
		finishJob()
	end
end
function finishJob()
    if jobMarker and isElement(jobMarker) then
        destroyElement(jobMarker)
        jobMarker = nil
    end
    if jobBlip and isElement(jobBlip) then
        destroyElement(jobBlip)
        jobBlip = nil
    end
    if jobTarget and isElement(jobTarget) then
        destroyElement(jobTarget)
        jobTarget = nil
        jobTarget = 0

    end
if getElementData(localPlayer,"player:job") == code then
setElementData(localPlayer,"player:job",false)
end
triggerServerEvent("destroyVeh", localPlayer)
removeEventHandler("onClientRender",root,odleglosc)
end
addEventHandler ( "onClientPlayerWasted", getLocalPlayer(),finishJob)
addEvent("finishJob",true)
addEventHandler("finishJob",root,function(plr)
if plr ~= localPlayer then return end
finishJob()
end)


function busDriver(el, md)
    if el ~= localPlayer or not md then return end
    if jobTarget > maxTarget and getPedOccupiedVehicle(el) then return end
    if jobTarget == maxTarget and not getPedOccupiedVehicle(el) then return end

    if jobTarget == #districtsBus then
        finishJob()
        playSoundFrontEnd(5)
        addEventHandler("onClientRender",root,render3)
        setTimer(renderstop3,2000,1)
        --outputChatBox("* Zakończyłeś/aś pracę.")
    else
		kasa = math.random(75,150)
        showMarker()
        playSoundFrontEnd(12)
        if getElementData(el,"player:premium") then
        addEventHandler("onClientRender",root,render4)
        setTimer(renderstop4,1000,1)
        --outputChatBox("* Zidentyfikowałeś(aś) punkt i otrzymujesz 100 PLN.")
        triggerServerEvent("givePlayerMoney", el, kasa, 0)
        setElementData(el,"player:srp", getElementData(el,"player:srp")+math.random(0,1))
        else
        --outputChatBox("* Zidentyfikowałeś(aś) punkt i otrzymujesz 75 PLN.")
        addEventHandler("onClientRender",root,render4)
        setTimer(renderstop4,1000,1)
        triggerServerEvent("givePlayerMoney", el, kasa*1.3, 0)
        setElementData(el,"player:srp", getElementData(el,"player:srp")+math.random(0,1))
        end
    end
end

function showMarker()
    if jobMarker and isElement(jobMarker) then
        destroyElement(jobMarker)
        jobMarker = nil
    end
    if jobBlip and isElement(jobBlip) then
        destroyElement(jobBlip)
        jobBlip = nil
    end


    jobTarget = jobTarget + 1
    jobMarker = createMarker(districtsBus[jobTarget][1], districtsBus[jobTarget][2], districtsBus[jobTarget][3], "checkpoint", 4, 0, 0, 255)
	jobBlip = createBlip(districtsBus[jobTarget][1], districtsBus[jobTarget][2], districtsBus[jobTarget][3], 41)
    if districtsBus[jobTarget+1] then
        ile = districtsBus[jobTarget+1]
		ile2 = ile[1]
		ile3 = ile[2]
		ile4 = ile[3]
        setMarkerTarget(jobMarker, ile[1], ile[2], ile[3])
    end

    addEventHandler("onClientMarkerHit", jobMarker, busDriver)
end

addEvent("STARTJobBus", true)
addEventHandler("STARTJobBus", resourceRoot, function(veh)
    trasa = math.random(1,3)
    if trasa==1 then
        districtsBus = districtsBus
    elseif trasa==2 then
        districtsBus = districtsBus2
    elseif trasa==3 then
        districtsBus = districtsBus3
    end
    maxTarget = #districtsBus
    addEventHandler("onClientRender",root,render1)
    setTimer(renderstop1,4000,1)
    --outputChatBox("* Rozpocząłeś/aś pracę StreetView.")
    --outputChatBox("* Jeździj po punktach i uzupełniaj mapę.")
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
            addEventHandler("onClientRender",root,render3)
            setTimer(renderstop3,2000,1)
            --outputChatBox("Zakończyłeś pracę")
        end
    end
end)





----------------- EVENT HANDLER --------------

--addEventHandler("onClientRender",root,render1)
--setTimer(renderstop1,2000,1)



----------------- INFORMACJE DX --------------

local screenW, screenH = guiGetScreenSize()
function render1()
dxDrawText("Rozpocząłeś pracę StreetView,\n jeździj po punktach i uzupełniaj mape. \n Wylosowano mape nr: "..trasa, screenW * 0.3656, screenH * 1.3553, screenW * 0.6273, screenH * 0.3193, tocolor(255, 255, 255, 255), 1.5, "default", "center", "center", false, false, false, false, false)
end

function render2()
dxDrawText("Odjechałeś zbyt daleko od punktu.", screenW * 0.3656, screenH * 1.3553, screenW * 0.6273, screenH * 0.3193, tocolor(255, 255, 255, 255), 1.5, "default", "center", "center", false, false, false, false, false)
end

function render3()
dxDrawText("Zakończyłeś pracę StreetView.", screenW * 0.3656, screenH * 1.3553, screenW * 0.6273, screenH * 0.3193, tocolor(255, 255, 255, 255), 1.5, "default", "center", "center", false, false, false, false, false)
end

function render4()
dxDrawText("Za dojechanie do punktu otrzymujesz: "..kasa.."PLN", screenW * 0.3656, screenH * 1.3553, screenW * 0.6273, screenH * 0.3193, tocolor(255, 255, 255, 255), 1.5, "default", "center", "center", false, false, false, false, false)
end







----------------- KONIEC RENDERU! -----------

function renderstop1()
removeEventHandler("onClientRender",root,render1)
end

function renderstop2()
removeEventHandler("onClientRender",root,render2)
end

function renderstop3()
removeEventHandler("onClientRender",root,render3)
end

function renderstop4()
removeEventHandler("onClientRender",root,render4)
end
