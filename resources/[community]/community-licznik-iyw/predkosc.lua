sw, sh = guiGetScreenSize()


        
root = getRootElement()
rootElement = getResourceRootElement( getThisResource() )
uzytkownik = getLocalPlayer()
screenW, screenH = guiGetScreenSize()

skalowanie = true
c_XOffset = -45
c_YOffset = -70
c_ImageW = 400
c_ImageH = 400
c_BarW = 50
c_BarH = 50
c_BarYOffset = 70

local dxfont0_tak= dxCreateFont("tak.ttf",20)
local dxfont0_tak2= dxCreateFont("tak.ttf",10)


function getVehicleSpeed()
    if isPedInVehicle(uzytkownik) then
        local vx, vy, vz = getElementVelocity(getPedOccupiedVehicle(uzytkownik))
        return math.sqrt(vx^2 + vy^2 + vz^2) * 162
    end
    return 0
end


addEventHandler("onClientVehicleEnter", root,
        function(thePlayer)
                if thePlayer == uzytkownik then
                        pokaz()
						licznik()
                end
        end
)

addEventHandler("onClientVehicleStartExit", root,
        function(thePlayer)
                if thePlayer == uzytkownik then
                        ukryj()
                end
        end
)

function okrag(liczba)
    return math.floor(liczba + 0.5)
end

function licznik()
        auto = getPedOccupiedVehicle(localPlayer)
        if auto and getVehicleController(auto) then
    if zdjecie then
        destroyElement(zdjecie)
    end
    sw, sh = guiGetScreenSize()
    local skala
    if skalowanie then
        skala = (sw/1152 + sh/864)/2
    else
        skala = 1
    end
    g_XOffset = okrag(c_XOffset*skala)
    g_YOffset = okrag(c_YOffset*skala)
    szerokosc = okrag(c_ImageW*skala)
    wysokosc = okrag(c_ImageH*skala)
    g_BarW = okrag(c_BarW*skala)
    g_BarH = okrag(c_BarH*skala)
    g_BarYOffset = okrag(c_BarYOffset*skala)
    zdjecie = guiCreateStaticImage(sw - szerokosc - g_XOffset, sh - wysokosc - g_YOffset, szerokosc, wysokosc, "licznik.png", false)
    x, y = guiGetPosition(zdjecie, false)
    end
end

function drawStrzalka()
    if isPedInVehicle(uzytkownik) then
        veh = getPedOccupiedVehicle(uzytkownik)
		local predkosc = getVehicleSpeed()
        local chujowe = getElementData(veh,"vehicle:mileage") or 0
        dxDrawImage(x, y, szerokosc, wysokosc, "strzalka.png", predkosc, 0, 0, white, true)
        dxDrawText(('%01d'):format(math.floor(chujowe)).."km", screenW * 0.8112, screenH * 0.8385, screenW * 0.9549, screenH * 0.6885, tocolor(255, 255, 255, 255), 0.7, dxfont0_tak, "center", "center", true, true, true, true, true)
        if isElementFrozen(veh) == false then
        dxDrawImage(sw * 0.9130, sh * 0.9050, 45, 45, "diody/reczny1.png")
        elseif isElementFrozen(veh) == true then
        dxDrawImage(sw * 0.9130, sh * 0.9050, 45, 45, "diody/reczny2.png")
        end
        if getElementData(veh, "vehicle:fuel") <= 10 then
        dxDrawImage(sw * 0.9500, sh * 0.9050, 45, 45, "diody/malo.png")
        elseif getElementData(veh, "vehicle:fuel") >= 10 then
        dxDrawImage(sw * 0.9500, sh * 0.9050, 45, 45, "diody/fchuj.png")
        end
		--if getVehicleOverrideLights(veh) ~= 1 then
		--dxDrawImage(sw * 0.8660, sh * 0.9050, 45, 45, "diody/lightson.png")
		--elseif getVehicleOverrideLights(veh) ~= 2 then
		--dxDrawImage(sw * 0.8660, sh * 0.9050, 45, 45, "diody/lightsoff.png")
		--end
	end
end


function pokaz()
addEventHandler("onClientRender", root, drawStrzalka)
end
function ukryj()
removeEventHandler("onClientRender", root, drawStrzalka)
end

addEventHandler("onClientResourceStart", rootElement,
        function ()
        licznik()
        setTimer(function()
            local w, h = guiGetScreenSize()
            if (w ~= sw) or (h ~= sh) then
                licznik()
				pokaz()
            end
        end, 500, 0)
        end
)

function tajmer()
if not zdjecie then return end
if isPedInVehicle(uzytkownik) then
guiSetVisible(zdjecie, true)
else
guiSetVisible(zdjecie, false)
end
end
addEventHandler("onClientRender",root,tajmer)
