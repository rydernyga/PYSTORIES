--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local sw,sh = guiGetScreenSize()

function hidePlayerWarning()
    playerWarning=false
end

addEventHandler("onClientRender", root, function()
    if (playerWarning) then
        dxDrawRectangle( 100,100,sw-200, sh-200, tocolor(255,0,0,100), true)
        dxDrawText( "Otrzymałeś(aś) ostrzeżenie:", 100, 100, sw-100, sh/2-20, tocolor(255,255,255), 3.0, "default-bold", "center", "bottom", true, true,true)
        dxDrawText( playerWarning, 100,sh/2+20, sw-100, sh-100, tocolor(0,0,0), 2.0, "default-bold", "center", "top", true, true,true )
        dxDrawText("Nie stosowanie się do ostrzeżeń, może skutkować kiciem lub banem!", 186/1280*sw, 558/720*sh, 1136/1280*sw, 588/720*sh, tocolor(255, 255, 255, 255), 2.00, "default-bold", "center", "top", false, false, true, false, false)
        return
    end
end)

addEvent("onPlayerWarningReceived", true)
addEventHandler("onPlayerWarningReceived", root, function(tresc)
    if source==localPlayer then
        playerWarning=tresc
        setTimer(hidePlayerWarning, 7000, 1)
        setTimer(playSoundFrontEnd, 300, 10, 5)
    end
end)

for k,v in ipairs ( getElementsByType ( "object" ) ) do
	if getElementData ( v, "sciana:raportow" ) then
		scianaplaczu = v
	end
	if getElementData(v,"sciana:text") then
		scianatekstu = v
	end
end


function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end
 
	return false
end


local xtext=nil
local gameView={"Logi Serwerowe:"}
local sx,sy=guiGetScreenSize()

function renderingInfo()
	--dxDrawRectangle(sx*(0)/1024, sy*(0)/768, sx*(1024)/1024, sy*(23)/768, tocolor(0, 0, 0, 100), false)
	--dxDrawText(xtext:gsub("#%x%x%x%x%x%x",""), sx*(258+1)/1024, sy*(0+1)/768, sx*(758+1)/1024, sy*(23+1)/768, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, true)
	--dxDrawText(xtext:gsub("#%x%x%x%x%x%x",""), sx*(258)/1024, sy*(0)/768, sx*(758)/1024, sy*(23)/768, tocolor(255, 0, 0, 255), 1.00, "default", "center", "center", false, true)
	
	dxDrawRectangle(sx*(258)/1024, sy*(0)/768, sx*(500)/1024, sy*(23)/768, tocolor(0, 0, 0, 155), false)
	dxDrawText(xtext:gsub("#%x%x%x%x%x%x",""), sx*(258+1)/1024, sy*(0+1)/768, sx*(758+1)/1024, sy*(23+1)/768, tocolor(0, 0, 0, 255), 1.00, "default", "center", "center", false, true)
	dxDrawText(xtext:gsub("#%x%x%x%x%x%x",""), sx*(258)/1024, sy*(0)/768, sx*(758)/1024, sy*(23)/768, tocolor(255, 0, 0, 255), 1.00, "default", "center", "center", false, true)
end

function raporcik()
	if not getElementData(localPlayer,"player:admin") then return end
	local tt={}
	reportView=getElementData(scianaplaczu,"sciana:raportow")
	for i,c in ipairs(reportView) do
		if c[1] then table.insert(tt,c[1]) end
	end
	concat=table.concat(tt, "\n")
	dxDrawText(concat, sx*(698+1)/1024, sy*(278+1)/768, sx*(1014+1)/1024, sy*(496+1)/768, tocolor(0, 0, 0, 255), 1.00, "default", "right", "top", false, true)
	dxDrawText(concat, sx*(698)/1024, sy*(278)/768, sx*(1014)/1024, sy*(496)/768, tocolor(255, 255, 255, 255), 1.00, "default", "right", "top", false, true)
end
addEventHandler("onClientRender", root, raporcik)

addEvent("admin:addText", true)
addEventHandler("admin:addText", root, function(text)
	table.insert(gameView, text)	
	if #gameView > 17 then
		table.remove(gameView, 2)
	end
end)
function raporcik2()
	if not getElementData(localPlayer,"player:admin") then return end
	local tt={}
	reportView=getElementData(scianatekstu,"sciana:text")
	for i,c in ipairs(reportView) do
		if c[1] then table.insert(tt,c[1]) end
	end
	concat=table.concat(tt, "\n")
	dxDrawText(concat, sx*(10+1)/1024, sy*(279+1)/768, sx*(326+1)/1024, sy*(497+1)/768, tocolor(0, 0, 0, 255), 1.00, "default", "left", "top", false, true)
	dxDrawText(concat, sx*(10)/1024, sy*(279)/768, sx*(326)/1024, sy*(497)/768, white, 1.00, "default", "left", "top", false, true)
end
addEventHandler("onClientRender", root, raporcik2)

addEvent("admin:rendering", true)
addEventHandler("admin:rendering", root, function(text)
	xtext=text
	if isEventHandlerAdded("onClientRender",root,renderingInfo) then
		removeEventHandler ( "onClientRender", root, renderingInfo)
	end
	addEventHandler("onClientRender", root, renderingInfo)
	setTimer(function()
		removeEventHandler("onClientRender", root, renderingInfo)
	end, 10000, 1)
end)


addCommandHandler("gp",function()
	x,y,z=getElementPosition(localPlayer)
	rotacja=getElementRotation(localPlayer)
  	p=string.format("%.2f,%.2f,%.2f",x,y,z,rotacja)
	setClipboard(p)
	outputChatBox(p)
end)