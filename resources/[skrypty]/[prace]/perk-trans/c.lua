--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

-- miejsca dostarczania pojazdów
local transport_points = {
	--{x,y,z}
	{-1672.323,40.644,3.554},
	{2745.589,-2444.712,13.648},
	{2745.589,-2444.712,13.648},
}

local screenW,screenH = guiGetScreenSize()

local window = guiCreateWindow(screenW*0.4083, screenH*0.3194, screenW*0.1833, screenH*0.3620, "Transport pojazdów", false)
guiWindowSetSizable(window,false)
guiWindowSetMovable(window,false)
guiSetVisible(window,false)

local memo = guiCreateMemo(screenW*0.0052, screenH*0.0259, screenW*0.1729, screenH*0.1722, "Praca polega na dostarczeniu pojazdów do celu.\n\nZarobki: 1150PLN", false, window)
guiMemoSetReadOnly(memo, true)

local button = {
	guiCreateButton(screenW*0.0526, screenH*0.2379, screenW*0.0786, screenH*0.0435, "Rozpocznij pracę", false, window),
	guiCreateButton(screenW*0.0526, screenH*0.2907, screenW*0.0786, screenH*0.0435, "Zamknij", false, window),   
}

addEvent("show_gui",true)
local function show_gui(marker)
	job_marker = marker
	guiSetVisible(window,true)
	showCursor(true)
end
addEventHandler("show_gui",resourceRoot,show_gui)

local function button_click()
	if source == button[1] then
		guiSetVisible(window,false)
		showCursor(false)
		triggerServerEvent("job_started",resourceRoot,job_marker)
		job_marker = nil
	elseif source == button[2] then
		guiSetVisible(window,false)
		showCursor(false)
	end
end
addEventHandler("onClientGUIClick",resourceRoot,button_click)

addEvent("transport_started",true)
local function transport_started()
	local random = math.random(#transport_points)
	checkpoint = createMarker(transport_points[random][1],transport_points[random][2],transport_points[random][3],"checkpoint",4,0,0,200,200)
	blip = createBlipAttachedTo(checkpoint,41)
end
addEventHandler("transport_started",resourceRoot,transport_started)

local function unload_vehicles(plr,md)
	if plr ~= localPlayer or not md then return end
	if source ~= checkpoint then return end
	local veh = getPedOccupiedVehicle(plr)
	triggerServerEvent("unload_vehicles",resourceRoot,veh)
	destroyElement(checkpoint)
	destroyElement(blip)
	checkpoint = nil
	blip = nil
end
addEventHandler("onClientMarkerHit",resourceRoot,unload_vehicles)

addEvent("remove_checkpoint",true)
local function remove_checkpoint()
	if checkpoint then
		destroyElement(checkpoint)
		destroyElement(blip)
		checkpoint = nil
		blip = nil
	end
end
addEventHandler("remove_checkpoint",resourceRoot,remove_checkpoint)

addEvent("set_component",true)
local function set_component(veh)
	setVehicleAdjustableProperty(veh,2500)
end
addEventHandler("set_component",resourceRoot,set_component)