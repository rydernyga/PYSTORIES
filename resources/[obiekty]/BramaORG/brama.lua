Brama = createObject (980, 1527.0999755859, 663.5, 12.39999961853, 0, 0, 0.25)
function OtworzBrame ()
moveObject ( Brama, 1000, 1527.0999755859, 663.5, 12.39999961853 )
end
addCommandHandler("Fast", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, 1527.0999755859, 663.5, 6.8000001907349 )
end
addCommandHandler("Emd", ZamknijBrame )



-- <script src="brama.lua" />