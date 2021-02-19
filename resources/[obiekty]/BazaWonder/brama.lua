Brama = createObject (2990, -2050.13, -103.92, 35.22, 0, 0, 180)
function OtworzBrame ()
moveObject ( Brama, 1000, -2050.13, -103.92, 35.22 )
end
addCommandHandler("haslO123", ZamknijBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, -2058.22, -101.72, 35.17 )
end
addCommandHandler("haslo321", OtworzBrame )



-- <script src="brama.lua" />