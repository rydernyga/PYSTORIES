--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local LIMIT=200 -- tylko gracz może kupić trzy pojazdy

function checkVehiclePlayer(plr)
	-- Pobieramy tabelę i następnie zwracamy ją
	local result=exports["ogrpg-db"]:dbGet("SELECT * FROM ogrpg_vehicles")
	local number=0
	-- Uruchamiamy pętlę spradzającą pojazdy z bazy danych i
	-- porównujemy właściciela z UID osoby która chce zakupić
	for i,v in ipairs(result) do
		if result[1].ownedPlayer == getElementData(plr,"player:uid") then
			number=number+1
		end
	end
	-- Zwracamy ilość pojazdów gracza jeżeli nie ma zwróci
	-- mu false.
	return number
end

addEvent("buy:check", true)
addEventHandler("buy:check", resourceRoot, function(model,cost)
	-- Warunek sprawdzi stan pieniędzy do kupna pojazdu, jeżeli
	-- gracz będzie miał mniej niż wymagana kwota wyskoczy komunikat.
	if getPlayerMoney(client) < tonumber(cost) then
		outputChatBox("* Nie posiadasz tyle gotówki.", client, 255, 0, 0)
		return
	end
	-- Warunek sprawdzająca ile gracz ma pojazdów, jeżeli bedzie miał
	-- więcej niż LIMIT na górze to wyświetli mu się komunikat.
	if checkVehiclePlayer(client) and checkVehiclePlayer(client) >= LIMIT then
		outputChatBox("* Maksymalnie możesz mieć: "..LIMIT.." pojazdów", client, 255, 0, 0)
		return
	end
	-- Po wszystkich warunkach dodajemy samochód do bazy danych i
	-- informujemy gracza o zakupie jego pierwszego pojazdu
	takePlayerMoney(client, cost)
	exports["ogrpg-db"]:dbSet("INSERT INTO ogrpg_vehicles (model,ownedPlayer,parking) VALUES (?,?,1)", model, getElementData(client,"player:uid"))
	outputChatBox("* Zakupiłeś swój pojazd "..getVehicleNameFromModel(model)..", znajdziesz go w przechowywalni.", client, 0, 255, 0)
end)