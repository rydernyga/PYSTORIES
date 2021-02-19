--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local isVehicles=nil
local isColored={
    -- Nazwa koloru, {r,g,b koloru}, cena
    {"Światła Czerwone", {255,0,0}, 45000},
    {"Światła Niebieskie", {0,45,110}, 40000},
    {"Światła Żółte", {255,255,0}, 29500},
    {"Światła Zielone", {0,255,0}, 34500},
    {"Światła Jasno Niebieskie", {48,213,200}, 20000},
    {"Światła Różowe", {255,52,225}, 35000},
}

local wn={}
wn.window=guiCreateWindow(0.18, 0.19, 0.64, 0.62, "", true)
wn.grid=guiCreateGridList(0.03, 0.07, 0.62, 0.89, true, wn.window)
guiGridListAddColumn(wn.grid, "Kolor", 0.5)
guiGridListAddColumn(wn.grid, "Koszt", 0.5)
wn.btn_submit=guiCreateButton(0.67, 0.08, 0.31, 0.33, "Zamontuj", true, wn.window)
wn.btn_close=guiCreateButton(0.67, 0.63, 0.31, 0.33, "Zamknij", true, wn.window)
guiSetVisible(wn.window, false)

addEventHandler("onClientMarkerHit", resourceRoot, function(el,md)
    if not md or el~=localPlayer then return end
    local cs=getElementData(source, "marker:cuboid")
    if not cs then return end
    local job=getElementData(source,"marker:duty")
    local ljob=getElementData(el,"player:duty")
    if job ~= ljob then
        outputChatBox("* Nie jesteś zatrudniony jako pracownik tuningu.", 255, 0, 0)
        return
    end
    local vehicles=getElementsWithinColShape(cs,"vehicle")
    if #vehicles < 1 then
        outputChatBox("* Na stanowisku nie znajduje się pojazd.", 255, 0, 0)
        return
    end
    if #vehicles > 1 then
        outputChatBox("* Na stanowisku montażu jest zbyt dużo pojazdów.", 255, 0, 0)
        return
    end
    if getElementHealth(vehicles[1]) < 900 then
        outputChatBox("* Pojazd jest zbyt uszkodzony aby zamontować światła.", 255, 0, 0)
        return
    end
    isVehicles=vehicles[1]
    showCursor(true,false)
    guiGridListClear(wn.grid)
    guiSetVisible(wn.window, true)
    for i,v in ipairs(isColored) do
        local row=guiGridListAddRow(wn.grid)
        guiGridListSetItemText(wn.grid, row, 1, v[1], false, false)
        guiGridListSetItemData(wn.grid, row, 1, v[2], false, false)
        guiGridListSetItemColor(wn.grid, row, 1, v[2][1], v[2][2], v[2][3])
        guiGridListSetItemData(wn.grid, row, 1, v[2], false, false)
        guiGridListSetItemText(wn.grid, row, 2, v[3].." PLN", false, false)
        guiGridListSetItemData(wn.grid, row, 2, v[3], false, false)
    end
end)

addEventHandler("onClientMarkerLeave", resourceRoot, function(el,md)
    if el~=localPlayer then return end
    isVehicles=nil
    showCursor(false)
    guiSetVisible(wn.window, false)
end)

addEventHandler("onClientGUIClick", wn.btn_submit, function()
    if not isVehicles then return end
    selectedRow=guiGridListGetSelectedItem(wn.grid) or -1
    if selectedRow < 0 then return end
    local color=guiGridListGetItemData(wn.grid, selectedRow, 1)
    local cost=tonumber(guiGridListGetItemData(wn.grid, selectedRow, 2))
    if not cost then return end
    if cost > getPlayerMoney(localPlayer) then
        outputChatBox("* Nie posiadasz tyle gotówki.", 255, 0, 0)
        return
    end
    triggerServerEvent("takePlayerMoney", localPlayer, cost)
    triggerServerEvent("montazElementu", root, isVehicles, "swiatla", {color[1], color[2], color[3]}, cost)
end)