local enableAreaMarker = {}
enableAreaMarker.r = 150
enableAreaMarker.g = 150
enableAreaMarker.b = 150

local disableAreaMarker = {}
disableAreaMarker.r = 120
disableAreaMarker.g = 120
disableAreaMarker.b = 120

local effectMarker = {}
effectMarker.r = 90
effectMarker.g = 90
effectMarker.b = 90

local timeEffects = { {65, "flash"}, {15, "flash"} } -- in minutes

local areaType = 0 -- 0 = effect disabled, 1 = effects enabled

function isPlayerInEnabledArea ()
	if areaType == 1 then
		return true
	else
		return false
	end
end

addEvent ("onRaceStart", true)
addEventHandler ("onRaceStart", getRootElement(),
	function ()
		for k,v in ipairs(timeEffects) do
			for key, value in ipairs(v) do
				if tonumber(value) then
					delay = value
				else
					fxType = value
				end
			end
			setTimer (makeEffect, delay*1000, 1, fxType)
		end
	end
)

function makeEffect (type)
	if type == "flash" then
		if isPlayerInEnabledArea () then
			fadeCamera ( false, 1.0, 255, 255, 255 )
			setTimer ( fadeCamera, 500, 1, true, 0.2 )
		end
	end
end

addEventHandler ( "onClientMarkerHit", getRootElement(),
	function (player, dim)
		local r,g,b,a = getMarkerColor (source)
		if r == enableAreaMarker.r and g == enableAreaMarker.g and b == enableAreaMarker.b then
			areaType = 1
		end
		if r == effectMarker.r and g == effectMarker.g and b == effectMarker.b then
			makeEffect ("flash")
		end
	end
)