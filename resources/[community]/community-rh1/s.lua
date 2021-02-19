function getVehicleHandlingProperty ( element, property )
    if isElement ( element ) and getElementType ( element ) == "vehicle" and type ( property ) == "string" then
        local handlingTable = getVehicleHandling ( element ) 
        local value = handlingTable[property] 
 
        if value then
            return value
        end
    end
 
    return false
end

function o(c)
if c then
		local gora = getElementData(c, "rh:up") or 0
        local s=getVehicleHandlingProperty(c,"suspensionForceLevel")
		if tonumber(gora) == 4 then outputChatBox("* Osiągnąłeś(aś) limit regulacji zawieszenia !", getVehicleController(c), 255, 255, 255) cancelEvent() return end
        setVehicleHandling(c,"suspensionForceLevel",tonumber(s) - 0.24)
		setElementData(c, "rh:up", gora+1)
        outputChatBox("* Auto zostało obniżone.",getVehicleController(c),255,255,255,true)
    end
end
addEvent("rh:o", true)
addEventHandler("rh:o", root, o)
function p(c)
    if c then
		local gora = getElementData(c, "rh:up") or 0
        local s=getVehicleHandlingProperty(c,"suspensionForceLevel")
		if tonumber(gora) == -8 then outputChatBox("* Osiągnąłeś(aś) limit regulacji zawieszenia !", getVehicleController(c), 255, 255, 255) cancelEvent() return end
        setVehicleHandling(c,"suspensionForceLevel",tonumber(s) + 0.24)
		setElementData(c, "rh:up", gora-1)
        outputChatBox("* Auto zostało podwyższone.",getVehicleController(c),255,255,255,true)
	end
end
addEvent("rh:p", true)
addEventHandler("rh:p", root, p)

addEventHandler("onPlayerVehicleEnter", root,
function(car, seat)
if seat ~= 0 then return end
if getElementData(car, "vehicle:id") and getElementData(source, "player:uid") then
local qr = exports['pystories-db']:dbGet("SELECT * FROM pystories_vehicles WHERE id=? AND rh=?",getElementData(car, "vehicle:id"), "1")
if #qr == 1 then
triggerClientEvent(source,"rhshow", root)
end
end
end)