--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

--[[

function istaxi(plr)
	local uid=getElementData(plr,'player:uid')
	if not uid then return end

	local result=exports['pystories-db']:dbGet('SELECT 1 FROM pystories_factions WHERE uid=? AND code=? LIMIT 1;', uid, "TAXI")
	if result[1] then
		return true
	else
		return false
	end
end

local gate={
	-- var
	object=createObject(10184, -1528,482.10,8.73, 0, 0, 90),
	marker=createMarker(-1528,482.10,8.6, "cylinder", 9, 0, 0, 0, 0),
	closed=true,
	animation=false,
}

gate.open=function()
	if gate.animation or not gate.closed then return end

	gate.animation=true
	moveObject(gate.object, 1500,-1528,482.10,3.5, 0, 0, 0, "OutQuad")

	setTimer(function()
		gate.animation=false; gate.closed=false
	end, 1500, 1)
end

gate.close=function()
	if gate.animation or gate.closed then return end

	gate.animation=true
	moveObject(gate.object, 1500, -1528,482.10,8.73, 0, 0, 0, "OutQuad")

	setTimer(function()
		gate.animation=false; gate.closed=true
	end, 1500, 1)
end

gate.toggle=function(el)
	if not el then return end

	if istaxi(el) then
		if gate.animation then
			outputChatBox('* Odczekaj chwile...', el, 255, 0, 0)
			return
		end

		if gate.closed then
			gate.open()

			setTimer(function()
				gate.close()
			end, 4000, 1)
		end
	else
		outputChatBox("* Nie jesteś na służbie, lub nie pracujesz jako taksówkarz.", el, 255, 0, 0)
	end
end

addEventHandler("onMarkerHit", gate.marker, function(el,md)
	gate.toggle(el)
end)