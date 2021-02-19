--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

activeSirens = {}


vehicleSiren = {

-- police


[427] = {"police1.wav",nil},
[490] = {"police2.wav",nil},
[528] = {"police3.wav",nil},
[523] = {"police1.wav",nil},
[598] = {"police2.wav",nil},
[596] = {"police3.wav",nil},
[599] = {"police1.wav",nil},
[597] = {"police2.wav",nil},
[601] = {"police3.wav",nil},
[523] = {"police3.wav",nil}, -- HPV-1000
[560] = {"police1.wav",nil}, -- sultki policyjne
[579] = {"police3.wav",nil}, -- huntleye policyjne
[426] = {"police3.wav",nil}, -- premiery policyjne
[411] = {"police3.wav",nil}, -- infki zarzadu

-- ambulance
[416] = {"ambulance.wav",nil},
[547] = {"ambulance.wav",nil}, -- Primo SAMC
[489] = {"ambulance.wav",nil}, -- Rancher SAMC
[415] = {"ambulance.wav",nil}, -- Cheetah SAMC

-- fire departament
[407] = {"firedep.wav",nil},
[544] = {"fireladder.wav","firemix.wav"}
}

-- disable classic siren
setWorldSoundEnabled( 17, 10, false )
setWorldSoundEnabled( 17, 11, false )

effectName = "i3dl2reverb"

for key, value in ipairs(getElementsByType("sound")) do
if getElementData(value,"siren") then
stopSound(value)
end
end

addEventHandler("onClientRender",root,function ()
for key, value in ipairs(getElementsByType("vehicle")) do

if getVehicleSirensOn(value) then
if not getElementData(value,"og.mikser") or not vehicleSiren[getElementModel(value)][2] then
  if not activeSirens[value] then
  if vehicleSiren[getElementModel(value)] then
  local syrena = vehicleSiren[getElementModel(value)][1] or "police1.wav"
  activeSirens[value] = playSound3D(syrena,0,0,3,true)
  setSoundMinDistance(activeSirens[value],20)
  setSoundMaxDistance(activeSirens[value],200)
  setElementParent(activeSirens[value],value)
  setSoundVolume(activeSirens[value],0.4)
  setElementData(activeSirens[value],"siren",true)
  --setSoundEffectEnabled(activeSirens[value],effectName,true)
  end
  end
  else
  if not activeSirens[value] then
  if vehicleSiren[getElementModel(value)] then
  if vehicleSiren[getElementModel(value)][2] then
  
  local syrena = vehicleSiren[getElementModel(value)][2] or "police1.wav"
  activeSirens[value] = playSound3D(syrena,0,0,3,true)
  setSoundMinDistance(activeSirens[value],20)
  setSoundMaxDistance(activeSirens[value],200)
  setElementParent(activeSirens[value],value)
  setSoundVolume(activeSirens[value],0.4)
  setElementData(activeSirens[value],"siren",true)
  --setSoundEffectEnabled(activeSirens[value],effectName,true)
  end
  end
  end
  end
  else
  if activeSirens[value] then
  stopSound(activeSirens[value])
  activeSirens[value] = nil
  end
  end
  end
  

  
  end)
  
  
  
  
addEventHandler("onClientRender",root,function ()
for key, value in ipairs(getElementsByType("vehicle")) do
  if activeSirens[value] then
  local x, y, z = getElementPosition(value)
  setElementPosition(activeSirens[value],x,y,z)
  if not getVehicleController(value) then
  setSoundVolume(activeSirens[value],0.01)
  else
  setSoundVolume(activeSirens[value],0.4)
  end
  if getElementData(value,"og.sirenspeed") then
  if activeSirens[value] then
   setSoundSpeed(activeSirens[value],1.85)
  
  end
  else
  setSoundSpeed(activeSirens[value],1.0)
  end
  end
  
  
  
  
  

  end
  end)
  
  
  
addEventHandler("onClientRender",root,function ()
if isPedInVehicle(localPlayer) then
  local veh = getPedOccupiedVehicle(localPlayer)
  if getVehicleController(veh)==localPlayer and vehicleSiren[getElementModel(veh)] then
  if getKeyState("j") then
  if activeSirens[veh] then
  setElementData(veh,"og.sirenspeed",true)
  end
  else
  setElementData(veh,"og.sirenspeed",false)
  end
  end
  
  end
  end)
  --[[
  local w, h = guiGetScreenSize()
  
  function dxDrawTextRelative(text,x1,y1,x2,y2,color,scale,font,alignx,aligny,val1,val2,val3,val4,val5)
local x1 = (x1/1280)*w
local x2 = (x2/1280)*w
local y1 = (y1/1024)*h
local y2 = (y2/1024)*h
dxDrawText(text,x1,y1,x2,y2,color,scale/1280*w,scale/1024*h,font,alignx,aligny,val1,val2,val3,val4,val5)
end

function dxDrawRectangleRelative(startX, startY, width, height ,color, postGUI, subPixelPositioning  )
local x1 = (startX/1280)*w
local x2 = (width/1280)*w
local y1 = (startY/1024)*h
local y2 = (height/1024)*h
dxDrawRectangle(x1,y1,x2,y2,color,postGUI,subPixelPositioning)
end

function conState(state)
if state == true then
return {"ON", 31, 255, 31}
else
return {"OFF", 255, 31, 31}
end
end


ablevehicles = {
[427] = true, -- enforcer
[490] = true, -- fbi rancher
[528] = true, -- fbi truck
[523] = true, -- hpv1000
[598] = true, -- police lv
[596] = true, -- police police ls
[599] = true, -- police ranger
[597] = true, -- police sf
[601] = true, -- swat
[432] = true, -- rhino
[470] = true, -- patriot

-- ambulance
[416] = true,
-- fire departament
[407] = true,
[544] = true


}

addEventHandler("onClientRender",root,function ()
if isPedInVehicle(localPlayer) and ablevehicles[getElementModel(getPedOccupiedVehicle(localPlayer))] then
local veh = getPedOccupiedVehicle(localPlayer)
local syreny = conState(getElementData(veh,"og.sirens"))
local migacze = conState(getVehicleSirensOn(veh))
dxDrawRectangleRelative(793, 28, 170, 103, tocolor(0, 0, 0, 108), false)
dxDrawRectangleRelative(793, 28, 170, 21, tocolor(0, 0, 0, 108), false)
dxDrawRectangleRelative(811, 91, 25, 25, tocolor(migacze[2], migacze[3], migacze[4], 226), false)
dxDrawRectangleRelative(920, 91, 25, 25, tocolor(syreny[2], syreny[3], syreny[4], 226), false)
dxDrawTextRelative(migacze[1], 811, 91, 836, 116, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
dxDrawTextRelative(syreny[1], 920, 91, 945, 116, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
dxDrawTextRelative("Migacze 'H'", 793, 66, 859, 81, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
dxDrawTextRelative("Syreny 'J'", 897, 66, 963, 81, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, false, false, false)
dxDrawTextRelative("Pojazd Służbowy", 793 - 1, 28 - 1, 963 - 1, 49 - 1, tocolor(0, 0, 0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
dxDrawTextRelative("Pojazd Służbowy", 793 + 1, 28 - 1, 963 + 1, 49 - 1, tocolor(0, 0, 0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
dxDrawTextRelative("Pojazd Służbowy", 793 - 1, 28 + 1, 963 - 1, 49 + 1, tocolor(0, 0, 0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
dxDrawTextRelative("Pojazd Służbowy", 793 + 1, 28 + 1, 963 + 1, 49 + 1, tocolor(0, 0, 0, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
dxDrawTextRelative("Pojazd Służbowy", 793, 28, 963, 49, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
 end
 end)
        
 ]]--     
        