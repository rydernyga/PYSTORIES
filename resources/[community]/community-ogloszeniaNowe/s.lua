
local skrzyniaogloszen = createObject(980, 0, 0, -100)
setElementDimension(skrzyniaogloszen, 1000)
setElementInterior(skrzyniaogloszen, 1000)

function ogloszenie ( source, cmd, ... )
if not getElementData(source,"player:premium") then outputChatBox("* Brak uprawnień do ogłoszeń !",source,255,0,0) return end
	if ... then
		if not getElementData ( skrzyniaogloszen, "ogloszenie" ) then
			local text = table.concat({...}, " " )
			setElementData ( skrzyniaogloszen, "ogloszenie", true )
			setElementData ( skrzyniaogloszen, "tekstogloszenia","#C0FF00(Premium)\n#FFFFFF[#C0FF00"..getElementData(source,"id").."#FFFFFF] #C0FF00"..getPlayerName(source):gsub("#%x%x%x%x%x%x","").."#FFFFFF:\n#FFFFFF"..text:gsub("#%x%x%x%x%x%x","").."")
			setTimer ( setElementData, 15000,1, skrzyniaogloszen, "ogloszenie", false )
		else
			outputChatBox("* Ogłoszenia mogą być nadawane minimum 15 sekund.", source, 255, 96, 0, true ) 
		end
	else
		outputChatBox("* Aby nadać ogłoszenie, użyj: /ogloszenie [treść].", source, 255, 96, 0, true ) 
	end
end
addCommandHandler("ogloszenie", ogloszenie)

