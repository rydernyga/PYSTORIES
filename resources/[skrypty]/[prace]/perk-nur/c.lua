--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local markers = {
{230.30830, 2951.08765, -7.41003},
{272.13217, 3007.28931, -7.75459},
{341.18185, 2963.04688, -7.78807},
{261.88568, 3001.02173, -7.43157},
}

local obiekty = {
{1217},
{1218},
{1222},
{1225},
}

local job = "Nurek"

local marker = false
local marker2 = false
local blip = false
local blip2 = false
local obiekt = false

addEventHandler("onClientRender", root, function()
  if getElementData(localPlayer, "player:job") == job and isElementInWater(localPlayer) then
    setPedOxygenLevel(localPlayer, 1000)
  end
end)

addEvent("start:job", true)
addEventHandler("start:job", resourceRoot, function()
  local skin = getElementModel(localPlayer)
  setElementData(localPlayer, "skin", skin)
  setElementModel(localPlayer, 264)
  local random = math.random(2, #markers)
  local rObiekty = math.random(2, #obiekty)
  local x, y, z = markers[random][1], markers[random][2], markers[random][3]
  marker = createMarker(x, y, z, "ring", 2.5, 50, 50, 255, 100)
  blip = createBlipAttachedTo(marker, 41)
  obiekt = createObject(obiekty[rObiekty][1], x, y, z)
  text = createElement("text")
  setElementPosition(text, x, y, z)
  setElementData(text, "name", "Beczka z benzyną")
end)

addEventHandler("onClientMarkerHit", resourceRoot, function(hit)
  if source ~= marker then return end
  if hit ~= localPlayer then return end
  outputChatBox("Zabierasz beczke z benzyną...", 0, 255, 0)
  setElementFrozen(hit, true)
  setTimer(function()
    setElementFrozen(hit, false)
    outputChatBox("Zebrałeś beczke z benzyną udaj się na pomost aby ją oddać.", 255, 255, 255)
    if isElement(marker) and isElement(blip) and isElement(obiekt) and isElement(text) then
      destroyElement(marker)
      destroyElement(blip)
      destroyElement(obiekt)
      destroyElement(text)
    end
    marker2 = createMarker(258.25903, 2932.78491, 1.76613-1, "cylinder", 1.5, 255, 255, 255, 75)
    blip2 = createBlipAttachedTo(marker2, 41)
  end, 2500, 1)
end)

addEventHandler("onClientMarkerHit", resourceRoot, function(hit)
  if source ~= marker2 then return end
  if getElementType(hit) ~= "player" then return end
  local hajs = math.random(150,450)
  if getElementData(hit, "player:premium") then
    hajs = math.random(350,650)
  end
  outputChatBox("Beczka z benzyną została oddana, wynagrodzenie które otrzymałeś wyniosło "..hajs.." PLN.", 50, 200, 50)
  triggerServerEvent("givePlayerMoney", hit, hajs/2)
  destroyElement(marker2)
  destroyElement(blip2)
  local skin = getElementData(hit, "skin")
  setElementModel(hit, skin)
  setElementData(hit, "skin", false)
  setElementData(hit, "player:job", false)
end)

-- Skin nurka
txd = engineLoadTXD("swmyhp2.txd")
engineImportTXD(txd, 264)
dff = engineLoadDFF("swmyhp2.dff")
engineReplaceModel(dff, 264)
--

addEvent("stop:job", true)
addEventHandler("stop:job", resourceRoot, function()
  if isElement(marker) and isElement(blip) and isElement(obiekt) and isElement(text) then
    destroyElement(marker)
    destroyElement(blip)
    destroyElement(obiekt)
    destroyElement(text)
  end
  if isElement(marker2) and isElement(blip2) then
    destroyElement(marker2)
    destroyElement(blip2)
  end
  local skin = getElementData(localPlayer, "skin")
  setElementModel(localPlayer, skin)
  setElementData(localPlayer, "skin", false)
end)
