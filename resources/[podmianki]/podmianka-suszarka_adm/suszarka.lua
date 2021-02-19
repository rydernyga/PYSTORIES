local resourceRoot = getResourceRootElement(getThisResource())
     
addEventHandler("onClientResourceStart",resourceRoot,
function ()
    
    txd = engineLoadTXD ( "22.txd" )
    engineImportTXD ( txd, 346 )

    dff = engineLoadDFF ( "22.dff", 346 )
    engineReplaceModel ( dff, 346 )

end)