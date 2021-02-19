--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local wm={
    window={},
    added={},
    edit={},
    close={},
    delete={},
    gridlist={},
    faction=nil,
}



-- Panel członków
wm.window[1]=guiCreateWindow(0.18, 0.23, 0.64, 0.57, "Panel Organizacji", true)
guiWindowSetMovable(wm.window[1], false)
guiWindowSetSizable(wm.window[1], false)
guiSetVisible(wm.window[1], false)
wm.gridlist[1]=guiCreateGridList(0.02, 0.05, 0.97, 0.73, true, wm.window[1])
guiGridListAddColumn(wm.gridlist[1], "Nick", 0.3)
guiGridListAddColumn(wm.gridlist[1], "SID", 0.3)
guiGridListAddColumn(wm.gridlist[1], "Ranga", 0.3)
guiGridListAddColumn(wm.gridlist[1], "Aktywny", 0.3)
wm.added[1]=guiCreateButton(0.02, 0.80, 0.26, 0.16, "Dodaj", true, wm.window[1])
wm.edit[1]=guiCreateButton(0.38, 0.80, 0.26, 0.16, "Edytuj", true, wm.window[1])
wm.delete[1]=guiCreateButton(0.73, 0.80, 0.26, 0.16, "Wyrzuć", true, wm.window[1])

-- Dodawanie członka/edycja jego
wm.window[2]=guiCreateWindow(0.35, 0.43, 0.30, 0.22, "Dodawanie członka - wpisz nick i kliknij dodaj", true)
guiWindowSetMovable(wm.window[2], false)
guiWindowSetSizable(wm.window[2], false)
guiSetVisible(wm.window[2], false)
wm.edit[2]=guiCreateEdit(0.09, 0.21, 0.81, 0.20, "", true, wm.window[2])
wm.close[1]=guiCreateButton(0.55, 0.52, 0.36, 0.31, "Zamknij", true, wm.window[2])
wm.added[2]=guiCreateButton(0.09, 0.52, 0.36, 0.31, "Dodaj", true, wm.window[2])

function fillUsersData(result)
    guiGridListClear(wm.gridlist[1])
    for i,v in pairs(result) do
        local row=guiGridListAddRow(wm.gridlist[1])
		guiGridListSetItemText(wm.gridlist[1], row, 1, v["login"], false, false)
        guiGridListSetItemText(wm.gridlist[1], row, 2, v["uid"], false, false)
        guiGridListSetItemText(wm.gridlist[1], row, 3, v["rank"], false, false)
        guiGridListSetItemText(wm.gridlist[1], row, 4, v["actived"], false, false)
		
    end
end

addEventHandler("onClientMarkerLeave", resourceRoot, function(el,md)
    if el~=localPlayer then return end
    if guiGetVisible(wm.window[1]) == true then
        showCursor(false)
        guiSetVisible(wm.window[1], false)
        guiSetVisible(wm.window[2], false)
    end
end)

addEventHandler("onClientGUIClick", resourceRoot, function()
    if source == wm.added[1] then
        guiSetVisible(wm.window[2], true)
        guiMoveToBack(wm.window[1])
        guiSetText(wm.added[2],"Dodaj")
		guiSetText(wm.edit[2],"")
        guiSetText(wm.window[2],"Dodawanie członka - wpisz SID gracza i kliknij dodaj")
    end
    if source == wm.edit[1] then
        local selectedRow=guiGridListGetSelectedItem(wm.gridlist[1])
        if not selectedRow or selectedRow < 0 then return end
		local rank=guiGridListGetItemText(wm.gridlist[1], selectedRow, 3)
		if tonumber(rank) == 4 then outputChatBox("* Brak możliwości edytowania tego gracza, ponieważ posiada On Lidera !",255,0,0) return end
        guiSetVisible(wm.window[2], true)
        guiMoveToBack(wm.window[1])
        guiSetText(wm.added[2],"Edycja")
		guiSetText(wm.edit[2],"")
        guiSetText(wm.window[2],"Edycja członka - wpisz ID rangi (0-3) i kliknij edycja! Ranga 3 = (vice-lider)")
    end
    if source == wm.close[1] then
        guiSetVisible(wm.window[2], false)
    end
    if source == wm.added[2] then
        local text=guiGetText(wm.edit[2])
        if guiGetText(wm.added[2]) ~= "Dodaj" then
            local selectedRow=guiGridListGetSelectedItem(wm.gridlist[1])
            if not selectedRow or selectedRow < 0 then return end
            local name=guiGridListGetItemText(wm.gridlist[1], selectedRow, 2)
            if not name then return end
			if not text then return end
            if tonumber(text) and tonumber(text) <= 3 then
                triggerServerEvent("lidero:editUser", resourceRoot, name, text, wm.faction)
				triggerEvent("lidero:showGUI",resourceRoot,"brak","brak")
            else
                guiSetText(wm.window[2], "Podaj range w liczbach! Maksymalna to 3!")
            end
        else
			if not text then return end
            triggerServerEvent("lidero:addUser", resourceRoot, text, wm.faction)
				triggerEvent("lidero:showGUI",resourceRoot,"brak","brak")
        end
    end
    if source == wm.delete[1] then
        local selectedRow=guiGridListGetSelectedItem(wm.gridlist[1])
        if not selectedRow or selectedRow < 0 then return end
		local rank=guiGridListGetItemText(wm.gridlist[1], selectedRow, 3)
		if tonumber(rank) == 4 then outputChatBox("* Brak możliwości usunięcia tego gracza, ponieważ posiada On Lidera !",255,0,0) return end
        local name=guiGridListGetItemText(wm.gridlist[1], selectedRow, 2)
        if not name then return end
        triggerServerEvent("lidero:deleteUser", resourceRoot, name, wm.faction)
				triggerEvent("lidero:showGUI",resourceRoot,"brak","brak")
    end
    if source == wm.gridlist[1] then
        local selectedRow=guiGridListGetSelectedItem(wm.gridlist[1])
        if not selectedRow or selectedRow < 0 then
            guiSetEnabled(wm.edit[1], false)
            guiSetEnabled(wm.delete[1], false)
        else
            guiSetEnabled(wm.edit[1], true)
            guiSetEnabled(wm.delete[1], true)
        end
    end
end)

addEvent("lidero:showGUI", true)
addEventHandler("lidero:showGUI", resourceRoot, function(fid,result)
    if guiGetVisible(wm.window[1]) == false then
        -- Ustawienia
        showCursor(true,false)
        guiSetVisible(wm.window[1], true)

        guiSetEnabled(wm.edit[1], false)
        guiSetEnabled(wm.delete[1], false)


        wm.faction=fid -- deklarujemy frakcję

        -- Sprawdzamy członków
        fillUsersData(result)
    else
	        showCursor(false,false)
        guiSetVisible(wm.window[1], false)
        guiSetEnabled(wm.edit[1], false)
        guiSetEnabled(wm.delete[1], false)
        guiSetVisible(wm.window[2], false)
	end
end)

addEvent("lidero:refresh", true)
addEventHandler("lidero:refresh", resourceRoot, fillUsersData)