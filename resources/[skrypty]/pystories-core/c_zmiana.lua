--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

GUIEditor = {
    button = {},
    window = {},
    edit = {}
}
addEventHandler("onClientResourceStart", resourceRoot,
    function()
        GUIEditor.window[1] = guiCreateWindow(0.40, 0.39, 0.20, 0.36, "", true)
        guiWindowSetSizable(GUIEditor.window[1], false)

        GUIEditor.edit[1] = guiCreateEdit(31, 82, 211, 43, "", false, GUIEditor.window[1])
        GUIEditor.button[1] = guiCreateButton(55, 174, 165, 70, "KODUJ", false, GUIEditor.window[1])
        guiSetFont(GUIEditor.button[1], "default-bold-small")
        guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FF3D6BC2")    
		guiSetVisible(GUIEditor.window[1], false)
		addEventHandler ( "onClientGUIClick", GUIEditor.button[1], przycisk2, false )
    end
)
function przycisk2 ( button )
    if button == "left" then
        local text = guiGetText ( GUIEditor.edit[1])
		if string.len(text) < 1 then outputChatBox("* Wpisz najpierw coś !") return end
		triggerServerEvent("code:password",root,text)
    end
end
PANEL = {
    button = {},
    window = {},
    label = {},
    edit = {}
}

addEventHandler("onClientResourceStart", resourceRoot,
    function()
		local screenW, screenH = guiGetScreenSize()
        PANEL.window[1] = guiCreateWindow((screenW - 283) / 2, (screenH - 312) / 2, 283, 312, "Zmiana hasła(F3 wlaczasz kursor!)", false)
        guiWindowSetMovable(PANEL.window[1], false)
        guiWindowSetSizable(PANEL.window[1], false)
        guiSetAlpha(PANEL.window[1], 0.94)
        guiSetProperty(PANEL.window[1], "CaptionColour", "FF86202A")
        PANEL.edit[1] = guiCreateEdit(0.09, 0.18, 0.82, 0.09, "", true, PANEL.window[1])
        PANEL.edit[2] = guiCreateEdit(0.07, 0.49, 0.82, 0.09, "", true, PANEL.window[1])
        PANEL.edit[3] = guiCreateEdit(0.07, 0.69, 0.82, 0.09, "", true, PANEL.window[1])
        PANEL.label[1] = guiCreateLabel(0.21, 0.09, 0.58, 0.05, "Aktualne hasło", true, PANEL.window[1])
        PANEL.label[2] = guiCreateLabel(0.21, 0.41, 0.58, 0.05, "Wpisz nowe hasło", true, PANEL.window[1])
        PANEL.label[3] = guiCreateLabel(0.21, 0.61, 0.58, 0.05, "Ponów", true, PANEL.window[1])
        PANEL.button[1] = guiCreateButton(0.15, 0.82, 0.67, 0.13, "Zmień hasło", true, PANEL.window[1])    
		guiSetVisible(PANEL.window[1], false)
		addEventHandler ( "onClientGUIClick", PANEL.button[1], przycisk, false )
    end
)


function przycisk ( button )
    if button == "left" then
        local text = guiGetText ( PANEL.edit[1] )
        local text2 = guiGetText ( PANEL.edit[2] )
		local text3 = guiGetText ( PANEL.edit[3] )
		if text2 ~= text3 then outputChatBox("* Nowe hasła nie są takie same !") return end
		guiSetVisible(PANEL.window[1], false)
		triggerServerEvent("change:password",root,text,text2,text3)
    end
end
addEvent("password:change",true)
addEventHandler("password:change",root,function() 
	if not getElementData(localPlayer,"player:sid") then return end
	guiSetVisible(PANEL.window[1], not guiGetVisible(PANEL.window[1]))
	guiSetText(PANEL.edit[1],"")
	guiSetText(PANEL.edit[2],"")
	guiSetText(PANEL.edit[3],"")
end)

addEvent("password:code",true)
addEventHandler("password:code",root,function() 
	if not getElementData(localPlayer,"player:sid") then return end
	guiSetVisible(GUIEditor.window[1], not guiGetVisible(GUIEditor.window[1]))
	guiSetText(GUIEditor.edit[1],"")
end)

addCommandHandler("qkx.kodujhaslo",function()
triggerEvent("password:code",root)
end)
addCommandHandler("zmianahasla",function()
triggerEvent("password:change",root)
end)
addCommandHandler("zmienhaslo",function()
triggerEvent("password:change",root)
end)
