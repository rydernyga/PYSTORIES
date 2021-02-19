function ustawAntyKilla(thePlayer)
if getElementData(thePlayer,"player:admin",true) then
        if getElementData(thePlayer,"admin:antykill") then
            setElementData(thePlayer,"admin:antykill",false)
            outputChatBox("* Nieśmiertelność wyłączona.",thePlayer)
        else
            setElementData(thePlayer,"admin:antykill",true)
            outputChatBox("* Nieśmiertelność włączona.",thePlayer)
            end
        end
    end
addCommandHandler("god",ustawAntyKilla)