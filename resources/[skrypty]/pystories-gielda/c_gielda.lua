--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

--[[
addEventHandler("onResourceStart", resourceRoot, 
function ()
	CuboidNumber_0 = createColCuboid(-2361.4538574219, -60.199493408203, 33.187068939209, 56.6, 32.5, 11)
end
)
--]]

local marker=createMarker(-2358.20, -50.63, 35.31-1, "cylinder", 5, 0, 0, 0, 155)
local cuboid=createColCuboid(-2361.4538574219, -60.199493408203, 33.187068939209, 56.6, 32.5, 11)
createBlip(-2319.64, -36.99, 35.32, 55,2,0,0,0,0,0,275)

local wstep=false
local podatek=0

local text=createElement("text")
setElementPosition(text,-2358.20, -50.63, 35.31)
setElementData(text,"name","Giełda\nUstawianie ceny.")

local wm={}
wm.window=guiCreateWindow(0.74, 0.33, 0.25, 0.50, "Gielda", true)
guiWindowSetSizable(wm.window, false)
guiWindowSetMovable(wm.window, false)
guiSetVisible(wm.window, false)
wm.label=guiCreateLabel(0.06, 0.07, 0.89, 0.07, "Wpisz cenę która ma widnieć na pojeździe.", true, wm.window)
guiLabelSetHorizontalAlign(wm.label, "center", false)
guiLabelSetVerticalAlign(wm.label, "center")
wm.label2=guiCreateLabel(0.06, 0.21, 0.89, 0.07, "Po odjęciu podatku cena wyniesie: 0 PLN", true, wm.window)
guiLabelSetHorizontalAlign(wm.label2, "center", false)
guiLabelSetVerticalAlign(wm.label2, "center") 
wm.edit=guiCreateEdit(0.06, 0.40, 0.91, 0.10, "", true, wm.window)
wm.submit2=guiCreateButton(0.06, 0.55, 0.90, 0.16, "Zgadzam się", true, wm.window)
wm.submit=guiCreateButton(0.06, 0.75, 0.90, 0.20, "Akceptuj", true, wm.window)

addEventHandler("onClientMarkerHit", resourceRoot, function(el,md)
	if not md or el ~= localPlayer then return end
	if not wstep then return end
	local veh=getPedOccupiedVehicle(localPlayer)
	if not veh then return end
	if getVehicleController(veh) ~= localPlayer then return end
	local spawn=getElementData(veh,"vehicle:id")
	if not spawn then return end
	if getElementHealth(veh) < 850 then
		outputChatBox("* Posiadasz zbyt uszkodzony pojazd, idź go napraw.", 255, 0, 0)
		return
	end
	if getElementData(veh,"vehicle:ownedPlayer") ~= getElementData(localPlayer,"player:sid") then return end
	showCursor(true,false)
	guiSetVisible(wm.window, true)
	guiSetVisible(wm.label2, false)
	guiSetVisible(wm.submit2, false)
	guiSetInputMode("no_binds_when_editing")
end)

addEventHandler("onClientMarkerLeave", resourceRoot, function(el,md)
	if el~=localPlayer then return end
	if not wstep then return end
	showCursor(false)
	guiSetVisible(wm.window, false)
end)

addEventHandler("onClientGUIClick", resourceRoot, function()
	if not wstep then return end
	local cena=tonumber(guiGetText(wm.edit))
	if not cena or cena < 1 or cena ~= math.floor(cena) or cena > 99999999 then
		outputChatBox("* Podano nieprawidłową cenę.")
		return
	end
	local veh=getPedOccupiedVehicle(localPlayer)
	if not veh then return end
	if getVehicleController(veh) ~= localPlayer then return end
	if not getElementData(veh,"vehicle:id") then return end
	if source == wm.submit then
		--podatek=math.floor(cena/2)
		guiSetVisible(wm.submit2, true)
		guiSetVisible(wm.label2, true)
		guiSetText(wm.label2, "Akceptujesz podaną cenę? "..cena.." PLN")
	end
	if source == wm.submit2 then
		local online=getPlayerFromName(getPlayerName(localPlayer))
		if online then jest="Dostępny" else jest="Niedostępny" end
		local desc=string.format("Pojazd: %s\nCena: %d PLN\nPrzebieg: %dkm\nSprzedający: %s", getVehicleName(veh), tonumber(cena), getElementData(veh,"vehicle:mileage"), getPlayerName(localPlayer))
		setElementData(veh,"vehicle:desc",desc)
		guiSetVisible(wm.window, false)
		showCursor(false)
	end
end)

addEventHandler("onClientColShapeHit", cuboid, function(el,md)
	if not md or el ~= localPlayer then return end
	if wstep then return end
	wstep=true
	local veh=getPedOccupiedVehicle(el)
	setElementData(veh,"vehicle:tempspeed", 60)
end)

addEventHandler("onClientColShapeLeave", cuboid, function(el,md)
	if not md or el ~= localPlayer then return end
	if not wstep then return end
	local veh=getPedOccupiedVehicle(el)
	if not veh then return end
	setElementData(veh,"vehicle:desc",false)
	setElementData(veh,"vehicle:tempspeed", false)
end)