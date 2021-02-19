--[[
Autorzy kodu:
	- Jurandovsky
	- Brzysiek
Edycja kodu:
	- Bone <bone.pystories@gmail.com>

System notyfikacji. 

Dziękujemy za mile spędzony z Wami czas, zapraszamy ponownie do skorzystania z naszych linii lotniczych.
--]]

-------------------------------------------------------------------------------------------------
-- zmieniaj do woli
local NOTIFICATION_LIMIT = 15 -- maksymalna ilość wyświetlanych notyfikacji na raz
local TIME = 4000 -- ile czasu 1 notyfikacja ma sie pojawiac (w milisekundach) (domyślna wartość jeśli nie podana we funkcji)
local FADE_TIME = 12000 -- ile czasu ma trwać animacja znikania (w milisekundach)
local OFFSET = 22 -- odstep miedzy wiadomosciami w pikselach 
local FONT_SIZE = 11 -- rozmiar czcionki
-- dalej już lepiej nie
-------------------------------------------------------------------------------------------------

local font = dxCreateFont("f.ttf", FONT_SIZE)
local notifications = {} 

-- addNotification(string text)
-- text - wiadomość
function addNotification(text)
	if type(text) ~= "string" then return false end 
	
	table.insert(notifications, {text=text, alpha=255, startTick=getTickCount(), length=TIME})
	if #notifications > NOTIFICATION_LIMIT then 
		table.remove(notifications, 1)
	end
	
	
	return true 
end 
addEvent("onClientAddNotification", true)
addEventHandler("onClientAddNotification", root, addNotification)

local screenW, screenH = guiGetScreenSize()
function renderNotifications() 
	local now = getTickCount() 
	
	local visibleNotifications = 0 
	
	local notif = table.reverse(notifications)
	for k,v in ipairs(notif) do 
		local offsetY = -((k-1)*OFFSET) 
		local x, y, w, h = screenW/2, offsetY + screenH/1.3, screenW/2, offsetY + screenH/1.3
		
		if now > v.startTick+v.length then
			local startTime = v.startTick+v.length 
			local progress = (now - startTime) / FADE_TIME
			v.alpha = interpolateBetween(v.alpha, 0, 0, 0, 0, 0, progress, "InOutQuad")
		end 
		
		if v.alpha > 0 then 
			visibleNotifications = visibleNotifications+1 
		end
		
		dxDrawText(v.text, x+1, y+1, w+1, h+1, tocolor(0, 0, 0, v.alpha), 1, font, "center", "center", false, false, true) 
		dxDrawText(v.text, x, y, w, h, tocolor(240, 240, 240, v.alpha), 1, font, "center", "center", false, false, true)
	end
	
	if visibleNotifications == 0 then 
		notifications = {}
	end 
end 
addEventHandler("onClientRender", root, renderNotifications)

-- poczebne 
function table.reverse(t)
    local reversedTable = {}
    local itemCount = #t
    for k, v in ipairs(t) do
        reversedTable[itemCount + 1 - k] = v
    end
    return reversedTable
end