Brama = createObject (2990, 1527.4000244141, 663.59997558594, 13.60000038147, 0, 0, 359.75)
function OtworzBrame ()
moveObject ( Brama, 1000, 1527.4000244141, 663.59997558594, 13.60000038147 )
end
addCommandHandler("c2", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, 1527.4000244141, 663.59997558594, 5.4000000953674 )
end
addCommandHandler("o2", ZamknijBrame )



-- <script src="brama.lua" />