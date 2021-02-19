--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local money = 35 -- ile dostajesz za 1 kg
local score = 1 -- Reputacji ile dostajesz
createBlip(-1869.34,-136.15,11.90, 46,2,0,0,0,0,0,275)

local code="Sweepers" -- kod pracy
local jobOnline=true -- czy praca włączona
local jobVehicles = { -- pozycję pojazdów 574
{574,-1866.33,-128.86,11.87, 0, 0, 180},
{574,-1862.51,-129.03,11.87, 0, 0, 180},
{574,-1859.69,-129.46,11.88, 0, 0, 180},
{574,-1856.85,-129.76,11.88, 0, 0, 180},
{574,-1853.35,-129.46,11.88, 0, 0, 180},
{574,-1850.30,-129.69,11.88, 0, 0, 180},
{574,-1848.99,-143.99,11.87},
{574,-1851.79,-143.86,11.87},
{574,-1855.47,-143.68,11.87},
{574,-1859.69,-143.65,11.87},
{574,-1864.00,-144.18,11.87},
{574,-1868.02,-144.05,11.87},
{574,-1872.58,-143.90,11.87},
{574,-1881.97,-170.71,11.92},
{574,-1882.21,-166.68,11.88},
{574,-1882.51,-161.52,11.86},
{574,-1889.33,-176.13,12.10},
{574,-1889.19,-171.96,12.00},
{574,-1889.09,-167.15,11.90},
{574,-1889.13,-162.02,11.87},
{574,-1889.03,-157.45,11.86},
{574,-1888.94,-152.32,11.85},
{574,-1887.55,-144.78,11.87},
{574,-1885.54,-138.93,11.85},
{574,-1855.48,-168.75,9.15,0,0,180},
{574,-1852.82,-168.94,9.19,0,0,180},
{574,-1848.65,-168.84,9.19,0,0,180},
{574,-1872.79,-178.17,9.31,0,0,270},
{574,-1866.68,-178.09,9.29,0,0,270},
{574,-1859.87,-178.06,9.30,0,0,270},
{574,-1852.22,-178.08,9.36,0,0,270},
}

local jobMarker = createMarker(-1877.19,-151.71,11.90-0.90,"cylinder",6,255,255,255, 20)
local text = createElement("text")
setElementData(text,"name", "Punkt rozladowania")
setElementPosition(text,-1877.19,-151.71,11.90+0.2)
for i,v in ipairs(jobVehicles) do
	local veh=createVehicle(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8], v[9], v[10], v[11], v[12], v[13])
	setVehicleRespawnPosition(veh, v[2], v[3], v[4], v[5], v[6], v[7], v[8], v[9], v[10], v[11], v[12], v[13])
	setElementData(veh,"vehicle:desc","Czyszczenie ulic")
	setElementData(veh,"vehicle:mileage", math.random(1000,50000))
	setElementData(veh,"vehicle:fuel",100)
	setElementData(veh,"vehicle:job",code)
	setVehicleDamageProof(veh, true)
    toggleVehicleRespawn(veh, true)
    setVehicleIdleRespawnDelay(veh, 10000)
	setElementFrozen(veh,true)
	removeVehicleSirens(veh)
	setVehicleHeadLightColor( veh, 0,0,255 )
	addVehicleSirens(veh, 2, 2, true, true, false, true)
	setVehicleSirens(veh, 1, -0.3, 0.4, 1.3, 255, 255, 0, 104.6, 91.8)
	setVehicleSirens(veh, 2, 0.3, 0.4, 1.3, 255, 255, 0, 104.6, 91.8)
end



addEventHandler("onVehicleStartEnter", resourceRoot, function(plr,seat)
	if seat ~= 0 then return end
	if jobOnline == false then
		outputChatBox("[#00FFFFInformacja#ffffff]#00FFFFPraca jest wyłączona.", plr, 255, 255,255,true)
		cancelEvent()
		return
	end
	if getElementData(plr,"player:job") then
		outputChatBox("[#00FFFFInformacja#ffffff]#00FFFFPosiadasz aktywną pracę!", plr, 255, 255,255,true)
		cancelEvent()
		return
	end
end)

addEventHandler("onVehicleExit", resourceRoot, function(plr,seat)
	if seat ~= 0 then return end
	setElementData(source,"vehicle:desc","Czyszczenie ulic")
	setElementData(plr,"player:job",false)
  toggleControl ( plr, "brake_reverse", true )
end)

addEventHandler("onVehicleEnter", resourceRoot, function(plr,seat)
	if seat ~= 0 then return end
	setElementFrozen(source,false)
	setVehicleDamageProof(source, false)
	setElementData(source,"vehicle:trash",0)
	setElementData(plr,"player:job",code)
	outputChatBox("[#00FFFFInformacja#ffffff]#00FFFFRozpocząłeś(aś) pracę!", plr,255,255,255,true)
	outputChatBox("[#00FFFFInformacja#ffffff]#00FFFFPosprzątaj ulice miasta!", plr,255,255,255,true)
	if not getElementData(plr, "player:premium") then
	outputChatBox("[#00FFFFInformacja#ffffff]#00FFFFPamiętaj że maksymalne zapełnienie zbiornika to 200 kg!", plr, 255, 255, 255,true)
	else
	outputChatBox("[#00FFFFInformacja#ffffff]#00FFFFPamiętaj że minimalnie możesz oddać 10kg śmieci!", plr, 255, 255, 255,true)
	end
--	toggleControl ( plr, "brake_reverse", false )
end)

addEventHandler("onVehicleRespawn", resourceRoot, function()
	veh=source
	setElementData(veh,"vehicle:desc","Czyszczenie ulic")
	setElementData(veh,"vehicle:mileage", math.random(1000,50000))
	setElementData(veh,"vehicle:fuel",100)
	setElementData(veh,"vehicle:job",code)
	setElementData(source,"vehicle:trash",0)
	setElementFrozen(veh,true)
	setVehicleDamageProof(veh, true)
	setVehicleOverrideLights ( veh, 1 )
	removeVehicleSirens(veh)
	addVehicleSirens(veh, 2, 2, true, true, false, true)
	setVehicleSirens(veh, 1, -0.3, 0.4, 1.3, 255, 255, 0, 104.6, 91.8)
	setVehicleSirens(veh, 2, 0.3, 0.4, 1.3, 255, 255, 0, 104.6, 91.8)
end)


addEventHandler("onResourceStop", resourceRoot, function()
	for i,v in ipairs(getElementsByType("player")) do
		if getElementData(v, "player:job")==code then
			setElementData(v, "player:job", false)
			toggleControl ( v, "brake_reverse", true )
		end
	end
end,false,"high")

function RGBToHex(red, green, blue, alpha)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
		return nil
	end
	if(alpha) then
		return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
	else
		return string.format("#%.2X%.2X%.2X", red,green,blue)
	end
end

addEventHandler("onMarkerHit",resourceRoot,function(element,md)
	if source ~= jobMarker then return end
	local type = getElementType(element)
	if type == "player" then
	if not getPedOccupiedVehicle(element) then return end
	if getElementData(getPedOccupiedVehicle(element),"vehicle:trash") and getElementData(getPedOccupiedVehicle(element),"vehicle:trash") >= 10 then
		local cash = getElementData(getPedOccupiedVehicle(element),"vehicle:trash")*money
		local cash = math.floor(cash)
		local m = cash
		local vt = getElementData(getPedOccupiedVehicle(element),"vehicle:trash")
		setElementData(getPedOccupiedVehicle(element),"vehicle:trash",0)
		setElementData(getPedOccupiedVehicle(element),"vehicle:desc","Czyszczenie ulic")
			if getElementData(element,"player:premium") then
			local m = cash *2
			local m = math.floor(m)
			outputChatBox("[#00FFFFInformacja PREMIUM#ffffff]#00FFFFRozladowałeś zbiornik śmieci. Wynagrodzenie które dostajesz za "..vt.."KG kwotę("..m.."PLN) ",element,0,160,0,true)
			givePlayerMoney(element,m)
			else
			outputChatBox("[#00FFFFInformacja#ffffff]#00FFFFRozladowałeś zbiornik śmieci. Wynagrodzenie które dostajesz za "..vt.."KG ktwotę "..m.."PLN",element,0,160,0,true)
			givePlayerMoney(element,m)
			end
	end
	end
end)
addEventHandler("onElementDestroy", resourceRoot, function()
	local type = getElementType(source)
	if type == "vehicle" then
	cancelEvent()
	end
end)


