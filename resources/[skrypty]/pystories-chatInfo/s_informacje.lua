--[[
@author Sebastian "CrosRoad95" Jura <sebajura1234@gmail.com>
@copyright 2011-2021 Sebastian Jura <sebajura1234@gmail.com>
@license MIT
]]--

local wiadomki = {
    {"Zapraszamy do kupna konta premium, więcej info pod /premium - infoBOT"},
    {"Aby sprawdzić ekipe online, wpisz /admini - infoBOT"},
    {"Aby otworzyć poradnik kliknij przycisk F1 - infoBOT"},
    {"Masz problem lub chcesz zgłosić gracza? Użyj /report <nick/id powód a na pewno ktoś się zjawi i pomoże! - infoBOT"},
    {"Zapraszamy na serwerowego Team-Speak 3! IP: ts3-pystories.gclan.pl - infoBOT"},
    {"Zapraszamy na forum serwera kryje się one pod linkiem: mta-pystories.xaa.pl - infoBOT"},
}

function wiadomkaCzas ()
   losujWiadomke = math.random(1, #wiadomki)
   outputChatBox(">> "..wiadomki[losujWiadomke][1].."", getRootElement(), 0, 255, 255, true )
   outputServerLog('INFORMACJA>> '..wiadomki[losujWiadomke][1]..' - infoBOT')
end

setTimer(wiadomkaCzas, 200000, 0)