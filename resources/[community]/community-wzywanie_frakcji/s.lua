-- skrypt by CEO oraz marcin778 --

function straz_pozarna(plr,commands, ...) 
local msg = table.concat ( {...}, " " ) 
outputChatBox("* Wezwałeś(aś) Państwową Straż Pożarną !",plr,255,255,255)
for k,v in ipairs(getElementsByType("player")) do
if getElementData(v, "player:faction")=="PSP" then
outputChatBox( "* "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","")..", zadzwonił po Was, powód: "..msg:gsub("#%x%x%x%x%x%x","")..". ",v) 
    end
 end
end 
addCommandHandler("wezwij.psp",straz_pozarna)

function pogotowie(plr,commands, ...) 
local msg = table.concat ( {...}, " " ) 
outputChatBox("* Wezwałeś(aś) Pogotowie Ratunkowe !",plr,255,255,255)
for k,v in ipairs(getElementsByType("player")) do
if getElementData(v, "player:faction")=="SAMC" then
outputChatBox( "* "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","")..", zadzwonił po Was, powód: "..msg:gsub("#%x%x%x%x%x%x","")..". ",v) 
    end
 end
end 
addCommandHandler("wezwij.samc",pogotowie)

function policja(plr,commands, ...) 
local msg = table.concat ( {...}, " " ) 
outputChatBox("* Wezwałeś(aś) Policje !",plr,255,255,255)
for k,v in ipairs(getElementsByType("player")) do
if getElementData(v, "player:faction")=="SAPD" then
outputChatBox( "* "..getPlayerName(plr):gsub("#%x%x%x%x%x%x","")..", zadzwonił po Was, powód: "..msg:gsub("#%x%x%x%x%x%x","")..". ",v) 
    end
 end
end 
addCommandHandler("wezwij.sapd",policja)