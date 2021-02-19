addEventHandler("onClientResourceStart", resourceRoot,
    function()
        rh = guiCreateWindow(0.00, 0.93, 0.14, 0.07, "Gwintowane zawieszenie", true)
        guiWindowSetSizable(rh, false)
		guiWindowSetMovable(rh, false)

        gora = guiCreateButton(0.05, 0.46, 0.43, 0.36, "Podwyższ", true, rh)
        dol = guiCreateButton(0.54, 0.46, 0.41, 0.36, "Obniż", true, rh)    
		guiSetVisible(rh, false)
    end
)
addEventHandler("onClientGUIClick", resourceRoot, function(btn)
local veh = getPedOccupiedVehicle(localPlayer)
if source == gora then
	triggerServerEvent("rh:p", root, veh)
elseif source == dol then
	triggerServerEvent("rh:o", root, veh)
end
end)

function patch()
local veh = getPedOccupiedVehicle(localPlayer)
	if not veh then
		if rh and ( guiGetVisible ( rh ) == true ) then
		guiSetVisible(rh, false)
		end
	end
end
addEventHandler("onClientRender", root, patch)

function show()
guiSetVisible(rh, true)
end
addEvent( "rhshow", true )
addEventHandler( "rhshow", root, show )
fileDelete("c.lua")