addEventHandler ( "onClientPlayerDamage",root,
  function ()
    if getElementData(source,"admin:antykill") then
        cancelEvent()
    end
end)
     
addEventHandler("onClientPlayerStealthKill",localPlayer,
  function (targetPlayer)
    if getElementData(targetPlayer,"admin:antykill") then
        cancelEvent()
    end
end)