--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

Brama = createObject (17951, 1423.6999511719, 676.5, 11.60000038147, 0, 0, 0)
function OtworzBrame ()
moveObject ( Brama, 1000, 1423.6999511719, 676.5, 11.60000038147 )
end
addCommandHandler("gc2", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, 1423.6999511719, 676.5, 7.5999999046326 )
end
addCommandHandler("go2", ZamknijBrame )



-- <script src="brama.lua" />