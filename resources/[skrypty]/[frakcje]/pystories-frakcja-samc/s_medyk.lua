--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

addEventHandler("onPlayerDamage ",root,
    function (attacker,weapon)
      --  if (getElementData(attacker,"player:faction")=="samc-sf") then
            if (weapon==41) then
                if (getElementHealth(source) < 100) then
                    givePlayerMoney(attacker,350 - getElementHealth(source))
                    setElementHealth(source,getElementHealth(source) + 20)
             --   end
            end
        end
    end
)
addEvent ( "MedicHeal", true )
addEventHandler ( "MedicHeal", root,
function (attacker)
    local playerHealth = getElementHealth ( source )
    if ( playerHealth > 99 ) then
		return end
    setElementHealth ( source, 100 )
    givePlayerMoney ( attacker, ( playerHealth/50 ) )
	setElementData(attacker, "medic:cooldown", 3)
end
)


local skiny = createMarker (  3944.23, -1183.67, 8.37-0.90, "cylinder", 1.0, 0, 255, 0, 255 )
setElementDimension(skiny, 0)
setElementInterior(skiny, 1)
local t=createElement("text")
setElementData(t,"name", "Wyposażenie\nRatownika Medycznego")
setElementPosition(t,3944.23, -1183.67, 8.37)
setElementDimension(t, 0)
setElementInterior(t, 1)

function skiny1(hitElement, matchingDimension)
	if source == skiny then
		if getElementData(hitElement,"player:faction") == "SAMC" then
			outputChatBox("* Wziąłeś(aś) swoje wyposażenie!", hitElement)
			giveWeapon(hitElement, 41, 300)
		else
			outputChatBox ("* Nie jesteś na służbie, lub nie pracujesz w Pogotowiu Ratunkowym.", hitElement)
		end
	end
end
addEventHandler ("onMarkerHit", skiny, skiny1)





addEventHandler("onVehicleEnter", resourceRoot, function(plr,seat,jacked)
	if seat == 0 then
		setElementFrozen(source,false)
		setElementData(source,"use:player",true)
		outputChatBox(" Wszelkie zostawiania pojazdów będa karane banem.", plr)
		outputChatBox(" Wszedleś/aś do pojazdu frakcyjnego, dbaj o niego i odstaw na miejsce.", plr)
	end
end)

setTimer(function() 
 	for i,vehicle in pairs(getElementsByType("vehicle", resourceRoot)) do
		local x,y,z = getElementPosition(vehicle)
		local r1,r2,r3 = getElementRotation(vehicle)
		setVehicleRespawnPosition(vehicle,x,y,z,r1,r2,r3)
		addEventHandler("onVehicleRespawn",resourceRoot,function() setElementFrozen(true) end)
		toggleVehicleRespawn(vehicle,true)
		setVehicleIdleRespawnDelay(vehicle,3600000)
		setElementData(vehicle,"vehicle:duty","SAMC")
		setElementFrozen(vehicle,true)
  	end
end,500,1)

