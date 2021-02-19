local dwa = createElement("ogloszenia")

function ogloszenie ( source, cmd, ... )
if not getElementData(source,"player:premium") then outputChatBox("Nie posiadasz aktywnego statusu premium!",source,255,0,0) return end
	if ... then
		if not getElementData ( dwa, "ogloszenie" ) then
			local text = table.concat({...}, " " )
			setElementData ( dwa, "ogloszenie", true )
			outputChatBox("#FFA500> "..getPlayerName(source):gsub("#%x%x%x%x%x%x","").." ("..getElementData ( source, "id").."):#FFFFFF "..text.."", root, 255, 255, 255, true)
			setTimer(function()
			setElementData(dwa, "ogloszenie", false)
			end,15000,1)
		else
			outputChatBox("* Ogłoszenia mogą być nadawane minimum co 15 sekund", source, 255, 255, 255, true ) 

		end
	else
		outputChatBox("* Aby nadać ogłoszenie użyj /ogloszenie [tresc]", source, 255, 255, 255, true ) 
	end
end
addCommandHandler("ogloszenie", ogloszenie)

