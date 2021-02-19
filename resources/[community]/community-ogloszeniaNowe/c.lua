
local start = getTickCount()
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
l={}
function hud()
x,y = guiGetScreenSize()
screenW,screenH = guiGetScreenSize()
 for k,v in ipairs ( getElementsByType ( "object" ) ) do
	if getElementData ( v, "ogloszenie" ) then
		local tekst = getElementData ( v, "tekstogloszenia" )
		local width = dxGetTextWidth(tekst,1,"Arial")
		local now = getTickCount()
			local endTime = start + 6000
		local elapsedTime = now - start
		local duration = endTime - start

		local progress = elapsedTime / duration
		
		if progress and progress > 4 then
		if not s then
		s = getTickCount()
		end
		local x, y, z = interpolateBetween (screenW * 0.3493, screenH * 0.8021, 0,  screenW * 0.3493, screenH * 1.2021, 0, (s-getTickCount())/(( s + 2000 ) - s ), "InQuad")
		local xt, yt, zt = interpolateBetween (screenW * 0.3551, screenH * 0.8216, 0,screenW * 0.3551, screenH * 1.2216 , 0, (s-getTickCount())/(( s + 2000 ) - s ), "InQuad")
		--dxDrawRectangle(x, y, screenW * 0.2941, screenH * 0.0859 + (width * 0.05), tocolor(l[1], l[2], l[3], 60), false)
        dxDrawText(tekst,xt, yt,screenW * 0.6382, screenH * 10.0, tocolor(255, 255, 255, 255), 1.00, "default", "center", "top",  false, false, false, true, true) -- false, true, false, false, false
		return end
		local px, py, pz = getElementPosition(localPlayer)
		local x, y, z = interpolateBetween (screenW * 0.3493, screenH * 1.2021, 0,screenW * 0.3493, screenH * 0.8021 , 0, progress, "InQuad")
		local xt, yt, zt = interpolateBetween (screenW * 0.3551, screenH * 1.2216, 0,screenW * 0.3551, screenH * 0.8216 , 0, progress, "InQuad")
        --dxDrawRectangle(x, y, screenW * 0.2941, screenH * 0.0859 + (width * 0.05), tocolor(l[1], l[2], l[3], 60), false)
        dxDrawText(tekst,xt, yt,screenW * 0.6382, screenH * 10.0, tocolor(255, 255, 255, 255), 1.00, "default", "center", "top", false, false, false, true, true) -- false, true, false, false, false
	end
end
end

addEventHandler ( "onClientElementDataChange", root, function(data,old)
	if getElementType(source) == "object" and data == "ogloszenie" then
		if getElementData(source,"ogloszenie") then
			if isEventHandlerAdded("onClientRender",root,hud) then
				removeEventHandler ( "onClientRender", root, hud)
			end
			--l={math.random(0,255),math.random(0,255),math.random(0,255)}
			start = getTickCount()
			s = nil
			addEventHandler ( "onClientRender", root, hud)
		else
			removeEventHandler ( "onClientRender", root, hud)
			start = getTickCount()
			s = nil
			--l={}
		end
	end
end)
addEventHandler ( "onClientRender", root, hud)