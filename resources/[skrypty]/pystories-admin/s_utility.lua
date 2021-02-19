--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

function RGBToHex(red, green, blue, alpha)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
		return nil
	end
	if(alpha) then
		return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
	else
		return string.format("#%.2X%.2X%.2X", red,green,blue)
	end
end

function getAdmin(plr,level)
	if level then
		local result=exports["pystories-db"]:dbGet("SELECT * from pystories_admins WHERE serial=? AND level=?", getPlayerSerial(plr), level)
		if result and #result > 0 then
			return true
		else
			return false
		end
	else
		local result=exports["pystories-db"]:dbGet("SELECT * from pystories_admins WHERE serial=?", getPlayerSerial(plr))
		if result and #result > 0 then
			return true
		else
			return false
		end
	end
end

function cmd_admins(plr)
  local moderatorzy={}
  local admini={}
  local rconi={}
  local owner={}
  for i,v in ipairs(getElementsByType("player")) do
    local adminer = getElementData(v,"player:id")
	--if not getElementData(v, "p:inv") then
  	if (getAdmin(v,4)) then
	  local t
	  local login=getElementData(v,"player:admin")
	  if (login) then
		t="["..getElementData(v,"id").."]"..getPlayerName(v):gsub("#%x%x%x%x%x%x","")..""
		table.insert(owner,t)
	  end
	if (getAdmin(v,3)) then
	  local t
	  local login=getElementData(v,"player:admin")
	  if (login) then
		t="["..getElementData(v,"id").."]"..getPlayerName(v):gsub("#%x%x%x%x%x%x","")..""
		table.insert(rconi,t)
	  end
	end
	if (getAdmin(v,2)) then
	  local t
	  local login=getElementData(v,"player:admin")
	  if (login) then
		t="["..getElementData(v,"id").."]"..getPlayerName(v):gsub("#%x%x%x%x%x%x","")..""
		table.insert(admini,t)
	  end
	end
	if (getAdmin(v,1)) then
	  local t
	  local login=getElementData(v,"player:admin")
	  if (login) then
		t="["..getElementData(v,"id").."]"..getPlayerName(v):gsub("#%x%x%x%x%x%x","")..""
		table.insert(moderatorzy,t)
	  end
	end
	end
end

  outputChatBox("Pracownicy Techniczni:", plr, 142, 0, 255)
  if (#owner>0) then
    outputChatBox("* " .. table.concat(owner,", "), plr)
  else
	outputChatBox("* Brak.", plr)
  end

  outputChatBox("Administratorzy ROOT:", plr, 100, 0, 0)
  if (#rconi>0) then
    outputChatBox("* " .. table.concat(rconi,", "), plr)
  else
	outputChatBox("* Brak.", plr)
  end
  
  outputChatBox("Administratorzy:", plr, 255, 0, 0)
  if (#admini>0) then
    outputChatBox("* " .. table.concat(admini,", "), plr)
  else
	outputChatBox("* Brak.", plr)
  end

  outputChatBox("Moderatorzy:", plr, 0, 102, 0)
  if (#moderatorzy>0) then
    outputChatBox("* " .. table.concat(moderatorzy,", "), plr)
  else
	outputChatBox("* Brak.", plr)
  end
end
addCommandHandler("admins", cmd_admins, false, false)
addCommandHandler("ekipa", cmd_admins, false, false)
addCommandHandler("admini", cmd_admins, false, false)

function destroyBlipsAttachedTo(player)
    local attached = getAttachedElements ( player )
    if ( attached ) then
        for k,element in ipairs(attached) do
            if getElementType ( element ) == "blip" then
                destroyElement ( element )
            end
        end
    end
end

addCommandHandler("duty", function(plr,cmd)
	if getAdmin(plr,4) or getAdmin(plr,3) or getAdmin(plr,2) or getAdmin(plr,1) then
		if not getElementData(plr,"player:admin") then
			giveWeapon(plr,22)
			toggleControl(plr,"fire",true)
			toggleControl(plr,"aim_weapon",true)
			if getAdmin(plr, 1) then
			setElementData(plr,"player:level",1)
			setElementData(plr,"last:nick",getPlayerName(plr))
	        setElementData(plr,"last:color",tostring(getPlayerNametagColor(plr)))
	        setPlayerName(plr,"#01bf34"..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""))
			--destroyBlipsAttachedTo(plr)
			--createBlipAttachedTo(plr, 0, 2, 0, 191, 52)
			outputChatBox("* Zalogowałeś(aś) się na służbe Moderatora.", plr)
			elseif getAdmin(plr, 2) then
			setElementData(plr,"player:level",2)
			setElementData(plr,"last:nick",getPlayerName(plr))
	        setElementData(plr,"last:color",tostring(getPlayerNametagColor(plr)))
	        setPlayerName(plr,"#ff0000"..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""))
			--destroyBlipsAttachedTo(plr)
			--createBlipAttachedTo(plr, 0, 2, 255, 0, 0)
			outputChatBox("* Zalogowałeś(aś) się na służbe Administratora.", plr)
			elseif getAdmin(plr, 3) then
			setElementData(plr,"player:level",3)
			setElementData(plr,"last:nick",getPlayerName(plr))
	        setElementData(plr,"last:color",tostring(getPlayerNametagColor(plr)))
	        setPlayerName(plr,"#a31303"..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""))
			--destroyBlipsAttachedTo(plr)
			--createBlipAttachedTo(plr, 0, 2, 100, 0, 0)
			outputChatBox("* Zalogowałeś(aś) się na służbe ROOT'a.", plr)
			elseif getAdmin(plr, 4) then
			setElementData(plr,"player:level",4)
			setElementData(plr,"last:nick",getPlayerName(plr))
	        setElementData(plr,"last:color",tostring(getPlayerNametagColor(plr)))
	        setPlayerName(plr,"#8F00FF"..getPlayerName(plr):gsub("#%x%x%x%x%x%x",""))
			--destroyBlipsAttachedTo(plr)
			--createBlipAttachedTo(plr, 0, 2, 142, 0, 255)
			outputChatBox("* Zalogowałeś(aś) się na służbe Pracownika Technicznego.", plr)
			end
			setElementData(plr,"player:admin",true)
			setElementData(plr,"player:ucho",true)
			--outputChatBox("* Zalogowałeś(aś) się na slużbe (/admins).", plr)
		else
			takeWeapon(plr,22)
			toggleControl(plr,"fire",false)
			toggleControl(plr,"aim_weapon",false)
			removeElementData(plr,"player:admin")
			removeElementData(plr,"player:level")
			setElementData(plr,"player:ucho",false)
			outputChatBox("* Wylogowałeś(aś) się z służby administracji serwera.", plr)
			setPlayerName(plr,getElementData(plr,"last:nick"))
			--destroyBlipsAttachedTo(plr)
			--createBlipAttachedTo(plr, 0, 2, 100, 100, 100)
		end
	else
		--outputChatBox("* Nie posiadasz uprawnień.", plr, 255, 0, 0)
	end
end)

scianarapsow = createObject ( 16637,-1931.6,883.27,35.41 )
setObjectScale(scianarapsow,3)
setElementDimension(scianarapsow,9999)
reportView = {{"Ściana Raportów:",0}}
setElementData(scianarapsow,"sciana:raportow",reportView)

addEvent("admin:addReport", true)
addEventHandler("admin:addReport", root, function(text,id)
	table.insert(reportView, {text,id})
	if #reportView > 17 then
		table.remove(reportView, 2)
	end
	setElementData(scianarapsow,"sciana:raportow",reportView)
end)

addEvent("admin:removeReport", true)
addEventHandler("admin:removeReport", root, function(id)
	for i=#reportView, 2, -1 do
		if reportView[i][2] == id then
			table.remove(reportView,i)
		end
	end
	setElementData(scianarapsow,"sciana:raportow",reportView)
end)

scianatext = createObject ( 981,0,0,0 )
textView = {{"Logi Serwerowe:",0}}
setElementDimension(scianatext,9999)
setElementData(scianatext,"sciana:text",textView)


addEvent("admin:addText", true)
addEventHandler("admin:addText", root, function(text,id)
	table.insert(textView, {text,id})
	if #textView > 17 then
		table.remove(textView, 2)
	end
	setElementData(scianatext,"sciana:text",textView)
end)

addEvent("admin:removeText", true)
addEventHandler("admin:removeText", root, function(id)
	for i=#textView, 2, -1 do
		if textView[i][2] == id then
			table.remove(textView,i)
		end
	end
	setElementData(scianatext,"sciana:text",textView)
end)

--[[addCommandHandler("raport", function(plr,cmd,cel,...)
	if not cel then
		outputChatBox("* Użyj: /raport <nick/ID> <powód>", plr)
		return
	end
	local target=exports["ogrpg-core"]:findPlayer(plr,cel)
	if not target then
		outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
		return
	end
	local text=table.concat({...}, " ")
	desc=getPlayerName(plr):gsub("#%x%x%x%x%x%x","").."("..getElementData(plr,"id")..") >> "..getPlayerName(target):gsub("#%x%x%x%x%x%x","").."("..getElementData(target,"id").."): "..text:gsub("#%x%x%x%x%x%x","")
	triggerClientEvent(root, "admin:addReport", resourceRoot, desc, getElementData(target,"id"))
--	triggerClientEvent(root, "onDebugMessage", resourceRoot, desc,2, "Report")
	outputChatBox("* Pomyślnie wysłano zgłoszenie na gracza: "..getPlayerName(target):gsub("#%x%x%x%x%x%x",""), plr)
end)

addCommandHandler("cl", function(plr,cmd,id,...)
	if not getAdmin(plr) then
		outputChatBox("* Nie posiadasz uprawnień.", plr, 255, 0, 0)
		return
	end
	local reason=table.concat({...}, " ")
	local target=exports["ogrpg-core"]:findPlayer(plr,id)
	opis = "Brak Online"
	if target then
		id=getElementData(target,"id")
		opis=getPlayerName(target)
	end
	for i,v in ipairs(getElementsByType("player")) do
		if getAdmin(v) then
		--	if getElementData(v,"player:admin") then
				triggerClientEvent(v, "admin:removeReport", resourceRoot, id)
				outputChatBox("#FFFF00CL #FFFFFF> #FF0000"..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." #919191usunął/ęła raport na: #FF0000"..opis:gsub("#%x%x%x%x%x%x","").."#919191/#FF0000"..id.."#919191: #919191"..reason, v, 255, 0, 0, true)
		--	end
		end
	end
end)--]]

addCommandHandler("raport", function(plr,cmd,cel,...)
	if not cel then
		outputChatBox("* Użyj: /raport <nick/ID> <powód>", plr)
		return
	end
	local target=exports["pystories-core"]:findPlayer(plr,cel)
	if not target then
		outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
		return
	end
	local text=table.concat({...}, " ")
	desc="["..getElementData(plr,"id").."]"..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." >> ["..getElementData(target,"id").."]"..getPlayerName(target):gsub("#%x%x%x%x%x%x","")..": "..text:gsub("#%x%x%x%x%x%x","")
	triggerEvent("admin:addReport", resourceRoot, desc, getElementData(target,"id"))
--	triggerClientEvent(root, "onDebugMessage", resourceRoot, desc,2, "Report")
	outputChatBox("* Pomyślnie wysłano zgłoszenie na gracza: ["..getElementData(target,"id").."]"..getPlayerName(target):gsub("#%x%x%x%x%x%x","").."", plr)
end)

addCommandHandler("report", function(plr,cmd,cel,...)
	if not cel then
		outputChatBox("* Użyj: /report <nick/ID> <powód>", plr)
		return
	end
	local target=exports["pystories-core"]:findPlayer(plr,cel)
	if not target then
		outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
		return
	end
	local text=table.concat({...}, " ")
	desc="["..getElementData(plr,"id").."]"..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." >> ["..getElementData(target,"id").."]"..getPlayerName(target):gsub("#%x%x%x%x%x%x","")..": "..text:gsub("#%x%x%x%x%x%x","")
	triggerEvent("admin:addReport", resourceRoot, desc, getElementData(target,"id"))
--	triggerClientEvent(root, "onDebugMessage", resourceRoot, desc,2, "Report")
	outputChatBox("* Pomyślnie wysłano zgłoszenie na gracza: ["..getElementData(target,"id").."]"..getPlayerName(target):gsub("#%x%x%x%x%x%x","").."", plr)
end)

addCommandHandler("cl", function(plr,cmd,id,...)
	if not getAdmin(plr) then
		outputChatBox("* Nie posiadasz uprawnień.", plr, 255, 0, 0)
		return
	end
	--local reason=table.concat({...}, " ")
	local target=exports["pystories-core"]:findPlayer(plr,id)
	opis = "Brak Online"
	if target then
		id=getElementData(target,"id")
		opis=getPlayerName(target)
		if target ~= plr and not getAdmin(target) then
		end
	end
	for i,v in ipairs(getElementsByType("player")) do
		--if getAdmin(v) then
		if getElementData(v,"player:admin") then
				triggerEvent("admin:removeReport", resourceRoot, id)
				--outputChatBox("* "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." usunął/ęła raport na: "..opis:gsub("#%x%x%x%x%x%x","").."/"..id..": "..reason, v, 255, 0, 0)
				outputChatBox("#FFFF00CL #FFFFFF> #FF0000["..getElementData(plr,"id").."]"..getPlayerName(plr):gsub("#%x%x%x%x%x%x","").." #919191usunął/ęła raport na: #FF0000["..id.."]#FF0000"..opis:gsub("#%x%x%x%x%x%x","").."#919191.", v, 255, 0, 0, true)
		--	end
		end
	end
end)