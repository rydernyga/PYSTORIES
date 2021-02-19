dawnlodetext1 = "Play Your Stories - Polski Serwer RPG" --- the text up
dawnlodetext2 = "Trwa pobieranie zasobów serwera..." --- the text in medium
dawnlodetext3 = "Forum: www.mta-pystories.cba.pl" --- the text under




dis = textCreateDisplay()
screentext = textCreateTextItem (dawnlodetext1, 0.5, 0.1, 2, 255,255,255, 255, 3.0, "center", "center",127 )
textDisplayAddText(dis,screentext)


dis1 = textCreateDisplay()
screentext1 = textCreateTextItem(dawnlodetext2, 0.5, 0.5, 2, 255,255,255, 255, 1.2, "center", "center",127 ) 
textDisplayAddText(dis1,screentext1)


dis2 = textCreateDisplay()
screentext2 = textCreateTextItem(dawnlodetext3, 0.5, 0.89, 2, 55,55,255, 255, 1.2, "center", "bottom",127 )
textDisplayAddText(dis2,screentext2)



addEventHandler("onResourceStart",resourceRoot,
    function ()
        for i,p in ipairs(getElementsByType("player")) do
            textDisplayAddObserver(dis,p)
            textDisplayAddObserver(dis1,p)
            textDisplayAddObserver(dis2,p)
        end
    end
)
 



addEventHandler("onPlayerJoin",root,
    function ()
        
    fadeCamera(source, true, 75)
    setCameraMatrix(source, -1834.34, 877.85, 297.09, 0.00, 0.00, 275.69)--x,y,z,r1,r2,r3    -1894.37,668.43,145.05,0.3,0.0,45.0
        textDisplayAddObserver(dis,source)
        textDisplayAddObserver(dis1,source)
        textDisplayAddObserver(dis2,source)
    end
)



 
addEvent("removeText",true)
addEventHandler("removeText",root,
    function ()
        textDisplayRemoveObserver(dis,source)
        textDisplayRemoveObserver(dis1,source)
        textDisplayRemoveObserver(dis2,source)
    end
)



