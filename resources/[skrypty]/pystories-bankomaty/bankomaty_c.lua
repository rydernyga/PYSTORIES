--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local bankomaty={
--x,y,z, rx, ry, rz, INT, DIM,

--[[BANKOMATY LOS SANTOS
{2194.30, -1971.70, 13.78-0.35, -0.00, 0.00, 177.89}, -- Praca Smieciarki.
{2110.01, -2100.33, 13.55-0.35, -0.00, 0.00, 359.49}, -- Salon obok Śmieciarek.
{872.86, -1203.87, 16.98-0.35, -0.00, 0.00, 0.30}, -- Salon w Vinewood obok LSPD na PRL.
{2133.30, -1151.32, 24.08-0.35, -0.00, 0.00, 179.41}, -- Salon Motorniczy obok Gangu Blood na PRL. (( Jak jeszcze istnieje. ))
{661.36, -576.13, 16.34-0.35, -0.00, 0.00, 269.16}, -- Stacja Benzynowa Dillimore | Red County.
--BANKOMATY LOS SANTOS--]]

--BANKOMATY SAN FIERRO
{-1914.99, 872.88, 35.41-0.35, -0.00, 0.00, 270.16}, -- Spawn.
{-1915.00, 893.88, 35.41-0.35, -0.00, 0.00, 268.96}, -- Spawn.
{-1859.65, -145.76, 11.91-0.35, -0.00, 0.00, 180.49}, -- Praca Sweepery.
{-2032.97, 162.65, 29.04-0.35, -0.00, 0.00, 90.50}, -- Mechanik Doherty.
{-1964.86, 291.72, 35.47-0.35, -0.00, 0.00, 89.13}, -- Salon Doherty.
{-1712.48, 399.23, 7.42-0.35, -0.00, 0.00, 223.78}, -- Praca Cysterny.
{-1648.90, 1202.50, 7.25-0.35, -0.00, 0.00, 180.47}, -- Salon Downtown.
{-1603.62, 710.27, 13.87-0.35, -0.00, 0.00, 178.86}, -- Komenda Główna Policji.
{-1971.48, 620.47, 35.17-0.35, -0.00, 0.00, 0.40}, -- Przechowalnia Pojazdów.
{-2102.42, 0.52, 35.32-0.35, -0.00, 0.00, 179.26}, -- Państwowa Straż Pożarna.
{-2271.49, -132.45, 35.32-0.35, -0.00, 0.00, 359.55}, -- Tuner Garcia.
{-2420.15, 983.44, 45.30-0.35, -0.00, 0.00, 90.56}, -- Stacja Juniper Hollow.
{-1874.00, -219.98, 18.38-0.35, -0.00, 0.00, 88.42}, -- Parking Policyjny Doherty.
{-2637.05, 632.15, 14.45-0.35, -0.00, 0.00, 269.96}, -- Pogotowie Ratunkowe
--BANKOMATY SAN FIERRO

--BANKOMATY FORT CARSON
{-134.66, 1087.23, 19.74-0.35, -0.00, 0.00, 269.76},
{-205.19, 1135.14, 19.74-0.35, -0.00, 0.00, 89.84},
{180.66, 655.19, 3.85-0.35, -0.00, 0.00, 12.65},
{302.23, 1139.31, 8.59-0.35, -0.00, 0.00, 89.60},
--{},
--{},
--{},
--{},
--{},
--{},
--{},
--{},
--{},
--BANKOMATY FORT CARSON

}

for i,v in ipairs(bankomaty) do

	v.obiekt=createObject(2942,v[1],v[2],v[3],v[4],v[5],v[6])
	setElementInterior(v.obiekt,v[7] or 0)
	setElementDimension(v.obiekt,v[8] or 0)
	setElementFrozen(v.obiekt,true)
	setObjectBreakable ( v.obiekt, false )
	
--	v.mapicon=createBlip(v[1],v[2],v[3], 52, 2, 255,255,255,0, -1000, 300)
	v.mapicon=createBlip(v[1],v[2],v[3], 52, 1, 5,255,5,255, -1000, 275)
	--local x,y,z = getElementPosition(v.obiekt)
	--exports.customblips:createCustomBlip( x, y, 20, 20, "52.png" )
	setElementInterior(v.obiekt,v[7] or 0)
	setElementDimension(v.obiekt,v[8] or 0)
	
	v.cs=createColSphere(v[1],v[2],v[3]+1, 1)
	setElementInterior(v.cs,v[7] or 0)
	setElementDimension(v.cs,v[8] or 0)
	v.text=createElement('text')
	setElementData(v.text,"name","Bankomat")
	setElementPosition(v.text,v[1],v[2],v[3])
end


local bw={}
bw.win = guiCreateWindow(0.7236,0.3398,0.2314,0.5,"Bankomat",true)
guiWindowSetMovable(bw.win,false)
guiWindowSetSizable(bw.win,false)
bw.lbl1 = guiCreateLabel(0.0633,0.0997,0.903,0.1571,"Stan konta:\n0PLN",true,bw.win)
local font0_money = guiCreateFont("czcionki/MyRiadPro-PYStories.ttf", 10)
guiSetFont(bw.lbl1, font0_money)    
guiLabelSetVerticalAlign(bw.lbl1,"center")
guiLabelSetHorizontalAlign(bw.lbl1,"center",false)
local font1_money = guiCreateFont("czcionki/MyRiadPro-PYStories.ttf", 10)

bw.lbl2 = guiCreateLabel(0.0759,0.2734,0.8861,0.0695,"Wpłata ───────────────────────",true,bw.win)


bw.edt1 = guiCreateEdit(0.0675,0.3385,0.8608,0.0859,"0",true,bw.win)
bw.btn_wplac = guiCreateButton(0.0717,0.4427,0.8608,0.0911,"Wpłać",true,bw.win)

bw.lbl3 = guiCreateLabel(0.0759,0.5626,0.8861,0.0695,"Wypłata ".."───────────────────────",true,bw.win)
bw.edt2 = guiCreateEdit(0.0675,0.6276,0.8608,0.0859,"0",true,bw.win)
bw.btn_wyplac = guiCreateButton(0.0717,0.7344,0.8608,0.0911,"Wypłać",true,bw.win)

bw.btn_zamknij = guiCreateButton(0.0717,0.888,0.8608,0.0859,"Zamknij",true,bw.win)
guiSetFont(bw.win, font1_money)
guiSetFont(bw.lbl2, font1_money)
guiSetFont(bw.edt1, font1_money)
guiSetFont(bw.btn_wplac, font1_money)
guiSetFont(bw.lbl3, font1_money)
guiSetFont(bw.edt2, font1_money)
guiSetFont(bw.btn_wyplac, font1_money)
guiSetFont(bw.btn_zamknij, font1_money)


guiSetVisible(bw.win, false)



addEventHandler("onClientColShapeHit", resourceRoot, function(el,md)
	if not md or el~=localPlayer then return end
--	outputChatBox("Bankomat pokazuje napis: AWARIA.")
--	if getPlayerName(localPlayer)=="Carolynn_Trench" or getPlayerName(localPlayer)=="Bob_Euler" then
		
		
		guiSetVisible(bw.win, true)
		guiSetEnabled(bw.btn_wyplac, false)
		guiSetEnabled(bw.btn_wplac, false)
		guiSetText(bw.lbl1,"Trwa otwieranie konta bankowego...")
		triggerServerEvent("onPlayerRequestATMInfo", resourceRoot)
--showCursor(true,true)
		guiSetInputMode("no_binds_when_editing")
			guiSetText(bw.win, string.format("Bankomat F3-KURSOR (UID:%d)",getElementData(el,"player:uid"))) 
			guiSetText(bw.lbl2, "Wpłata ───────────────────────")
			guiSetText(bw.lbl3, "Wypłata ───────────────────────")
			guiSetVisible(bw.btn_wyplac, true)
			guiSetPosition(bw.btn_wplac, 0.0717,0.4427, true)
--	end
end)

local function closeATMWin()
	if guiGetVisible(bw.win) then
		guiSetVisible(bw.win, false)
--showCursor(false)
	end
end

addEventHandler("onClientGUIClick", bw.btn_zamknij, closeATMWin, false)
addEventHandler("onClientColShapeLeave", resourceRoot, function(el,md)
	if el~=localPlayer then return end
	closeATMWin()
end)

-- triggerClientEvent(client,"doFillATMInfo", resourceRoot, true, sr.bank_money)
addEvent("doFillATMInfo", true)
addEventHandler("doFillATMInfo", resourceRoot, function(success, balance)
	if not success then
		guiSetText(bw.lbl1,"Musisz być zarejestrowany.")   --Musisz być zarejestrowanym graczem aby skorzystać z bankomatu.
		return
	end
	guiSetText(bw.lbl1,"Stan Twojego konta:".."\n".. balance.." PLN")
	setElementData(bw.win, "balance", tonumber(balance))
	guiSetText(bw.edt2,100 > balance and balance or 100)
	if balance>0 then
		guiSetEnabled(bw.btn_wyplac, true)
	end

	guiSetText(bw.edt1,balance)
	guiSetEnabled(bw.btn_wplac, true)
end)

addEventHandler("onClientPlayerSpawn", localPlayer, closeATMWin)


addEventHandler("onClientGUIClick", bw.btn_wplac, function()
	local kwotae=tonumber(guiGetText(bw.edt1))
	if not kwotae then return end
	local kwota=math.floor(kwotae)
	if not kwota or kwota<1 then
--		triggerEvent("onAnnouncement3", root, "Nieprawidłowa kwota wpłaty.", 4)
		outputChatBox("* Nieprawidłowa kwota wpłaty pieniędzy do bankomatu !", 255,0,0)
		return
	end
	
	if guiGetVisible(bw.btn_wyplac) then --normalna wplata
	
		if kwota>getPlayerMoney() then
			outputChatBox("* Nie posiadasz tyle pieniędzy w bankomacie !", 255,0,0)
			return
		end
		
		closeATMWin()
		triggerServerEvent("doATMOperation", resourceRoot, kwota)
	end

end, false)

addEventHandler("onClientGUIClick", bw.btn_wyplac, function()
    if not tonumber(guiGetText(bw.edt2)) then return end
	local kwotae=tonumber(guiGetText(bw.edt2))
	if not kwotae then return end
	local kwota=math.floor(kwotae)
	if not kwota or kwota<1 then
--		triggerEvent("onAnnouncement3", root, "Nieprawidłowa kwota wypłaty.", 4)
		outputChatBox("* Nieprawidłowa kwota wpłaty pieniędzy do bankomatu !", 255,0,0)
		return
	end
	if getPlayerMoney()+kwota>99999999 then
--		triggerEvent("onAnnouncement3", root, "Nie możesz mieć tyle gotówki przy sobie.", 4)
		outputChatBox("* Maksymalna ilość gotówki którą możesz posiadać przy Sobie to 999999.99PLN", 255,0,0)
		return
	end
	closeATMWin()
	triggerServerEvent("doATMOperation", resourceRoot, -kwota)

end, false)