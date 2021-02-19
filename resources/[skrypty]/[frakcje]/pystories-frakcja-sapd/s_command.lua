--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

--local adminresourceRoot = getResourceRootElement(getResourceFromName("ogrpg-admin")) 

function mandat(plr, cmd, target, cash, ...)
	if getElementData(plr,"player:faction") and getElementData(plr,"player:faction") == "SAPD" then
	if not (target) or not (cash) or not (...) then
		plr:outputChat('*  Użyj: /mandat <nick/ID> <kwota> <powód>')
	else
		if getElementData(plr,"player:rank") < 2 then outputChatBox("* Nie posiadasz uprawnień !",plr) return end
		cash=tonumber(cash)
		if cash <= 0 then
			plr:outputChat('* Wartość kwoty mandatu nie może być ujemna.')
			return 
		elseif cash > 35000 then
			plr:outputChat('* Kwota mandatu jest zbyt duża (max. 35.000 PLN).')
			return
		end

		local targetElement=exports['pystories-core']:findPlayer(plr, target)
				
		if targetElement then
			local x, y, z = getElementPosition(plr)
			local tx, ty, tz = getElementPosition(targetElement)
				
			local distance = getDistanceBetweenPoints3D(x, y, z, tx, ty, tz)
				
			if (distance<=10) then
				local reason=table.concat({...}, ' ')
				local money=getPlayerMoney(targetElement)
					
				local takeFromCash = money-cash
				if money >= cash then
					plr:outputChat(('* Wystawiono mandat dla %s, na kwotę %d PLN. Powód: %s'):format(targetElement:getName():gsub("#%x%x%x%x%x%x",""), cash, reason))
					targetElement:outputChat(('* Otrzymano mandat od %s, na kwotę %d PLN. Powód: %s'):format(plr:getName():gsub("#%x%x%x%x%x%x",""), cash, reason))

					takePlayerMoney(targetElement, cash)
					givePlayerMoney(plr, cash/4)
					plr:outputChat(('* Dostałeś(aś) kwotę %d PLN za wystawiony mandat dla %s'):format(cash/4, targetElement:getName():gsub("#%x%x%x%x%x%x","")))
					--triggerClientEvent(root, "admin:addText", root, "MANDAT> "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." wystawil mandat "..getPlayerName(targetElement):gsub("#%x%x%x%x%x%x","").." w kwocie "..cash:gsub("#%x%x%x%x%x%x","")..", powod: "..reason:gsub("#%x%x%x%x%x%x","")..".")
					local desc = "[MANDAT] "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." wystawił(a) mandat "..getPlayerName(targetElement):gsub("#%x%x%x%x%x%x","").." w kwocie "..cash..", powod: "..reason.."."
					triggerEvent("admin:addText", resourceRoot, desc:gsub("#%x%x%x%x%x%x",""))
					outputServerLog(desc)
				else
					plr:outputChat(('* %s nie posiada pieniędzy, na opłatę mandatu.'):format(targetElement:getName()))
				end	
			else
				plr:outputChat('* Jesteś za daleko gracza, żeby móc wystawić mandat.')
			end
		end
	end
end
end
addCommandHandler('mandat', mandat)

--[[
    Developers: Split
	Edit : Yolos
]]
--local adminresourceRoot = getResourceRootElement(getResourceFromName("ogrpg-admin")) 

function pacholek(source,command)
if getElementData(source,'player:faction') and getElementData(source,'player:faction')=='SAPD' then
    local rbs = getElementData(source,'player:rbs') or {}

            local x,y,z = getElementPosition(source)

            local rotX,rotY,rotZ = getElementRotation(source)
            local ob = createObject(1238,x,y-0.75,z-0.65,0,0,rotZ)
			setElementFrozen(ob,true)
			triggerClientEvent("setBreakable",root,ob)
            setElementParent(s,ob)
            table.insert(rbs, ob  )
             
            --setElementPosition ( source, x, y, z )

            outputChatBox('* Ustawiono pachołek. ID: '..#rbs,source,255,255,0)
            setElementData(source,'player:rbs',rbs)

            setElementInterior(ob, getElementInterior(source))
            setElementDimension(ob, getElementDimension(source))

end
end
 
addCommandHandler('ustaw',function(source,cmd,arg)
if not arg then outputChatBox("* Użyj: /ustaw [pacholek/barierka/kolczatka]",source) return end
if getElementData(source,'player:faction') and getElementData(source,'player:faction')=='SAPD' then
	--if not arg then outputChatBox("* Użyj: /ustaw [pacholek/barierka/kolczatka]",source) return end
	--outputChatBox("* Użyj: /ustaw [pacholek/barierka/kolczatka]",source)
	if arg == "pacholek" then
	pacholek(source)
	elseif arg == "barierka" then
	barierka(source)
	elseif arg == "kolczatka" then
	kolczatka(source)
	end
	end
end)
addCommandHandler('usun',function(source,cmd,arg,arg2)
if not arg then outputChatBox("* Użyj: /usun [blokady/blokade]",source) return end
if getElementData(source,'player:faction') and getElementData(source,'player:faction')=='SAPD' then
	--outputChatBox("* Użyj: /usun [blokady/blokade]",source)
	--if not arg and not arg2 then outputChatBox("* Użyj: /ustaw [pacholek/barierka/kolczatka]",source) return end
	if arg == "blokady" then
	blokady(source)
	elseif arg == "blokade" then
	if not arg2 then outputChatBox("* Wpisz id blokady!",source) return end
	blokade(source,arg2)
	end
	end
end)

function barierka(source,command)
if getElementData(source,'player:faction') and getElementData(source,'player:faction')=='SAPD' then
    local rbs = getElementData(source,'player:rbs') or {}

            local x,y,z = getElementPosition(source)

            local rotX,rotY,rotZ = getElementRotation(source)

            local obj = createObject(1228,x,y,z-0.65,0,0,rotZ)
            table.insert(rbs,obj )
            setElementID ( roadblockobject, rbs )
            --setElementPosition ( source, x, y, z )
			triggerClientEvent("setBreakable",root,obj)
			setElementFrozen(obj,true)
            outputChatBox('* Ustawiono barierkę. ID: '..#rbs,source,255,255,0)
            setElementData(source,'player:rbs',rbs)

            setElementInterior(obj, getElementInterior(source))
            setElementDimension(obj, getElementDimension(source))

end
end

function kolczatka(source,command)
if getElementData(source,'player:faction') and getElementData(source,'player:faction')=='SAPD' then
    local rbs = getElementData(source,'player:rbs') or {}

            local x,y,z = getElementPosition(source)

            local rotX,rotY,rotZ = getElementRotation(source)
            local obj = createObject(2899, x, y, z-0.85, 0,0,rotZ-90)

            table.insert(rbs,obj )
            setElementData(obj, 'isStinger', true)
            setTimer(destroyElement,300000,1,obj)
            outputChatBox('* Ustawiono kolczatkę. ID: '..#rbs,source,255,255,0)
            setElementData(source,'player:rbs',rbs)
			--setElementPosition ( source, x, y, z )

            setElementInterior(obj, getElementInterior(source))
            setElementDimension(obj, getElementDimension(source))

end
end

function blokady(plr)
if getElementData(plr,'player:rbs') then
for key, value in ipairs(getElementData(plr,'player:rbs')) do
if isElement(value) then
destroyElement(value)
end
end
outputChatBox('* Usunąłeś(aś) blokady.',plr,255,255,255,true)
removeElementData(plr,'player:rbs')
end
end



function blokade(plr,value)
if value then
local rbs = {}  
for key, v in ipairs(getElementData(plr,'player:rbs')) do
if isElement(v) and key == tonumber(value) then
destroyElement(v)
outputChatBox('* Usunąłeś(aś) Blokadę ID: '..key,plr,255,255,0)
else
table.insert(rbs,v)
end
setElementData(plr,'player:rbs',rbs)
end
else
--outputChatBox('Aby usunąc blokade wpisz /'..CommandName..' [id]',player,150,0,0)
end
end




