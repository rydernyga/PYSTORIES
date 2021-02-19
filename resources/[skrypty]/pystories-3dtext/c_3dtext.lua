--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

defscale=1
font="default"

addEventHandler("onClientRender", root, function()
	local rootx,rooty,rootz=getCameraMatrix()
	local dim=getElementDimension(localPlayer)
	local int=getElementInterior(localPlayer)
	
	local texty=getElementsByType("text")
	for i,text in pairs(texty) do
		if text and isElement(text) and getElementDimension(text) == dim and getElementInterior(text) == int then
			local x,y,z=getElementPosition(text)
			--local isLine=isLineOfSightClear(rootx,rooty,rootz, x,y,z, true, false, false, true, false, false, true, nil)
			--if not isLine then return end
			local dist=getDistanceBetweenPoints3D(rootx,rooty,rootz,x,y,z)
			if dist < 22 then
				local sx,sy=getScreenFromWorldPosition(x,y,z, 100, true)
				if sx and sy then
					local name=getElementData(text,"name")
					local scale=getElementData(text,"scale")
					if not name then return end
					dxDrawText(name, sx-1, sy-1, sx-1, sy-1, tocolor(0,0,0,255), (scale or defscale), font, "center", "center", false)
        			dxDrawText(name, sx+1, sy-1, sx+1, sy-1, tocolor(0,0,0,255), (scale or defscale), font, "center", "center", false)
        			dxDrawText(name, sx-1, sy+1, sx-1, sy+1, tocolor(0,0,0,255), (scale or defscale), font, "center", "center", false)
        			dxDrawText(name, sx+1, sy+1, sx+1, sy+1, tocolor(0,0,0,255), (scale or defscale), font, "center", "center", false)
        			dxDrawText(name, sx, sy, sx, sy, tocolor(255,255,255,255), (scale or defscale), font, "center", "center", false)
        		end
        	end
        end
    end
end)