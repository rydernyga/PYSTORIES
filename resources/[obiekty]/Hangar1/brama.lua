Brama = createObject (976, -2902.6999511719, 430, 4.0999999046326, 0, 0, 271.99951171875)
function OtworzBrame ()
moveObject ( Brama, 1000, -2902.6999511719, 430, 4.0999999046326 )
end
addCommandHandler("Zamknij3", OtworzBrame )

function ZamknijBrame ()
moveObject ( Brama, 1000, -2902, 437, 4.0999999046326 )
end
addCommandHandler("Otworz3", ZamknijBrame )



-- <script src="brama.lua" />