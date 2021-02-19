--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

mojeW,mojeH = 1280, 1024
sW,sH = guiGetScreenSize()
width, height = (sW/mojeW), (sH/mojeH)



GUIEditor = {
    gridlist = {},
    progressbar = {},
    button = {},
    window = {}
}

local cenaCzesci={
	[1025]=1250,
	[1073]=920,
	[1074]=980,
	[1075]=520,
	[1076]=720,
	[1077]=710,
	[1078]=1250,
	[1079]=420,
	[1080]=760,
	[1081]=1020,
	[1082]=400,
	[1083]=570,
	[1084]=800,
	[1085]=1100,
	[1096]=1500,
	[1097]=870,
	[1098]=1000,
--  Stereo
	[1086]=300,
--  Spoilery
	[1000]=2000,
	[1001]=2500,
	[1002]=2000,
	[1003]=2500,
	[1014]=1400,
	[1015]=2000,
	[1016]=2100,
	[1023]=2400,
	[1049]=1540,
	[1050]=1300,
	[1058]=1300,
	[1060]=1750,
	[1138]=3900,
	[1139]=3400,
	[1146]=3000,
	[1147]=3550,
	[1158]=4100,
	[1162]=2900,
	[1163]=2000,
	[1164]=4500, 
--	Progi
	[1036]=1500,
	[1039]=2000,
	[1040]=1870,
	[1041]=2300,
	[1007]=1000,
	[1017]=1000,
	[1026]=1500,
	[1027]=2000,
	[1030]=1500,
	[1031]=2300,
	[1042]=1000,
	[1047]=1890,
	[1048]=1730,
	[1051]=2000,
	[1052]=1800,
	[1056]=1000,
	[1057]=1000,
	[1062]=1000,
	[1063]=1250,
	[1069]=1800,
	[1070]=1500,
	[1071]=1650,
	[1072]=1750,
	[1090]=1750,
	[1093]=1700,
	[1094]=1500,
	[1095]=1000,
	[1099]=1000,
	[1101]=1000,
	[1102]=700,
	[1106]=1000,
	[1107]=1000,
	[1108]=1000,
	[1118]=700,
	[1119]=700,
	[1120]=700,
	[1121]=700,
	[1122]=700,
	[1124]=700,
	[1133]=1000,
	[1134]=1000,
	[1137]=1000,
	
--  Bullbar . . ? [przod]
	[1100]=750,
	[1115]=750,
	[1116]=750,
	[1123]=750,
	[1125]=1000,
--  Bullbar . . ? [tył]
	[1109]=900,
	[1110]=300,
--	Front Sign [figurka itd z przodu]
	[1111]=650,
	[1112]=650,
--	Hydraulika
	[1087]=15100,
--  Wydechy
	[1034]=1900,
	[1037]=2000,
	[1044]=1800,
	[1046]=2000,
	[1018]=1700,
	[1019]=1900,
	[1020]=2000,
	[1021]=1800,
	[1022]=1800,
	[1028]=1900,
	[1029]=2000,
	[1043]=1500,
	[1044]=1000,
	[1045]=1500,
	[1059]=1500,
	[1064]=1200,
	[1065]=1300,
	[1066]=1500,
	[1089]=2000,
	[1092]=1750,
	[1104]=1650,
	[1105]=1450,
	[1113]=1200,
	[1114]=1750,
	[1126]=1000,
	[1127]=1100,
	[1129]=1000,
	[1132]=1500,
	[1135]=1000,
	[1136]=1500,
	
--  Zderzaki [tylni]
	[1149]=4000,
	[1148]=5000,
	[1150]=3000,
	[1151]=3500,
	[1154]=3000,
	[1156]=3000,
	[1159]=3500,
	[1161]=3600,
	[1167]=3000,
	[1168]=2500,
	[1175]=2500,
	[1177]=2500,
	[1178]=2900,
	[1180]=3100,
	[1183]=2700,
	[1184]=3000,
	[1186]=3000,
	[1187]=2600,
	[1192]=2000,
	[1193]=2000,
--  Zderzaki [pzrzód]
	[1171]=3500,
	[1172]=5000,
	[1140]=3500,
	[1141]=5000,
	[1117]=500,
	[1152]=3000,
	[1153]=3500,
	[1155]=3000,
	[1153]=3000,
	[1157]=3000,
	[1160]=4000,
	[1165]=4000,
	[1166]=3000,
	[1169]=3000,
	[1170]=3500,
	[1173]=3500,
	[1174]=2500,
	[1176]=2500,
	[1179]=3500,
	[1181]=2500,
	[1182]=2300,
	[1185]=3000,
	[1188]=3200,
	[1189]=2900,
	[1190]=2500,
	[1191]=2100,
--  Wloty [góra]
	[1035]=3000,
	[1038]=3500,
	[1006]=1960,
	[1032]=3000,
	[1033]=3500,
	[1053]=3500,
	[1054]=3000,
	[1055]=2000,
	[1061]=2000,
	[1068]=3250,
	[1067]=2750,
	[1088]=2300,
	[1091]=3000,
	[1103]=1500,
	[1128]=5000, -- DACH DO BLADE
	[1130]=5000, -- DACH DO SAVANNA
	[1131]=5000, -- DACH DO SAVANNA
--  Wloty [przód]
	[1004]=1400,
	[1005]=1600,
	[1011]=1400,
	[1012]=1600,
	[1142]=1200,
	[1143]=1200,
	[1144]=1000,
	[1145]=1000,
--	Dodatkowe lampy 
	[1013]=700,
	[1024]=800,
	
}

local nazwaCzesci={
	[1025]="Offroad",
	[1073]="Shadow",
	[1074]="Mega",
	[1075]="Rimshine",
	[1076]="Wires",
	[1077]="Classic",
	[1078]="Twist",
	[1079]="Cutter",
	[1080]="Switch",
	[1081]="Grove",
	[1082]="Import",
	[1083]="Dolar",
	[1084]="Trance",
	[1085]="Atomic",
	[1096]="Ahab",
	[1097]="Virtual",
	[1098]="Access",
--  Stereo
	[1086]="Stero",
--  Spoilery
	[1000]="Pro",
	[1001]="Win",
	[1002]="Drag",
	[1003]="Alpha",
	[1014]="Champ",
	[1015]="Race",
	[1016]="Worix",
	[1023]="Furry",
	[1049]="Alien",
	[1050]="X-Flow",
	[1058]="Alien",
	[1060]="X-Flow",
	[1138]="Alien Wentyl",
	[1139]="X-Flow Prog",
	[1146]="Alien wydech",
	[1147]="Alien Prog",
	[1158]="X-Flow",
	[1162]="Alien",
	[1163]="X-Flow",
	[1164]="Alien", 
--	Progi
	[1036]="Alien",
	[1039]="X-Flow",
	[1040]="Alien",
	[1041]="X-Flow",
	[1007]="Czysty",
	[1017]="Czysty",
	[1026]="Alien",
	[1027]="Alien",
	[1030]="X-Flow",
	[1031]="X-Flow",
	[1042]="Chrome",
	[1047]="Alien",
	[1048]="X-Flow",
	[1051]="Alien",
	[1052]="X-Flow",
	[1056]="Alien",
	[1057]="X-Flow",
	[1062]="Alien",
	[1063]="X-Flow",
	[1069]="Alien",
	[1070]="X-Flow",
	[1071]="Alien",
	[1072]="X-Flow",
	[1090]="Alien",
	[1093]="X-Flow",
	[1094]="Alien",
	[1095]="X-Flow",
	[1099]="Chrome",
	[1101]="Chrome Flames",
	[1102]="Chrome Strip",
	[1106]="Chrome Arches",
	[1107]="Chrome Strip",
	[1108]="Chrome Strip",
	[1118]="Chrome Trim",
	[1119]="Wheel Covers",
	[1120]="Chrome Trim",
	[1121]="Wheelcovers",
	[1122]="Chrome Flames",
	[1124]="Chrome Arches",
	[1133]="Chrome Strip",
	[1134]="Chrome Strip",
	[1137]="Chrome Strip",
	
--  Bullbar . . ? [przod]
	[1100]="Chrome Grill",
	[1115]="Chrome",
	[1116]="Slamin",
	[1123]="Chrome",
	[1125]="Chrome Lights",
--  Bullbar . . ? [tył]
	[1109]="Chrome",
	[1110]="Slamin",
--	Front Sign [figurka itd z przodu]
	[1111]="Figurka",
	[1112]="Figurka",
--	Hydraulika
	[1087]="Hydraulika",
--  Wydechy
	[1034]="Alien",
	[1037]="X-Flow",
	[1044]="Chrome",
	[1046]="Alien",
	[1018]="Upswept",
	[1019]="Twin",
	[1020]="Large",
	[1021]="Medium",
	[1022]="Small",
	[1028]="Alien",
	[1029]="X-Flow",
	[1043]="Slamin",
	[1044]="Chrome",
	[1045]="X-Flow",
	[1059]="X-Flow",
	[1064]="Alien",
	[1065]="Alien",
	[1066]="X-Flow",
	[1089]="X-Flow",
	[1092]="Alien",
	[1104]="Chrome",
	[1105]="Slamin",
	[1113]="Chrome",
	[1114]="Slamin",
	[1126]="Chrome",
	[1127]="Slamin",
	[1129]="Chrome",
	[1132]="Slamin",
	[1135]="Slamin",
	[1136]="Chrome",
	
--  Zderzaki [tylni]
	[1149]="Alien",
	[1148]="X-Flow",
	[1150]="Alien",
	[1151]="X-Flow",
	[1154]="Alien",
	[1156]="X-Flow",
	[1159]="Alien",
	[1161]="X-Flow",
	[1167]="X-Flow",
	[1168]="Alien",
	[1175]="Slamin",
	[1177]="Slamin",
	[1178]="Slamin",
	[1180]="Chrome",
	[1183]="Slamin",
	[1184]="Chrome",
	[1186]="Slamin",
	[1187]="Chrome",
	[1192]="Chrome",
	[1193]="Slamin",
--  Zderzaki [pzrzód]
	[1171]="Alien",
	[1172]="X-Flow",
	[1140]="X-Flow",
	[1141]="Alien",
	[1117]="Chrome",
	[1152]="X-Flow",
	[1153]="Alien",
	[1155]="Alien",
	[1157]="X-Flow",
	[1160]="Alien",
--  Wloty [góra]
	[1128]="Dach", -- DACH DO BLADE
	[1130]="Dach", -- DACH DO SAVANNA
	[1131]="Dach", -- DACH DO SAVANNA
--  Wloty [przód]
--	Dodatkowe lampy 
	[1013]="Lampa",
	[1024]="Lampa",
	
}


local wykluczoneCzesci={

}
local idSlotow={
  ["Hood"]=0,
  ["Vent"]=1,
  ["Spoiler"]=2,
  ["Sideskirt"]=3,
  ["Front Bullbars"]=4,
  ["Rear Bullbars"]=5,
  ["Headlights"]=6,
  ["Roof"]=7,
  ["Nitro"]=8,
  ["Hydraulics"]=9,
  ["Stereo"]=10,
  ["Unknown"]=11,
  ["Wheels"]=12,
  ["Exhaust"]=13,
  ["Front Bumper"]=14,
  ["Rear Bumper"]=15,
  ["Misc"]=16,
}




addEvent("pokazPanelTuningu", true)
addEventHandler("pokazPanelTuningu", localPlayer, function(veh)
	if not isElement(GUIEditor.window[1]) then
		if getElementData(veh, "vehicle:spawn") then
			showCursor(true)
			veh1 = veh
			setElementData(localPlayer, "tune:car", veh)
			local screenW, screenH = guiGetScreenSize()
			GUIEditor.window[1] = guiCreateWindow((screenW - 888) / 2, (screenH - 546) / 2, 888*width, 546*height, "---=== Tuningowanie pojazdu ===---", false)
			guiWindowSetSizable(GUIEditor.window[1], false)
			GUIEditor.button[1] = guiCreateButton(445*width, 484*height, 233*width, 52*height, "TUNINGUJ\nDEMONTUJ", false, GUIEditor.window[1])
			guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FFAAAAAA")
			GUIEditor.button[2] = guiCreateButton(212*width, 484*height, 233*width, 52*height, "ZAMKNIJ OKNO", false, GUIEditor.window[1])
			guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFAAAAAA")
			GUIEditor.gridlist[1] = guiCreateGridList(31*width, 41*height, 827*width, 390*height, false, GUIEditor.window[1])
			guiGridListAddColumn(GUIEditor.gridlist[1], "ID CZESCI", 0.15)
			guiGridListAddColumn(GUIEditor.gridlist[1], "TYP", 0.15)
			guiGridListAddColumn(GUIEditor.gridlist[1], "AKCJA", 0.15)
			guiGridListAddColumn(GUIEditor.gridlist[1], "KOSZT CZESCI", 0.15)
			guiGridListAddColumn(GUIEditor.gridlist[1], "NAZWA Czesci", 0.15)
		--	a=0
			for i=0,16 do
				if getVehicleUpgradeOnSlot(veh, i) ~= 0 then
					local a = guiGridListAddRow(GUIEditor.gridlist[1])
					guiGridListSetItemText(GUIEditor.gridlist[1], a, 1, tostring(getVehicleUpgradeOnSlot(veh, i)), false, false)
					guiGridListSetItemText(GUIEditor.gridlist[1], a, 2, tostring(getVehicleUpgradeSlotName(getVehicleUpgradeOnSlot(veh, i))), false, false)
					guiGridListSetItemText(GUIEditor.gridlist[1], a, 3, "demtuning", false, false)
					if cenaCzesci[getVehicleUpgradeOnSlot(veh,i)] then
					guiGridListSetItemText(GUIEditor.gridlist[1], a, 4, tostring(tonumber(cenaCzesci[getVehicleUpgradeOnSlot(veh,i)]*9/10)) , false, false)
					else
					guiGridListSetItemText(GUIEditor.gridlist[1], a, 4, "--" , false, false)
					end
					if nazwaCzesci[getVehicleUpgradeOnSlot(veh,i)] then
					guiGridListSetItemText(GUIEditor.gridlist[1], a, 5, tostring(nazwaCzesci[getVehicleUpgradeOnSlot(veh,i)]), false, false)
					else
					guiGridListSetItemText(GUIEditor.gridlist[1], a, 5, "PuddinG" , false, false)
					end
					--	a=a+1
				else
					for i2,v2 in ipairs(getVehicleCompatibleUpgrades(veh, i)) do
						if cenaCzesci[v2] then
							if not wykluczoneCzesci[v2] then
								if v2 == 1164 then
									if getElementModel(veh) == 558 then
										local a=guiGridListAddRow(GUIEditor.gridlist[1])
										guiGridListSetItemText(GUIEditor.gridlist[1], a, 1, tostring(v2), false, false)
										guiGridListSetItemText(GUIEditor.gridlist[1], a, 2, tostring(getVehicleUpgradeSlotName(v2)), false, false)
										guiGridListSetItemText(GUIEditor.gridlist[1], a, 3, "tuning", false, false)
										guiGridListSetItemText(GUIEditor.gridlist[1], a, 4, tostring(cenaCzesci[v2]), false, false)
										if nazwaCzesci[v2] then
											guiGridListSetItemText(GUIEditor.gridlist[1], a, 5, tostring(nazwaCzesci[v2]), false, false)
										else
											guiGridListSetItemText(GUIEditor.gridlist[1], a, 5, "PuddinG" , false, false)
										end
									end
								else
									local a=guiGridListAddRow(GUIEditor.gridlist[1])
									guiGridListSetItemText(GUIEditor.gridlist[1], a, 1, tostring(v2), false, false)
									guiGridListSetItemText(GUIEditor.gridlist[1], a, 2, tostring(getVehicleUpgradeSlotName(v2)), false, false)
									guiGridListSetItemText(GUIEditor.gridlist[1], a, 3, "tuning", false, false)
									guiGridListSetItemText(GUIEditor.gridlist[1], a, 4, tostring(cenaCzesci[v2]), false, false)
									if nazwaCzesci[v2] then
										guiGridListSetItemText(GUIEditor.gridlist[1], a, 5, tostring(nazwaCzesci[v2]), false, false)
									else
										guiGridListSetItemText(GUIEditor.gridlist[1], a, 5, "PuddinG" , false, false)
									end
								--	a=a+1
								end
							end
						end
					end
				end
			end
			
			
			GUIEditor.progressbar[1] = guiCreateProgressBar(129*width, 436*height, 631*width, 38*height, false, GUIEditor.window[1])
			guiProgressBarSetProgress(GUIEditor.progressbar[1], 0)
		end
	else 
		setElementData(localPlayer, "tune:car",nil)
	end
	
end)


addEvent("ukryjPanelTuningu",true)
addEventHandler("ukryjPanelTuningu", localPlayer, function()
	if GUIEditor.window[1] and isElement(GUIEditor.window[1]) then
		destroyElement(GUIEditor.window[1])
		setElementData(localPlayer, "tune:car",nil)
		showCursor(false)
	end
end)

time=5000

function onClientGUIClick()
	if GUIEditor.button[2] and isElement(GUIEditor.button[2]) and source == GUIEditor.button[2] then
		if GUIEditor.window[1] and isElement(GUIEditor.window[1]) then
			destroyElement(GUIEditor.window[1])
			showCursor(false)
		end
	elseif GUIEditor.button[1] and isElement(GUIEditor.button[1]) and source == GUIEditor.button[1] then

		if GUIEditor.progressbar[1] and isElement(GUIEditor.progressbar[1]) and GUIEditor.gridlist[1] and isElement(GUIEditor.gridlist[1]) then
			if guiProgressBarGetProgress(GUIEditor.progressbar[1]) == 0 or guiProgressBarGetProgress(GUIEditor.progressbar[1]) == 100 then
			b=0
			local x,y = guiGridListGetSelectedItem(GUIEditor.gridlist[1])
				if y == 1 then 
					removeEventHandler("onClientGUIClick",resourceRoot, onClientGUIClick)
					
					setTimer(function()
						b=b+1
						if GUIEditor.progressbar[1] and isElement(GUIEditor.progressbar[1]) then
							guiProgressBarSetProgress(GUIEditor.progressbar[1], b)
						end
					end,time/100,100)
					
					setTimer(function()
						addEventHandler("onClientGUIClick",resourceRoot, onClientGUIClick)
						local text1 = guiGridListGetItemText(GUIEditor.gridlist[1], x, 1) -- ID
						local text2 = guiGridListGetItemText(GUIEditor.gridlist[1], x, 2) -- TYP
						local text3 = guiGridListGetItemText(GUIEditor.gridlist[1], x, 3) -- AKCJA
						local text4 = guiGridListGetItemText(GUIEditor.gridlist[1], x, 4) -- CENA
						local text5 = guiGridListGetItemText(GUIEditor.gridlist[1], x, 5) -- nazwa
						if text1 and tonumber(text1) and text4 and tonumber(text4) and text3 and tostring(text3) then
--						if not wykluczoneCzesci[tonumber(text1)] then
								if cenaCzesci[tonumber(text1)] then
									if veh1 and isElement(veh1) and getElementType(veh1) == "vehicle" then
										triggerServerEvent("montazElementu", root, veh1, text3, text1, text4, text5)
									end
								end
							end
--						end
					end,time*1.14,1)
				end
			end
		end
	end
end

addEventHandler("onClientGUIClick",resourceRoot, onClientGUIClick)