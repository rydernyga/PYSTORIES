--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local marker=createMarker(358.67, 163.15, 1008.38-1, "cylinder", 1.2, 255, 255, 255, 155)
setElementInterior(marker, 3)
setElementDimension(marker, 1)

local t=createElement("text")
setElementPosition(t,358.67, 163.15, 1008.38)
setElementInterior(t,3)
setElementDimension(t,1)
setElementData(t,"name","Wybór pracy")

local wm={}
wm.window=guiCreateWindow(0.19, 0.22, 0.65, 0.55, "Dołączenie do pracy", true)
guiWindowSetSizable(wm.window, false)
guiWindowSetMovable(wm.window, false)
guiSetVisible(wm.window, false)
wm.gridlist=guiCreateGridList(0.02, 0.07, 0.95, 0.74, true, wm.window)
guiGridListAddColumn(wm.gridlist, "Nazwa", 0.5)
guiGridListAddColumn(wm.gridlist, "Miejsca", 0.3)
guiGridListAddColumn(wm.gridlist, "SRP", 0.2)
wm.submit=guiCreateButton(0.03, 0.83, 0.31, 0.14, "Wybierz", true, wm.window)
wm.close=guiCreateButton(0.66, 0.83, 0.31, 0.14, "Zamknij", true, wm.window)
wm.leave=guiCreateButton(0.39, 0.84, 0.22, 0.12, "Zwolnij się", true, wm.window)

addEventHandler("onClientGUIClick", root, function()
	if source == wm.submit then
		local selectedRow=guiGridListGetSelectedItem(wm.gridlist)
		if selectedRow < 0 then return end
		local name=guiGridListGetItemText(wm.gridlist, selectedRow, 1)
		local code=guiGridListGetItemData(wm.gridlist, selectedRow, 1)
		local spaces=tonumber(guiGridListGetItemData(wm.gridlist, selectedRow, 2))
		local maxspaces=tonumber(guiGridListGetItemData(wm.gridlist, selectedRow, 3))
		local reputation=tonumber(guiGridListGetItemText(wm.gridlist, selectedRow, 3))
		if spaces >= maxspaces then
			outputChatBox("* Brak wolnych miejsc.", 255, 0, 0)
			return
		end
		if reputation > getElementData(localPlayer,"player:srp") then
			outputChatBox("* Nie posiadasz wymaganego srp.", 255, 0, 0)
			return
		end
		triggerServerEvent("jobs:hire", resourceRoot, el, name, code)
	end
	if source == wm.close then
    	if guiGetVisible(wm.window) == true then
        	showCursor(false)
        	guiSetVisible(wm.window, false)
    	end
	end
	if source == wm.leave then
		local selectedRow=guiGridListGetSelectedItem(wm.gridlist)
		if selectedRow < 0 then return end
		local name=guiGridListGetItemText(wm.gridlist, selectedRow, 1)
		local code=guiGridListGetItemData(wm.gridlist, selectedRow, 1)
		local spaces=tonumber(guiGridListGetItemData(wm.gridlist, selectedRow, 2))
		if spaces < 0 then return end
		triggerServerEvent("jobs:slow", resourceRoot, el, name, code)
    end
end)

addEvent("jobs:refresh", true)
addEventHandler("jobs:refresh", resourceRoot, function(result)
    guiGridListClear(wm.gridlist)
    for i,v in pairs(result) do
        local row=guiGridListAddRow(wm.gridlist)
        guiGridListSetItemText(wm.gridlist, row, 1, v.name, false, false)
        guiGridListSetItemData(wm.gridlist, row, 1, v.code, false, false)
        guiGridListSetItemText(wm.gridlist, row, 2, v.spaces.."/"..v.maxspaces, false, false)
        guiGridListSetItemData(wm.gridlist, row, 2, v.spaces)
        guiGridListSetItemText(wm.gridlist, row, 3, v.reputation, false, false)
        guiGridListSetItemData(wm.gridlist, row, 3, v.maxspaces)
    end
end)

addEventHandler("onClientMarkerHit", marker, function(el,md)
    if el~=localPlayer then return end
    if guiGetVisible(wm.window) == false then
        showCursor(true)
        guiSetVisible(wm.window, true)
        triggerServerEvent("jobs:download", resourceRoot, el)
    end
end)