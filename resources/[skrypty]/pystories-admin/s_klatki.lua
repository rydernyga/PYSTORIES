--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

function getPointFromDistanceRotation(x,y,dist,angle)
	local a=math.rad(90-angle);
	local dx=math.cos(a) * dist;
	local dy=math.sin(a) * dist;
	return x+dx, y+dy;
end

addCommandHandler("ustaw.klatke", function(plr)
	if getAdmin(plr,1) or getAdmin(plr,2) or getAdmin(plr,3) or getAdmin(plr,4) then
		local x,y,z=getElementPosition(plr)
		local dim=getElementDimension(plr)
		local int=getElementInterior(plr)

		local object=createObject(971, x,y,z-0.9, 270, 0, 180)
		setElementData(object,"owner",getPlayerName(plr))
		setElementDimension(object,dim)
		setElementInterior(object,int)

		local object=createObject(971, x,y,z+6, 270, 0, 180)
		setElementData(object,"owner",getPlayerName(plr))
		setElementDimension(object,dim)
		setElementInterior(object,int)

		local object=createObject(971, x,y+3.5,z+2.5, 0, 0, 0)
		setElementData(object,"owner",getPlayerName(plr))
		setElementDimension(object,dim)
		setElementInterior(object,int)

		local object=createObject(971, x-4.5,y,z+2.5, 0, 0, 270)
		setElementData(object,"owner",getPlayerName(plr))
		setElementDimension(object,dim)
		setElementInterior(object,int)

		local object=createObject(971, x,y-3.5,z+2.5, 0, 0, 180)
		setElementData(object,"owner",getPlayerName(plr))
		setElementDimension(object,dim)
		setElementInterior(object,int)

		local object=createObject(971, x+4,y,z+2.5, 0, 0, 270)
		setElementData(object,"owner",getPlayerName(plr))
		setElementDimension(object,dim)
		setElementInterior(object,int)

		outputChatBox("* Stworzyłes(aś) klatkę.", plr)
	end
end)

addCommandHandler("usun.klatke", function(plr)
	if getAdmin(plr,1) or getAdmin(plr,2) or getAdmin(plr,3) or getAdmin(plr,4) then
		for i,v in ipairs(getElementsByType("object")) do
			if getElementData(v,"owner") == getPlayerName(plr) then
				destroyElement(v)
			end
		end
	end
end)