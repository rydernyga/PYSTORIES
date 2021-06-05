--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local sw,sh=guiGetScreenSize()


--local nametagFont = "default"
local nametagFont = dxCreateFont( "f/droid-sans.ttf", 10)
if not nametagFont then nametagFont = "default-bold" end
local fontHeight=dxGetFontHeight(1, nametagFont)
local nametagScale = 1.10
local nametagAlpha = 180
local nametagColor =
{
    r = 255,
    g = 255,
    b = 255
} 

local hp_width=math.floor(sw/20)
if hp_width<50 then hp_width=50 end
local hp_height=math.floor(hp_width/10)

local gsize=sw>800 and 32 or 16


local ourlevel=0
local ourfid=""



setTimer(function()
  ourlevel=getElementData(localPlayer, "level") or 0
  ourfid=getElementData(localPlayer, "player:faction") or ""
end, 15000, 0)

function korona()
	local rootx, rooty, rootz = getCameraMatrix()
	for i, player in ipairs(getElementsWithinRange(rootx,rooty,rootz,22,"player")) do
		if getElementDimension(localPlayer)==getElementDimension(player) and getElementInterior(localPlayer)==getElementInterior(player) then
			if getElementAlpha(player) < 1 then
			if not getElementData(localPlayer,"player:admin") == true then return end
			end
			local x,y,z = getPedBonePosition(player,6)
			if x and y and z then
				if isLineOfSightClear( rootx,rooty,rootz, x,y,z, true, false, false, true, false, false, true,localPlayer ) then
					if getElementData(player,"Ryjek") then
						dxDrawMaterialLine3D(x,y,z+1.25,x,y,z+0.35,img,1.1,white)
					end
				end
			end
		end
	end
end

addEventHandler("onClientRender", root, function()
  local rootx, rooty, rootz = getCameraMatrix()--getElementPosition(getLocalPlayer())
        for i, vehicle in ipairs(getElementsWithinRange(rootx,rooty,rootz,15,"vehicle")) do
            local opis=getElementData(vehicle,"opis")
            local poziom=tonumber(getElementData(vehicle,"poziom"))
            if poziom then
                opis= (opis and opis or "") .. " zapełnienie: " ..math.floor(math.max(math.min(poziom,100),0)+0.5).."%"
            end
            if (opis) then
            	local x,y,z=getElementPosition(vehicle)
            	local kierowca=getVehicleController(vehicle)
               	local sx,sy = getScreenFromWorldPosition(x,y,z, 200)
                if (sx and sy) then
                    dxDrawText(opis, sx-(sw/5),sy,sx+(sw/5),sy, tocolor(255,255,255,155), 1.0, "default-small", "center","center",false,true)
                end
            end
        end
        
        local ctrl=getKeyState("lalt") or getKeyState("ralt") or getKeyState("lctrl") or getKeyState("rctrl")

        for i, player in ipairs(getElementsWithinRange(rootx,rooty,rootz,35,"player")) do
            if player ~= localPlayer and (getElementAlpha(player)>50 or ourlevel>1 or getElementDimension(player)==901) then
                local x,y,z = getPedBonePosition(player,8)

                local sx, sy = getScreenFromWorldPosition(x, y, z+0.5)
                if sx then
						if getElementAlpha(player) < 1 and not getElementData(localPlayer,"player:admin") then
						return end
						
						local name = "["..getElementData(player, "id").."] "..getPlayerName(player)..""

                        local fX = math.floor(sx)
                        local fY = math.floor(sy)

                        local alpha = 120

                            local org=getElementData(player,"player:organization")
                            if (ctrl) then
                                local fname=getElementData(player, "player:faction")
                                if (fname) then
                                    dxDrawText(fname, fX, fY+16, fX, fY+16, tocolor(255,255,255,200), nametagScale*0.9, nametagFont, "center", "center")
                                end
                                if org and org.nazwa then
                                    dxDrawText(org.nazwa, fX, fY+15, fX, fY+15, tocolor( 0,   0,  0, 150), nametagScale*1, nametagFont, "center", "center")
                                end
                            end

							local level = tonumber(getElementData(player, "player:level"))
							local p_level = tonumber(getElementData(player, "premium:level"))
                            if level == 1 then
                                dxDrawText("#FFFFFF[#01bf34"..getElementData(player, "id").."#FFFFFF] #FFFFFF"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").."", fX, fY, fX, fY, tocolor(255, 255, 255, 255), nametagScale, nametagFont, "center", "center",false,false,false,true,true)
								dxDrawText("#FFFFFF[#01bf34Moderator#FFFFFF]", fX, fY-16, fX, fY-16, tocolor(255, 255, 255, 255), nametagScale, nametagFont, "center", "center",false,false,false,true,true)
                            elseif level == 2 then
                                dxDrawText("#FFFFFF[#ff0000"..getElementData(player, "id").."#FFFFFF] #FFFFFF"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").."", fX, fY, fX, fY, tocolor(255, 255, 255, 255), nametagScale, nametagFont, "center", "center",false,false,false,true,true)
								dxDrawText("#FFFFFF[#ff0000Administrator#FFFFFF]", fX, fY-16, fX, fY-16, tocolor(255, 255, 255, 255), nametagScale, nametagFont, "center", "center",false,false,false,true,true)
							elseif level == 3 then
                                dxDrawText("#FFFFFF[#a31303"..getElementData(player, "id").."#FFFFFF] #FFFFFF"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").."", fX, fY, fX, fY, tocolor(255, 255, 255, 255), nametagScale, nametagFont, "center", "center",false,false,false,true,true)
								dxDrawText("#FFFFFF[#a31303ROOT#FFFFFF]", fX, fY-16, fX, fY-16, tocolor(255, 255, 255, 255), nametagScale, nametagFont, "center", "center",false,false,false,true,true)
							elseif level == 4 then
                                dxDrawText("#FFFFFF[#8F00FF"..getElementData(player, "id").."#FFFFFF] #FFFFFF"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").."", fX, fY, fX, fY, tocolor(255, 255, 255, 255), nametagScale, nametagFont, "center", "center",false,false,false,true,true)
								dxDrawText("#FFFFFF[#8F00FFPracownik Techniczny#FFFFFF]", fX, fY-16, fX, fY-16, tocolor(255, 255, 255, 255), nametagScale, nametagFont, "center", "center",false,false,false,true,true)
                            elseif p_level == 1 then
								dxDrawText("#FFFFFF[#C0FF00"..getElementData(player, "id").."#FFFFFF] #FFFFFF"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").."", fX, fY, fX, fY, tocolor(255, 255, 255, 255), nametagScale, nametagFont, "center", "center",false,false,false,true,true)
								dxDrawText("#FFFFFF[#C0FF00Premium#FFFFFF]", fX, fY-16, fX, fY-16, tocolor(255, 255, 255, 255), nametagScale, nametagFont, "center", "center",false,false,false,true,true)
							else
                                dxDrawText("#FFFFFF[#FFFFFF"..getElementData(player, "id").."#FFFFFF] #FFFFFF"..getPlayerName(player):gsub("#%x%x%x%x%x%x","").."", fX, fY, fX, fY, tocolor(255, 255, 255, 255), nametagScale, nametagFont, "center", "center",false,false,false,true,true) -- ,false,true
								dxDrawText("#FFFFFF[#FFFFFF#FFFFFFGracz#FFFFFF]", fX, fY-16, fX, fY-16, tocolor(255, 255, 255, 255), nametagScale, nametagFont, "center", "center",false,false,false,true,true)
                            end
							if getElementData(player,"mute:player") then
							--dxDrawText("[Wyciszony]", sxc1+1, syc1+1, sxc1+1, syc1+1, tocolor(0, 0, 0, alpha), nametagScale, nametagFont, "center", "center",false,false,false,true,true)
							dxDrawText("#FFFFFF[#FFFF00Wyciszony#FFFFFF]", fX, fY-32, fX, fY-32, tocolor(0, 255, 255, 255), nametagScale, nametagFont, "center", "center",false,false,false,true,true)
							end



                            if ourfid=="SAMC" then -- pokazujemy hp innych graczy
                                dxDrawRectangle(fX-hp_width/2-1, fY+fontHeight, hp_width+2, hp_height+2, tocolor(27,27,27,155))
                                local hp=getElementHealth(player)
                                if hp>100 then hp=100 end
                                local hhp_width=(hp*hp_width/100)
                                dxDrawRectangle(fX-hp_width/2, fY+fontHeight+1, hhp_width, hp_height, tocolor(255,5,5,155))
                            end

                            local opis=getElementData(player, "opis")
                            if opis then
                                local alpha=255-getDistanceBetweenPoints2D(sw/2,sh/2,sx,sy)

                                if alpha>5 then
                                    local sx, sy = getScreenFromWorldPosition(x, y, z-0.5)
                                    if sx and sy then
                                        dxDrawText(opis, sx-(sw/10),sy,sx+(sw/10),sy, tocolor(255,255,255,alpha), 1.0, "default-small", "center","center",false,true)
                                    end
                                end
                            end
                end
            end
        end    

        for i, ped in ipairs(getElementsWithinRange(rootx,rooty,rootz,8,"ped")) do
            local name=getElementData(ped,"name")
            if name then
                local x,y,z = getElementPosition(ped)
                local sx, sy = getScreenFromWorldPosition(x, y, z + 1)

                if sx then

                    local fX = sx
                    local fY = sy

                    local alpha = 120

                    if isLineOfSightClear(rootx,rooty,rootz,x,y,z,false,false,false) then
                        dxDrawText(name, fX, fY, fX, fY, tocolor(0, 0, 0, alpha), nametagScale, nametagFont, "center", "center")                    
                    end
                end
            end
        end  

		for i,vehicle in ipairs(getElementsWithinRange(rootx,rooty,rootz,25,"vehicle")) do
		local x,y,z=getElementPosition(vehicle)
		local sx,sy=getScreenFromWorldPosition(x,y,z)
		if sx and sy then
			local desc=getElementData(vehicle,"vehicle:desc")
			if desc then
				local veh = getPedOccupiedVehicle(localPlayer)
				if isLineOfSightClear( rootx,rooty,rootz, x,y,z, true, true, false, true, false, true, true,vehicle ) then
					dxDrawText(desc:gsub("#%x%x%x%x%x%x",""), sx-(sw/10),sy,sx+(sw/10),sy, tocolor(255,255,255,alpha), 1.0, "default", "center","center",false,true)
				end
			end
		end
	end
end)

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), 
    function()
        for k, v in ipairs(getElementsByType("player")) do
            setPlayerNametagShowing ( v, false )
        end
    end
)

addEventHandler("onClientPlayerJoin", root, 
--addEventHandler("onClientPlayerSpawn", getRootElement(), 
    function()
        setPlayerNametagShowing ( source, false )
    end
)

fileDelete("nametags_c.lua")
