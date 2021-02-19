Brama = createObject (980, -2861.8999023438, 473.89999389648, 6.1999998092651, 0, 0, 260)
function OtworzBrame ()
moveObject ( Brama, 1000, -2861.8999023438, 473.89999389648, 6.1999998092651 )
end
addCommandHandler("Zamknij3", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, -2860.6000976563, 485.60000610352, 6.1999998092651 )
end
addCommandHandler("Otworz3", ZamknijBrame )



-- <script src="brama.lua" />