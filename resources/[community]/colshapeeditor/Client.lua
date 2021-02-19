local Activeable = false
local isToolInUse = false
local DefaultSpeed = .50
local ScreenX, ScreenY = guiGetScreenSize()
local NormalX, NormalY = (ScreenX - 826 + 625), (ScreenY - 450)
local OtherX, OtherY = (ScreenX - 826 + 490), (ScreenY - 450)
local CurrentVariableKey = 0
local ControlledElement
local DefaultValues = {CircleRadius = 10, CubeW = 10, CubeD = 10, CubeH = 10, RecW = 5, RecH = 5, SphereRadius = 10, TubeRadius = 10, TubeH = 10}
local CircleRadius = 10
local CubeW, CubeD, CubeH = 10, 10, 10
local RecW, RecH = 5, 5
local SphereRadius = 10
local TubeRadius, TubeH = 10, 10
local CollisionTable, PressedKeys, AllowedButtons, Types = {}, {}, {["num_sub"] = true; ["num_8"] = true; ["num_2"] = true; ["num_6"] = true; ["num_4"] = true; ["num_add"] = true; ["lshift"] = true; ["lalt"] = true; ["arrow_l"] = true; ["arrow_u"] = true; ["arrow_r"] = true; ["arrow_d"] = true; ["pgup"] = true; ["pgdn"] = true}, {"Circle", "Cuboid", "Rectangle", "Sphere", "Tube", "Polygon(Soon)"}

setDevelopmentMode(true)
function getColShapeType(Element) if isElement(Element) then return getElementData(Element, "ColEditor:Type") else return nil end end
function isTableEmpty(Table) local N = 0 for Key, Value in pairs(Table) do N = N + 1 end return N ~= 0 end
function centerWindow(center_window) local screenW, screenH = guiGetScreenSize() local windowW, windowH = guiGetSize(center_window, false) local x, y = (screenW - windowW) /2,(screenH - windowH) /2 return guiSetPosition(center_window, x, y, false) end

ToolBox = guiCreateWindow(NormalX, NormalY, 192, 387, "Col Editor", false)
guiWindowSetSizable(ToolBox, false)
guiSetVisible(ToolBox, false)
guiSetAlpha(ToolBox, 1.00)

Create = guiCreateButton(9, 26, 173, 40, "Stworz >", false, ToolBox)
Delete = guiCreateButton(9, 76, 173, 40, "Usun >", false, ToolBox)
Delete_All = guiCreateButton(9, 126, 173, 40, "Usun Wszystko", false, ToolBox)
Code = guiCreateButton(9, 176, 173, 40, "Kod", false, ToolBox)
Element_Info = guiCreateButton(9, 226, 173, 40, "Sprawdz Informacje", false, ToolBox)
Select = guiCreateButton(9, 276, 173, 40, "Zaznacz >", false, ToolBox)
Close = guiCreateButton(9, 326, 173, 40, "Zamknij", false, ToolBox)

ColList = guiCreateGridList((ScreenX - 770 + 625), (ScreenY - 450), 142, 281, false)
guiGridListAddColumn(ColList, "Collision Type", 0.9)
guiSetVisible(ColList, false)

CreatedList = guiCreateGridList((ScreenX - 770 + 625), (ScreenY - 450), 142, 281, false)
guiGridListAddColumn(CreatedList, "Collision", 0.9)
guiSetVisible(CreatedList, false)

SelectList = guiCreateGridList((ScreenX - 770 + 625), (ScreenY - 450), 142, 281, false)
guiGridListAddColumn(SelectList, "Collision", 0.9)
guiSetVisible(SelectList, false)

Code_output = guiCreateWindow(195, 224, 549, 396, "Code Output", false)
guiWindowSetSizable(Code_output, false)
guiSetVisible(Code_output, false)
guiSetAlpha(Code_output, 1.00)

Code_Memo = guiCreateMemo(9, 26, 530, 317, "", false, Code_output)
guiMemoSetReadOnly(Code_Memo, true)
Code_Copy = guiCreateButton(9, 353, 70, 25, "Copy", false, Code_output)
Code_Close = guiCreateButton(89, 353, 70, 25, "Close", false, Code_output)

addEventHandler("onClientGUIClick", root, 
function ()
	if source == Code_Close then
		guiSetVisible(Code_output, false)
	elseif source == Code_Copy then
		setClipboard(guiGetText(Code_Memo))
		--outputChatBox("#00FF00Mar#FFFF00shme#00FF00l#FF59F0lo#FFFFFF: The Code Was Copied To Clipboard", 0, 0, 0, true)
	elseif source == Code then
		guiSetVisible(Code_output, not guiGetVisible(Code_output))
	end
end
)
	
for Key, Value in ipairs(Types) do
	local Row = guiGridListAddRow(ColList)
	guiGridListSetItemText(ColList, Row, 1, Value, false, false)
end

bindKey("lctrl", "both", 
function (K, state)
	if state == "down" then
		Activeable = true
	elseif state == "up" then
		Activeable = false
	end
end
)

bindKey("c", "down", 
function ()
	if Activeable == true then
		if getResourceState(getResourceFromName("freecam")) == "running" then
			if not exports["freecam"]:isFreecamEnabled() then
				exports["freecam"]:setFreecamEnabled()
				isToolInUse = true
				guiSetVisible(ToolBox, true)
				setElementFrozen(localPlayer, true)
				for Key, Value in ipairs(getElementsByType("gui-button", resourceRoot)) do
					guiSetEnabled(Value, isCursorShowing())
				end
				for Key, Value in ipairs(getElementsByType("gui-gridlist", resourceRoot)) do
					guiSetEnabled(Value, isCursorShowing())
				end
			else
				exports["freecam"]:setFreecamDisabled()
				setCameraTarget(localPlayer)
				showCursor(false)
				isToolInUse = false
				guiSetVisible(ToolBox, false)
				guiSetVisible(Code_output, false)
				setElementFrozen(localPlayer, false)
				guiSetPosition(ToolBox, NormalX, NormalY, false)
				guiSetVisible(CreatedList, false)
				guiSetVisible(ColList, false)
				guiSetText(Delete, "Delete >")
				guiSetText(Create, "Create >")
				guiSetText(Select, "Select >")
				for Key, Value in ipairs(getElementsByType("gui-button", resourceRoot)) do
					guiSetEnabled(Value, isCursorShowing())
				end
				for Key, Value in ipairs(getElementsByType("gui-gridlist", resourceRoot)) do
					guiSetEnabled(Value, isCursorShowing())
				end
			end
		end
	end
end
)

addEventHandler("onClientKey", root, 
function (Button, pressed)
	if AllowedButtons[Button] then
		if pressed then
			PressedKeys[Button] = true
		else
			PressedKeys[Button] = false
		end
	end
end
)

function getColFromTable(Element)
	for Key, Value in pairs(CollisionTable) do
		if Value == Element then
			return Key
		end
	end
end
--[[if PressedKeys["arrow_d"] then
Front["x"]
local X, Y, Z = getElementPosition(ControlledElement)
setElementPosition(ControlledElement, X - (Front["x"] DefaultSpeed) , Y - (Front["y"] DefaultSpeed), Z)
updateCode()
end
if PressedKeys["arrow_l"] then
local X, Y, Z = getElementPosition(ControlledElement)
setElementPosition(ControlledElement, X+ (Left["x"]*DefaultSpeed), Y + (Left["y"]*DefaultSpeed), Z)
updateCode()
end
if PressedKeys["arrow_r"] then
local X, Y, Z = getElementPosition(ControlledElement)
setElementPosition(ControlledElement, X- (Left["x"]*DefaultSpeed), Y -  (Left["y"]*DefaultSpeed), Z)
updateCode()
end
if PressedKeys["arrow_u"] then
local X, Y, Z = getElementPosition(ControlledElement)
setElementPosition(ControlledElement, X + (Front["x"]*DefaultSpeed), Y+(Front["y"]*DefaultSpeed), Z)
updateCode()   
end]]
addEventHandler("onClientRender", root, 
function ()
	local Front, Right = getCamera()["matrix"]["forward"], getCamera()["matrix"]["right"]
	if isElement(ControlledElement) then
		if PressedKeys["lalt"] then
			DefaultSpeed = .10
		elseif PressedKeys["lshift"] then
			DefaultSpeed = 1.70
		else
			DefaultSpeed = .50
		end
		if PressedKeys["arrow_d"] then
			local X, Y, Z = getElementPosition(ControlledElement)
			setElementPosition(ControlledElement, X - (Front["x"] * DefaultSpeed), Y - (Front["y"] * DefaultSpeed), Z)
			updateCode()
		end
		if PressedKeys["arrow_r"] then
			local X, Y, Z = getElementPosition(ControlledElement)
			setElementPosition(ControlledElement, X + (Right["x"] * DefaultSpeed), Y + (Right["y"] * DefaultSpeed), Z)
			updateCode()
		end
		if PressedKeys["arrow_l"] then
			local X, Y, Z = getElementPosition(ControlledElement)
			setElementPosition(ControlledElement, X - (Right["x"] * DefaultSpeed), Y -  (Right["y"] * DefaultSpeed), Z)
			updateCode()
		end
		if PressedKeys["arrow_u"] then
			local X, Y, Z = getElementPosition(ControlledElement)
			setElementPosition(ControlledElement, X + (Front["x"] * DefaultSpeed), Y + (Front["y"] * DefaultSpeed), Z)
			updateCode()			
		end
		if PressedKeys["pgup"] then
			local X, Y, Z = getElementPosition(ControlledElement)
			setElementPosition(ControlledElement, X, Y, Z + DefaultSpeed)
			updateCode()
		end
		if PressedKeys["pgdn"] then
			local X, Y, Z = getElementPosition(ControlledElement)
			setElementPosition(ControlledElement, X, Y, Z - DefaultSpeed)
			updateCode()
		end
		if PressedKeys["num_add"] then
			local X, Y, Z = getElementPosition(ControlledElement)
			if getColShapeType(ControlledElement) == "Circle" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				CircleRadius = CircleRadius + DefaultSpeed > 0 and CircleRadius + DefaultSpeed or 0
				ControlledElement = createColCircle(X, Y, CircleRadius + DefaultSpeed)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Circle")
				setElementData(ControlledElement, "ColEditor:Additional", {CircleRadius})
			elseif getColShapeType(ControlledElement) == "Sphere" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				SphereRadius = SphereRadius + DefaultSpeed > 0 and SphereRadius + DefaultSpeed or 0
				ControlledElement = createColSphere(X, Y, Z, SphereRadius + DefaultSpeed)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Sphere")
				setElementData(ControlledElement, "ColEditor:Additional", {SphereRadius})
			elseif getColShapeType(ControlledElement) == "Cuboid" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				CubeW, CubeD, CubeH = CubeW, CubeD, CubeH + DefaultSpeed
				ControlledElement = createColCuboid(X, Y, Z, CubeW, CubeD, CubeH)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Cuboid")
				setElementData(ControlledElement, "ColEditor:Additional", {CubeW, CubeD, CubeH})
			elseif getColShapeType(ControlledElement) == "Tube" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				TubeRadius, TubeH = TubeRadius + DefaultSpeed, TubeH
				ControlledElement = createColTube(X, Y, Z, TubeRadius, TubeH)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Tube")
				setElementData(ControlledElement, "ColEditor:Additional", {TubeRadius, TubeH})
			elseif getColShapeType(ControlledElement) == "Rectangle" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				RecW, RecH = RecW + DefaultSpeed > 0 and RecW + DefaultSpeed or 0, RecH
				ControlledElement = createColRectangle(X, Y, RecW, RecH)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Rectangle")
				setElementData(ControlledElement, "ColEditor:Additional", {RecW, RecH})
			end
		elseif PressedKeys["num_sub"] then
			local X, Y, Z = getElementPosition(ControlledElement)
			if getColShapeType(ControlledElement) == "Circle" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				CircleRadius = CircleRadius - DefaultSpeed
				ControlledElement = createColCircle(X, Y, CircleRadius)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Circle")
				setElementData(ControlledElement, "ColEditor:Additional", {CircleRadius})
			elseif getColShapeType(ControlledElement) == "Sphere" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				SphereRadius = SphereRadius - DefaultSpeed
				ControlledElement = createColSphere(X, Y, Z, SphereRadius)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Sphere")
				setElementData(ControlledElement, "ColEditor:Additional", {SphereRadius})
			elseif getColShapeType(ControlledElement) == "Cuboid" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				CubeW, CubeD, CubeH = CubeW, CubeD, CubeH - DefaultSpeed
				ControlledElement = createColCuboid(X, Y, Z, CubeW, CubeD, CubeH)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Cuboid")
				setElementData(ControlledElement, "ColEditor:Additional", {CubeW, CubeD, CubeH})
			elseif getColShapeType(ControlledElement) == "Tube" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				TubeRadius, TubeH = TubeRadius - DefaultSpeed > 0 and TubeRadius - DefaultSpeed or 0, TubeH
				ControlledElement = createColTube(X, Y, Z, TubeRadius, TubeH)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Tube")
				setElementData(ControlledElement, "ColEditor:Additional", {TubeRadius, TubeH})
			elseif getColShapeType(ControlledElement) == "Rectangle" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				RecW, RecH = RecW - DefaultSpeed, RecH
				ControlledElement = createColRectangle(X, Y, RecW, RecH)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Rectangle")
				setElementData(ControlledElement, "ColEditor:Additional", {RecW, RecH})
			end
		elseif PressedKeys["num_8"] then
			local X, Y, Z = getElementPosition(ControlledElement)
			if getColShapeType(ControlledElement) == "Cuboid" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				CubeW, CubeD, CubeH = CubeW, CubeD + DefaultSpeed, CubeH
				ControlledElement = createColCuboid(X, Y, Z, CubeW, CubeD, CubeH)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Cuboid")
				setElementData(ControlledElement, "ColEditor:Additional", {CubeW, CubeD, CubeH})
			elseif getColShapeType(ControlledElement) == "Tube" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				TubeRadius, TubeH = TubeRadius, TubeH + DefaultSpeed
				ControlledElement = createColTube(X, Y, Z, TubeRadius, TubeH)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Tube")
				setElementData(ControlledElement, "ColEditor:Additional", {TubeRadius, TubeH})
			end
		elseif PressedKeys["num_2"] then
			local X, Y, Z = getElementPosition(ControlledElement)
			if getColShapeType(ControlledElement) == "Cuboid" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				CubeW, CubeD, CubeH = CubeW, CubeD - DefaultSpeed > 0 and CubeD - DefaultSpeed or 0, CubeH
				ControlledElement = createColCuboid(X, Y, Z, CubeW, CubeD, CubeH)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Cuboid")
				setElementData(ControlledElement, "ColEditor:Additional", {CubeW, CubeD, CubeH})
			elseif getColShapeType(ControlledElement) == "Tube" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				TubeRadius, TubeH = TubeRadius, TubeH - DefaultSpeed > 0 and TubeH - DefaultSpeed or 0
				ControlledElement = createColTube(X, Y, Z, TubeRadius, TubeH)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Tube")
				setElementData(ControlledElement, "ColEditor:Additional", {TubeRadius, TubeH})
			end
		elseif PressedKeys["num_4"] then
			local X, Y, Z = getElementPosition(ControlledElement)
			if getColShapeType(ControlledElement) == "Cuboid" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				CubeW, CubeD, CubeH = CubeW + DefaultSpeed, CubeD, CubeH
				ControlledElement = createColCuboid(X, Y, Z, CubeW, CubeD, CubeH)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Cuboid")
				setElementData(ControlledElement, "ColEditor:Additional", {CubeW, CubeD, CubeH})
			elseif getColShapeType(ControlledElement) == "Rectangle" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				RecW, RecH = RecW, RecH + DefaultSpeed
				ControlledElement = createColRectangle(X, Y, RecW, RecH)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Rectangle")
				setElementData(ControlledElement, "ColEditor:Additional", {RecW, RecH})
			end
		elseif PressedKeys["num_6"] then
			local X, Y, Z = getElementPosition(ControlledElement)
			if getColShapeType(ControlledElement) == "Cuboid" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				CubeW, CubeD, CubeH = CubeW - DefaultSpeed > 0 and CubeW - DefaultSpeed or 0, CubeD, CubeH
				ControlledElement = createColCuboid(X, Y, Z, CubeW, CubeD, CubeH)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Cuboid")
				setElementData(ControlledElement, "ColEditor:Additional", {CubeW, CubeD, CubeH})
			elseif getColShapeType(ControlledElement) == "Rectangle" then
				local Key = getColFromTable(ControlledElement)
				destroyElement(ControlledElement)
				RecW, RecH = RecW, RecH - DefaultSpeed > 0 and RecH - DefaultSpeed or 0
				ControlledElement = createColRectangle(X, Y, RecW, RecH)
				CollisionTable[Key] = ControlledElement
				setElementData(ControlledElement, "ColEditor:Type", "Rectangle")
				setElementData(ControlledElement, "ColEditor:Additional", {RecW, RecH})
			end
		end
	end
end
)

addEventHandler("onClientGUIClick", root, 
function ()
	if source == Create then
		if guiGetText(Create) == "Create >" then
			guiSetPosition(ToolBox, OtherX, OtherY, false)
			guiSetVisible(ColList, true)
			guiSetText(Create, "Create <")
			if guiGetVisible(CreatedList) then
				guiSetVisible(CreatedList, false)
				guiSetText(Delete, "Delete >")
			end
			if guiGetVisible(SelectList) then
				guiSetVisible(SelectList, false)
				guiSetText(Select, "Select >")
			end
		else
			guiSetPosition(ToolBox, NormalX, NormalY, false)
			guiSetVisible(ColList, false)
			guiSetText(Create, "Create >")
		end
	elseif source == Select then
		if guiGetText(source) == "Select >" then
			guiSetPosition(ToolBox, OtherX, OtherY, false)
			guiSetVisible(SelectList, true)
			guiSetText(Select, "Select <")
			if guiGetVisible(CreatedList) then
				guiSetVisible(CreatedList, false)
				guiSetText(Delete, "Delete >")
			end
			if guiGetVisible(ColList) then
				guiSetVisible(ColList, false)
				guiSetText(Create, "Create >")
			end
		else
			guiSetPosition(ToolBox, NormalX, NormalY, false)
			guiSetVisible(SelectList, false)
			guiSetText(Select, "Select >")
		end
	elseif source == Delete then
		if guiGetText(Delete) == "Delete >" then
			guiSetPosition(ToolBox, OtherX, OtherY, false)
			guiSetVisible(CreatedList, true)
			guiSetText(Delete, "Delete <")
			if guiGetVisible(ColList) then
				guiSetVisible(ColList, false)
				guiSetText(Create, "Create >")
			end
			if guiGetVisible(SelectList) then
				guiSetVisible(SelectList, false)
				guiSetText(Select, "Select >")
			end
			guiGridListClear(CreatedList)
			guiGridListClear(SelectList)
			for Key, Value in pairs(CollisionTable) do
				local Row = guiGridListAddRow(CreatedList)
				guiGridListSetItemText(CreatedList, Row, 1, Key, false, false)
				guiGridListSetItemData(CreatedList, Row, 1, Value)
				local Row2 = guiGridListAddRow(SelectList)
				guiGridListSetItemText(SelectList, Row2, 1, Key, false, false)
				guiGridListSetItemData(SelectList, Row2, 1, Value)
			end
			-- Refresh List
		else
			guiSetPosition(ToolBox, NormalX, NormalY, false)
			guiSetVisible(CreatedList, false)
			guiSetText(Delete, "Delete >")
		end
	elseif source == ColList then
		local Text = guiGridListGetItemText(source, guiGridListGetSelectedItem(source), 1)
		if Text ~= "" and Text ~= "Polygon(Soon)" then
			CircleRadius = 10
			CubeW, CubeD, CubeH = 10, 10, 10
			RecW, RecH = 5, 5
			SphereRadius = 10
			TubeRadius, TubeH = 10, 10					
			local X, Y, Z = getCameraMatrix()	
			local Arguments = Text == "Circle" and "1" or Text == "Cuboid" and "10, 10, 10" or Text == "Rectangle" and "5, 5" or Text == "Sphere" and "10" or Text == "Tube" and "10, 10"
			local CreateColElement = loadstring("return createCol"..Text.."("..((Text ~= "Circle" or Text ~= "Rectangle") and X..", "..Y..", "..Z or X..", "..Y)..", "..Arguments..")")
			ControlledElement = CreateColElement()
			guiSetPosition(ToolBox, NormalX, NormalY, false)
			guiSetVisible(ColList, false)
			guiSetText(Create, "Create >")
			CollisionTable[Text.."Number_"..tostring(CurrentVariableKey)] = ControlledElement
			CurrentVariableKey = CurrentVariableKey + 1
			setElementData(ControlledElement, "ColEditor:Type", Text)
			guiGridListClear(CreatedList)
			guiGridListClear(SelectList)
			for Key, Value in pairs(CollisionTable) do
				local Row = guiGridListAddRow(CreatedList)
				guiGridListSetItemText(CreatedList, Row, 1, Key, false, false)
				guiGridListSetItemData(CreatedList, Row, 1, Value)
				local Row2 = guiGridListAddRow(SelectList)
				guiGridListSetItemText(SelectList, Row2, 1, Key, false, false)
				guiGridListSetItemData(SelectList, Row2, 1, Value)
			end
			setElementData(ControlledElement, "ColEditor:Additional", {Arguments})
			updateCode()
		end
	elseif source == Close then
		exports["freecam"]:setFreecamDisabled()
		setCameraTarget(localPlayer)
		showCursor(false)
		isToolInUse = false
		guiSetVisible(ToolBox, false)
		guiSetVisible(Code_output, false)
		setElementFrozen(localPlayer, false)
		guiSetPosition(ToolBox, NormalX, NormalY, false)
		guiSetVisible(CreatedList, false)
		guiSetVisible(ColList, false)
		guiSetText(Delete, "Delete >")
		guiSetText(Create, "Create >")
	elseif source == Delete_All then
		if isTableEmpty(CollisionTable) then
			for Key, Value in pairs(CollisionTable) do
				destroyElement(Value)
			end
			CollisionTable = {}
			CurrentVariableKey = 0
			guiGridListClear(CreatedList)
			guiGridListClear(SelectList)
			for Key, Value in pairs(CollisionTable) do
				local Row = guiGridListAddRow(CreatedList)
				guiGridListSetItemText(CreatedList, Row, 1, Key, false, false)
				guiGridListSetItemData(CreatedList, Row, 1, Value)
				local Row2 = guiGridListAddRow(SelectList)
				guiGridListSetItemText(SelectList, Row2, 1, Key, false, false)
				guiGridListSetItemData(SelectList, Row2, 1, Value)
			end
			CircleRadius = 10
			CubeW, CubeD, CubeH = 10, 10, 10
			RecW, RecH = 5, 5
			SphereRadius = 10
			TubeRadius, TubeH = 10, 10
			updateCode()
		else
			--outputChatBox("#00FF00Mar#FFFF00shme#00FFFFl#FF59F0lo#FFFFFF: There's Nothing To Remove :D", 0, 0, 0, true)
		end
	elseif source == Element_Info then
		if type(getColShapeType(ControlledElement)) == "string" then
			local X, Y, Z = getElementPosition(ControlledElement)
			local Arguments = table["concat"]({unpack(getElementData(ControlledElement, "ColEditor:Additional"))}, ", ")
			local Type = getColShapeType(ControlledElement)
			--outputChatBox("#00FFFFPosition #0C6EFC: #00FF00[#FFFF00"..X..", "..Y..", "..Z.."#00FF00]", 0, 0, 0, true)
			--outputChatBox("#00FFFFArguments #0C6EFC: #00FF00[#FFFF00"..Arguments.."#00FF00]", 0, 0, 0, true)
			--outputChatBox("#00FFFFType #0C6EFC: #00FF00[#FFFF00"..Type.."#00FF00]", 0, 0, 0, true)
		else
			--outputChatBox("#00FF00Mar#FFFF00shme#00FF00l#FF59F0lo#FFFFFF: There's No A Shape In Control", 0, 0, 0, true)
		end		
	end
end
)

addEventHandler("onClientGUIDoubleClick", root, 
function ()
	if source == CreatedList then
		local Key = guiGridListGetItemText(source, guiGridListGetSelectedItem(source), 1)
		if Key ~= "" then
			destroyElement(CollisionTable[Key])
			CollisionTable[Key] = nil
			guiGridListClear(CreatedList)
			guiGridListClear(SelectList)
			CurrentVariableKey = CurrentVariableKey
			for Key, Value in pairs(CollisionTable) do
				local Row = guiGridListAddRow(CreatedList)
				guiGridListSetItemText(CreatedList, Row, 1, Key, false, false)
				guiGridListSetItemData(CreatedList, Row, 1, Value)
				local Row2 = guiGridListAddRow(SelectList)
				guiGridListSetItemText(SelectList, Row2, 1, Key, false, false)
				guiGridListSetItemData(SelectList, Row2, 1, Value)
			end
			updateCode()
		end
	elseif source == SelectList then	
		local Key = guiGridListGetItemText(source, guiGridListGetSelectedItem(source), 1)
		if Key ~= "" then
			ControlledElement = CollisionTable[Key]
			local Additional = getElementData(ControlledElement, "ColEditor:Additional")
			if getColShapeType(ControlledElement) == "Circle" then
				CircleRadius = Additional[1]
			elseif getColShapeType(ControlledElement) == "Cuboid" then
				CubeW, CubeD, CubeH = unpack(Additional)
			elseif getColShapeType(ControlledElement) == "Rectangle" then
				RecW, RecH = unpack(Additional)
			elseif getColShapeType(ControlledElement) == "Tube" then
				TubeRadius, TubeH = unpack(Additional)
			end
		end
	end
end
)

bindKey("f", "down", 
function ()
	if isToolInUse then
		local State = not isCursorShowing()
		showCursor(State)
		for Key, Value in ipairs(getElementsByType("gui-button", resourceRoot)) do
			guiSetEnabled(Value, State)
		end
		for Key, Value in ipairs(getElementsByType("gui-gridlist", resourceRoot)) do
			guiSetEnabled(Value, isCursorShowing())
		end
	end
end
)

local CodeStart, CodeEnd = [[addEventHandler("onResourceStart", resourceRoot, 
function ()]], [[end
)]]

addEventHandler("onClientElementDataChange", root, 
function (Data)
	if Data == "ColEditor:Additional" then
		updateCode()
	end
end
)

function updateCode()
	local Code = ""
	for Variable, CollisionShape in pairs(CollisionTable) do
		local Type, Arguments = getElementData(CollisionShape, "ColEditor:Type"), getElementData(CollisionShape, "ColEditor:Additional")
		local X, Y, Z = getElementPosition(CollisionShape)
		local Position = (Type == "Circle" or Type == "Rectangle") and table["concat"]({X, Y}, ", ") or table["concat"]({getElementPosition(CollisionShape)}, ", ") or 
		outputChatBox(Position)
		Code = Code.."\n	"..Variable.." = createCol"..Type.."("..Position..", "..table["concat"]({unpack(Arguments)}, ", ")..")"
	end
	Code = CodeStart..""..Code.."\n"..CodeEnd
	guiSetText(Code_Memo, Code)
end

updateCode()