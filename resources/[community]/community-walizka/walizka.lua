addCommandHandler ( "walizka", function(plr,cmd,kwota,...)
if kwota and ... then
local accName = getAccountName ( getPlayerAccount ( plr ) )
if isObjectInACLGroup ("user."..accName, aclGetGroup ( "Admin" ) ) then
x,y,z = getElementPosition ( plr )
msg = table.concat ( {...}, " " )
walizka = createPickup ( x, y+3, z, 3, 1210, 0, 0 )
setElementData ( walizka, "kasa", tonumber(kwota) )
outputChatBox ( "* Administrator(ka) zgubił(a) walizkę", root, 250, 10, 0  )
outputChatBox ( "* Podpowiedź: "..msg.."", root, 250, 10, 0 )
end
end

addEventHandler ( "onPickupHit", walizka, function(plr)
x = getElementData ( walizka, "kasa" )
outputChatBox ( "* "..getPlayerName(plr).." znalazł(a) walizkę, a w niej "..string.format("%0.2f",x/100*100).." PLN", root, 250, 10, 0 )
destroyElement ( walizka )
givePlayerMoney ( plr, tonumber(x)*1)
end)
end)