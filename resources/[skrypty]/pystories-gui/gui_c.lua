--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local sw,sh = guiGetScreenSize()
local dxfont0_tak = dxCreateFont("fonts/vopis_pys.ttf", 31)



addEventHandler("onClientPreRender", root, function()
if not getElementData(localPlayer,"player:logged") then return end
	local x,y,z = getElementPosition(localPlayer)
	local ulica = getZoneName(x,y,z, false)
	local ulica2 = getZoneName(x,y,z, true)
	if ulica2~=ulica then ulica = "   "..ulica.."\n"..ulica2 else ulica = "   "..ulica end
	if dxSetAspectRatioAdjustmentEnabled then
		dxSetAspectRatioAdjustmentEnabled(true)
	end
	if isPlayerHudComponentVisible("radar") and getElementInterior(localPlayer) == 0 then
		dxDrawText(ulica, sw*4.2/20, sh*18/20, sw*4/20, sh*18/20+sh*1/21.9, tocolor(255, 255, 255), 0.6, dxfont0_tak, "left", "center", false)
		--dxDrawText(ulica, 171, 551, 488, 642, tocolor(255, 255, 255, 255), 1.50, dxfont0_tak, "center", "center", false, false, false, false, false)
		
	end
end)


--0,128,255

--[[local sw,sh = guiGetScreenSize()


addEventHandler("onClientPreRender", root, function()
	local x,y,z = getElementPosition(localPlayer)
	local ulica = getZoneName(x,y,z, false)
	local ulica2 = getZoneName(x,y,z, true)
	if ulica2~=ulica then ulica = "   "..ulica.."\n"..ulica2 else ulica = "   "..ulica end
	if dxSetAspectRatioAdjustmentEnabled then
		dxSetAspectRatioAdjustmentEnabled(true)
	end
	if isPlayerHudComponentVisible("radar") and getElementInterior(localPlayer) == 0 then
		dxDrawText(ulica, sw*4.2/20, sh*18/20, sw*4/20, sh*18/20+sh*1/21.9, tocolor(255, 255, 255,255), 1, "default-bold", "left", "center")
		dxDrawRectangle(sw*2.5/20, sh*18/20, sw*0.7/4, sh*1/21.9, tocolor(inDMZone and 100 or 0, 0, 0, 100))
	end
end)--]]
