--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local m_dostep="mechanik-sF"

local doFixed={
	{"Silnik", 1, fn=function(veh) if getElementHealth(veh)>=2040 then return true end; return false end}, 
	{"Maska", 2, fn=function(veh) if getVehicleDoorState(veh, 0)==0 then return true end; return false end},
	{"Bagażnik", 3, fn=function(veh) if getVehicleDoorState(veh, 1)==0 then return true end; return false end},
	{"Drzwi lewy przód", 4, fn=function(veh) if getVehicleDoorState(veh, 2)==0 then return true end; return false end},
	{"Drzwi prawy przód", 5, fn=function(veh) if getVehicleDoorState(veh, 3)==0 then return true end; return false end},
	{"Drzwi lewy tył", 6, fn=function(veh) if getVehicleDoorState(veh, 4)==0 then return true end; return false end},
	{"Drzwi prawy tył", 7, fn=function(veh) if getVehicleDoorState(veh, 5)==0 then return true end; return false end},
	{"Szyba przednia", 8, fn=function(veh) if getVehiclePanelState(veh, 4)==0 then return true end; return false end},
	{"Zderzak przedni", 9, fn=function(veh) if getVehiclePanelState(veh, 5)==0 then return true end; return false end},
	{"Zderzak tylni", 10, fn=function(veh) if getVehiclePanelState(veh, 6)==0 then return true end; return false end},
	{"Światło lewe przednie", 11, fn=function(veh) if getVehicleLightState(veh, 0)==0 then return true end; return false end},
	{"Światła prawe przednie", 12, fn=function(veh) if getVehicleLightState(veh, 1)==0 then return true end; return false end},
	{"Światła lewe tylnie", 13, fn=function(veh) if getVehicleLightState(veh, 2)==0 then return true end; return false end},
	{"Światła prawe tylnie", 14, fn=function(veh) if getVehicleLightState(veh, 3)==0 then return true end; return false end},
}

local doCosts ={ 50, 20, 20, 15, 15, 15, 15, 40, 10, 10, 20, 20, 20, 20 }

local wm={}
local isVehicles=nil
wm.window = guiCreateWindow(0.18, 0.21, 0.64, 0.52, "", true)
guiWindowSetSizable(wm.window, false)
guiSetVisible(wm.window, false)
guiSetAlpha(wm.window, 1.00)
wm.gridlist = guiCreateGridList(0.01, 0.07, 0.97, 0.75, true, wm.window)
guiGridListAddColumn(wm.gridlist, "Nazwa", 0.5)
guiGridListAddColumn(wm.gridlist, "Koszt", 0.5)
guiGridListAddRow(wm.gridlist)
wm.fixall = guiCreateButton(0.75, 0.85, 0.24, 0.11, "Napraw wszystko (200 PLN)", true, wm.window)
wm.fixparts = guiCreateButton(0.02, 0.85, 0.24, 0.11, "Napraw wybraną część", true, wm.window)

local function refreshGUI()
	if not isVehicles then return end

	guiGridListClear(wm.gridlist)
	for i,v in pairs(doFixed) do
		if v.fn(isVehicles)==false then
			local row = guiGridListAddRow(wm.gridlist)
			guiGridListSetItemText(wm.gridlist, row, 1, v[1], false, false)
			guiGridListSetItemData(wm.gridlist, row, 1, i)
			guiGridListSetItemText(wm.gridlist, row, 2, doCosts[i].." PLN", false, false)
			guiGridListSetItemData(wm.gridlist, row, 2, doCosts[i])
		end
	end
end
addEventHandler("onClientMarkerHit", resourceRoot, function(el,md)
	if not md or el~=localPlayer then return end
	local cs=getElementData(source, "snn_cs")
	if not cs then return end
	local vehicles=getElementsWithinColShape(cs,"vehicle")
	if #vehicles < 1 then
		outputChatBox("* Na stanowisku naprawczym nie znajduje się pojazd.", 255, 0, 0)
		return
	end
	if #vehicles > 1 then
		outputChatBox("* Na stanowisku naprawczym znajduje się zbyt duża ilość pojazdów.", 255, 0, 0)
		return
	end
	--[[if getElementHealth(vehicles[1]) > 990 then
		outputChatBox("* Pojazd na stanowisku naprawczym jest sprawny.")
		return
	end]]
	showCursor(true, false)
	guiSetVisible(wm.window, true)
	isVehicles = vehicles[1]
	guiGridListClear(wm.gridlist)
	for i,v in pairs(doFixed) do
		if v.fn(isVehicles)==false then
			local row = guiGridListAddRow(wm.gridlist)
			guiGridListSetItemText(wm.gridlist, row, 1, v[1], false, false)
			guiGridListSetItemData(wm.gridlist, row, 1, i)
			guiGridListSetItemText(wm.gridlist, row, 2, doCosts[i].." PLN", false, false)
			guiGridListSetItemData(wm.gridlist, row, 2, doCosts[i])
		end
	end
end)

addEventHandler("onClientMarkerLeave", resourceRoot, function(el,md)
	if el~=localPlayer then return end
	guiSetVisible(wm.window, false)
	isVehicles=nil
	showCursor(false)
end)

addEventHandler("onClientGUIClick", wm.fixparts, function()
	if not isVehicles or not isElement(isVehicles) then return end
	selectedRow = guiGridListGetSelectedItem(wm.gridlist) or -1
	if selectedRow < 0 then return end
	local cost = guiGridListGetItemData(wm.gridlist, selectedRow, 2)
	if cost > getPlayerMoney(localPlayer) then
		outputChatBox("* Nie posiadasz tyle gotówki!")
		return
	end

	local part = guiGridListGetItemData(wm.gridlist, selectedRow, 1)
	outputChatBox('* Naprawiłeś(aś) ' .. tostring(getPartName(doFixed, part)))
	triggerServerEvent("takePlayerMoney", localPlayer, cost)
	triggerServerEvent("montazElementu", root, isVehicles, "naprawa", part, cost)
	setTimer(function()
		refreshGUI()
	end, 200, 2)
end)

addEventHandler("onClientGUIClick", wm.fixall, function()
	if not isVehicles or not isElement(isVehicles) then return end
	if 200 > getPlayerMoney(localPlayer) then
		outputChatBox("* Nie posiadasz tyle gotówki!")
		return
	end

	local elementyDoNaprawy=0
	for i,v in pairs(doFixed) do
		if v.fn(isVehicles)==false then
			elementyDoNaprawy=elementyDoNaprawy+1
		end
	end
	if elementyDoNaprawy==0 then
		outputChatBox('* Pojazd jest już naprawiony.')
		return
	end

	triggerServerEvent("takePlayerMoney", localPlayer, 200)
	outputChatBox('* Naprawiłeś(aś) wszystkie elementy w pojeździe.')
	triggerServerEvent("montazElementu", root, isVehicles, "naprawa", "all", 200)
	setTimer(function()
		refreshGUI()
	end, 200, 2)
end)

-- utils
function getPartName(t, key)
	for i,v in pairs(t) do
		if v[2]==key then
			return v[1]
		end
	end
end
fileDelete('c_naprawa.lua')