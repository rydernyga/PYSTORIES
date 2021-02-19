Brama = createObject (2990, 1447.5999755859, 663.5, 13.300000190735, 0, 0, 359)
function OtworzBrame ()
moveObject ( Brama, 1000, 1447.5999755859, 663.5, 13.300000190735 )
end
addCommandHandler("Otwieram", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, 1447.5999755859, 663.5, 5.4000000953674 )
end
addCommandHandler("Zamykam", ZamknijBrame )



-- <script src="brama.lua" />