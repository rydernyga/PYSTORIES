--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

addCommandHandler("spawn", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -1916.08, 883.15, 35.41)
	setElementDimension(gracz,0)
	setElementInterior(gracz,0)
    outputChatBox("[Admin-TP] Witamy na Spawnie.", el, 255, 255, 255)
end)

addCommandHandler("lotnisko", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -1415.12, -296.07, 14.15)
	setElementDimension(gracz,0)
	setElementInterior(gracz,0)
    outputChatBox("[Admin-TP] Witamy na Lotnisku.", el, 255, 255, 255)
end)

addCommandHandler("ls", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 2500.5952, -1669.4454, 13.3532)
	setElementDimension(gracz,0)
	setElementInterior(gracz,0)
    outputChatBox("[Admin-TP] Witamy w Los Santos.", el, 255, 255, 255)
end)

addCommandHandler("lv", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 2140.8190, 986.2273, 10.8203)
	setElementDimension(gracz,0)
	setElementInterior(gracz,0)
    outputChatBox("[Admin-TP] Witamy w Las Venturas.", el, 255, 255, 0)
end)

addCommandHandler("sf", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -2757.34, 371.16, 4.35)
	setElementDimension(gracz,0)
	setElementInterior(gracz,0)
    outputChatBox("[Admin-TP] Witamy w San Fierro.", el, 255, 255, 255)
end)

addCommandHandler("gielda", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 2754.66, -2453.96, 13.64)
	setElementDimension(gracz,0)
	setElementInterior(gracz,0)
    outputChatBox("[Admin-TP] Witamy na giełdzie.", el, 255, 255, 255)
end)

addCommandHandler("salon.1", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -1640.75, 1203.64, 7.24)
    setElementDimension(gracz,0)
	setElementInterior(gracz,0)
    outputChatBox("[Admin-TP] Witamy przed salonem #1.", el, 255, 255, 255)
end)

addCommandHandler("salon.2", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -1966.59, 293.83, 35.47)
    setElementDimension(gracz,0)
	setElementInterior(gracz,0)
    outputChatBox("[Admin-TP] Witamy przed salonem #2.", el, 255, 255, 255)
end)

addCommandHandler("pustynia", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 428.4866, 2533.7695, 16.5045)
	setElementInterior(gracz,0)
	setElementDimension(gracz,0)
    outputChatBox("[Admin-TP] Witamy na pustyni.", el, 255, 255, 255)
end)

addCommandHandler("tama", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -924.3400, 2019.7234, 60.9141)
	setElementInterior(gracz,0)
	setElementDimension(gracz,0)
    outputChatBox("[Admin-TP] Witamy na tamie.", el, 255, 255, 255)
end)

addCommandHandler("fc", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -98.58, 1086.46, 19.74)
	setElementInterior(gracz,0)
	setElementDimension(gracz,0)
    outputChatBox("[Admin-TP] Witamy w Fort Carson.", el, 255, 255, 255)
end)

addCommandHandler("stadion", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    --setElementPosition(gracz, -1367.2737, 1566.3998, 1052.5313)
	setElementPosition(gracz, -2123.81, -445.12, 35.53)
	setElementInterior(gracz,0)
	setElementDimension(gracz,0)
    outputChatBox("[Admin-TP] Witamy na stadionie.", el, 255, 255, 255)
end)

addCommandHandler("molo", function(el,md)
	if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 836.2119, -2057.7136, 12.8671)
	setElementInterior(gracz,0)
	setElementDimension(gracz,0)
    outputChatBox("[Admin-TP] Witamy na molo.", el, 255, 255, 255)
end)

addCommandHandler("bagno", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -841.3732, -1940.7094, 12.5643)
	setElementInterior(gracz,0)
	setElementDimension(gracz,0)
    outputChatBox("[Admin-TP] Witamy na bagnach.", el, 255, 255, 255)
end)

addCommandHandler("port", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 1585.81, 1447.36, 10.84)
    setElementInterior(gracz,0)
	setElementDimension(gracz,0)
    outputChatBox("[Admin-TP] Witamy w porcie.", el, 255, 255, 255)
end)

addCommandHandler("mc", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -2301.9609, -1648.8076, 483.6195)
    setElementInterior(gracz,0)
	setElementDimension(gracz,0)
    outputChatBox("[Admin-TP] Witamy na MountChilliad.", el, 255, 255, 255)
end)

addCommandHandler("derby", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -3657.45,471.10,54.40)
	setElementInterior(gracz,0)
	setElementDimension(gracz,0)
    outputChatBox("[Admin-TP] Witamy na mapie Derbowej.", el, 255, 255, 255)
end)

addCommandHandler("przecho", function(el,md)
	if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -1970.09, 615.95, 35.17)
	setElementInterior(gracz,0)
	setElementDimension(gracz,0)
    outputChatBox("[Admin-TP] Witamy pod Przecho.", el, 255, 255, 255)
end)

addCommandHandler("ztp", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -4543.05,2888.26,11.86)
	setElementInterior(gracz,0)
	setElementDimension(gracz,0)
    outputChatBox("[Admin-TP] Witamy na mapie ZTP.", el, 255, 255, 255)
end)


addCommandHandler("event", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -1935.23,882.47,38.51)
	setElementDimension(gracz,666)
    outputChatBox("[Admin-TP] Witamy na mapie Eventowej.", el, 255, 255, 255)
end)



--[[addCommandHandler("spad", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -1613.14,717.29,13.36)
	setElementDimension(gracz,0)
    outputChatBox("Witamy na SAPD", el, 255, 255, 255)
end)--]]



--[[addCommandHandler("tune", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -2294.24,-128.51,35.32)
	setElementDimension(gracz,0)
    outputChatBox("Witamy na tune", el, 255, 255, 255)
end)--]]


addCommandHandler("cygan", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -894.73, 1538.88, 25.81)
	setElementInterior(gracz,0)
	setElementDimension(gracz,0)
    outputChatBox("[Admin-TP] Witamy u Cygan'a", el, 255, 255, 255)
end)



addCommandHandler("psp", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -2113.12, 1.86, 40.56)
	setElementInterior(gracz,0)
	setElementDimension(gracz,0)
    outputChatBox("[Admin-TP] Witamy na PSP", el, 255, 255, 255)
end)



--[[addCommandHandler("asa", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -1476.37,458.27,7.19)
	setElementDimension(gracz,0)
    outputChatBox("Witamy na bazie ASA", el, 255, 255, 255)
end)--]]



addCommandHandler("samc", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -2566.81, 642.68, 14.46)
	setElementInterior(gracz,0)
	setElementDimension(gracz,0)
    outputChatBox("[Admin-TP] Witamy na bazie SAMC", el, 255, 255, 255)
end)

addCommandHandler("urzad", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -1991.35, 1042.16, 55.73)
	setElementInterior(gracz,0)
	setElementDimension(gracz,0)
    outputChatBox("[Admin-TP] Witamy pod Urządem", el, 255, 255, 255)
end)

addCommandHandler("sapd", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, -1605.45, 716.73, 11.97)
	setElementInterior(gracz,0)
	setElementDimension(gracz,0)
    outputChatBox("[Admin-TP] Witamy pod SAPD", el, 255, 255, 255)
end)

--[[addCommandHandler("swat", function(el,md)
if not getAdmin(el) then return end	 local gracz = el
    if isPedInVehicle(el) then gracz = getPedOccupiedVehicle(el) end
    setElementPosition(gracz, 1807.93,-1574.54,13.46)
	setElementDimension(gracz,0)
    outputChatBox("Witamy pod bazą SWAT :)", el, 255, 255, 255)
end)--]]