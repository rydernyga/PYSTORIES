--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local data={ showed=nil, button={}}


local screenW, screenH = guiGetScreenSize()
local sx, sy = guiGetScreenSize()
function isMouseIn(psx,psy,pssx,pssy,abx,aby)
    if not isCursorShowing() then return end
    cx,cy=getCursorPosition()
    cx,cy=cx*sx,cy*sy
    if cx >= psx and cx <= psx+pssx and cy >= psy and cy <= psy+pssy then
        return true,cx,cy
    else
        return false
    end
end



function renderZoneBox()
		showCursor(true)
        dxDrawRectangle(screenW * 0.3661, screenH * 0.0004, screenW * 0.2690, screenH * 0.9999, tocolor(0, 0, 0, 168), false)
        dxDrawLine((screenW * 0.3655) - 1, (screenH * 0.2733) - 1, (screenW * 0.3655) - 1, screenH * 0.3200, tocolor(131, 26, 36, 216), 1, false)
        dxDrawLine(screenW * 0.6351, (screenH * 0.2733) - 1, (screenW * 0.3655) - 1, (screenH * 0.2733) - 1, tocolor(131, 26, 36, 216), 1, false)
        dxDrawLine((screenW * 0.3655) - 1, screenH * 0.3200, screenW * 0.6351, screenH * 0.3200, tocolor(131, 26, 36, 216), 1, false)
        dxDrawLine(screenW * 0.6351, screenH * 0.3200, screenW * 0.6351, (screenH * 0.2733) - 1, tocolor(131, 26, 36, 216), 1, false)
        dxDrawRectangle(screenW * 0.3655, screenH * 0.2733, screenW * 0.2696, screenH * 0.0467, tocolor(0, 0, 0, 161), false)
        dxDrawText("SKLEP PREMIUM (Zamknij)", screenW * 0.4310, screenH * 0.2876, screenW * 0.5696, screenH * 0.3105, tocolor(255, 255, 255, 255), 0.60, "bankgothic", "center", "center", false, false, false, false, false)
        dxDrawText("Aby zakupić premium na 60 (dni) musisz : \n 1. Wyślij SMS o treści: AA.SP na numer 91955 koszt: (23.37 SMS) Jeżeli chcesz zakupic premium na 30 (dni) musisz: Wyslij SMS o treści: AA.SP  na numer  7936 - koszt sms to (11.07 SMS).\n 2. W ciagu kilkudziesięciu sekund otrzymasz na swoj telefon KOD, który należy wpisać w poniższe pole. \n3.Nacisnij przycisk SPRAWDZ jeżeli kod będzie prawidłowy, konto premium zostanie automatycznie aktywowane!", screenW * 0.3786, screenH * 0.3467, screenW * 0.6155, screenH * 0.4781, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, true, false, false, false)
        dxDrawLine((screenW * 0.4179) - 1, (screenH * 0.6752) - 1, (screenW * 0.4179) - 1, screenH * 0.7210, tocolor(93, 51, 214, 161), 1, false)
        dxDrawLine(screenW * 0.5857, (screenH * 0.6752) - 1, (screenW * 0.4179) - 1, (screenH * 0.6752) - 1, tocolor(93, 51, 214, 161), 1, false)
        dxDrawLine((screenW * 0.4179) - 1, screenH * 0.7210, screenW * 0.5857, screenH * 0.7210, tocolor(93, 51, 214, 161), 1, false)
        dxDrawLine(screenW * 0.5857, screenH * 0.7210, screenW * 0.5857, (screenH * 0.6752) - 1, tocolor(93, 51, 214, 161), 1, false)
        dxDrawRectangle(screenW * 0.4179, screenH * 0.6752, screenW * 0.1679, screenH * 0.0457, tocolor(0, 0, 0, 98), false)
        dxDrawText("Sprawdz", screenW * 0.4561, screenH * 0.6818, screenW * 0.5452, screenH * 0.7048, tocolor(255, 255, 255, 255), 1.00, "bankgothic", "left", "top", false, false, false, false, false)
end

addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
		if isMouseIn(screenW * 0.4601, screenH * 0.6848, screenW * 0.5452, screenH * 0.7048) and data.showed then
	--	outputChatBox("Ten kod ("..guiGetText(data.button[1])..") wyslij na pm do Czeko (/pm Czeko "..guiGetText(data.button[1])..")")
		if guiCheckBoxGetSelected(data.button[2]) then amount = "19" else amount = "9" end
		triggerServerEvent("premiumActive", localPlayer, guiGetText(data.button[1]),amount)
		destroyElement(data.button[1])
		destroyElement(data.button[2])
		removeEventHandler("onClientRender", root, renderZoneBox)
		data.showed=false
		showCursor(false)
		elseif isMouseIn(screenW * 0.3655, screenH * 0.2733, screenW * 0.2696, screenH * 0.0467) and data.showed then
		destroyElement(data.button[1])
		destroyElement(data.button[2])
		removeEventHandler("onClientRender", root, renderZoneBox)
		data.showed=false
		showCursor(false)
		end
	end
end)

function premiumshow()
if data.showed then
	destroyElement(data.button[1])
	destroyElement(data.button[2])
	removeEventHandler("onClientRender", root, renderZoneBox)
	data.showed=false
	showCursor(false)
else
	addEventHandler("onClientRender", root, renderZoneBox) 
	data.button[1] = guiCreateEdit(0.40, 0.57, 0.21, 0.05, "", true)
	data.button[2] = guiCreateCheckBox(0.40, 0.61, 0.21, 0.05, "Dłuższe premium (60 dni)", false,true)
    guiEditSetMaxLength(data.button[1], 8)  
	data.showed=true
end
end
addCommandHandler('premium', premiumshow)