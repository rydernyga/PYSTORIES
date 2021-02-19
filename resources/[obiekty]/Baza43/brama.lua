Brama = createObject (976, -2619.6000976563, 1226.0999755859, 49.599998474121, 0, 0, 76)
function OtworzBrame ()
moveObject ( Brama, 1000, -2619.6000976563, 1226.0999755859, 49.599998474121 )
end
addCommandHandler("PKFT", ZamknijBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, -2619.6000976563, 1226.0999755859, 46.299999237061 )
end
addCommandHandler("PKFT1", OtworzBrame )



-- <script src="brama.lua" />