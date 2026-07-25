local SFC = select(2, ...)

local DBUtils = {}
SFC.DBUtils = DBUtils

local function isTableInvalidOrHasNilValues(tbl)
    if not tbl then return true end

    for _, v in pairs(tbl) do
        if v == nil then return true end
    end

    return false
end

function DBUtils.BuildCosmeticsCache()
    if not SFC_DB.cosmetics then SFC_DB.cosmetics = {} end
    local cosmetics = SFC_DB.cosmetics
    local toLoad = #SFC.Cosmetics

    for _, item in ipairs(SFC.Cosmetics) do
        Item:CreateFromItemID(item.itemID):ContinueOnItemLoad(function()
            toLoad = toLoad - 1
            local icon = select(5, C_Item.GetItemInfoInstant(item.itemID))
            local name = C_Item.GetItemNameByID(item.itemID)

            if not cosmetics[item.itemID] or isTableInvalidOrHasNilValues(cosmetics[item.itemID]) then
                cosmetics[item.itemID] = {
                    name = name,
                    icon = icon
                }
            end

            if toLoad == 0 then
                print("Loaded cosmetics cache :O")
                EventRegistry:TriggerEvent("StuffFromCheevos.CosmeticsCached")
            end
        end)
    end

end