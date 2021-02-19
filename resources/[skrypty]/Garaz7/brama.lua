--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

Brama = createObject (10184, -2127.43, -80.63, 36.7, 0, 0, 90)
--Brama2 = createObject (3037, -2127.43, -80.63, 40, 0, 0, 90)
function OtworzBrame ()
moveObject ( Brama, 1000, -2127.43, -80.63, 29 )
end
addCommandHandler("h.o7", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, -2127.43, -80.63, 36.7 )
end
addCommandHandler("h.z7", ZamknijBrame )

local text=createElement('text')
setElementPosition(text,-2127, -80.63, 36.7)
setElementData(text,"name","Teren prywatny!\n(Hooligans)")
setElementInterior(text,0)
setElementDimension(text,0)

-- <script src="brama.lua" />