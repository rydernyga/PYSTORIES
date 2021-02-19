addEventHandler("onResourceStart", resourceRoot, 
function ()
	if getResourceState(getResourceFromName("freecam")) ~= "running" then
		cancelEvent()
		--outputChatBox("#00FF00Mar#FFFF00shme#00FF00l#FF59F0lo#FFFFFF: start the freecam script first !", root, 0, 0, 0, true)
	end
end
)