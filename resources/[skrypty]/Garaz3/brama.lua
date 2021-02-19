--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

Brama = createObject (17951, 1548.0999755859, 729.20001220703, 11.60000038147, 0, 0, 0)
function OtworzBrame ()
moveObject ( Brama, 1000, 1548.0999755859, 729.20001220703, 11.60000038147 )
end
addCommandHandler("gc3", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, 1548.0999755859, 729.20001220703, 7.5999999046326 )
end
addCommandHandler("go3", ZamknijBrame )



-- <script src="brama.lua" />