local SFC = select(2, ...)

local LogUtils = {}
SFC.LogUtils = LogUtils

function LogUtils.Message(...)
    print(CreateSimpleTextureMarkup("Interface/AddOns/StuffFromCheevos/Media/SFC-Logo", 15, 15), ...)
end

---Wrapper around the regular LogUtils.Message function that only prints a message when debugging is enabled
function LogUtils.DebugMessage(...)
    if SFC.DBUtils.GetProperty("debug") then LogUtils.Message(LEGENDARY_ORANGE_COLOR:WrapTextInColorCode("[Debug]"), ...) end
end