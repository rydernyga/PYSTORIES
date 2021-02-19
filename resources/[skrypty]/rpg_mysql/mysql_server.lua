--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local mysql
function mysql_connect()
	mysql = dbConnect("mysql", "dbname=db_18945;host=sql-waw2.ServerProject.pl", "db_18945", "DSAHi17jkso89", "share=1")
	if not mysql then
		outputDebugString("[rpg_mysql] Connection: false")
	else
		outputDebugString("[rpg_mysql] Connection: true")
	end
end
addEventHandler("onResourceStart", resourceRoot, mysql_connect)

function mysql_query(...)
	local qh = dbQuery(mysql, ...)
	--outputDebugString("[value_mysql] QUERY: "..(...))
	if not qh then return false end
	local result, num_affected_rows, last_insert_id = dbPoll(qh, -1)
	return result, num_affected_rows, last_insert_id
end
