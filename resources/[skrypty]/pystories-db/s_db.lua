--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

-- Settings
DBHandler=nil
DBName=""
DBUser=""
DBPass=""
DBHost=""

-- Functions
function dbSet(...)
	if not {...} then return end
	local query=dbExec(DBHandler, ...)
	return query
end

function dbGet(...)
	if not {...} then return end
	local query=dbQuery(DBHandler, ...)
	local result=dbPoll(query, -1)
	return result
end

addEventHandler("onResourceStart", resourceRoot, function()
	DBHandler=dbConnect("mysql", "dbname="..DBName..";host="..DBHost.."", DBUser, DBPass, "share=1")
	if DBHandler then
		outputDebugString("* Connect to server MYSQL...")
	else
		outputDebugString("* No Connecting to server MYSQL..")
	end
end)