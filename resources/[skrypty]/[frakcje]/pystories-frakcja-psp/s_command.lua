--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

--local adminresourceRoot = getResourceRootElement(getResourceFromName("pystories-admin")) 

function pacholek(source,command)
if getElementData(source,'player:faction') and getElementData(source,'player:faction')=='PSP' then
    local rbs = getElementData(source,'player:rbs') or {}

            local x,y,z = getElementPosition(source)

            local rotX,rotY,rotZ = getElementRotation(source)
            local ob = createObject(1238,x,y-0.75,z-0.65,0,0,rotZ)
			setElementFrozen(ob,true)
			triggerClientEvent("setBreakable",root,ob)
			--setElementParent( element theElement, element parent )
            --setElementParent(rbs,ob)
            table.insert(rbs, ob  )
             
            --setElementPosition ( source, x, y, z )

            outputChatBox('* Ustawiono pachołek. ID:'..#rbs,source,255,255,0)
            setElementData(source,'player:rbs',rbs)

            setElementInterior(ob, getElementInterior(source))
            setElementDimension(ob, getElementDimension(source))

end
end
 
addCommandHandler('ustaw',function(source,cmd,arg)
if not arg then return end
if getElementData(source,'player:faction') and getElementData(source,'player:faction')=='PSP' then
	outputChatBox("* Użyj: /ustaw [pacholek/barierka]",source)
	if arg == "pacholek" then
	pacholek(source)
	elseif arg == "barierka" then
	barierka(source)
	end
	end
end)
addCommandHandler('usun',function(source,cmd,arg,arg2)
if not arg then return end
if getElementData(source,'player:faction') and getElementData(source,'player:faction')=='PSP' then
	outputChatBox("* Użyj: /usun [blokady/blokade]",source)
	if arg == "blokady" then
	blokady(source)
	elseif arg == "blokade" then
	if not arg2 then outputChatBox("* Wpisz id blokady!",source) return end
	blokade(source,arg2)
	end
	end
end)

function barierka(source,command)
if getElementData(source,'player:faction') and getElementData(source,'player:faction')=='PSP' then
    local rbs = getElementData(source,'player:rbs') or {}

            local x,y,z = getElementPosition(source)

            local rotX,rotY,rotZ = getElementRotation(source)

            local obj = createObject(1228,x,y,z-0.65,0,0,rotZ)
            table.insert(rbs,obj )
            setElementID ( obj, 1 )
            --setElementPosition ( source, x, y, z )
			triggerClientEvent("setBreakable",root,obj)
			setElementFrozen(obj,true)
            outputChatBox('* Ustawiono barierkę. ID:'..#rbs,source,255,255,0)
            setElementData(source,'player:rbs',rbs)

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