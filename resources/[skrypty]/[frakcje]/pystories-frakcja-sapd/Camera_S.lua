--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--


function SpeedCam_Render_ON( thePlayer, matchingDimension )
if getElementType ( thePlayer ) == "player" then 
local SpeedName = getElementData(source,"Speed")
setElementData(thePlayer,"Speed:ON",SpeedName)
end
	end

 

function SpeedCam_Render_OFF( thePlayer, matchingDimension )
if getElementType ( thePlayer ) == "player" then 
removeElementData(thePlayer,"Speed:ON")
end
	end

function ToggleSpeedCamera(player)
local veh = getPedOccupiedVehicle ( player )
local Speed = getElementData(veh,"Speed")
local model = getElementModel(veh)
if getElementData(veh,"vehicle:police") then
if Speed == true then
triggerClientEvent ( player, "Speed:Cam", player,"off" )
setElementData(veh,"Speed",false)
local el=getAttachedElements(veh)
for i,v in ipairs(el) do
if getElementType(v)=="colshape" then
destroyElement(v)
end
	end
elseif Speed == false then
	local x, y, z = getElementPosition(veh)
	local radiusLevel = 6
	local radius = createColSphere(x, y, z, radiusLevel)
	local ID = getElementData(veh,"dbid")
	attachElements ( radius,veh, 0, 5+radiusLevel, 0 )
	setElementData(radius,"Speed",ID)
	setElementData(veh,"Speed",true)
	addEventHandler ( "onColShapeHit", radius ,SpeedCam_Render_ON )
	addEventHandler ( "onColShapeLeave", radius, SpeedCam_Render_OFF )	
	triggerClientEvent ( player, "SpeedCam", player,"on" )
end
	end
		end

 
 
function enterVehicle ( player, seat, jacked ) 
local model = getElementModel(source)
if getElementData(source,"vehicle:police") and (seat == 0 or seat == 1) then
	local x, y, z = getElementPosition(source)
	local radiusLevel = 6
	local radius = createColSphere(x, y, z, radiusLevel)
	if seat == 0 then
	local PoliceNames = string.gsub(getPlayerName(player),"_"," ")
	setElementData(source,"SpeedCurrise:Police:Name",PoliceNames)
	end

	local ID = getElementData(source,"dbid")
	attachElements ( radius,source, 0, 5+radiusLevel, 0 )
	setElementData(radius,"Speed",ID)
	setElementData(source,"Speed",true)
	addEventHandler ( "onColShapeHit", radius ,SpeedCam_Render_ON )
	addEventHandler ( "onColShapeLeave", radius, SpeedCam_Render_OFF )		
triggerClientEvent ( player, "SpeedCam", player,"on" )	
end	
end
addEventHandler ( "onVehicleEnter", getRootElement(), enterVehicle )

function exitVehicle ( thePlayer, seat, jacked ) 
local model = getElementModel(source)
if getElementData(source,"vehicle:police") and (seat == 0 or seat == 1) then
triggerClientEvent ( thePlayer, "SpeedCam", thePlayer,"off" )	
end	
end
addEventHandler ( "onVehicleExit", getRootElement(), exitVehicle ) 