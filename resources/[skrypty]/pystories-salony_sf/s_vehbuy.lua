--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

createBlip(-1953.37, 269.16, 35.47, 55,2,0,0,0,0,0,275) -- Salon pojazdów rekreacyjnych Doherty | San Fierro. - |SAPD|Bone
createBlip(-512.89, 324.55, 2.73, 43,2,0,0,0,0,0,275) -- Salon pojazdów motorniczych The Panopticon | Red County. - |SAPD|Bone
createBlip(-904.93, 1535.16, 25.91, 55,2,0,0,0,0,0,275) -- Cygan Las Barrancas | Tierra Robada. - |SAPD|Bone
createBlip(-1661.34, 1212.81, 13.67, 55,2,0,0,0,0,0,275) -- Salon pojazdów sportowych Downtown | San Fierro. - |SAPD|Bone

local positionVehicles = {

-- Cygan Las Barrancas | Tierra Robada. - |SAPD|Bone
	{'Moonbeam', 418, 83222, 1482, -904.74, 1547.74, 25.91, 0.0, 0.0, 270.2, 0},
	{'Bobcat', 422, 83222, 6300, -904.93, 1535.16, 25.91, 359.2, 359.8, 270.8, 0},
	{'Manana', 410, 77222, 4950,  -882.78, 1545.59, 25.55, 359.3, 0.0, 102.6, 0},
	{'Vincent', 540, 71312, 3174, -883.17, 1558.05, 25.71, 359.5, 0.0, 93.6, 0},
	{'Walton', 478, 77479, 1975, -881.89, 1521.98, 25.91, 359.2, 360.0, 94.9, 0},
	{'Perennial', 404, 71732, 1102, -881.51, 1535.06, 25.65, 359.7, 359.9, 94.3, 0},
	
-- Salon pojazdów rekreacyjnych Doherty | San Fierro. - |SAPD|Bone
    {'Sabre', 475, 0, 46000, -1962.95, 300.68, 35.30, 359.8, 360.0, 179.9, 0},
    {'Stallion', 439, 0, 24000, -1958.13, 306.01, 35.36, 0.1, 0.0, 270.2, 0},
    {'Glendale', 466, 0, 9500, -1952.27, 294.03, 35.21, 0.0, 360.0, 180.3, 0},
    {'Tampa', 549, 0, 14000, -1952.32, 301.52, 35.17, 360.0, 360.0, 179.7, 0},
    {'Clover', 542, 0, 20000, -1963.30, 287.18, 35.21, 0.1, 359.9, 181.0, 0},
    {'Tahoma', 566, 0, 27500, -1962.81, 272.00, 35.25, 0.4, 359.8, 180.1, 0},
    {'Admiral', 445, 0, 22000, -1962.95, 260.23, 35.35, 0.0, 0.0, 180.0, 0},
    {'Washington', 421, 0, 25000, -1957.95, 255.35, 35.35, 359.9, 360.0, 269.0, 0},
    {'Vincent', 540, 0, 10000, -1950.30, 255.21, 35.33, 359.6, 0.0, 270.2, 0},
    {'Blista Compact', 496, 0, 36000, -1943.82, 260.72, 35.19, 0.0, 360.0, 359.0, 0},
    {'Premier' , 426, 0, 20000, -1943.70, 266.97, 35.22, 0.0, 360.0, 359.2, 0},
	{'Windsor' , 555,0, 94500, -1943.55, 273.59, 35.16, 359.9, 359.9, 358.8, 0},
    {'Sentinel' , 405, 0, 57000, -1945.78, 275.32, 40.92, 0.0, 360.0, 88.4, 0},
	{'Fortune' , 526, 0, 17000, -1943.90, 270.29, 40.82, 359.9, 0.1, 359.2, 0},
    {'Sunrise' , 550, 0, 11000, -1943.96, 260.39, 40.87, 359.6, 360.0, 179.8, 0},
    {'Virgo' , 491, 0, 16000, -1949.32, 255.61, 40.80, 0.1, 360.0, 88.9, 0},
    {'Stratum' , 561, 0, 46000, -1956.34, 258.68, 40.86, 0.1, 0.0, 358.8, 0},
    {'Feltzer' , 533,0, 60000, -1956.19, 271.96, 40.76, 360.0, 0.0, 359.9, 0},
	
-- Salon pojazdów sportowych Downtown | San Fierro. - |SAPD|Bone
	{'Turismo', 451, 0, 1000000, -1651.66, 1207.58, 20.86, 359.6, 359.9, 67.0, 0},
	{'Bullet', 541, 0, 1540000, -1663.24, 1206.91, 20.78, 359.5, 360.0, 294.1, 0},
	{'Infernus', 411, 0, 1850000, -1661.02, 1217.49, 20.88, 0.0, 360.0, 203.8, 0},
	{'Jester', 559, 0, 80000, -1665.15, 1222.88, 13.33, 0.1, 359.8, 207.7, 0},
	{'Sultan', 560, 0, 350000, -1657.99, 1217.00, 13.38, 359.9, 0.1, 203.8, 0},
	{'Comet', 480, 0, 230000, -1648.41, 1206.90, 13.45, 359.6, 360.0, 41.6, 0},
	{'Elegy', 562, 0, 335000, -1678.13, 1208.78, 13.33, 359.6, 0.2, 254.4, 0},
	{'Banshee', 429, 0, 925000, -1667.25, 1206.80, 13.33, 360.0, 0.0, 301.1, 0},
	{'Buffalo', 402, 0, 65000, -1662.97, 1214.42, 7.08, 0.0, 359.9, 257.1, 0},
	{'Cheetah', 415, 0, 800000, -1654.24, 1213.63, 7.02, 0.3, 359.9, 62.6, 0},
	{'Savanna', 567, 0, 77530, -1678.92, 1209.90, 21.02, 0.4, 360.0, 254.1, 0},
	
-- Salon pojazdów motorniczych The Panopticon | Red County. - |SAPD|Bone
    {'Wayfarer', 586, 0, 210509, -533.19, 324.04, 2.25, 359.9, 0.0, 226.6, 0},
	{'PCJ-600', 461, 0, 285780, -509.40, 319.79, 2.31, 359.0, 0.0, 67.3, 0},
	{'Sanchez', 468, 0, 375128, -488.63, 319.50, 2.40, 359.9, 360.0, 43.4, 0},
	{'BF-400', 581, 0, 401291, -487.63, 335.31, 2.32, 359.3, 0.0, 113.7, 0},
	{'FCR-900', 521, 0, 551298, -503.86, 335.15, 2.30, 359.2, 360.0, 206.2, 0},
	{'NRG-500', 522, 0, 951290, -495.92, 335.59, 7.88, 358.9, 0.0, 169.9, 0},
	{'Freeway', 463, 0, 600000, -487.34, 325.88, 7.84, 360.0, 0.0, 45.8, 0},
	{'Faggio', 462, 0, 110219, -520.81, 328.49, 7.90, 359.5, 0.0, 225.4, 0},
	{'Quadbike', 471, 0, 350000, -532.76, 328.49, 7.78, 359.2, 360.0, 197.1, 0},
	
}

for i,v in pairs(positionVehicles) do
    local veh=createVehicle(v[2], v[5], v[6], v[7], v[8], v[9], v[10], v[11])
    setElementData(veh,'vehicle:desc','Pojazd: '..v[1]..'\nCena: '..v[4]..' PLN\nPrzebieg: '..v[3]..' km\nRodzaj silnika: Diesel\n\nAby Kupić pojazd wsiądz na F i wpisz /kuppojazd')
    setVehicleOverrideLights(veh, 1)
    setElementFrozen(veh,true)
	setVehicleColor(veh,150,150,150,150,150,150)
    setVehicleDamageProof(veh, true)
    setElementData(veh,'recznySalonData', true)

    veh:setData('vehsell:info', {
        ['cost']=(v[4]),
        ['model']=v[2],
        ['mileage']=v[3],
        ['selling']=v[12],
		['engine']=v[18]
    }, false)
end

addEventHandler('onVehicleEnter', resourceRoot, function(plr, seat, jacked)
    if seat~=0 then return end
    if source:getData('vehsell:info') and source:getData('vehsell:info').selling==1 then
        plr:outputChat('* Pojazd nie jest dostępny w sprzedaży.', 255, 0, 0)
        return
    end

    local data=source:getData('vehsell:info')
    if not data then return end

    plr:setData('vehsell:info', {
        ['cost']=data.cost,
        ['model']=data.model,
        ['mileage']=data.mileage,
		['engine']=data.engine,
    }, false)
	
	plr:outputChat('* Aby zakupić ten pojazd wpisz /kuppojazd')
end)

addEventHandler('onVehicleExit', resourceRoot, function(plr, seat, jacked)
    if seat~=0 then return end

    local data=plr:getData('vehsell:info')
    if not data then return end

    plr:removeData('vehsell:info')
end)

addCommandHandler('kuppojazd', function(plr, cmd)
    local data=plr:getData('vehsell:info')
    if not data then return end

    if getPlayerMoney(plr) < data.cost then
		plr:outputChat('* Nie posiadasz wystarczającej kwoty pieniędzy !')
        return
    end

    local vehicle=plr:getOccupiedVehicle()
    if vehicle then
        removePedFromVehicle(vehicle)
    end

    local cost=data.cost
    local model=data.model
    local mileage=data.mileage
	local engine=data.engine
    local sid=getElementData(plr,'player:sid') or 0
    takePlayerMoney(plr, cost)
	plr:outputChat('* Zakupiłeś(aś) swój pojazd '..getVehicleNameFromModel(model)..', znajdziesz go w przechowywalni.')
    exports["pystories-db"]:dbSet("INSERT INTO pystories_vehicles (model,ownedPlayer,mileage,registered,parking,engine) VALUES (?,?,?,?,1,?)", model, getElementData(plr,"player:sid"),mileage,"true","diesel")
	end)
