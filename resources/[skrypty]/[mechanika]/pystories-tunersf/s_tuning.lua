--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

createBlip(-2283.61,-146.74,35.32, 27,2,0,0,0,0,0,275)

local stanowiskaSwiatla = {
	stanowiskoDoherty={
		mpos={-2277.28, -130.55, 35.32}, -- marker
		cpos={-2278.2587890625, -132.13179016113, 33.934448242188, 7.9, 16.1, 6.1}, -- cuboid
		job_id="tuner-sf", -- (id) frakcja która będzie miała dostęp
		text="Montaż tuningu"
	},
}

for i,v in pairs(stanowiskaSwiatla) do
	v.cuboid=createColCuboid(unpack(v.cpos))
	v.marker=createMarker(v.mpos[1], v.mpos[2], v.mpos[3]-1, "cylinder", 1.5, 0, 0, 255, 100)
	setElementData(v.marker,"marker:duty",v.job_id)
	setElementData(v.marker,"marker:cuboid",v.cuboid)

	t=createElement("text")
	setElementData(t,"name",v.text)
	setElementPosition(t,v.mpos[1], v.mpos[2], v.mpos[3])
	addEventHandler("onMarkerHit", v.marker, function(el,md)
	if getElementType(el)~= "player" then return end
	local cs=getElementData(source, "marker:cuboid")
	if not cs then return end
	local job=getElementData(source,"marker:duty")
	local ljob=getElementData(el,"player:duty")
	if job ~= ljob then
		outputChatBox("* Nie jesteś zatrudniony w tym warsztacie.", el, 255, 0, 0)
		return
	end
	local vehicles=getElementsWithinColShape(cs,"vehicle")
	if #vehicles < 1 then
		outputChatBox("* Na stanowisku montażu nie ma żadnego pojazdu.", el,255, 0, 0)
		return
	end
	if #vehicles > 1 then
		outputChatBox("* Na stanowisku montażu jest zbyt dużo pojazdów.", el,255, 0, 0)
		return
	end
	if getElementHealth(vehicles[1]) < 900 then
		outputChatBox("* Pojazd jest zbyt uszkodzony aby zamontować światła.", el, 255, 0, 0)
		return
	end
	triggerClientEvent(el,"pokazPanelTuningu", el , vehicles[1])
end)
end


local t=createElement("text")
setElementData(t,"name","Pieniądze za tuning lub demontaż system pobiera od mechanika\nJeżeli jakiś cię oszukał zgłoś to do Admina!")
setElementPosition(t, -2275.01,-117.85,36.32)