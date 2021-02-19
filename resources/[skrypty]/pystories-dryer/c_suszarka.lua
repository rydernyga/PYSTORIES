--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local w,h = guiGetScreenSize()

local vehicle={}
vehicle.id=nil
vehicle.speed=nil
vehicle.driver=nil

local option={}
value=nil
element=nil
option.selected=0
option.actived=false

option["vehicle"]={
    "Akcja: Napraw pojazd",
    "Akcja: Odeslij do przechowalni",
    "Akcja: Respawnuj Pojazd",
    "Akcja: Przenieś pojazd",
    "Akcja: Zatankuj pojazd",
}

option["player"]={
    "Akcja: Przenieś do siebie",
    "Akcja: Przeładuj gracza",
    "Akcja: Ulecz gracza",
    "Akcja: Przenieś do niego",
}

function isPedAiming ( thePedToCheck )
	if isElement(thePedToCheck) then
		if getElementType(thePedToCheck) == "player" or getElementType(thePedToCheck) == "ped" then
			if getPedTask(thePedToCheck, "secondary", 0) == "TASK_SIMPLE_USE_GUN" then
				return true
			end
		end
	end
	return false
end

function isRendering()
    if option.actived == true then
    	if not element then return end
        local vx,vy,vz=getElementVelocity(element)
        mathSpeed=(vx^2+vy^2+vz^2)^0.5*1.8*100
        if mathSpeed < 0 then return end
        if value == "vehicle" then
            local vid=getElementData(element,"vehicle:id") or "błąd"
            local driver=getElementData(element,"vehicle:driver") or "błąd"
            local plate=getVehiclePlateText(element) or 0
		    dxDrawRectangle((297/1280)*w, (300/720)*h, (660/1280)*w, (80/720)*h, tocolor(0, 0, 0, 154), false)
            dxDrawText(string.format("%.02f", mathSpeed).." km/h", (296/1280)*w, (600/720)*h, (486/1280)*w, (53/720)*h, tocolor(255, 255, 255, 255), (2.00/1280)*w, (2.00/720)*h, "default-bold", "center", "center", false)
            dxDrawText("Rejestracja: "..plate, (297/1280)*w, (653/720)*h, (486/1280)*w, (80/720)*h, tocolor(255, 255, 255, 255), (1.00/1280)*w, (1.00/720)*h, "default-bold", "center", "center", false)
            dxDrawText("ID: "..vid.."\n\nOstatni kierowca: "..driver:gsub("#%x%x%x%x%x%x",""), (486/1280)*w, (600/720)*h, (688/1280)*w, (80/720)*h, tocolor(255, 255, 255, 255), (1.00/1280)*w, (1.00/720)*h, "default-bold", "center", "center", false)
            if getElementData(localPlayer,"player:faction") ~= 5 then
            dxDrawText(option[value][option.selected] or "Akcja: Nie wybrano", (688/1280)*w, (600/720)*h, (957/1280)*w, (83/720)*h, tocolor(217, 0, 0, 255), (1.00/1280)*w, (1.00/720)*h, "default-bold", "center", "center", false)
			--dxDrawRectangle((297/1280)*w, (340/720)*h, (660/1280)*w, (80/720)*h, tocolor(0, 0, 0, 154), false)
            --dxDrawText("Kierowca: "..owner, (296/1280)*w, (690/720)*h, (486/1280)*w, (53/720)*h, tocolor(255, 255, 255, 255), (1.00/1280)*w, (1.00/720)*h, "default-bold", "center", "center", false)
            --dxDrawText("Rejestracja Pojazdu: "..plate, (297+1/1280)*w, (720+1/720)*h, (486+1/1280)*w, (80+1/720)*h, tocolor(0, 0, 0, 255), (1.00/1280)*w, (1.00/720)*h, "default-bold", "center", "center", false)
			--dxDrawText("Rejestracja Pojazdu: "..plate, (297/1280)*w, (720/720)*h, (486/1280)*w, (80/720)*h, tocolor(255, 255, 255, 255), (1.00/1280)*w, (1.00/720)*h, "default-bold", "center", "center", false)
            --dxDrawText("ID Pojazdu: "..vid.."\n\nTurbo: "..turbo, (486/1280)*w, (690/720)*h, (688/1280)*w, (80/720)*h, tocolor(255, 255, 255, 255), (1.00/1280)*w, (1.00/720)*h, "default-bold", "center", "center", false)
            --if getElementData(localPlayer,"player:faction") ~= 5 then
            --dxDrawText(option[value][option.selected] or "Akcja: BRAK", (688/1280)*w, (690/720)*h, (957/1280)*w, (83/720)*h, tocolor(217, 0, 0, 255), (1.00/1280)*w, (1.00/720)*h, "default-bold", "center", "center", false)
			end
  	    end
        if value == "player" then
            local id=getElementData(element,"id") or "błąd"
            local sid=getElementData(element,"player:sid") or "błąd"
            local srp=getElementData(element,"player:srp") or "błąd"
            local faction=getElementData(element,"player:faction") or "błąd"
			if not getElementData(element,"p:inv") then
            dxDrawRectangle((297/1280)*w, (300/720)*h, (660/1280)*w, (80/720)*h, tocolor(0, 0, 0, 154), false)
            dxDrawText("SID: "..sid, (296/1280)*w, (600/720)*h, (486/1280)*w, (53/720)*h, tocolor(255, 255, 255, 255), (2.00/1280)*w, (2.00/720)*h, "default-bold", "center", "center", false)
            dxDrawText("SRP: "..srp, (297/1280)*w, (653/720)*h, (486/1280)*w, (80/720)*h, tocolor(255, 255, 255, 255), (1.00/1280)*w, (1.00/720)*h, "default-bold", "center", "center", false)
            dxDrawText(getPlayerName(element):gsub("#%x%x%x%x%x%x","").."("..id..")\n\nFrakcja: "..faction, (486/1280)*w, (600/720)*h, (688/1280)*w, (80/720)*h, tocolor(255, 255, 255, 255), (1.00/1280)*w, (1.00/720)*h, "default-bold", "center", "center", false)
            if getElementData(localPlayer,"player:faction") ~= 5 then
            dxDrawText(option[value][option.selected] or "Akcja: Nie wybrano", (688/1280)*w, (600/720)*h, (957/1280)*w, (83/720)*h, tocolor(217, 0, 0, 255), (1.00/1280)*w, (1.00/720)*h, "default-bold", "center", "center", false)
			--dxDrawRectangle((297/1280)*w, (340/720)*h, (660/1280)*w, (80/720)*h, tocolor(0, 0, 0, 154), false)
            --dxDrawText("UID: "..uid, (296/1280)*w, (720/720)*h, (486/1280)*w, (53/720)*h, tocolor(255, 255, 255, 255), (2.00/1280)*w, (2.00/720)*h, "default-bold", "center", "center", false)
            --dxDrawText("RP: "..ogp, (297/1280)*w, (650/720)*h, (486/1280)*w, (80/720)*h, tocolor(255, 255, 255, 255), (1.00/1280)*w, (1.00/720)*h, "default-bold", "center", "center", false)
            --dxDrawText(getPlayerName(element).."("..id..")\n\nSłużba: "..faction, (486/1280)*w, (690/720)*h, (688/1280)*w, (80/720)*h, tocolor(255, 255, 255, 255), (1.00/1280)*w, (1.00/720)*h, "default-bold", "center", "center", false)
            --if getElementData(localPlayer,"player:faction") ~= 5 then
            --dxDrawText(option[value][option.selected] or "Akcja: BRAK", (688/1280)*w, (690/720)*h, (957/1280)*w, (83/720)*h, tocolor(217, 0, 0, 255), (1.00/1280)*w, (1.00/720)*h, "default-bold", "center", "center", false)
			end
			end
		end
    end
end

addEventHandler("onClientPlayerTarget",root, function(el)
    if isPedAiming(localPlayer) and el and getPedWeapon(localPlayer) == 22 and getElementData(localPlayer, "player:admin") == true then
        if not option.actived  then
			if getElementData(el,"p:inv") then return end
            if getElementType(el) == "vehicle" then
                value="vehicle"
                element=el
                option.actived=true
            elseif getElementType(el) == "player" then
                value="player"
                element=el
                option.actived=true
            else return end
            bindKey("mouse1", "down", onElementClicked)
            bindKey("mouse_wheel_down", "down", onElementMoveDown)
            bindKey("mouse_wheel_up", "down", onElementMoveUp)
            addEventHandler("onClientHUDRender", root, isRendering)
        end
    else
        if option.actived then
            vehicle.el=nil
            option.actived=false
            unbindKey("mouse1", "down", onElementClicked)
            unbindKey("mouse_wheel_down", "down", onElementMoveDown)
            unbindKey("mouse_wheel_up", "down", onElementMoveUp)
            removeEventHandler("onClientHUDRender", root, isRendering)
        end
    end
end)

function onElementMoveUp() if option.selected > 4 then option.selected=1 else option.selected=option.selected+1 end end
function onElementMoveDown() if option.selected < 1 then option.selected=4 else option.selected=option.selected-1 end end
function onElementClicked() if option.selected > 0 then triggerServerEvent("onDryerAction", localPlayer, value, option.selected, element) outputDebugString ( option.selected) end end

function blokada ( prevSlot, newSlot )
	if getPedWeapon(getLocalPlayer(),newSlot) == 22 and getElementData(getLocalPlayer(),"player:admin") == true then 
		toggleControl ( "fire", false ) --disable the aim button
	else 
		toggleControl ( "fire", true ) --renable the aim button
	end
end
addEventHandler ( "onClientPlayerWeaponSwitch", getRootElement(), blokada )