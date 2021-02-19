--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local D=1
local I=3

--local rp_marker=createMarker(1469.22,-1802.14,1162.06,"cylinder",1)
--setElementInterior(rp_marker, I)
--setElementDimension(rp_marker, D)


local rp_text=createElement("text")
setElementPosition(rp_text, 1908.28,-1917.27,15.02)
setElementData(rp_text, "text", "Kupno domów")
setElementInterior(rp_text, I)
setElementDimension(rp_text, D)

local rp_npc=createPed(57,1905.01,-1917.40,15.03,270,false)
setElementInterior(rp_npc, I)
setElementDimension(rp_npc, D)

addEvent("onUmDomyWantInfo", true)
addEventHandler("onUmDomyWantInfo", getRootElement(), function(id)
	local data = exports.DB2:pobierzWyniki("SELECT d.id,d.descr,d.vwi,d.drzwi,d.punkt_wyjscia,d.interiorid,d.ownerid,d.zamkniety,d.koszt,d.paidTo,datediff(d.paidTo,now()) paidTo_dni FROM lss_domy d LEFT JOIN pystories_users c ON c.id=d.ownerid WHERE d.active=1 and d.id=?;",id)
	triggerClientEvent(source, "onUmDomyWantInfoCompleted", getRootElement(), data)
end)