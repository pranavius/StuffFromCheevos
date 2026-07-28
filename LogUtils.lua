local SFC = select(2, ...)

local LogUtils = {}
SFC.LogUtils = LogUtils

function LogUtils.Message(...)
    print(CreateSimpleTextureMarkup("Interface/AddOns/StuffFromCheevos/Media/SFC-Logo", 15, 15), ...)
end

function LogUtils.DebugMessage(...)
    if SFC_DB.debug then LogUtils.Message(LEGENDARY_ORANGE_COLOR:WrapTextInColorCode("[Debug]"), ...) end
end