txd = engineLoadTXD("bmymib.txd")
engineImportTXD(txd, 301)
dff = engineLoadDFF("bmymib.dff", 301)
engineReplaceModel(dff, 301)