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

function DBUtils.EnsureDefaults()
    if not SFC_DB then
        SFC_DB = SFC_DB_DEFAULTS
        return
    end

    for k, v in pairs (SFC_DB_DEFAULTS) do
        if SFC_DB[k] == nil then
            SFC_DB[k] = v
            if SFC_DB.debug then SFC.LogUtils.DebugMessage("Added missing DB property", k, "with default value", v) end
        elseif type(v) == "table" then
            for dK, dV in pairs(SFC_DB_DEFAULTS[k]) do
                if SFC_DB[k][dK] == nil then
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

---@param toLoad number
---@param updatesCount number
local function checkForLoadCompletion(toLoad, updatesCount)
    if toLoad == 0 then
        if updatesCount > 0 then
            SFC.LogUtils.Message(DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Stuff From Cheevos"), "database updates:", HEIRLOOM_BLUE_COLOR:WrapTextInColorCode(updatesCount), updatesCount == 1 and "record" or "records")
        else
            SFC.LogUtils.DebugMessage("No item records updated")
        end
        EventRegistry:TriggerEvent("StuffFromCheevos.ItemsCached")
    end
end

function DBUtils.BuildItemsCache()
    local itemsCache = SFC_DB.itemsCache
    local toLoad = #SFC.Mounts + #SFC.Cosmetics + #SFC.Toys + #SFC.Pets + #SFC.Decor
    local updatesCount = 0
    local pending = {}

    ---@class DataItem
    ---@field itemID number?
    ---@field spellID number?
    ---@field achievementID number
    ---@field categoryID number
    ---@field faction string?

    ---@param list DataItem[]
    ---@param source string Parameter primarily used for development/debugging purposes
    local function cacheItems(list, source)
        for _, item in ipairs(list) do
            -- Ignore items that are defined by something other than item ID
            -- Also ignore items where instant info or achievement info can't be found (not in game, likely added preemptively of a new patch)
            if not item.itemID or not C_Item.GetItemInfoInstant(item.itemID) or not GetAchievementInfo(item.achievementID) then
                toLoad = toLoad - 1
                checkForLoadCompletion(toLoad, updatesCount)
            else
                local pEntry = { itemID = item.itemID, source = source, achievementID = item.achievementID, resolved = false }
                table.insert(pending, pEntry)
                Item:CreateFromItemID(item.itemID):ContinueOnItemLoad(function()
                    pEntry.resolved = true
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
                    checkForLoadCompletion(toLoad, updatesCount)
                end)
            end
        end
    end

    cacheItems(SFC.Mounts, "Mounts")
    cacheItems(SFC.Cosmetics, "Cosmetics")
    cacheItems(SFC.Toys, "Toys")
    cacheItems(SFC.Pets, "Pets")
    cacheItems(SFC.Decor, "Decor")

    if SFC.DBUtils.GetProperty("debug") then
        C_Timer.After(10, function()
            if toLoad > 0 then
                SFC.LogUtils.DebugMessage(toLoad, "item(s) never resolved:")
                for _, entry in ipairs(pending) do
                    if not entry.resolved then
                        print((" - item ID: %d source: \"%s\" achievement ID: %d"):format(entry.itemID, entry.source, entry.achievementID))
                    end
                end
            end
        end)
    
    end
end

---@param itemID number
---@return table? entry
function DBUtils.GetItemFromCache(itemID)
    if not DBUtils.GetProperty("itemsCache") or not SFC_DB.itemsCache[itemID] then return nil end
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