Workj="N/A"
Date="N/A"
Time="N/A"
B="N/A"
Premium="N/A"
License="N/A"
open=false
closee=false



okno = guiCreateGridList(0.36, -0.55, 0.29, 0.55, true)
guiSetAlpha(okno, 0.80)
guiSetVisible(okno,true)

info = guiCreateLabel(0.00, 0.02, 1.00, 0.13, "Trwa synchronizacja...", true, okno)
guiSetFont(info, "default-bold-small")
guiLabelSetHorizontalAlign(info, "center", false)
guiLabelSetVerticalAlign(info, "center")
Informacje = guiCreateLabel(0.11, 0.19, 0.79, 0.61, "Ilość minut na duty: "..Workj.."\n\n\nData rejestracji: "..Date.."\n\n\nIlość minut przegranych na serwerze: "..Time.."\n\n\nPremium(Data końca): "..Premium.."\n\n\nPrawo jazdy (A,B,C,L): "..License.."", true, okno)
--\n\n\nBankomat: "..B.." PLN
guiLabelSetHorizontalAlign(Informacje, "center", false)
guiLabelSetVerticalAlign(Informacje, "center")
change_pass = guiCreateButton(0.32, 0.85, 0.36, 0.10, "Zmień hasło", true, okno)
addEventHandler ( "onClientGUIClick", change_pass, function() executeCommandHandler("zmienhaslo") end)
Pj={}
timer = nil



bindKey("F5","down",function()
	if open then
		Pj={}
		open=false
		closee=true
		start2=getTickCount()
		start1=nil
		showCursor(false)
		playSoundFrontEnd(44)
		setElementData(localPlayer,"blur",false)
	elseif not open then
		if getElementData(localPlayer,"status")~="Aktywny" then return end
		open=true
		closee=false
		playSoundFrontEnd(43)
		showCursor(true)
		setElementData(localPlayer,"blur",true)
		local Workj=getElementData(localPlayer,"player:workinjob") or "N/A"
		local Date=getElementData(localPlayer,"player:registerdate") or "N/A"
		local Time=tonumber(getElementData(localPlayer,"player:hours")) or "N/A"
		local Premium=getElementData(localPlayer,"player:premiumdate") or "N/A"
		local Pja=getElementData(localPlayer,"player:license:pjA")
		local Pjb=getElementData(localPlayer,"player:license:pjB")
		local Pjc=getElementData(localPlayer,"player:license:pjC")
		local Pjl=getElementData(localPlayer,"player:license:pjL")
		local bank=getElementData(localPlayer,"bank:hajs") or "0"
		if Pja==1 then
			table.insert(Pj,"A")
	--	elseif Pja~=1 then
	--		table.insert(Pj,"NIE")
		end
		if Pjb==1 then
			table.insert(Pj,"B")
	--	elseif Pjb~=1 then
	--		table.insert(Pj,"NIE")
		end
		if Pjc==1 then
			table.insert(Pj,"C")
	--	elseif Pjc~=1 then
	--		table.insert(Pj,"NIE")
		end
		if Pjl==1 then
			table.insert(Pj,"L")
	--	elseif Pjl~=1 then
	--		table.insert(Pj,"NIE")
		end
		License=table.concat(Pj,",")
		timer = setTimer(function() guiSetText(info,"Panel informacji gracza"); guiSetText(Informacje,"Ilość minut na duty: "..Workj.."\n\n\nData rejestracji: "..Date.."\n\n\nIlość minut przegranych na serwerze: "..Time.."\n\n\nPremium (Data końca): "..Premium.."\n\n\nPrawo jazdy (A,B,C,L): "..License.."") end,3000,0)
		--\n\n\nBankomat: "..bank.." PLN
		start1=getTickCount()
		start2=nil
	end
end)



addEventHandler("onClientRender",root,function()
	if open then
		local now = getTickCount()
		local progress = (now - start1) / ((start1+1000) - start1)
		local x, y, _ = interpolateBetween ( 
			0.36, -0.55, 0,
			0.36, 0.21, 0, 
			progress, "OutBounce")
		local alpha=interpolateBetween(
			0,0,0,
			0.8,0,0,
			progress,"OutBounce")
		guiSetPosition(okno, x, y,true)
		guiSetAlpha(okno,alpha)
	elseif closee then
		local now = getTickCount()
		local progress = (now - start2) / ((start2+1000) - start2)
		local x2,y2=guiGetPosition(okno,true)
		local x, y, _ = interpolateBetween ( 
			x2, y2, 0,
			0.36, -0.55, 0, 
			progress, "OutBounce")
		local al=guiGetAlpha(okno)
		local alpha=interpolateBetween(
			tonumber(al),0,0,
			0,0,0,
			progress,"OutBounce")
		guiSetPosition(okno, x, y,true)
		guiSetAlpha(okno,alpha)
		guiSetText(info,"Trwa synchronizacja...");
		License="N/A"
		guiSetText(Informacje,"Ilość minut na duty: "..Workj.."\n\n\nData rejestracji: "..Date.."\n\n\nIlość minut przegranych na serwerze: "..Time.."\n\n\nPremium(Data końca): "..Premium.."\n\n\nPrawo jazdy (A,B,C,L): "..License.."")
		--\n\n\nBankomat: "..B.."
		if isTimer(timer) then killTimer(timer) end
	end
end)