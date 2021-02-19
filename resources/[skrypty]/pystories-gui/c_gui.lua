--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local sx,sy=guiGetScreenSize()
local screenW, screenH=guiGetScreenSize()
function renderHUD()
	if getElementData(localPlayer,"notshowhud") then return end
	dxSetAspectRatioAdjustmentEnabled( true )
	
	local realtime = getRealTime()
	local hour = realtime.hour
	local minute = realtime.minute
	
	local x,y,z=getElementPosition(localPlayer)
	
	--%08d
	--dxDrawRectangle(screenW * 0.7079, screenH * 0.0417, screenW * 0.2848, screenH * 0.1536, tocolor(0, 0, 0, 155), false)
	
	--dxDrawText(string.format("%02d",hour).." : "..string.format("%02d", minute), sx*1089/1280+1, sy*(30+1)/720, sx*1251/1280+1, sy*92/720+1, tocolor(255, 255, 255, 255), 2, "pricedown", "center", "center", false)
	--dxDrawText(string.format("%02d",hour).." : "..string.format("%02d", minute), sx*1089/1280, sy*(30)/720, sx*1251/1280, sy*92/720, tocolor(255, 255, 255, 255), 2, "pricedown", "center", "center", false)
	
	dxDrawText(string.format("PLN %06d", getPlayerMoney()), sx*996/1280+1, sy*60/720+1, sx*1218/1280+1, sy*209/720+1, tocolor(0, 0, 0, 255), 1.50, "pricedown", "center", "center", false)
	dxDrawText(string.format("PLN %06d", getPlayerMoney()), sx*996/1280, sy*60/720, sx*1218/1280, sy*209/720, tocolor(10, 106, 40, 217), 1.50, "pricedown", "center", "center", false)
	
	dxDrawText("| FPS: "..getElementData(localPlayer,"fps").."  | PING: "..getPlayerPing(localPlayer).." |", screenW * 0.8097+1, screenH * 0.0143+1, screenW * 0.9575+1, screenH * 0.0456+1, tocolor(0, 0, 0, 255), 1.5, "default-bold", "center", "top", false, false, false, false, false)
    dxDrawText("| FPS: "..getElementData(localPlayer,"fps").."  | PING: "..getPlayerPing(localPlayer).." |", screenW * 0.8097, screenH * 0.0143, screenW * 0.9575, screenH * 0.0456, tocolor(255, 255, 255, 255), 1.5, "default-bold", "center", "top", false, false, false, false, false)
	
	
	----------------------PREMKA I NON PREMKA :D
	--[[if not getElementData(localPlayer,"player:premium") then
	tekst=string.format("%s [%d] [UID: %d]",lokalny_nick,lokalne_id,lokalne_uid)
	else
	tekst=string.format("★ %s [%d] [UID: %d]",lokalny_nick,lokalne_id,lokalne_uid)
	end
	if not getElementData(localPlayer,"player:premium") then
	local rozmiar = 1.00
    dxDrawText(tekst, (screenW * 0.7236) - 1, (screenH * 0.0575) - 1, (screenW * 0.9693) - 1, (screenH * 0.1276) - 1, tocolor(0, 0, 0, 255), rozmiar, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText(tekst, (screenW * 0.7236) + 1, (screenH * 0.0575) - 1, (screenW * 0.9693) + 1, (screenH * 0.1276) - 1, tocolor(0, 0, 0, 255), rozmiar, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText(tekst, (screenW * 0.7236) - 1, (screenH * 0.0575) + 1, (screenW * 0.9693) - 1, (screenH * 0.1276) + 1, tocolor(0, 0, 0, 255), rozmiar, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText(tekst, (screenW * 0.7236) + 1, (screenH * 0.0575) + 1, (screenW * 0.9693) + 1, (screenH * 0.1276) + 1, tocolor(0, 0, 0, 255), rozmiar, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText(tekst, screenW * 0.7236, screenH * 0.0575, screenW * 0.9693, screenH * 0.1276, tocolor(255, 255, 255, 255), rozmiar, "default-bold", "left", "top", false, false, false, false, false)
	else
    dxDrawText(tekst, (screenW * 0.7236) - 1, (screenH * 0.0575) - 1, (screenW * 0.9693) - 1, (screenH * 0.1276) - 1, tocolor(0, 0, 0, 255), rozmiar, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText(tekst, (screenW * 0.7236) + 1, (screenH * 0.0575) - 1, (screenW * 0.9693) + 1, (screenH * 0.1276) - 1, tocolor(0, 0, 0, 255), rozmiar, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText(tekst, (screenW * 0.7236) - 1, (screenH * 0.0575) + 1, (screenW * 0.9693) - 1, (screenH * 0.1276) + 1, tocolor(0, 0, 0, 255), rozmiar, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText(tekst, (screenW * 0.7236) + 1, (screenH * 0.0575) + 1, (screenW * 0.9693) + 1, (screenH * 0.1276) + 1, tocolor(0, 0, 0, 255), rozmiar, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText(tekst, screenW * 0.7236, screenH * 0.0575, screenW * 0.9693, screenH * 0.1276, tocolor(249, 224, 75, 255), rozmiar, "default-bold", "left", "top", false, false, false, false, false)
	end--]]
	----------------------PREMKA I NON PREMKA :D
	
	
	--[[if getElementData(localPlayer,"player:premium") then
		konto = "#FFFFFFKONTO #E28800PREMIUM"
	elseif getElementData(localPlayer,"player:level",1) then
		konto = "#FFFFFFKONTO #01bf34MOD"
	elseif getElementData(localPlayer,"player:level",2) then
		konto = "#FFFFFFKONTO #ff0000ADMIN"
	elseif getElementData(localPlayer,"player:level",3) then
		konto = "#FFFFFFKONTO #a31303ROOT"
	elseif getElementData(localPlayer,"player:level",4) then
		konto = "#FFFFFFKONTO #8F00FFWŁAŚCICIEL"
	--else
		--konto = "#FFFFFFKONTO #FFFFFFGRACZ"
	end
	local tekst= string.format("\n\n\n\n\n\n\n\n\n\n            #FFFFFF[%s#FFFFFF]",konto)
	dxDrawText(tekst, screenW * 0.8000, screenH * 0.0, screenW * 1.0000, screenH * 0.05, tocolor(255, 255, 255, 210), 1.45, "default-bold", "center", "center", false, false, true, true, false)--]]
	
	--[[if getElementData(localPlayer,"player:premium") then
		konto = "#FFFFFFKONTO #FFFF00PREMIUM#FFFFFF"
	elseif getElementData(localPlayer, "player:level",1) then
		konto = "#FFFFFFKONTO #01BF34MODERATOR#FFFFFF"
	elseif getElementData(localPlayer, "player:level",2) then
		konto = "#FFFFFFKONTO #FF0000ADMIN#FFFFFF"
	elseif getElementData(localPlayer, "player:level",3) then
		konto = "#FFFFFFKONTO #A31303RCON#FFFFFF"
	else
		konto = "#FFFFFFKONTO #919191GRACZ#FFFFFF"
	end
	
	--if getElementData(localPlayer,"player:premium") then
		--konto = "#ffff00PREMIUM#ffffff"
	--else
		--konto = "ZWYKLE"
	--end
	local tekst= string.format("(%s)",konto)
	dxDrawText(tekst, screenW * 0.8000, screenH * 0.0, screenW * 1.0000, screenH * 0.05, tocolor(255, 255, 255, 210), 2, default-bold, "center", "center", false, false, true, true, false)--]]
end

--
addEventHandler("onClientRender", root, function()
	if not getElementData(localPlayer,"player:logged") then return end
	if dxSetAspectRatioAdjustmentEnabled then dxSetAspectRatioAdjustmentEnabled(true) end
	renderHUD() -- set new hud
end)

addEventHandler("onClientResourceStart", resourceRoot, function()
	showPlayerHudComponent("all",false)
	showPlayerHudComponent("radar",true)
	showPlayerHudComponent("crosshair",true)
	showPlayerHudComponent("weapon",true)
	showPlayerHudComponent("health",true)
	showPlayerHudComponent("breath",true)
	showPlayerHudComponent("armour",true)
	showPlayerHudComponent("clock",true)
	showPlayerHudComponent("ammo",true)
end)


addCommandHandler("qkx.gp",function()
    outputChatBox("Interior: " .. getElementInterior(localPlayer) .. " Dimension: " .. getElementDimension(localPlayer))
    local x,y,z=getElementPosition(localPlayer)
    local _,_,a=getElementRotation(localPlayer)
    p=string.format("%.2f, %.2f, %.2f",x,y,z)
    setClipboard(p)
    outputChatBox("Pozycja gracza: " .. p)
    local veh=getPedOccupiedVehicle(localPlayer)
    if veh then
        local x,y,z=getElementPosition(veh)
        local rx,ry,rz=getElementRotation(veh)
        p=string.format("%.2f, %.2f, %.2f, %.1f, %.1f, %.1f",x,y,z,rx,ry,rz)
        setClipboard(p)
        outputChatBox("Pozycja pojazdu: " .. p)
    end
end)


fileDelete("c_gui.lua")  -- usuwamy