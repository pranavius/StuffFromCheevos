local SFC = select(2, ...)

---@class SFCCategoryButtonTemplate: Button
SFCCategoryButtonMixin = {}

---@param category string
function SFCCategoryButtonMixin:SetCategory(category)
    self:SetText(category)
    self:SetScript("OnClick", function(button)
        ---@cast button SFCCategoryButtonTemplate
        SFCMain:ResetCategoryButtonTextures()
        button:SetNormalAtlas("common-button-tertiary-selected")
        SFCMain:PopulateRewardsList(category)
    end)
end

---@class SFCMain: PortraitFrameTemplate
SFCMainMixin = {}

---@class Reward
---@field index number
---@field name string
---@field type string
---@field achievementID number
---@field categoryID number
---@field itemID number?
---@field icon number|string|nil
---@field atlas string?

function SFCMainMixin:OnLoad()
    EventRegistry:RegisterCallback("StuffFromCheevos.ItemsCached", function() self:PopulateRewardsList(self.category) end)
    EventRegistry:RegisterCallback("StuffFromCheevos.FiltersUpdated", function() self:PopulateRewardsList(self.category) end)
    self.player = UnitName("player")
    local _, classFilename = UnitClass("player")
    self.classColor = C_ClassColor.GetClassColor(classFilename)
    self:SetTitle("Stuff From Cheevos")
    -- Positioning logic
    self.Categories:SetPoint("TOPLEFT", self.PortraitContainer.CircleMask, "BOTTOMLEFT", 10, -20)

    -- Black background for the AddOn logo on (prevents transparency from showing what's underneath)
    local pBg = self.PortraitContainer:CreateTexture(nil, "BACKGROUND")
    pBg:SetAllPoints(self.PortraitContainer.portrait)
    pBg:SetColorTexture(0, 0, 0, 1)
    pBg:AddMaskTexture(self.PortraitContainer.CircleMask)
    self:SetPortraitTextureRaw("Interface/AddOns/StuffFromCheevos/Media/SFC-Logo")

    -- Category list init
    local catList = self.Categories.List
    for index, category in ipairs(SFC.Categories) do
        local button = CreateFrame("Button", "SFCCategoryButton"..category, catList, "SFCCategoryButtonTemplate")
        button:SetSize(catList:GetWidth() - 4, 30)
        button:SetCategory(category)
        button.layoutIndex = index
        button.align = "center"
        button.topPadding = 2
    end
    catList:Layout()

    -- Rewards list init
    local rewardsList = self.Rewards.ScrollFrame.ScrollChild
    rewardsList:SetWidth(self.Rewards.ScrollFrame:GetWidth())

    -- Initialize window with default category pre-selected (currently "All")
    self:PopulateRewardsList(self.category)
    ---@type Button & SFCCategoryButtonTemplate
    _G["SFCCategoryButton"..self.category]:SetNormalAtlas("common-button-tertiary-selected")
end

function SFCMainMixin:OnDragStart()
    self:StartMoving()
end

function SFCMainMixin:OnDragStop()
    self:StopMovingOrSizing()
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
    for index, reward in ipairs(SFC.Mounts) do
        local mountID = C_MountJournal.GetMountFromItem(reward.itemID)
        if mountID then
            local mountName, _, iconID = C_MountJournal.GetMountInfoByID(mountID)
            tinsert(result, {
                index = index,
                name = mountName,
                achievementID = reward.achievementID,
                categoryID = reward.categoryID,
                type = "Mount",
                icon = iconID,
            })
        else
            -- print("No mountID found for item ID", reward.itemID)
        end
    end

    return result
end

---@return Reward[]
local function getTitleRewards()
    ---@type Reward[]
    local result = {}
    for index, reward in ipairs(SFC.Titles) do
        local title = GetTitleName(reward.titleID)

        if title and title ~= "" then
            tinsert(result, {
                index = index,
                name = title,
                achievementID = reward.achievementID,
                categoryID = reward.categoryID,
                type = "Title",
                icon = "interface/icons/inv_scroll_05",
            })
        else
            -- print("No title returned for title ID", reward.titleID)
        end
    end

    return result
end

---@return Reward[]
local function getCosmeticRewards()
    ---@type Reward[]
    local result = {}
    if not SFC_DB or not SFC_DB.itemsCache then return result end

    for index, reward in ipairs(SFC.Cosmetics) do
        tinsert(result, {
            index = index,
            name = SFC_DB.itemsCache[reward.itemID].name or "Unknown Cosmetic",
            achievementID = reward.achievementID,
            categoryID = reward.categoryID,
            type = "Cosmetic",
            icon = SFC_DB.itemsCache[reward.itemID].icon or 134110
        })
    end

    return result
end

---@return Reward[]
local function getCustomizationRewards()
    ---@type Reward[]
    local result = {}

    for index, reward in ipairs(SFC.Customizations) do
        local rewardText = select(11, GetAchievementInfo(reward.achievementID))
        tinsert(result, {
            index = index,
            name = rewardText:gsub("^.+:%s", ""),
            achievementID = reward.achievementID,
            categoryID = reward.categoryID,
            type = "Customization",
            icon = type(reward.icon) == "number" and reward.icon or nil,
            atlas = type(reward.icon) == "string" and reward.icon or nil,
        })
    end

    return result
end

---@return Reward[]
local function getToyRewards()
    ---@type Reward[]
    local result = {}

    for index, reward in ipairs(SFC.Toys) do
        tinsert(result, {
            index = index,
            name = SFC_DB.itemsCache[reward.itemID].name or "Unknown Toy",
            achievementID = reward.achievementID,
            categoryID = reward.categoryID,
            type = "Toy",
            icon = SFC_DB.itemsCache[reward.itemID].icon or 134110
        })
    end

    return result
end

---@return Reward[]
local function getPetRewards()
    ---@type Reward[]
    local result = {}
    for index, reward in ipairs(SFC.Pets) do
        if reward.spellID then
            local spellInfo = C_Spell.GetSpellInfo(reward.spellID)
            tinsert(result, {
                index = index,
                name = spellInfo.name,
                achievementID = reward.achievementID,
                categoryID = reward.categoryID,
                type = "Pet",
                icon = spellInfo.originalIconID,
            })
        else
            tinsert(result, {
            index = index,
            name = SFC_DB.itemsCache[reward.itemID].name or "Unknown Pet",
            achievementID = reward.achievementID,
            categoryID = reward.categoryID,
            type = "Pet",
            icon = SFC_DB.itemsCache[reward.itemID].icon or 134110
        })
        end
    end

    return result
end

---@param category string
function SFCMainMixin:PopulateRewardsList(category)
    self.category = category
    local rewardsList = self.Rewards.ScrollFrame.ScrollChild
    for _, child in ipairs({ rewardsList:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end
    rewardsList:SetWidth(self.Rewards.ScrollFrame:GetWidth())

    if category ~= "All" and not SFC[category] then return end

    local rewardLists = {
        mounts = getMountRewards(),
        titles = getTitleRewards(),
        cosmetics = getCosmeticRewards(),
        customizations = getCustomizationRewards(),
        toys = getToyRewards(),
        pets = getPetRewards(),
        all = {}
    }
    if category == "All" then
        tAppendAll(rewardLists.all, rewardLists.mounts)
        tAppendAll(rewardLists.all, rewardLists.titles)
        tAppendAll(rewardLists.all, rewardLists.cosmetics)
        tAppendAll(rewardLists.all, rewardLists.customizations)
        tAppendAll(rewardLists.all, rewardLists.toys)
        tAppendAll(rewardLists.all, rewardLists.pets)
        -- When showing all rewards, sort them by achievement, category, then name
        table.sort(rewardLists.all, function(a, b)
            if a.achievementID ~= b.achievementID then return a.achievementID < b.achievementID end
            if a.categoryID ~= b.categoryID then return a.categoryID < b.categoryID end
            return a.name < b.name
        end)
        -- Update list indicies for accurate display orders based on sort
        for index, reward in ipairs(rewardLists.all) do
            reward.index = index
        end
        self:CreateRewardsList(rewardLists.all)
    elseif category == "Mounts" then
        self:CreateRewardsList(rewardLists.mounts)
    elseif category == "Titles" then
        self:CreateRewardsList(rewardLists.titles)
    elseif category == "Cosmetics" then
        self:CreateRewardsList(rewardLists.cosmetics)
    elseif category == "Customizations" then
        self:CreateRewardsList(rewardLists.customizations)
    elseif category == "Toys" then
        self:CreateRewardsList(rewardLists.toys)
    elseif category == "Pets" then
        self:CreateRewardsList(rewardLists.pets)
    end
    rewardsList:Layout()
end

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

---@param rewards Reward[]
function SFCMainMixin:CreateRewardsList(rewards)
    local rewardsList = self.Rewards.ScrollFrame.ScrollChild
    for _, reward in ipairs(rewards) do
        local _, achievementName, points, isCompleted, completedMonth, completedDay, completedYear, description = GetAchievementInfo(reward.achievementID)

        local frame = CreateFrame("Frame", nil, rewardsList, "SFCRewardFrameTemplate")
        frame:SetSize(rewardsList:GetWidth() - 4, self.Rewards.ScrollFrame:GetHeight() / 6)
        frame:SetBackdropColor(0.3, 0.3, 0.3)
        if isCompleted then
            -- frame:SetBackdropBorderColor(0, 1, 0)
            frame:SetBackdropColor(0.1, 0.8, 0.2, 0.7)
        end
        frame.align = "center"
        frame.topPadding = 2
        frame.layoutIndex = reward.index
        
        if reward.atlas then
            frame.Icon:SetAtlas(reward.atlas)
        elseif reward.icon then
            frame.Icon:SetTexture(reward.icon)
        end
        frame.IconBorder:SetShown(reward.atlas ~= nil or reward.icon ~= nil)
        frame.RewardName:SetText(reward.type == "Title" and getNameTitleCombo(reward.name) or reward.name)
        frame.RewardType:SetText(reward.type)
        frame.RewardType:SetShown(self.category == "All")

        local achievementLink = GetAchievementLink(reward.achievementID)
        frame.CheevoLink:SetText(achievementLink)
        frame.CheevoLink:SetSize(frame.CheevoLink:GetTextWidth() + 10, frame.CheevoLink:GetTextHeight() + 10)
        frame.CheevoLink:SetScript("OnClick", function(_, mouseButton)
            SetItemRef(achievementLink, achievementLink, mouseButton)
        end)

        local progressText
        if isCompleted then
            progressText = DARKYELLOW_FONT_COLOR:WrapTextInColorCode("Completed "..FormatShortDate(completedDay, completedMonth, completedYear))
        else
            local numCriteria = GetAchievementNumCriteria(reward.achievementID)
            if numCriteria > 0 then
                local numCompleted = 0
                for i = 1, numCriteria do
                    local _, _, isCriteriaComplete = GetAchievementCriteriaInfo(reward.achievementID, i)
                    if isCriteriaComplete then numCompleted = numCompleted + 1 end
                end
    
                progressText = numCompleted.." / "..numCriteria.." completed"
            end
        end
        frame.CriteriaProgress:SetText(progressText)

        frame.CheevoPoints:SetText(tostring(points))

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
end