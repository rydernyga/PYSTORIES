----------------------------------------------------
-- Autor: NexBoy
-- Edytował: xKenY. ((damiangraczyk1922@gmail.com))
-- Prawa: .skyGame
----------------------------------------------------

g_root = getRootElement()
g_rootElement = getResourceRootElement( getThisResource() )
g_Player = getLocalPlayer()
local screenW, screenH = guiGetScreenSize()

c_EnableScaling = true

c_XOffset = -5
c_YOffset = -5
c_ImageW = 340
c_ImageH = 300
c_BarW = 200
c_BarH = 200
c_BarYOffset = 300
-- <--

-- All other values are fixed
c_FireTimeMs = 5000
c_BarAlpha = 100
c_BarFlashInterval = 100

g_tFireStart = nil
local font = dxCreateFont("distanceFont.ttf",15)

function drawNeedle()
    if not isPedInVehicle(g_Player) then
        hideSpeedometer()
    end
local Pojazd = getPedOccupiedVehicle(localPlayer)
	
if not Pojazd  then return end
    local vx, vy, vz = getElementVelocity(Pojazd)
	
    local speed =((vx^2 + vy^2 + vz^2)^(0.5))*160	
    local speedy = speed*0.97
    local przebieg = getElementData(Pojazd,"vehicle:mileage") or 0
    local fuel = getElementData(Pojazd,"vehicle:fuel") or 0
    if fuel ~= false and fuel ~= nil and fuel > 0 then
dxDrawText(('%06d'):format(math.floor(przebieg)).."", (screenW * 0.8316) - 1, (screenH * 0.7370) - 1, (screenW * 0.9100) - 1, (screenH * 0.7721) - 1, tocolor(0, 0, 0, 255), 1.00, font, "center", "center", false, false, true, false, false)
        
dxDrawText(('%06d'):format(math.floor(przebieg)).."", (screenW * 0.8316) + 1, (screenH * 0.7370) - 1, (screenW * 0.9100) + 1, (screenH * 0.7721) - 1, tocolor(0, 0, 0, 255), 1.00, font, "center", "center", false, false, true, false, false)
        
dxDrawText(('%06d'):format(math.floor(przebieg)).."", (screenW * 0.8316) - 1, (screenH * 0.7370) + 1, (screenW * 0.9100) - 1, (screenH * 0.7721) + 1, tocolor(0, 0, 0, 255), 1.00, font, "center", "center", false, false, true, false, false)
        
dxDrawText(('%06d'):format(math.floor(przebieg)).."", (screenW * 0.8316) + 1, (screenH * 0.7370) + 1, (screenW * 0.9100) + 1, (screenH * 0.7721) + 1, tocolor(0, 0, 0, 255), 1.00, font, "center", "center", false, false, true, false, false)
        
dxDrawText(('%06d'):format(math.floor(przebieg)).."", screenW * 0.8316, screenH * 0.7370, screenW * 0.9100, screenH * 0.7721, tocolor(255, 0, 0, 255), 1.00, font, "center", "center", false, false, true, false, false)
dxDrawLine((screenW * 0.9649) - 1, (screenH * 0.4076) - 1, (screenW * 0.9649) - 1, screenH * 0.6536, tocolor(0, 0, 0, 255), 1, false)
        
dxDrawLine(screenW * 0.9890, (screenH * 0.4076) - 1, (screenW * 0.9649) - 1, (screenH * 0.4076) - 1, tocolor(0, 0, 0, 255), 1, false)
        
dxDrawLine((screenW * 0.9649) - 1, screenH * 0.6536, screenW * 0.9890, screenH * 0.6536, tocolor(0, 0, 0, 255), 1, false)
  dxDrawLine(screenW * 0.9890, screenH * 0.6536, screenW * 0.9890, (screenH * 0.4076) - 1, tocolor(0, 0, 0, 255), 1, false)
  dxDrawRectangle(screenW * 0.9649, screenH * 0.4076, screenW * 0.0242, screenH * 0.2461, tocolor(43, 43, 43, 255), false)
   dxDrawRectangle(screenW * 0.9656, screenH * 0.6530, screenW * 0.0227, screenH * - 0.2435/100*fuel, tocolor(31, 232, 4, 255), false)
else
dxDrawText(('%06d'):format(math.floor(przebieg)).."", (screenW * 0.8316) - 1, (screenH * 0.7370) - 1, (screenW * 0.9100) - 1, (screenH * 0.7721) - 1, tocolor(0, 0, 0, 255), 1.00, font, "center", "center", false, false, true, false, false)
        
dxDrawText(('%06d'):format(math.floor(przebieg)).."", (screenW * 0.8316) + 1, (screenH * 0.7370) - 1, (screenW * 0.9100) + 1, (screenH * 0.7721) - 1, tocolor(0, 0, 0, 255), 1.00, font, "center", "center", false, false, true, false, false)
        
dxDrawText(('%06d'):format(math.floor(przebieg)).."", (screenW * 0.8316) - 1, (screenH * 0.7370) + 1, (screenW * 0.9100) - 1, (screenH * 0.7721) + 1, tocolor(0, 0, 0, 255), 1.00, font, "center", "center", false, false, true, false, false)
        
dxDrawText(('%06d'):format(math.floor(przebieg)).."", (screenW * 0.8316) + 1, (screenH * 0.7370) + 1, (screenW * 0.9100) + 1, (screenH * 0.7721) + 1, tocolor(0, 0, 0, 255), 1.00, font, "center", "center", false, false, true, false, false)
        
dxDrawText(('%06d'):format(math.floor(przebieg)).."", screenW * 0.8316, screenH * 0.7370, screenW * 0.9100, screenH * 0.7721, tocolor(254, 0, 0, 255), 1.00, font, "center", "center", false, false, true, false, false)
dxDrawLine((screenW * 0.9649) - 1, (screenH * 0.4076) - 1, (screenW * 0.9649) - 1, screenH * 0.6536, tocolor(0, 0, 0, 255), 1, false)
        
dxDrawLine(screenW * 0.9890, (screenH * 0.4076) - 1, (screenW * 0.9649) - 1, (screenH * 0.4076) - 1, tocolor(0, 0, 0, 255), 1, false)
        
dxDrawLine((screenW * 0.9649) - 1, screenH * 0.6536, screenW * 0.9890, screenH * 0.6536, tocolor(0, 0, 0, 255), 1, false)
  dxDrawLine(screenW * 0.9890, screenH * 0.6536, screenW * 0.9890, (screenH * 0.4076) - 1, tocolor(0, 0, 0, 255), 1, false)
  dxDrawRectangle(screenW * 0.9649, screenH * 0.4076, screenW * 0.0242, screenH * 0.2461, tocolor(43, 43, 43, 255), false)
   dxDrawRectangle(screenW * 0.9656, screenH * 0.6484, screenW * 0.0234, screenH * 0.0052, tocolor(255, 0, 0, 255), false) -- Paliwo
end
        	if fuel < 10 then
			r1,g1,b1 = 255,0,0
		else
			r1,g1,b1 = 255,255,255
	end
dxDrawImage(screenW * 0.9678, screenH * 0.3685, screenW * 0.0212, screenH * 0.0339, "Img/Paliwo.png", 0, 0, 0, tocolor(r1, g1, b1, 255), false)
dxDrawImage(x - 50, y - 50, g_ImageW + 100, g_ImageH + 100, "Img/Wskaznik.png", speedy + 5, 0, 0, white, true)
		if isElementFrozen(Pojazd) then
			r1,g1,b1 = 255,0,0
		else
			r1,g1,b1 = 255,255,255
		end
		local silnik = getVehicleEngineState(Pojazd)
		if silnik == false then
			r2,g2,b2 = 255,0,0
		else
			r2,g2,b2 = 255,255,255
		end
		if getVehicleOverrideLights(Pojazd) ~= 2 then
			r3,g3,b3 = 255,255,255
		else
			r3,g3,b3 = 70,184,73
		end
dxDrawImage(screenW * 0.8302, screenH * 0.9180, screenW * 0.0176, screenH * 0.0260, "Img/silnik.png", 0, 0, 0, tocolor(r2,g2,b2, 255), true)
        
dxDrawImage(screenW * 0.8609, screenH * 0.9167, screenW * 0.0183, screenH * 0.0273, "Img/reczny.png", 0, 0, 0, tocolor(r1,g1,b1, 255), true)
        
dxDrawImage(screenW * 0.8931, screenH * 0.9167, screenW * 0.0183, screenH * 0.0273, "Img/swiatla.png", 0, 0, 0, tocolor(r3,g3,b3, 255), true)
end


function showSpeedometer()
    guiSetVisible(disc, true)
    addEventHandler("onClientRender", g_root, drawNeedle)
end
function hideSpeedometer()
    guiSetVisible( disc, false)
	removeEventHandler("onClientRender", g_root, drawNeedle)
end

function getVehicleSpeed()
    if isPedInVehicle(g_Player) then
        local vx, vy, vz = getElementVelocity(getPedOccupiedVehicle(g_Player))
        return math.sqrt(vx^2 + vy^2 + vz^2) * 161
    end
    return 0
end


addEventHandler("onClientVehicleEnter", g_root,
	function(thePlayer)
		if thePlayer == g_Player then
			showSpeedometer()
		end
	end
)

addEventHandler("onClientVehicleStartExit", g_root,
	function(thePlayer)
		if thePlayer == g_Player then
			hideSpeedometer()
		end
	end
)

function round(num)
    return math.floor(num + 0.5)
end

function initGui()
    if disc then
        destroyElement(disc)
    end
    g_screenWidth, g_screenHeight = guiGetScreenSize()
    local scale
    if c_EnableScaling then
        scale = (g_screenWidth/1152 + g_screenHeight/864)/2
    else
        scale = 1
    end
    g_XOffset = round(c_XOffset*scale)
    g_YOffset = round(c_YOffset*scale)
    g_ImageW = round(c_ImageW*scale)
    g_ImageH = round(c_ImageH*scale)
    g_BarW = round(c_BarW*scale)
    g_BarH = round(c_BarH*scale)
    g_BarYOffset = round(c_BarYOffset*scale)
    disc = guiCreateStaticImage(g_screenWidth - g_ImageW - g_XOffset, g_screenHeight - g_ImageH - g_YOffset, g_ImageW, g_ImageH, "Img/Licznik.png", false)
    x, y = guiGetPosition(disc, false)	
end

addEventHandler("onClientResourceStart", g_rootElement,
	function ()
        initGui()
        guiSetVisible(disc, false)
        setTimer(function()
            local w, h = guiGetScreenSize()
            if (w ~= g_screenWidth) or (h ~= g_screenHeight) then
                initGui()
            end
        end, 500, 0)
		if isPedInVehicle(g_Player) then
			showSpeedometer()
		end
	end
)

function filedelet ()
if fileExists("Licznik_c.lua") then
   fileDelete("Licznik_c.lua")
 end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), filedelet)
