--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local praca = createMarker(-3018.99,5533.25,63.16, "cylinder", 2.0, 255, 255, 255, 80)
local t=createElement("text")
setElementData(t,"name", "PRACA: Magazynier\nZAROBEK:\nGRACZ 75PLN | PREMIUM 120PLN\nOPIS: Przenoszenie pudeł")
setElementPosition(t,-3018.99,5533.25,64.16)
setElementDimension(t, 0)
setElementInterior(t, 0)


local miejscamagazynier = {
    {-3046.30,5508.40,64.16}, 
    {-3015.79,5497.22,64.16},
    {-3039.44,5483.14,64.16},
    {-3007.90,5481.19,64.16},
    {-3050.74,5522.04,64.16},
    {-3007.90,5514.92,64.16},
    {-3029.04,5511.34,64.16},
    {-3047.34,5497.40,64.16},
    {-3008.11,5528.10,64.16},
    {-3014.14,5514.97,64.16},
    {-3010.99,5487.51,64.16},
    {-3038.29,5521.74,64.16},
    {-3023.32,5518.56,64.16},
    {-3023.22,5508.10,64.16},
}

addEventHandler("onClientMarkerHit", praca, function(el, md)
    if not md or getElementType(el) ~= "player" then return end
    if el ~= localPlayer then return end
	outputChatBox("* Aby rozpocząć pracę wciśnij 'E'")
end)


bindKey("e", "down", function()
    if not isElementWithinMarker(localPlayer, praca) then return end
    if not getElementData(localPlayer, "player:job") then
        local losuj = math.random(2, #miejscamagazynier)
        setElementData(localPlayer, "player:job", true)
        setPedAnimation ( localPlayer, "CARRY", "crry_prtial", 1,true )

        local skrzynia = createObject(1271, 0, 0, 0)
        attachElements ( skrzynia, localPlayer, 0, 0.8, 0.5)
        
        local cel = createMarker(miejscamagazynier[losuj][1], miejscamagazynier[losuj][2], miejscamagazynier[losuj][3]-1.0, "checkpoint", 1.0, 255, 0, 0)
        local blip = createBlipAttachedTo(cel, 41)
        
        addEventHandler("onClientMarkerHit", cel, function(el, md)
            if not md or getElementType(el) ~= "player" then return end
            if el ~= localPlayer then return end

            if getPedOccupiedVehicle(el) then
			outputChatBox("* Nie możesz tego odłożyć będąc w pojeździe !")
                return
            end


            destroyElement(blip)
            setElementFrozen(el, true)
			outputChatBox("* Kładziesz skrzynie, odczekaj 5 sekund.")
            setTimer(function()
                setElementFrozen(el, false)
                destroyElement(skrzynia)
                destroyElement(cel)
                setPedAnimation(localPlayer, false)
                setElementData(el, "player:job", false)
				if getElementData(el,"player:premium") then
				outputChatBox("* Odłożyłeś(aś) skrzynię. Za odłożenie skrzynii, otrzymujesz 120 PLN.")
				triggerServerEvent("givePlayerMoney", el, 120, 0)
				setElementData(el,"player:srp", getElementData(el,"player:srp")+math.random(0,1))
				else
				outputChatBox("* Odłożyłeś(aś) skrzynię. Za odłożenie skrzynii, otrzymujesz 75 PLN.")
				triggerServerEvent("givePlayerMoney", el, 75, 0)
				setElementData(el,"player:srp", getElementData(el,"player:srp")+math.random(0,1))
				end
            end, 4000, 1)
        end)
    else
        outputChatBox("* Posiadasz aktywną pracę.")
    end
end)


addEventHandler("onClientResourceStop", resourceRoot, function()
 setElementData(localPlayer, "player:job", false)
end,false,"high")

fileDelete("praca_c.lua")