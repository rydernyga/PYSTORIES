--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

--[[
addEventHandler("onResourceStart", resourceRoot, 
function ()
	CuboidNumber_0 = createColCuboid(-1951.8657226563, 613.52954101563, 33.78190612793, 14.4, 7.3, 6.2)
end
)
--]]

--[[
addEventHandler("onResourceStart", resourceRoot, 
function ()
	CuboidNumber_0 = createColCuboid(-1966.6160888672, 613.84454345703, 33.78190612793, 14.4, 7.3, 6.2)
end
)
--]]

local screenW, screenH = guiGetScreenSize()
local marker=createMarker(-1968.79, 620.47, 35.17-0.9, "cylinder", 2, 255,255,255,50)
local sphere=createColCuboid(-1966.6160888672, 613.84454345703, 33.78190612793, 14.4, 7.3, 6.2)

local t=createElement("text")
setElementData(t,"scale",1.5)
setElementData(t,"name","Odbiór pojazdów")
setElementPosition(t,-1968.79, 620.47, 35.17)

local wm={}
wm.window=guiCreateWindow(0.25, 0.26, 0.51, 0.42, "Odbieranie pojazdów", true)
guiWindowSetSizable(wm.window, false)
guiWindowSetMovable(wm.window, false)
guiSetVisible(wm.window, false)
wm.gridlist=guiCreateGridList(0.04, 0.09, 0.92, 0.65, true, wm.window)
guiGridListAddColumn(wm.gridlist, "ID", 0.2)
guiGridListAddColumn(wm.gridlist, "Model", 0.55)
guiGridListAddColumn(wm.gridlist, "Zarejestrowany", 0.2)
wm.submit=guiCreateButton(0.04, 0.76, 0.47, 0.19, "Wyjmij pojazd", true, wm.window)
wm.close=guiCreateButton(0.57, 0.75, 0.39, 0.20, "Zamknij", true, wm.window)

addEvent("onParkingGetVehicles", true)
addEventHandler("onParkingGetVehicles", root, function(result)
	guiGridListClear(wm.gridlist)
	if not result then return end
	for i,v in pairs(result) do
		if v["registered"] == "false" then 
		v["registered"] = "NIE"
		else
		v["registered"] = "TAK"
		end
		local row=guiGridListAddRow(wm.gridlist)
		guiGridListSetItemText(wm.gridlist, row, 1, v["id"], false, false)
		guiGridListSetItemText(wm.gridlist, row, 2, getVehicleNameFromModel(v["model"]), false, false)
		guiGridListSetItemText(wm.gridlist, row, 3, v["registered"], false, false)
	end
end)

addEventHandler("onClientMarkerHit", marker, function(el,md)
	if el~=localPlayer then return end
	if isPedInVehicle(el) then return end
	if guiGetVisible(wm.window) == false then
		showCursor(true)
		guiSetVisible(wm.window,true)
		triggerServerEvent("onParkingGetRekords", localPlayer)
		--etCameraMatrix(-2056.26, 468.77, 38.49, -2048.08, 467.73, 35.17)
	end
end)

addEventHandler("onClientGUIClick", resourceRoot, function()
	if source == wm.close then
		if guiGetVisible(wm.window) == true then
			showCursor(false)
			guiSetVisible(wm.window,false)
			setCameraTarget(localPlayer, localPlayer)
		end
	end
	if source == wm.submit then
		local selectedRow=guiGridListGetSelectedItem(wm.gridlist) or -1
		if selectedRow < 0 then return end
    	local vehicles=getElementsWithinColShape(sphere,"vehicle")
		if #vehicles > 0 then
			outputChatBox("* Nie ma miejsca aby wyciągnąć pojazd !",localPlayer)
			return
		end
		local id=guiGridListGetItemText(wm.gridlist, selectedRow, 1)
		local register=guiGridListGetItemText(wm.gridlist, selectedRow, 3)
		if register == "NIE" then
		outputChatBox("* Zarejestruj pojazd w urzędzie! Jego ID to "..id,255,0,0)
		return end
		guiGridListRemoveRow(wm.gridlist, selectedRow)
		triggerServerEvent("onParkingVehicleSpawn", localPlayer, tonumber(id))
	end
end)