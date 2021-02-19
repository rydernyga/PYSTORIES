--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

vehicles=0
root=getRootElement()
resourceRoot=getResourceRootElement(getThisResource())

local nlOffsets={
	[411]={-1,0,-0.6},	-- infernus
	[470]={-1,0,-0.4},	-- patriot
	[541]={-0.9,0,-0.4},	-- bulelt
	[549]={-0.9,0,-0.4},	-- tampa
	[587]={-1,0,-0.5},	-- euros
}

local nlIDX={
	3962,2113,1784,2054,2428,2352
}

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

function getAdmin2(plr,level)
	if level then
		local result=exports["pystories-db"]:dbGet("SELECT * from pystories_admins WHERE serial=? AND level=?", getPlayerSerial(plr), level)
		if result and #result > 0 then
			return true
		else
			return false
		end
	else
		local result=exports["pystories-db"]:dbGet("SELECT * from pystories_admins WHERE serial=?", getPlayerSerial(plr))
		if result and #result > 0 then
			return true
		else
			return false
		end
	end
end
--///////////////////////////////////// WCZYTYWANIE POJAZDÓW /////////////////////////////////
function onRespawnVehicles(_,id,poss)
	-- Settings (QUERY)
	if id then
		result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_vehicles WHERE parking=1 AND id=?", id)
		query=exports["pystories-db"]:dbSet("UPDATE pystories_vehicles SET parking=0 WHERE id=?", id)
	else
		result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_vehicles WHERE parking=0")
	end

	-- Pairs
	for ile,vehicle in pairs(result) do
        vehicles=ile

        if id then pos={poss[1], poss[2], poss[3], poss[4], poss[5], poss[6]}
        else pos=split(vehicle["pos"], ",") end

        local color=split(vehicle["color"], ",")
        local lights=split(vehicle["headlights"], ",")

        local veh=createVehicle(vehicle["model"], pos[1], pos[2], pos[3], pos[4], pos[5], pos[6])
        setVehicleColor(veh, color[1], color[2], color[3], color[4],color[5], color[6], color[7], color[8],color[9], color[10], color[11], color[12])
        setVehicleHeadLightColor(veh, lights[1], lights[2], lights[3])
		if vehicle["plateText"] ~= "" then
		setVehiclePlateText(veh, vehicle["plateText"])
		else
		 setVehiclePlateText(veh, tostring("SA "..vehicle["id"]))
		end
        setElementFrozen(veh, (vehicle["frozen"]) > 0)
		if vehicle["paintjob"] ~= 3 then
        setVehiclePaintjob(veh, vehicle["paintjob"])
		end
        setElementHealth(veh, vehicle["health"])
        setElementData(veh,"vehicle:spawn",true)
        setElementData(veh,"vehicle:id", vehicle["id"])
        setElementData(veh,"vehicle:fuel", vehicle["fuel"])
        setElementData(veh,"vehicle:desc", vehicle["text"] or false)
        setElementData(veh,"vehicle:mileage", vehicle["mileage"])
        setElementData(veh,"vehicle:driver", vehicle["driver"])
        setElementData(veh,"vehicle:ownedGroup", vehicle["ownedGroup"])
        setElementData(veh,"vehicle:ownedPlayer", vehicle["ownedPlayer"])
		
		local mk1 = vehicle['mk1']
		local mk1 = vehicle['mk2']
		local xfour = vehicle['awd']
		
		if (type(vehicle['rent']) == "string") then
		local tabelka = {}
		local rente = split(vehicle['rent'], ',')
		for k,v in ipairs(rente) do
		table.insert(tabelka,v)
		end
        setElementData(veh,"vehicle:rent", tabelka or false)
		else
		setElementData(veh,"vehicle:rent",0)
		end
		
		if tonumber(xfour) == 1 then
		setVehicleHandling(veh,"driveType","awd")
		end
		
		if tonumber(mk1) ~= 0 then
		local fast = getVehicleHandlingProperty(veh,"engineAcceleration")
		local maxfast = getVehicleHandlingProperty(veh,"maxVelocity")
		local masa = getVehicleHandlingProperty(veh,"mass")
		local masa2 = getVehicleHandlingProperty(veh,"turnMass")
		local xd = getVehicleHandlingProperty(veh,"tractionMultiplier")
		local coef = getVehicleHandlingProperty(veh,"dragCoeff")
		setVehicleHandling(veh,"engineAcceleration",fast+0.5)
		setVehicleHandling(veh,"maxVelocity",maxfast+6)
		setVehicleHandling(veh,"mass",masa+100)
		setVehicleHandling(veh,"tractionMultiplier",xd+0.1)
		setVehicleHandling(veh,"steeringLock",40)
		setVehicleHandling(veh,"dragCoeff",coef-0.15)
		end
		
		if tonumber(mk2) ~= 0 then
		local fast = getVehicleHandlingProperty(veh,"engineAcceleration")
		local maxfast = getVehicleHandlingProperty(veh,"maxVelocity")
		local masa = getVehicleHandlingProperty(veh,"mass")
		local masa2 = getVehicleHandlingProperty(veh,"turnMass")
		local xd = getVehicleHandlingProperty(veh,"tractionMultiplier")
		local coef = getVehicleHandlingProperty(veh,"dragCoeff")
		setVehicleHandling(veh,"engineAcceleration",fast+1.3)
		setVehicleHandling(veh,"maxVelocity",maxfast+14)
		setVehicleHandling(veh,"tractionMultiplier",xd+0.2)
		setVehicleHandling(veh,"mass",masa+150)
		setVehicleHandling(veh,"steeringLock",42)
		setVehicleHandling(veh,"dragCoeff",coef-0.21)
		end
		
	--[[	if vehicle["rearlights"] ~= "" then
		setElementData(veh,"vehicle:light", vehicle["rearlights"])
		else
		setElementData(veh,"vehicle:light", "High Quality")
		end]]--
		setElementData(veh,"neony", vehicle["neon"])
		if vehicle["blokada"] == "true" then
			setElementData(veh,"vehicle:block", true)
			setVehicleWheelStates(veh, 2, 2, 2, 2)
		else
			setElementData(veh,"vehicle:block", false)
		end
		local rodzajneonu=tonumber(getElementData(veh,"neony"))
		if getElementData(veh,"neony") ~= 0 then
		local m = getElementModel(veh)
		local of
		if not nlOffsets[m] then
		of={-1,0,-0.5}
		else
		of=nlOffsets[m]
		end
		neon1=createObject(nlIDX[rodzajneonu],0,0,0)
		neon2=createObject(nlIDX[rodzajneonu],0,0,0)
		setElementData(veh,"zneony", {neon1, neon2})
		attachElements(neon1,veh,of[1],of[2],of[3])
		attachElements(neon2,veh,-of[1],of[2],of[3])
		end

        for i,v in ipairs(split(vehicle["tuning"], ",")) do addVehicleUpgrade(veh, v) end
        for i,v in ipairs(split(vehicle["panelstates"], ",")) do setVehiclePanelState(veh, i, tonumber(v)) end
		setVehicleDamageProof(veh, true)
    end
    outputDebugString("[pystories_vehicles] Loaded "..vehicles.." vehicles.")
end

--///////////////////////////////////// ZAPISYWANIE POJAZDÓW /////////////////////////////////
function onSaveVehicle(vehicle)
    if getElementData(vehicle,"vehicle:spawn") then
    	-- Setting
        local panelstates={}
		local model=getElementModel(vehicle)
        local health=getElementHealth(vehicle)
        local x,y,z=getElementPosition(vehicle)
        local rx,ry,rz=getElementRotation(vehicle)
        local desc=getElementData(vehicle,"vehicle:desc") or ""
        local id=getElementData(vehicle,"vehicle:id")
        local fuel=getElementData(vehicle,"vehicle:fuel")
        local mileage=getElementData(vehicle,"vehicle:mileage")
        local c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12=getVehicleColor(vehicle, true)
        local driver=getElementData(vehicle,"vehicle:driver") or ""
        local rent=getElementData(vehicle,"vehicle:rent")
        local player=getElementData(vehicle,"vehicle:ownedPlayer")
     --   local group=getElementData(vehicle,"vehicle:ownedGroup")
        local blokada=getElementData(vehicle,"vehicle:block")
		local neon=getElementData(vehicle,"neony")
        local h1,h2,h3=getVehicleHeadLightColor(vehicle)
        local paintjob=getVehiclePaintjob(vehicle)
		local rear="Brak"
        local frozen= isElementFrozen(vehicle) and 1 or 0
        for i=0,6 do table.insert(panelstates, getVehiclePanelState(vehicle,i)) end
        panelstates=table.concat(panelstates,",")
        upgrades=getVehicleUpgrades(vehicle)
        if not upgrades then upgrades={} end
        upgrades=table.concat(upgrades, ",")
        -- Query
        local query = exports["pystories-db"]:dbSet(string.format("UPDATE pystories_vehicles SET model='%d', pos='%.2f,%.2f,%.2f,%.2f,%.2f,%.2f', rent='%d',text='%s', health='%d', fuel='%d', mileage='%d', frozen='%d', driver='%s', color='%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d', panelstates='%s', paintjob='%d', tuning='%s', headlights='%d,%d,%d', ownedPlayer='%d', neon='%d', blokada='%s' WHERE id=%d",
        model, x,y,z, rx,ry,rz, "0",desc, health, fuel, mileage, frozen, driver, c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12, panelstates, paintjob, upgrades, h1,h2,h3, player, neon, tostring(blokada), id))
		if (type(rent) == "table") then
		local rr = string.format("%s", table.concat(rent, ',') )
	--	outputDebugString(rr)
		local query2= exports['pystories-db']:dbSet("UPDATE pystories_vehicles SET rent=? WHERE id=?",rr,id)
		end
    end
end

function onParkVehicle(vehicle) 
	local query=exports["pystories-db"]:dbSet("UPDATE pystories_vehicles SET parking=1 WHERE id=?", getElementData(vehicle,"vehicle:id"))
	if query then
		local zneony=getElementData(vehicle,"zneony")
		if (zneony and type(zneony)=="table") then
		destroyElement(zneony[1])
		destroyElement(zneony[2])
		removeElementData(vehicle,"zneony")
		end
        destroyElement(vehicle)
	end
end

--///////////////////////////////////// SPRAWDZANIE USTAWIEŃ /////////////////////////////////
function getSettings(plr,code,value)
	local sid=getElementData(plr,"player:sid")
	if not sid then return end
	if value == "faction" then
		local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_factions WHERE code=? AND sid=?", code, sid)
		if result and #result > 0 then
			return result[1].code
		else
			return false
		end
	end
	if value == "organization" then
		local result=exports["pystories-db"]:dbGet("SELECT * FROM ms_organizacje WHERE sid=?", sid)
		if result and #result > 0 then
			return result[1].code
		else
			return false
		end
	end
	if value == "owner" then
		local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_users WHERE id=?", sid)
		if result and #result > 0 then
			return result[1].id
		else
			return false
		end
	end
end

--///////////////////////////////////// INNE USTAWIENIA /////////////////////////////////
addEventHandler("onVehicleExit", root, function(plr,seat)
    if seat ~= 0 then return end 
   	onSaveVehicle(source)
   	setVehicleEngineState(source, false)
	setVehicleDamageProof(source, true)
	unbindKey(plr, 'n', 'down', bindHoron4)
end)


addEventHandler("onPlayerQuit", root, function()
    local veh=getPedOccupiedVehicle(source)
    if veh then
		setVehicleDamageProof(source, true)
    	onSaveVehicle(veh)
    end
end)

addEventHandler("onResourceStop", resourceRoot, function()
    for i,v in ipairs(getElementsByType("vehicle")) do
    	onSaveVehicle(v)
		local zneony=getElementData(v,"zneony")
		if (zneony and type(zneony)=="table") then
		destroyElement(zneony[1])
		destroyElement(zneony[2])
		removeElementData(v,"zneony")
		end
    end
    outputDebugString("[pystories_vehicles] Saved all vehicles!")
end)

addEventHandler("onVehicleEnter", root, function(plr,seat)
    if seat ~= 0 then return end
	setVehicleEngineState(source, false)
	setElementData(source,"vehicle:driver",getPlayerName(plr))
	if getElementData(source,"neony") and getElementData(source,"neony") ~= 0 then
		--triggerClientEvent(plr,"addNotification",root,"* Posiadasz neony w pojezdzie, możesz wlączyć i wylaczyc je za pomocą przycisku H.","info")
		outputChatBox("* Posiadasz neony w pojezdzie, możesz wlączyć i wylaczyc je za pomocą przycisku N.",plr)
		bindKey(plr, 'n', 'down', bindHoron4, plr)
	end
end)

--///////////////////////////////////// SPRAWDZENIE WŁAŚCICIELA /////////////////////////////////
addEventHandler("onVehicleStartEnter", resourceRoot, function(plr,seat,jacked)
    if seat == 0 then
    	local rent=getElementData(source, "vehicle:rent")
    	local group=getElementData(source, "vehicle:ownedGroup")
		if group == "0" then group = "Brak" end
    	local player=getElementData(source, "vehicle:ownedPlayer")
		if getAdmin2(plr, 4) then
			return
		end
		if rent and (type(rent) == "table") then
			for i,s in pairs(rent) do
				if tonumber(s) == getElementData(plr,"player:sid") then
				return end
			end
		end
		
		local plrgroup = getElementData(plr,"player:organization")
		if plrgroup then
		--	outputDebugString(group)
			if getSettings(plr,false,"organization") == group then return end
		end
		if player and player ~= getSettings(plr,false,"owner") then
			--triggerClientEvent(plr,"addNotification",root,"* Nie masz kluczyków do tego pojazdu.","error")
			outputChatBox("* Nie posiadasz kluczyków do tego pojazdu.", plr)
			cancelEvent()
		end
    end
end)

addEventHandler("onVehicleStartEnter", root, function(plr,seat,jacked)
	if jacked then 
		if getElementData(source,"vehicle:ownedPlayer") == getElementData(plr,"player:sid") then return end
		cancelEvent()
	end
end)

addEventHandler("onVehicleStartEnter", root, function(plr,seat,jacked)
	if seat == 0 then
		if getElementData(source,"spawnowany")== true then
			if getElementData(plr,"player:admin")== false then
				cancelEvent()
			end
		end
	end
end)



function bindHoron4(plr)
		veh=getPedOccupiedVehicle(plr)
		if not veh then return end
		local rodzajneonu=tonumber(getElementData(veh,"neony"))
		if not rodzajneonu then return end
		if rodzajneonu==0 then 
		outputChatBox('* Brak Neonow.', plr, 255, 0 ,0)
		return end
		local zneony=getElementData(veh,"zneony")
		if (zneony and type(zneony)=="table") then
		destroyElement(zneony[1])
		destroyElement(zneony[2])
		removeElementData(veh,"zneony")

		--triggerClientEvent(plr,"addNotification",root,'* Wyłączyłeś Neony.',"warning")
		outputChatBox("* Odłączyłeś(aś) neony od pojazdu.",plr)
		else
		local m = getElementModel(veh)
		local of
		if not nlOffsets[m] then
		of={-1,0,-0.5}
		else
		of=nlOffsets[m]
		end
		neon1=createObject(nlIDX[rodzajneonu],0,0,0)
		neon2=createObject(nlIDX[rodzajneonu],0,0,0)
		setElementData(veh,"zneony", {neon1, neon2})
		attachElements(neon1,veh,of[1],of[2],of[3])
		attachElements(neon2,veh,-of[1],of[2],of[3])
		--triggerClientEvent(plr,"addNotification",root,'* Włączyłeś Neony. Pojawią się one jak poruszysz pojazdem!',"info")
		outputChatBox("* Załączyłeś(aś) neony w pojeździe.",plr)
		end
end

addEventHandler("onElementDestroy", getRootElement(), function ()
  if getElementType(source) == "vehicle" then
  	local zneony=getElementData(source,"zneony")
	if (zneony and type(zneony)=="table") then
		destroyElement(zneony[1])
		destroyElement(zneony[2])
		removeElementData(source,"zneony")
		end
	end
end)


addEventHandler("onResourceStart", resourceRoot, function() onRespawnVehicles(_,false) end)


--[[function shuffle(t)
  local n = #t
 
  while n >= 2 do
    -- n is now the last pertinent index
    local k = math.random(n) -- 1 <= k <= n
    -- Quick swap
    t[n], t[k] = t[k], t[n]
    n = n - 1
  end
  return t
end

local function vr()

	local pojazdy=getElementsByType("vehicle")

	if (#pojazdy<1) then return end

	local pojazdwoda={}
	for _,pojazd in ipairs(pojazdy) do
		if isElementInWater(pojazd) and not getVehicleController(pojazd) then
			local x,y,z=getElementPosition(pojazd)
			if (z<-1) then
				table.insert(pojazdwoda,pojazd)
			end
		end
	end
	if (#pojazdwoda<1) then return end

	outputDebugString("system_wylawiania_aut> Pojazdow w wodzie/pod mapa: " .. #pojazdwoda)

	shuffle(pojazdwoda)
	
	local pojazd=pojazdwoda[1]
	if getElementData(pojazd, "vehicle:spawn") then
		onParkVehicle(pojazd)
	else
		respawnVehicle(pojazd)
	end
end
setTimer(vr, 35000, 0)--]]

--//////////////////////////////////////////////////////// Licencje

local categoryA={[463] = true,[462] = true,[461] = true,[581] = true,[448] = true,[468] = true,[471] = true,[521] = true,[522] = true,[523] = true} 
local categoryB={[602] = true,[545] = true,[496] = true,[517] = true,[401] = true,[410] = true,[518] = true,[600] = true,[527] = true,[436] = true,[589] = true,[580] = true,[419] = true,[439] = true,[533] = true,[549] = true,[526] = true,[491] = true,[474] = true,[445] = true,[467] = true,[604] = true,[426] = true,[507] = true,[547] = true,[585] = true,[405] = true,[587] = true,[409] = true,[466] = true,[550] = true,[492] = true,[566] = true,[546] = true,[540] = true,[551] = true,[421] = true,[516] = true,[529] = true,[488] = true,[460] = true,
[469] = true,[487] = true,[510] = true,[509] = true,[481] = true,[586] = true,[472] = true,[473] = true,[493] = true,[595] = true,[484] = true,[430] = true,[453] = true,[452] = true,[446] = true,[454] = true,[485] = true,[552] = true,
[438] = true,[574] = true,[420] = true,[525] = true,[408] = true,[596] = true,[597] = true,[427] = true,[599] = true,[490] = true,[432] = true,[528] = true,[601] = true,[407] = true,[544] = true,[470] = true,[598] = true,[588] = true,
[532] = true,[443] = true,[486] = true,[531] = true,[543] = true,[422] = true,[583] = true,[478] = true,[605] = true,[554] = true,[530] = true,[418] = true,[572] = true,[582] = true,[536] = true,[575] = true,[534] = true,
[567] = true,[535] = true,[576] = true,[412] = true,[402] = true,[542] = true,[603] = true,[475] = true,[449] = true,[537] = true,[570] = true,[441] = true,[464] = true,[501] = true,[465] = true,[564] = true,[568] = true,[557] = true,[424] = true,[504] = true,[495] = true,[457] = true,[539] = true,[483] = true,[571] = true,[500] = true, 
[444] = true,[556] = true,[429] = true,[411] = true,[541] = true,[559] = true,[415] = true,[561] = true,[480] = true,[560] = true,[562] = true,[506] = true,[565] = true,[451] = true,[434] = true,[558] = true,[494] = true,[555] = true,[502] = true,[477] = true,[503] = true,[579] = true,[400] = true,[404] = true,[489] = true,[505] = true,[479] = true,[442] = true,[458] = true,
[606] = true,[607] = true,[610] = true,[590] = true,[569] = true,[611] = true,[584] = true,[608] = true,[435] = true,[450] = true,[591] = true,[594] = true}
local categoryC={[403] = true,[406] = true,[413] = true,[414] = true,[416] = true,[423] = true,[428] = true,[431] = true,[433] = true,[437] = true,[440] = true,[455] = true,[456] = true,[459] = true,[482] = true,[498] = true,[499] = true,[508] = true,[514] = true,[515] = true,[524] = true,[538] = true,[573] = true}
addEventHandler("onVehicleStartEnter", resourceRoot, function(plr,seat,jacked)
    if seat == 0 then
		if categoryA[getElementModel(source)] then
		   if exports["pystories-ustawienia-prac"]:getVehicleLicense(plr,"A") then
			cancelEvent()
			end
		elseif categoryB[getElementModel(source)] then
			if exports["pystories-ustawienia-prac"]:getVehicleLicense(plr,"B") then
			cancelEvent()
			end
		elseif categoryC[getElementModel(source)] then
			if exports["pystories-ustawienia-prac"]:getVehicleLicense(plr,"C") then
			cancelEvent()
			end
		end
    end
end)

addEventHandler("onVehicleEnter", getRootElement(), function(plr,seat,jacked)
if seat ~= 0 then return end
if getElementData(source, "vehicle:id") and getElementData(source, "vehicle:spawn") then
local mk2 = exports['pystories-db']:dbGet("SELECT * FROM pystories_vehicles WHERE id=? AND mk2=?",getElementData(source, "vehicle:id"), "1")
local mk1 = exports['pystories-db']:dbGet("SELECT * FROM pystories_vehicles WHERE id=? AND mk1=?",getElementData(source, "vehicle:id"), "1")
local rh = exports['pystories-db']:dbGet("SELECT * FROM pystories_vehicles WHERE id=? AND rh=?",getElementData(source, "vehicle:id"), "1")
local np = exports['pystories-db']:dbGet("SELECT * FROM pystories_vehicles WHERE id=? AND naped=?",getElementData(source, "vehicle:id"), "1")
if #mk1 > 0 then outputChatBox("[!] Pomyślnie zaprogramowano MK1",plr,255,255,255) end
if #mk2 > 0 then outputChatBox("[!] Pomyślnie zaprogramowano MK2",plr,255,255,255) end
if #rh > 0 then outputChatBox("[!] Pomyślnie zaprogramowano RH1",plr,255,255,255) end
if #np > 0 then outputChatBox("[!] Pomyślnie zaprogramowano Napęd 4x4",plr,255,255,255) end
end
end)

local strefa = { }
local strefy = {
    {1336.23840, 656.78876, 9.85624, 60.50634765625, 146.80010986328, 16.164074325562 },
	{924.07690, 1661.90576, 9.25354, 194.91711425781, 138.31750488281, 23.899999046326},
	{2197.99780, 2405.43872, -31.81085, 178.1982421875, 112.3896484375, 57.499998474121},
}
 
local ogranicznik = createElement ("ogranicznik");
for i,v in ipairs ( strefy  ) do
     strefa[i] = createColCuboid ( v [ 1 ], v [ 2 ], v [ 3 ], v [ 4 ], v [ 5 ], v [ 6 ], v [7] )
     setElementParent (strefa [i], ogranicznik);
end
 
addEventHandler("onColShapeHit", ogranicznik, function(el,md)
	if getElementType(el)=="vehicle" then
			setElementData(el,"vehicle:tempspeed", 50)
	end
end)
addEventHandler("onColShapeLeave", ogranicznik, function(el,md)
	if getElementType(el)=="vehicle" then
		removeElementData(el,"vehicle:tempspeed")
	end
end)
function wariant(plr, cmd, var1, var2)
	local veh = getPedOccupiedVehicle(plr)
	if not veh then return end
	 local var1, var2 = getVehicleVariant(veh)
	if (veh and getVehicleController(veh) ~= plr) then return end
	local speedx, speedy, speedz = getElementVelocity(veh)
	if not speedx then speedx=0 end
	if not speedy then speedy=0 end
	if not speedz then speedz=0 end
	speedx = tonumber(speedx);speedy=tonumber(speedy);speedz=tonumber(speedz)
	local speed = (speedx^2 + speedy^2 + speedz^2)^(0.5) * 180
	if speed > 2 then outputChatBox("* Stój w miejscu !",plr) return end
	local panel = {}
	for i=0,6 do
    panel[i] = getVehiclePanelState ( veh, i )
	end
    setVehicleVariant(veh, tonumber(not var1), tonumber(not var1))
	for i=0, 6 do
    setVehiclePanelState ( veh, i ,panel[i])
	end
end
addCommandHandler("wariant", wariant)