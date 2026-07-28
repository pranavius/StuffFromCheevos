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

local function getTableEntryCount(tbl)
    local n = 0
    for _ in pairs(tbl) do n = n + 1 end
    return n
end

function DBUtils.BuildItemsCache()
    if not SFC_DB.itemsCache then SFC_DB.itemsCache = {} end
    local itemsCache = SFC_DB.itemsCache
    local toLoad = #SFC.Cosmetics + #SFC.Toys + #SFC.Pets + #SFC.Decor
    local updatesCount = 0

    for _, item in ipairs(SFC.Cosmetics) do
        Item:CreateFromItemID(item.itemID):ContinueOnItemLoad(function()
            toLoad = toLoad - 1
            local icon = select(5, C_Item.GetItemInfoInstant(item.itemID))
            local name = C_Item.GetItemNameByID(item.itemID)

            if not itemsCache[item.itemID] or isTableInvalidOrHasNilValues(itemsCache[item.itemID]) then
                itemsCache[item.itemID] = {
                    name = name,
                    icon = icon
                }
                updatesCount = updatesCount + 1
            end

            if toLoad == 0 then
                if updatesCount > 0 then
                    SFC.LogUtils.Message(DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Stuff From Cheevos"), "database updates:", HEIRLOOM_BLUE_COLOR:WrapTextInColorCode(updatesCount), "records")
                end
                EventRegistry:TriggerEvent("StuffFromCheevos.ItemsCached")
            end
        end)
    end

    for _, item in ipairs(SFC.Toys) do
        Item:CreateFromItemID(item.itemID):ContinueOnItemLoad(function()
            toLoad = toLoad - 1
            local icon = select(5, C_Item.GetItemInfoInstant(item.itemID))
            local name = C_Item.GetItemNameByID(item.itemID)

            if not itemsCache[item.itemID] or isTableInvalidOrHasNilValues(itemsCache[item.itemID]) then
                itemsCache[item.itemID] = {
                    name = name,
                    icon = icon
                }
                updatesCount = updatesCount + 1
            end

            if toLoad == 0 then
                if updatesCount > 0 then
                    SFC.LogUtils.Message(DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Stuff From Cheevos"), "database updates:", HEIRLOOM_BLUE_COLOR:WrapTextInColorCode(updatesCount), "records")
                end
                EventRegistry:TriggerEvent("StuffFromCheevos.ItemsCached")
            end
        end)
    end
    
    for _, item in ipairs(SFC.Pets) do
        if not item.itemID then
            toLoad = toLoad - 1
        else
            Item:CreateFromItemID(item.itemID):ContinueOnItemLoad(function()
                toLoad = toLoad - 1
                local name, icon = C_PetJournal.GetPetInfoByItemID(item.itemID)
    
                if not itemsCache[item.itemID] or isTableInvalidOrHasNilValues(itemsCache[item.itemID]) then
                    itemsCache[item.itemID] = {
                        name = name,
                        icon = icon
                    }
                    updatesCount = updatesCount + 1
                end
    
                if toLoad == 0 then
                    if updatesCount > 0 then
                        SFC.LogUtils.Message(DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Stuff From Cheevos"), "database updates:", HEIRLOOM_BLUE_COLOR:WrapTextInColorCode(updatesCount), "records")
                    end
                    EventRegistry:TriggerEvent("StuffFromCheevos.ItemsCached")
                end
            end)
        end
    end

    for _, item in ipairs(SFC.Decor) do
        Item:CreateFromItemID(item.itemID):ContinueOnItemLoad(function()
            toLoad = toLoad - 1
            local icon = select(5, C_Item.GetItemInfoInstant(item.itemID))
            local name = C_Item.GetItemNameByID(item.itemID)

            if not itemsCache[item.itemID] or isTableInvalidOrHasNilValues(itemsCache[item.itemID]) then
                itemsCache[item.itemID] = {
                    name = name,
                    icon = icon
                }
                updatesCount = updatesCount + 1
            end

            if toLoad == 0 then
                if updatesCount > 0 then
                    SFC.LogUtils.Message(DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Stuff From Cheevos"), "database updates:", HEIRLOOM_BLUE_COLOR:WrapTextInColorCode(updatesCount), "records")
                end
                EventRegistry:TriggerEvent("StuffFromCheevos.ItemsCached")
            end
        end)
    end
end

function DBUtils.ToggleShowCompleted()
    if not SFC_DB.filters then SFC_DB.filters = { showCompleted = true, searchTerm = "", sortOrder = "" } end
    SFC_DB.filters.showCompleted = not SFC_DB.filters.showCompleted
    EventRegistry:TriggerEvent("StuffFromCheevos.FiltersUpdated")
end