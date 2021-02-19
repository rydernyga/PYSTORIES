--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

-- Dalsza częśc funkcji główna
addEvent("onDryerAction", true)
addEventHandler("onDryerAction", root, function(typ,selected,el)
    if not el or not selected then return end
    if typ == "player" then
	
        if selected == 1 then
            local x,y,z=getElementPosition(source)
            setElementPosition(el,x,y,z)
            outputChatBox("* Przeniosłeś(aś) gracza do siebie.", source)
        end
		
        if selected == 2 then
            setElementPosition(el, -1916.08, 883.15, 35.41)
            outputChatBox("* Pomyślnie przeładowano gracza.", source)
        end
		
        if selected == 3 then
        	setElementHealth(el, 100)
        	outputChatBox("* Pomyślnie uleczono gracza.", source)
        end
		
        if selected == 4 then
        	local x,y,z=getElementPosition(el)
        	setElementPosition(source,x,y,z)
        	outputChatBox("* Przeniosłeś(aś) siebie do gracza.", source)
        end
		
    end
    if typ == "vehicle" then
	
        if selected == 1 then
            _,_,rz=getElementRotation(el)
            fixVehicle(el)
            setElementHealth(el,1000)
            setElementRotation(el,0,0,rz)
            outputChatBox("* Naprawiłeś(aś) pojazd.", source)
        end
		
        if selected == 2 then
            if getElementData(el,"vehicle:spawn") then
            	exports["pystories-vehicles"]:onSaveVehicle(el)
                local query=exports["pystories-db"]:dbSet("UPDATE pystories_vehicles SET parking=1 WHERE id=?", getElementData(el,"vehicle:id"))
                if query then
                    destroyElement(el)
                    outputChatBox("* Pomyślnie oddano pojazd na parking.", source)
                end
            else
                outputChatBox("* Ten pojazd nie jest prywatny, użyj opcji 'Respawnuj Pojazd(usun)'", source, 255, 0, 0)
            end
        end
		
        if selected == 3 then
            if not getElementData(el,"vehicle:spawn") then
				if getElementData(el,"spawnowany") then
					destroyElement(el)
					outputChatBox("* Pomyślnie usunięto pojazd.", source)
				else
					respawnVehicle(el)
					outputChatBox("* Pomyślnie zrespawnowano pojazd.", source)
				end
            else
				--exports["pystories-vehicles"]:onSaveVehicle(el)
            	--exports["pystories-vehicles"]:onParkVehicle(el)
				outputChatBox("* Pomyślnie oddano pojazd na parking.", source)
                outputChatBox("* Ten pojazd jest prywatny, użyj opcji 'Oddaj na parking'", source, 255, 0, 0)
            end
        end
		
        if selected == 4 then
            local x,y,z=getElementPosition(source)
            setElementPosition(el,x,y,z-0.6)
            outputChatBox("* Pomyślnie przeniesiono pojazd.", source)
        end
		
        if selected == 5 then
            if getElementData(el,"vehicle:fuel") and getElementData(el,"vehicle:fuel") < 100 then
                setElementData(el,"vehicle:fuel",100)
                outputChatBox("* Pomyślnie zatankowano pojazd.", source)
			end
		end
		
	end    
end)
