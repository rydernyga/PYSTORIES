--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local code = "Autobusy"
local districtsBus 


local districtsBus = {
{-1727.62,935.07,24.15},
{-1711.17,951.17,24.14},
{-1711.03,976.94,28.69},
{-1710.86,1006.16,40.56},
{-1710.91,1038.41,44.46},
{-1711.16,1079.42,44.56},
{-1711.16,1116.64,44.63},
{-1711.23,1151.86,32.44},
{-1711.28,1181.36,24.36},
{-1695.82,1184.44,23.55},
{-1675.30,1183.48,15.96},
{-1637.70,1182.96,6.51},
{-1615.32,1183.51,6.49},
{-1607.32,1160.86,6.43},
{-1607.70,1123.66,6.43},
{-1607.83,1070.63,6.43},
{-1605.66,1022.98,6.43},
{-1585.66,981.63,6.44},
{-1563.06,909.39,6.44},
{-1562.28,867.49,6.43},
{-1562.52,821.05,6.43},
{-1562.14,759.96,6.43},
{-1562.42,695.14,6.43},
{-1562.62,624.48,6.43},
{-1562.32,563.26,6.42},
{-1584.83,472.79,6.42},
{-1656.85,400.83,6.42},
{-1706.35,351.18,6.42},
{-1735.28,322.16,6.42},
{-1778.69,343.38,12.19},
{-1809.35,374.24,16.40},
{-1841.44,406.10,16.40},
{-1846.65,425.57,16.39},
{-1830.92,443.59,17.19},
{-1815.35,472.12,21.88},
{-1819.95,508.81,28.65},
{-1864.96,543.26,33.58},
{-1890.10,569.64,34.34},
{-1926.69,608.04,34.43},
{-1957.03,609.20,34.41},
{-1984.87,608.50,34.41},
{-2008.10,557.30,34.41},
{-2007.41,487.03,34.40},
{-2006.87,437.52,34.40},
{-2007.40,378.95,34.41},
{-2007.64,314.24,34.41},
{-2008.68,256.57,29.94},
{-2008.97,186.81,26.93},
{-2009.32,105.44,26.93},
{-2008.99,64.93,28.58},
{-2008.86,37.24,32.17},
{-2032.06,32.53,33.97},
{-2063.33,31.27,34.56},
{-2093.92,31.37,34.56},
{-2105.97,58.89,34.56},
{-2105.47,90.80,34.56},
{-2121.61,112.22,34.58},
{-2143.36,111.21,34.56},
{-2149.57,129.31,34.57},
{-2145.71,154.21,34.57},
{-2145.17,196.85,34.59},
{-2145.05,223.74,34.56},
{-2144.68,296.84,34.56},
{-2144.87,340.68,34.57},
{-2143.17,423.11,34.39},
{-2138.50,485.05,34.41},
{-2120.68,502.87,34.41},
{-2071.94,502.37,34.41},
{-2023.46,502.36,34.41},
{-2000.34,524.52,34.40},
{-2000.90,570.10,34.41},
{-2000.95,630.53,36.35},
{-2000.53,697.26,44.56},
{-2000.86,745.99,44.68},
{-2000.94,812.60,44.87},
{-2001.39,859.43,44.68},
{-1991.39,915.41,44.69},
{-1945.04,917.97,40.16},
{-1879.71,917.07,34.40},
{-1795.44,917.88,24.13},
{-1773.84,944.30,24.14},
{-1766.77,951.57,24.13},
}


local districtsBus2 = {
{-1733.64,917.26,24.13},
{-1717.35,902.06,24.13},
{-1716.75,878.72,24.14},
{-1717.41,830.37,24.13},
{-1717.47,786.37,24.12},
{-1717.43,741.62,24.12},
{-1717.38,691.34,24.12},
{-1717.34,648.67,24.13},
{-1723.84,620.53,24.11},
{-1770.04,608.13,28.08},
{-1825.25,609.15,34.42},
{-1881.57,609.40,34.42},
{-1932.01,608.53,34.40},
{-1977.80,608.80,34.41},
{-2007.15,599.02,34.42},
{-2023.33,567.90,34.41},
{-2052.18,569.21,34.41},
{-2085.86,568.99,34.41},
{-2132.67,569.11,34.41},
{-2174.05,569.43,34.41},
{-2218.92,568.64,34.41},
{-2277.60,568.97,34.41},
{-2329.60,569.45,28.56},
{-2375.52,569.00,24.13},
{-2413.49,568.38,24.13},
{-2474.61,569.06,17.55},
{-2512.59,568.66,13.86},
{-2543.88,569.20,13.85},
{-2577.43,569.59,13.85},
{-2629.37,569.21,13.85},
{-2671.04,569.10,13.85},
{-2715.22,569.60,13.84},
{-2752.82,563.57,13.79},
{-2751.64,545.81,13.06},
{-2736.01,522.49,9.71},
{-2720.33,504.31,7.09},
{-2710.42,485.10,4.31},
{-2740.27,468.78,4.00},
{-2763.52,469.26,4.61},
{-2798.67,468.53,4.70},
{-2833.81,467.81,3.72},
{-2845.27,492.66,3.76},
{-2835.62,519.56,4.18},
{-2825.65,549.01,4.64},
{-2821.80,590.02,4.84},
{-2821.10,633.40,8.66},
{-2823.69,670.01,16.88},
{-2837.40,703.23,24.65},
{-2856.88,731.12,29.18},
{-2865.87,756.10,31.04},
{-2861.96,787.09,34.76},
{-2839.06,825.29,40.88},
{-2821.37,871.03,43.29},
{-2822.38,919.53,43.29},
{-2829.40,967.64,43.30},
{-2857.41,997.74,40.37},
{-2872.41,1019.86,36.50},
{-2879.43,1072.54,30.36},
{-2879.97,1114.63,24.55},
{-2877.83,1178.42,8.92},
{-2858.63,1220.62,4.89},
{-2830.04,1251.23,4.83},
{-2802.22,1276.16,4.84},
{-2764.39,1286.32,5.58},
{-2714.45,1285.23,6.44},
{-2674.51,1286.02,6.43},
{-2630.76,1299.50,6.44},
{-2600.75,1326.56,6.42},
{-2559.79,1361.81,6.41},
{-2518.40,1373.48,6.42},
{-2455.80,1373.60,6.43},
{-2383.63,1374.22,6.49},
{-2341.50,1369.91,6.40},
{-2294.28,1341.39,6.46},
{-2223.52,1328.67,6.43},
{-2165.92,1328.90,6.43},
{-2114.89,1328.45,6.42},
{-2058.65,1306.03,6.54},
{-1992.40,1283.75,6.42},
{-1941.70,1284.51,6.42},
{-1895.99,1304.01,6.44},
{-1857.67,1338.59,6.42},
{-1821.30,1355.64,6.42},
{-1782.14,1349.96,6.42},
{-1735.06,1313.87,6.42},
{-1697.87,1276.01,6.43},
{-1638.32,1216.39,6.43},
{-1611.72,1174.45,6.48},
{-1607.77,1111.91,6.42},
{-1607.40,1042.99,6.43},
{-1598.30,1001.27,6.43},
{-1566.49,954.96,6.43},
{-1588.64,933.22,6.93},
{-1628.99,933.46,10.93},
{-1677.41,932.17,24.14},
{-1743.14,934.15,24.13},
{-1776.26,942.53,24.12},
{-1767.85,951.71,24.13},
}


local districtsBus3 = {
{-1741.67,934.68,24.12},
{-1776.24,934.18,24.14},
{-1818.83,933.44,24.33},
{-1881.43,934.08,34.92},
{-1928.69,934.18,37.21},
{-1962.81,933.64,43.36},
{-1988.44,933.25,44.69},
{-2002.15,950.19,44.69},
{-2000.05,994.57,49.15},
{-2000.52,1030.92,55.08},
{-2010.83,1078.30,54.98},
{-2037.33,1080.04,54.96},
{-2074.07,1080.18,54.95},
{-2113.32,1079.78,54.96},
{-2162.82,1080.10,54.97},
{-2218.84,1080.06,54.97},
{-2281.42,1080.02,54.97},
{-2327.41,1083.40,54.95},
{-2383.02,1102.79,54.98},
{-2432.29,1115.87,54.98},
{-2487.41,1117.84,54.97},
{-2540.04,1121.23,54.96},
{-2584.04,1122.59,54.91},
{-2590.74,1098.62,55.51},
{-2600.32,1080.72,59.67},
{-2605.00,1058.50,65.72},
{-2607.52,1034.10,72.46},
{-2608.03,1016.94,77.03},
{-2594.01,1002.63,77.52},
{-2572.20,1003.03,77.53},
{-2545.96,1002.95,77.53},
{-2527.97,992.58,77.51},
{-2528.54,964.40,72.05},
{-2528.13,937.40,64.26},
{-2527.84,915.50,64.22},
{-2503.45,906.40,64.14},
{-2476.48,906.38,62.53},
{-2440.79,906.71,53.47},
{-2411.21,906.94,44.84},
{-2390.30,896.12,44.68},
{-2389.65,859.31,41.54},
{-2390.52,817.22,34.28},
{-2390.07,777.38,34.41},
{-2389.86,735.78,34.41},
{-2389.76,697.76,34.41},
{-2389.96,652.51,34.41},
{-2390.16,609.97,29.50},
{-2388.19,554.78,24.13},
{-2375.47,507.93,28.46},
{-2353.86,469.19,30.33},
{-2334.90,444.72,33.30},
{-2327.23,404.25,34.41},
{-2348.62,383.39,34.40},
{-2373.60,356.71,34.41},
{-2398.87,321.69,34.41},
{-2413.57,291.35,34.37},
{-2418.09,251.65,34.41},
{-2418.80,205.45,34.40},
{-2421.74,162.00,34.41},
{-2423.41,105.28,34.41},
{-2423.21,57.51,34.41},
{-2422.96,-0.52,34.56},
{-2423.74,-46.45,34.56},
{-2400.95,-72.96,34.57},
{-2360.30,-72.24,34.56},
{-2313.09,-72.50,34.56},
{-2270.53,-72.24,34.55},
{-2227.31,-72.29,34.56},
{-2183.45,-72.25,34.56},
{-2169.03,-93.14,34.57},
{-2169.24,-134.80,34.56},
{-2195.69,-187.55,34.55},
{-2247.36,-187.26,34.56},
{-2251.67,-162.38,34.58},
{-2251.43,-127.83,34.56},
{-2251.52,-89.59,34.57},
{-2251.83,-57.39,34.57},
{-2251.33,-23.44,34.56},
{-2251.37,7.06,34.56},
{-2250.77,52.32,34.57},
{-2250.28,99.65,34.56},
{-2249.49,147.61,34.56},
{-2249.82,199.64,34.57},
{-2249.71,254.18,34.55},
{-2271.55,384.06,33.75},
{-2262.46,408.58,34.41},
{-2235.89,440.27,34.41},
{-2225.05,469.27,34.41},
{-2224.75,522.26,34.41},
{-2225.12,557.41,34.40},
{-2186.97,562.98,34.41},
{-2124.51,563.37,34.41},
{-2050.84,562.27,34.41},
{-2001.11,563.20,34.43},
{-2001.75,584.94,34.40},
{-2000.95,631.02,36.43},
{-2001.34,689.85,44.69},
{-2001.18,742.93,44.67},
{-2001.17,800.62,44.72},
{-2001.17,854.02,44.69},
{-2001.17,895.99,44.69},
{-1988.86,917.81,44.69},
{-1955.85,916.91,42.08},
{-1921.11,916.48,35.84},
{-1880.52,917.25,34.40},
{-1830.54,917.31,27.70},
{-1805.92,918.44,24.13},
{-1769.96,948.74,24.13},
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
if getElementData(localPlayer,"player:job") == code then
setElementData(localPlayer,"player:job",false)
end
triggerServerEvent("destroyVeh", localPlayer)
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
        playSoundFrontEnd(2)

        --outputChatBox("#ffffff[#41E0FFInformacja#ffffff]#41E0FF Zakończyłeś/aś pracę.",255,255,255,true)
        addEventHandler("onClientRender",root,render3)
    	setTimer(renderstop3,2000,1)
    else
        kasa = math.random(100,175)
        showMarker()
        playSoundFrontEnd(12)
        if getElementData(el,"player:premium") then
        --outputChatBox("* Zidentyfikowałeś(aś) punkt i otrzymujesz 100 PLN.")
        triggerServerEvent("givePlayerMoney", el, kasa*1.3, 0)
        setElementData(el,"player:srp", getElementData(el,"player:srp")+math.random(0,1))
        addEventHandler("onClientRender",root,render2)
    	setTimer(renderstop2,1000,1)
        else
        --outputChatBox("* Zidentyfikowałeś(aś) punkt i otrzymujesz 75 PLN.")
        triggerServerEvent("givePlayerMoney", el, kasa, 0)
        setElementData(el,"player:srp", getElementData(el,"player:srp")+math.random(0,1))
        addEventHandler("onClientRender",root,render2)
    	setTimer(renderstop2,1000,1)
        end
    end
end

function showMarker()
    if jobMarker and isElement(jobMarker) then
        destroyElement(jobMarker)
        jobMarker = nil
    end
    
    jobTarget = jobTarget + 1
    jobMarker = createMarker(districtsBus[jobTarget][1], districtsBus[jobTarget][2], districtsBus[jobTarget][3], "checkpoint", 4, 0, 255, 255)
    
    if districtsBus[jobTarget+1] then
        ile = districtsBus[jobTarget+1]
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
            --outputChatBox("#ffffff[#41E0FFInformacja#ffffff]#41E0FF Zakończyłeś pracę",255,255,255,true)
            addEventHandler("onClientRender",root,render3)
    		setTimer(renderstop3,2000,1)
        end
    end
end)


local screenW, screenH = guiGetScreenSize()
function render1()
dxDrawText("Rozpocząłeś pracę Kierowcy PKS jedź po ludzi. \n Przydzielono ci linię nr:"..trasa, screenW * 0.3656, screenH * 1.3553, screenW * 0.6273, screenH * 0.3193, tocolor(255, 255, 255, 255), 1.5, "default", "center", "center", false, false, false, false, false)
end

function render2()
dxDrawText("Zabrałeś pasażerów za bilety dostajesz "..kasa.."PLN", screenW * 0.3656, screenH * 1.3553, screenW * 0.6273, screenH * 0.3193, tocolor(255, 255, 255, 255), 1.5, "default", "center", "center", false, false, false, false, false)
end

function render3()
dxDrawText("Zakończyłeś pracę kierowcy PKS'u.", screenW * 0.3656, screenH * 1.3553, screenW * 0.6273, screenH * 0.3193, tocolor(255, 255, 255, 255), 1.5, "default", "center", "center", false, false, false, false, false)
end

function render4()
dxDrawText("Zakończyłeś prace kierowcy PKS'u.", screenW * 0.3656, screenH * 1.3553, screenW * 0.6273, screenH * 0.3193, tocolor(255, 255, 255, 255), 1.5, "default", "center", "center", false, false, false, false, false)
end

function render5()
dxDrawText("Posiadasz już aktywną pracę.", screenW * 0.3656, screenH * 1.3553, screenW * 0.6273, screenH * 0.3193, tocolor(255, 255, 255, 255), 1.5, "default", "center", "center", false, false, false, false, false)
end






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
function renderstop5()
removeEventHandler("onClientRender",root,render5)
end