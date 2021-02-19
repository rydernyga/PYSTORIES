function addNotification(player, text, time) 
	if isElement(player) and getElementType(player) == "player" and type(text) == "string" then 
		triggerClientEvent(player, "onClientAddNotification", player, text, time)
		return true 
	else 
		return false
	end
end 