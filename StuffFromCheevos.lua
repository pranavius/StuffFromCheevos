local name, SFC = ...

-- TODO: Remember to delete this later
print("Welcome to StuffFromCheevos!")

function SFC_Reset()
    SFC_DB = {}
    print("SFC DB Reset")
end

---Dumps all available achievement info from in-game (**INTENDED FOR DEVELOPMENT PURPOSES ONLY**)
function SFC_Dump()
   if not SFC_DB then SFC_DB = {} end

    for _, categoryID in ipairs(GetCategoryList()) do
        if not SFC_DB.categories then SFC_DB.categories = {} end
        local category, parentID, categoryFlags = GetCategoryInfo(categoryID)
        if not SFC_DB.categories[categoryID] then
            SFC_DB.categories[categoryID] = {
                category = category,
                parentID = parentID,
                flags = categoryFlags,
                achievements = {}
            }
        end

        for index = 1, GetCategoryNumAchievements(categoryID, true) do
            local achievementID, achievement, points, _, _, _, _, description, achievementFlags, _, rewardText, isGuild, _, earnedBy, isStatistic = GetAchievementInfo(categoryID, index)
            if achievementID then
                local rewardItemID = C_AchievementInfo.GetRewardItemID(achievementID) or -1
                SFC_DB.categories[categoryID].achievements[achievementID] = {
                    achievement = achievement,
                    points = points,
                    description = description,
                    flags = achievementFlags,
                    rewardText = rewardText,
                    rewardItemID = rewardItemID,
                    earnedBy = earnedBy,
                    isGuild = isGuild,
                    isStatistic = isStatistic
                }
            else
                if not SFC_DB.notFound then SFC_DB.notFound = {} end
                if not SFC_DB.notFound[category] then SFC_DB.notFound[category] = { id = categoryID, indicies = {} } end
                local notFoundCategory = SFC_DB.notFound[category]
                if not tContains(notFoundCategory.indicies, index) then
                    tinsert(notFoundCategory.indicies, index)
                end
                print("No achievementID found for index", index, "in category:", category)
            end
        end
    end

    print("Achievement Data saved to DB")
end