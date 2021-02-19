--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

txd = engineLoadTXD("previon.txd")
engineImportTXD(txd, 436)
dff = engineLoadDFF("previon.dff", 436)
engineReplaceModel(dff, 436)
