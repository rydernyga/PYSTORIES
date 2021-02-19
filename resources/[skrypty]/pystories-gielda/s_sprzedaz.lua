--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local LIMIT=3 -- tylko gracz może kupić trzy pojazdy

local cmd="sprzedaj.pojazd"
local cmd2="akceptuj.pojazd"
local sprzedazPojazdu={}
local marker=nil
local timer=nil

local pozycjeMarkerow={
	-- Opis nad markerem, x,y,z, int, dim
	{"Giełda SF\nSprzedaż pojazdów", 2527.78,-1290.79,1048.29,2,1 }, -- gielda san fierro I
	{"Sprzedaż pojazdów", 359.11, 186.28, 1008.38, 3, 1}, -- urzad san fierro
	--{"Sprzedaż w komisie", -2033.43,-117.48,1035.17, 3, 1}, --Komis/1
    --{"Sprzedaż w komisie", 3136.66,2117.35,33.24},
    --{"Sprzedaż w komisie", 3134.78,2099.97,33.24},
	--{"Sprzedaż w komisie", 3135.39,2134.92,33.39},
	
}

for i,v in pairs(pozycjeMarkerow) do
	local mkr=createMarker(v[2], v[3], v[4]-1, "cylinder", 2, 96, 96, 96, 255)
	setElementDimension(mkr, v[6] or 0)
	setElementInterior(mkr, v[5] or 0)
	setElementData(mkr, "sprzedaz:pojazdów", true)
	
	marker = mkr
	
	local t=createElement("text")
	setElementData(t,"name", v[1])
	setElementPosition(t,v[2],v[3],v[4])
	setElementDimension(t, v[6] or 0)
	setElementInterior(t, v[5] or 0)
	addEventHandler ("onMarkerHit", mkr, function(el,md)
	outputChatBox("* Aby sprzedać pojazd: ", el)
	outputChatBox("* Wpisz /sprzedaj.pojazd <nick/ID> <id pojazdu> <cena>", el)
	outputChatBox("* Podatek sprzedaży pojazdu obowiązuje kupującego(2%) i sprzedającego(5%) ", el)
	setElementData(el, "sprzedaz:pojazdow", true)
end)
	addEventHandler ("onMarkerLeave", mkr, function(el,md)
	outputChatBox("* Wyszedłeś(aś) z markera ", el)
	setElementData(el, "sprzedaz:pojazdow", false)
end)
end


function checkVehiclePlayer(plr)
	-- Pobieramy tabelę i następnie zwracamy ją
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_vehicles")
	local number=0
	-- Uruchamiamy pętlę spradzającą pojazdy z bazy danych i
	-- porównujemy właściciela z UID osoby która chce zakupić
	for i,v in ipairs(result) do
		if result[1].ownedPlayer == getElementData(plr,"player:sid") then
			number=number+1
		end
	end
	-- Zwracamy ilość pojazdów gracza jeżeli nie ma zwróci
	-- mu false.
	return number
end

local function pokazOperacje(plr)
	if not sprzedazPojazdu[plr] then return end
	local veh=sprzedazPojazdu[plr][3] -- sprawdzanie tablicy
	outputChatBox("* Otrzymałeś(aś) ofertę sprzedaży pojazdu "..getVehicleNameFromModel(getVehicleModel(veh)).." za cenę "..sprzedazPojazdu[plr][4], plr, 255, 255, 0)
	outputChatBox("* Podatek który zapłacisz wynosi: "..math.floor(sprzedazPojazdu[plr][4]*0.02), plr, 255, 255, 0)
	outputChatBox("* ID: "..getElementData(veh,"vehicle:id").." | Przebieg: "..getElementData(veh,"vehicle:mileage").."", plr, 255, 255, 0)
	outputChatBox("* Aby potwierdzić zakup proszę wpisz /akceptuj.pojazd, masz 20 sekund", plr, 255, 255, 0)
	timer=setTimer(function()
		sprzedazPojazdu[plr]=nil
		outputChatBox("* Transakcja została anulowana.", plr, 255, 0, 0)
		removeCommandHandler("akceptuj.pojazd", akceptujTransakcje) -- usuwanie komendy
	end, 20000, 1)
	addCommandHandler("akceptuj.pojazd", akceptujTransakcje) -- tworzenie komendy
end

function akceptujTransakcje(plr,cmd)
	if not sprzedazPojazdu[plr] then return end
	local veh=sprzedazPojazdu[plr][3]
	local cost=sprzedazPojazdu[plr][4]+(math.floor(sprzedazPojazdu[plr][4]*0.02))
	local cost2=sprzedazPojazdu[plr][4]-(math.floor(sprzedazPojazdu[plr][4]*0.05))
	local target=sprzedazPojazdu[plr][1]
	if cost < 0 then
		outputChatBox("* Cena jest nieprawidłowa.", plr)
		return
	end
	if tonumber(cost) > getPlayerMoney(plr) then
		outputChatBox("* Nie posiadasz tyle gotówki.", plr)
		return
	end
	givePlayerMoney(target, cost2)
	takePlayerMoney(plr, cost)
	killTimer(timer)
	outputChatBox("* Sprzedaż przeprowadzona pomyślnie.", plr)
	outputChatBox("* Sprzedaż przeprowadzona pomyślnie.", target)
	removeCommandHandler("akceptuj.pojazd", akceptujTransakcje) -- usuwanie komendy
	wykonajZapytanie(veh,plr) -- do bazy danych ustawiamy od razu
end

function wykonajZapytanie(veh,plr)
	setElementData(veh,"vehicle:ownedGroup", 0)
	setElementData(veh,"vehicle:rent", 0)
	setElementData(veh,"vehicle:ownedPlayer",getElementData(plr,"player:sid"))
	exports["pystories-db"]:dbSet("UPDATE pystories_vehicles SET ownedPlayer=? AND ownedGroup=0 AND rent=0 WHERE id=?", getElementData(plr,"player:sid"), getElementData(veh,"vehicle:id"))
	local text = string.format("[SELL-CAR] Gracz "..getPlayerName(localPlayer).."("..getElementData(localPlayer,"player:sid")..") sprzedał pojazd "..getElementData(veh,"vehicle:id").." dla "..getPlayerName(plr).."("..getElementData(plr,"player:sid")..")")
	triggerEvent("admin:logs", root, text)
	--triggerEvent("admin:addText", resourceRoot, text:gsub("#%x%x%x%x%x%x",""))
--	triggerClientEvent(root, "admin:addText", root, pm_text)
	triggerClientEvent("onDebugMessage", resourceRoot, text,5, "Sprzedaż pojazdu")
--	triggerClientEvent(root, "admin:addText", root, )
end

addCommandHandler(cmd, function(plr,_,cel,id,cost)
	if getElementData(plr, "sprzedaz:pojazdow")== false then 
		outputChatBox("* Nie jesteś w miejscu przeznaczonym do tego.", plr, 255, 0, 0)
		return
	end
	costt=tonumber(cost)
	if not cel or not costt then
		outputChatBox("* Użycie: /sprzedaj.pojazd <nick/ID> <id pojazdu> <cena>", plr)
		return
	end
	local target=exports["pystories-core"]:findPlayer(plr,cel)
	if not target then
		outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
		return
	end
	if getElementData(target, "sprzedaz:pojazdow")== false then 
		outputChatBox("* Nie jesteś w miejscu przeznaczonym do tego.", plr, 255, 0, 0)
		return
	end
	if tonumber(costt) < 0 then
		outputChatBox("* Podałeś(aś) nieprawidłową wartość.", plr, 255, 0, 0)
		return
	end
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_vehicles WHERE id=? AND parking=1 LIMIT 1;", id)
	if result and #result > 0 then
		outputChatBox("* Pojazd znajduje na parkingu, nie możesz go sprzedać.", plr, 255, 0, 0)
		return
	end
	for _,vehicle in ipairs(getElementsByType("vehicle")) do
		if tonumber(getElementData(vehicle,"vehicle:id")) == tonumber(id) then
			if tonumber(getElementData(vehicle,"vehicle:ownedPlayer")) ~= tonumber(getElementData(plr,"player:sid")) then
				outputChatBox("* Nie jesteś właścicielem pojazdu.", plr, 255, 0, 0)
				return
			end
			sprzedazPojazdu[target]={plr,target,vehicle,costt}
		end
	end
	-- Warunek sprawdzająca ile gracz ma pojazdów, jeżeli bedzie miał
	-- więcej niż LIMIT na górze to wyświetli mu się komunikat.
	--[[if getElementData(target,"player:premium")==false then
	if checkVehiclePlayer(target) and checkVehiclePlayer(target) >= LIMIT then
		--outputChatBox("* Maksymalnie ten gracz może mieć: "..LIMIT.." pojazdów", plr, 255, 0, 0)
		return
	end
	end]]--
	pokazOperacje(target)
	outputChatBox("* Pomyślnie wysłano ofertę o sprzedaż pojazdu.", plr)
end)


local t2=createElement("text")
setElementData(t2,"name", "Kupno\nDomków")
setElementPosition(t2,358.65, 178.69, 1008.38)
setElementDimension(t2, 1)
setElementInterior(t2, 3)

