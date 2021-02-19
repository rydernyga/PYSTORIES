--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local job = "Nurek"
local marker = false
local text = false

addEventHandler("onResourceStart", resourceRoot, function()
  marker = createMarker(263.47812, 2895.69409, 10.53139-1, "cylinder", 1.5, 0, 255, 0, 75)
  text = createElement("text")
  setElementPosition(text, 263.47812, 2895.69409, 10.53139)
  setElementData(text, "name", "Praca dorywcza\nNurek zbieranie beczek z wody")
end)

addEventHandler("onMarkerHit", resourceRoot, function(player)
  if source ~= marker then return end
  if getElementType(player) ~= "player" then return end
  if getElementData(player, "player:job") == job then
    outputChatBox("Zakączyłeś pracę nurka.", player, 255, 255, 255)
    triggerClientEvent(player, "stop:job", root)
    setElementData(player, "player:job", false)
  else
    outputChatBox("Rozpocząłeś pracę nurka, udaj się pod wodę aby wyłowić beczke z benzyną.", player, 255, 255, 255)
    triggerClientEvent(player, "start:job", root)
    setElementData(player, "player:job", job)
  end
end)
