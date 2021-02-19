Brama = createObject (2990, 1430.3000488281, 797.70001220703, 15.199999809265, 0, 0, 179.25)
function OtworzBrame ()
moveObject ( Brama, 1000, 1430.3000488281, 797.70001220703, 15.199999809265 )
end
addCommandHandler("c3", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, 1430.3000488281, 797.70001220703, 8.3000001907349 )
end
addCommandHandler("o3", ZamknijBrame )



-- <script src="brama.lua" />