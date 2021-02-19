--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local marker=createMarker(358.78, 166.24, 1008.38-1, "cylinder", 1.5, 0, 255, 0, 150)
setElementInterior(marker, 3)
setElementDimension(marker,1)

local t=createElement("text")
setElementPosition(t,358.78, 166.24, 1008.38)
setElementInterior(t,3)
setElementDimension(t,1)
setElementData(t,"name","Przepisywanie pojazdów")

local wm={}
wm.window=guiCreateWindow(0.22, 0.22, 0.59, 0.53, "Przepisanie Pojazdów", true)
guiWindowSetSizable(wm.window, false)
guiWindowSetMovable(wm.window, false)
guiSetVisible(wm.window, false)
wm.gridlist=guiCreateGridList(0.03, 0.09, 0.93, 0.72, true, wm.window)
guiGridListAddColumn(wm.gridlist, "ID", 0.2)
guiGridListAddColumn(wm.gridlist, "Nazwa", 0.5)
guiGridListAddColumn(wm.gridlist, "Organizacja", 0.5)
wm.submit=guiCreateButton(0.35, 0.84, 0.28, 0.11, "Przepisz", true, wm.window)
wm.close=guiCreateButton(0.68, 0.84, 0.28, 0.11, "Zamknij", true, wm.window)

addEventHandler("onClientGUIClick", root, function(btn,state)
	if source == wm.submit then
		local selectedRow=guiGridListGetSelectedItem(wm.gridlist)
		if selectedRow < 0 then return end
		local id=tostring(guiGridListGetItemText(wm.gridlist, selectedRow, 1))
		local name=tostring(guiGridListGetItemText(wm.gridlist, selectedRow, 2))
		triggerServerEvent("org:check", resourceRoot, id, name)
    end
    if source == wm.close then
    	if guiGetVisible(wm.window) == true then
    		showCursor(false)
    		guiSetVisible(wm.window, false)
    	end
    end
end)
 
addEvent("org:refresh", true)
addEventHandler("org:refresh", resourceRoot, function(result)
	guiGridListClear(wm.gridlist)
	for i,v in pairs(result) do
		if string.len(v.plateText) < 1 then v.plateText="Brak" end
		local row=guiGridListAddRow(wm.gridlist)
		if tostring(v.ownedGroup) == "0" then v.ownedGroup = "Brak" end
		guiGridListSetItemText(wm.gridlist, row, 1, v.id, false, false)
		guiGridListSetItemText(wm.gridlist, row, 2, getVehicleNameFromModel(v.model), false, false)
		guiGridListSetItemText(wm.gridlist, row, 3, v.ownedGroup , false, false)
	end
end)

addEventHandler("onClientMarkerHit", marker, function(el,md)
    if el~=localPlayer then return end
	if not getElementData(el,"player:organization") then outputChatBox("* Nie posiadasz organizacji !") return end
    if not guiGetVisible(wm.gridlist) then
        showCursor(true)
        guiSetVisible(wm.window, true)
        triggerServerEvent("org:download", resourceRoot, el)
    end
end)