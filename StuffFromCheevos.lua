local addonName, SFC = ...

-- Registering a reusable NineSlice layout for the Rewards list items
-- Currently unused, but who knows? Might be fun to keep around
NineSliceUtil.AddLayout("SFCRewardItem", {
    TopLeftCorner = { atlas = "editmode-actionbar-highlight-nineslice-corner" },
    TopRightCorner = { atlas = "editmode-actionbar-highlight-nineslice-corner", mirrorLayout = true },
    BottomLeftCorner = { atlas = "editmode-actionbar-highlight-nineslice-corner", mirrorLayout = true },
    BottomRightCorner = { atlas = "editmode-actionbar-highlight-nineslice-corner", mirrorLayout = true },
    TopEdge = { atlas = "_editmode-actionbar-highlight-nineslice-edgetop" },
    BottomEdge = { atlas = "_editmode-actionbar-highlight-nineslice-edgebottom" },
    LeftEdge = { atlas = "!editmode-actionbar-highlight-nineslice-edgeleft" },
    RightEdge = { atlas = "!editmode-actionbar-highlight-nineslice-edgeright" },
    Center = { atlas = "UI-HUD-Minimap-Button-NineSlice-Center" },
})

SFC_DB_DEFAULTS = {
    debug = false,
    itemsCache = {},
    filters = { showCompleted = true, searchTerm = "", sortOrder = "" }
}

-- Event handling (probably a better way to do this but idk)
local ef = CreateFrame("Frame")
ef:HookScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" and ... == addonName then
        if not SFC_DB then SFC_DB = SFC_DB_DEFAULTS end
        SFC.LogUtils.DebugMessage("AddOn Loaded")
        SFC.DBUtils.BuildItemsCache()
        self:UnregisterEvent("ADDON_LOADED")
    end
end)
ef:RegisterEvent("ADDON_LOADED")

SLASH_SFCSLASH1 = "/stufffromcheevos"
SLASH_SFCSLASH2 = "/sfc"

SlashCmdList["SFCSLASH"] = function(msg)
    if msg == "debug" or msg == "d" then
        SFC.DBUtils.ToggleDebugMode()
    end
    if msg == "" then
        if SFCMain:IsShown() then SFCMain:Hide() else SFCMain:Show() end
    end
end

function SFC_Reset()
    SFC_DB = SFC_DB_DEFAULTS
    ReloadUI()
end

function SFC_ResetDump()
    if not SFC_DB then SFC_DB = SFC_DB_DEFAULTS
    else SFC_DB.dump = {} end
    print("SFC DB dump Reset")
end

---Dumps all available achievement info from in-game (**INTENDED FOR DEVELOPMENT PURPOSES ONLY**)
function SFC_Dump()
    for _, categoryID in ipairs(GetCategoryList()) do
        if not SFC_DB.dump then SFC_DB.dump = { categories = {}, notFound = {} } end

        local category, parentID, categoryFlags = GetCategoryInfo(categoryID)
        if not SFC_DB.dump.categories[categoryID] then
            SFC_DB.dump.categories[categoryID] = {
                category = category,
                parentID = parentID,
                flags = categoryFlags,
                achievements = {}
            }
        end

        for index = 1, GetCategoryNumAchievements(categoryID, true) do
            local achievementID, achievement, points, _, _, _, _, description, achievementFlags, _, rewardText = GetAchievementInfo(categoryID, index)
            if achievementID then
                local rewardItemID = C_AchievementInfo.GetRewardItemID(achievementID) or -1
                if rewardText ~= "" or rewardItemID ~= -1 then
                    SFC_DB.dump.categories[categoryID].achievements[achievementID] = {
                        achievement = achievement,
                        points = points,
                        description = description,
                        flags = achievementFlags,
                        rewardText = rewardText,
                        rewardItemID = rewardItemID,
                    }
                end
            else
                if not SFC_DB.dump.notFound[category] then SFC_DB.dump.notFound[category] = { id = categoryID, indicies = {} } end
                local notFoundCategory = SFC_DB.dump.notFound[category]
                if not tContains(notFoundCategory.indicies, index) then
                    tinsert(notFoundCategory.indicies, index)
                end
                print("No achievementID found for index", index, "in category:", category)
            end
        end
    end

    print("Achievement Data saved to DB")
end