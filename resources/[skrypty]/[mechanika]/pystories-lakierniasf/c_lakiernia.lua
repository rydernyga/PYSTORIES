--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

createBlip(-2031.00, 128.44, 27.94, 63,2,0,0,0,0,0,275)

-- Settings
local m_dostep="mechanik-sf1"
local m_maluje=false
local m=createMarker(-2031.00, 128.44, 27.94, "cylinder", 1.5, 255,255,255,100)
local m2=createMarker(-2030.99, 124.98, 27.94, "cylinder", 1.5, 255,255,255,100)
local cs=createColCuboid(-2032.2183, 118.86609, 27.342932, 11.25, 10.75, 5.75)

local t=createElement("text")
    setElementData(t,"name","Kolor 1")
    setElementData(t,"scale",0.9)
    setElementPosition(t,-2031.00, 128.44, 28.94)
local t2=createElement("text")
    setElementData(t2,"name","Kolor 2")
    setElementData(t2,"scale",0.9)
    setElementPosition(t2,-2030.99, 124.98, 29.09)

-- Functions
addEventHandler("onClientColShapeHit", cs, function(el,md)
    if not md or el~=localPlayer then return end
    toggleControl("aim_weapon",true)
    toggleControl("fire",true)
    m_maluje=true
end)

addEventHandler("onClientColShapeLeave", cs, function(el,md)
    if not md or el~=localPlayer then return end
    toggleControl("aim_weapon",false)
    toggleControl("fire",false)
	triggerServerEvent("takeSpray", localPlayer)
    m_maluje=false
    closePicker(el)
end)

addEventHandler("onClientMarkerHit", m, function(el,md)
    if not m or el~=localPlayer then return end
    openPicker(el, "#FFFFFF", "Wybierz kolor lakierowania")
	triggerServerEvent("giveSpray", localPlayer)
    addEventHandler("onColorPickerOK", root, function(el, hex, r, g, b)
        if el == localPlayer then
		    setElementData(localPlayer,"spray:color2",false)
            setElementData(el,"spray:color",{r,g,b})
        end
    end)
end)
addEventHandler("onClientMarkerHit", m2, function(el,md)
    if not m2 or el~=localPlayer then return end
    openPicker(el, "#FFFFFF", "Wybierz kolor lakierowania")
	triggerServerEvent("giveSpray", localPlayer)

    addEventHandler("onColorPickerOK", root, function(el, hex, r, g, b)
        if el == localPlayer then
		    setElementData(localPlayer,"spray:color",false)
            setElementData(el,"spray:color2",{r,g,b})
        end
    end)
end)


addEventHandler("onClientPlayerWeaponFire", localPlayer, function(weapon,_,_,_,_,_,el)
    if source~=localPlayer then return end
    if weapon ~= 41 then return end
    if not el then return end
    if getElementType(el) == "vehicle" and m_maluje == true then
        local spraycolor=getElementData(localPlayer,"spray:color")
		local spraycolor2=getElementData(localPlayer,"spray:color2")
		if spraycolor then
        triggerServerEvent("montazElementu", root, el, "kolor", {spraycolor[1],spraycolor[2],spraycolor[3]},0)
		return end
		if spraycolor2 then
        triggerServerEvent("montazElementu", root, el, "kolor2", {spraycolor2[1],spraycolor2[2],spraycolor2[3]},0)
		end
    end
end)