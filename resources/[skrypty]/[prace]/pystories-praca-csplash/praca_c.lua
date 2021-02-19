--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local praca = createMarker(-1708.24,188.50,32.99-1, "cylinder", 2.0, 0, 255, 0, 135)
local t=createElement("text")
setElementData(t,"name", "PRACA: Celebrity Splash\nZAROBEK:\nGRACZ 45PLN | PREMIUM 65PLN\nOPIS: Skoki do wody")
setElementPosition(t,-1708.24,188.50,32.99)
setElementDimension(t, 0)
setElementInterior(t, 0)


local miejscasplash = {
    {-1678.53,176.39,-0.36},
    {-1665.80,189.88,0.96},
    {-1675.87,183.62,0.07},
    {-1681.15,187.56,0.89},
    {-1699.83,207.05,-0.40},
}

addEventHandler("onClientMarkerHit", praca, function(el, md)
    if not md or getElementType(el) ~= "player" then return end
    if el ~= localPlayer then return end
    --outputChatBox("* Zarobki pracy: 6 PLN za wskoczenie do punktu.")
    outputChatBox("* Aby rozpocząć pracę wciśnij 'E'")
end)


bindKey("e", "down", function()
    if not isElementWithinMarker(localPlayer, praca) then return end
    if not getElementData(localPlayer, "player:job") then
        local losuj = math.random(2, #miejscasplash)
        setElementData(localPlayer, "player:job", true)
		outputChatBox("* Masz 10 sekund!.", 255, 0, 0)
        outputChatBox("* Doskocz do checkpointa!.")
        local cel = createMarker(miejscasplash[losuj][1], miejscasplash[losuj][2], miejscasplash[losuj][3]+1.0, "checkpoint", 4.0, 255, 0, 0)
        local blip = createBlipAttachedTo(cel, 41)
		local czas = setTimer(function()
				destroyElement(cel)
                destroyElement(blip) 
                setElementData(localPlayer, "player:job", false)
				outputChatBox("* Praca anulowana nie doskoczyłeś(aś) !", 255, 0, 0)
            end, 10000, 1)
        
        addEventHandler("onClientMarkerHit", cel, function(el, md)
            if not md or getElementType(el) ~= "player" then return end
            if el ~= localPlayer then return end
			if isElementInWater(el) then
			   outputChatBox("* Praca anulowana nie doskoczyłeś(aś) !", 255, 0, 0)
			   setElementPosition(el, -1708.24,188.50,32.99)
			setElementData(el, "player:job", false)
			destroyElement(blip)
			destroyElement(cel)
			if isTimer ( czas ) then killTimer (czas) end
			return end
            if getPedOccupiedVehicle(el) then
            outputChatBox("* Nie możesz tego robić będąc w pojeździe!")
                return
            end
			setElementFrozen(el, true)
            destroyElement(blip)  
			if isTimer ( czas ) then killTimer (czas) end
            outputChatBox("* Gratulacje doskoczyłeś!")
            setTimer(function()
				destroyElement(cel)
                setElementFrozen(el, false)
                setElementData(el, "player:job", false)
                --triggerServerEvent("givePlayerMoney", el, 3, 2 )
				--outputChatBox("* Zarobiłeś 6 PLN!")
				if getElementData(el,"player:premium") then
				outputChatBox("* Doskoczyłeś(aś) do punktu i otrzymujesz 85 PLN.")
				triggerServerEvent("givePlayerMoney", el, 65, 0)
				setElementData(el,"player:srp", getElementData(el,"player:srp")+math.random(0,1))
				else
				outputChatBox("* Doskoczyłeś(aś) do punktu i otrzymujesz 50 PLN.")
				triggerServerEvent("givePlayerMoney", el, 45, 0)
				setElementData(el,"player:srp", getElementData(el,"player:srp")+math.random(0,1))
				end
				setElementPosition(el, -1708.24,188.50,32.99)
            end, 1500, 1)
        end)
    else
        outputChatBox("* Posiadasz aktywną pracę.")
    end
end)


addEventHandler("onClientResourceStop", resourceRoot, function()
 setElementData(localPlayer, "player:job", false)
end,false,"high")

fileDelete("praca_c.lua")