Brama = createObject (975, -2622.6999511719, 1231.5, 51.299999237061, 0, 0, 77.75)
function OtworzBrame ()
moveObject ( Brama, 1000, -2622.6999511719, 1231.5, 51.299999237061 )
end
addCommandHandler("PKFT1", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, -2622.6999511719, 1231.5, 47.5 )
end
addCommandHandler("PKFT", ZamknijBrame )



-- <script src="brama.lua" />