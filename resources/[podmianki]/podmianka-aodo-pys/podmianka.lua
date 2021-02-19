
local resourceRoot = getResourceRootElement(getThisResource())

addEventHandler("onClientResourceStart",resourceRoot,
function ()
	txd = engineLoadTXD ( "aodo.txd" )
	engineImportTXD ( txd, 290 )
	
	dff = engineLoadDFF ( "aodo.dff", 290 )
	engineReplaceModel ( dff, 290 )
end)

