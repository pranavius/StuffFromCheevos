local SFC = select(2, ...)

local DBUtils = {}
SFC.DBUtils = DBUtils

---@type SFCDatabaseSchema
SFC_DB_DEFAULTS = {
    debug = false,
    itemsCache = {},
    filters = { showCompleted = true, searchTerm = "", sortOrder = "" },
    uiOptions = { animateProgressBar = true, fadeWindowWhenMoving = true }
}

---@param tbl table
---@return boolean isInvalid
local function isTableInvalidOrHasNilValues(tbl)
    if not tbl then return true end

    for _, v in pairs(tbl) do
        if v == nil then return true end
    end

    return false
end

---@param tbl table
---@return number count
local function getTableEntryCount(tbl)
    local n = 0
    for _ in pairs(tbl) do n = n + 1 end
    return n
end

---Ensures saved variables' database values are up to date with latest properties and default values if they are missing.
---Function operates under the expectation that tables are not nested deeper than 1 level
function DBUtils.EnsureDefaults()
    if not SFC_DB then
        SFC_DB = SFC_DB_DEFAULTS
        return
    end

    for k, v in pairs (SFC_DB_DEFAULTS) do
        if SFC_DB[k] == nil then
            SFC_DB[k] = v
            SFC.LogUtils.DebugMessage("Added missing DB property", k, "with default value", v)
        elseif type(v) == "table" then
            for dK, dV in pairs(SFC_DB_DEFAULTS[k]) do
                if SFC_DB[k][dK] == nil then
                    SFC_DB[k][dK] = dV
                    SFC.LogUtils.DebugMessage("Added nested DB property", k.."."..dK, "with default value", dV)
                end
            end
        end
    end
end

---Retrive a value from the database that is assigned to the provided property name.
---Function operates under the expectations that tables are not nested deeper than 1 level and that each property name is unique
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

---Helper function to check whether the itemsCache has finished populating for all expected items.
---If all updates are completed, this triggers an event that refreshes the AddOn's list of rewards to ensure data is not missing for any of them.
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

    ---@param list DataItem[]
    ---@param source string Parameter primarily used for development/debugging purposes
    local function cacheItems(list, source)
        for _, item in ipairs(list) do
            -- Ignore items that are defined by something other than item ID
            -- Also ignore items where instant info or achievement info can't be found (not in game, likely added preemptively for a new patch)
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
---@return CacheData? entry
function DBUtils.GetItemFromCache(itemID)
    if not DBUtils.GetProperty("itemsCache") or not SFC_DB.itemsCache[itemID] then return nil end
    return SFC_DB.itemsCache[itemID]
end

function DBUtils.ToggleDebugMode()
    SFC_DB.debug = not SFC_DB.debug
    SFC.LogUtils.Message("Debugging mode is", DARKYELLOW_FONT_COLOR:WrapTextInColorCode(SFC_DB.debug and "enabled" or "disabled"))
end

---Triggers an event to update rewards list in the AddOn window
function DBUtils.ToggleShowCompleted()
    SFC_DB.filters.showCompleted = not SFC_DB.filters.showCompleted
    EventRegistry:TriggerEvent("StuffFromCheevos.FiltersUpdated")
end