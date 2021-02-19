local resourceRoot = getResourceRootElement(getThisResource())
     
addEventHandler("onClientResourceStart",resourceRoot,
function ()
    
    txd = engineLoadTXD ( "4.txd" )
    engineImportTXD ( txd, 201 )

    dff = engineLoadDFF ( "4.dff", 201 )
    engineReplaceModel ( dff, 201 )
    
end)

