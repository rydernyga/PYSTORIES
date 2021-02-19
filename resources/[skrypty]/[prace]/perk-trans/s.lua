--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local packer_job = {
--[[nazwa = {
		start_job_marker = {x,y,z}, - miejsce markera do rozpoczęcia pracy
		spawn_vehicle_position = {x,y,z,rx,ry,rz}, - miejsce respienia się gracza w pojeździe oraz rotacja pojazdu po zrespieniu
		get_vehicles_marker = {x,y,z}, - miejsce markera do ładowania pojazdów
	},]]--

	sf = {
		start_job_marker = {-1741.748,36.313,2.554},
		spawn_vehicle_position = {-1696.734,62.519,4.168, 359.967,0.093,176.066},
		get_vehicles_marker = {-1706.512,12.926,2.554},
	},
	
	ls = {
		start_job_marker = {2798.003,-2393.987,12.956},
		spawn_vehicle_position = {2779.835,-2400.775,14.241, 0,0,90},
		get_vehicles_marker = {2791.269,-2417.781,12.632},
	},
}

for i,v in pairs(packer_job) do
	local job_marker = createMarker(v.start_job_marker[1],v.start_job_marker[2],v.start_job_marker[3],"cylinder",1.5,10,10,200,255)
	local colsphere = createColSphere(v.spawn_vehicle_position[1],v.spawn_vehicle_position[2],v.spawn_vehicle_position[3],7)
	createBlipAttachedTo(job_marker,52)
	setElementData(job_marker,"spawn",v.spawn_vehicle_position)
	setElementData(job_marker,"start_job",true)
	setElementData(job_marker,"colsphere",colsphere)
	
	local vehicle_marker = createMarker(v.get_vehicles_marker[1],v.get_vehicles_marker[2],v.get_vehicles_marker[3],"cylinder",5,200,200,200,200)
	setElementData(vehicle_marker,"get_vehicles",true)
end

 -- pozycje pojazdów na packerze
local transport_vehicles_positions = {
	{0,-2,0.5,0,0,0},
	{0,1,2.2,1,0,0},
	{0,-5,2.1,1.2,0,0},
}
local transport_vehicles_models = {429,541,415,480,562,565,411,559,560,506,451,558,555,477} -- modele pojazdów, które można transportować

local function load_vehicles(vehicle,x,y,z,rx,ry,rz)
	for i,v in pairs(transport_vehicles_positions) do
		local model = math.random(1,#transport_vehicles_models)
		local veh = createVehicle(transport_vehicles_models[model],x,y,z,rx,ry,rz)
		attachElements(veh,vehicle,v[1],v[2],v[3],v[4],v[5],v[6])
		setElementCollisionsEnabled(veh,false)
	end
end

local function hit_marker(el,md)
	if getElementType(el) ~= "player" or not md then return end
	if getElementData(source,"start_job") then
		if getPedOccupiedVehicle(el) then return end
		triggerClientEvent(el,"show_gui",resourceRoot,source)
	elseif getElementData(source,"get_vehicles") then
		if not getElementData(el,"packer_job") then return end
		local veh = getPedOccupiedVehicle(el)
		if veh then
			if getElementData(veh,"loaded") or getElementModel(veh) ~= 443 then return end
			setElementFrozen(veh,true)
			toggleControl(el,"enter_exit",false)
			setTimer(function(plr,veh)
				local x,y,z = getElementPosition(veh)
				local rx,ry,rz = getElementRotation(veh)
				load_vehicles(veh,x,y,z,rx,ry,rz)
				setElementFrozen(veh,false)
				setElementData(veh,"loaded",true)
				toggleControl(plr,"enter_exit",true)
				triggerClientEvent(plr,"transport_started",resourceRoot)
			end,5000,1,el,veh)
		end
	end
end
addEventHandler("onMarkerHit",resourceRoot,hit_marker)

addEvent("job_started",true)
local function job_started(marker)
	local colsphere = getElementData(marker,"colsphere")
	if #getElementsWithinColShape(colsphere,"vehicle") > 0 then
		outputChatBox("Jakiś pojazd blokuje wyjazd.",client,255,255,255,true)
	return end
	local spawn = getElementData(marker,"spawn")
	local veh = createVehicle(443,spawn[1],spawn[2],spawn[3],spawn[4],spawn[5],spawn[6])
	warpPedIntoVehicle(client,veh)
	toggleControl(client,"special_control_down",false)
	toggleControl(client,"special_control_up",false)
	setElementData(client,"packer_job",true)
	triggerClientEvent("set_component",resourceRoot,veh)
end
addEventHandler("job_started",resourceRoot,job_started)

local function end_job(veh)
	local cars = getAttachedElements(veh)
	for i,v in pairs(cars) do
		destroyElement(v)
	end
	destroyElement(veh)
end

addEvent("unload_vehicles",true)
local function unload_vehicles(veh)
	setElementFrozen(veh,true)
	toggleControl(client,"enter_exit",false)
	setTimer(function(plr,veh)
		local cars = getAttachedElements(veh)
		for i,v in pairs(cars) do
			destroyElement(v)
		end
		setElementData(veh,"loaded",false)
		givePlayerMoney(plr,1150)
		outputChatBox("Dowiozłeś pojazdy i zarobiłeś 1150PLN. Możesz jechać po kolejne pojazdy.",plr,255,255,255,true)
		setElementFrozen(veh,false)
		toggleControl(plr,"enter_exit",true)
	end,5000,1,client,veh)
end
addEventHandler("unload_vehicles",resourceRoot,unload_vehicles)

local function vehicle_exit(plr,seat)
	if seat == 0 then
		setElementData(plr,"packer_job",false)
		end_job(source)
		triggerClientEvent(plr,"remove_checkpoint",resourceRoot)
		toggleControl(plr,"special_control_down",true)
		toggleControl(plr,"special_control_up",true)
	end
end
addEventHandler("onVehicleExit",resourceRoot,vehicle_exit)

local function player_quit()
	if getElementData(source,"packer_job") then
		local veh = getPedOccupiedVehicle(source)
		end_job(veh)
	end
end
addEventHandler("onPlayerQuit",root,player_quit)

local function cancel_enter(plr,seat)
	if seat == 0 then
		cancelEvent()
	end
end
addEventHandler("onVehicleStartEnter",resourceRoot,cancel_enter)