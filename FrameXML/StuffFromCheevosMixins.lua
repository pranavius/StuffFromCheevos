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
---@field isOwned boolean
---@field itemID number?
---@field icon number|string|nil
---@field atlas string?

function SFCMainMixin:OnLoad()
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

    -- Initialize window with "All" category pre-selected
    self:PopulateRewardsList("All")
    ---@type Button & SFCCategoryButtonTemplate
    SFCCategoryButtonAll:SetNormalAtlas("common-button-tertiary-selected")
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
            local mountName, _, iconID, _, _, _, _, _, _, _, isOwned = C_MountJournal.GetMountInfoByID(mountID)
            tinsert(result, {
                index = index,
                name = mountName,
                achievementID = reward.achievementID,
                categoryID = reward.categoryID,
                type = "Mount",
                icon = iconID,
                isOwned = isOwned
            })
        else
            print("No mountID found for item ID", reward.itemID)
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

        -- title = title:gsub("%s", "--")

        if title and title ~= "" then
            tinsert(result, {
                index = index,
                name = title,
                achievementID = reward.achievementID,
                categoryID = reward.categoryID,
                type = "Title",
                icon = "interface/icons/inv_scroll_05",
                isOwned = IsTitleKnown(reward.titleID)
            })
        else
            print("No title returned for title ID", reward.titleID)
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
        all = {}
    }
    if category == "All" then
        tAppendAll(rewardLists.all, rewardLists.mounts)
        tAppendAll(rewardLists.all, rewardLists.titles)
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
    return "Title: "..title
end

---@param rewards Reward[]
function SFCMainMixin:CreateRewardsList(rewards)
    local rewardsList = self.Rewards.ScrollFrame.ScrollChild
    for _, reward in ipairs(rewards) do
        local frame = CreateFrame("Frame", nil, rewardsList, "SFCRewardFrameTemplate")
        frame:SetSize(rewardsList:GetWidth() - 4, 75)
        frame:SetBackdropColor(0.3, 0.3, 0.3)
        if reward.isOwned then
            frame:SetBackdropBorderColor(0, 1, 0)
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
        frame.IconBorder:SetShown(reward.altas ~= nil or reward.icon ~= nil)
        frame.RewardName:SetText(reward.type == "Title" and getNameTitleCombo(reward.name) or reward.name)
        frame.RewardType:SetText(reward.type)
        frame.RewardType:SetShown(self.category == "All")

        local _, achievementName, points = GetAchievementInfo(reward.achievementID)
        frame.AchievementName:SetText("Achievement: "..GetAchievementLink(reward.achievementID))
    end
end