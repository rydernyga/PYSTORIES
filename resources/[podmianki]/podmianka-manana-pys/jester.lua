local txd = engineLoadTXD("manana.txd") 
engineImportTXD(txd, 410) 
local dff = engineLoadDFF("manana.dff", 410) 
engineReplaceModel(dff, 410)