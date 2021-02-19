local marker=createMarker(-3654.42, 470.01, 1.76+1, "arrow", 1.5, 255, 255, 0)
addEventHandler("onMarkerHit", marker, function(el,md)
	if getElementType(el) == "vehicle" then return end
	if getPedOccupiedVehicle(el) then return end
 setElementPosition(el,-1916.08, 883.15, 35.41)
end) 


