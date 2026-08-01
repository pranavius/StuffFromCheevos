local SFC = select(2, ...)

local FACTION_NAME = {
    ALLIANCE = "Alliance",
    HORDE = "Horde"
}

SFC.Categories = {
    "All",
    "Mounts",
    "Titles",
    "Cosmetics",
    "Customizations",
    "Toys",
    "Pets",
    "Decor",
}

SFC.Mounts = {
    { itemID = 44223, achievementID = 614, categoryID = 95, faction = FACTION_NAME.ALLIANCE }, -- Black War Bear (Alliance)
    { itemID = 44224, achievementID = 619, categoryID = 95, faction = FACTION_NAME.HORDE }, -- Black War Bear
    { itemID = 44160, achievementID = 2136, categoryID = 168 }, -- Red Proto-Drake
    { itemID = 44177, achievementID = 2144, categoryID = 155 }, -- Violet Proto-Drake
    { itemID = 51954, achievementID = 4602, categoryID = 168 }, -- Bloodbathed Frostbrood Vanquisher
    { itemID = 51955, achievementID = 4603, categoryID = 168 }, -- Icebound Frostbrood Vanquisher
    { itemID = 62900, achievementID = 4845, categoryID = 168 }, -- Volcanic Stone Drake
    { itemID = 62901, achievementID = 4853, categoryID = 168 }, -- Drake of the East Wind
    { itemID = 69230, achievementID = 5828, categoryID = 168 }, -- Corrupted Egg of Millagazor
    { itemID = 69213, achievementID = 5866, categoryID = 15070 }, -- Flameward Hippogryph
    { itemID = 77068, achievementID = 6169, categoryID = 168 }, -- Twilight Harbinger
    { itemID = 81559, achievementID = 6827, categoryID = 15114, faction = FACTION_NAME.HORDE }, -- Pandaren Kite String
    { itemID = 89785, achievementID = 6828, categoryID = 15114, faction = FACTION_NAME.ALLIANCE }, -- Pandaren Kite String (Alliance)
    { itemID = 87769, achievementID = 6927, categoryID = 168 }, -- Crimson Cloud Serpent
    { itemID = 87773, achievementID = 6932, categoryID = 168 }, -- Heavenly Crimson Cloud Serpent
    { itemID = 93662, achievementID = 8124, categoryID = 168 }, -- Armored Skyscreamer
    { itemID = 104208, achievementID = 8454, categoryID = 168 }, -- Galakras
    { itemID = 116383, achievementID = 8985, categoryID = 168 }, -- Gorestrider Gronnling
    { itemID = 116670, achievementID = 9396, categoryID = 168 }, -- Frostplains Battleboar
    { itemID = 116668, achievementID = 9539, categoryID = 15303, faction = FACTION_NAME.ALLIANCE }, -- Armored Frostboar (Alliance)
    { itemID = 116668, achievementID = 9705, categoryID = 15303, faction = FACTION_NAME.HORDE }, -- Armored Frostboar
    { itemID = 118676, achievementID = 9713, categoryID = 15248 }, -- Emerald Drake
    { itemID = 120968, achievementID = 9909, categoryID = 15246 }, -- Chauffeured Chopper
    { itemID = 128706, achievementID = 10018, categoryID = 15235 }, -- Soaring Skyterror
    { itemID = 127140, achievementID = 10149, categoryID = 168 }, -- Infernal Direwolf
    { itemID = 138387, achievementID = 11066, categoryID = 15257 }, -- Ratstallion
    { itemID = 141217, achievementID = 11163, categoryID = 168 }, -- Leyfeather Hippogryph
    { itemID = 140500, achievementID = 11176, categoryID = 15247 }, -- Mechanized Lumber Extractor
    { itemID = 141216, achievementID = 11180, categoryID = 168 }, -- Grove Defiler
    { itemID = 129280, achievementID = 11474, categoryID = 15283 }, -- Prestigious War Steed
    { itemID = 143864, achievementID = 11474, categoryID = 15283 }, -- Prestigious War Wolf
    { itemID = 152815, achievementID = 11987, categoryID = 168 }, -- Antoran Gloomhound
    { itemID = 45801, achievementID = 12401, categoryID = 168 }, -- Ironbound Proto-Drake
    { itemID = 45802, achievementID = 12401, categoryID = 168 }, -- Rusted Proto-Drake
    { itemID = 163216, achievementID = 12806, categoryID = 168 }, -- Bloodgorged Crawg
    { itemID = 161215, achievementID = 12812, categoryID = 168 }, -- Reins of the Obsidian Krolusk
    { itemID = 140228, achievementID = 12895, categoryID = 15266 }, -- Prestigious Bronze Courser
    { itemID = 169162, achievementID = 13250, categoryID = 15298 }, -- Wonderwing 2.0
    { itemID = 166539, achievementID = 13315, categoryID = 168 }, -- Dazar'alor Windreaver
    { itemID = 168055, achievementID = 13517, categoryID = 15284, faction = FACTION_NAME.HORDE }, -- Bloodflank Charger
    { itemID = 168056, achievementID = 13517, categoryID = 15284, faction = FACTION_NAME.ALLIANCE }, -- Ironclad Frostclaw
    { itemID = 168329, achievementID = 13541, categoryID = 15298 }, -- Keys to the Model W
    { itemID = 169194, achievementID = 13638, categoryID = 15298 }, -- Snapback Scuttler
    { itemID = 167171, achievementID = 13687, categoryID = 168 }, -- Azshari Bloatray
    { itemID = 174861, achievementID = 14146, categoryID = 168 }, -- Wriggling Parasite
    { itemID = 184183, achievementID = 14322, categoryID = 168 }, -- Voracious Gorger
    { itemID = 182596, achievementID = 14355, categoryID = 168 }, -- Rampart Screecher
    { itemID = 182074, achievementID = 14751, categoryID = 15441 }, -- Chosen Tauralus Mount
    { itemID = 181820, achievementID = 14752, categoryID = 15441 }, -- Armored Chosen Tauralus Mount
    { itemID = 186654, achievementID = 15064, categoryID = 15422 }, -- Bracelet of Salaranga
    { itemID = 186655, achievementID = 15089, categoryID = 15440 }, -- Mawsworn Charger
    { itemID = 186653, achievementID = 15130, categoryID = 168 }, -- Hand of Hrestimorak
    { itemID = 186637, achievementID = 15178, categoryID = 15428 }, -- Tazavesh Gearglider
    { itemID = 188696, achievementID = 15254, categoryID = 15440 }, -- Colossal Ebonclaw Mawrat
    { itemID = 188674, achievementID = 15310, categoryID = 15454 }, -- Mage-Bound Spelltome
    { itemID = 188736, achievementID = 15322, categoryID = 15440 }, -- Colossal Soulshredder Mawrat
    { itemID = 187673, achievementID = 15336, categoryID = 15422 }, -- Cryptic Aurelid
    { itemID = 187675, achievementID = 15491, categoryID = 168 }, -- Shimmering Aurelid
    { itemID = 198654, achievementID = 15833, categoryID = 15248, faction = FACTION_NAME.HORDE }, -- Otterworldly Ottuk Carrier
    { itemID = 198654, achievementID = 15834, categoryID = 15248, faction = FACTION_NAME.ALLIANCE }, -- Otterworldly Ottuk Carrier (Alliance)
    { itemID = 192784, achievementID = 16295, categoryID = 168 }, -- Shellack
    { itemID = 192806, achievementID = 16355, categoryID = 168 }, -- Raging Magmammoth
    { itemID = 192774, achievementID = 16492, categoryID = 15465 }, -- Coralscale Salamanther
    { spellID = 408648, achievementID = 17785, categoryID = 15455 }, -- Calescent Shalewing
    { itemID = 205205, achievementID = 18251, categoryID = 168 }, -- Shadowflame Shalewing
    { itemID = 208152, achievementID = 18646, categoryID = 15465 }, -- Pattie
    { itemID = 205208, achievementID = 19079, categoryID = 15274 }, -- Sandy Shalewing
    { itemID = 210060, achievementID = 19349, categoryID = 168 }, -- Reins of the Shadow Dusk Dreamsaber
    { itemID = 210142, achievementID = 19458, categoryID = 15301 }, -- Taivan
    { itemID = 198822, achievementID = 19479, categoryID = 15465 }, -- Bestowed Ohuna Spotter
    { itemID = 192792, achievementID = 19481, categoryID = 15465 }, -- Bestowed Thunderspine Packleader
    { itemID = 192788, achievementID = 19482, categoryID = 15465 }, -- Bestowed Trawling Mammoth
    { itemID = 211862, achievementID = 19483, categoryID = 15465 }, -- Bestowed Ottuk Vanguard
    { itemID = 192765, achievementID = 19485, categoryID = 15465 }, -- Bestowed Sandskimmer
    { spellID = 373967, achievementID = 19486, categoryID = 15465 }, -- Stormtouched Bruffalon
    { itemID = 217612, achievementID = 20501, categoryID = 15301 }, -- Zovaal's Soul Eater
    { itemID = 223158, achievementID = 40097, categoryID = 15283 }, -- Raging Cinderbee
    { itemID = 223266, achievementID = 40232, categoryID = 168 }, -- Shadowed Swarmite
    { itemID = 224415, achievementID = 40438, categoryID = 15523 }, -- Ivory Goliathus
    { itemID = 223286, achievementID = 40539, categoryID = 171 }, -- Kah, Legend of the Deep
    { itemID = 223267, achievementID = 40702, categoryID = 15462 }, -- Swarmite Skyhunter
    { itemID = 235515, achievementID = 40953, categoryID = 15301 }, -- Jani's Trashpile Mount
    { spellID = 303767, achievementID = 40956, categoryID = 15298 }, -- Honeyback Hivemother
    { itemID = 228760, achievementID = 40976, categoryID = 15268 }, -- Coldflame Tempest
    { itemID = 232991, achievementID = 41133, categoryID = 15521 }, -- The Breaker's Song
    { spellID = 448934, achievementID = 41201, categoryID = 15521 }, -- Shadow of Doubt
    { itemID = 231173, achievementID = 41286, categoryID = 168 }, -- Junkmaestro's Magnetomech
    { itemID = 242714, achievementID = 41597, categoryID = 168 }, -- Umbral K'arroc
    { itemID = 174654, achievementID = 41929, categoryID = 15546 }, -- Black Serpent of N'Zoth
    { itemID = 235709, achievementID = 41966, categoryID = 15546 }, -- Ny'alothan Shadow Worm
    { itemID = 237485, achievementID = 41980, categoryID = 15506 }, -- Terror of the Night
    { itemID = 257193, achievementID = 42703, categoryID = 15605 }, -- Preyseeker's Nightmare
    { itemID = 250240, achievementID = 61017, categoryID = 15521 }, -- Phase-Lost Slateback
    { itemID = 262620, achievementID = 61256, categoryID = 15272 }, -- Calamitous Carrion (Midnight KSM S1 -- TODO: Move to Legacy after Midnight Season 1 ends)
    { itemID = 262621, achievementID = 61258, categoryID = 15272 }, -- Convalescent Carrion (Midnight KSL S1 -- TODO: Move to Legacy after Midnight Season 1 ends)
    { itemID = 260228, achievementID = 61188, categoryID = 15270 }, -- Galactic Gladiator's Goredrake (Midnight Gladiator S1 -- TODO: Move to Legacy after Midnight Season 1 ends)
    { itemID = 263579, achievementID = 61263, categoryID = 15553 }, -- Vivacious Chloroceros
    { itemID = 260887, achievementID = 61380, categoryID = 168 }, -- Tenebrous Harrower
    { itemID = 258188, achievementID = 61451, categoryID = 15301 }, -- Geargrinder Mk. 11
    { itemID = 258884, achievementID = 61463, categoryID = 15454 }, -- Spawn of Vyranoth (TODO: Move to Legacy after TT5 ends)
    { itemID = 257145, achievementID = 61584, categoryID = 15462 }, -- Crimson Dragonhawk
    { itemID = 257199, achievementID = 61906, categoryID = 15571 }, -- Giganto Manis
    { itemID = 265656, achievementID = 62096, categoryID = 15248, faction = FACTION_NAME.HORDE }, -- Anu'shalla, Shadow's Guidance
    { itemID = 265656, achievementID = 62103, categoryID = 15248, faction = FACTION_NAME.ALLIANCE }, -- Anu'shalla, Shadow's Guidance (Alliance)
    { itemID = 257144, achievementID = 62190, categoryID = 15600 }, -- Umbral Dragonhawk
    { itemID = 260697, achievementID = 62385, categoryID = 15547 }, -- Lab-grown Stormray
    { itemID = 252011, achievementID = 62386, categoryID = 15553 }, -- Brilliant Petalwing
    { itemID = 263222, achievementID = 61799, categoryID = 15531 }, -- Arcanovoid Construct (TODO: Move to Legacy at the end of Midnight S1)
    { itemID = 275652, achievementID = 63254, categoryID = 168 }, -- Crimson Venomfang
    { itemID = 275656, achievementID = 63359, categoryID = 15553 }, -- Auriferous Venomfang
    { itemID = 276801, achievementID = 63630, categoryID = 15553 }, -- Venomous Coiler
    { itemID = 276553, achievementID = 63653, categoryID = 15553 }, -- Emerald Skyfang
    -- TODO List:
    -- Seasonal AOTC and/or Cutting Edge mount
}

-- titleID corresponds to CharTitles.Mask_ID in db2
SFC.Titles = {
    { titleID = 47, achievementID = 46, categoryID = 97 }, -- the Explorer
    { titleID = 41, achievementID = 230, categoryID = 95, faction = FACTION_NAME.ALLIANCE }, -- Battlemaster (Alliance)
    { titleID = 34, achievementID = 714, categoryID = 95, faction = FACTION_NAME.HORDE }, -- Conqueror
    { titleID = 98, achievementID = 762, categoryID = 201, faction = FACTION_NAME.HORDE }, -- Ambassador
    { titleID = 35, achievementID = 907, categoryID = 95, faction = FACTION_NAME.ALLIANCE }, -- Justicar
    { titleID = 43, achievementID = 913, categoryID = 155 }, -- Elder
    { titleID = 48, achievementID = 942, categoryID = 201, faction = FACTION_NAME.ALLIANCE }, -- the Diplomat
    { titleID = 48, achievementID = 943, categoryID = 201, faction = FACTION_NAME.HORDE }, -- the Diplomat
    { titleID = 99, achievementID = 945, categoryID = 201 }, -- the Argent Champion
    { titleID = 98, achievementID = 948, categoryID = 201, faction = FACTION_NAME.ALLIANCE }, -- Ambassador (Alliance)
    { titleID = 100, achievementID = 953, categoryID = 201 }, -- Guardian of Cenarius
    { titleID = 42, achievementID = 978, categoryID = 96 }, -- the Seeker
    { titleID = 46, achievementID = 1015, categoryID = 201 }, -- the Exalted
    { titleID = 44, achievementID = 1038, categoryID = 155, faction = FACTION_NAME.ALLIANCE }, -- Flame Warden
    { titleID = 45, achievementID = 1039, categoryID = 155, faction = FACTION_NAME.HORDE }, -- Flame Keeper
    { titleID = 41, achievementID = 1175, categoryID = 95, faction = FACTION_NAME.HORDE }, -- Battlemaster
    { titleID = 51, achievementID = 1516, categoryID = 171 }, -- Salty
    { titleID = 52, achievementID = 1563, categoryID = 170 }, -- Chef
    { titleID = 92, achievementID = 1656, categoryID = 155 }, -- the Hallowed
    { titleID = 97, achievementID = 1658, categoryID = 168 }, -- Champion of the Frozen Wastes
    { titleID = 101, achievementID = 1683, categoryID = 155 }, -- Brewmaster
    { titleID = 102, achievementID = 1691, categoryID = 155 }, -- Merrymaker
    { titleID = 103, achievementID = 1693, categoryID = 155 }, -- the Love Fool
    { titleID = 104, achievementID = 1793, categoryID = 155 }, -- Matron
    { titleID = 105, achievementID = 1793, categoryID = 155 }, -- Patron
    { titleID = 107, achievementID = 2051, categoryID = 14922 }, -- of the Nightfall
    { titleID = 89, achievementID = 2054, categoryID = 14922 }, -- Twilight Vanquisher
    { titleID = 114, achievementID = 2760, categoryID = 14941, faction = FACTION_NAME.ALLIANCE }, -- of Darnassus
    { titleID = 113, achievementID = 2761, categoryID = 14941, faction = FACTION_NAME.ALLIANCE }, -- of the Exodar
    { titleID = 115, achievementID = 2763, categoryID = 14941, faction = FACTION_NAME.ALLIANCE }, -- of Ironforge
    { titleID = 119, achievementID = 2767, categoryID = 14941, faction = FACTION_NAME.HORDE }, -- of Silvermoon
    { titleID = 120, achievementID = 2768, categoryID = 14941, faction = FACTION_NAME.HORDE }, -- of Thunder Bluff
    { titleID = 121, achievementID = 2769, categoryID = 14941, faction = FACTION_NAME.HORDE }, -- of the Undercity
    { titleID = 122, achievementID = 2798, categoryID = 155 }, -- the Noble
    { titleID = 133, achievementID = 3478, categoryID = 155 }, -- the Pilgrim
    { titleID = 138, achievementID = 4584, categoryID = 14922 }, -- the Light of Dawn
    { titleID = 139, achievementID = 4583, categoryID = 14922 }, -- Bane of the Fallen King
    { titleID = 140, achievementID = 4530, categoryID = 14922 }, -- the Kingslayer
    { titleID = 141, achievementID = 4598, categoryID = 14866 }, -- of the Ashen Verdict
    { titleID = 148, achievementID = 4854, categoryID = 15071 }, -- Assistant Professor
    { titleID = 149, achievementID = 4855, categoryID = 15071 }, -- Associate Professor
    { titleID = 187, achievementID = 5116, categoryID = 15068 }, -- Blackwing's Bane
    { titleID = 186, achievementID = 5121, categoryID = 15068 }, -- Dragonslayer
    { titleID = 151, achievementID = 5123, categoryID = 15068 }, -- of the Four Winds
    { titleID = 153, achievementID = 5325, categoryID = 15092, faction = FACTION_NAME.HORDE }, -- Veteran of the Horde
    { titleID = 152, achievementID = 5328, categoryID = 15092, faction = FACTION_NAME.ALLIANCE }, -- Veteran of the Alliance
    { titleID = 1, achievementID = 5330, categoryID = 15092, faction = FACTION_NAME.ALLIANCE }, -- Private
    { titleID = 2, achievementID = 5331, categoryID = 15092, faction = FACTION_NAME.ALLIANCE }, -- Corporal
    { titleID = 3, achievementID = 5332, categoryID = 15092, faction = FACTION_NAME.ALLIANCE }, -- Sergeant (Alliance)
    { titleID = 4, achievementID = 5333, categoryID = 15092, faction = FACTION_NAME.ALLIANCE }, -- Master Sergeant
    { titleID = 5, achievementID = 5334, categoryID = 15092, faction = FACTION_NAME.ALLIANCE }, -- Sergeant Major
    { titleID = 6, achievementID = 5335, categoryID = 15092, faction = FACTION_NAME.ALLIANCE }, -- Knight
    { titleID = 7, achievementID = 5336, categoryID = 15092, faction = FACTION_NAME.ALLIANCE }, -- Knight-Lieutenant
    { titleID = 8, achievementID = 5337, categoryID = 15092, faction = FACTION_NAME.ALLIANCE }, -- Knight-Captain
    { titleID = 23, achievementID = 5338, categoryID = 15092, faction = FACTION_NAME.HORDE }, -- Centurion
    { titleID = 10, achievementID = 5339, categoryID = 15092, faction = FACTION_NAME.ALLIANCE }, -- Lieutenant Commander
    { titleID = 11, achievementID = 5340, categoryID = 15092, faction = FACTION_NAME.ALLIANCE }, -- Commander
    { titleID = 12, achievementID = 5341, categoryID = 15092, faction = FACTION_NAME.ALLIANCE }, -- Marshal
    { titleID = 27, achievementID = 5342, categoryID = 15092, faction = FACTION_NAME.HORDE }, -- Warlord
    { titleID = 14, achievementID = 5343, categoryID = 15092, faction = FACTION_NAME.ALLIANCE }, -- Grand Marshal
    { titleID = 15, achievementID = 5345, categoryID = 15092, faction = FACTION_NAME.HORDE }, -- Scout
    { titleID = 16, achievementID = 5346, categoryID = 15092, faction = FACTION_NAME.HORDE }, -- Grunt
    { titleID = 3, achievementID = 5347, categoryID = 15092, faction = FACTION_NAME.HORDE }, -- Sergeant
    { titleID = 18, achievementID = 5348, categoryID = 15092, faction = FACTION_NAME.HORDE }, -- Senior Sergeant
    { titleID = 19, achievementID = 5349, categoryID = 15092, faction = FACTION_NAME.HORDE }, -- First Sergeant
    { titleID = 20, achievementID = 5350, categoryID = 15092, faction = FACTION_NAME.HORDE }, -- Stone Guard
    { titleID = 21, achievementID = 5351, categoryID = 15092, faction = FACTION_NAME.HORDE }, -- Blood Guard
    { titleID = 22, achievementID = 5352, categoryID = 15092, faction = FACTION_NAME.HORDE }, -- Legionnaire
    { titleID = 24, achievementID = 5353, categoryID = 15092, faction = FACTION_NAME.HORDE }, -- Champion
    { titleID = 25, achievementID = 5354, categoryID = 15092, faction = FACTION_NAME.HORDE }, -- Lieutenant General
    { titleID = 26, achievementID = 5355, categoryID = 15092, faction = FACTION_NAME.HORDE }, -- General
    { titleID = 28, achievementID = 5356, categoryID = 15092, faction = FACTION_NAME.HORDE }, -- High Warlord
    { titleID = 13, achievementID = 5357, categoryID = 15092, faction = FACTION_NAME.ALLIANCE }, -- Field Marshal
    { titleID = 9, achievementID = 5359, categoryID = 15092, faction = FACTION_NAME.ALLIANCE }, -- Knight-Champion
    { titleID = 185, achievementID = 5506, categoryID = 168 }, -- Defender of a Shattered World
    { titleID = 190, achievementID = 5803, categoryID = 15068 }, -- Firelord
    { titleID = 188, achievementID = 5827, categoryID = 15072 }, -- Avenger of Hyjal
    { titleID = 189, achievementID = 5879, categoryID = 15070 }, -- the Flamebreaker
    { titleID = 194, achievementID = 6116, categoryID = 15068 }, -- Savior of Azeroth
    { titleID = 196, achievementID = 6177, categoryID = 15068 }, -- Destroyer's End
    { titleID = 199, achievementID = 6590, categoryID = 15118 }, -- Zookeeper
    { titleID = 207, achievementID = 6607, categoryID = 15119 }, -- Tamer
    { titleID = 204, achievementID = 6724, categoryID = 15107 }, -- Delver of the Vaults
    { titleID = 198, achievementID = 6734, categoryID = 15107 }, -- the Fearless
    { titleID = 206, achievementID = 6874, categoryID = 15302, faction = FACTION_NAME.ALLIANCE }, -- the Scenaturdist (Alliance)
    { titleID = 203, achievementID = 6926, categoryID = 168 }, -- the Tranquil Master
    { titleID = 183, achievementID = 6941, categoryID = 15092, faction = FACTION_NAME.HORDE }, -- Hero of the Horde
    { titleID = 182, achievementID = 6942, categoryID = 15092, faction = FACTION_NAME.ALLIANCE }, -- Hero of the Alliance
    { titleID = 202, achievementID = 7306, categoryID = 170 }, -- Master of the Ways
    { titleID = 205, achievementID = 7479, categoryID = 15114 }, -- Shado-Master
    { titleID = 206, achievementID = 7509, categoryID = 15302, faction = FACTION_NAME.HORDE }, -- the Scenaturdist
    { titleID = 93, achievementID = 7520, categoryID = 96 }, -- Loremaster
    { titleID = 208, achievementID = 7612, categoryID = 15071 }, -- Seeker of Knowledge
    { titleID = 218, achievementID = 8023, categoryID = 15114 }, -- the Wakener
    { titleID = 220, achievementID = 8052, categoryID = 95, faction = FACTION_NAME.ALLIANCE }, -- Khan (Alliance)
    { titleID = 220, achievementID = 8055, categoryID = 95, faction = FACTION_NAME.HORDE }, -- Khan
    { titleID = 222, achievementID = 8067, categoryID = 15107 }, -- Storm's End
    { titleID = 221, achievementID = 8121, categoryID = 15110 }, -- the Stormbreaker
    { titleID = 240, achievementID = 8397, categoryID = 15118 }, -- the Crazy Cat Lady
    { titleID = 252, achievementID = 8397, categoryID = 15118 }, -- the Crazy Cat Man
    { titleID = 214, achievementID = 8482, categoryID = 15107 }, -- Hellscream's Downfall
    { titleID = 211, achievementID = 8679, categoryID = 15107, faction = FACTION_NAME.ALLIANCE }, -- Conqueror of Orgrimmar (Alliance)
    { titleID = 212, achievementID = 8680, categoryID = 15107, faction = FACTION_NAME.HORDE }, -- Liberator of Orgrimmar
    { titleID = 304, achievementID = 8965, categoryID = 15231 }, -- Empire's Twilight
    { titleID = 301, achievementID = 8973, categoryID = 15231 }, -- Ironbane
    { titleID = 110, achievementID = 9058, categoryID = 15228 }, -- Jenkins
    { titleID = 278, achievementID = 9072, categoryID = 15232 }, -- Talon King
    { titleID = 279, achievementID = 9072, categoryID = 15232 }, -- Talon Queen
    { titleID = 260, achievementID = 9094, categoryID = 15303 }, -- Architect
    { titleID = 305, achievementID = 9464, categoryID = 169 }, -- Artisan
    { titleID = 269, achievementID = 9508, categoryID = 15303, faction = FACTION_NAME.HORDE }, -- Warlord of Draenor
    { titleID = 267, achievementID = 9509, categoryID = 15303, faction = FACTION_NAME.HORDE }, -- Draenei Destroyer
    { titleID = 264, achievementID = 9510, categoryID = 15303, faction = FACTION_NAME.HORDE }, -- the Dwarfstalker
    { titleID = 263, achievementID = 9511, categoryID = 15303, faction = FACTION_NAME.HORDE }, -- Gnomebane
    { titleID = 262, achievementID = 9512, categoryID = 15303, faction = FACTION_NAME.HORDE }, -- the Manslayer
    { titleID = 266, achievementID = 9513, categoryID = 15303, faction = FACTION_NAME.HORDE }, -- Scourge of the Kaldorei
    { titleID = 268, achievementID = 9514, categoryID = 15303, faction = FACTION_NAME.HORDE }, -- Terror of the Tushui
    { titleID = 265, achievementID = 9515, categoryID = 15303, faction = FACTION_NAME.HORDE }, -- Worgen Hunter
    { titleID = 275, achievementID = 9516, categoryID = 15303, faction = FACTION_NAME.ALLIANCE }, -- Slayer of Sin'dorei
    { titleID = 272, achievementID = 9517, categoryID = 15303, faction = FACTION_NAME.ALLIANCE }, -- The Death Stalker
    { titleID = 273, achievementID = 9518, categoryID = 15303, faction = FACTION_NAME.ALLIANCE }, -- Killer of Kezan
    { titleID = 271, achievementID = 9519, categoryID = 15303, faction = FACTION_NAME.ALLIANCE }, -- Orcslayer
    { titleID = 276, achievementID = 9520, categoryID = 15303, faction = FACTION_NAME.ALLIANCE }, -- Huojin's Fall
    { titleID = 270, achievementID = 9521, categoryID = 15303, faction = FACTION_NAME.ALLIANCE }, -- the Butcher
    { titleID = 274, achievementID = 9522, categoryID = 15303, faction = FACTION_NAME.ALLIANCE }, -- Troll Hunter
    { titleID = 277, achievementID = 9540, categoryID = 15303, faction = FACTION_NAME.ALLIANCE }, -- The Stable Master (Alliance)
    { titleID = 300, achievementID = 9619, categoryID = 168 }, -- the Savage Hero
    { titleID = 277, achievementID = 9706, categoryID = 15303, faction = FACTION_NAME.HORDE }, -- Stable Master
    { titleID = 269, achievementID = 9738, categoryID = 15303, faction = FACTION_NAME.ALLIANCE }, -- Warlord of Draenor (Alliance)
    { titleID = 307, achievementID = 9924, categoryID = 97 }, -- Field Photographer
    { titleID = 319, achievementID = 10043, categoryID = 15231 }, -- Defiler's End
    { titleID = 318, achievementID = 10072, categoryID = 15220, faction = FACTION_NAME.ALLIANCE }, -- of the Jungle (Alliance)
    { titleID = 317, achievementID = 10164, categoryID = 15303 }, -- Captain
    { titleID = 318, achievementID = 10265, categoryID = 15220, faction = FACTION_NAME.HORDE }, -- of the Jungle
    { titleID = 53, achievementID = 10354, categoryID = 15247 }, -- Crashin' Thrashin'
    { titleID = 334, achievementID = 10694, categoryID = 15259 }, -- the Fabulous
    { titleID = 341, achievementID = 10827, categoryID = 15255 }, -- the Dreamer
    { titleID = 342, achievementID = 10850, categoryID = 15255 }, -- Vengeance Incarnate
    { titleID = 343, achievementID = 11232, categoryID = 15252 }, -- the Gullible
    { titleID = 356, achievementID = 11761, categoryID = 15259 }, -- Stylist
    { titleID = 362, achievementID = 11763, categoryID = 168 }, -- the Tomb Raider
    { titleID = 357, achievementID = 11781, categoryID = 15255 }, -- the Darkener
    { titleID = 361, achievementID = 11941, categoryID = 15258 }, -- Timelord
    { titleID = 364, achievementID = 12002, categoryID = 15255 }, -- Titanslayer
    { titleID = 366, achievementID = 12083, categoryID = 15257 }, -- the Lightbringer
    { titleID = 129, achievementID = 12399, categoryID = 14922 }, -- Starcaller
    { titleID = 130, achievementID = 12399, categoryID = 14922 }, -- the Astral Walker
    { titleID = 373, achievementID = 12412, categoryID = 15292 }, -- Prospector
    { titleID = 372, achievementID = 12439, categoryID = 15252 }, -- Postmaster
    { titleID = 381, achievementID = 12533, categoryID = 15286 }, -- the Purifier
    { titleID = 377, achievementID = 12604, categoryID = 15283, faction = FACTION_NAME.HORDE }, -- Conqueror of Azeroth
    { titleID = 377, achievementID = 12605, categoryID = 15283, faction = FACTION_NAME.ALLIANCE }, -- Conqueror of Azeroth (Alliance)
    { titleID = 383, achievementID = 12861, categoryID = 15283 }, -- Contender
    { titleID = 382, achievementID = 13134, categoryID = 15307 }, -- Expedition Leader
    { titleID = 386, achievementID = 13314, categoryID = 15286 }, -- Hero of Dazar'alor
    { titleID = 403, achievementID = 13555, categoryID = 15298 }, -- Junkyard
    { titleID = 405, achievementID = 13638, categoryID = 15298 }, -- of the Deeps
    { titleID = 404, achievementID = 13733, categoryID = 15286 }, -- the Eternal
    { titleID = 412, achievementID = 13924, categoryID = 15284, faction = FACTION_NAME.HORDE }, -- Veteran of the Fourth War
    { titleID = 412, achievementID = 13925, categoryID = 15284, faction = FACTION_NAME.ALLIANCE }, -- Veteran of the Fourth War (Alliance)
    { titleID = 417, achievementID = 14055, categoryID = 15286 }, -- the Uncorrupted
    { titleID = 229, achievementID = 14175, categoryID = 15218 }, -- Gorgeous
    { titleID = 423, achievementID = 14277, categoryID = 15436 }, -- Cryptkeeper
    { titleID = 432, achievementID = 14365, categoryID = 15438 }, -- Sinbreaker
    { titleID = 433, achievementID = 14682, categoryID = 15441 }, -- the Party Herald
    { titleID = 437, achievementID = 14752, categoryID = 15441 }, -- Abominable
    { titleID = 435, achievementID = 14775, categoryID = 15441 }, -- Fun Guy
    { titleID = 447, achievementID = 15121, categoryID = 15438 }, -- Breaker of Chains
    { titleID = 450, achievementID = 15324, categoryID = 15440 }, -- Tower Ranger
    { titleID = 455, achievementID = 15489, categoryID = 15438 }, -- Guardian of the Pattern
    { titleID = 460, achievementID = 15579, categoryID = 15422 }, -- of Lordaeron
    { titleID = 462, achievementID = 15648, categoryID = 15436 }, -- Maw Walker
    { titleID = 488, achievementID = 16353, categoryID = 15468 }, -- the Storm-Eater
    { titleID = 471, achievementID = 16443, categoryID = 15466 }, -- Soupervisor
    { titleID = 472, achievementID = 16446, categoryID = 15465 }, -- Birdwatcher
    { titleID = 484, achievementID = 16494, categoryID = 15466 }, -- Agent of the Black Prince
    { titleID = 479, achievementID = 16601, categoryID = 15283 }, -- Malicious
    { titleID = 477, achievementID = 16648, categoryID = 15272 }, -- the Thundering
    { titleID = 480, achievementID = 16731, categoryID = 15118 }, -- Knight of Feathersworth
    { titleID = 483, achievementID = 16760, categoryID = 15466 }, -- Paragon of the Obsidian Brood
    { titleID = 485, achievementID = 16791, categoryID = 169 }, -- Merchant Artisan
    { titleID = 486, achievementID = 16799, categoryID = 169 }, -- Personal Crafter
    { titleID = 494, achievementID = 17413, categoryID = 15465 }, -- the Key Master
    { titleID = 495, achievementID = 17543, categoryID = 15465 }, -- the Forbidden
    { titleID = 498, achievementID = 17734, categoryID = 15455 }, -- the Reconciler
    { titleID = 502, achievementID = 17841, categoryID = 15246 }, -- Barter Boss
    { titleID = 505, achievementID = 18159, categoryID = 15468 }, -- Heir to the Void
    { titleID = 508, achievementID = 18200, categoryID = 15465 }, -- Field Researcher
    { titleID = 507, achievementID = 18284, categoryID = 15465 }, -- Sniffenseeker
    { titleID = 510, achievementID = 18383, categoryID = 15118 }, -- Whelptender
    { titleID = 512, achievementID = 18642, categoryID = 15465 }, -- the Inquisitive
    { titleID = 519, achievementID = 18646, categoryID = 15465 }, -- Honorary Preservationist
    { titleID = 514, achievementID = 18705, categoryID = 15272 }, -- of the Infinite
    { titleID = 516, achievementID = 18958, categoryID = 15455 }, -- of the Tyr's Guard
    { titleID = 527, achievementID = 19198, categoryID = 15465 }, -- Blossom Bringer
    { titleID = 55, achievementID = 19318, categoryID = 15455 }, -- of the Emerald Dream
    { titleID = 530, achievementID = 19343, categoryID = 15468 }, -- the Blazing
    { titleID = 536, achievementID = 19790, categoryID = 15455 }, -- Isles Archivist
    { titleID = 547, achievementID = 20206, categoryID = 15455 }, -- Champion of the Dragonflights
    { titleID = 562, achievementID = 40097, categoryID = 15283 }, -- Slayer of the Deeps
    { titleID = 549, achievementID = 40098, categoryID = 15531 }, -- Immortal Spelunker
    { titleID = 576, achievementID = 40222, categoryID = 15521 }, -- Echochaser
    { titleID = 556, achievementID = 40243, categoryID = 15526 }, -- Queenslayer
    { titleID = 570, achievementID = 40506, categoryID = 15523 }, -- Seeker of Loot
    { titleID = 563, achievementID = 40617, categoryID = 15525 }, -- Deephauler
    { titleID = 568, achievementID = 40662, categoryID = 15521 }, -- Machine-Warden
    { titleID = 569, achievementID = 40791, categoryID = 15506 }, -- Witness of the Kirin Tor
    { titleID = 571, achievementID = 40870, categoryID = 15532 }, -- Detective
    { titleID = 572, achievementID = 40874, categoryID = 15530 }, -- Silksinger
    { titleID = 573, achievementID = 40875, categoryID = 15530 }, -- Anub'
    { titleID = 574, achievementID = 40876, categoryID = 15530 }, -- Hand of the Vizier
    { titleID = 575, achievementID = 40882, categoryID = 15522 }, -- the Bountiful
    { titleID = 603, achievementID = 41086, categoryID = 15530 }, -- the Explosive
    { titleID = 599, achievementID = 41096, categoryID = 15522 }, -- Infinite Delver
    { titleID = 650, achievementID = 41095, categoryID = 15522 }, -- Delver
    { titleID = 550, achievementID = 41197, categoryID = 15531 }, -- High Explorer
    { titleID = 605, achievementID = 41236, categoryID = 15526 }, -- Liberator of Undermine
    { titleID = 606, achievementID = 41350, categoryID = 15530 }, -- Darkfuse Diplomat
    { titleID = 607, achievementID = 41352, categoryID = 15530 }, -- Trade-Duke
    { titleID = 613, achievementID = 41596, categoryID = 15526 }, -- Junkmaestro
    { titleID = 615, achievementID = 41611, categoryID = 15526 }, -- Void Vanquisher
    { titleID = 616, achievementID = 41629, categoryID = 15521 }, -- Part-Timer
    { titleID = 630, achievementID = 41818, categoryID = 15506, faction = FACTION_NAME.ALLIANCE }, -- of Stromgarde (Alliance)
    { titleID = 629, achievementID = 41820, categoryID = 15506, faction = FACTION_NAME.HORDE }, -- of Hammerfall
    { titleID = 550, achievementID = 42203, categoryID = 15531 }, -- High Explorer
    { titleID = 598, achievementID = 42779, categoryID = 15523 }, -- Flickering
    { titleID = 754, achievementID = 61052, categoryID = 15553 }, -- Dustlord
    { titleID = 657, achievementID = 61318, categoryID = 15606 }, -- the Furnished
    { titleID = 680, achievementID = 61344, categoryID = 15553 }, -- Chronicler of the Haranir
    { titleID = 690, achievementID = 61377, categoryID = 15566 }, -- Spirebane
    { titleID = 678, achievementID = 61379, categoryID = 15566 }, -- Dawnbringer
    { titleID = 666, achievementID = 61429, categoryID = 15567 }, -- Brawl Star
    { titleID = 664, achievementID = 61446, categoryID = 15283 }, -- Voidslayer
    { titleID = 669, achievementID = 61498, categoryID = 15506 }, -- Azeroth's Vanguard
    { titleID = 688, achievementID = 61798, categoryID = 15531 }, -- the Ominous
    { titleID = 550, achievementID = 61807, categoryID = 15531 }, -- High Explorer
    { titleID = 691, achievementID = 61901, categoryID = 15571 }, -- Treasure Seeker
    { titleID = 766, achievementID = 61910, categoryID = 15547 }, -- Mrglgrgl of Grglmrgl
    { titleID = 741, achievementID = 62239, categoryID = 15489 }, -- Thalassian Alchemist
    { titleID = 742, achievementID = 62240, categoryID = 15490 }, -- Thalassian Blacksmith
    { titleID = 743, achievementID = 62241, categoryID = 15491 }, -- Thalassian Enchanter
    { titleID = 744, achievementID = 62242, categoryID = 15492 }, -- Thalassian Engineer
    { titleID = 745, achievementID = 62243, categoryID = 15493 }, -- Thalassian Scribe
    { titleID = 746, achievementID = 62244, categoryID = 15494 }, -- Thalassian Jewelcrafter
    { titleID = 747, achievementID = 62245, categoryID = 15495 }, -- Thalassian Leatherworker
    { titleID = 748, achievementID = 62246, categoryID = 15496 }, -- Thalassian Tailor
    { titleID = 751, achievementID = 62250, categoryID = 15499 }, -- Thalassian Herbalist
    { titleID = 750, achievementID = 62251, categoryID = 15497 }, -- Thalassian Miner
    { titleID = 752, achievementID = 62252, categoryID = 15498 }, -- Thalassian Skinner
    { titleID = 755, achievementID = 62351, categoryID = 15605 }, -- Preyseeker
    { titleID = 771, achievementID = 62941, categoryID = 15608 }, -- Ritual Breaker
    { titleID = 791, achievementID = 63476, categoryID = 15566 }, -- Venom's End
    { titleID = 779, achievementID = 63510, categoryID = 171 }, -- Briny
    { titleID = 789, achievementID = 63635, categoryID = 171 }, -- Bloodsworn Mariner
    { titleID = 794, achievementID = 63636, categoryID = 15553 }, -- the Snake
    -- TODO List:
    -- Seasonal Gladiator/Viscious Gladiator title
    -- Seasonal raid HOF title
}

SFC.Cosmetics = {
    { itemID = 43348, achievementID = 45, categoryID = 97 }, -- Tabard of the Explorer
    { itemID = 49052, achievementID = 3857, categoryID = 15003, faction = FACTION_NAME.ALLIANCE }, -- Tabard of Conquest (Alliance)
    { itemID = 49054, achievementID = 3957, categoryID = 15003, faction = FACTION_NAME.HORDE }, -- Tabard of Conquest
    { itemID = 43300, achievementID = 7520, categoryID = 96 }, -- Loremaster's Colors
    { itemID = 128362, achievementID = 10172, categoryID = 15303, faction = FACTION_NAME.ALLIANCE }, -- Captain's Hat (Alliance)
    { itemID = 128363, achievementID = 10255, categoryID = 15303, faction = FACTION_NAME.HORDE }, -- Captain's Hat
    { itemID = 128364, achievementID = 10256, categoryID = 15303, faction = FACTION_NAME.HORDE }, -- Fleet Commander's Hat
    { itemID = 128365, achievementID = 10256, categoryID = 15303, faction = FACTION_NAME.ALLIANCE }, -- Fleet Commander's Hat (Alliance)
    { itemID = 156666, achievementID = 12290, categoryID = 15119 }, -- Master Trainer's Tabard
    -- Heritage of the Void (Void Elf)
    { itemID = 156690, achievementID = 12291, categoryID = 201 }, -- Ren'dorei Helm
    { itemID = 156691, achievementID = 12291, categoryID = 201 }, -- Ren'dorei Pauldrons
    { itemID = 156692, achievementID = 12291, categoryID = 201 }, -- Ren'dorei Mantle
    { itemID = 156693, achievementID = 12291, categoryID = 201 }, -- Ren'dorei Gloves
    { itemID = 156694, achievementID = 12291, categoryID = 201 }, -- Ren'dorei Belt
    { itemID = 156695, achievementID = 12291, categoryID = 201 }, -- Ren'dorei Leggings
    { itemID = 156696, achievementID = 12291, categoryID = 201 }, -- Ren'dorei Boots
    { itemID = 156697, achievementID = 12291, categoryID = 201 }, -- Ren'dorei Bracers
    -- Heritage of the Nightborne
    { itemID = 156675, achievementID = 12413, categoryID = 201 }, -- Shal'dorei Crown
    { itemID = 156676, achievementID = 12413, categoryID = 201 }, -- Shal'dorei Mantle
    { itemID = 156677, achievementID = 12413, categoryID = 201 }, -- Shal'dorei Finery
    { itemID = 156678, achievementID = 12413, categoryID = 201 }, -- Shal'dorei Gloves
    { itemID = 156679, achievementID = 12413, categoryID = 201 }, -- Shal'dorei Belt
    { itemID = 156680, achievementID = 12413, categoryID = 201 }, -- Shal'dorei Leggings
    { itemID = 156681, achievementID = 12413, categoryID = 201 }, -- Shal'dorei Slippers
    { itemID = 156685, achievementID = 12413, categoryID = 201 }, -- Shal'dorei Bracers
    -- Heritage of the Lightforged (Lightforged Draenei)
    { itemID = 156699, achievementID = 12414, categoryID = 201 }, -- Lightforged Gorget
    { itemID = 156700, achievementID = 12414, categoryID = 201 }, -- Lightforged Pauldrons
    { itemID = 156701, achievementID = 12414, categoryID = 201 }, -- Lightforged Chestguard
    { itemID = 156702, achievementID = 12414, categoryID = 201 }, -- Lightforged Gloves
    { itemID = 156703, achievementID = 12414, categoryID = 201 }, -- Lightforged Girdle
    { itemID = 156704, achievementID = 12414, categoryID = 201 }, -- Lightforged Legplates
    { itemID = 156705, achievementID = 12414, categoryID = 201 }, -- Lightforged Hoofguards
    { itemID = 156706, achievementID = 12414, categoryID = 201 }, -- Lightforged Bracers
    -- Heritage of Highmountain (Highmountain Tauren)
    { itemID = 156668, achievementID = 12415, categoryID = 201 }, -- Highmountain Headdress
    { itemID = 156669, achievementID = 12415, categoryID = 201 }, -- Highmountain Shoulderguards
    { itemID = 156670, achievementID = 12415, categoryID = 201 }, -- Highmountain Harness
    { itemID = 156671, achievementID = 12415, categoryID = 201 }, -- Highmountain Gloves
    { itemID = 156672, achievementID = 12415, categoryID = 201 }, -- Highmountain Girdle
    { itemID = 156673, achievementID = 12415, categoryID = 201 }, -- Highmountain Leggings
    { itemID = 156674, achievementID = 12415, categoryID = 201 }, -- Highmountain Boots
    { itemID = 156684, achievementID = 12415, categoryID = 201 }, -- Highmountain Bracers
    -- Heritage of the Dark Iron (Dark Iron Dwarf)
    { itemID = 161008, achievementID = 13076, categoryID = 201 }, -- Dark Iron Helm
    { itemID = 161009, achievementID = 13076, categoryID = 201 }, -- Dark Iron Pauldrons
    { itemID = 161010, achievementID = 13076, categoryID = 201 }, -- Dark Iron Mantle
    { itemID = 161011, achievementID = 13076, categoryID = 201 }, -- Dark Iron Gloves
    { itemID = 161012, achievementID = 13076, categoryID = 201 }, -- Dark Iron Belt
    { itemID = 161013, achievementID = 13076, categoryID = 201 }, -- Dark Iron Leggings
    { itemID = 161014, achievementID = 13076, categoryID = 201 }, -- Dark Iron Boots
    { itemID = 161015, achievementID = 13076, categoryID = 201 }, -- Dark Iron Bracers
    -- Heritage of the Mag'har (Mag'har Orc) - Warsong Clan
    { itemID = 160992, achievementID = 13077, categoryID = 201 }, -- Warsong Clan Helm
    { itemID = 160993, achievementID = 13077, categoryID = 201 }, -- Warsong Clan Pauldrons
    { itemID = 160994, achievementID = 13077, categoryID = 201 }, -- Warsong Clan Harness
    { itemID = 160999, achievementID = 13077, categoryID = 201 }, -- Warsong Clan Gloves
    { itemID = 161000, achievementID = 13077, categoryID = 201 }, -- Warsong Clan Belt
    { itemID = 161001, achievementID = 13077, categoryID = 201 }, -- Warsong Clan Leggings
    { itemID = 161002, achievementID = 13077, categoryID = 201 }, -- Warsong Clan Boots
    { itemID = 161003, achievementID = 13077, categoryID = 201 }, -- Warsong Clan Bracers
    -- Heritage of the Mag'har (Mag'har Orc) - Blackrock Clan
    { itemID = 161050, achievementID = 13077, categoryID = 201 }, -- Blackrock Clan Helm
    { itemID = 161051, achievementID = 13077, categoryID = 201 }, -- Blackrock Clan Pauldrons
    { itemID = 161052, achievementID = 13077, categoryID = 201 }, -- Blackrock Clan Harness
    { itemID = 161054, achievementID = 13077, categoryID = 201 }, -- Blackrock Clan Gloves
    { itemID = 161055, achievementID = 13077, categoryID = 201 }, -- Blackrock Clan Belt
    { itemID = 161056, achievementID = 13077, categoryID = 201 }, -- Blackrock Clan Leggings
    { itemID = 161057, achievementID = 13077, categoryID = 201 }, -- Blackrock Clan Boots
    { itemID = 161058, achievementID = 13077, categoryID = 201 }, -- Blackrock Clan Bracers
    -- Heritage of the Mag'har (Mag'har Orc) - Frostwolf Clan
    { itemID = 161059, achievementID = 13077, categoryID = 201 }, -- Frostwolf Clan Helm
    { itemID = 161060, achievementID = 13077, categoryID = 201 }, -- Frostwolf Clan Pauldrons
    { itemID = 161061, achievementID = 13077, categoryID = 201 }, -- Frostwolf Clan Harness
    { itemID = 161062, achievementID = 13077, categoryID = 201 }, -- Frostwolf Clan Gloves
    { itemID = 161063, achievementID = 13077, categoryID = 201 }, -- Frostwolf Clan Belt
    { itemID = 161064, achievementID = 13077, categoryID = 201 }, -- Frostwolf Clan Leggings
    { itemID = 161065, achievementID = 13077, categoryID = 201 }, -- Frostwolf Clan Boots
    { itemID = 161066, achievementID = 13077, categoryID = 201 }, -- Frostwolf Clan Bracers
    -- Heritage of the Zandalari (Zandalari Troll)
    { itemID = 164993, achievementID = 13503, categoryID = 201 }, -- Zandalari Mask
    { itemID = 164994, achievementID = 13503, categoryID = 201 }, -- Zandalari Pauldrons
    { itemID = 164995, achievementID = 13503, categoryID = 201 }, -- Zandalari Torque
    { itemID = 164996, achievementID = 13503, categoryID = 201 }, -- Zandalari Blade-Turners
    { itemID = 164997, achievementID = 13503, categoryID = 201 }, -- Zandalari Belt
    { itemID = 164998, achievementID = 13503, categoryID = 201 }, -- Zandalari Leggings
    { itemID = 164999, achievementID = 13503, categoryID = 201 }, -- Zandalari Shinguards
    { itemID = 165000, achievementID = 13503, categoryID = 201 }, -- Zandalari Bracers
    -- Heritage of the Kul Tirans (Kul Tiran)
    { itemID = 165002, achievementID = 13504, categoryID = 201 }, -- Kul Tiran Bicorne
    { itemID = 165003, achievementID = 13504, categoryID = 201 }, -- Kul Tiran Tasseled Pauldron
    { itemID = 165004, achievementID = 13504, categoryID = 201 }, -- Kul Tiran Longcoat
    { itemID = 165005, achievementID = 13504, categoryID = 201 }, -- Kul Tiran Gloves
    { itemID = 165006, achievementID = 13504, categoryID = 201 }, -- Kul Tiran Cinch
    { itemID = 165007, achievementID = 13504, categoryID = 201 }, -- Kul Tiran Britches
    { itemID = 165008, achievementID = 13504, categoryID = 201 }, -- Kul Tiran Boots
    { itemID = 165009, achievementID = 13504, categoryID = 201 }, -- Kul Tiran Bracers
    -- Heritage of the Vulpera
    { itemID = 173966, achievementID = 14002, categoryID = 201 }, -- Vulpera Heritage Vest
    { itemID = 173967, achievementID = 14002, categoryID = 201 }, -- Vulpera Heritage Handgrips
    { itemID = 173968, achievementID = 14002, categoryID = 201 }, -- Vulpera Heritage Shawl
    { itemID = 173969, achievementID = 14002, categoryID = 201 }, -- Vulpera Heritage Legguards
    { itemID = 173970, achievementID = 14002, categoryID = 201 }, -- Vulpera Heritage Utility Belt
    { itemID = 173971, achievementID = 14002, categoryID = 201 }, -- Vulpera Heritage Shoulderpads
    { itemID = 174354, achievementID = 14002, categoryID = 201 }, -- Vulpera Heritage Footwraps
    { itemID = 174355, achievementID = 14002, categoryID = 201 }, -- Vulpera Heritage Wristwraps
    { itemID = 174376, achievementID = 14002, categoryID = 201 }, -- Vulpera Heritage Rucksack
    -- Heritage of the Mechagnome - base
    { itemID = 173958, achievementID = 14014, categoryID = 201 }, -- Mechagnome Heritage Chestpiece
    { itemID = 173961, achievementID = 14014, categoryID = 201 }, -- Mechagnome Heritage Helmet
    { itemID = 173962, achievementID = 14014, categoryID = 201 }, -- Mechagnome Heritage Girdle
    { itemID = 173963, achievementID = 14014, categoryID = 201 }, -- Mechagnome Heritage Shoulderguards
    { itemID = 173964, achievementID = 14014, categoryID = 201 }, -- Mechagnome Heritage Buckle
    { itemID = 173972, achievementID = 14014, categoryID = 201 }, -- Mechagnome Heritage Cloak
    -- Heritage of the Mechagnome - X-52 variant
    { itemID = 173974, achievementID = 14014, categoryID = 201 }, -- X-52 Bomber Jacket
    { itemID = 173975, achievementID = 14014, categoryID = 201 }, -- X-52 Fireproof Stompers
    { itemID = 173977, achievementID = 14014, categoryID = 201 }, -- X-52 Extreme Handgrips
    { itemID = 173978, achievementID = 14014, categoryID = 201 }, -- X-52 Precision Goggles
    { itemID = 173979, achievementID = 14014, categoryID = 201 }, -- X-52 Reinforced Legguards
    { itemID = 173980, achievementID = 14014, categoryID = 201 }, -- X-52 Sapper's Shoulderguards
    { itemID = 173981, achievementID = 14014, categoryID = 201 }, -- X-52 Utility Belt
    { itemID = 173982, achievementID = 14014, categoryID = 201 }, -- X-52 Minesweeper Wristwraps
    { itemID = 190110, achievementID = 15392, categoryID = 15436 }, -- Arsenal: Weapons of Glorious Domination
    { itemID = 190111, achievementID = 15392, categoryID = 15436 }, -- Arsenal: Weapons of Glorious Domination
    { itemID = 190112, achievementID = 15392, categoryID = 15436 }, -- Arsenal: Weapons of Glorious Domination
    { itemID = 190462, achievementID = 15392, categoryID = 15436 }, -- Arsenal: Weapons of Glorious Domination
    { itemID = 199669, achievementID = 15939, categoryID = 15462 }, -- Spiked Crimson Spaulders
    { itemID = 200882, achievementID = 16444, categoryID = 15466 }, -- Big Kinook's Spare Ladle
    { itemID = 203431, achievementID = 17334, categoryID = 92 }, -- Ensemble: Burden of Unrelenting Justice
    { itemID = 208150, achievementID = 18643, categoryID = 15465 }, -- Blue Tweed Cap
    { itemID = 208149, achievementID = 18645, categoryID = 15465 }, -- Brown Tweed Cap
    { itemID = 208490, achievementID = 18706, categoryID = 15467 }, -- Ensemble: Infinite Acolyte's Regalia
    { itemID = 208551, achievementID = 18804, categoryID = 15455 }, -- Ambrosial Sporestone
    { itemID = 209062, achievementID = 18901, categoryID = 15492 }, -- Ensemble: Chromatically Calibrated Holo-Gogs
    { itemID = 209064, achievementID = 18905, categoryID = 15492 }, -- Ensemble: Chromatically Calibrated Retinal Armor
    { itemID = 209066, achievementID = 18906, categoryID = 15492 }, -- Ensemble: Chromatically Calibrated Cranial Cannons
    { itemID = 209067, achievementID = 18907, categoryID = 15492 }, -- Ensemble: Chromatically Calibrated Ectoplasmic Specs
    { itemID = 209063, achievementID = 18908, categoryID = 15492 }, -- Ensemble: Chromatically Calibrated Bio-Optic Killshades
    { itemID = 210414, achievementID = 19317, categoryID = 15465 }, -- Forest Lord's Antlers
    { itemID = 219125, achievementID = 19515, categoryID = 169 }, -- Formed Artisan's Talent
    { itemID = 219132, achievementID = 20596, categoryID = 15506 }, -- Crimson Cartographer's Orientation
    { itemID = 219115, achievementID = 40138, categoryID = 15524 }, -- Versatile Peddler's Trinkets
    -- Heritage of the Earthen - Dornogal
    { itemID = 224861, achievementID = 40309, categoryID = 15506 }, -- Dornogal Crown
    { itemID = 224862, achievementID = 40309, categoryID = 15506 }, -- Dornogal Mantle
    { itemID = 224863, achievementID = 40309, categoryID = 15506 }, -- Dornogal Cheststraps
    { itemID = 224864, achievementID = 40309, categoryID = 15506 }, -- Dornogal Girdle
    { itemID = 224865, achievementID = 40309, categoryID = 15506 }, -- Dornogal Legcoat
    { itemID = 224866, achievementID = 40309, categoryID = 15506 }, -- Dornogal Sabatons
    { itemID = 224867, achievementID = 40309, categoryID = 15506 }, -- Dornogal Cuffs
    { itemID = 224868, achievementID = 40309, categoryID = 15506 }, -- Dornogal Gauntlets
    { itemID = 224869, achievementID = 40309, categoryID = 15506 }, -- Earthen Drape
    -- Heritage of the Earthen - Freywold
    { itemID = 224876, achievementID = 40309, categoryID = 15506 }, -- Freywold Crown
    { itemID = 224877, achievementID = 40309, categoryID = 15506 }, -- Freywold Mantle
    { itemID = 224878, achievementID = 40309, categoryID = 15506 }, -- Freywold Cheststraps
    { itemID = 224879, achievementID = 40309, categoryID = 15506 }, -- Freywold Girdle
    { itemID = 224880, achievementID = 40309, categoryID = 15506 }, -- Freywold Legcoat
    { itemID = 224881, achievementID = 40309, categoryID = 15506 }, -- Freywold Sabatons
    { itemID = 224882, achievementID = 40309, categoryID = 15506 }, -- Freywold Cuffs
    { itemID = 224883, achievementID = 40309, categoryID = 15506 }, -- Freywold Gauntlets
    -- Heritage of the Earthen - Gundargaz
    { itemID = 224884, achievementID = 40309, categoryID = 15506 }, -- Gundargaz Crown
    { itemID = 224885, achievementID = 40309, categoryID = 15506 }, -- Gundargaz Mantle
    { itemID = 224886, achievementID = 40309, categoryID = 15506 }, -- Gundargaz Cheststraps
    { itemID = 224887, achievementID = 40309, categoryID = 15506 }, -- Gundargaz Girdle
    { itemID = 224888, achievementID = 40309, categoryID = 15506 }, -- Gundargaz Legcoat
    { itemID = 224889, achievementID = 40309, categoryID = 15506 }, -- Gundargaz Sabatons
    { itemID = 224890, achievementID = 40309, categoryID = 15506 }, -- Gundargaz Cuffs
    { itemID = 224891, achievementID = 40309, categoryID = 15506 }, -- Gundargaz Gauntlets
    { itemID = 226160, achievementID = 40360, categoryID = 15506 }, -- Hillhelm Farmhand's Hoe
    { itemID = 226161, achievementID = 40360, categoryID = 15506 }, -- Hillhelm Farmhand's Watering Can
    { itemID = 219105, achievementID = 40618, categoryID = 15506 }, -- Sandy Quotidian Wear
    { itemID = 237358, achievementID = 40882, categoryID = 15522 }, -- Silver Coffer Key
    { itemID = 237355, achievementID = 40885, categoryID = 15522 }, -- Golden Coffer Key
    { itemID = 232646, achievementID = 41052, categoryID = 15506 }, -- Root Defender's Spear
    { itemID = 232647, achievementID = 41052, categoryID = 15506 }, -- Root Defender's Shield
    { itemID = 219110, achievementID = 41169, categoryID = 15530 }, -- Vermillion Patron's Elegance
    { itemID = 234521, achievementID = 41351, categoryID = 15530 }, -- Ensemble: Rusty Bruiser's Outfit
    { itemID = 263413, achievementID = 61797, categoryID = 15531 }, -- Nullaeus Domaneye (TODO: Move to Legacy at the end of Midnight S1)
    { itemID = 265071, achievementID = 61858, categoryID = 15259 }, -- Gleaming Sunmote (TODO: Move to Legacy at the end of Midnight S1)
    -- TODO List:
    -- Heritage of the Haranir (achievementID 61942, categoryID 15547) needs appearances to be itemized
    -- Stormheim achievement from Lemix (achievementID 42582, categoryID 15604) needs appearance itemization as well
}

SFC.Customizations = {
    { icon = "RaceIcon128-VoidElf-Male", achievementID = 12242, categoryID = 201 }, -- Race Unlocked: Void Elf
    { icon = "RaceIcon128-Lightforged-Male", achievementID = 12243, categoryID = 201 }, -- Race Unlocked: Lightforged Draenei
    { icon = "RaceIcon128-Nightborne-Male", achievementID = 12244, categoryID = 201 }, -- Race Unlocked: Nightborne
    { icon = "RaceIcon128-Highmountain-Male", achievementID = 12245, categoryID = 201 }, -- Race Unlocked: Highmountain Tauren
    { icon = "RaceIcon128-DarkIronDwarf-Male", achievementID = 12515, categoryID = 201 }, -- Race Unlocked: Dark Iron Dwarf
    { icon = "RaceIcon128-MagharOrc-Male", achievementID = 12518, categoryID = 201 }, -- Race Unlocked: Mag'har Orc
    { icon = "RaceIcon128-Zandalari-Male", achievementID = 13161, categoryID = 201 }, -- Race Unlocked: Zandalari Troll
    { icon = "RaceIcon128-KulTiran-Male", achievementID = 13163, categoryID = 201 }, -- Race Unlocked: Kul Tiran
    { icon = "RaceIcon128-Vulpera-Male", achievementID = 13206, categoryID = 201 }, -- Race Unlocked: Vulpera
    { icon = 7449410, achievementID = 13513, categoryID = 15248 }, -- Paint Color: Battletorn Blue
    { icon = "RaceIcon128-Mechagnome-Male", achievementID = 14013, categoryID = 201 }, -- Race Unlocked: Mechagnome
    { icon = 2450998, achievementID = 14763, categoryID = 15441 }, -- Plague Doctor's Mask
    { icon = 669448, achievementID = 15508, categoryID = 15436 }, -- Pet Costume: Lovely Regal Pocopoc
    { icon = 254288, achievementID = 15916, categoryID = 15462 }, -- Drake Customization: Renewed Proto-Drake - Red Hair
    { icon = 303622, achievementID = 15919, categoryID = 15462 }, -- Drake Customization: Windborne Velocidrake - Red Hair
    { icon = 254289, achievementID = 15925, categoryID = 15462 }, -- Drake Customization: Cliffside Wylderdrake - Blonde Hair
    { icon = 254288, achievementID = 15928, categoryID = 15462 }, -- Drake Customization: Renewed Proto-Drake - Gold and Red Armor
    { icon = 303622, achievementID = 15931, categoryID = 15462 }, -- Drake Customization: Windborne Velocidrake - Gold and Red Armor
    { icon = 254291, achievementID = 15934, categoryID = 15462 }, -- Drake Customization: Highland Drake - Gold and Red Armor
    { icon = 254289, achievementID = 15937, categoryID = 15462 }, -- Drake Customization: Cliffside Wylderdrake - Gold and Orange Armor
    { icon = 1711329, achievementID = 18854, categoryID = 15455 }, -- Customization: Man'ari Eredar Appearances for Draenei
    { icon = 254288, achievementID = 19478, categoryID = 15462 }, -- Drake Customization: Grotto Netherwing Drake - Black Scales
    { icon = "RaceIcon128-Earthen-Male", achievementID = 40307, categoryID = 15506 }, -- Race Unlocked: Earthen
    { icon = 6383560, achievementID = 41081, categoryID = 15462 }, -- D.R.I.V.E Engine: the Pozzik Standard
    { icon = 6124644, achievementID = 41555, categoryID = 15521 }, -- Warband Campsite: Freywold Spring
    { icon = 6124644, achievementID = 41586, categoryID = 15521 }, -- Warband Campsite: Gallagio Grand Gallery
    { icon = 236438, achievementID = 41803, categoryID = 15547 }, -- Customization: Amani Appearances for Darkspear Troll
    { icon = 6124644, achievementID = 41970, categoryID = 15506 }, -- Warband Campsite: The Fate of the Devoured
    { icon = 2915721, achievementID = 60933, categoryID = 15531, faction = FACTION_NAME.HORDE }, -- Delver's Dirigible Horde Vs Alliance Colors and Decals Unlocked
    { icon = 2915721, achievementID = 60934, categoryID = 15531, faction = FACTION_NAME.ALLIANCE }, -- Delver's Dirigible Horde Vs Alliance Colors and Decals Unlocked (Alliance)
    { icon = 7455385, achievementID = 61916, categoryID = 15547 }, -- Race/Class Unlocked: Void Elf Demon Hunter
    { icon = 463856, achievementID = 63629, categoryID = 171 }, -- Sinful Pearl
}

SFC.Toys = {
    { itemID = 43824, achievementID = 1956, categoryID = 14780 }, -- The Schools of Arcane Magic - Mastery
    { itemID = 44430, achievementID = 2096, categoryID = 171 }, -- Titanium Seal of Dalaran
    { itemID = 71259, achievementID = 5859, categoryID = 15070 }, -- Leyara's Locket (quest chain reward; achievement reward is item 69854 which starts the chain)
    { itemID = 86596, achievementID = 7274, categoryID = 171 }, -- Nat's Fishing Chair
    { itemID = 87528, achievementID = 7385, categoryID = 15302 }, -- Honorary Brewmaster Keg
    { itemID = 122129, achievementID = 9761, categoryID = 15101 }, -- Fire-Eater's Vial
    { itemID = 122293, achievementID = 9838, categoryID = 15246 }, -- Trans-Dimensional Bird Whistle
    { itemID = 122122, achievementID = 9885, categoryID = 15101 }, -- Darkmoon Tonk Controller
    { itemID = 122123, achievementID = 9894, categoryID = 15101 }, -- Darkmoon Ring-Flinger
    { itemID = 139773, achievementID = 10774, categoryID = 15252 }, -- Emerald Winds
    { itemID = 143660, achievementID = 11427, categoryID = 15252 }, -- Mrgrglhjorn
    { itemID = 134026, achievementID = 12894, categoryID = 15266 }, -- Honorable Pennant
    { itemID = 163697, achievementID = 12936, categoryID = 15119 }, -- Laser Pointer
    { itemID = 166247, achievementID = 13285, categoryID = 15117, faction = FACTION_NAME.ALLIANCE }, -- Citizens Bridage Whistle
    { itemID = 167698, achievementID = 13489, categoryID = 171 }, -- Secret Fish Goggles
    { itemID = 168016, achievementID = 13502, categoryID = 171 }, -- Hyper-Compressed Ocean
    { itemID = 174830, achievementID = 14020, categoryID = 15117 }, -- Shadowy Disguise
    { itemID = 174871, achievementID = 14021, categoryID = 15117 }, -- Mayhem Mind Melder
    { itemID = 184508, achievementID = 14625, categoryID = 15119 }, -- Mawsworn Pet Leash
    { itemID = 184449, achievementID = 14634, categoryID = 15436 }, -- Jiggles's Favorite Toy
    { itemID = 183903, achievementID = 14721, categoryID = 15436 }, -- Smelly Jelly
    { itemID = 182695, achievementID = 14766, categoryID = 15422 }, -- Weathered Purple Parasol
    { itemID = 187793, achievementID = 15211, categoryID = 15436 }, -- Personal Containment Trap
    { itemID = 187689, achievementID = 15221, categoryID = 15101 }, -- Dance Dance Darkmoon
    { itemID = 187860, achievementID = 15229, categoryID = 15436 }, -- Mortis Mover
    { itemID = 197986, achievementID = 15781, categoryID = 15247 }, -- Murglasses
    { itemID = 198428, achievementID = 15889, categoryID = 15455 }, -- Tuskarr Dinghy
    { itemID = 200630, achievementID = 16423, categoryID = 15465 }, -- Ohn'ir Windsage's Hearthstone
    { itemID = 200631, achievementID = 16762, categoryID = 15467 }, -- Happy Tuskarr Palooza
    { itemID = 202207, achievementID = 17207, categoryID = 171 }, -- Reusable Oversized Bobber
    { itemID = 197961, achievementID = 17782, categoryID = 15455 }, -- Whelps on Strings
    { itemID = 205904, achievementID = 18100, categoryID = 15465 }, -- Vibrant Clacking Claw
    { itemID = 208186, achievementID = 18554, categoryID = 15465 }, -- Boffins
    { itemID = 207099, achievementID = 18559, categoryID = 15455 }, -- Tiny Box of Tiny Rocks
    { itemID = 208421, achievementID = 18725, categoryID = 15493 }, -- Compendium of the New Moon
    { itemID = 208433, achievementID = 18790, categoryID = 15462 }, -- Bronze Racer's Pennant
    { itemID = 211946, achievementID = 20033, categoryID = 15246 }, -- Hearthstone Game Table
    { itemID = 224251, achievementID = 40314, categoryID = 15521 }, -- Memory Chord
    { itemID = 236769, achievementID = 41211, categoryID = 15526 }, -- Pipeline Rerouter
    { itemID = 235050, achievementID = 41588, categoryID = 15521 }, -- Desk-in-a-Box
    { itemID = 235016, achievementID = 42241, categoryID = 15531 }, -- Redeployment Module
    { itemID = 251491, achievementID = 61094, categoryID = 15119 }, -- Magical Pet Clicker
    { itemID = 268717, achievementID = 62125, categoryID = 15553 }, -- Pango Plating
    { itemID = 264695, achievementID = 62126, categoryID = 15553 }, -- Interdimensional Parcel Signal
    { itemID = 268695, achievementID = 62400, categoryID = 15268 }, -- Pin-o-Matic Camera
    { itemID = 275825, achievementID = 63167, categoryID = 15283 }, -- Ula'tek's Sssacrificial Rain
    { itemID = 280419, achievementID = 63662, categoryID = 15553 }, -- Cursed Badge of the Soulcoilers
}

SFC.Pets = {
    { spellID = 61773, achievementID = 3478, categoryID = 155 }, -- Plump Turkey (no known item ID)
    { itemID = 49912, achievementID = 4478, categoryID = 168 }, -- Perky Pug
    { itemID = 60869, achievementID = 5449, categoryID = 15070 }, -- Pebble
    { itemID = 65662, achievementID = 5860, categoryID = 15070 }, -- Gold Mini Jouster (random b/w this and Blue Mini Jouster which is item 65661; the one not obtained here is purchasable from a Stable Master)
    { itemID = 86562, achievementID = 6402, categoryID = 15106 }, -- Hopling
    { itemID = 85578, achievementID = 7500, categoryID = 15118 }, -- Feral Vermling
    { itemID = 89736, achievementID = 7501, categoryID = 15118 }, -- Venus
    { itemID = 93031, achievementID = 7934, categoryID = 15118 }, -- Mr. Bigglesworth
    { itemID = 97558, achievementID = 8293, categoryID = 15118 }, -- Tito
    { itemID = 120121, achievementID = 9069, categoryID = 15119 }, -- Trunks
    { itemID = 111866, achievementID = 9685, categoryID = 15118 }, -- Royal Peachick
    { itemID = 140761, achievementID = 9696, categoryID = 15119 }, -- Nightmare Treant
    { itemID = 122116, achievementID = 9824, categoryID = 15118 }, -- K'ute
    { itemID = 123862, achievementID = 9983, categoryID = 15101 }, -- Hogs
    { itemID = 140323, achievementID = 10412, categoryID = 15254 }, -- Lagan
    { itemID = 141352, achievementID = 11233, categoryID = 15118 }, -- Rescued Fawn
    { itemID = 142100, achievementID = 11320, categoryID = 15118 }, -- Stardust (Achievement rewards item 142210 which begins the quest that gives you this pet on turn-in)
    { itemID = 147543, achievementID = 11765, categoryID = 15117 }, -- Son of Skum
    { itemID = 151632, achievementID = 11856, categoryID = 15117 }, -- Mining Monkey
    { itemID = 152963, achievementID = 12079, categoryID = 15118 }, -- Amalgam of Destruction
    { itemID = 153040, achievementID = 12100, categoryID = 15119 }, -- Felclaw Marsuul
    { itemID = 156721, achievementID = 12431, categoryID = 15252 }, -- Mailemental
    { itemID = 161214, achievementID = 12723, categoryID = 15285 }, -- Miimii
    { itemID = 163244, achievementID = 12996, categoryID = 15247 }, -- Brutus
    { itemID = 163634, achievementID = 12930, categoryID = 15118 }, -- Dreadtick Leecher
    { itemID = 163776, achievementID = 13062, categoryID = 15284, faction = FACTION_NAME.ALLIANCE }, -- Bumbles
    { itemID = 165894, achievementID = 13269, categoryID = 15117 }, -- Mini Spider Tank
    { itemID = 165907, achievementID = 13279, categoryID = 15119 }, -- Wicker Wraith
    { itemID = 167057, achievementID = 13469, categoryID = 15118 }, -- Happiness
    { itemID = 169670, achievementID = 13627, categoryID = 15117 }, -- Evil Wizard Hat
    { itemID = 169349, achievementID = 13695, categoryID = 15117 }, -- Kelpfin
    { itemID = 170102, achievementID = 13766, categoryID = 15119 }, -- Burnout
    { itemID = 174463, achievementID = 14143, categoryID = 15426 }, -- Reek
    { itemID = 184509, achievementID = 14879, categoryID = 15119 }, -- Spriggan Trickster
    { itemID = 184512, achievementID = 14881, categoryID = 15119 }, -- Winterleaf Spriggan
    { itemID = 186539, achievementID = 15004, categoryID = 15118 }, -- Sly
    { itemID = 186551, achievementID = 15079, categoryID = 15440 }, -- Mord'al Eveningstar
    { itemID = 199688, achievementID = 15940, categoryID = 15462 }, -- Bronze Racing Enthusiast
    { itemID = 200874, achievementID = 16512, categoryID = 15119 }, -- Lady Feathersworth
    { itemID = 204894, achievementID = 17736, categoryID = 170 }, -- Roland
    { itemID = 205231, achievementID = 17741, categoryID = 15465 }, -- Roggy
    { itemID = 193377, achievementID = 17934, categoryID = 15119 }, -- Gerald
    { itemID = 205165, achievementID = 18384, categoryID = 15118 }, -- Axel
    { itemID = 208543, achievementID = 18702, categoryID = 15274 }, -- Lil' Frostwing (opened from the achievement reward Anniversary gift, which is item 208211; no longer obtainable)
    { itemID = 210556, achievementID = 19089, categoryID = 15468 }, -- Ivy
    { itemID = 210347, achievementID = 19193, categoryID = 15468 }, -- Sergeant Quackers
    { itemID = 210522, achievementID = 19293, categoryID = 15455 }, -- Blueloo
    { itemID = 213133, achievementID = 19792, categoryID = 15455 }, -- Reese
    { itemID = 213134, achievementID = 19793, categoryID = 15455 }, -- Hap'he
    { itemID = 223802, achievementID = 40088, categoryID = 15283 }, -- Ruby-Eyed Stagshell
    { itemID = 221821, achievementID = 40194, categoryID = 15118 }, -- Waxwick
    { itemID = 225934, achievementID = 40869, categoryID = 15521 }, -- Lil' Bonechewer
    { itemID = 222970, achievementID = 40980, categoryID = 15119 }, -- Fuzzy
    { itemID = 205013, achievementID = 41092, categoryID = 15118 }, -- Lettuce
    { itemID = 232855, achievementID = 41551, categoryID = 15119 }, -- Foreman
    { itemID = 174463, achievementID = 41928, categoryID = 15546 }, -- Reek
    { itemID = 245255, achievementID = 41979, categoryID = 15506 }, -- Starlight
    { itemID = 222967, achievementID = 60956, categoryID = 15119 }, -- Webbers
    { itemID = 205017, achievementID = 61040, categoryID = 15119 }, -- Byrn
    { itemID = 258737, achievementID = 61051, categoryID = 15119 }, -- Moon Darter
    { itemID = 258189, achievementID = 61091, categoryID = 15118 }, -- Do, Child of Filo
    { itemID = 221492, achievementID = 61565, categoryID = 168 }, -- Moss Skipper
    { itemID = 240840, achievementID = 61567, categoryID = 168 }, -- Niblet
    { itemID = 269028, achievementID = 61960, categoryID = 15553 }, -- Sootpaw
    { itemID = 270191, achievementID = 62460, categoryID = 15119 }, -- Lil'Kruul
    { itemID = 270211, achievementID = 62461, categoryID = 15119 }, -- Furiostraza
    { itemID = 280138, achievementID = 62492, categoryID = 15118 }, -- Zesty
    { itemID = 279387, achievementID = 63609, categoryID = 15566 }, -- Ula'took
    { itemID = 279921, achievementID = 63633, categoryID = 15547 }, -- Ki'clak
}

SFC.Decor = {
    { itemID = 247757, achievementID = 158, categoryID = 14802 }, -- Alliance Battlefield Banner
    { itemID = 247747, achievementID = 167, categoryID = 14804 }, -- Warsong Outriders Flag
    { itemID = 247746, achievementID = 200, categoryID = 14804 }, -- Silverwing Sentinels Flag
    { itemID = 247761, achievementID = 212, categoryID = 14803 }, -- Uncontested Battlefield Banner
    { itemID = 247762, achievementID = 213, categoryID = 14803 }, -- Netherstorm Battlefield Flag
    { itemID = 247758, achievementID = 221, categoryID = 14801 }, -- Fortified Alliance Banner
    { itemID = 247760, achievementID = 222, categoryID = 14801 }, -- Fortified Horde Banner
    { itemID = 247745, achievementID = 229, categoryID = 95 }, -- Horde Dueling Flag
    { itemID = 247744, achievementID = 231, categoryID = 95 }, -- Alliance Dueling Flag
    { itemID = 248807, achievementID = 938, categoryID = 14863 }, -- Nesingwary Mounted Shoveltusk Head
    { itemID = 248808, achievementID = 940, categoryID = 14861 }, -- Nesingwary Mounted Elk Head
    { itemID = 247759, achievementID = 1153, categoryID = 14802 }, -- Horde Battlefield Banner
    { itemID = 247756, achievementID = 1157, categoryID = 95 }, -- Challenger's Dueling Flag
    { itemID = 244852, achievementID = 4405, categoryID = 14922 }, -- Head of the Broodmother
    { itemID = 245426, achievementID = 4859, categoryID = 15071 }, -- Dark Iron Brazier
    { itemID = 247727, achievementID = 5223, categoryID = 15074 }, -- Iron Dragonmaw Gate
    { itemID = 256896, achievementID = 5245, categoryID = 15073 }, -- Smoke Lamppost
    { itemID = 248796, achievementID = 5442, categoryID = 14861 }, -- Goldshire Food Cart
    { itemID = 247740, achievementID = 6981, categoryID = 15163 }, -- Kotmogu Pedestal
    { itemID = 247741, achievementID = 6981, categoryID = 15163 }, -- Kotmogu Orb of Power
    { itemID = 256425, achievementID = 8316, categoryID = 15302 }, -- Shadowforge Stone Chair
    { itemID = 258740, achievementID = 9415, categoryID = 15071 }, -- Glorious Pendant of Rukhmar
    { itemID = 245697, achievementID = 10698, categoryID = 15252 }, -- Shala'nir Feather Bed
    { itemID = 256913, achievementID = 10996, categoryID = 15254 }, -- Tauren Jeweler's Roller
    { itemID = 245448, achievementID = 11124, categoryID = 15252 }, -- "Night on the Jeweled Estate" Painting
    { itemID = 245460, achievementID = 11257, categoryID = 15257 }, -- Skyhorn Storage Chest
    { itemID = 245703, achievementID = 11258, categoryID = 15257 }, -- Kaldorei Treasure Trove
    { itemID = 258223, achievementID = 11699, categoryID = 15255 }, -- Murloc's Wind Chimes
    { itemID = 245522, achievementID = 12479, categoryID = 15284, faction = FACTION_NAME.HORDE }, -- Grand Mask of Bwonsamdi, Loa of Graves
    { itemID = 241062, achievementID = 12509, categoryID = 15284, faction = FACTION_NAME.HORDE }, -- Lordaeron Rectangular Rug
    { itemID = 245497, achievementID = 12614, categoryID = 15284, faction = FACTION_NAME.HORDE }, -- Golden Loa's Altar
    { itemID = 245490, achievementID = 12733, categoryID = 169, faction = FACTION_NAME.HORDE }, -- Dazar'alor Forge
    { itemID = 244325, achievementID = 12746, categoryID = 170, faction = FACTION_NAME.HORDE }, -- Zuldazar Cook's Griddle
    { itemID = 245463, achievementID = 12867, categoryID = 15308, faction = FACTION_NAME.HORDE }, -- Lordaeron Banded Barrel
    { itemID = 245467, achievementID = 12869, categoryID = 15308, faction = FACTION_NAME.HORDE }, -- Lordaeron Banded Crate
    { itemID = 245483, achievementID = 12870, categoryID = 15308, faction = FACTION_NAME.HORDE }, -- Lordaeron Spiked Weapon Rack
    { itemID = 244326, achievementID = 13018, categoryID = 15298 }, -- Zandalari Wall Shelf
    { itemID = 245487, achievementID = 13038, categoryID = 15284, faction = FACTION_NAME.HORDE }, -- Bookcase of Gonk
    { itemID = 245494, achievementID = 13039, categoryID = 15284, faction = FACTION_NAME.HORDE }, -- Idol of Pa'ku, Master of Winds
    { itemID = 245476, achievementID = 13284, categoryID = 15284, faction = FACTION_NAME.HORDE }, -- Large Forsaken War Tent
    { itemID = 246483, achievementID = 13473, categoryID = 15298 }, -- Redundant Reclamation Rig
    { itemID = 246603, achievementID = 13475, categoryID = 15298 }, -- Gnomish Cog Stack
    { itemID = 246479, achievementID = 13723, categoryID = 15285 }, -- Gnomish T.O.O.L.B.O.X.
    { itemID = 248656, achievementID = 17529, categoryID = 15465 }, -- Dragon's Hoard Chest
    { itemID = 248104, achievementID = 17773, categoryID = 15455 }, -- Pentagonal Stone Table
    { itemID = 248124, achievementID = 19458, categoryID = 15301 }, -- The Great Hoard
    { itemID = 248105, achievementID = 19507, categoryID = 15455 }, -- Valdrakken Sconce
    { itemID = 245520, achievementID = 19719, categoryID = 15455 }, -- Gilnean Celebration Keg
    { itemID = 248125, achievementID = 20501, categoryID = 15301 }, -- Portal to Damnation
    { itemID = 252757, achievementID = 20595, categoryID = 15506 }, -- Boulder Springs Recliner
    { itemID = 253170, achievementID = 40210, categoryID = 15525 }, -- Earthen Contender's Target
    { itemID = 253023, achievementID = 40504, categoryID = 15521 }, -- Rambleshire Resting Platform
    { itemID = 246866, achievementID = 40542, categoryID = 15521 }, -- Kaheti Scribe's Records
    { itemID = 253037, achievementID = 40859, categoryID = 15521 }, -- Dornogal Brazier
    { itemID = 245324, achievementID = 40894, categoryID = 15506 }, -- Rocket-Powered Fountain
    { itemID = 247667, achievementID = 40953, categoryID = 15301 }, -- MOTHER's Titanic Brazier
    { itemID = 247668, achievementID = 40953, categoryID = 15301 }, -- N'Zoth's Captured Eye
    { itemID = 245302, achievementID = 41119, categoryID = 15526 }, -- Gallagio L.U.C.K. Spinner
    { itemID = 246867, achievementID = 41186, categoryID = 15521 }, -- Tome of Earthen Directives
    { itemID = 257354, achievementID = 42187, categoryID = 15552 }, -- Scroll of K'aresh's Fall
    { itemID = 257355, achievementID = 42188, categoryID = 15552 }, -- Tome of the Survivor
    { itemID = 257351, achievementID = 42189, categoryID = 15552 }, -- Tale of the Penultimate Lich King
    { itemID = 250115, achievementID = 42270, categoryID = 15304 }, -- Ebon Blade Weapon Rack
    { itemID = 249459, achievementID = 42271, categoryID = 15304 }, -- Illidari Glaiverest
    { itemID = 260581, achievementID = 42272, categoryID = 15304 }, -- Brazier of Elune
    { itemID = 248011, achievementID = 42273, categoryID = 15304 }, -- Trueshot Skeletal Dragon Head
    { itemID = 245429, achievementID = 42274, categoryID = 15304 }, -- Tirisgarde Book Tempest
    { itemID = 248958, achievementID = 42275, categoryID = 15304 }, -- Monastery Gong
    { itemID = 250234, achievementID = 42276, categoryID = 15304 }, -- Sanctum of Light Candelabra
    { itemID = 250792, achievementID = 42277, categoryID = 15304 }, -- Scroll of the Conclave
    { itemID = 260776, achievementID = 42279, categoryID = 15304 }, -- Uncrowned Market Stall
    { itemID = 257403, achievementID = 42280, categoryID = 15304 }, -- Maelstrom Lava Lamp
    { itemID = 248960, achievementID = 42281, categoryID = 15304 }, -- Dreadscar Dais
    { itemID = 249466, achievementID = 42282, categoryID = 15304 }, -- Valarjar Shield Wall
    { itemID = 250123, achievementID = 42287, categoryID = 15304 }, -- Replica Acherus Soul Forge
    { itemID = 249457, achievementID = 42288, categoryID = 15304 }, -- Replica Cursed Forge of the Nathrezim
    { itemID = 250134, achievementID = 42289, categoryID = 15304 }, -- Seed of Ages Cutting
    { itemID = 250125, achievementID = 42290, categoryID = 15304 }, -- Replica Altar of the Eternal Hunt
    { itemID = 250306, achievementID = 42291, categoryID = 15304 }, -- Conjured Altar of the Guardian
    { itemID = 262619, achievementID = 42292, categoryID = 15304 }, -- Replica Forge of the Roaring Mountain
    { itemID = 250230, achievementID = 42293, categoryID = 15304 }, -- Replica Altar of Ancient Kings
    { itemID = 250790, achievementID = 42294, categoryID = 15304 }, -- Replica Altar of Light and Shadow
    { itemID = 250787, achievementID = 42295, categoryID = 15304 }, -- Replica Crucible of the Uncrowned
    { itemID = 250914, achievementID = 42296, categoryID = 15304 }, -- Elemental Altar of the Maelstrom
    { itemID = 248940, achievementID = 42297, categoryID = 15304 }, -- Replica Felblood Altar
    { itemID = 249458, achievementID = 42298, categoryID = 15304 }, -- Replica Forge of Odyn
    { itemID = 264006, achievementID = 42786, categoryID = 169 }, -- Midnight Leatherworker's Shop Sign
    { itemID = 264000, achievementID = 42787, categoryID = 169 }, -- Midnight Enchanter's Shop Sign
    { itemID = 263997, achievementID = 42788, categoryID = 169 }, -- Midnight Alchemist's Shop Sign
    { itemID = 264005, achievementID = 42789, categoryID = 169 }, -- Midnight Jewelcrafter's Shop Sign
    { itemID = 264173, achievementID = 42790, categoryID = 169 }, -- Midnight Skinner's Shop Sign
    { itemID = 264172, achievementID = 42791, categoryID = 169 }, -- Midnight Miner's Shop Sign
    { itemID = 263998, achievementID = 42792, categoryID = 169 }, -- Midnight Blacksmith's Shop Sign
    { itemID = 264003, achievementID = 42793, categoryID = 169 }, -- Midnight Herbalist's Shop Sign
    { itemID = 264174, achievementID = 42794, categoryID = 169 }, -- Midnight Tailor's Shop Sign
    { itemID = 263999, achievementID = 42795, categoryID = 169 }, -- Midnight Cook's Shop Sign
    { itemID = 264004, achievementID = 42796, categoryID = 169 }, -- Midnight Scribe's Shop Sign
    { itemID = 264002, achievementID = 42797, categoryID = 169 }, -- Midnight Fisher's Shop Sign
    { itemID = 264001, achievementID = 42798, categoryID = 169 }, -- Midnight Engineer's Shop Sign
    { itemID = 260584, achievementID = 60962, categoryID = 15304 }, -- Replica Libram of the Dead
    { itemID = 249690, achievementID = 60963, categoryID = 15304 }, -- Replica Tome of Fel Secrets
    { itemID = 250111, achievementID = 60964, categoryID = 15304 }, -- Replica Tome of the Ancients
    { itemID = 250127, achievementID = 60965, categoryID = 15304 }, -- Replica Tales of the Hunt
    { itemID = 256674, achievementID = 60966, categoryID = 15304 }, -- Conjured Archive of the Tirisgarde
    { itemID = 256679, achievementID = 60967, categoryID = 15304 }, -- Replica Chronicle of Ages
    { itemID = 250233, achievementID = 60968, categoryID = 15304 }, -- Replica Libram of Ancient Kings
    { itemID = 250791, achievementID = 60969, categoryID = 15304 }, -- Replica Word of the Conclave
    { itemID = 250788, achievementID = 60970, categoryID = 15304 }, -- Stolen Copy of the Blood Ledger
    { itemID = 250915, achievementID = 60971, categoryID = 15304 }, -- Replica Words of Wind and Earth
    { itemID = 256907, achievementID = 60972, categoryID = 15304 }, -- Replica Tome of Blighted Implements
    { itemID = 257396, achievementID = 60973, categoryID = 15304 }, -- Replica Saga of the Valarjar
    { itemID = 250112, achievementID = 60981, categoryID = 15304 }, -- Ebon Blade Planning Map
    { itemID = 249518, achievementID = 60982, categoryID = 15304 }, -- Fel Hammer Scouting Map
    { itemID = 251013, achievementID = 60983, categoryID = 15304 }, -- Cenarion Arch
    { itemID = 250126, achievementID = 60984, categoryID = 15304 }, -- Unseen Path Archer's Gallery
    { itemID = 250131, achievementID = 60985, categoryID = 15304 }, -- Tirisgarde War Map
    { itemID = 248942, achievementID = 60986, categoryID = 15304 }, -- Five Dawns Planning Table
    { itemID = 250236, achievementID = 60987, categoryID = 15304 }, -- Silver Hand Weapon Rack
    { itemID = 251636, achievementID = 60988, categoryID = 15304 }, -- Netherlight Command Map
    { itemID = 250786, achievementID = 60989, categoryID = 15304 }, -- Uncrowned Planning Table
    { itemID = 251014, achievementID = 60990, categoryID = 15304 }, -- Earthen Ring Scouting Map
    { itemID = 264242, achievementID = 60991, categoryID = 15304 }, -- Dreadscar Battle Planning Map
    { itemID = 249461, achievementID = 60992, categoryID = 15304 }, -- Skyhold War Table
    { itemID = 264266, achievementID = 61264, categoryID = 15553 }, -- Lightbloom Moss Mound
    { itemID = 271971, achievementID = 61442, categoryID = 15552 }, -- Tome of Kings
    { itemID = 257353, achievementID = 61451, categoryID = 15301 }, -- Drained Dark Heart of Galakrond
    { itemID = 245332, achievementID = 61467, categoryID = 15552 }, -- Tome of Silvermoon Intrigue
    { itemID = 257367, achievementID = 61507, categoryID = 15553 }, -- Silvermoon Energy Focus
    { itemID = 264259, achievementID = 61574, categoryID = 15547 }, -- "On'ohia's Call"
    { itemID = 247763, achievementID = 61683, categoryID = 95 }, -- Berserker's Empowerment
    { itemID = 264335, achievementID = 62122, categoryID = 15553 }, -- Colossal Amani Stone Visage
    { itemID = 264493, achievementID = 62130, categoryID = 15553 }, -- Opened Domanaar Storage Crate
    { itemID = 265696, achievementID = 62144, categoryID = 15605 }, -- Preyseeker's Magister Bust
    { itemID = 265697, achievementID = 62153, categoryID = 15605 }, -- Preyseeker's Tinker Bust
    { itemID = 265798, achievementID = 62154, categoryID = 15605 }, -- Preyseeker's Ren'dorei Bust
    { itemID = 265698, achievementID = 62155, categoryID = 15605 }, -- Preyseeker's Ethereal Bust
    { itemID = 265699, achievementID = 62156, categoryID = 15605 }, -- Preyseeker's Breaker Bust
    { itemID = 265700, achievementID = 62157, categoryID = 15605 }, -- Preyseeker's Amani Bust
    { itemID = 265799, achievementID = 62158, categoryID = 15605 }, -- Preyseeker's Farstrider Bust
    { itemID = 265701, achievementID = 62159, categoryID = 15605 }, -- Preyseeker's Rutaani Bust
    { itemID = 265702, achievementID = 62160, categoryID = 15605 }, -- Preyseeker's Vindicator Bust
    { itemID = 265703, achievementID = 62161, categoryID = 15605 }, -- Preyseeker's Consul Bust
    { itemID = 265704, achievementID = 62162, categoryID = 15605 }, -- Preyseeker's Executor Bust
    { itemID = 265705, achievementID = 62163, categoryID = 15605 }, -- Preyseeker's Knight-Errant Bust
    { itemID = 265706, achievementID = 62164, categoryID = 15605 }, -- Preyseeker's Wretched Bust
    { itemID = 265707, achievementID = 62165, categoryID = 15605 }, -- Preyseeker's Thornspeaker Bust
    { itemID = 265708, achievementID = 62166, categoryID = 15605 }, -- Preyseeker's Twilight Bust
    { itemID = 265681, achievementID = 62167, categoryID = 15605 }, -- Preyseeker's Magister Effigy
    { itemID = 265682, achievementID = 62168, categoryID = 15605 }, -- Preyseeker's Tinker Effigy
    { itemID = 265796, achievementID = 62169, categoryID = 15605 }, -- Preyseeker's Ren'dorei Effigy
    { itemID = 265683, achievementID = 62173, categoryID = 15605 }, -- Preyseeker's Ethereal Effigy
    { itemID = 265684, achievementID = 62174, categoryID = 15605 }, -- Preyseeker's Breaker Effigy
    { itemID = 265685, achievementID = 62175, categoryID = 15605 }, -- Preyseeker's Amani Effigy
    { itemID = 265797, achievementID = 62176, categoryID = 15605 }, -- Preyseeker's Farstrider Effigy
    { itemID = 265686, achievementID = 62177, categoryID = 15605 }, -- Preyseeker's Rutaani Effigy
    { itemID = 265687, achievementID = 62178, categoryID = 15605 }, -- Preyseeker's Vindicator Effigy
    { itemID = 265688, achievementID = 62179, categoryID = 15605 }, -- Preyseeker's Consul Effigy
    { itemID = 265689, achievementID = 62180, categoryID = 15605 }, -- Preyseeker's Executor Effigy
    { itemID = 265690, achievementID = 62181, categoryID = 15605 }, -- Preyseeker's Knight-Errant Effigy
    { itemID = 265691, achievementID = 62182, categoryID = 15605 }, -- Preyseeker's Wretched Effigy
    { itemID = 265692, achievementID = 62183, categoryID = 15605 }, -- Preyseeker's Thornspeaker Effigy
    { itemID = 265694, achievementID = 62184, categoryID = 15605 }, -- Preyseeker's Twilight Effigy
    { itemID = 244656, achievementID = 62185, categoryID = 15553 }, -- Silvermoon Painter's Cushion
    { itemID = 251909, achievementID = 62186, categoryID = 15553 }, -- Eversong Feast Platter
    { itemID = 254773, achievementID = 62288, categoryID = 15553 }, -- "Eversong Lantern" Painting
    { itemID = 256925, achievementID = 62289, categoryID = 15553 }, -- Amani Spearhunter's Spit
    { itemID = 265792, achievementID = 62290, categoryID = 15553 }, -- Fungarian Vine Fence
    { itemID = 264656, achievementID = 62291, categoryID = 15553 }, -- Void Elf Weapon Rack
    { itemID = 260785, achievementID = 62387, categoryID = 15274 }, -- Miniature Replica Dark Portal
    { itemID = 276083, achievementID = 63325, categoryID = 15610 }, -- Sunstrider Omnium Simulacrum
    { itemID = 274731, achievementID = 63343, categoryID = 15268 }, -- Prized Orb of Azeroth
    { itemID = 274734, achievementID = 63343, categoryID = 15268 }, -- Framed Horde Pride
    { itemID = 274736, achievementID = 63343, categoryID = 15268 }, -- Framed Alliance Pride
    { itemID = 263873, achievementID = 63358, categoryID = 15553 }, -- Amani Forge
    { itemID = 248962, achievementID = 63432, categoryID = 15553 }, -- Mysterious Voodoo Mask
    { itemID = 278369, achievementID = 63451, categoryID = 15605 }, -- Preyhunter's Scaled Effigy
    { itemID = 278372, achievementID = 63452, categoryID = 15605 }, -- Preyhunter's Fanged Effigy
    { itemID = 278380, achievementID = 63453, categoryID = 15605 }, -- Preyhunter's Terror Bust
}

SFC.Legacy = {
    { itemID = 226357, achievementID = 20525, categoryID = 15272 }, -- Diamond Mechsuit
    { itemID = 220766, achievementID = 20593, categoryID = 15536 }, -- August Phoenix
    { itemID = 232624, achievementID = 41056, categoryID = 15274 }, -- Timely Buzzbee
    { itemID = 235549, achievementID = 41533, categoryID = 15272 }, -- Crimson Shreddertank
    { itemID = 238739, achievementID = 41779, categoryID = 15274 }, -- Chrono Corsair
    { titleID = 453, achievementID = 42170, categoryID = 15572 }, -- the Unbound
    { itemID = 246237, achievementID = 42212, categoryID = 15531 }, -- OC91 Chariot
    { titleID = 551, achievementID = 42301, categoryID = 15604 }, -- Timerunner
    { itemID = 250307, achievementID = 42318, categoryID = 15604 }, -- Tome of the Corrupt
    { spellID = 1254381, achievementID = 42319, categoryID = 15604 }, -- Fledgling Warden's Companion
    { itemID = 250406, achievementID = 42321, categoryID = 15604 }, -- Corruption Pit
    { itemID = 253028, achievementID = 42504, categoryID = 15604 }, -- Felscorned Highlord's Charger
    { itemID = 246339, achievementID = 42541, categoryID = 15604 }, -- Duskytooth Fel Snooter
    { itemID = 258299, achievementID = 42547, categoryID = 15604 }, -- Hanging Felsteel Cage
    { itemID = 253219, achievementID = 42549, categoryID = 15604 }, -- Bulwark of Mannoroth (Shield)
    { itemID = 253220, achievementID = 42549, categoryID = 15604 }, -- Bulwark of Mannoroth (Back)
    { itemID = 253201, achievementID = 42583, categoryID = 15604 }, -- Felscorned Scythe of the Unmaker
    { itemID = 253344, achievementID = 42605, categoryID = 15604 }, -- Kaldorei Queen's Sarong
    { itemID = 253345, achievementID = 42605, categoryID = 15604 }, -- Kaldorei Queen's Crown
    { itemID = 253346, achievementID = 42605, categoryID = 15604 }, -- Kaldorei Queen's Robe
    { itemID = 253347, achievementID = 42605, categoryID = 15604 }, -- Kaldorei Queen's Sash
    { itemID = 253348, achievementID = 42605, categoryID = 15604 }, -- Kaldorei Queen's Anklets
    { itemID = 253349, achievementID = 42605, categoryID = 15604 }, -- Kaldorei Queen's Bangles
    { itemID = 250407, achievementID = 42619, categoryID = 15604 }, -- Legion's Fel Brazier
    { itemID = 256677, achievementID = 42628, categoryID = 15604 }, -- Large Legion Candle
    { itemID = 253353, achievementID = 42630, categoryID = 15604 }, -- Illusion: Felshatter
    { itemID = 252753, achievementID = 42655, categoryID = 15604 }, -- Demonic Storage Chest
    { itemID = 250402, achievementID = 42658, categoryID = 15604 }, -- Vrykul Lord's Throne
    { itemID = 253231, achievementID = 42666, categoryID = 15604 }, -- Fallen King's Corrupted Blades
    { itemID = 250693, achievementID = 42674, categoryID = 15604 }, -- Altar of the Corrupted Flames
    { itemID = 253033, achievementID = 42684, categoryID = 15604 }, -- Felscorned War Wyrm
    { itemID = 252954, achievementID = 42685, categoryID = 15604 }, -- Felscorned Vilebrood Vanquisher
    { itemID = 253031, achievementID = 42686, categoryID = 15604 }, -- Farseer's Felscorned Tempest
    { itemID = 253025, achievementID = 42687, categoryID = 15604 }, -- Felscorned Wolfhawk
    { itemID = 257105, achievementID = 42690, categoryID = 15604 }, -- Ensemble: Sargerei Commander's Hellforged Regalia
    { titleID = 658, achievementID = 42691, categoryID = 15604 }, -- the Infernal
    { itemID = 250403, achievementID = 42692, categoryID = 15604 }, -- Legion's Holo-Communicator
    { titleID = 646, achievementID = 60935, categoryID = 15604 }, -- Chronoscholar
    { itemID = 241596, achievementID = 61024, categoryID = 15604 }, -- Ensemble: Funerary Plate of the Chosen Dead
    { itemID = 241599, achievementID = 61025, categoryID = 15604 }, -- Ensemble: Chains of the Chosen Dead
    { itemID = 241603, achievementID = 61026, categoryID = 15604 }, -- Ensemble: Garb of the Chosen Dead
    { itemID = 241608, achievementID = 61027, categoryID = 15604 }, -- Ensemble: Regalia of the Chosen Dead
    { itemID = 257104, achievementID = 61070, categoryID = 15604 }, -- Ensemble: Sargerei Commander's Voidscarred Regalia
    { itemID = 257106, achievementID = 61078, categoryID = 15604 }, -- Ensemble: Sargerei Commander's Lightbound Regalia
    { titleID = 659, achievementID = 61079, categoryID = 15604 }, -- of the Infinite Chaos
    { itemID = 253030, achievementID = 61084, categoryID = 15604 }, -- Shadowblade's Felscorned Omen
    { itemID = 253027, achievementID = 61085, categoryID = 15604 }, -- Felscorned Grandmaster's Companion
    { itemID = 253024, achievementID = 61086, categoryID = 15604 }, -- Feldruid's Scornwing Idol (not an actual mount)
    { itemID = 253013, achievementID = 61087, categoryID = 15604 }, -- Slayer's Felscorned Shrieker
    { itemID = 253029, achievementID = 61088, categoryID = 15604 }, -- High Priest's Felscorned Seeker
    { itemID = 253026, achievementID = 61089, categoryID = 15604 }, -- Archmage's Felscorned Disc
    { itemID = 253032, achievementID = 61090, categoryID = 15604 }, -- Felscorned Netherlord's Dreadsteed
    { itemID = 253343, achievementID = 61337, categoryID = 15604 }, -- Ensemble: Sargerei Commander's Felscorned Regalia
}
