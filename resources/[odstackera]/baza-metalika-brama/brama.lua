Brama = createObject (976, -2218, 14, 34.36, 0, 0, 90)
--Brama2 = createObject (3037, -2127.43, -80.63, 40, 0, 0, 90)
function OtworzBrame ()
moveObject ( Brama, 1000, -2218, 14, 28)
end
addCommandHandler("m.o", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, -2218, 14, 34.36)
end
addCommandHandler("m.z", ZamknijBrame )



-- <script src="brama.lua" />