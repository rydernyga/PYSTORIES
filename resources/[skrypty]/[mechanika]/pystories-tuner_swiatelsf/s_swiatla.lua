--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local stanowiskaSwiatla = {
	stanowiskoDoherty={
		mpos={-2279.64, -131.03, 35.32}, -- marker
		cpos={-2286.4526367188, -132.17335510254, 33.934448242188, 7.9, 16.1, 6.1}, -- cuboid
		faction_id="tuner-sf", -- (id) frakcja która będzie miała dostęp
		text="Montaż świateł"
	},
}

for i,v in pairs(stanowiskaSwiatla) do
	v.cuboid=createColCuboid(unpack(v.cpos))
	v.marker=createMarker(v.mpos[1], v.mpos[2], v.mpos[3]-1, "cylinder", 1.2, 0, 0, 255, 100)
	setElementData(v.marker,"marker:duty",v.faction_id)
	setElementData(v.marker,"marker:cuboid",v.cuboid)

	t=createElement("text")
	setElementData(t,"name",v.text)
	setElementPosition(t,v.mpos[1], v.mpos[2], v.mpos[3])
end