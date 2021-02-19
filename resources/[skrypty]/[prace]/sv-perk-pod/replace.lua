--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

txd = engineLoadTXD("streed.txd")
engineImportTXD(txd, 400)
dff = engineLoadDFF("streed.dff", 437)
engineReplaceModel(dff, 400)
