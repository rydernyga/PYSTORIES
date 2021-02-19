--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local marker=createMarker(-2033.43, -117.45, 1035.17-1, "cylinder", 1.2, 255, 255, 255, 155) -- Prawo Jazdy
setElementInterior(marker, 3)
setElementDimension(marker, 1)

local marker2=createMarker(415.51, 2532.14, 19.15-1, "cylinder", 1.2, 255, 255, 255, 155) -- Licencja Lotnicza
setElementInterior(marker2, 0)

local t=createElement("text")
setElementInterior(t, 3)
setElementDimension(t,1)
setElementPosition(t, -2033.43, -117.45, 1035.17)
setElementData(t,"name","Zdawanie na prawo jazdy")

local t2=createElement("text")
setElementInterior(t2, 0)
setElementPosition(t2, 415.51, 2532.14, 19.15)
setElementData(t2,"name","Zdawanie licencji lotniczej")


local wm={}
wm.window=guiCreateWindow(0.21, 0.20, 0.57, 0.54, "Zdawanie prawa jazdy", true)
guiWindowSetSizable(wm.window, false)
guiWindowSetMovable(wm.window, false)
guiSetVisible(wm.window, false)
wm.label=guiCreateLabel(0.02, 0.06, 0.96, 0.05, "Z poniższej listy wybierz kategorię prawa jazdy do której chcesz przystąpić później kliknij Przystąp", true, wm.window)
guiLabelSetHorizontalAlign(wm.label, "center", false)
guiLabelSetVerticalAlign(wm.label, "center")
wm.gridlist=guiCreateGridList(0.02, 0.12, 0.96, 0.69, true, wm.window)
guiGridListAddColumn(wm.gridlist, "Kategoria", 0.3)
guiGridListAddColumn(wm.gridlist, "Pojazdy", 0.3)
guiGridListAddColumn(wm.gridlist, "Cena", 0.2)
guiGridListAddColumn(wm.gridlist, "Zdane", 0.2)
wm.close=guiCreateButton(0.62, 0.83, 0.36, 0.13, "Zamknij", true, wm.window)
wm.submit=guiCreateButton(0.02, 0.83, 0.36, 0.13, "Przystąp", true, wm.window)

local function fillLicenseData()
	guiGridListClear(wm.gridlist)
	for i,v in ipairs(licenseCategory) do
		local row=guiGridListAddRow(wm.gridlist)
		guiGridListSetItemText(wm.gridlist, row, 1, v[1], false, false)
		guiGridListSetItemText(wm.gridlist, row, 2, v[2], false, false)
		guiGridListSetItemText(wm.gridlist, row, 3, v[3].." PLN", false, false)
		guiGridListSetItemData(wm.gridlist, row, 3, v[3])
		-- Settings
		if getElementData(localPlayer,"player:license:pj"..v[1]) == 1 then
			guiGridListSetItemText(wm.gridlist, row, 4, "TAK", false, false)
			guiGridListSetItemColor(wm.gridlist, row, 4, 0, 255, 0)
		else
			guiGridListSetItemText(wm.gridlist, row, 4, "NIE", false, false)
			guiGridListSetItemColor(wm.gridlist, row, 4, 255, 0, 0)
		end
	end
end

local function fillLicenseData2()
	guiGridListClear(wm.gridlist)
	for i,v in ipairs(licenseCategory2) do
		local row=guiGridListAddRow(wm.gridlist)
		guiGridListSetItemText(wm.gridlist, row, 1, v[1], false, false)
		guiGridListSetItemText(wm.gridlist, row, 2, v[2], false, false)
		guiGridListSetItemText(wm.gridlist, row, 3, v[3].." PLN", false, false)
		guiGridListSetItemData(wm.gridlist, row, 3, v[3])
		-- Settings
		if getElementData(localPlayer,"player:license:pj"..v[1]) == 1 then
			guiGridListSetItemText(wm.gridlist, row, 4, "TAK", false, false)
			guiGridListSetItemColor(wm.gridlist, row, 4, 0, 255, 0)
		else
			guiGridListSetItemText(wm.gridlist, row, 4, "NIE", false, false)
			guiGridListSetItemColor(wm.gridlist, row, 4, 255, 0, 0)
		end
	end
end

addEventHandler("onClientGUIClick", wm.submit, function()
	local selectedRow=guiGridListGetSelectedItem(wm.gridlist)
	if not selectedRow or selectedRow < 0 then return end
	local cat=guiGridListGetItemText(wm.gridlist, selectedRow, 1)
	local cost=guiGridListGetItemData(wm.gridlist, selectedRow, 3)
	local zdane=guiGridListGetItemText(wm.gridlist, selectedRow, 4)
	if tonumber(cost) > getPlayerMoney(localPlayer) then
		outputChatBox("* Nie posiadasz tyle gotówki.", 255, 0, 0)
		return
	end
	--[[if getPlayerName(localPlayer) ~= "Split" then
		outputChatBox("* W budowie...", 255, 0, 0)
		return
	end]]
	if zdane ~= "TAK" then
		triggerServerEvent("license:do", resourceRoot, tonumber(cost), cat)
		if not guiGetVisible(wm.window) then return end
		guiSetVisible(wm.window, false)
		showCursor(false)
	else
		outputChatBox("* Posiadasz już zdane prawo jazdy.", 255, 0, 0)
	end
end)

addEventHandler("onClientGUIClick", wm.close, function()
	if not guiGetVisible(wm.window) then return end
	showCursor(false)
	guiSetVisible(wm.window, false)
end)

addEventHandler("onClientMarkerHit", marker, function(el,md)
	if not md or el~=localPlayer then return end
	if guiGetVisible(wm.window) then return end
	showCursor(true)
	guiSetVisible(wm.window,true)
	fillLicenseData()
end)

addEventHandler("onClientMarkerHit", marker2, function(el,md)
	if not md or el~=localPlayer then return end
	if guiGetVisible(wm.window) then return end
	showCursor(true)
	guiSetVisible(wm.window,true)
	fillLicenseData2()
end)