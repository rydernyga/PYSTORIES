engineImportTXD (engineLoadTXD("taser.txd"), 347)
engineReplaceModel(engineLoadDFF("taser.dff", 347), 347)

function strzal(wp, _, _, hitX, hitY, hitZ, element, startX, startY, startZ)
	if(wp == 23) then
		strzal(hitX, hitY, hitZ, startX, startY, startZ)
		if(source == localPlayer) then
			strzal()
		end
	end
end
addEventHandler("onClientPlayerWeaponFire", getRootElement(), strzal)