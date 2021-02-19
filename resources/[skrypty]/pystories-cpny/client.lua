--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

mojeW,mojeH = 1360, 768
sW,sH = guiGetScreenSize()
w, h = (sW/mojeW), (sH/mojeH)

bar = guiCreateProgressBar(370*w, 552.6*h, 600*w, 43*h, false)
guiSetVisible(bar,false)

label = guiCreateLabel(50*w, 10*h, 460*w, 23*h, "Paliwo : 100 % | Spacja : Tankowanie", false, bar)
guiLabelSetColor(label, 00, 90, 255)
guiLabelSetHorizontalAlign(label, "center", false)
guiLabelSetVerticalAlign(label, "center")

--x0,y0,z0 = getElementPosition(m100)

--[[addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()),
	function()
		exports.customblips:createCustomBlip( -2029.65,156.79,28.84, 56, "49.png" )
		exports.customblips:createCustomBlip( -2416.11,975.36,45.30, 56, "49.png" )
		exports.customblips:createCustomBlip( 2149.53,2748.28,10.50, 56, "49.png" )
		exports.customblips:createCustomBlip( 2202.44,2475.09,10.82, 56, "49.png" )
		exports.customblips:createCustomBlip( 2114.87,919.88,10.50, 56, "49.png" )
		exports.customblips:createCustomBlip( 2640.27,1106.91,10.51, 56, "49.png" )
		exports.customblips:createCustomBlip( 611.97,1694.90,6.99, 56, "49.png" )
		exports.customblips:createCustomBlip( -1328.90,2677.17,49.74, 56, "49.png" )
		exports.customblips:createCustomBlip( -1470.59,1863.39,32.31, 56, "49.png" )
		exports.customblips:createCustomBlip( 1381.37,458.11,19.65, 56, "49.png" )
		exports.customblips:createCustomBlip( 655.36, -565.28, 16.34, 56, "49.png" )
		exports.customblips:createCustomBlip( -1676.75,413.22,7.18, 56, "49.png" )	
	end
)--]]

local stacje={
	{-2029.65,156.79,28.84}, -- |-|
	{-2416.11,975.36,45.30}, -- |-|
	{2149.53,2748.28,10.50}, -- |-|
	--{2199.98,2474.98,10.50},
	{2202.44,2475.09,10.82}, -- |-|
	{2114.87,919.88,10.50}, -- |-|
	{2640.27,1106.91,10.51}, -- |-|
	{611.97,1694.90,6.99}, -- |-|
	{-1328.90,2677.17,49.74}, -- |-|
	{-1470.59,1863.39,32.31}, -- |-|
	{1381.37,458.11,19.65}, -- |-|
	{655.36, -565.28, 16.34}, -- |-|
	--{-177.61,1023.25,19.95},
	--{1110.43,1828.47,10.85},
	{-1676.75,413.22,7.18}, -- |-|
}


for _,v in ipairs(stacje)do
	local marker=createMarker(v[1],v[2],v[3]-3.5,"cylinder",4,0,150,200,165)
	local x,y,z = getElementPosition(marker)
	setElementData(marker,"stacja",true)
	createBlipAttachedTo(marker, 56,2,255,0,0,255,1,275)
	--exports.customblips:createCustomBlip( x, y, 20, 20, "49.png" )
end



addEventHandler("onClientMarkerHit",resourceRoot,function(e)
	if e==localPlayer then
		if getElementData(source,"stacja") then
			if getElementType(e)=="player" then
				if getPedOccupiedVehicle(e) then
					if getElementData(getPedOccupiedVehicle(e),"vehicle:fuel") then
						guiSetVisible(bar,true)
						guiSetVisible(barr,true)
						guiSetText(label,"Paliwo : "..getElementData(getPedOccupiedVehicle(e),"vehicle:fuel").." L | Spacja : Tankowanie")
						guiProgressBarSetProgress(bar,getElementData(getPedOccupiedVehicle(e),"vehicle:fuel"))
						bindKey("space","down",tankuj)
					end
				end
			end
		end
	end
end)

addEventHandler("onClientMarkerLeave",resourceRoot,function(e)
	if e==localPlayer then
		if getElementData(source,"stacja") then
			unbindKey("space","down",tankuj)
			guiSetVisible(bar,false)
			guiSetVisible(barr,false)
		end
	end
end)

function tankuj()
	if getPedOccupiedVehicle(localPlayer) then
		if getElementData(getPedOccupiedVehicle(localPlayer),"vehicle:fuel")>= 100 then return end
		triggerServerEvent("TANKUJ",localPlayer)
	end
end


addEvent("TANKUJ",true)
addEventHandler("TANKUJ",root,function()
	if source==localPlayer then
		local fuel=getElementData(getPedOccupiedVehicle(source),"vehicle:fuel")
		setElementData(getPedOccupiedVehicle(source),"vehicle:fuel",fuel+1)
		guiSetText(label,"Paliwo : "..getElementData(getPedOccupiedVehicle(source),"vehicle:fuel").." L | Spacja : Tankowanie")
		guiProgressBarSetProgress(bar,getElementData(getPedOccupiedVehicle(source),"vehicle:fuel"))
	end
end)