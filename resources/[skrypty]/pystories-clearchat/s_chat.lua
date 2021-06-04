--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

-- Clear Chat @Administracji
addCommandHandler("cc",
    function (player, _, ...)
        if getElementData(player, "player:admin", true) then
            local reason = table.concat({...}, " ")
            local name = getPlayerName(player)
            
            for i = 1, 1000 do
                outputChatBox(" ")
            end
            
            outputChatBox("** Chat został wyczyszczony przez ".. name .."#ff0000, Powód: ".. reason, root, 255, 0, 0)
        end
    end
)
