function NowaAnkieta (thePlayer,cmd,...)
    local accName = getAccountName ( getPlayerAccount ( thePlayer ) ) 
     if isObjectInACLGroup ("user."..accName, aclGetGroup ( "Admin" ) ) then
             
                                                     AllArgumenty = {...}
                                                     TrescAnkiety = table.concat(AllArgumenty, " ")
                    outputChatBox("  ", getRootElement(), 0, 0, 0)
                    outputChatBox("* Wystartowała nowa ankieta!", getRootElement(), 255, 0, 0)
                    outputChatBox("* Pytanie brzmi: "..TrescAnkiety.."?", getRootElement(), 255, 0, 0)
                    outputChatBox("* Aby zagłosować pozytywnie wpisz /tak", getRootElement(), 255, 0, 0)
                    outputChatBox("* Natomiast aby głosować negatywnie wpisz /nie", getRootElement(), 255, 0, 0)
                    outputChatBox("* Głosowanie jest anonimowe, a wyniki ukażą się za minutę!", getRootElement(), 255, 0, 0)
                    outputChatBox("  ", getRootElement(), 0, 0, 0)
                    
                        addCommandHandler("tak", POZYTYWNIE)
                        addCommandHandler("nie", NEGATYWNIE)

                                                                    GlosyNaNIE = 0
                                                                    GlosyNaTAK = 0
                                                                    GraczeGlosujacy = 0

                        for i, gracz in ipairs(getElementsByType("player")) do
                                setElementData(gracz, "MozeGlosowac", true)
                        end
                    TimerZakoncz = setTimer(ZakonczAnkiete, 1000*60*1,1)
                    TimerPrzypomnienie = setTimer(Przypomnienie, 1000*60*1/2,1)

    else

        outputChatBox("* Odmowa dostępu!!!", thePlayer, 255, 0, 0)

    end

end

addCommandHandler("ankieta.stworz", NowaAnkieta)

function Przypomnienie()

    outputChatBox("  ", getRootElement(), 0, 0, 0)
    outputChatBox("* Ankieta dobiegnie końca za 30 sekund!", getRootElement(), 255, 0, 0)
    outputChatBox("  ", getRootElement(), 0, 0, 0)
    
end


function POZYTYWNIE(glosujacy,cmd)

    if getElementData(glosujacy, "MozeGlosowac") then

            GlosyNaTAK = GlosyNaTAK + 1
            GraczeGlosujacy = GraczeGlosujacy + 1
            setElementData(glosujacy, "MozeGlosowac", false)
            outputChatBox("* Zagłosowałeś(aś) na TAK!",glosujacy,255,255,255,true)

            else

            outputChatBox("* Już głosowałeś(aś) w tej ankiecie!",glosujacy,255,255,255,true)

    end

end


function NEGATYWNIE(glosujacy,cmd)

    if getElementData(glosujacy, "MozeGlosowac") then

            GlosyNaNIE = GlosyNaNIE + 1
            GraczeGlosujacy = GraczeGlosujacy + 1
            setElementData(glosujacy, "MozeGlosowac", false)
            outputChatBox("* Zagłosowałeś(aś) na NIE!",glosujacy,255,255,255,true)

            else

            outputChatBox("* Już głosowałeś(aś) w tej ankiecie!",glosujacy,255,255,255,true)

    end

end

function ZakonczAnkiete()

        removeCommandHandler("tak",POZYTYWNIE)
        removeCommandHandler("nie",NEGATYWNIE)

                    outputChatBox("  ", getRootElement(), 0, 0, 0)
                    outputChatBox("* Ankieta dobiegła końca!", getRootElement(), 255, 0, 0)
                    outputChatBox("* Pytanie brzmiało: "..TrescAnkiety.."?", getRootElement(), 255, 0, 0)
                    outputChatBox("* Oddano "..GlosyNaTAK.. " głos/y/ów na TAK", getRootElement(), 255, 0, 0)
                    outputChatBox("* Oddano "..GlosyNaNIE.. " głos/y/ów na NIE", getRootElement(), 255, 0, 0)
                    outputChatBox("* W głosowaniu wzieło udział "..GraczeGlosujacy.." gracz/y!", getRootElement(), 255, 0, 0)

                                    if GlosyNaTAK>GlosyNaNIE then
                                            outputChatBox("* Wynik: Więcej osób zagłosowało na TAK",getRootElement(),255,0,0,true)
                                    elseif GlosyNaTAK<GlosyNaNIE then
                                            outputChatBox("* Wynik: Więcej osób zagłosowało na NIE",getRootElement(),255,0,0,true)
                                    elseif GlosyNaNIE==GlosyNaTAK then
                                            outputChatBox("* Wynik: Żadna opcja nie uzyskała przewagi 1 głosu!",getRootElement(),255,0,0,true)
                                    end

                    outputChatBox("  ", getRootElement(), 0, 0, 0)
end

function AnulujAnkiete(thePlayer)

    local accName = getAccountName ( getPlayerAccount ( thePlayer ) ) 

        if isObjectInACLGroup ("user."..accName, aclGetGroup ( "Admin" ) ) then

            outputChatBox("* Ankieta została anulowana!!!", getRootElement(), 0, 0, 0)
            killTimer(TimerZakoncz)
            killTimer(TimerPrzypomnienie)
            removeCommandHandler("nie",NEGATYWNIE)
            removeCommandHandler("tak",POZYTYWNIE)

        else

            outputChatBox("* Odmowa dostępu!!!", thePlayer, 255, 0, 0)

    end

end

addCommandHandler("ankieta.anuluj", AnulujAnkiete)

function PomocAnkieta(thePlayer)

outputChatBox("  ", thePlayer, 0, 0, 0)
outputChatBox("* /ankieta.stworz -- Tworzy nową ankiete.", thePlayer, 255, 0, 0)
outputChatBox("* Użycie: /ankieta.stworz [pytanie] | Znak zapytania jest dodawany automatycznie ", thePlayer, 255, 0, 0)
outputChatBox("* /ankieta.anuluj -- Anuluje obecna ankiete ", thePlayer, 255, 0, 0)
outputChatBox("* /ankieta.pomoc -- Wyświetla wszystkie możliwe komendy odnośnie ankiety ", thePlayer, 255, 0, 0)
outputChatBox("  ", thePlayer, 0, 0, 0)

end

addCommandHandler("ankieta.pomoc", PomocAnkieta)