Brama = createObject (2990, -2049.35, -102.99, 36.42, 0, 0, 180)
function OtworzBrame ()
moveObject ( Brama, 1000, -2049.35, -102.99 )
end
addCommandHandler("Haslo123", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, -2049.60, -105.20, 31.78 )
end
addCommandHandler("haslo123", ZamknijBrame )



-- <script src="brama.lua" />