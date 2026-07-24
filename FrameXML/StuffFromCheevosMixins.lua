local SFC = select(2, ...)

---@class SFCCategoryButtonTemplate: Button
SFCCategoryButtonMixin = {}

---@param category string
function SFCCategoryButtonMixin:SetCategory(category)
    self:SetText(category)
    self:SetScript("OnClick", function(button)
        ---@cast button SFCCategoryButtonTemplate
        print("Clicked the", category, "button!")
        SFCMain:ResetCategoryButtonTextures()
        button:SetNormalAtlas("common-button-tertiary-selected")
        SFCMain:PopulateAchievementsList(category)
    end)
end

---@class SFCMain: PortraitFrameTemplate
SFCMainMixin = {}

function SFCMainMixin:OnLoad()
    self:SetTitle("Stuff From Cheevos")
    -- Positioning logic
    self.CategoryInset:SetPoint("TOPLEFT", self.PortraitContainer.CircleMask, "BOTTOMLEFT", 10, -20)

    -- Black background for the AddOn logo on (prevents transparency)
    local pBg = self.PortraitContainer:CreateTexture(nil, "BACKGROUND")
    pBg:SetAllPoints(self.PortraitContainer.portrait)
    pBg:SetColorTexture(0, 0, 0, 1)
    pBg:AddMaskTexture(self.PortraitContainer.CircleMask)
    self:SetPortraitTextureRaw("Interface/AddOns/StuffFromCheevos/Media/SFC-Logo")

    local catList = self.CategoryInset.Categories
    for index, category in ipairs(SFC.Categories) do
        local button = CreateFrame("Button", nil, catList, "SFCCategoryButtonTemplate")
        button:SetSize(catList:GetWidth() - 4, 30)
        button:SetCategory(category)
        button.layoutIndex = index
        button.align = "center"
        button.topPadding = 2
    end
    catList:Layout()

    
    local achList = self.Achievements.ScrollFrame.ScrollChild
    achList:SetWidth(self.Achievements.ScrollFrame:GetWidth())
    print("Init ach list width:", achList:GetWidth())
end

function SFCMainMixin:OnDragStart()
    self:StartMoving()
end

function SFCMainMixin:OnDragStop()
    self:StopMovingOrSizing()
end

function SFCMainMixin:ResetCategoryButtonTextures()
    local list = self.CategoryInset.Categories
    for _, button in ipairs({list:GetChildren()}) do
        ---@cast button Button & SFCCategoryButtonTemplate
        button:SetNormalAtlas("common-button-tertiary-normal")
    end
end

---@param category string
function SFCMainMixin:PopulateAchievementsList(category)
    local achList = self.Achievements.ScrollFrame.ScrollChild
    for _, child in ipairs({ achList:GetChildren() }) do
        child:Hide()
        child:SetParent(nil)
    end
    achList:SetWidth(self.Achievements.ScrollFrame:GetWidth())

    if not SFC[category] then return end

    print("Populate ach list width:", achList:GetWidth())
    if category == "Mounts" then
        for index, reward in ipairs(SFC.Mounts) do
            local mountID = C_MountJournal.GetMountFromItem(reward.itemID)
            if mountID then
                local mountName = C_MountJournal.GetMountInfoByID(mountID)
                local button = CreateFrame("Button", nil, achList, "UIPanelButtonTemplate")
                button:SetSize(achList:GetWidth() - 4, 50)
                button:SetText(mountName)
                button.layoutIndex = index
                button.align = "center"
                button.topPadding = 2
            else
                print("No mountID found for item ID", reward.itemID)
            end
        end
    elseif category == "Titles" then
        for index, reward in ipairs(SFC.Titles) do
            local title = GetTitleName(reward.titleID)
            if title and title ~= "" then
                local button = CreateFrame("Button", nil, achList, "UIPanelButtonTemplate")
                button:SetSize(achList:GetWidth() - 4, 50)
                button:SetText(title or "WUT")
                button.layoutIndex = index
                button.align = "center"
                button.topPadding = 2
            else
                print("No title returned for title ID", reward.titleID)
            end
        end
    end
    achList:Layout()
end