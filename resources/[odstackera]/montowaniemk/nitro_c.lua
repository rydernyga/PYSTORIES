
GUIEditor = {
    button = {},
    window = {}
}
addEventHandler("onClientResourceStart", resourceRoot,
    function()
        GUIEditor.window[1] = guiCreateWindow(330, 200, 405, 460, "MK", false)
        guiWindowSetSizable(GUIEditor.window[1], false)
        guiSetAlpha(GUIEditor.window[1], 0.83)

        GUIEditor.button[1] = guiCreateButton(23, 37, 115, 58, "MK1\n65,000 PLN", false, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFAAAAAA")

        GUIEditor.button[2] = guiCreateButton(145, 37, 115, 58, "MK2\n85,000 PLN", false, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFAAAAAA")

        GUIEditor.button[3] = guiCreateButton(267, 37, 115, 58, "Napęd 4x4\n100,000 PLN", false, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[3], "NormalTextColour", "FFAAAAAA")
       
        GUIEditor.button[8] = guiCreateButton(11, 369, 383, 81, "Zamknij okno", false, GUIEditor.window[1])
        guiSetProperty(GUIEditor.button[8], "NormalTextColour", "FFAAAAAA")    
    end
)

addEventHandler("onClientResourceStart",resourceRoot,
function()
guiSetVisible(GUIEditor.window[1],false)
end
)

marker = createMarker(-2052.77, 159.02, 28.84-0.9, 'cylinder', 4, 255, 0, 0, 120)
--createBlipAttachedTo(marker, 63)

function hit(plr,md)
if plr ~= localPlayer then return end
if not isPedInVehicle(localPlayer) then return end
guiSetVisible(GUIEditor.window[1], true)
showCursor(true)
setElementFrozen(pojazd,true)
--setElementFrozen(plr,true)
end
addEventHandler("onClientMarkerHit", marker, hit)


function mk1()
if source ~= GUIEditor.button[1] then return end
    triggerServerEvent("mk1", localPlayer)
    guiSetVisible(GUIEditor.window[1],false)
showCursor(false)
setElementFrozen(pojazd,false)
end

addEventHandler ( "onClientGUIClick", root, mk1)


function mk2()
if source ~= GUIEditor.button[2] then return end
    triggerServerEvent("mk2", localPlayer)
    guiSetVisible(GUIEditor.window[1],false)
showCursor(false)
setElementFrozen(pojazd,false)
end

addEventHandler ( "onClientGUIClick", root, mk2)

function rh1()
if source ~= GUIEditor.button[3] then return end
    triggerServerEvent("rh", localPlayer)
    guiSetVisible(GUIEditor.window[1],false)
showCursor(false)
setElementFrozen(pojazd,false)
end

addEventHandler ( "onClientGUIClick", root, rh1)

function zamknij()
if source ~= GUIEditor.button[8] then return end
   guiSetVisible(GUIEditor.window[1], localPlayer)
   setElementFrozen(pojazd,false)
end
addEventHandler ( "onClientGUIClick", root, zamknij)


function zamykamy()
if source ~= GUIEditor.button[8] then return end
guiSetVisible(GUIEditor.window[1],false)
setElementFrozen(pojazd,false)
setElementFrozen(plr,false)
showCursor(false)
end

addEventHandler ( "onClientGUIClick", root, zamykamy)