wejscieUrzad = createMarker(-176.25, 1112.20, 19.74, "cylidner", 1, 255,255,0,255)
wyjscieUrzad = createMarker(-8006.7002, 932.7002, 73.8, "cylidner", 1, 255,255,0,255)

addEventHadler("onMarkerHit", wejscieUrzad, function(el,md)
     setElementPosition(el, -8006.7002, 932.7002, 730.8)
	 outputChatBox("* Witaj w urzędzie miasta !", el)
end)

addEventHadler("onMarkerHit", wyjscieUrzad, function(el,md)
     setElementPosition(el, -178.38, 1110.25, 19.74)
	 outputChatBox("* Witaj przed urzędem miasta !", el)
end)