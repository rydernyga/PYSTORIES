--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

-- Pozycja Krecacej Kamery: -1956.66, 883.34, 69.31

x,y=36.63,82.19 -- my width
intro_step=math.random(0,850)

local sx,sy=guiGetScreenSize()
local data={ showed=nil, button={}, info=nil, misc=nil, }

function isMouseIn(psx,psy,pssx,pssy,abx,aby)
    if not isCursorShowing() then return end
    cx,cy=getCursorPosition()
    cx,cy=cx*sx,cy*sy
    if cx >= psx and cx <= psx+pssx and cy >= psy and cy <= psy+pssy then
        return true,cx,cy
    else
        return false
    end
end

function renderZoneBox()
	--dxDrawRectangle(sx*0/1024, sy*201/768, sx*1024/1024, sy*308/768, tocolor(0, 0, 0, 188), false)
	if data.info then dxDrawText(data.info, sx*252/1024, sy*232/768, sx*800/1024, sy*255/768, tocolor(255, 0, 0, 255), 1.00, "default", "center", "center", false) end
	--dxDrawLine(sx*0/1024, sy*199/768, sx*1022/1024, sy*200/768, tocolor(31, 111, 193, 255), 5, false)
	--dxDrawLine(sx*0/1024, sy*509/768, sx*1022/1024, sy*510/768, tocolor(31, 111, 193, 255), 5, false)
	--dxDrawText("Your Adventure RPG", sx*0/1024, sy*157/768, sx*1024/1024, sy*237/768, white, 2.00, "pricedown", "center", "center", false)
	
	if not isMouseIn(sx*10/1024, sy*54/768, sx*225/1024, sy*92/768) then dxDrawRectangle(sx*10/1024, sy*54/768, sx*225/1024, sy*92/768, tocolor(255,255,255, 170), false)
	else dxDrawRectangle(sx*10/1024, sy*54/768, sx*225/1024, sy*92/768, tocolor(0, 0, 0, 170), false) end
	if not isMouseIn(sx*10/1024, sy*198/768, sx*225/1024, sy*92/768) then dxDrawRectangle(sx*10/1024, sy*198/768, sx*225/1024, sy*92/768, tocolor(255,255,255, 170), false)
	else dxDrawRectangle(sx*10/1024, sy*198/768, sx*225/1024, sy*92/768, tocolor(0, 0, 0, 170), false) end
	if not isMouseIn(sx*10/1024, sy*342/768, sx*225/1024, sy*92/768) then dxDrawRectangle(sx*10/1024, sy*342/768, sx*225/1024, sy*92/768, tocolor(255,255,255, 170), false)
	else dxDrawRectangle(sx*10/1024, sy*342/768, sx*225/1024, sy*92/768, tocolor(0, 0, 0, 170), false) end

    dxDrawText("Spawn\nSan Fierro", sx*-80/1024, sy*-185/768, sx*323/1024, sy*386/768, white, 1.00, "default-bold", "center", "center", false)
    dxDrawText("Przechowywalnia Pojazdów\nSan Fierro", sx*-380/1024, sy*100/768, sx*641/1024, sy*386/768, white, 1.00, "default-bold", "center", "center", false)
    dxDrawText("Dom", sx*-700/1024, sy*393/768, sx*937/1024, sy*386/768, white, 1.00, "default-bold", "center", "center", false)
    --dxDrawImage(720,10,594,207,"logo.png", angle, -0, -120 )

	local zone1=math.sin(intro_step/500)*9000
    local zone2=math.cos(intro_step/500)*9000
    setCameraMatrix (2019.56, 1343.03, 54.00, zone1, zone2, 2)
    --setCameraMatrix(zone1, zone2, 120, zone1, zone2, 120)
    intro_step=intro_step-1.5

end

addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(sx*10/1024, sy*54/768, sx*225/1024, sy*92/768) and data.showed then
         setElementData(localPlayer,"player:spawn",{-1916.58, 883.45, 35.41+0.1})
         closeZones()
        end
        if isMouseIn(sx*10/1024, sy*198/768, sx*225/1024, sy*92/768) and data.showed then
         setElementData(localPlayer,"player:spawn",{-1969.98, 616.61, 35.17+0.1})
         closeZones()
        end
        if isMouseIn(sx*10/1024, sy*342/768, sx*225/1024, sy*92/768) and data.showed then
		local domek=getElementData(localPlayer,"player:house")
		if not domek then
        setElementData(localPlayer,"player:spawn",{-1916.58, 883.45, 35.41+0.1})
		outputChatBox("* Nie posiadasz domku, lub stracił ważność.")
		end
        closeZones()
        end
    end
end)

function closeZones()
	showChat(true)
	showCursor(false)
	fadeCamera(false)
	setElementAlpha(localPlayer,255)
	setElementData(localPlayer,"status","Zalogowany(a)")
	stopSound(data.misc)
	showPlayerHudComponent("all",false)
	showPlayerHudComponent("radar",true)
	showPlayerHudComponent("crosshair",true)
	showPlayerHudComponent("weapon",true)
	showPlayerHudComponent("radar",true)
	showPlayerHudComponent("health",true)
	showPlayerHudComponent("breath",true)
	showPlayerHudComponent("clock",true)
	showPlayerHudComponent("ammo",true)
	data.showed=false
	destroyElement(blurShader)
	-- Usuwamy elementy
	triggerServerEvent("core:spawnPlayer", localPlayer)
	setTimer(triggerEvent, 250, 1, "gui:start", localPlayer)
	removeEventHandler("onClientRender", root, renderZoneBox)
	blur = false
end

function showZones(misc)
	data.misc=misc
	data.showed=true
	showPlayerHudComponent("all",false)
	guiSetInputMode("no_binds_when_editing")
	addEventHandler("onClientRender", root, renderZoneBox) 
end

-----------------------------------------------------------------------------------------------------------------------
--[[x,y=36.63,82.19 -- my width
intro_step=math.random(0,850)

local sx,sy=guiGetScreenSize()
local data={ showed=nil, button={}, info=nil, misc=nil, }

function isMouseIn(psx,psy,pssx,pssy,abx,aby)
    if not isCursorShowing() then return end
    cx,cy=getCursorPosition()
    cx,cy=cx*sx,cy*sy
    if cx >= psx and cx <= psx+pssx and cy >= psy and cy <= psy+pssy then
        return true,cx,cy
    else
        return false
    end
end

function renderZoneBox()
	--dxDrawRectangle(sx*0/1024, sy*201/768, sx*1024/1024, sy*308/768, tocolor(0, 0, 0, 188), false)
	if data.info then dxDrawText(data.info, sx*252/1024, sy*232/768, sx*800/1024, sy*255/768, tocolor(237, 0, 0, 255), 1.00, "default", "center", "center", false) end
	--dxDrawLine(sx*0/1024, sy*199/768, sx*1022/1024, sy*200/768, tocolor(31, 111, 193, 255), 5, false)
	--dxDrawLine(sx*0/1024, sy*509/768, sx*1022/1024, sy*510/768, tocolor(31, 111, 193, 255), 5, false)
	--dxDrawText("Your Adventure RPG", sx*0/1024, sy*157/768, sx*1024/1024, sy*237/768, white, 2.00, "pricedown", "center", "center", false)

	if not isMouseIn(sx*10/1024, sy*48/768, sx*225/1024, sy*62/768) then dxDrawRectangle(sx*10/1024, sy*48/768, sx*225/1024, sy*62/768, tocolor(255,255,255, 170), false)
	else dxDrawRectangle(sx*10/1024, sy*48/768, sx*225/1024, sy*62/768, tocolor(255,255,255, 230), false) end
	if not isMouseIn(sx*10/1024, sy*212/768, sx*225/1024, sy*62/768) then dxDrawRectangle(sx*10/1024, sy*212/768, sx*225/1024, sy*62/768, tocolor(255,255,255, 170), false)
	else dxDrawRectangle(sx*10/1024, sy*212/768, sx*225/1024, sy*62/768, tocolor(255,255,255, 230), false) end
	if not isMouseIn(sx*10/1024, sy*356/768, sx*225/1024, sy*62/768) then dxDrawRectangle(sx*10/1024, sy*356/768, sx*225/1024, sy*62/768, tocolor(255,255,255, 170), false)
	else dxDrawRectangle(sx*10/1024, sy*356/768, sx*225/1024, sy*62/768, tocolor(255,255,255, 230), false) end
	if not isMouseIn(sx*10/1024, sy*500/768, sx*225/1024, sy*62/768) then dxDrawRectangle(sx*10/1024, sy*500/768, sx*225/1024, sy*62/768, tocolor(255,255,255, 170), false)
	else dxDrawRectangle(sx*10/1024, sy*500/768, sx*225/1024, sy*62/768, tocolor(255,255,255, 230), false) end
	if not isMouseIn(sx*10/1024, sy*644/768, sx*225/1024, sy*62/768) then dxDrawRectangle(sx*10/1024, sy*644/768, sx*225/1024, sy*62/768, tocolor(255,255,255, 170), false)
	else dxDrawRectangle(sx*10/1024, sy*644/768, sx*225/1024, sy*62/768, tocolor(255,255,255, 230), false) end

    dxDrawText("Spawn LV", sx*-80/1024, sy*-188/768, sx*323/1024, sy*386/768, tocolor(0,0,0,255), 1.00, "default-bold", "center", "center", false)
    dxDrawText("Przechowywalnia pojazdów LV", sx*-380/1024, sy*92/768, sx*641/1024, sy*386/768, tocolor(0,0,0,255), 1.00, "default-bold", "center", "center", false)
    dxDrawText("Dom", sx*-700/1024, sy*373/768, sx*937/1024, sy*386/768, tocolor(0,0,0,255), 1.00, "default-bold", "center", "center", false)
    dxDrawText("Baza organizacji", sx*-700/1024, sy*660/768, sx*937/1024, sy*386/768, tocolor(0,0,0,255), 1.00, "default-bold", "center", "center", false)
	dxDrawText("Spawn FC", sx*-80/1024, sy*957/768, sx*323/1024, sy*386/768, tocolor(0,0,0,255), 1.00, "default-bold", "center", "center", false)
   -- dxDrawImage(sx * 0.3118, sy * 0.0313, sx * 0.3838, sy * 0.1549, "logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)


	local zone1=math.sin(intro_step/500)*9000
    local zone2=math.cos(intro_step/500)*9000
    setCameraMatrix (2019.56, 1343.03, 54.00, zone1, zone2, 2)
    --setCameraMatrix(zone1, zone2, 120, zone1, zone2, 120)
    intro_step=intro_step-1.5

end

addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(sx*10/1024, sy*54/768, sx*225/1024, sy*92/768) and data.showed then
         setElementData(localPlayer,"player:spawn",{1479.51, -1713.07, 14.05+0.1})
         closeZones()
        end
        if isMouseIn(sx*10/1024, sy*198/768, sx*225/1024, sy*92/768) and data.showed then
         setElementData(localPlayer,"player:spawn",{1588.83, -1406.00, 13.82+0.1})
         closeZones()
        end
	    if isMouseIn(sx*10/1024, sy*624/768, sx*225/1024, sy*92/768) and data.showed then
         setElementData(localPlayer,"player:spawn",{2597.44, 1889.67, 11.03+0.1})
         closeZones()
        end
        if isMouseIn(sx*10/1024, sy*342/768, sx*225/1024, sy*92/768) and data.showed then
		local domek=getElementData(localPlayer,"player:house")
		if not domek then
        setElementData(localPlayer,"player:spawn",{1479.51, -1713.07, 14.05+0.1})
		outputChatBox("* Nie posiadasz domku!")
		end
        closeZones()
        end
		if isMouseIn(sx*10/1024, sy*480/768, sx*225/1024, sy*92/768) and data.showed then
		local org=getElementData(localPlayer,"player:organization:spawn")
		if not org then
        setElementData(localPlayer,"player:spawn",{1479.51, -1713.07, 14.05+0.1})
		outputChatBox("* Nie posiadasz organizacji/Lub nie posiada ona spawnu!")
		closeZones()
		else
		setTimer(outputChatBox,1500,1,"* Pomyślnie zrespiłeś(aś) się w organizacji.")
		setElementData(localPlayer,"player:spawn",{tonumber(org[1]),tonumber(org[2]),tonumber(org[3])})
		closeZones()
		end
		end
    end
end)


function closeZones()
	showChat(true)
	showCursor(false)
	fadeCamera(false)
	setElementAlpha(localPlayer,255)
	stopSound(data.misc)
	showPlayerHudComponent("all",false)
	showPlayerHudComponent("radar",true)
	showPlayerHudComponent("crosshair",true)
	showPlayerHudComponent("weapon",true)
	showPlayerHudComponent("health",true)
	showPlayerHudComponent("breath",true)
	showPlayerHudComponent("ammo",true)
	data.showed=false
	destroyElement(blurShader)
	-- Usuwamy elementy
	triggerServerEvent("core:spawnPlayer", localPlayer)
	setTimer(triggerEvent, 250, 1, "gui:start", localPlayer)
	removeEventHandler("onClientRender", root, renderZoneBox)
	blur = false
end

function showZones(misc)
	data.misc=misc
	data.showed=true
	showPlayerHudComponent("all",false)
	guiSetInputMode("no_binds_when_editing")
	addEventHandler("onClientRender", root, renderZoneBox) 
end--]]