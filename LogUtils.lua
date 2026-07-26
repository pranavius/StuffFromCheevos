local SFC = select(2, ...)

local LogUtils = {}
SFC.LogUtils = LogUtils

function LogUtils.Message(...)
    print(CreateSimpleTextureMarkup("Interface/AddOns/StuffFromCheevos/Media/SFC-Logo", 15, 15), ...)
end