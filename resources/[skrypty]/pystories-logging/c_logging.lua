--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

if getElementData(localPlayer, "player:sid") then return end

local root = getRootElement()
local resourceRoot = getResourceRootElement(getThisResource())
local screenWidth, screenHeight = guiGetScreenSize()


local blurStrength = 20


local myScreenSource = dxCreateScreenSource(screenWidth, screenHeight)
blurShader, blurTec = dxCreateShader("shaders/BlurShader.fx")


function renderblur()
    if blur == true then
        dxUpdateScreenSource(myScreenSource)
        
        dxSetShaderValue(blurShader, "ScreenSource", myScreenSource);
        dxSetShaderValue(blurShader, "BlurStrength", blurStrength);
		dxSetShaderValue(blurShader, "UVSize", screenWidth, screenHeight);

        dxDrawImage(0, 0, screenWidth, screenHeight, blurShader)
    end
end
addEventHandler("onClientRender", root, renderblur)

addEventHandler("onClientResourceStop", resourceRoot,
function()
	if (blurShader) then
		destroyElement(blurShader)
		blurShader = nil
	end
end)

x,y=2513.58, 1282.80-- my width
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
local dist = 100
local angler = 0
function getPointFromDistanceRotation(x, y, dist, angler)
    local a = math.rad(90 - angler)
    local dx = math.cos(a) * dist;
    local dy = math.sin(a) * dist;
    return x+dx, y+dy;
end

function renderLoginBox()
	--dxDrawImage(0, 0, 1920, 1080, "misc/drift.png", AristatesYuvarlak, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawRectangle(sx*0/1025, sy*0/769, sx*320/1025, sy*958/767, tocolor(0, 0, 0, 185), false)
	--dxDrawImage(0, 0, 1920, 1080, "misc/drift.png", AristatesYuvarlak, 0, 0, tocolor(255, 255, 255, 255), false)
	if data.info then dxDrawText(data.info, sx*-230/1024, sy*272/768, sx*565/1024, sy*290/768, tocolor(255, 255, 0, 255), 1.00, "default", "center", "center", false) end
	--dxDrawLine(sx*0/1024, sy*199/768, sx*1022/1024, sy*200/768, tocolor(31, 111, 193, 255), 5, false)
	--dxDrawLine(sx*0/1024, sy*509/768, sx*1022/1024, sy*510/768, tocolor(31, 111, 193, 255), 5, false)
	dxDrawText("Nazwa użytkownika", sx*-240/1024, sy*410/768, sx*565/1024, sy*325/768, white, 1.30, "default-bold", "center", "center", false)
	dxDrawText("Hasło", sx*-240/1024, sy*590/768, sx*565/1024, sy*302/768, white, 1.30, "default-bold", "center", "center", false)
	if not isMouseIn(sx*60/1024, sy*565/768, sx*200/1024, sy*35/768) then dxDrawRectangle(sx*60/1024, sy*565/768, sx*200/1024, sy*35/768, tocolor(255,255,255, 170), false)
	else dxDrawRectangle(sx*56/1024, sy*565/768, sx*208/1024, sy*35/768, tocolor(255,255,255, 230), false) end
	if not isMouseIn(sx*60/1024, sy*615/768, sx*200/1024, sy*35/768) then dxDrawRectangle(sx*60/1024, sy*615/768, sx*200/1024, sy*35/768, tocolor(255,255,255, 170), false)
	else dxDrawRectangle(sx*56/1024, sy*615/768, sx*208/1024, sy*35/768, tocolor(255,255,255, 230), false) end
	dxDrawText("Z a l o g u j  s i ę", sx*-240/1024, sy*1120/768, sx*565/1024, sy*45/768, tocolor(0,0,0,255), 1.10, "default-bold", "center", "center", false)
	dxDrawText("Z a r e j e s t r u j  s i ę", sx*-240/1024, sy*1220/768, sx*565/1024, sy*45/768, tocolor(0,0,0,255), 1.10, "default-bold", "center", "center", false)
	--dxDrawImage(sx * 0.016, sy * 0.0413, sx * 0.2838, sy * 0.2749, "logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	--dxDrawImage(sw/2-295,sh/2+70,594,307,"logo.png", angle, 0, -120 )
	local x,y=getPointFromDistanceRotation(1413.58, 1082.80, dist, angler)
    setCameraMatrix(x,y,207.72+0.9,2623.69, 1285.66, 0+0.9)
	angler=(angler+0.1)
end





addEventHandler("onClientClick", root, function(btn,state)
    if btn=="left" and state=="down" then
        if isMouseIn(sx*60/1024, sy*565/768, sx*200/1024, sy*35/768) and data.showed then
        	local login=guiGetText(data.button[1])
        	local pass=guiGetText(data.button[2])
        	if string.len(login) < 2 or string.len(pass) < 2 then
        		data.info="Należy wypełnić wszystkie pola."
        		return
        	end
        	triggerServerEvent("logging:checkAccount", resourceRoot, login, pass)
        end
        if isMouseIn(sx*60/1024, sy*615/768, sx*200/1024, sy*35/768) and data.showed then
        	local login=guiGetText(data.button[1])
        	local pass=guiGetText(data.button[2])
        	if string.len(login) > 22 or string.len(pass) > 22 and string.len(login) < 3 or string.len(pass) < 3 then
        		data.info="Login i hasło powinno zawierać od 3 do 22 znaków."
        		return
        	end
        	triggerServerEvent("logging:newAccount", resourceRoot, login, pass)
        end
    end
end)

addEvent("logging:result", true)
addEventHandler("logging:result", resourceRoot, function(value,info)
	if not info then info="" end
	if value then
		data.showed=false
		showZones(data.misc)
		
		-- Usuwamy elementy
		destroyElement(data.button[1])
		destroyElement(data.button[2])
		removeEventHandler("onClientRender", root, renderLoginBox)
	else
		data.info=tostring(info)
		setTimer(function() data.info=nil end, 3000, 1)
	end
end)

addEventHandler("onClientResourceStart", resourceRoot, function()
	showChat(false)
	showCursor(true)
	fadeCamera(true)
	data.showed=true
	setElementAlpha(localPlayer,0)
	data.misc=playSound("misc/intro.mp3",true)
	showPlayerHudComponent("radar",false)
	setSoundVolume(data.misc, 1.0)
	showPlayerHudComponent("all",false)
	guiSetInputMode("no_binds_when_editing")
	setElementData(localPlayer,"status","Loguje się")
	--setElementData(localPlayer,"player:logged",false)
	addEventHandler("onClientRender", root, renderLoginBox)
	local nick = getPlayerName( localPlayer )
	data.button[1]=guiCreateEdit(0.045, 0.50, 0.22, 0.04, ""..nick.."", true)
	data.button[2]=guiCreateEdit(0.045, 0.60, 0.22, 0.04, "", true)   
	guiEditSetMasked(data.button[2],true)
end)