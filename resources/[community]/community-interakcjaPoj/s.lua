--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--


local rowery = {[509]=true,[481]=true,[510]=true}

addEvent("silnik",true)
addEventHandler("silnik",root,function()
    local v = getPedOccupiedVehicle(source)
    if v then
		if getElementData(v,"recznySalonData") then 
		outputChatBox("* Interakcja, nie działa na pojazd z Salonu / Cygana.", source)
		return end
		
        local silnik = getVehicleEngineState(v)
        local przeb = getElementData (v, "vehicle:mileage")
        if silnik == false then
       -- if przeb < 100000 then
            setVehicleEngineState(v,true)
        else
            setVehicleEngineState(v,false)
       -- end
    end
end
end)

addEvent("lampy",true)
addEventHandler("lampy",root,function()
    local v = getPedOccupiedVehicle(source)
    if v then
		if getElementData(v,"recznySalonData") then 
		outputChatBox("* Interakcja, nie działa na pojazd z Salonu / Cygana.", source)
		return end
		
        if getVehicleOverrideLights(v) ~= 2 then
            setVehicleOverrideLights(v,2)
        else
            setVehicleOverrideLights(v,1)
        end
    end
end)

addEvent("drzwi",true)
addEventHandler("drzwi",root,function()
    local v = getPedOccupiedVehicle(source)
    if v then
		if getElementData(v,"recznySalonData") then 
		outputChatBox("* Interakcja, nie działa na pojazd z Salonu / Cygana.", source)
		return end
		
		local drzwi = isVehicleLocked(v)
        if drzwi == true then
            setVehicleLocked(v,false)
        else
            setVehicleLocked(v,true)
        end
    end
end)

addEvent("handbrake",true)
addEventHandler("handbrake",root,function()
    local v = getPedOccupiedVehicle(source)
    if v then
	
		if getElementData(v,"recznySalonData") then 
		outputChatBox("* Interakcja, nie działa na pojazd z Salonu / Cygana.", source)
		return end
		if getElementData(v,"blokada:reczny_drwal") then 
		outputChatBox("* Spuszczanie ręcznego, nie działa na pracy Drwala.", source) 
		return end
		if getElementData(v,"blokada:reczny_latdziur") then 
		outputChatBox("* Spuszczanie ręcznego, nie działa na pracy Łatacza dziur.", source) 
		return end
	
        if isElementFrozen(v) then
            setElementFrozen(v,false)
        else
            setElementFrozen(v,true)
        end
    end
end)

addEvent("maska",true)
addEventHandler("maska",root,function()
	local v = getPedOccupiedVehicle(source)
	if v then
		if getElementData(v,"recznySalonData") then 
		outputChatBox("* Interakcja, nie działa na pojazd z Salonu / Cygana.", source)
		return end
		
		if getVehicleDoorOpenRatio(v,0) == 0 then
			setVehicleDoorOpenRatio(v,0,1,2000)
		else
			setVehicleDoorOpenRatio(v,0,0,2000)
		end
	end
end)

addEvent("bagażnik",true)
addEventHandler("bagażnik",root,function()
	local v = getPedOccupiedVehicle(source)
	if v then
		if getElementData(v,"recznySalonData") then 
		outputChatBox("* Interakcja, nie działa na pojazd z Salonu / Cygana.", source)
		return end
		
		if getVehicleDoorOpenRatio(v,1) == 0 then
			setVehicleDoorOpenRatio(v,1,1,2000)
		else
			setVehicleDoorOpenRatio(v,1,0,2000)
		end
	end
end)

addEventHandler("onVehicleEnter",root,function(plr,seat)
	if seat == 0 then
		if rowery[getElementModel(source)] then return end
		setVehicleEngineState(source,false)
	end
end)

addEventHandler("onVehicleStartExit",root,function(plr,seat)
	if seat == 0 then
		veh = getPedOccupiedVehicle(plr)
		if rowery[getElementModel(veh)] then return end
		v = getPedOccupiedVehicle(plr)
	end
end)

addEventHandler("onVehicleExit",root,function(plr,seat)
	if seat == 0 then
		if not v then return end
		setVehicleEngineState(v,false)
		setVehicleLocked(v,false)
		v = nil
	end
end)