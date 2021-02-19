--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local sx,sy=guiGetScreenSize()

local data={
	value=nil,
	showed=false,
	text=nil,
}

local randomText={
	"Pracuj dobrze a coś zyskasz",
	"Nie ma to jak praca na serwerze",
	"Graj dalej jak Ci się podoba",
}

function renderInformation()
	--local sin=math.sin(getTickCount()/500)*20
	dxDrawRectangle(sx*288/1024, sy*512/768, sx*471/1024, sy*101/768, tocolor(255, 255, 255, 96), false)
	dxDrawImage(sx*288/1024, sy*512/768, sx*103/1024, sy*101/768, "img/corona.png", 0, 0, white, false)
	dxDrawText("Otrzymałeś(aś) dodatkową reputację...", sx*(393+1)/1024, sy*(513+1)/768, sx*(759+1)/1024, sy*(549+1)/768, tocolor(0, 0, 0, 255), 1.11, "default-bold", "center", "center", false, true)
	dxDrawText("Otrzymałeś(aś) dodatkową reputację...", sx*393/1024, sy*(513)/768, sx*759/1024, sy*549/768, white, 1.11, "default-bold", "center", "center", false, true)
	dxDrawText(data.text.." ("..data.value.." REP)", sx*(393+1)/1024, sy*(549+1)/768, sx*(759+1)/1024, sy*(603+1)/768, tocolor(0, 0, 0, 255), 1.00, "clear", "center", "center", false, true)
	dxDrawText(data.text.." ("..data.value.." REP)", sx*393/1024, sy*549/768, sx*759/1024, sy*603/768, white, 1.00, "clear", "center", "center", false, true)
end

addEvent("reputation:show", true)
addEventHandler("reputation:show", resourceRoot, function(rnd)
	data.value=rnd[2]
	data.text=randomText[math.random(#randomText)]
	addEventHandler("onClientRender", root, renderInformation)
	setTimer(function()
		removeEventHandler("onClientRender", root, renderInformation)
		data.value=nil
		data.text=nil
	end, 6000, 1)
end)