Brama = createObject (980, -2199.5, 309.60000610352, 36.900001525879, 0, 0, 0)
function OtworzBrame ()
moveObject ( Brama, 1000, -2199.5, 309.60000610352, 36.900001525879 )
end
addCommandHandler("JBB", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, -2199.5, 309.60000610352, 31.200000762939 )
end
addCommandHandler("mamatata11", ZamknijBrame )



-- <script src="brama.lua" />