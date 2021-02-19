--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local SQL

local function connect()
    -- w ponizszej linii uzupelnij dane autoryzacji
	SQL = dbConnect("mysql", "dbname=db_18945;host=sql-waw2.ServerProject.pl", "db_18945","Al18a10K10lAh1JaKquMqKrkLau8K","share=1")
	if (not SQL) then
		outputServerLog("BRAK POLACZENIA Z BAZA DANYCH!")
	else
		zapytanie("SET NAMES utf8;")
	end

end

addEventHandler("onResourceStart",resourceRoot, connect)

function pobierzTabeleWynikow(...)
	local h=dbQuery(SQL,...)
	if (not h) then 
		return nil
	end
	local rows = dbPoll(h, -1)
	return rows
end

function pobierzWyniki(...)
	local h=dbQuery(SQL,...)
	if (not h) then 
		return nil
	end
	local rows = dbPoll(h, -1)
	if not rows then return nil end
	return rows[1]
end

function zapytanie(...)
	local h=dbQuery(SQL,...)
	local result,numrows=dbPoll(h,-1)
	return numrows
end

--[[
function insertID()
	return mysql_insert_id(SQL)
end

function affectedRows()
	return mysql_affected_rows(SQL)
end
]]--

function fetchRows(query)
	local result=mysql_query(SQL,query)
	if (not result) then return nil end
	local tabela={}

	while true do
    	local row = mysql_fetch_row(result)
	    if (not row) then break end
	    table.insert(tabela,row)
	end
	mysql_free_result(result)
	return tabela
end