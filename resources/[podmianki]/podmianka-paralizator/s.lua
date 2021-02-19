function taser(atakujacy, bron, cialo, starciles)
if atakujacy and (bron == 23) then
setElementFrozen(source,true)
setPedAnimation(source, "CRACK", "crckdeth2", -1, true, false)
setTimer(setElementFrozen,30000,1,source,false)		
setTimer(setPedAnimation,30000,1,source,false)		
end
setElementHealth(source, getElementHealth(source)+starciles)
end
addEventHandler ( "onPlayerDamage", getRootElement (), taser)