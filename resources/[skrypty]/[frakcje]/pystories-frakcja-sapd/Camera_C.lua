--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local sx,sy = guiGetScreenSize()
local font = dxCreateFont('files/myriadproregular.ttf', 13)
local pojazdNamierzany = nil
local predkoscPojazdu=0
Policevehicle_data = {}
	
function RenderCamerAS(status)
	if status == 'on' then
		addEventHandler('onClientRender', getRootElement(), RenderCameraPlayerSpeed)
	elseif status == 'off' then
		removeEventHandler('onClientRender', getRootElement(), RenderCameraPlayerSpeed)
	end
end
addEvent( 'SpeedCam', true )
addEventHandler( 'SpeedCam', localPlayer, RenderCamerAS )


function RenderCameraPlayerSpeed()
	--if not(SpeedMathVehicle) then
	local PoliceVehicle = getPedOccupiedVehicle(localPlayer)
	if not PoliceVehicle then return end

	local vehID = getElementData(PoliceVehicle, 'dbid')
	for i, colshape in pairs(getElementsByType('colshape', root, true)) do
		local ColShapeID = getElementData(colshape,'Speed') or false
		if ColShapeID == vehID then
			local vehicles = getElementsWithinColShape ( colshape, 'vehicle' ) 
			for theKey,veh in pairs(vehicles) do 
				if not(veh == PoliceVehicle) then
					local vx, vy, vz = getElementVelocity(veh)
					local speed=((vx^2+vy^2+vz^2)^(0.5))*180
					predkoscPojazdu=math.floor(speed)
					if pojazdNamierzany and getVehicleName(pojazdNamierzany) == veh then
						pojazdNamierzany = pojazdNamierzany
					else
						pojazdNamierzany = veh
					end
				end
			end		
		end
	end
	if not pojazdNamierzany then return end

	local contentX = 250
	local contentY = sy/2
	local topX = contentX+320
	local topY = contentY+270

			
	local vehicle_model = getElementData(PoliceVehicle,'SpeedCurrise:Model') or 'Nieznany'
	local vehicle_plateText = getElementData(PoliceVehicle,'SpeedCurrise:Register') or 'Nieznany'
	local vehicle_speed = getElementData(PoliceVehicle,'SpeedCurrise:Speed') or '0'
	local police_name = getElementData(PoliceVehicle,'SpeedCurrise:Police:Name') or ' '
	local police_plateText = getVehiclePlateText(PoliceVehicle)

	local time=getRealTime()
	local year, month, day, hour, minute=time.year+1900, time.month+1, time.monthday, time.hour, time.minute
	local curData=('%04d/%02d/%02d %02d:%02d'):format(year, month, day, hour, minute)
	local police_updateData = getElementData(PoliceVehicle,'SpeedCurrise:Police:Data') or curData			

	dxDrawImage(topX,topY,350,100,'files/bg.png',0,0,0,tocolor(255,255,255,255),false)
	dxDrawText(vehicle_model, topX + 275, topY + 10, 500, 500,tocolor(150,150,150,255),0.8,font,'left','top',false,false,true)
	dxDrawText(vehicle_plateText, topX + 275, topY + 35, 500, 500,tocolor(150,150,150,255),0.8,font,'left','top',false,false,true)
	dxDrawText(vehicle_speed ..' km/h', topX + 80, topY + 15, 500, 500,tocolor(255,255,255,255),1.5,font,'left','top',false,false,true,true)
	dxDrawText(police_name , topX + 112, topY + 71, 500, 500,tocolor(150,150,150,255),0.8,font,'left','top',false,false,true)
	dxDrawText(police_plateText, topX + 35, topY + 71, 500, 500,tocolor(150,150,150,255),0.8,font,'left','top',false,false,true)
	dxDrawText(police_updateData, topX + 242, topY + 71, 500, 500,tocolor(150,150,150,255),0.8,font,'left','top',false,false,true)
				
	if predkoscPojazdu==0 or predkoscPojazdu>0 then
		local time=getRealTime()
		local year, month, day, hour, minute=time.year+1900, time.month+1, time.monthday, time.hour, time.minute
		if pojazdNamierzany then
			setElementData(PoliceVehicle, 'SpeedCurrise:Model', getVehicleName(pojazdNamierzany))
			setElementData(PoliceVehicle, 'SpeedCurrise:Register', getVehiclePlateText(pojazdNamierzany) or 'Nieznany')
			setElementData(PoliceVehicle, 'SpeedCurrise:Speed', predkoscPojazdu)
			setElementData(PoliceVehicle, 'SpeedCurrise:Police:Register', getVehiclePlateText(PoliceVehicle))
			setElementData(PoliceVehicle, 'SpeedCurrise:Police:Data', ('%04d/%02d/%02d %02d:%02d'):format(year, month, day, hour, minute))
		end
	end
end