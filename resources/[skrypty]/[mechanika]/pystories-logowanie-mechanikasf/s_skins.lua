--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local skins={
	["tuner-sf"]={
		code="tuner-sf",
		positions={
			{-2272.14, -162.78, 35.32,50,"SKIN"},
		},
		text="* Nie jesteś zatrudniony(a) jako tuner w tym warsztacie."
	},
}

for _,skin in pairs(skins) do
	for _,pos in ipairs(skin.positions) do
    	local pickup=createPickup(pos[1], pos[2], pos[3], 3, 1275, 2000)
    	setElementDimension(pickup, pos[7] or 0)
    	setElementInterior(pickup, pos[6] or 0)
    	setElementData(pickup,"p:job",tostring(skin.code))
    	setElementData(pickup,"p:skin", tonumber(pos[4]))

		local t=createElement("text")
		setElementDimension(t, pos[7] or 0)
		setElementInterior(t, pos[6] or 0)
    	setElementData(t,"name",pos[5] or "Skin")
    	setElementPosition(t,pos[1],pos[2],pos[3])
    end
end

addEventHandler("onPickupHit", resourceRoot, function(el,md)
	if getElementType(el)~="player" then return end
    local job=getElementData(source,"p:job")
    if not job then return end
    local skin=getElementData(source,"p:skin")
    if not skin then return end
    if not getPlayerJob(el,job) or getElementData(el,"player:duty") ~= job then
    	outputChatBox(skins[job].text, el)
    	cancelEvent()
    	return
    end
    setElementModel(el,skin)
end)