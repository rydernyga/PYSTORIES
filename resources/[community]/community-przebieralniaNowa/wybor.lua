local sx,sy = guiGetScreenSize()

-- Wybór skina
local m3 = createMarker(207.63, -101.04, 1005.26-1, "cylinder", 1.8, 255, 255, 10, 255)
setElementInterior(m3, 15)
setElementDimension(m3,3)
local ped = createPed(12, 207.74, -98.36, 1005.26, 180)
setElementInterior(ped, 15)
setElementDimension(ped,3)

-- 201, 277, 

-- Ustawienia
local skiny_premium = {145,167,203,204,205,32,256,257,26,264,38,39,45,81,83,84,87,80,18}
local skiny_meskie = {0,1,6,7,19,20,21,22,23,24,25,28,29,33,34,36,43,44,46,47,49,52,58,59,61,66,72,78,79,82,95,96,99,100,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,120,122,123,124,133,134,136,137,142,143,144,146,147,155,158,160,163,164,170,173,174,175,176,177,179,184,185,186,187,188,189,202,210,217,223,228,229,236,240,241,242,247,248,249,250,252,253,255,260,262,269,270,271,272,290,291,292,293,294,295,296,297,299,300,303,306,307,308,311}
local skiny_kobiece = {12,13,31,40,41,53,55,88,91,93,135,138,139,140,148,150,169,192,193,197,198,211,216,219,233}

-- GUI
local sp = {}
sp.pr_okno = guiCreateWindow(990/1280*sx, 200/720*sy, 270/1280*sx, 447/720*sy, "Wybierz skin", false)
guiWindowSetMovable(sp.pr_okno, false)
guiWindowSetSizable(sp.pr_okno, true)
guiSetVisible(sp.pr_okno, false)
guiSetAlpha(sp.pr_okno, 0.9)

sp.pr_grid = guiCreateGridList(12/1280*sx, 36/720*sy, 248/1280*sx, 389/720*sy, false, sp.pr_okno)
guiGridListSetSortingEnabled(sp.pr_grid, false)
guiGridListAddColumn(sp.pr_grid, "SKIN", 0.9)

-- Ustawienia2
function przebieralniaStart()
    guiGridListClear(sp.pr_grid)

    local row = guiGridListAddRow(sp.pr_grid)
    guiGridListSetItemText(sp.pr_grid, row, 1, "Skiny męskie", true, false)
    for i,v in ipairs(skiny_meskie) do
        local row = guiGridListAddRow(sp.pr_grid)
        guiGridListSetItemText(sp.pr_grid, row, 1, v, false, false)
    end

    local row = guiGridListAddRow(sp.pr_grid)
    guiGridListSetItemText(sp.pr_grid, row, 1, "Skiny kobiece", true, false)
    for i,v in ipairs(skiny_kobiece) do
        local row = guiGridListAddRow(sp.pr_grid)
        guiGridListSetItemText(sp.pr_grid, row, 1, v, false, false)
    end
    
    local row = guiGridListAddRow(sp.pr_grid)
    guiGridListSetItemText(sp.pr_grid, row, 1, "Skiny premium", true, false)
    for i,v in ipairs(skiny_premium) do
        local row = guiGridListAddRow(sp.pr_grid)
        guiGridListSetItemText(sp.pr_grid, row, 1, v, false, false)
        guiGridListSetItemData(sp.pr_grid, row, 1, "player:premium")
        guiGridListSetItemColor(sp.pr_grid, row, 1, 255, 255, 0)
    end
end

-- Sprawdzanie
addEventHandler("onClientGUIClick", sp.pr_grid, function()
    local selectedRow, selectedCol = guiGridListGetSelectedItem(sp.pr_grid)
    if not selectedRow or selectedCol ~= 1 then return end
    local premium = guiGridListGetItemData(sp.pr_grid, selectedRow, selectedCol)
    if premium and getElementData(localPlayer, "premium:level") ~= 1 then
        outputChatBox("* Ten skin jest dla graczy Premium.")
        return
    end
    local model = guiGridListGetItemText(sp.pr_grid, selectedRow, selectedCol)
    if not model then return end
    triggerServerEvent("changeSkin", localPlayer, tonumber(model))
end)

-- Ustawienia 2
addEventHandler("onClientMarkerHit", m3, function(el,md)
    if el ~= localPlayer then return end
    if guiGetVisible(sp.pr_okno) == false then
        --[[if getPlayerName(el) ~= "Split" then
            outputChatBox("* Przebieralnia w trakcie poprawek", el)
            return
        end]]
        przebieralniaStart()
        showCursor(true, false)
        guiSetVisible(sp.pr_okno, true)
    end
end)

-- Ustawienia 3
addEventHandler("onClientMarkerLeave", m3, function(el, md)
    if el ~= localPlayer then return end
    if guiGetVisible(sp.pr_okno) == true then
        showCursor(false)
        guiSetVisible(sp.pr_okno, false)
    end
end)
