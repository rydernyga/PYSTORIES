Brama = createObject (2990, 1447.5999755859, 663.40002441406, 13.60000038147, 0, 0, 359.75)
function OtworzBrame ()
moveObject ( Brama, 1000, 1447.5999755859, 663.40002441406, 13.60000038147 )
end
addCommandHandler("c1", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, 1447.5999755859, 663.40002441406, 5.8000001907349 )
end
addCommandHandler("o1", ZamknijBrame )



-- <script src="brama.lua" />