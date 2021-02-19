--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local code="Taxi" -- kod pracy
local jobOnline=true -- czy praca włączona
local jobVehicles = { -- pozycję pojazdów
	{420, 983.43,1745.62,8.28,0,0,90},
	{420, 983.54,1741.26,8.28,0,0,90},
	{420, 983.35,1736.20,8.29,0,0,90},
	{420, 983.52,1731.38,8.29,0,0,90},

}
for i,v in ipairs(jobVehicles) do
	local veh=createVehicle(v[1], v[2], v[3], v[4], v[5], v[6], v[7])
	setElementData(veh,"vehicle:desc","Kierowca Taxi\n! Proszę zachować ostrożność !")
	setElementData(veh,"vehicle:mileage", 1000)
	setElementData(veh,"vehicle:fuel",100)
	setVehicleDamageProof(veh, true)
    toggleVehicleRespawn(veh, true)
    setVehicleIdleRespawnDelay(veh, 10000)
	setElementFrozen(veh,true)
end
local t=createElement("text")
setElementData(t,"name", "Teren Urzędu Miasta\n Zakaz Wjazdu\n Parkowowanie przy wyjezdzie grozi blokadą koła!")
setElementPosition(t,-1986.05+1.2,535.56,35.97)
setElementDimension(t, 0)
setElementInterior(t, 0)


addEventHandler("onVehicleStartEnter", resourceRoot, function(plr,seat)
	if seat ~= 0 then return end
	if jobOnline == false then
		outputChatBox("* Praca jest wyłączona.", plr, 255, 0, 0)
		cancelEvent()
		return
	end
	if getElementData(plr,"player:job") then
		outputChatBox("* Już posiadasz aktywną pracę.", plr, 255, 0, 0)
		cancelEvent()
		return
	end
	if getElementData(plr,"player:license:pjB") ~= 1 then
		outputChatBox("* Nie posiadasz prawa jazdy kategorii B", plr, 255, 0, 0)
		cancelEvent()
		return
	end
	if exports["pystories-ustawienia-prac"]:getVehicleLicense(plr,"B") then cancelEvent() return end
end)

addEventHandler("onVehicleExit", resourceRoot, function(plr,seat)
	if seat ~= 0 then return end
	setElementData(plr,"player:job",false)
end)

addEventHandler("onVehicleEnter", resourceRoot, function(plr,seat)
	if seat ~= 0 then return end
	setElementFrozen(source,false)
	setVehicleDamageProof(source, false)
	setElementData(plr,"player:job","Taxi")
	outputChatBox("* Rozpocząłeś(aś) pracę", plr)
	outputChatBox("* Osoby które wpiszą /taxi pokażą Tobie się na radarze.", plr)
end)

addEventHandler("onVehicleRespawn", resourceRoot, function()
	veh=source
	setElementData(veh,"vehicle:desc","Kierowca Taxi\n! Proszę zachować ostrożność !")
	setElementData(veh,"vehicle:mileage", 1000)
	setElementData(veh,"vehicle:fuel",100)
	setElementFrozen(veh,true)
end)

addCommandHandler("taxi", function(plr,cmd)
	outputChatBox("* Wezwałeś(aś) taxi, poczekaj jak jakieś przyjedzie.", plr)
	for i,v in ipairs(getElementsByType("player")) do
		if getElementData(v,"player:job") ~= code then return end
		createBlipAttachedTo(plr, 42, 0, 0, 0, 0, 0, 0, 0, v)
		return
	end
end)

addEventHandler("onResourceStop", resourceRoot, function()
	for i,v in ipairs(getElementsByType("player")) do
		if getElementData(v, "player:job")==code then
			setElementData(v, "player:job", false)
		end
	end
end,false,"high")