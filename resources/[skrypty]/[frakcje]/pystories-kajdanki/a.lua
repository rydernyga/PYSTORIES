--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

policeVehicles = { [598]=true,[596]=true,[597]=true,[432]=true,[433]=true,[528]=true,[490]=true,[599]=true }

 function blokada ( player, seat, jacked )
  local kategoria = getElementData(player, "kajdanki")
  if kategoria ~= false then
  if ( not policeVehicles[getElementModel(source)] ) then
    cancelEvent()
    outputChatBox("#FF0000Masz kajdanki i nie możesz wsiąść do tego pojazdu.",player,255, 0, 0, true)
   end
  end
 end
 addEventHandler ("onVehicleStartEnter", getRootElement(), blokada)

 function kajdankii ( player, cmd, gracz )
	if getElementData(player,'player:faction') and getElementData(player,'player:faction')=='SAPD' then
		if not (gracz) then
		outputChatBox("Błąd! Użyj: /kajdanki <nick/ID> ",player)
		return
		end
		local targetElement=exports['pystories-core']:findPlayer(player, gracz)
		if targetElement then
			local x, y, z = getElementPosition(player)
			local tx, ty, tz = getElementPosition(targetElement)
				
			local distance = getDistanceBetweenPoints3D(x, y, z, tx, ty, tz)
				
		  if (distance<=10) then
			local dokogo=getElementData(targetElement,"kajdanki")
			if (not dokogo or not isElement(dokogo)) then
				toggleControl(targetElement, "sprint", false )
				toggleControl(targetElement, "jump", false )
				toggleControl(targetElement, "aim_weapon", false )
				toggleControl(targetElement, "fire", false )
				toggleControl(targetElement, "crouch", false )
				triggerEvent("onKajdankiZakuj", root, player, targetElement)
				outputChatBox("#0078FFZałożyłeś kajdanki.",player,255, 0, 0, true)
			--	outputChatBox("#0078FFPolicjant założył ci kajdanki. Nie możesz szybko biegać, skakać ani prowadzić pojazdów.",targetElement,255, 0, 0, true)
			else
			    toggleControl(targetElement, "sprint", true )
				toggleControl(targetElement, "jump", true )
				toggleControl(targetElement, "crouch", true )
				triggerEvent("onKajdankiZakuj", root, player, targetElement)
				outputChatBox("* #0078FFŚciągnąłeś graczowi kajdanki.", player,255, 0, 0, true)
            --    outputChatBox("* #0078FFPolicjant ściągnał Ci kajdanki.",targetElement,255, 0, 0, true)
			end
		  else
			  outputChatBox("* #0078FFJesteś za daleko gracza, żeby móc wystawić mandat.", player,255, 0, 0, true)
		   end
		end	
	else
          outputChatBox("#FF0000Nie Jesteś Policjantem.",player)
	end
 end
 addCommandHandler("kajdanki", kajdankii)
 
 
 addEvent("setPedAnimation", true)
addEventHandler("setPedAnimation", root, function(block,anim,time,loop,updatePosition,interruptable, freezeLastFrame)
-- triggerServerEvent("setPedAnimation", localPlayer, "SWORD", "sword_block", -1, false, false, true,true)
	if (time==nil) then time=-1 end
	if (loop==nil) then loop=true end
	if (updatePosition==nil) then updatePosition=true end
	if (interruptable==nil) then interruptable=true end
	if (freezeLastFrame==nil) then freezeLastFrame=true end
--	bool setPedAnimation ( ped thePed [, string block=nil, string anim=nil, int time=-1, bool loop=true, bool updatePosition=true, bool interruptable=true, bool freezeLastFrame = true] )
	if getElementData(source, "blockSettingAnimation") then return false end
	if getElementData(source, "menu_usiadz") then detachElements(source, getElementData(source, "menu_usiadz"))  end
	setPedAnimation(source, block, anim, time, loop, updatePosition, interruptable, freezeLastFrame)

end)

for k,v in ipairs(getElementsByType("player")) do
	setElementData(v, "animStartPos", false)
	setElementCollisionsEnabled(v,true)
end
