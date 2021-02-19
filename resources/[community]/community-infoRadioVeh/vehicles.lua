-- radyjko by Neyo ! :D

addEventHandler ( "onVehicleEnter", root, function(plr,lel,...)
local veh = getPedOccupiedVehicle(plr)
local id = getElementData(veh,"vehicle:id")
if not id then return end
	outputChatBox("* Aby dodać stacje radiowe wpisz /radio.", plr)
	outputChatBox("* Aby wybrać stacje radiowe użyj scrolla.", plr)
	setElementData(veh,"ostatni:kierowca",getPlayerName(plr))
end)

--[[addEventHandler ( "onVehicleStartEnter", root, function(plr,lel,...)
if getElementData(plr,"player:license:pjB") ~= 1 then 
outputChatBox("* Nie posiadasz prawa jazdy zdaj je w urzędzie!", plr, 255, 0, 0)
cancelEvent() 
return end
end)--]]