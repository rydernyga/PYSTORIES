--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

-- Clear Chat @Administracji
addCommandHandler("cc", function(plr, cmd, ...)
    --local accName = getAccountName ( getPlayerAccount ( plr ) )
        if getElementData(plr,"player:admin",true) then
        local reason = table.concat(arg, " ")
		local name = getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
			
		for i = 1, 1000 do
  			outputChatBox(" ", root)
		end
			
        outputChatBox("** Chat został wyczyszczony przez "..name:gsub("#%x%x%x%x%x%x","")..", Powód: "..reason:gsub("#%x%x%x%x%x%x","").."", getRootElement(), 255, 0, 0)
    end
end)
