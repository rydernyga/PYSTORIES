--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local timer=getTickCount()
--[[
addEventHandler("onClientRender",root,function()
	local tick=getTickCount()
	if tick-timer>=1000 then
		timer=getTickCount()
		local h=getElementData(localPlayer,"h") or 0
local m=getElementData(localPlayer,"player:hours") or 0
		local s=getElementData(localPlayer,"s") or 0
		s=s+1
		if s>=60 then
			s=0
			m=m+1
		end
		setElementData(localPlayer,"s",s)
		setElementData(localPlayer,"player:hours",m)
		if m>=60 then
			m=0
			h=h+1
		end
		setElementData(localPlayer,"m",m)
		setElementData(localPlayer,"h",h)
	end
end)
]]
local minuta = 60
addEventHandler("onClientRender",root,function()
	local sid=getElementData(localPlayer,"player:sid")
	if not sid then return end
	local tick=getTickCount()
	if tick-timer>=minuta*1000 then
		timer=getTickCount()
		local m=getElementData(localPlayer,"player:hours") or 0
		setElementData(localPlayer,"player:hours",m+1)
	end
end)
