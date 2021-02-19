--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

addEvent("onBroadcastedEvent", true)
addEventHandler("onBroadcastedEvent", root, function(msg)
  if not source or not isElement(source) then return end
  if getElementDimension(source)~=getElementDimension(localPlayer) then return end
  if getElementInterior(source)~=getElementInterior(localPlayer) then return end

  local x,y,z=getElementPosition(source)
  local x1,y1,z1=getElementPosition(localPlayer)

  local dist=getDistanceBetweenPoints3D(x,y,z,x1,y1,z1)
  if dist>50 and getCameraTarget()~=source then return end

  outputChatBox("* ".. msg)
end)