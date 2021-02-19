local fireModel = 2023
local fires = {}
addEvent("onFireExtinguished",true)
addEvent("onFireCreate",true)


local function isFireNearby(x,y,z)	-- todo d,i
  local cs=createColSphere(x,y,z,3)
  local obiekty=getElementsWithinColShape(cs, "object")
  destroyElement(cs)
  for i,v in ipairs(obiekty) do
	  if (getElementModel(v)==fireModel) then return true end
  end
  return false
end

function createFire(x,y,z,d,i)
	if (isFireNearby(x,y,z,d,i)) then return nil end
	local fireElem = createObject(fireModel,x,y,z)
	setElementCollisionsEnabled(fireElem,false)
	local col = createColSphere(x,y,z+1,2)
	setElementParent(col, fireElem)
	setElementData(fireElem, "ts", getTickCount(), false)
	setElementData(fireElem,"fire:Endvalue",math.random(40,80)) 
	local blip = createBlipAttachedTo ( fireElem, 0, 2, 0, 0, 0, 255, 0, 275.0, root )
	fires[fireElem] = {fireElem,col,blip}
	addEventHandler("onColShapeHit",col,setFire)
	if (d) then
	  setElementDimension(fireElem, d)
	  setElementDimension(col, d)
	end
	if (i) then
	  setElementInterior(fireElem, i)
	  setElementInterior(col, i)
	end
	return fireElem
end

function setFire(elem,dim)
	if not dim then return end
	if not elem or not isElement(elem) then return end
	if getElementType(elem) == "player" then
		setPedOnFire(elem,true)
	end
end

function setFire(elem,dim)
	if not dim then return end
	if not elem or not isElement(elem) then return end
	if getElementType(elem) == "vehicle" then
		setElementHealth(elem,299)
	end
end

function fireExtinguished(fireElem) 
    if (not fires[fireElem]) then return end
    local firedValue = getElementData(fireElem,"fire:Endvalue")
    setElementData(fireElem,"fire:Endvalue",firedValue-math.random(3,10))  
    if firedValue <= 0 then
    destroyElement(fires[fireElem][1])
	destroyElement(fires[fireElem][3])
    fires[fireElem] = nil
	triggerEvent("onFireExtinguished",client,client)
    end
end
addEvent("fireExtinguished",true)
addEventHandler("fireExtinguished",root,fireExtinguished)



addEventHandler("onDebugMessage", getRootElement(), 
function(message, level, file, line)
if file == "synced_fire" then
cancelEvent()
end
end)

local fireLocations =
{
{-1957.44,882.73,42.11},--spawn
{-1946.25,1102.22,53.61},
{-2026.35,482.86,35.17},
{-1981.24,-18.23,35.32}, ---benzynowa kurwa
{-2473.07,-637.13,134.18},
{-1498.39,2692.12,55.84},
{-1481.75,2702.71,56.25},
{-1475.06,2704.89,55.84}, --ELEQUABRADOS
{-1995.15,77.15,27.74},
{-1984.08,317.18,35.14},
{-1737.68,-961.54,75.91},
{-2439.09,580.11,24.75},
{-1728.18,-954.33,74.45}, ---OBOK LV
{856.91,297.96,19.98},	
{859.37,288.24,20.01},	
{874.11,286.16,21.52},	
{871.36,301.26,20.98},	
{864.23,311.65,20.05},	
{860.90,321.35,20.13},	
{848.29,326.49,20.19},	
{838.35,320.53,20.51},	
{828.07,313.47,21.56},	
{814.50,313.07,21.31},	
{-2688.97, 205.51, 4.34},		
}
 
function unpackFires ()
    return unpack ( fireLocations [ math.random ( #fireLocations ) ] )
end
 
function scriptCreateFire ( player, command )
      --destroyElement ( fireBlip )
	  if isFireFighter == false then return end
      local x, y, z = unpackFires() 
      fire = createFire( x, y, z)
end
setTimer(scriptCreateFire, 10000 * 5, 0)
addCommandHandler ( "qkx.stworz-ogien", scriptCreateFire )


local function extinguishExpiredFires()
  for i,v in ipairs(getElementsByType("object", resourceRoot)) do
    local ts=getElementData(v,"ts")
    if (ts and getTickCount()-ts<1000*3600*6) then
    destroyElement(fires[fireElem][1])
	destroyElement(fires[fireElem][3])
    fires[fireElem] = nil
    end
  end
end
setTimer(extinguishExpiredFires, 1000*3600, 0)


function isFireFighter()
local result = false
	for i,element in ipairs(getElementsByType("player")) do
		if (getElementData(element,"player:faction") == "PSP")then
			result = true
		end
   end
return result
end

function getMyData ( thePlayer, command )
    local data = getAllElementData ( thePlayer )     -- get all the element data of the player who entered the command
    for k, v in pairs ( data ) do                    -- loop through the table that was returned
        outputConsole ( k .. ": " .. tostring ( v ) )             -- print the name (k) and value (v) of each element data, we need to make the value a string, since it can be of any data type
    end
end
addCommandHandler ( "elemdata", getMyData )
