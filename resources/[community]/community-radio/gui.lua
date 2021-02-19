showPlayerHudComponent ("radio", false)
local sx,sy = guiGetScreenSize ()
radioListGui = {}
helpGui = {}
local usingGui = false
local usingHelpGui = false
local site = "fotl-clan.ru"

local showingStation = {}
showingStation.show = false

--fonts
radioFonts = {}
radioFonts["0"] = dxCreateFont ("files/def.ttf", 30)
radioFonts["1"] = dxCreateFont ("files/AllOverAgain.ttf", 40)
radioFonts["2"] = dxCreateFont ("files/BIRTH_OF_A_HERO.ttf", 30)
radioFonts["3"] = dxCreateFont ("files/Painted.ttf", 30)
radioFonts["4"] = radioFonts["0"]

fontColor = {}
fontColor["0"] = tocolor(255,255,255)
fontColor["1"] = tocolor(0,50,205)
fontColor["2"] = tocolor(255,255,255)
fontColor["3"] = tocolor(255,255,255)
fontColor["4"] = tocolor(255,255,255)

guiText = {}
guiText.tip = " "
guiText.credits = " "
guiText.wanna = " "

function table.size(tab)
	if tab then
		local length = 0
		for _ in pairs(tab) do length = length + 1 end
		return length
	else
		return false
	end
end

function createRadioListGui ()
	if usingGui == false then
		usingGui = true
		radioListGui.gridLenght = 300
		radioListGui.windowsizeX = 420
		radioListGui.windowsizeY = 85 + radioListGui.gridLenght
		radioListGui.windowX = sx - radioListGui.windowsizeX
		radioListGui.windowY = sy/2 - radioListGui.windowsizeY/2
		radioListGui.gridWidth = (radioListGui.windowsizeX - 14) / 2
		
		radioListGui.window = guiCreateWindow(radioListGui.windowX,radioListGui.windowY,radioListGui.windowsizeX,radioListGui.windowsizeY,"Stacje Radiowe",false)
		
		radioListGui.usedGrid = guiCreateGridList(7,24,radioListGui.gridWidth,radioListGui.gridLenght,false,radioListGui.window)
		guiGridListSetSortingEnabled (radioListGui.usedGrid, false)
		radioListGui.usedColumn = guiGridListAddColumn(radioListGui.usedGrid,"Wybrane Stacje Radiowe",0.87)
		for k,v in ipairs(usedStations) do
			local name = stationsNames[v]
			if name then
				local row = guiGridListAddRow ( radioListGui.usedGrid )
                guiGridListSetItemText (radioListGui.usedGrid, row, radioListGui.usedColumn, name, false, false )
			end
		end
		addEventHandler( "onClientGUIDoubleClick", radioListGui.usedGrid, onGridClick, false )
		
		radioListGui.notUsedGrid = guiCreateGridList(7+radioListGui.gridWidth,24,radioListGui.gridWidth,radioListGui.gridLenght,false,radioListGui.window)
		guiGridListSetSortingEnabled (radioListGui.notUsedGrid, false)
		radioListGui.notUsedColumn = guiGridListAddColumn(radioListGui.notUsedGrid,"Nie Wybrane Stacje Radiowe",0.87)
		for k,v in ipairs(notUsedStations) do
			local name = stationsNames[v]
			if name then
				local row = guiGridListAddRow ( radioListGui.notUsedGrid )
                guiGridListSetItemText (radioListGui.notUsedGrid, row, radioListGui.notUsedColumn, name, false, false )
			end
		end
		addEventHandler( "onClientGUIDoubleClick", radioListGui.notUsedGrid, onGridClick, false )
		
		radioListGui.closeButton = guiCreateButton(radioListGui.windowsizeX - 70,58 + radioListGui.gridLenght,70,25,"Zamknij",false,radioListGui.window)
		addEventHandler ( "onClientGUIClick",radioListGui.closeButton, createRadioListGui, false )
		radioListGui.scroll = guiCreateScrollBar (60, 32 + radioListGui.gridLenght, radioListGui.windowsizeX - 120, 20, true, false, radioListGui.window)
		guiScrollBarSetScrollPosition (radioListGui.scroll, volume)
		radioListGui.volumeLabel = guiCreateLabel (14, 32 + radioListGui.gridLenght, 70, 22, "Głośność", false, radioListGui.window)
		radioListGui.volumeLabel2 = guiCreateLabel (60 + radioListGui.windowsizeX - 110, 32 + radioListGui.gridLenght, 50, 22, volume .. "%", false, radioListGui.window)
		radioListGui.infoLabel = guiCreateLabel (14, 58 + radioListGui.gridLenght, 28, 25, " ", false, radioListGui.window)
		radioListGui.creditsLabel = guiCreateLabel (50, 58 + radioListGui.gridLenght, 40, 25, " ", false, radioListGui.window)
		radioListGui.wantLabel = guiCreateLabel (110, 58 + radioListGui.gridLenght, 110, 25, " ", false, radioListGui.window)
		showCursor (true)
		guiWindowSetSizable (radioListGui.window, false)
		guiWindowSetMovable (radioListGui.window, false)
	else
		usedStationsCount = table.size (usedStations)
		destroyElement (radioListGui.window)
		radioListGui = {}
		createHelpWindow (false)
		showCursor (false)
		usingGui = false
	end
end
addCommandHandler ("stations", createRadioListGui)
addCommandHandler ("station", createRadioListGui)
addCommandHandler ("radio", createRadioListGui)

function createHelpWindow (state,x,y,sx,sy,txt,align)
	if state == true then
		if usingHelpGui == true then
			createHelpWindow (false)
		end
		if align ~= "center" and align ~= "left" and align ~= "right" then
			align = "left"
		end
		if x and y and sx and sy and txt then
			helpGui.window = guiCreateGridList (x,y,sx,sy,false)
			guiSetAlpha (helpGui.window, 0.8)
			helpGui.label = guiCreateLabel (10,5,sx-20,sy-5,txt,false,helpGui.window)
			guiLabelSetHorizontalAlign (helpGui.label, align, true)
			usingHelpGui = true
		end
	elseif state == false then
		if usingHelpGui == true then
			destroyElement (helpGui.window)
			usingHelpGui = false
			usingHelpGui = {}
		end
	end
end

addEventHandler("onClientGUIScroll",getRootElement(),
	function (scrolled)
		if scrolled == radioListGui.scroll then
			volume = guiScrollBarGetScrollPosition (scrolled)
			if radioListGui.volumeLabel2 then
				guiSetText (radioListGui.volumeLabel2, volume .. "%")
			end
			if currentStation then
				setSoundVolume (currentStation, volume/100)
			end
		end
	end
)

addEventHandler( "onClientMouseEnter", getRootElement(), 
    function(aX, aY)
        if source == radioListGui.infoLabel then
			guiLabelSetColor (source, 0,220,25)
			local helpWindowWidth = radioListGui.windowsizeX/1.75
			local helpWindowHeight = 85
			createHelpWindow (true, radioListGui.windowX - helpWindowWidth, radioListGui.windowY + radioListGui.windowsizeY -  helpWindowHeight, helpWindowWidth, helpWindowHeight, guiText.tip)
		elseif source == radioListGui.creditsLabel then
			guiLabelSetColor (source, 0,220,25)
			local helpWindowWidth = radioListGui.windowsizeX/1.75
			local helpWindowHeight = 190
			createHelpWindow (true, radioListGui.windowX - helpWindowWidth, radioListGui.windowY + radioListGui.windowsizeY -  helpWindowHeight, helpWindowWidth, helpWindowHeight, guiText.credits, "center")
		elseif source == radioListGui.wantLabel then
			guiLabelSetColor (source, 0,220,25)
			local helpWindowWidth = radioListGui.windowsizeX/1.75
			local helpWindowHeight = 40
			createHelpWindow (true, radioListGui.windowX - helpWindowWidth, radioListGui.windowY + radioListGui.windowsizeY -  helpWindowHeight, helpWindowWidth, helpWindowHeight, guiText.wanna, "center")
		end	
    end
)

addEventHandler("onClientMouseLeave", getRootElement(), 
	function(aX, aY)
		if source == radioListGui.infoLabel then
			guiLabelSetColor (source, 255,255,255)
			createHelpWindow (false)
		elseif source == radioListGui.creditsLabel then
			guiLabelSetColor (source, 255,255,255)
			createHelpWindow (false)
		elseif source == radioListGui.wantLabel then
			guiLabelSetColor (source, 255,255,255)
			createHelpWindow (false)
		end
	end
)

--Double click on station to switch it on another side

function onGridClick (button, state, x,y)
	if button == "left" and state == "up" then
		if source == radioListGui.usedGrid then -- clicked on used radios grid, chaning radio to unused
			local selectedRow, selectedCol = guiGridListGetSelectedItem( source )
			if selectedRow ~= -1 then
				local stName = guiGridListGetItemText( source, selectedRow, selectedCol )
				if stName then
					local stID = getStationID (stName)
					for k,v in ipairs(usedStations) do
						if v == stID then
							table.remove(usedStations,k)
							guiGridListRemoveRow (source,k-1)
							break
						end
					end
					local size = table.size (notUsedStations)
					if stationsNames[stID] == "User Track Player" then
						table.insert(notUsedStations, 1, stID)
						guiGridListClear (radioListGui.notUsedGrid)
						for k,v in ipairs(notUsedStations) do
							local row = guiGridListAddRow ( radioListGui.notUsedGrid )
							guiGridListSetItemText (radioListGui.notUsedGrid, row, radioListGui.notUsedColumn, stationsNames[v], false, false )
						end
					else
						local row = guiGridListAddRow ( radioListGui.notUsedGrid )
						guiGridListSetItemText (radioListGui.notUsedGrid, row, radioListGui.notUsedColumn, stName, false, false )
						table.insert(notUsedStations, size+1, stID)
					end
					usedStationsCount = usedStationsCount - 1
				end
			end
		end
		if source == radioListGui.notUsedGrid then
			local selectedRow, selectedCol = guiGridListGetSelectedItem( source )
			if selectedRow ~= -1 then
				local stName = guiGridListGetItemText( source, selectedRow, selectedCol )
				if stName then
					local stID = getStationID (stName)
					for k,v in ipairs(notUsedStations) do
						if v == stID then
							table.remove(notUsedStations,k)
							guiGridListRemoveRow (source,k-1)
							break
						end
					end
					local size = table.size (usedStations)
					if stationsNames[stID] == "User Track Player" then
						table.insert(usedStations, 1, stID)
						guiGridListClear (radioListGui.usedGrid)
						for k,v in ipairs(usedStations) do
							local row = guiGridListAddRow ( radioListGui.usedGrid )
							guiGridListSetItemText (radioListGui.usedGrid, row, radioListGui.usedColumn, stationsNames[v], false, false )
						end
					else
						local row = guiGridListAddRow ( radioListGui.usedGrid )
						guiGridListSetItemText (radioListGui.usedGrid, row, radioListGui.usedColumn, stName, false, false )
						table.insert(usedStations, size+1, stID)
					end
					usedStationsCount = usedStationsCount + 1
				end
			end
		end
	end
end

--radio text animation--
------------------------

function showStationText (txt, typ)
	if showingStation.show == 1 then
		removeEventHandler ("onClientRender", getRootElement(), renderStationText1)
	elseif showingStation.show == 2 then
		removeEventHandler ("onClientRender", getRootElement(), renderStationText2)
	elseif showingStation.show == 3 then
		removeEventHandler ("onClientRender", getRootElement(), renderStationText3)
	end
	g_station = {}
	g_station.type = tostring(typ)
	if txt and g_station.type then
		showingStation.show = 1
		g_station.size = 1
		local width = dxGetTextWidth (txt,g_station.size,radioFonts[g_station.type])
		if width then
			g_station.txt = txt
			g_station.startPos = {-width-1, 80}
			g_station.startTime = getTickCount()
			g_station.middlePos1 = {sx/2-width/2-80, 80}
			g_station.middlePos2 = {sx/2-width/2+80, 80}
			g_station.endPos = {sx+width+1, 80}
			g_station.endTime = g_station.startTime + 600
			
			addEventHandler ("onClientRender", getRootElement(), renderStationText1)
		else
			outputChatBox ("error, font: " .. radioFonts[g_station.type])
		end
	end
end

function renderStationText1 ()
	local now = getTickCount()
	local elapsedTime = now - g_station.startTime
	local duration = g_station.endTime - g_station.startTime
	local progress = elapsedTime / duration
 
	local sx1, sy1 = unpack(g_station.startPos)
	local ex2, ey2 = unpack(g_station.middlePos1)
	local cx, cy = interpolateBetween ( 
		sx1, sy1, 0,
		ex2, ey2, 0,
		progress, "OutQuad")
 
	dxDrawText (g_station.txt,cx+1,cy+1,cx+1,cy+1,0xFF000000,g_station.size,radioFonts[g_station.type])
	dxDrawText (g_station.txt,cx,cy,cx,cy,fontColor[g_station.type],g_station.size,radioFonts[g_station.type])
 
	if now >= g_station.endTime then
		removeEventHandler ("onClientRender", getRootElement(), renderStationText1)
		showingStation.show = 2
		g_station.startTime = getTickCount()
		g_station.endTime = g_station.startTime + 1200
		addEventHandler ("onClientRender", getRootElement(), renderStationText2)
	end
end

function renderStationText2 ()
	local now = getTickCount()
	local elapsedTime = now - g_station.startTime
	local duration = g_station.endTime - g_station.startTime
	local progress = elapsedTime / duration
 
	local sx1, sy1 = unpack(g_station.middlePos1)
	local ex2, ey2 = unpack(g_station.middlePos2)
	local cx, cy = interpolateBetween ( 
		sx1, sy1, 0,
		ex2, ey2, 0,
		progress, "Linear")
 
	dxDrawText (g_station.txt,cx+1,cy+1,cx+1,cy+1,0xFF000000,g_station.size,radioFonts[g_station.type])
	dxDrawText (g_station.txt,cx,cy,cx,cy,fontColor[g_station.type],g_station.size,radioFonts[g_station.type])
 
	if now >= g_station.endTime then
		removeEventHandler ("onClientRender", getRootElement(), renderStationText2)
		showingStation.show = 3
		g_station.startTime = getTickCount()
		g_station.endTime = g_station.startTime + 600
		addEventHandler ("onClientRender", getRootElement(), renderStationText3)
	end
end

function renderStationText3 ()
	local now = getTickCount()
	local elapsedTime = now - g_station.startTime
	local duration = g_station.endTime - g_station.startTime
	local progress = elapsedTime / duration
 
	local sx1, sy1 = unpack(g_station.middlePos2)
	local ex2, ey2 = unpack(g_station.endPos)
	local cx, cy = interpolateBetween ( 
		sx1, sy1, 0,
		ex2, ey2, 0,
		progress, "InQuad")
 
	dxDrawText (g_station.txt,cx+1,cy+1,cx+1,cy+1,0xFF000000,g_station.size,radioFonts[g_station.type])
	dxDrawText (g_station.txt,cx,cy,cx,cy,fontColor[g_station.type],g_station.size,radioFonts[g_station.type])
 
	if now >= g_station.endTime then
		removeEventHandler ("onClientRender", getRootElement(), renderStationText3)
		showingStation.show = false
	end
end