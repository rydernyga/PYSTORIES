--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

addEventHandler( "onClientElementStreamIn", root,
    function ( )
        if getElementType( source ) == "object" then
			setObjectBreakable(source, false)
		end
end)
addEvent("setBreakable",true)
addEventHandler("setBreakable",root,function(obj)
setObjectBreakable(obj, false)
end)

addEvent("addNotification",true)
addEventHandler("addNotification",root,function(tekst,typ)
if not tekst then return end
if not typ then return end
outputChatBox(tekst)
end)

addEvent("addNotificatione",true)
addEventHandler("addNotificatione",root,function(tekst,typ)
if not tekst then return end
if not typ then return end
exports['notices']:addNotification(tekst,typ)
end)


function stopMinigunDamage ( attacker, weapon, bodypart )
	if ( weapon == 0 ) then 
		cancelEvent()
	end
end
addEventHandler ( "onClientPlayerDamage", getLocalPlayer(), stopMinigunDamage )

function nodamage(attacker, bodypart)
	if not attacker then return end
	if getElementType(attacker) == 'vehicle' then
		cancelEvent()
	end
end
addEventHandler("onClientPlayerDamage", getLocalPlayer(),nodamage)

function blokada ( prevSlot, newSlot )
	if getPedWeapon(getLocalPlayer(),newSlot) == 0 and getElementData(getLocalPlayer(),"player:admin") == true then 
		toggleControl ( "fire", true )
		toggleControl("aim_weapon", true)
	elseif getPedWeapon(getLocalPlayer(),newSlot) == 7 then
		toggleControl ("fire", false ) 
		toggleControl("aim_weapon", false)
		return false
	elseif getPedWeapon(getLocalPlayer(),newSlot) ~= 0 and  getPedWeapon(getLocalPlayer(),newSlot) ~= 22 then
		toggleControl ("fire", true ) 
		toggleControl("aim_weapon", true)
	elseif getPedWeapon(getLocalPlayer(),newSlot) == 22 and getElementData(getLocalPlayer(),"player:admin") == true then
		toggleControl ("fire", false ) 
		toggleControl("aim_weapon", true)
	elseif getPedWeapon(getLocalPlayer(),newSlot) == 22 and getElementData(getLocalPlayer(),"player:admin") == false then
		toggleControl ("fire", true ) 
		toggleControl("aim_weapon", true)
	else
		toggleControl ( "fire", false ) 
		toggleControl("aim_weapon", false)
	end
end
addEventHandler ( "onClientPlayerWeaponSwitch", getRootElement(), blokada )

setTimer(function()
local czas=tonumber(getElementData(localPlayer, "player:online"))
if not czas then return end
setElementData(localPlayer, "player:online", czas+1)
end, 60000, 0)


function chat()
    if isChatVisible() then --Check or the chat is visible.
        showChat(false) --If it is, hide it.
    else
        showChat(true) --If it is not, show it.
    end
end
addCommandHandler('chat', chat)

addEvent("core:blipyaut", true)
addEventHandler("core:blipyaut", root, function(plr)
if plr ~= localPlayer then return end
local sid=getElementData(plr,"player:sid")
for id, veh in ipairs( getElementsByType ( "vehicle" ) ) do
if sid == getElementData(veh,"vehicle:ownedPlayer") then
createBlipAttachedTo(veh,0,0,5000,0,0.3,0,255,0,255,1,99999)
end
end
end)
function destroyBlipsAttachedTo(elemente)
	local attached = getAttachedElements ( elemente )
	if ( attached ) then
		for k,element in ipairs(attached) do
			if getElementType ( element ) == "blip" then
				destroyElement ( element )
			end
		end
	end
end
function veh_blips()
    for i,v in pairs(getElementsByType("vehicle")) do
        if getElementData(v,"vehicle:spawn") == true then
            if getElementData(v,"vehicle:ownedPlayer") == getElementData(localPlayer,"player:sid") then
				createBlipAttachedTo(v,0,1,255,0,0,255,1,9999)
            end
			local rent = getElementData(v,"vehicle:rent")
			if rent and (type(rent) == "table") then
				for i,s in pairs(rent) do
					if tonumber(s) == getElementData(localPlayer,"player:sid") then
						createBlipAttachedTo(v,0,1,0,0,255,255,1,9999)
					end
				end
			end
        end
    end
end
setTimer(veh_blips,10000,0)
addEventHandler("onClientElementDestroy", root, function ()
	if getElementType(source) == "vehicle" then
	destroyBlipsAttachedTo(source)
	end
end)
addEventHandler ( "onClientElementDataChange", root,
function ( dataName )
	if getElementType ( source ) == "vehicle" and dataName == "vehicle:ownedPlayer" then
		destroyBlipsAttachedTo(source)
	end
	if getElementType ( source ) == "vehicle" and dataName == "vehicle:rent" then
		destroyBlipsAttachedTo(source)
	end
end )