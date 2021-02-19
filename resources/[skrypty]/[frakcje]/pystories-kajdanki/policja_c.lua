--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local function follow()
	local dokogo=getElementData(localPlayer,"kajdanki")
	if (not dokogo or not isElement(dokogo)) then
	  setElementData(localPlayer,"kajdanki", nil)
	  removeEventHandler("onClientPreRender", root, follow)
	  triggerServerEvent("setPedAnimation", localPlayer)
	  return
	end

--	setElementInterior(localPlayer, getElementInterior(dokogo))
--	setElementDimension(localPlayer, getElementDimension(dokogo))

	if (getPedOccupiedVehicle(dokogo) or getElementInterior(dokogo)~=getElementInterior(localPlayer) or getElementDimension(dokogo)~=getElementDimension(localPlayer)) then
	  setElementData(localPlayer,"kajdanki", nil)
	  removeEventHandler("onClientPreRender", root, follow)
	  triggerServerEvent("setPedAnimation", localPlayer)
	  return
	end


	local x,y,z=getElementPosition(dokogo)
	local x2,y2,z2=getElementPosition(localPlayer)
	local kat=0
	kat=math.deg(math.atan(-1*(x2-x)/(y2-y)))
	if (y2-y)<0 then
		kat=kat+180.0
	end
	kat=(kat+180)%360

--	rx,ry,rz=getElementRotation(localPlayer)
--	setElementRotation(localPlayer, rx,ry,kat)
	setPedRotation(localPlayer, kat)
	local dist=getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)
	if (dist<1) then
		setControlState("forwards", false)
	else
		setControlState("forwards", true)
	end
	if (dist>30) then
	  setElementPosition(localPlayer, x+math.random(-1,1), y+math.random(-1,1), z+math.random(0,10)/10)
	  return
	end
	if (dist>2) then
		setControlState("sprint", true)
		setControlState("walk", false)
	else
		setControlState("walk", true)
		setControlState("sprint", false)
	end
--	setPedAnimation(localPlayer, "ped" ,"WALK_csaw",  0, true, true, true )
--	triggerServerEvent("spac", localPlayer)
end






----

function menu_zakuj(args)
  local x,y,z=getElementPosition(localPlayer)
  local x2,y2,z2=getElementPosition(args.with)
  if (getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)>5) then
	outputChatBox("Podejdź bliżej.", 255,0,0,true)
	return
  end
  triggerServerEvent("onKajdankiZakuj", resourceRoot, localPlayer, args.with)
end

addEvent("onKajdankiZakuj", true)
addEventHandler("onKajdankiZakuj", resourceRoot, function(kto)
  local obecnie=getElementData(localPlayer, "kajdanki")
  if (obecnie and obecnie==kto) then
	  setElementData(localPlayer,"kajdanki", false)
	  removeEventHandler("onClientPreRender", root, follow)
	  triggerServerEvent("setPedAnimation", localPlayer)
	  outputChatBox(getPlayerName(kto):gsub("#%x%x%x%x%x%x","") .. " zdejmuje z Ciebie kajdanki.",0,0,255)
	return
  end
  outputChatBox(getPlayerName(kto):gsub("#%x%x%x%x%x%x","") .. " zakuwa Cię w kajdanki.",0,0,255)
  setElementData(localPlayer,"kajdanki", kto)
  addEventHandler("onClientPreRender", root, follow)
end)

-------------------------------

local obecnie=getElementData(localPlayer, "kajdanki")
if (obecnie and isElement(obecnie)) then
  addEventHandler("onClientPreRender", root, follow)

end



