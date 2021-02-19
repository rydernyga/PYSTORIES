Brama = createObject (980, -2433.5, 497.29998779297, 31.700000762939, 0, 0, 23.75)
function OtworzBrame ()
moveObject ( Brama, 1000, -2433.5, 497.29998779297, 31.700000762939 )
end
addCommandHandler("b.z", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, -2433.5, 497.29998779297, 25.799999237061 )
end
addCommandHandler("b.o", ZamknijBrame )



-- <script src="brama.lua" />