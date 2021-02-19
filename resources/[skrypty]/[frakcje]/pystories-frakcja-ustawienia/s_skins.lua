--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local skins={
	["SAMC"]={
		code="SAMC",
		positions={
			{3967.96, -1180.61, 8.37,70,"Skin Dyrektora",0,1,2},
			--{-258.81, 1041.64, -15.85,132,"Skin Lekarza",0,0,9},
			{3967.87, -1182.61, 8.37,275,"Skin Szpitalny",0,1},
			--{-2722.25,688.96,51.23,274,"Skin ratownika"},
			--{-2714.70,689.31,51.23,70,"Skin Kadra"},
			--{-2736.32,690.61,51.23,275,"Skin Pielegniarzy"},
			--{-2734.68,682.11,51.23,178,"Skin Kobiety",0,0},
		},
		text="* Nie jesteś na służbie, lub nie pracujesz w Pogotowiu Ratunkowym.",
	},
	["SAPD"]={
		code="SAPD",
		positions={
			  --{-6741.48, -1460.61, 97.26,301,"Skin\nGeneralnego\nInspektora",0,0,98},
			  --{-6755.12, -1468.03, 97.26,71,"Skin #1",0,0,1},
              --{-6758.02, -1467.89, 97.26,282,"Skin #2",0,0,7},
              --{-6760.61, -1467.82, 97.26,283,"Skin #3",0,0,3},
              --{-6763.14, -1467.78, 97.26,271,"Skin #4",0,0,2}, -- 271 ~ 292
              --{-6766.26, -1467.70, 97.26,268,"Skin #5",0,0,4},
              --{-6766.14, -1464.14, 97.26,267,"Skin #6",0,0,5},
              --{-6763.22, -1462.68, 97.26,292,"Skin #7",0,0,6}, -- 292 ~ 271
			  {1545.40, 1579.46, 10.91,71,"Szkoleniowiec", 666, 112, 1},
			  {1534.37, 1579.44, 10.91,281,"SAPD\n5", 666, 112, 2},
			  {1545.36, 1576.77, 10.91,301,"Kadra", 666, 112, 98},
              {1539.98, 1579.46, 10.91,285,"SAPD\n1", 666, 112, 6},
			  {1539.96, 1576.82, 10.91,284,"SAPD\n2", 666, 112, 5},
              {1538.03, 1579.44, 10.91,283,"SAPD\n3", 666, 112, 4},
			  {1538.00, 1576.82, 10.91,282,"SAPD\n4", 666, 112, 3},
			  {1534.40, 1576.75, 10.91,301,"Zarząd", 666, 112, 98},
		},
		text="* Nie jesteś na służbie, lub nie pracujesz w Policji.",
	},
	["ASA"]={
		code="ASA",
		positions={
			--{-2735.89, 690.40, 51.23,276,"Skin akademii"},
			--{-1317.49,489.22,11.20,285,"Skin Bojowy"},
			--{-1313.90,488.96,11.20,179,"Skin Koszarowy"},
		},
		text="* Nie jesteś na służbie, lub nie pracujesz w Wojsku.",
	},
	["PSP"]={
		code="PSP",
		positions={
			--{-2116.59, -42.96, 45.20, 279,"Skin Kadry", 0, 0, 98},
			{-2125.86, -41.87, 45.20, 274,"Skin Ratownika", 0, 0, 2},
			--{-2125.86, -42.10, 45.20, 290,"Skin Kadry", 0, 0, 98},
			{-2125.85, -36.82, 45.20, 277,"Skin A-PSP", 0, 0, 1},
			{-2125.85, -33.04, 45.20, 201,"Skin Koszarowy", 0, 0, 5},
		},
		text="* Nie jesteś na służbie, lub nie pracujesz w Straży Pożarnej.",
      },
}

for _,skin in pairs(skins) do
	for _,pos in ipairs(skin.positions) do
		local pickup=createPickup(pos[1], pos[2], pos[3], 3, 1275, 2000)
		setElementDimension(pickup,pos[6])
		setElementInterior(pickup,pos[7])
    	setElementData(pickup,"p:faction",tostring(skin.code))
    	setElementData(pickup,"p:skin", tonumber(pos[4]))
		setElementData(pickup,"p:rank", pos[8] or 1)
		local t=createElement("text")
    	setElementData(t,"name",pos[5] or "Skin")
		setElementDimension(t,pos[6])
		setElementInterior(t,pos[7])
    	setElementPosition(t,pos[1],pos[2],pos[3])
    end
end

addEventHandler("onPickupHit", resourceRoot, function(el,md)
	if getElementType(el)~="player" then return end
    local faction=getElementData(source,"p:faction")
    if not faction then return end
    local skin=getElementData(source,"p:skin")
	local rank=getElementData(source,"p:rank")
    if not skin then return end
    if not getPlayerFaction(el,faction) or getElementData(el,"player:faction") ~= faction then
		outputChatBox(skins[faction].text, el)
    	cancelEvent()
		return end
	if rank then
	if rank > getElementData(el,"player:rank")  then
    	outputChatBox(skins[faction].text, el)
    	cancelEvent()
    return end
	end
    setElementModel(el,skin)
end)