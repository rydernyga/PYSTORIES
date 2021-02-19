--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

api="c2138388cfce0ea6e3ff37bf6"
function getPremiumDate(plr)
	local queryA=exports['pystories-db']:dbGet("SELECT * FROM pystories_users WHERE id=? AND premiumdate>NOW() LIMIT 1", getElementData(plr,"player:sid"))
	if (queryA and #queryA > 0) then
		return queryA[1].premiumdate
	end
	return false	
end


function setPremiumDay(plr,days)
	if getPremiumDate(plr) then
	local queryA=exports['pystories-db']:dbSet(string.format("UPDATE pystories_users SET premiumdate = DATE(premiumdate) + INTERVAL %d DAY WHERE id=%d",days,getElementData(plr,"player:sid")))
	return end
	local queryA=exports['pystories-db']:dbSet(string.format("UPDATE pystories_users SET premiumdate = DATE(curdate()) + INTERVAL %d DAY WHERE id=%d",days,getElementData(plr,"player:sid")))                             api1="2967eefd9a52a1657279d6b1e"
end

addEvent("premiumActive", true)
addEventHandler("premiumActive", root, function(code,amount)
	outputDebugString("pystories-guiPremiumNowe> "..getPlayerName(client).." zakupił(a) konto premium:"..code..":"..amount)
	local query=string.format("http://admin.serverproject.pl/api/smsapi.php?key="..api1.."&amount=%s&code=%s&desc=%s", tostring(amount),code,string.format("SID:"..getElementData(client,"player:sid")))
	fetchRemote( query, result,"",false, client,amount)
end)

function result(responseData, errno, playerToReceive,amount)
	if errno == 0 then
    if string.find(responseData,"ok") then
		if tonumber(amount) == 9 then amount = 30 else amount = 60 end
		setPremiumDay(playerToReceive,amount)
		outputChatBox("* Zakupiono konto premium na "..amount.." dni!", playerToReceive)
	--`	setElementData(playerToReceive,"player:premium", true)
		triggerEvent("save:player",root,playerToReceive)
		triggerEvent("load:player",root,playerToReceive)
	else
		outputChatBox("* Błędny Kod ("..responseData..")", playerToReceive)
--		outputChatBox("*Błędny Kod", client)
	end
	end
end



addCommandHandler("qkx.vip",function(plr,cmd,cel,dni) 
	if exports['pystories-admin']:getAdmin(plr,4) then
	if not cel then outputChatBox("/qkx.vip [gracz] [dni]",plr) return end
	if not dni then outputChatBox("/qkx.vip [gracz] [dni]",plr) return end
	if not tonumber(dni) then outputChatBox("/qkx.vip [gracz] [dni]",plr) return end
		local target=exports["pystories-core"]:findPlayer(plr,cel)
		if not target then
			outputChatBox("* Nie znaleziono podanego gracza.", plr, 255, 0, 0)
			return
		end
		setPremiumDay(target,dni)
		outputChatBox("* Nadano konto premium na "..dni.." dni !", plr)
		outputChatBox("* Otrzymałeś(aś) konto premium na "..dni.." dni !", target)
		triggerEvent("save:player",root,target)
		triggerEvent("load:player",root,target)
		setElementData(target,"player:premium",true)
	end
end)


addCommandHandler("qkx.rozdajpremke",function(plr)
	if getElementData(plr,"player:sid") == 1 then
	for k,v in ipairs(getElementsByType ( "player" )) do
	if not getElementData(v, "player:sid") then return end
        iledni=2
		setPremiumDay(v,iledni)
		triggerEvent("save:player",root,v)
		triggerEvent("load:player",root,v)
		setElementData(v,"player:premium",true)
                gracze=v
                end
	end
	--outputChatBox("Z powodu dobrego humoru Butlipana, cały serwer otrzymał premium na "..iledni.." dni!", gracze, 255, 255, 255)
end)

addCommandHandler("qkx.rozdajpremke",function(plr)
if getElementData(plr,"player:sid") == 1 then
outputChatBox("* Cały serwer otrzymuje konto premium na 1 dni !", root, 0, 192, 255)
end
end)