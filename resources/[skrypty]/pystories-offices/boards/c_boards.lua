--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local marker=createMarker(361.28, 176.04, 1008.38-1, "cylinder", 1.2, 255, 255, 255, 155)
setElementInterior(marker, 3)
setElementDimension(marker, 1)

local t=createElement("text")
setElementPosition(t,361.28, 176.04, 1008.38)
setElementInterior(t,3)
setElementDimension(t,1)
setElementData(t,"name","Zmiana tablic rejestracyjnych")

local wm={}
wm.window=guiCreateWindow(0.22, 0.22, 0.59, 0.53, "Zmiana tablic", true)
guiWindowSetSizable(wm.window, false)
guiWindowSetMovable(wm.window, false)
guiSetVisible(wm.window, false)
wm.gridlist=guiCreateGridList(0.03, 0.09, 0.93, 0.72, true, wm.window)
guiGridListAddColumn(wm.gridlist, "ID", 0.2)
guiGridListAddColumn(wm.gridlist, "Nazwa", 0.5)
guiGridListAddColumn(wm.gridlist, "Tablica", 0.2)
wm.edit=guiCreateEdit(0.04, 0.83, 0.27, 0.11, "", true, wm.window)
wm.submit=guiCreateButton(0.35, 0.84, 0.28, 0.11, "Zmień tablicę(4500 PLN)", true, wm.window)
wm.close=guiCreateButton(0.68, 0.84, 0.28, 0.11, "Zamknij", true, wm.window)

addEventHandler("onClientGUIClick", root, function(btn,state)
	if source == wm.submit then
		local selectedRow=guiGridListGetSelectedItem(wm.gridlist)
		local new_board=guiGetText(wm.edit)
		if selectedRow < 0 then return end
		local cost=4500
		if string.len(new_board) < 1 then
			outputChatBox("* Podaj więcej znaków.", 255, 0, 0)
			return
		end
		if string.len(new_board) > 5 then
			outputChatBox("* Podaj mniej znaków.", 255, 0, 0)
			return
		end
		if cost > getPlayerMoney(localPlayer) then
			outputChatBox("* Nie posiadasz tyle gotówki.", 255, 0, 0)
			return
		end
		local id=tostring(guiGridListGetItemText(wm.gridlist, selectedRow, 1))
		local name=tostring(guiGridListGetItemText(wm.gridlist, selectedRow, 2))
		triggerServerEvent("board:new", resourceRoot, id, name, new_board, cost)
    end
    if source == wm.close then
    	if guiGetVisible(wm.window) == true then
    		showCursor(false)
    		guiSetVisible(wm.window, false)
    	end
    end
end)

addEvent("board:refresh", true)
addEventHandler("board:refresh", resourceRoot, function(result)
	guiGridListClear(wm.gridlist)
	for i,v in pairs(result) do
		if string.len(v.plateText) < 1 then v.plateText="Brak" end
		local row=guiGridListAddRow(wm.gridlist)
		guiGridListSetItemText(wm.gridlist, row, 1, v.id, false, false)
		guiGridListSetItemText(wm.gridlist, row, 2, getVehicleNameFromModel(v.model), false, false)
		guiGridListSetItemText(wm.gridlist, row, 3, v.plateText or v.id, false, false)
	end
end)

addEventHandler("onClientMarkerHit", marker, function(el,md)
    if el~=localPlayer then return end
    if not guiGetVisible(wm.gridlist) then
        showCursor(true)
        guiSetVisible(wm.window, true)
        triggerServerEvent("board:download", resourceRoot, el)
    end
end)