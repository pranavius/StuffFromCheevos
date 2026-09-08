local SFC = select(2, ...)

local RewardLists = {}
SFC.RewardLists = RewardLists

---@return Reward[]
function RewardLists.GetMounts()
    ---@type Reward[]
    local result = {}
    for _, reward in ipairs(SFC.Mounts) do
        if reward.spellID and (not reward.faction or reward.faction == SFCMain.faction) then
            local spellInfo = C_Spell.GetSpellInfo(reward.spellID)
            tinsert(result, {
                name = spellInfo.name,
                spellID = spellInfo.spellID,
                achievementID = reward.achievementID,
                categoryID = reward.categoryID,
                type = "Mount",
                icon = spellInfo.originalIconID,
                faction = reward.faction
            })
        else
            local mountID = C_MountJournal.GetMountFromItem(reward.itemID)
            if mountID and (not reward.faction or reward.faction == SFCMain.faction) then
                local mountName, _, iconID = C_MountJournal.GetMountInfoByID(mountID)
                tinsert(result, {
                    name = mountName,
                    itemID = reward.itemID,
                    achievementID = reward.achievementID,
                    categoryID = reward.categoryID,
                    type = "Mount",
                    icon = iconID,
                    faction = reward.faction
                })
            elseif not mountID and SFC.DBUtils.GetItemFromCache(reward.itemID) then
                tinsert(result, {
                    name = SFC.DBUtils.GetItemFromCache(reward.itemID).name or "Unknown Mount ("..reward.itemID..")",
                    itemID = reward.itemID,
                    achievementID = reward.achievementID,
                    categoryID = reward.categoryID,
                    type = "Mount",
                    icon = SFC.DBUtils.GetItemFromCache(reward.itemID).icon or 134400,
                    faction = reward.faction
                })
            elseif reward.faction ~= SFCMain.faction then
                SFC.LogUtils.DebugMessage("Mount for item ID", reward.itemID, "excluded due to faction mismatch")
            else
                SFC.LogUtils.DebugMessage("Mount for item ID", reward.itemID, "not found")
            end
        end
    end

    return result
end

---@return Reward[]
function RewardLists.GetTitles()
    ---@type Reward[]
    local result = {}
    for _, reward in ipairs(SFC.Titles) do
        if reward.titleID and reward.titleID > 0 then
            local title = GetTitleName(reward.titleID)
    
            if title and title ~= "" and (not reward.faction or reward.faction == SFCMain.faction) then
                tinsert(result, {
                    name = title,
                    achievementID = reward.achievementID,
                    categoryID = reward.categoryID,
                    type = "Title",
                    icon = "interface/icons/inv_scroll_05",
                    faction = reward.faction
                })
            elseif title and title ~= "" then
                SFC.LogUtils.DebugMessage("Title ID", reward.titleID, "excluded due to faction mismatch")
            else
                SFC.LogUtils.DebugMessage("No title found for title ID", reward.titleID)
            end
        end
    end

    return result
end

---@return Reward[]
function RewardLists.GetCosmetics()
    ---@type Reward[]
    local result = {}
    if not SFC.DBUtils.GetProperty("itemsCache") then return result end

    for _, reward in ipairs(SFC.Cosmetics) do
        if SFC.DBUtils.GetItemFromCache(reward.itemID) and (not reward.faction or reward.faction == SFCMain.faction) then
            tinsert(result, {
                name = SFC.DBUtils.GetItemFromCache(reward.itemID).name or "Unknown Cosmetic ("..reward.itemID..")",
                itemID = reward.itemID,
                achievementID = reward.achievementID,
                categoryID = reward.categoryID,
                type = "Cosmetic",
                icon = SFC.DBUtils.GetItemFromCache(reward.itemID).icon or 134400,
                faction = reward.faction
            })
        end
    end

    return result
end

---@return Reward[]
function RewardLists.GetCustomizations()
    ---@type Reward[]
    local result = {}

    for _, reward in ipairs(SFC.Customizations) do
        local rewardText = select(11, GetAchievementInfo(reward.achievementID))
        if rewardText and (not reward.faction or reward.faction == SFCMain.faction) then
            tinsert(result, {
                name = rewardText:gsub("^.+:%s", ""),
                achievementID = reward.achievementID,
                categoryID = reward.categoryID,
                type = "Customization",
                icon = type(reward.icon) == "number" and reward.icon or nil,
                atlas = type(reward.icon) == "string" and reward.icon or nil,
                faction = reward.faction
            })
        end
    end

    return result
end

---@return Reward[]
function RewardLists.GetToys()
    ---@type Reward[]
    local result = {}
    if not SFC.DBUtils.GetProperty("itemsCache") then return result end

    for _, reward in ipairs(SFC.Toys) do
        if SFC.DBUtils.GetItemFromCache(reward.itemID) and (not reward.faction or reward.faction == SFCMain.faction) then
            tinsert(result, {
                name = SFC.DBUtils.GetItemFromCache(reward.itemID).name or "Unknown Toy ("..reward.itemID..")",
                itemID = reward.itemID,
                achievementID = reward.achievementID,
                categoryID = reward.categoryID,
                type = "Toy",
                icon = SFC.DBUtils.GetItemFromCache(reward.itemID).icon or 134400,
                faction = reward.faction
            })
        end
    end

    return result
end

---@return Reward[]
function RewardLists.GetPets()
    ---@type Reward[]
    local result = {}
    if not SFC.DBUtils.GetProperty("itemsCache") then return result end

    for _, reward in ipairs(SFC.Pets) do
        if reward.spellID and (not reward.faction or reward.faction == SFCMain.faction) then
            local spellInfo = C_Spell.GetSpellInfo(reward.spellID)
            tinsert(result, {
                name = spellInfo.name,
                spellID = spellInfo.spellID,
                achievementID = reward.achievementID,
                categoryID = reward.categoryID,
                type = "Pet",
                icon = spellInfo.originalIconID,
                faction = reward.faction
            })
        elseif SFC.DBUtils.GetItemFromCache(reward.itemID) and (not reward.faction or reward.faction == SFCMain.faction) then
            tinsert(result, {
            name = SFC.DBUtils.GetItemFromCache(reward.itemID).name or "Unknown Pet ("..reward.itemID..")",
            itemID = reward.itemID,
            achievementID = reward.achievementID,
            categoryID = reward.categoryID,
            type = "Pet",
            icon = SFC.DBUtils.GetItemFromCache(reward.itemID).icon or 134400,
            faction = reward.faction
        })
        end
    end

    return result
end

---@return Reward[]
function RewardLists.GetDecor()
    ---@type Reward[]
    local result = {}
    if not SFC.DBUtils.GetProperty("itemsCache") then return result end

    for _, reward in ipairs(SFC.Decor) do
        if SFC.DBUtils.GetItemFromCache(reward.itemID) and (not reward.faction or reward.faction == SFCMain.faction) then
            tinsert(result, {
                name = SFC.DBUtils.GetItemFromCache(reward.itemID).name or "Unknown Decor ("..reward.itemID..")",
                itemID = reward.itemID,
                achievementID = reward.achievementID,
                categoryID = reward.categoryID,
                type = "Decor",
                icon = SFC.DBUtils.GetItemFromCache(reward.itemID).icon or 134400,
                faction = reward.faction
            })
        end
    end

    return result
end
