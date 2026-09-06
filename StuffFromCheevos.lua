local addonName, SFC = ...
local LDB = LibStub("LibDataBroker-1.1")

-- Registering a reusable NineSlice layout for the Rewards list items
-- Currently unused, but who knows? Might be fun to keep around for later
-- NineSliceUtil.AddLayout("SFCRewardItem", {
--     TopLeftCorner = { atlas = "editmode-actionbar-highlight-nineslice-corner" },
--     TopRightCorner = { atlas = "editmode-actionbar-highlight-nineslice-corner", mirrorLayout = true },
--     BottomLeftCorner = { atlas = "editmode-actionbar-highlight-nineslice-corner", mirrorLayout = true },
--     BottomRightCorner = { atlas = "editmode-actionbar-highlight-nineslice-corner", mirrorLayout = true },
--     TopEdge = { atlas = "_editmode-actionbar-highlight-nineslice-edgetop" },
--     BottomEdge = { atlas = "_editmode-actionbar-highlight-nineslice-edgebottom" },
--     LeftEdge = { atlas = "!editmode-actionbar-highlight-nineslice-edgeleft" },
--     RightEdge = { atlas = "!editmode-actionbar-highlight-nineslice-edgeright" },
--     Center = { atlas = "UI-HUD-Minimap-Button-NineSlice-Center" },
-- })

local function toggleSFCWindow()
    if SFCMain:IsShown() then SFCMain:Hide() else SFCMain:Show() end
end

local broker = LDB:NewDataObject(addonName, {
    type = "launcher",
    label = "Stuff From Cheevos",
    icon = "Interface/AddOns/StuffFromCheevos/Media/SFC-Logo",
    OnClick = function(_, btn) if btn == "LeftButton" then toggleSFCWindow() end end,
    OnTooltipShow = function(tooltip)
        tooltip:SetText("Stuff From Cheevos")
        tooltip:AddLine(C_AddOns.GetAddOnMetadata(addonName, "Notes"), 1, 1, 1, true)
		tooltip:AddLine(" ")
        tooltip:AddLine("|A:newplayertutorial-icon-mouse-leftbutton:15:15|a Click to open the AddOn window", 1, 1, 1, true)
		tooltip:AddLine("Type "..DARKYELLOW_FONT_COLOR:WrapTextInColorCode("/sfc help").. " in the chat window for available slash commands", 0.67, 0.67, 0.67, false)
    end
})
local minimapIcon = LibStub("LibDBIcon-1.0")

-- Event handling (probably a better way to do this but idk)
local ef = CreateFrame("Frame")
ef:HookScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" and ... == addonName then
        SFC.DBUtils.EnsureDefaults()
        SFC.LogUtils.DebugMessage("Stuff From Cheevos Loaded")
        SFC.DBUtils.BuildItemsCache()
        minimapIcon:Register(addonName, broker, SFC_DB.minimap)
        self:UnregisterEvent("ADDON_LOADED")
    end
end)
ef:RegisterEvent("ADDON_LOADED")

SLASH_SFCSLASH1 = "/stufffromcheevos"
SLASH_SFCSLASH2 = "/sfc"

SlashCmdList["SFCSLASH"] = function(msg)
    local cmd = msg and msg:trim():lower() or ""
    if tContains({ "debug", "d" }, cmd) then
        SFC.DBUtils.ToggleDebugMode()
    elseif tContains({ "minimap", "m" }, cmd) then
        SFC.DBUtils.ToggleMinimapButton(minimapIcon)
    elseif tContains({ "help", "h" }, cmd) then
        SFC.LogUtils.Message("Slash command options:")
        print(DARKYELLOW_FONT_COLOR:WrapTextInColorCode("/sfc"), "or", DARKYELLOW_FONT_COLOR:WrapTextInColorCode("/stufffromcheevos")..":", "Open the AddOn window" )
		print("    -", DARKYELLOW_FONT_COLOR:WrapTextInColorCode("/sfc minimap"), "or", DARKYELLOW_FONT_COLOR:WrapTextInColorCode("/sfc m")..":", "Toggle minimap button")
		print("    -", DARKYELLOW_FONT_COLOR:WrapTextInColorCode("/sfc help"), "or", DARKYELLOW_FONT_COLOR:WrapTextInColorCode("/sfc h")..":", "View avaialable slash commands")
    elseif cmd ~= "" then
        SFC.LogUtils.Message("Invalid command", "\""..msg.."\"")
    else
        toggleSFCWindow()
    end
end

function SFC_Reset()
    SFC_DB = SFC_DB_DEFAULTS
    ReloadUI()
end

function SFC_AddonCompartmentOnClick(_, btn)
    if btn == "LeftButton" then toggleSFCWindow() end
end

function SFC_AddonCompartmentOnEnter(_, btn)
    MenuUtil.ShowTooltip(btn, function(tooltip)
        tooltip:AddDoubleLine(C_AddOns.GetAddOnMetadata(addonName, "Title"), "@project-version@", nil, nil, nil, 1, 1, 1)
        tooltip:AddLine(C_AddOns.GetAddOnMetadata(addonName, "Notes"), 0.67, 0.67, 0.67, true)
    end)
end

function SFC_AddonCompartmentOnLeave(_, btn)
    MenuUtil.HideTooltip(btn)
end

---Resets dumped achievement info from in-game (**INTENDED FOR DEVELOPMENT PURPOSES ONLY**)
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