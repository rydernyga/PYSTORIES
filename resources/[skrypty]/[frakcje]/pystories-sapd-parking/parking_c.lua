--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

addEventHandler("onClientResourceStart", resourceRoot,
    function()
        glownyparking = guiCreateWindow(0.30, 0.27, 0.41, 0.46, "System parkingu policyjnego", true)
        guiWindowSetMovable(glownyparking, false)
        guiWindowSetSizable(glownyparking, false)

        doneparking = guiCreateButton(0.02, 0.81, 0.48, 0.16, "Wyślij do bazy danych", true, glownyparking)
        cancelparking = guiCreateButton(0.51, 0.81, 0.47, 0.16, "Anuluj", true, glownyparking)
        podpisparking = guiCreateEdit(0.02, 0.69, 0.48, 0.09, "", true, glownyparking)
        guiEditSetMaxLength(podpisparking, 64)
        Podpisfun = guiCreateLabel(0.03, 0.62, 0.48, 0.07, "Powod wystawiony przez funkcjonariusza", true, glownyparking)
        guiSetFont(Podpisfun, "default-bold-small")
        dataparking = guiCreateEdit(0.51, 0.69, 0.48, 0.09, "", true, glownyparking)
        guiEditSetMaxLength(dataparking, 128)
		guiEditSetReadOnly(dataparking,true)
        dataodholowanie = guiCreateLabel(0.51, 0.62, 0.47, 0.07, "Ostatni Kierowca", true, glownyparking)
        guiSetFont(dataodholowanie, "default-bold-small")
        rejestracjaparking = guiCreateEdit(0.02, 0.50, 0.48, 0.09, "", true, glownyparking)
        guiEditSetMaxLength(rejestracjaparking, 6969)
		guiEditSetReadOnly(rejestracjaparking,true)
        rejestracjaparkingl = guiCreateLabel(0.03, 0.43, 0.48, 0.07, "Rejestracja pojazdu", true, glownyparking)
        guiSetFont(rejestracjaparkingl, "default-bold-small")
        modelparking = guiCreateEdit(0.51, 0.50, 0.47, 0.09, "", true, glownyparking)
        guiEditSetMaxLength(modelparking, 128)
		guiEditSetReadOnly(modelparking,false)
        modelparkinge = guiCreateLabel(0.51, 0.43, 0.48, 0.07, "Cena pojazdu", true, glownyparking)
        guiSetFont(modelparkinge, "default-bold-small") 
		guiSetVisible(glownyparking,false)
    end
)

local aktualny_pojazd = {}

function getPlayerName2(plr)
if not plr then return end
return getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
end

addEvent("glownyparking:refresh",true)
addEventHandler("glownyparking:refresh",root,function(pojazd)
if not pojazd then return end
local nick = getPlayerName2(localPlayer)
if not nick then return end
local idpojazdu = getElementData(pojazd,"vehicle:id")
if not idpojazdu then return end
local ostatni = getElementData(pojazd,"vehicle:driver") or "Brak"
local rejestracja = getVehiclePlateText(pojazd)
if getPedOccupiedVehicleSeat(localPlayer) == 0 then
guiSetVisible(glownyparking,true)
guiSetInputMode("no_binds_when_editing")
guiSetText(podpisparking,"")
guiSetText(dataparking,ostatni)
guiSetText(rejestracjaparking,rejestracja)
guiSetText(modelparking,250)
aktualny_pojazd = {pojazd,idpojazdu,nick,rejestracja}
end
end)

addEvent("glownyparking:chowaj",true)
addEventHandler("glownyparking:chowaj",root,function()
guiSetVisible(glownyparking,false)
aktualny_pojazd=nil
end)


odbior = {
    text = {},
    button = {},
    window = {},
    scrollbar = {},
    gridlist = {}
}
addEventHandler("onClientResourceStart", resourceRoot,
    function()
        odbior.window[1] = guiCreateWindow(0.36, 0.29, 0.45, 0.45, "Parking Policyjny!", true)
        guiWindowSetMovable(odbior.window[1], false)
        guiWindowSetSizable(odbior.window[1], false)
        guiSetAlpha(odbior.window[1], 0.70)
        guiSetProperty(odbior.window[1], "CaptionColour", "FF64199D")

        odbior.gridlist[1] = guiCreateGridList(0.04, 0.13, 0.55, 0.83, true, odbior.window[1])
        guiGridListAddColumn(odbior.gridlist[1], "ID", 0.5)
        guiGridListAddColumn(odbior.gridlist[1], "Rejestracja", 0.5)

        odbior.scrollbar[1] = guiCreateScrollBar(0.91, 0.07, 0.04, 0.90, false, true, odbior.gridlist[1])

        odbior.text[1] = guiCreateLabel(0.61, 0.34, 0.34, 0.07, "Data odholowania:", true, odbior.window[1])
        odbior.text[2] = guiCreateLabel(0.61, 0.25, 0.34, 0.07, "Ostatni Kierowca:", true, odbior.window[1])
        odbior.text[3] = guiCreateLabel(0.61, 0.16, 0.34, 0.07, "Funkcjonariusz nakładjący kare:", true, odbior.window[1])
        odbior.text[4] = guiCreateLabel(460, 201, 257, 33, "Powód:", false, odbior.window[1])
        odbior.button[1] = guiCreateButton(0.62, 0.74, 0.35, 0.15, "Wybierz", true, odbior.window[1])
        odbior.text[5] = guiCreateLabel(0.61, 0.53, 0.34, 0.07, "Koszt Odbioru:", true, odbior.window[1])
        odbior.text[6] = guiCreateLabel(0.61, 0.63, 0.34, 0.07, "", true, odbior.window[1])  
		guiSetVisible(odbior.window[1],false)		
    end
)
tabela = {}
addEvent("odbior:refresh",true)
addEventHandler("odbior:refresh",root,function(tabelka)
if not tabelka then return end
local grid = odbior.gridlist[1]
guiSetVisible(odbior.window[1],true)
for i=1,6 do
guiSetText(odbior.text[i],"")
end		
guiGridListClear(grid)
	for i,v in pairs(tabelka) do
		local row=guiGridListAddRow(grid)
		guiGridListSetItemText(grid, row, 1, v["idpojazdu"], false, false)
		guiGridListSetItemText(grid, row, 2, v["rejestracja"], false, false)
		tabela[tonumber(v["idpojazdu"])] = v
	end
end)


addEvent("odbior:inforefresh",true)
addEventHandler("odbior:inforefresh",root,function(tabelka)
if not tabelka then return end
guiSetText(odbior.text[1],"Data odholowania:"..tabelka['data'])
guiSetText(odbior.text[2],"Ostatni Kierowca:"..tabelka['driver'])
guiSetText(odbior.text[3],"Funkcjonariusz nakładający kare:"..tabelka['funkcjonariusz'])
guiSetText(odbior.text[4],"Powód:"..tabelka['powod'])
guiSetText(odbior.text[5],"Koszt Odbioru: "..tabelka['cena'].." PLN")
guiSetText(odbior.text[6],"")
end)

addEvent("odbior:error",true)
addEventHandler("odbior:error",root,function(text)
if not text then return end
guiSetText(odbior.text[6],text)
setTimer(guiSetText,2000,1,odbior.text[6],"")
end)


addEvent("odbior:chowaj",true)
addEventHandler("odbior:chowaj",root,function()
guiSetVisible(odbior.window[1],false)
tabela = {}
end)

addEventHandler("onClientGUIClick", resourceRoot, function()
	if source == cancelparking then 
	guiSetVisible(glownyparking,false)
	elseif source == doneparking then
		local powod = guiGetText(podpisparking)
		local cena = tonumber(guiGetText(modelparking))
		if not powod or powod == "" then outputChatBox("** Wpisz powód !") return end
		if cena < 1 or cena > 15000 then outputChatBox("** Cena w zakresie od 1 do 15 tysiecy !") return end
		aktualny_pojazd[5]=cena
		aktualny_pojazd[6]=powod
		guiSetInputMode("allow_binds")
		triggerServerEvent("glownyparking:oddaj",root,aktualny_pojazd)
		guiSetVisible(glownyparking,false)
	elseif source == odbior.button[1] then
		local wybor= guiGridListGetSelectedItem(odbior.gridlist[1]) or -1
		if wybor < 0 then triggerEvent("odbior:error",root,"** Najpierw wybierz pojazd !") return end
		local id=guiGridListGetItemText(odbior.gridlist[1], wybor, 1)
		local cena = tonumber(tabela[tonumber(id)]['cena'])
		triggerServerEvent("odbior:wydaj",root,id,cena)
		guiSetVisible(odbior.window[1],false)
	elseif source == odbior.gridlist[1] then
		local wybor= guiGridListGetSelectedItem(odbior.gridlist[1])
		if wybor < 0 then return end
		local id=guiGridListGetItemText(odbior.gridlist[1], wybor, 1)
		triggerEvent("odbior:inforefresh",root,tabela[tonumber(id)])
	end
end)