local SFC = select(2, ...)

--region SFCCategoryButtonMixin
---@class SFCCategoryButtonTemplate: Button
SFCCategoryButtonMixin = {}

---@param category string
function SFCCategoryButtonMixin:SetCategory(category)
    self:SetText(category)
    self:SetScript("OnClick", function(button)
        ---@cast button SFCCategoryButtonTemplate
        SFCMain:ResetCategoryButtonTextures()
        button:SetNormalAtlas("common-button-tertiary-selected")
        SFCMain:PopulateAndSetRewardsList(category, true)
    end)
end
--endregion

--region SFCMainMixin
---@class SFCMain: PortraitFrameTemplate
SFCMainMixin = {}

function SFCMainMixin:OnLoad()
    self.Rewards.ScrollFrame:InitializeScrollFrame()
    tinsert(UISpecialFrames, self:GetName())
    
    -- EventRegistry callbacks
    EventRegistry:RegisterCallback("StuffFromCheevos.ItemsCached", function()
        self:PopulateAndSetRewardsList(self.category, false)
    end)
    EventRegistry:RegisterCallback("StuffFromCheevos.FiltersUpdated", function()
        self:PopulateAndSetRewardsList(self.category, true)
    end)

    -- Register events for fading frame on movement
    self:RegisterEvent("PLAYER_STARTED_MOVING")
    self:RegisterEvent("PLAYER_STOPPED_MOVING")

    -- Base initialization
    self.player = UnitName("player")
    local _, classFilename = UnitClass("player")
    self.classColor = C_ClassColor.GetClassColor(classFilename)
    self.faction = UnitFactionGroup("player")
    self:SetTitle("Stuff From Cheevos")
    self.Categories:SetPoint("TOPLEFT", self.PortraitContainer.CircleMask, "BOTTOMLEFT", 10, -20)

    -- Black background for the AddOn logo on (prevents transparency from showing what's underneath)
    local pBg = self.PortraitContainer:CreateTexture(nil, "BACKGROUND")
    pBg:SetAllPoints(self.PortraitContainer.portrait)
    pBg:SetColorTexture(0, 0, 0, 1)
    pBg:AddMaskTexture(self.PortraitContainer.CircleMask)
    self:SetPortraitTextureRaw("Interface/AddOns/StuffFromCheevos/Media/SFC-Logo")

    -- Category list initialization
    local catList = self.Categories.List
    local CATEGORY_LIST_Y_OFFSET = 0
    for index, category in ipairs(SFC.Categories) do
        local button = CreateFrame("Button", "SFCCategoryButton"..category, catList, "SFCCategoryButtonTemplate")
        button:SetSize(catList:GetWidth() - 4, 30)
        button:SetCategory(category)
        button.layoutIndex = index
        button.align = "center"
        button.topPadding = 2
        CATEGORY_LIST_Y_OFFSET = CATEGORY_LIST_Y_OFFSET + button:GetHeight() + 2 -- Adding 2 to each height to account for topPadding value
    end
    catList:Layout()
    catList:SetPoint("BOTTOMRIGHT", self.Categories, "TOPRIGHT", 0, CATEGORY_LIST_Y_OFFSET * -1)

    -- Initialize window with default category pre-selected (currently "All")
    ---@type Button & SFCCategoryButtonTemplate
    _G["SFCCategoryButton"..self.category]:SetNormalAtlas("common-button-tertiary-selected")

    -- Filters and settings initialization
    self.Categories.ShowCompleted:SetChecked(SFC.DBUtils.GetProperty("showCompleted") or false)
    self.Categories.ShowCompleted:HookScript("OnClick", function(cb)
        SFC_DB.filters.showCompleted = not SFC_DB.filters.showCompleted
        EventRegistry:TriggerEvent("StuffFromCheevos.FiltersUpdated")
    end)
    self.Categories.AnimProgressBar:SetChecked(SFC.DBUtils.GetProperty("animateProgressBar") or false)
    self.Categories.AnimProgressBar:HookScript("OnClick", function(cb)
        SFC_DB.uiOptions.animateProgressBar = not SFC_DB.uiOptions.animateProgressBar
    end)
    self.Categories.FadeWhenMoving:SetChecked(SFC.DBUtils.GetProperty("fadeWindowWhenMoving") or false)
    self.Categories.FadeWhenMoving:HookScript("OnClick", function(cb)
        SFC_DB.uiOptions.fadeWindowWhenMoving = not SFC_DB.uiOptions.fadeWindowWhenMoving
    end)

    -- Search box text filtering script
    self.RewardSearch:HookScript("OnTextChanged", function(sb)
        SFC_DB.filters.searchTerm = sb:GetText()
        EventRegistry:TriggerEvent("StuffFromCheevos.FiltersUpdated")
    end)
end

function SFCMainMixin:OnDragStart()
    self:StartMoving()
end

function SFCMainMixin:OnDragStop()
    self:StopMovingOrSizing()
end

function SFCMainMixin:OnEvent(event, ...)
    if event == "PLAYER_STARTED_MOVING" and SFC.DBUtils.GetProperty("fadeWindowWhenMoving") and self:IsShown() then
        UIFrameFadeIn(self, 0.3, self:GetAlpha(), 0.4)
    elseif event == "PLAYER_STOPPED_MOVING" and self:GetAlpha() < 1 and self:IsShown() then
        UIFrameFadeIn(self, 0.3, self:GetAlpha(), 1)
    end
end

---Sets all category button textures to the default (unselected) one. Called when a new category is selected to ensure only the one that's clicked has the "selected" texture visible
function SFCMainMixin:ResetCategoryButtonTextures()
    local list = self.Categories.List
    for _, button in ipairs({list:GetChildren()}) do
        ---@cast button Button & SFCCategoryButtonTemplate
        button:SetNormalAtlas("common-button-tertiary-normal")
    end
end

-- START: Series of helper functions for organizing AddOn data into lists of a single shape

---@return Reward[]
local function getMountRewards()
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
local function getTitleRewards()
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
local function getCosmeticRewards()
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
local function getCustomizationRewards()
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
local function getToyRewards()
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
local function getPetRewards()
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
local function getDecorRewards()
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

-- END: Series of helper functions for organizing AddOn data into lists of a single shape

---Determines the category name(s) for an achievement given a category ID. If the category is nested, both category and parent category names will be included but separated by a ">" character
---@param categoryID number
---@return string tree
local function getCategoryTree(categoryID)
    local categories = {}
    local name, parentID = GetCategoryInfo(categoryID)
    tinsert(categories, name)
    while parentID ~= -1 do
        name, parentID = GetCategoryInfo(parentID)
        tinsert(categories, 1, name)
    end

    return table.concat(categories, DARKYELLOW_FONT_COLOR:WrapTextInColorCode(" > "))
end

---@param reward Reward
---@param searchTerm string
---@return boolean
local function rewardMatchesSearchTerm(reward, searchTerm)
    local achievementName = select(2, GetAchievementInfo(reward.achievementID))
    local categoryText = getCategoryTree(reward.categoryID)

    return (achievementName and achievementName:lower():find(searchTerm, 1, true) ~= nil)
        or (categoryText and categoryText:lower():find(searchTerm, 1, true) ~= nil)
        or reward.name:lower():find(searchTerm) ~= nil
        or reward.type:lower():find(searchTerm) ~= nil
        or (reward.faction and reward.faction:lower():find(searchTerm) ~= nil)
        or tostring(reward.achievementID):find(searchTerm) ~= nil
        or tostring(reward.categoryID):find(searchTerm) ~= nil
        or tostring(reward.itemID):find(searchTerm) ~= nil
end

---@param reward Reward
---@return boolean
local function rewardMatchesCompletionFilter(reward)
    local isCompleted = select(4, GetAchievementInfo(reward.achievementID))
    local showCompleted = SFC.DBUtils.GetProperty("showCompleted")
    if showCompleted then return true end
    return not isCompleted
end

---Manually animates the progress bar using linear interpolation (lerp)
---@param bar StatusBar
---@param value number
local function animateProgressBar(bar, value)
    -- If the bar isn't shown, don't waste time and resources running an invisible animation lol
    -- Also set its value to 0 for proper re-entry animation when shown
    if not bar:IsShown() then
        bar:SetValue(0)
        return
    end

    local current = bar:GetValue()
    if current == value then return end

    local elapsed = 0
    bar:SetScript("OnUpdate", function(self, delta)
        elapsed = elapsed + delta
        local animPct = math.min(elapsed / 0.3, 1)
        self:SetValue(current + (value - current) * animPct)
        if animPct >= 1 then
            self:SetScript("OnUpdate", nil)
        end
    end)
end

---Used for rendering progress text over the bar as well as determining progress bar fill percentage
---@param rewards Reward[]
---@return number completed
---@return number total
local function getProgressValues(rewards)
    local completed = 0
    for _, reward in ipairs(rewards) do
        local isCompleted = select(4, GetAchievementInfo(reward.achievementID))
        if isCompleted then completed = completed + 1 end
    end

    return completed, #rewards
end

---@param category "Mounts"|"Titles"|"Cosmetics"|"Customizations"|"Toys"|"Pets"|"Decor"|"All"
---@param shouldAnimateProgressBar boolean
function SFCMainMixin:PopulateAndSetRewardsList(category, shouldAnimateProgressBar)
    self.category = category
    if category ~= "All" and not SFC[category] then return end

    local rewardLists = {
        Mounts = getMountRewards(),
        Titles = getTitleRewards(),
        Cosmetics = getCosmeticRewards(),
        Customizations = getCustomizationRewards(),
        Toys = getToyRewards(),
        Pets = getPetRewards(),
        Decor = getDecorRewards(),
         ---@type Reward[]
        All = {}
    }

    tAppendAll(rewardLists.All, rewardLists.Mounts)
    tAppendAll(rewardLists.All, rewardLists.Titles)
    tAppendAll(rewardLists.All, rewardLists.Cosmetics)
    tAppendAll(rewardLists.All, rewardLists.Customizations)
    tAppendAll(rewardLists.All, rewardLists.Toys)
    tAppendAll(rewardLists.All, rewardLists.Pets)
    tAppendAll(rewardLists.All, rewardLists.Decor)
    -- When showing all rewards, sort them by achievement, category, then name
    table.sort(rewardLists.All, function(a, b)
        if a.achievementID ~= b.achievementID then return a.achievementID < b.achievementID end
        if a.categoryID ~= b.categoryID then return a.categoryID < b.categoryID end
        return a.name < b.name
    end)

    -- To persist completion progress, we need to update the progress bar before setting DataProvider contents
    local completed, total = getProgressValues(rewardLists[category])
    self.RewardsProgress.Text:SetText(completed.."/"..total)
    if shouldAnimateProgressBar and SFC.DBUtils.GetProperty("animateProgressBar") then
        animateProgressBar(self.RewardsProgress, total == 0 and 0 or completed/total * 100)
    else
        self.RewardsProgress:SetValue(total == 0 and 0 or completed/total * 100)
    end

    -- Apply filters to all rewards lists
    local searchTerm = SFC.DBUtils.GetProperty("searchTerm")
    if searchTerm ~= "" then
        searchTerm = searchTerm:lower()
        for listName, rewards in pairs(rewardLists) do
            for i = #rewards, 1, -1 do
                if not rewardMatchesSearchTerm(rewards[i], searchTerm) then
                    table.remove(rewards, i)
                end
            end
        end
    end
    for listName, rewards in pairs(rewardLists) do
        for i = #rewards, 1, -1 do
            if not rewardMatchesCompletionFilter(rewards[i]) then
                table.remove(rewards, i)
            end
        end
    end

    SFC.DataProvider = CreateDataProvider(rewardLists[category] or {})
    self.Rewards.ScrollFrame:SetDataProvider(SFC.DataProvider, false)
end
--endregion

--region SFCScrollFrameMixin

---Determines how a title is shown with a character name (title "preview")
---@param title string
local function getNameTitleCombo(title)
    local name = SFCMain.classColor:WrapTextInColorCode(SFCMain.player)
    -- If first char is lowercase: suffix w/ space in front
    if title:match("^%l") then return name.." "..title end
    -- If last char is whitespace: Prefix
    if title:match("%s$") then return title..name end
    -- If first char is uppercase: suffix w/ comma and space in front
    if title:match("^%u") then return name..", "..title end

    -- fallback, should never be reached (hopefully)
    return title
end

---Updates cursor on mouseover and hooks a script to render reward preview for rewards that have one (mounts, pets, cosmetics, decor)
---@param frame SFCRewardFrameTemplate
---@param reward Reward
local function registerRewardPreview(frame, reward)
    local icon = frame.Icon
    if reward.type ~= "Title" and reward.type ~= "Customization" and reward.type ~= "Toy" then
        icon:SetMouseClickEnabled(true)
        icon:SetScript("OnEnter", function()
            SFCMain.isHoveringPreviewableItem = true
            SetCursorByMode(Enum.Cursormode.InspectCursor)
        end)
        icon:SetScript("OnLeave", function()
            SFCMain.isHoveringPreviewableItem = false
            ResetCursor()
        end)

        if reward.type == "Mount" then
            local mountID = reward.spellID and C_MountJournal.GetMountFromSpell(reward.spellID) or C_MountJournal.GetMountFromItem(reward.itemID)
            if mountID then
                icon:SetScript("OnMouseDown", function(_, mouseBtn)
                    if mouseBtn == "LeftButton" then
                        if HousingModelPreviewFrame and HousingModelPreviewFrame:IsShown() then HousingModelPreviewFrame:Hide() end
                        DressUpMount(mountID)
                    end
                end)
            else
                SFC.LogUtils.Message("Unable to preview", reward.name)
            end
        elseif reward.type == "Pet" and reward.spellID == 61773 then
            -- Hardcoded speciesID for Plump Turkey (one-off exception)
            local _, _, _, creatureID, _, _, _, _, _, _, _, displayID = C_PetJournal.GetPetInfoBySpeciesID(201)
            if creatureID and displayID then
                icon:SetScript("OnMouseDown", function(_, mouseBtn)
                    if mouseBtn == "LeftButton" then
                        if HousingModelPreviewFrame and HousingModelPreviewFrame:IsShown() then HousingModelPreviewFrame:Hide() end
                        DressUpBattlePet(creatureID, displayID, 201)
                    end
                end)
            end
        elseif reward.type == "Pet" then
            local _, _, _, creatureID, _, _, _, _, _, _, _, displayID, speciesID = C_PetJournal.GetPetInfoByItemID(reward.itemID)
            if creatureID and displayID and speciesID then
                icon:SetScript("OnMouseDown", function(_, mouseBtn)
                    if mouseBtn == "LeftButton" then
                        if HousingModelPreviewFrame and HousingModelPreviewFrame:IsShown() then HousingModelPreviewFrame:Hide() end
                        DressUpBattlePet(creatureID, displayID, speciesID)
                    end
                end)
            end
        elseif reward.type == "Cosmetic" or reward.type == "Decor" then
            icon:SetScript("OnMouseDown", function(_, mouseBtn)
                if mouseBtn == "LeftButton" then
                    if reward.type ~= "Decor" and HousingModelPreviewFrame and HousingModelPreviewFrame:IsShown() then
                        HousingModelPreviewFrame:Hide()
                    elseif reward.type == "Decor" and DressUpFrame:IsShown() then
                        DressUpFrame:Hide()
                    end
                    DressUpLink("item:"..reward.itemID)
                end
            end)
        else
            icon:SetScript("OnMouseDown", nil)
        end
    else
        icon:SetMouseClickEnabled(false)
        icon:SetScript("OnMouseDown", nil)
        icon:SetScript("OnEnter", nil)
        icon:SetScript("OnLeave", nil)
    end
end

---Lifted straight from Blizzard's 12.1.0 Achievement bootstrap functions (scrap shortly after patch launches)
---@param achievementID number
ShowAchievementFrameForAchievement = ShowAchievementFrameForAchievement or function(achievementID)
    if UIParentLoadAddOn("Blizzard_AchievementUI") then
		if not AchievementFrame:IsShown() then
			AchievementFrame_ToggleAchievementFrame(false, C_AchievementInfo.IsGuildAchievement(achievementID));
		end
		AchievementFrame_SelectAchievement(achievementID);
	end
end

---Factory function for rendering rewards data in the list
---@param frame SFCRewardFrameTemplate
---@param reward Reward
local function createRewardFrame(frame, reward)
    if not frame or not reward then return end

    local _, _, points, isCompleted, completedMonth, completedDay, completedYear, _, flags = GetAchievementInfo(reward.achievementID)
    local categoryText = getCategoryTree(reward.categoryID)

    frame.FactionWatermark:SetSize((frame:GetHeight() - 10) * 0.92, frame:GetHeight() - 10)
    if isCompleted then
        frame:SetBackdropColor(0.1, 0.8, 0.2, 0.5)
    else
        if reward.faction == "Alliance" then
            -- frame:SetBackdropColor(0, 0.678, 0.941, 0.5)
            frame.FactionWatermark:SetAtlas("charactercreate-icon-alliance")
        elseif reward.faction == "Horde" then
            -- frame:SetBackdropColor(1, 0.161, 0.204, 0.5)
            frame.FactionWatermark:SetAtlas("charactercreate-icon-horde")
        end
        frame:SetBackdropColor(0.3, 0.3, 0.3)
    end
    frame.FactionWatermark:SetShown(not isCompleted and reward.faction ~= nil)
    
    if reward.atlas then
        frame.Icon:SetAtlas(reward.atlas)
    elseif reward.icon then
        frame.Icon:SetTexture(reward.icon)
    end
    frame.IconBorder:SetShown(reward.atlas ~= nil or reward.icon ~= nil)

    registerRewardPreview(frame, reward)
    -- Show appropriate tooltip when hovering icons
    if (reward.icon or reward.atlas) and (reward.itemID or reward.spellID) then
        frame.Icon:HookScript("OnEnter", function(mask)
            -- Required for battle pet tooltips as well
            GameTooltip:SetOwner(mask, "ANCHOR_RIGHT")
            if reward.type == "Pet" and reward.spellID == 61773 then
                BattlePetToolTip_Show(201, 1, 2, 1, 1, 1)
            elseif reward.type == "Pet" then
                local speciesID = select(13, C_PetJournal.GetPetInfoByItemID(reward.itemID))
                BattlePetToolTip_Show(speciesID, 1, 2, 1, 1, 1)
            else
                if reward.type == "Toy" then
                    GameTooltip:SetToyByItemID(reward.itemID)
                elseif reward.type == "Mount" and reward.spellID then
                    GameTooltip:SetMountBySpellID(reward.spellID)
                elseif reward.type == "Mount" then
                    local mountID = C_MountJournal.GetMountFromItem(reward.itemID)
                    if mountID then
                        local _, spellID = C_MountJournal.GetMountInfoByID(mountID)
                        GameTooltip:SetMountBySpellID(spellID)
                    else
                        GameTooltip:SetHyperlink("item:"..reward.itemID)
                    end
                else
                    local hyperlinkText = reward.itemID and "item:"..reward.itemID or "spell:"..reward.spellID
                    GameTooltip:SetHyperlink(hyperlinkText)
                end
                GameTooltip:Show()
                GameTooltip_HideShoppingTooltips(GameTooltip)
            end
        end)
        frame.Icon:HookScript("OnLeave", function()
            GameTooltip:Hide()
            BattlePetTooltip:Hide()
        end)
    else
        frame.Icon:SetScript("OnEnter", nil)
        frame.Icon:SetScript("OnLeave", nil)

    end

    frame.RewardName:SetText(reward.type == "Title" and getNameTitleCombo(reward.name) or reward.name)
    frame.RewardType:SetText(reward.type)
    frame.RewardType:SetShown(SFCMain.category == "All")

    local achievementLink = GetAchievementLink(reward.achievementID)
    frame.CheevoLink:SetText(achievementLink)
    frame.CheevoLink:SetSize(frame.CheevoLink:GetTextWidth() + 10, frame.CheevoLink:GetTextHeight() + 10)
    frame.CheevoLink:SetScript("OnClick", function(_, mouseButton)
        SetItemRef(achievementLink, achievementLink, mouseButton)
    end)
    -- Set anchor dynamically to improve spacing when viewing a specific category instead of "All"
    frame.CheevoLink:ClearAllPoints()
    frame.CheevoLink:SetPoint("BOTTOMLEFT", frame.Icon, "BOTTOMRIGHT", 10, frame.RewardType:IsShown() and -5 or 0)

    frame.CheevoCategory:SetText(categoryText)

    local progressText
    if isCompleted then
        progressText = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Completed "..FormatShortDate(completedDay, completedMonth, completedYear))
    elseif flags and bit.band(flags, ACHIEVEMENT_FLAGS_HAS_PROGRESS_BAR) ~= 0 then
        -- Achievements that have a progress bar shown in the Achievements UI seem to only have 1 criteria, so we **SHOULDN'T** need to iterate over any
        local barText = select(9, GetAchievementCriteriaInfo(reward.achievementID, 1))
        progressText = barText.." completed"
    else
        local numCriteria = GetAchievementNumCriteria(reward.achievementID)
        -- GetAchievementCriteriaInfo also returns bit flags, so we need to check for that here as well because sometimes the bit isn't set on the Achievement itself :')
        if numCriteria == 1 then
            local _, _, _, _, _, _, criteriaFlags, _, barText = GetAchievementCriteriaInfo(reward.achievementID, 1)
            -- "Show progress bar" flag appears to be '1' for this bit (https://wowdev.wiki/DB/CriteriaTree#Flags)
            if criteriaFlags and bit.band(criteriaFlags, 1) ~= 0 then progressText = barText.." completed" end
        elseif numCriteria > 0 then
            local numCompleted = 0
            for i = 1, numCriteria do
                local _, _, isCriteriaComplete = GetAchievementCriteriaInfo(reward.achievementID, i)
                if isCriteriaComplete then numCompleted = numCompleted + 1 end
            end

            progressText = numCompleted.." / "..numCriteria.." completed"
        end
    end
    frame.CriteriaProgress:SetText(progressText)

    frame.CheevoPoints:SetText(points and tostring(points) or "")

    frame.OpenCheevo:SetText("View Achievement")
    frame.OpenCheevo:SetSize(frame.OpenCheevo.Text:GetUnboundedStringWidth() + 18, frame.OpenCheevo:GetTextHeight() + 14)
    frame.OpenCheevo:SetScript("OnClick", function()
        ShowAchievementFrameForAchievement(reward.achievementID)
    end)
    frame.OpenCheevo:SetScript("OnEnter", function(button)
        button:SetText(WHITE_FONT_COLOR:WrapTextInColorCode("View Achievement"))
    end)
    frame.OpenCheevo:SetScript("OnLeave", function(button)
        button:SetText("View Achievement")
    end)
end

---@class SFCScrollFrame: WowScrollBoxList
SFCScrollFrameMixin = {}

function SFCScrollFrameMixin:InitializeScrollFrame()
    self.ScrollView = CreateScrollBoxListLinearView()

    ScrollUtil.InitScrollBoxListWithScrollBar(self, SFCMain.Rewards.ScrollBar, self.ScrollView)
    self.ScrollView:SetElementFactory(function(factory)
        factory("SFCRewardFrameTemplate", createRewardFrame)
    end)
    self.ScrollView:SetElementExtent(self.ScrollView:GetTemplateExtent("SFCRewardFrameTemplate"))
    self.ScrollView:SetDataProvider(CreateDataProvider())
end
--endregion
