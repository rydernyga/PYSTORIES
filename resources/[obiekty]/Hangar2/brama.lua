Brama = createObject (976, -2903.1000976563, 444.79998779297, 4, 0, 0, 271.25)
function OtworzBrame ()
moveObject ( Brama, 1000, -2903.1000976563, 444.79998779297, 4 )
end
addCommandHandler("Zamknij3", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, -2903, 451.60000610352, 4 )
end
addCommandHandler("Otworz3", ZamknijBrame )



-- <script src="brama.lua" />