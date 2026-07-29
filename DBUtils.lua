local SFC = select(2, ...)

local DBUtils = {}
SFC.DBUtils = DBUtils

local SFC_DB_DEFAULTS = {
    debug = false,
    itemsCache = {},
    filters = { showCompleted = true, searchTerm = "", sortOrder = "" },
    uiOptions = { animateProgressBar = true, fadeWindowWhenMoving = true }
}

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

local function printDbUpdatesCount(updatesCount)
    if updatesCount > 0 then
        SFC.LogUtils.Message(DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Stuff From Cheevos"), "database updates:", HEIRLOOM_BLUE_COLOR:WrapTextInColorCode(updatesCount), updatesCount == 1 and "record" or "records")
    else
        SFC.LogUtils.DebugMessage("No item records updated")
    end
end

function DBUtils.EnsureDefaults()
    if not SFC_DB then
        SFC_DB = SFC_DB_DEFAULTS
        return
    end

    for k, v in pairs (SFC_DB_DEFAULTS) do
        if not SFC_DB[k] then
            SFC_DB[k] = v
            if SFC_DB.debug then SFC.LogUtils.DebugMessage("Added missing DB property", k, "with default value", v) end
        elseif type(v) == "table" then
            for dK, dV in pairs(SFC_DB_DEFAULTS[k]) do
                if not SFC_DB[k][dK] then
                    SFC_DB[k][dK] = dV
                    if SFC_DB.debug then SFC.LogUtils.DebugMessage("Added nested DB property", k.."."..dK, "with default value", dV) end
                end
            end
        end
    end
end

---@param property string
---@return any value
function DBUtils.GetProperty(property)
    if not SFC_DB then return nil end
    if SFC_DB[property] then return SFC_DB[property] end
    for k, v in pairs(SFC_DB) do
        if type(v) == "table" and SFC_DB[k][property] then return SFC_DB[k][property] end
    end
    return nil
end

function DBUtils.BuildItemsCache()
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
                printDbUpdatesCount(updatesCount)
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
                printDbUpdatesCount(updatesCount)
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
                printDbUpdatesCount(updatesCount)
                EventRegistry:TriggerEvent("StuffFromCheevos.ItemsCached")
            end
        end)
    end
end

---@param itemID number
---@return table entry
function DBUtils.GetItemFromCache(itemID)
    if not DBUtils.GetProperty("itemsCache") or not SFC_DB.itemsCache[itemID] then return {} end
    return SFC_DB.itemsCache[itemID]
end

function DBUtils.ToggleDebugMode()
    SFC_DB.debug = not SFC_DB.debug
    SFC.LogUtils.Message("Debugging mode is", DARKYELLOW_FONT_COLOR:WrapTextInColorCode(SFC_DB.debug and "enabled" or "disabled"))
end

function DBUtils.ToggleShowCompleted()
    SFC_DB.filters.showCompleted = not SFC_DB.filters.showCompleted
    EventRegistry:TriggerEvent("StuffFromCheevos.FiltersUpdated")
end