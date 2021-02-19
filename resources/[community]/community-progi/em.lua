function replaceModel()
  txd = engineLoadTXD("em.txd", 2926 )
  engineImportTXD(txd, 2926)
  dff = engineLoadDFF("em.dff", 2926 )
  engineReplaceModel(dff, 2926)
  col= engineLoadCOL ( "em.col" )
  engineReplaceCOL ( col, 2926 )
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)


progi = 
{
--{1475.79, -1732.11, 13.38-1.1, -0.00, 0.00, 90.23},
--{1484.91, -1732.37, 13.38-1.1, -0.00, 0.00, 269.02},
--{1749.36, -1682.40, 13.38-1.1, -0.00, 0.00, 185.85},
--{1881.60, -1752.09, 13.38-1.1, -0.00, 0.00, 266.79},
--{1961.48, -1991.38, 13.39-1.1, -0.00, 0.00, 179.26},
--{1588.20, -1591.63, 13.38-1.1, -0.00, 0.00, 270.78},
{-1895.65, 884.99, 35.02-1.1, -0.00, 0.00, 178.98},
{-1903.12, 885.08, 35.02-1.1, -0.00, 0.00, 178.57},
{-5.36,1198.36,19.21-1.05, -0.00, 0.00, 90},
{-1,1198.36,19.21-1.05, -0.00, 0.00, 90},

}

for i,p in pairs(progi) do
	createObject(2926,p[1],p[2],p[3],p[4] or 0,p[5] or 0, p[6] or 0)
end