--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local marker=createMarker(358.43,167.39,1008.38, "cylinder", 1, 255, 255, 255, 155)
setElementInterior(marker, 3)

local t=createElement("text")
setElementData(t,"name","Kupno pojazdów")
setElementPosition(t,-34.00,-600.58,966.97)
setElementInterior(t,18)

local wm={}
wm.window=guiCreateWindow(0.29, 0.17, 0.39, 0.63, "Kupno pojazdów", true)
wm.gridlist=guiCreateGridList(0.04, 0.06, 0.92, 0.79, true, wm.window)
guiGridListAddColumn(wm.gridlist, "Nazwa", 0.5)
guiGridListAddColumn(wm.gridlist, "Cena", 0.5)
wm.submit=guiCreateButton(0.04, 0.86, 0.39, 0.12, "Zakup", true, wm.window)
wm.close=guiCreateButton(0.56, 0.86, 0.39, 0.12, "Anuluj", true, wm.window)
guiWindowSetMovable(wm.window, false)
guiWindowSetSizable(wm.window, false)
guiSetVisible(wm.window, false)

local function fillVehiclesData()
	for i,v in ipairs(buyVehicles) do
		local row=guiGridListAddRow(wm.gridlist)
		guiGridListSetItemText(wm.gridlist, row, 1, getVehicleNameFromModel(v[1]), false, false)
		guiGridListSetItemData(wm.gridlist, row, 1, v[1])
		guiGridListSetItemText(wm.gridlist, row, 2, v[2].." PLN", false, false)
		guiGridListSetItemData(wm.gridlist, row, 2, v[2])
	end
end

addEventHandler("onClientMarkerHit", marker, function(el,md)
	if el~=localPlayer then return end
	if not guiGetVisible(wm.window) then
		--if getPlayerName(el) ~= "Split" and getPlayerName(el)~='dpj09' then
			--outputChatBox("* Panel w budowie.", 255, 0, 0)
			---return
		--end
		showCursor(true)
		guiGridListClear(wm.gridlist)
		guiSetVisible(wm.window, true)
		fillVehiclesData() -- sprawdzamy pojazdy
	else
		showCursor(false)
		guiSetVisible(wm.window, false)
	end
end)

addEventHandler("onClientGUIClick", resourceRoot, function()
	if source == wm.close then
		showCursor(false)
		guiSetVisible(wm.window, false)
	end
	if source == wm.submit then
		local selectedRow=guiGridListGetSelectedItem(wm.gridlist)
		if not selectedRow then return end -- na wszelki wypadek
		local model=tonumber(guiGridListGetItemData(wm.gridlist, selectedRow, 1))
		local cost=tonumber(guiGridListGetItemData(wm.gridlist, selectedRow, 2))
		if not model or not cost then return end
		triggerServerEvent("buy:check", resourceRoot, model, cost)
	end
end)