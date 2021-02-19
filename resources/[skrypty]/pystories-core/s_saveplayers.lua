--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

function getPremium(plr,premium)
	if premium then
		local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_users WHERE id=? AND premium=?",getElementData(plr,"player:sid"), premium)
		if result and #result > 0 then
			return true
		else
			return false
		end
	else
		local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_users WHERE id=?", getElementData(plr,"player:sid"))
		if result and #result > 0 then
			return true
		else
			return false
		end
	end
end


function loadPlayerData(plr)
	local result=exports["pystories-db"]:dbGet("SELECT * FROM pystories_users WHERE id=?", getElementData(plr,"player:sid"))
	if result and #result > 0 then
		local v=result[1]
		setPlayerMoney(plr,v.money)
		setElementModel(plr,v.skin)
		setElementData(plr,"status","Aktywny")
		setElementData(plr,"player:logged",true)
		setElementData(plr,"player:mandate",v.mandate)
		setElementData(plr,"player:license:pjA",v.pjA)
		setElementData(plr,"player:license:pjB",v.pjB)
		setElementData(plr,"player:license:pjC",v.pjC)
		setElementData(plr,"player:license:pjL",v.pjL)
		setElementData(plr,"player:srp",v.srp)
		setElementData(plr,"player:workinjob",v.worker)
		setElementData(plr,"player:registerdate",v.registered)
		setElementData(plr,"player:hours",v.hours)
		setElementData(plr,"player:skin",v.skin)
		
		local queryA=string.format("SELECT * FROM pystories_users WHERE id=%d AND premiumdate>NOW() LIMIT 1", getElementData(plr,"player:sid"))
		local resultA=exports["DB2"]:pobierzWyniki(queryA)
		if (resultA) then
			setElementData(plr,"player:premium",true)
			setElementData(plr,"player:premiumdate",v.premiumdate)
			setPlayerName(plr,"#C0FF00"..getPlayerName(plr))
			setElementData(plr,"premium:level",1)
		else
			setElementData(plr,"player:premium",false)
		end
		
		--local queryA=string.format("SELECT * FROM ogrpg_users WHERE id=%d AND premiumdate>NOW() LIMIT 1", getElementData(plr,"player:uid"))
		--local resultA=exports["ogrpg-db"]:dbSet(queryA)
		--if (resultA) then
		
		
		--[[if getPremium(plr,1) then
			setElementData(plr,"player:premium",true)
			setElementData(plr,"player:premiumdate",v.premiumdate)
			setPlayerName(plr,"#FFFF00"..getPlayerName(plr))
		else
			setElementData(plr,"player:premium",false)
		end--]]
		
		
		-- org
		--local org=exports["pystories-db"]:dbGet("SELECT * FROM ms_organizacje WHERE code=? AND uid=? LIMIT 1", getElementData(plr,"player:organization"), getElementData(plr,"player:sid")) -- pobieramy tylko JEDEN rekord
        --local name = getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
		--if org and #org > 0 then
			--setElementData(plr,"player:organization",org[1].code)
			--outputChatBox("* Jesteś w organizacji, która nosi nazwe: "..org[1].code.."", plr)
			--exports['pystories-db']:dbSet("UPDATE ms_organizacje SET actived=curdate() WHERE uid=?", getElementData(plr,"player:sid"))
		--end
		
		--local org=exports["pystories-db"]:dbGet("SELECT * FROM ogrpg_organizations WHERE code=? AND uid=? LIMIT 1", getElementData(plr,"player:organization"), getElementData(plr,"player:sid"))
		--local org=exports["pystories-db"]:dbGet("SELECT * FROM ogrpg_organizations WHERE uid=? LIMIT 1", getElementData(plr,"player:sid")) -- pobieramy tylko JEDEN rekord
		--if org and #org > 0 then
			--setElementData(plr,"player:organization",org[1].code)
			--outputChatBox("* Jesteś w organizacji, która nosi nazwe: "..org[1].code.."", plr)
			--exports['pystories-db']:dbSet("UPDATE ogrpg_organization_list WHERE id=? AND uid=?", id, uid)
			--\\\--exports['pystories-db']:dbSet("UPDATE ogrpg_organizations SET actived=curdate() WHERE uid=?", getElementData(plr,"player:sid"))
		--end
		
		local org=exports["pystories-db"]:dbGet("SELECT * FROM ms_organizacje WHERE code=? AND uid=? LIMIT 1", getElementData(plr,"player:organization"), getElementData(plr,"player:sid")) -- pobieramy tylko JEDEN rekord
        local name = getPlayerName(plr):gsub("#%x%x%x%x%x%x","")
		if org and #org > 0 then
			setElementData(plr,"player:organization",org[1].code)
			outputChatBox("* Jesteś w organizacji, która nosi nazwe: "..org[1].code.."", plr)
			exports['pystories-db']:dbSet("UPDATE ms_organizacje SET actived=curdate() WHERE uid=?", getElementData(plr,"player:sid"))
		end
		
		return true
	end
	return false
end

addEvent("load:player",true)
addEventHandler("load:player", root, function(player)
if isElement(player) and player then
if getElementType(player) ~= "player" then return end
loadPlayerData(player)
outputDebugString("pystories_users> Załadowano statystyki gracza: "..getPlayerName(player))
end
end)
function savePlayerData(plr)
	local sid=getElementData(plr,"player:sid")
	if not sid then return end
	local money=getPlayerMoney(plr)
	local mandate=getElementData(plr,"player:mandate")
	local licensea=getElementData(plr,"player:license:pjA")
	local licenseb=getElementData(plr,"player:license:pjB")
	local licensec=getElementData(plr,"player:license:pjC")
	local licensel=getElementData(plr,"player:license:pjL")
	local srp=getElementData(plr,"player:srp")
	local worker =getElementData(plr,"player:workinjob")
	local hours= tonumber(getElementData(plr,"player:hours")) or 0
	local query=exports["pystories-db"]:dbSet("UPDATE pystories_users SET money=?, srp=?, mandate=?, pjA=?, pjB=?, pjC=?, pjL=?, worker=?, hours=? WHERE id=?",
	money, srp, mandate, licensea, licenseb, licensec, licensel, worker, hours, sid)
end
addEvent("save:player",true)
addEventHandler("save:player", root, function(player)
if isElement(player) and player then
if getElementType(player) ~= "player" then return end
savePlayerData(player)
outputDebugString("pystories_users> Zapisano statystyki gracza: "..getPlayerName(player))
end
end)
addEventHandler("onPlayerQuit", root, function() savePlayerData(source) end)