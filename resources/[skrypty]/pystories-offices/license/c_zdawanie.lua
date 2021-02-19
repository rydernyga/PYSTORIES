--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local licenseBlip
local licenseTarget
local licenseMarker
local licenseVehicle
local licenseCategory

local categoryPositions={
	["A"]={
		{-2490.59, -126.64, 25.62},
 		{-2503.80, -173.63, 25.47},
		{-2536.34, -207.60, 17.53},
 		{-2644.49, -207.83, 4.19},
		{-2704.02, -175.85, 4.18},
 		{-2703.87, -81.64, 4.18},
		{-2613.91, -72.87, 4.18},
 		{-2601.45, -8.74, 4.18},
		{-2543.66, 37.09, 16.45},
 		{-2503.78, 6.09, 25.61},
		{-2503.87, -120.02, 25.47},
	},
	["C"]={
 		{-2490.59, -126.64, 25.62},
 		{-2503.80, -173.63, 25.47},
		{-2536.34, -207.60, 17.53},
 		{-2644.49, -207.83, 4.19},
		{-2704.02, -175.85, 4.18},
 		{-2703.87, -81.64, 4.18},
		{-2613.91, -72.87, 4.18},
 		{-2601.45, -8.74, 4.18},
		{-2543.66, 37.09, 16.45},
 		{-2503.78, 6.09, 25.61},
		{-2503.87, -120.02, 25.47},
	},
	["B"]={
 		{-2490.59, -126.64, 25.62},
 		{-2503.80, -173.63, 25.47},
		{-2536.34, -207.60, 17.53},
 		{-2644.49, -207.83, 4.19},
		{-2704.02, -175.85, 4.18},
 		{-2703.87, -81.64, 4.18},
		{-2613.91, -72.87, 4.18},
 		{-2601.45, -8.74, 4.18},
		{-2543.66, 37.09, 16.45},
 		{-2503.78, 6.09, 25.61},
		{-2503.87, -120.02, 25.47},
 		
	},
	["L"]={
		{413.22, 2508.45, 16.98},
		{333.02, 2510.17, 17.81},
		{237.28, 2509.11, 34.80},
		{138.16, 2509.30, 52.04},
		{55.60, 2509.35, 82.06},
		{0.92, 2507.86, 104.80},
		{-38.97, 2456.81, 99.51},
		{13.88, 2372.89, 101.60},
		{121.39, 2326.92, 83.42},
		{252.37, 2276.14, 38.69},
		{354.88, 2278.69, 69.68},
		{443.05, 2351.14, 43.14},
		{448.44, 2438.52, 48.34},
		{355.15, 2455.51, 46.60},
		{292.87, 2515.25, 58.50},
		{346.60, 2583.21, 56.50},
		{441.44, 2551.18, 56.60},
		{556.46, 2552.09, 61.06},
		{657.66, 2561.77, 74.49},
		{678.70, 2495.53, 93.96},
		{602.38, 2464.61, 94.88},
		{525.70, 2489.49, 87.52},
		{442.01, 2501.05, 45.21},
		{353.07, 2500.90, 27.99},
		{277.30, 2506.57, 17.01},
		{213.16, 2508.25, 17.03},
		{168.64, 2493.37, 16.96},
		{186.71, 2479.14, 16.96},
		{239.11, 2480.49, 17.00},
		{290.19, 2491.78, 16.98},
		{292.48, 2525.48, 17.28},
		{288.39, 2550.45, 17.28},
	},
	["T"]={
		{-2003.43,438.75,35.02},
		{-2003.63, 380.51, 35.50},
		{-2003.63, 348.35, 35.50},
		{-2003.76, 303.06, 35.29},
		{-2005.54, 250.22, 30.41},
		{-2006.50, 194.44, 28.00},
		{-2006.50, 128.62, 28.00},
		{-2006.54, 52.03, 31.28},
		{-2062.99, 30.38, 35.62},
		{-2136.52, 30.39, 35.62},
		{-2166.63, -15.67, 35.62},
		{-2188.21, -70.00, 35.62},
		{-2254.33, -61.16, 35.62},
		{-2254.57, 11.85, 35.62},
		{-2252.38, 88.17, 35.62},
		{-2251.50, 164.36, 35.62},
		{-2251.39, 242.88, 35.62},
		{-2251.43, 322.06, 35.62},
		{-2290.05, 400.80, 35.47},
		{-2357.34, 477.06, 31.12},
		{-2287.46, 508.61, 35.50},
		{-2264.88, 614.11, 44.05},
		{-2264.94, 748.61, 49.81},
		{-2264.88, 892.21, 66.91},
		{-2264.81, 1013.76, 84.66},
		{-2264.47, 1072.97, 81.14},
		{-2263.62, 1095.95, 80.17},
	},
}

function finishLicense(value)
	if isElement(licenseMarker) and licenseMarker then
		destroyElement(licenseMarker)
		licenseMarker=nil
	end
	if isElement(licenseBlip) and licenseBlip then
		destroyElement(licenseBlip)
		licenseBlip=nil
	end
	if value == true then
		licenseCategory=nil
		licenseVehicle=nil
		licenseMarker=nil
		licenseTarget=nil
		licenseBlip=nil
	end
end
addEvent("license:finish",true)
addEventHandler("license:finish", resourceRoot, finishLicense)

function showMarker()
	local pos=categoryPositions[licenseCategory][licenseTarget]
	if licenseCategory ~= "L" then
	licenseMarker=createMarker(pos[1], pos[2], pos[3], "checkpoint", 1.5, 0, 0, 255, 155)
	else
	licenseMarker=createMarker(pos[1], pos[2], pos[3], "ring", 3.5, 0, 0, 255, 155)
	end
	licenseBlip=createBlip(pos[1], pos[2], pos[3], 0, 1.15, 0, 255, 0)
	if categoryPositions[licenseCategory][licenseTarget+1] then
  		e=categoryPositions[licenseCategory][licenseTarget+1]
		setMarkerTarget(licenseMarker, e[1], e[2], e[3])
	end
	addEventHandler("onClientMarkerHit", licenseMarker, function(el,md)
		if not md or el~=localPlayer then return end
		if not getPedOccupiedVehicle(el) then return end
		if licenseTarget < #categoryPositions[licenseCategory] then
			--local sound=playSound(":ogrpg-misc/misc/point.wav")
			--setSoundVolume(sound, 1.0)
			
			finishLicense(false)
			licenseTarget=licenseTarget+1
			showMarker()
		else
			--local sound=playSound(":ogrpg-misc/misc/success.flac")
			--setSoundVolume(sound, 1.0)

			outputChatBox("* Zdałeś(aś) egzamin. Gratulacje!")
			triggerServerEvent("license:vehdel", resourceRoot, licenseVehicle)
			setElementData(localPlayer,"player:license:pj"..licenseCategory, 1)
			finishLicense(true)
		end
	end)
end

addEvent("license:start",true)
addEventHandler("license:start", resourceRoot, function(category,vehicle)
	licenseTarget=1
	licenseBlip=nil
	licenseMarker=nil
	licenseCategory=category
	licenseVehicle=vehicle
	showMarker()
end)

punkty={}

function nalicz()
	local veh=getPedOccupiedVehicle(localPlayer)
	if not veh then return end
	local x,y,z=getElementPosition(veh)
	table.insert(punkty, {x,y,z})
	outputChatBox("* Dodano")
end

addCommandHandler("boneqkx.zakoncz", function()
	for i,v in ipairs(punkty) do
		lol=string.format("{%.02f, %.02f, %.02f},", v[1], v[2], v[3])
		outputChatBox("		"..lol)
		killTimer(punkty_timer)
	end
end)

addCommandHandler("boneqkx.licz", function()
	outputChatBox("* Rozpocząłeś(aś) naliczanie, aby zakończyć wpisz /zakoncz")
	punkty_timer=setTimer(nalicz, 3000, 0)
end)