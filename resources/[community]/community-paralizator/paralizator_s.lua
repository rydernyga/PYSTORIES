local time = 25 

function displayLoadedRes ( res )
setWeaponProperty(23, "poor", "damage", 0)
setWeaponProperty(23, "std", "damage", 0)
setWeaponProperty(23, "pro", "damage", 0)
end

addEventHandler ( "onResourceStart",getResourceRootElement(getThisResource()), displayLoadedRes )
function onParalyzed()
	setElementFrozen ( source, true )
	setPedAnimation( source, "ped", "HIT_walk")
	setElementData(source,"zablokowany-realdriveby",true)
	setTimer(setElementFrozen, time * 1000, 1, source, false)
	setTimer(setPedAnimation, time * 1000, 1, source)
	setTimer(setElementData, time * 1000, 1, source,"zablokowany-realdriveby",true)
	if isPedInVehicle ( source ) then
	toggleControl ( source,"accelerate", false )
	toggleControl ( source,"enter_exit", false )
	toggleControl ( source,"brake_reverse", false )
	toggleControl (source, "vehicle_fire", false)
	toggleControl (source, "vehicle_secondary_fire", false)
	toggleControl (source, "vehicle_look_left", false)
	toggleControl (source, "vehicle_look_right", false)	
	toggleControl (source, "vehicle_mouse_look", false)
	
	setTimer(toggleControl, time * 1000, 1,  source,"accelerate", true)
	setTimer(toggleControl, time * 1000, 1,  source,"enter_exit", true)
	setTimer(toggleControl, time * 1000, 1,  source,"brake_reverse", true)
	setTimer(toggleControl, time * 1000, 1,  source,"vehicle_secondary_fire", true)
	setTimer(toggleControl, time * 1000, 1,  source,"vehicle_look_left", true)
	setTimer(toggleControl, time * 1000, 1,  source,"vehicle_look_right", true)	
	setTimer(toggleControl, time * 1000, 1,  source,"vehicle_mouse_look", true)	
	end
end

addEvent("onParalyze", true)
addEventHandler("onParalyze", getRootElement(), onParalyzed)

function onveh()
local vehheal = getElementHealth ( source )
setElementHealth ( source, vehheal )

end

addEvent("onVehicle", true)
addEventHandler("onVehicle", getRootElement(), onveh)