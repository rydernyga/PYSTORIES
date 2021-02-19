--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

createBlip(-2661.18,609.51,14.49, 22,2,0,0,0,0,0,275)

function cancelChoking(weaponID, responsiblePed)
	if (weaponID==41) then
		cancelEvent()
	end
end
addEventHandler("onClientPlayerChoke", getLocalPlayer(), cancelChoking)



function stopMinigunDamage ( attacker, weapon, bodypart )
	if not attacker then return end
	if ( weapon == 41 ) then 
		cancelEvent()
		if (getElementData(attacker, "medic:cooldown") == false) then
			triggerServerEvent ( "MedicHeal", getLocalPlayer(), attacker )
		end
	end
end
addEventHandler ( "onClientPlayerDamage", getLocalPlayer(), stopMinigunDamage )

function stopMinigunDamage2 ( attacker, weapon, bodypart )
	if attacker == localPlayer and getElementData(attacker, "medic:cooldown") then 
	outputChatBox("* Nie możesz jeszcze leczyć zostało Ci "..tonumber(getElementData(localPlayer,"medic:cooldown")).." minut do odczekania!")
	return end
end
addEventHandler ( "onClientPlayerDamage", getLocalPlayer(), stopMinigunDamage2 )


setTimer ( function()
	if (getElementData(localPlayer, "medic:cooldown") == false) then return end
	local timer = tonumber(getElementData(localPlayer, "medic:cooldown"))
	if timer then
		if timer == 0 then
		setElementData(localPlayer, "medic:cooldown", false)
		else
		setElementData(localPlayer, "medic:cooldown", timer-1)
		end
	end
end, 60000, 0 )