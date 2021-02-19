addEvent ("onRaceStateChanging", true)
addEventHandler ("onRaceStateChanging", getRootElement(),
	function (new,old)
		if new == "Running" then
			triggerClientEvent ("onRaceStart", getRootElement())
		end
	end
)