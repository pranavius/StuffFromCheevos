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
        SFCMain:PopulateRewardsList(category, true)
    end)
end
--endregion

--region SFCMainMixin
---@class SFCMain: PortraitFrameTemplate
SFCMainMixin = {}

---@class Reward
---@field name string
---@field type string
---@field achievementID number
---@field categoryID number
---@field itemID number?
---@field icon number|string|nil
---@field atlas string?
---@field faction string?

function SFCMainMixin:OnLoad()
    self.Rewards.ScrollFrame:InitializeScrollFrame()
    tinsert(UISpecialFrames, self:GetName())
    
    -- EventRegistry callbacks
    EventRegistry:RegisterCallback("StuffFromCheevos.ItemsCached", function()
        self:PopulateRewardsList(self.category, false)
    end)
    EventRegistry:RegisterCallback("StuffFromCheevos.FiltersUpdated", function()
        self:PopulateRewardsList(self.category, true)
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

    -- Filters initialization
    self.Categories.ShowCompleted:SetChecked(SFC.DBUtils.GetProperty("showCompleted") or false)
    self.Categories.ShowCompleted:HookScript("OnClick", function(cb)
        SFC_DB.filters.showCompleted = not SFC_DB.filters.showCompleted
        -- Show progress bar only when completed achievements are also shown
        self.RewardsProgress:SetShown(SFC_DB.filters.showCompleted)
        EventRegistry:TriggerEvent("StuffFromCheevos.FiltersUpdated")
    end)

    -- Progress bar
    self.RewardsProgress:SetShown(SFC_DB.filters.showCompleted)

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
    if event == "PLAYER_STARTED_MOVING" and self:IsShown() then
        UIFrameFadeIn(self, 0.3, self:GetAlpha(), 0.4)
    elseif event == "PLAYER_STOPPED_MOVING" and self:IsShown() then
        UIFrameFadeIn(self, 0.3, self:GetAlpha(), 1)
    end
end

function SFCMainMixin:ResetCategoryButtonTextures()
    local list = self.Categories.List
    for _, button in ipairs({list:GetChildren()}) do
        ---@cast button Button & SFCCategoryButtonTemplate
        button:SetNormalAtlas("common-button-tertiary-normal")
    end
end

---@return Reward[]
local function getMountRewards()
    ---@type Reward[]
    local result = {}
    for _, reward in ipairs(SFC.Mounts) do
        if reward.spellID and (not reward.faction or reward.faction == SFCMain.faction) then
            local spellInfo = C_Spell.GetSpellInfo(reward.spellID)
            tinsert(result, {
                name = spellInfo.name,
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
                    achievementID = reward.achievementID,
                    categoryID = reward.categoryID,
                    type = "Mount",
                    icon = iconID,
                    faction = reward.faction
                })
            elseif not mountID and SFC.DBUtils.GetItemFromCache(reward.itemID) then
                tinsert(result, {
                    name = SFC.DBUtils.GetItemFromCache(reward.itemID).name or "Unknown Mount ("..reward.itemID..")",
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
                achievementID = reward.achievementID,
                categoryID = reward.categoryID,
                type = "Pet",
                icon = spellInfo.originalIconID,
                faction = reward.faction
            })
        elseif SFC.DBUtils.GetItemFromCache(reward.itemID) and (not reward.faction or reward.faction == SFCMain.faction) then
            tinsert(result, {
            name = SFC.DBUtils.GetItemFromCache(reward.itemID).name or "Unknown Pet ("..reward.itemID..")",
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

---@param category string
---@param shouldAnimateProgressBar boolean
function SFCMainMixin:PopulateRewardsList(category, shouldAnimateProgressBar)
    self.category = category
    if category ~= "All" and not SFC[category] then return end

    local rewardLists = {
        mounts = getMountRewards(),
        titles = getTitleRewards(),
        cosmetics = getCosmeticRewards(),
        customizations = getCustomizationRewards(),
        toys = getToyRewards(),
        pets = getPetRewards(),
        decor = getDecorRewards(),
         ---@type Reward[]
        all = {}
    }

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

    if category == "All" then
        tAppendAll(rewardLists.all, rewardLists.mounts)
        tAppendAll(rewardLists.all, rewardLists.titles)
        tAppendAll(rewardLists.all, rewardLists.cosmetics)
        tAppendAll(rewardLists.all, rewardLists.customizations)
        tAppendAll(rewardLists.all, rewardLists.toys)
        tAppendAll(rewardLists.all, rewardLists.pets)
        tAppendAll(rewardLists.all, rewardLists.decor)
        -- When showing all rewards, sort them by achievement, category, then name
        table.sort(rewardLists.all, function(a, b)
            if a.achievementID ~= b.achievementID then return a.achievementID < b.achievementID end
            if a.categoryID ~= b.categoryID then return a.categoryID < b.categoryID end
            return a.name < b.name
        end)
        SFC.DataProvider = CreateDataProvider(rewardLists.all)
    elseif category == "Mounts" then
        SFC.DataProvider = CreateDataProvider(rewardLists.mounts)
    elseif category == "Titles" then
        SFC.DataProvider = CreateDataProvider(rewardLists.titles)
    elseif category == "Cosmetics" then
        SFC.DataProvider = CreateDataProvider(rewardLists.cosmetics)
    elseif category == "Customizations" then
        SFC.DataProvider = CreateDataProvider(rewardLists.customizations)
    elseif category == "Toys" then
        SFC.DataProvider = CreateDataProvider(rewardLists.toys)
    elseif category == "Pets" then
        SFC.DataProvider = CreateDataProvider(rewardLists.pets)
    elseif category == "Decor" then
        SFC.DataProvider = CreateDataProvider(rewardLists.decor)
    else
        SFC.DataProvider = CreateDataProvider({})
    end

    self.Rewards.ScrollFrame:SetDataProvider(SFC.DataProvider, false)
    local completed, total = getProgressValues(SFC.DataProvider:GetCollection())
    self.RewardsProgress.Text:SetText(completed.."/"..total)
    if shouldAnimateProgressBar and SFC.DBUtils.GetProperty("animateProgressBar") then
        animateProgressBar(self.RewardsProgress, total == 0 and 0 or completed/total * 100)
    else
        self.RewardsProgress:SetValue(total == 0 and 0 or completed/total * 100)
    end
end
--endregion

--region SFCScrollFrameMixin
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

---@param frame SFCRewardFrameTemplate
---@param reward Reward
local function createRewardFrame(frame, reward)
    if not frame or not reward then return end

    local _, _, points, isCompleted, completedMonth, completedDay, completedYear, _, flags = GetAchievementInfo(reward.achievementID)
    local categoryText = getCategoryTree(reward.categoryID)

    frame.FactionBg:SetSize((frame:GetHeight() - 10) * 0.92, frame:GetHeight() - 10)
    if isCompleted then
        frame:SetBackdropColor(0.1, 0.8, 0.2, 0.5)
    else
        if reward.faction == "Alliance" then
            -- frame:SetBackdropColor(0, 0.678, 0.941, 0.5)
            frame.FactionBg:SetAtlas("charactercreate-icon-alliance")
        elseif reward.faction == "Horde" then
            -- frame:SetBackdropColor(1, 0.161, 0.204, 0.5)
            frame.FactionBg:SetAtlas("charactercreate-icon-horde")
        end
        frame:SetBackdropColor(0.3, 0.3, 0.3)
    end
    frame.FactionBg:SetShown(not isCompleted and reward.faction ~= nil)
    
    if reward.atlas then
        frame.Icon:SetAtlas(reward.atlas)
    elseif reward.icon then
        frame.Icon:SetTexture(reward.icon)
    end
    frame.IconBorder:SetShown(reward.atlas ~= nil or reward.icon ~= nil)
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
