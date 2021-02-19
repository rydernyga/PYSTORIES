local weaponid = 23
function onFire(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
	if weapon == weaponid then
	if hitElement then
		if hitElement ~= source then
			if getElementType(hitElement) == "player" then
				triggerServerEvent("onParalyze", hitElement)
			elseif getElementType(hitElement) == "vehicle" then
				triggerServerEvent("onVehicle", hitElement)

			end
		end
	end
	end
end

addEventHandler( "onClientPlayerWeaponFire", getRootElement(), onFire) 
