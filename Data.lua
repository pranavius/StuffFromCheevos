local SFC = select(2, ...)

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
    { itemID = 44224, achievementID = 619, categoryID = 95 }, -- Black War Bear
    { itemID = 44160, achievementID = 2136, categoryID = 168 }, -- Red Proto-Drake
    { itemID = 44177, achievementID = 2144, categoryID = 155 }, -- Violet Proto-Drake
    { itemID = 51954, achievementID = 4602, categoryID = 168 }, -- Bloodbathed Frostbrood Vanquisher
    { itemID = 51955, achievementID = 4603, categoryID = 168 }, -- Icebound Frostbrood Vanquisher
    { itemID = 62900, achievementID = 4845, categoryID = 168 }, -- Volcanic Stone Drake
    { itemID = 62901, achievementID = 4853, categoryID = 168 }, -- Drake of the East Wind
    { itemID = 69230, achievementID = 5828, categoryID = 168 }, -- Corrupted Egg of Millagazor
    { itemID = 69213, achievementID = 5866, categoryID = 15070 }, -- Flameward Hippogryph
    { itemID = 77068, achievementID = 6169, categoryID = 168 }, -- Twilight Harbinger
    { itemID = 81559, achievementID = 6827, categoryID = 15114 }, -- Pandaren Kite String
    { itemID = 87769, achievementID = 6927, categoryID = 168 }, -- Crimson Cloud Serpent
    { itemID = 87773, achievementID = 6932, categoryID = 168 }, -- Heavenly Crimson Cloud Serpent
    { itemID = 93662, achievementID = 8124, categoryID = 168 }, -- Armored Skyscreamer
    { itemID = 104208, achievementID = 8454, categoryID = 168 }, -- Galakras
    { itemID = 116383, achievementID = 8985, categoryID = 168 }, -- Gorestrider Gronnling
    { itemID = 116670, achievementID = 9396, categoryID = 168 }, -- Frostplains Battleboar
    { itemID = 116668, achievementID = 9705, categoryID = 15303 }, -- Armored Frostboar
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
    { itemID = 45801, achievementID = 12401, categoryID = 168 }, -- Rusted Proto-Drake and Ironbound Proto-Drake
    { itemID = 163216, achievementID = 12806, categoryID = 168 }, -- Bloodgorged Crawg
    { itemID = 161215, achievementID = 12812, categoryID = 168 }, -- Reins of the Obsidian Krolusk
    { itemID = 140228, achievementID = 12895, categoryID = 15266 }, -- Prestigious Bronze Courser
    { itemID = 169162, achievementID = 13250, categoryID = 15298 }, -- Wonderwing 2.0
    { itemID = 166539, achievementID = 13315, categoryID = 168 }, -- Dazar'alor Windreaver
    { itemID = 168056, achievementID = 13517, categoryID = 15284 }, -- Bloodflank Charger and Ironclad Frostclaw
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
    { itemID = 198654, achievementID = 15833, categoryID = 15248 }, -- Otterworldly Ottuk Carrier
    { itemID = 192784, achievementID = 16295, categoryID = 168 }, -- Shellack
    { itemID = 192806, achievementID = 16355, categoryID = 168 }, -- Raging Magmammoth
    { itemID = 192774, achievementID = 16492, categoryID = 15465 }, -- Coralscale Salamanther
    { itemID = 205206, achievementID = 17785, categoryID = 15455 }, -- Calescent Shalewing
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
    { itemID = 192751, achievementID = 19486, categoryID = 15465 }, -- Stormtouched Bruffalon
    { itemID = 217612, achievementID = 20501, categoryID = 15301 }, -- Zovaal's Soul Eater
    { itemID = 226357, achievementID = 20525, categoryID = 15272 }, -- Diamond Mechsuit
    { itemID = 220766, achievementID = 20593, categoryID = 15536 }, -- August Phoenix
    { itemID = 223158, achievementID = 40097, categoryID = 15283 }, -- Raging Cinderbee
    { itemID = 223266, achievementID = 40232, categoryID = 168 }, -- Shadowed Swarmite
    { itemID = 224415, achievementID = 40438, categoryID = 15523 }, -- Ivory Goliathus
    { itemID = 223286, achievementID = 40539, categoryID = 171 }, -- Kah, Legend of the Deep
    { itemID = 223267, achievementID = 40702, categoryID = 15462 }, -- Swarmite Skyhunter
    { itemID = 235515, achievementID = 40953, categoryID = 15301 }, -- Jani's Trashpile Mount
    { itemID = 170070, achievementID = 40956, categoryID = 15298 }, -- Honeyback Hivemother
    { itemID = 228760, achievementID = 40976, categoryID = 15268 }, -- Coldflame Tempest
    { itemID = 232624, achievementID = 41056, categoryID = 15274 }, -- Timely Buzzbee
    { itemID = 232991, achievementID = 41133, categoryID = 15521 }, -- The Breaker's Song
    { itemID = 223313, achievementID = 41201, categoryID = 15521 }, -- Shadow of Doubt
    { itemID = 231173, achievementID = 41286, categoryID = 168 }, -- Junkmaestro's Magnetomech
    { itemID = 235549, achievementID = 41533, categoryID = 15272 }, -- Crimson Shreddertank
    { itemID = 242714, achievementID = 41597, categoryID = 168 }, -- Umbral K'arroc
    { itemID = 238739, achievementID = 41779, categoryID = 15274 }, -- Chrono Corsair
    { itemID = 174654, achievementID = 41929, categoryID = 15546 }, -- Black Serpent of N'Zoth
    { itemID = 235709, achievementID = 41966, categoryID = 15546 }, -- Ny'alothan Shadow Worm
    { itemID = 237485, achievementID = 41980, categoryID = 15506 }, -- Terror of the Night
    { itemID = 246237, achievementID = 42212, categoryID = 15531 }, -- OC91 Chariot
    { itemID = 253028, achievementID = 42504, categoryID = 15604 }, -- Felscorned Highlord's Charger
    { itemID = 253033, achievementID = 42684, categoryID = 15604 }, -- Felscorned War Wyrm
    { itemID = 252954, achievementID = 42685, categoryID = 15604 }, -- Felscorned Vilebrood Vanquisher
    { itemID = 253031, achievementID = 42686, categoryID = 15604 }, -- Farseer's Felscorned Tempest
    { itemID = 253025, achievementID = 42687, categoryID = 15604 }, -- Felscorned Wolfhawk
    { itemID = 257193, achievementID = 42703, categoryID = 15605 }, -- Preyseeker's Nightmare
    { itemID = 250240, achievementID = 61017, categoryID = 15521 }, -- Phase-Lost Slateback
    { itemID = 253030, achievementID = 61084, categoryID = 15604 }, -- Shadowblade's Felscorned Omen
    { itemID = 253027, achievementID = 61085, categoryID = 15604 }, -- Felscorned Grandmaster's Companion
    { itemID = 253024, achievementID = 61086, categoryID = 15604 }, -- Feldruid's Scornwing Idol (not an actual mount)
    { itemID = 253013, achievementID = 61087, categoryID = 15604 }, -- Slayer's Felscorned Shrieker
    { itemID = 253029, achievementID = 61088, categoryID = 15604 }, -- High Priest's Felscorned Seeker
    { itemID = 253026, achievementID = 61089, categoryID = 15604 }, -- Archmage's Felscorned Disc
    { itemID = 253032, achievementID = 61090, categoryID = 15604 }, -- Felscorned Netherlord's Dreadsteed
    { itemID = 263579, achievementID = 61263, categoryID = 15553 }, -- Vivacious Chloroceros
    { itemID = 260887, achievementID = 61380, categoryID = 168 }, -- Tenebrous Harrower
    { itemID = 258188, achievementID = 61451, categoryID = 15301 }, -- Geargrinder Mk. 11
    { itemID = 258884, achievementID = 61463, categoryID = 15454 }, -- Spawn of Vyranoth
    { itemID = 257145, achievementID = 61584, categoryID = 15462 }, -- Crimson Dragonhawk
    { itemID = 257199, achievementID = 61906, categoryID = 15571 }, -- Giganto Manis
    { itemID = 265656, achievementID = 62096, categoryID = 15248 }, -- Anu'shalla, Shadow's Guidance
    { itemID = 257144, achievementID = 62190, categoryID = 15600 }, -- Umbral Dragonhawk
    { itemID = 260697, achievementID = 62385, categoryID = 15547 }, -- Lab-grown Stormray
    { itemID = 252011, achievementID = 62386, categoryID = 15553 }, -- Brilliant Petalwing
    -- Seasonal Gladiator mount
    -- Seasonal AOTC and/or Cutting Edge mount
    -- Seasonal KSM and KSL mount
}

-- titleID corresponds to CharTitles.Mask_ID in db2
SFC.Titles = {
    { titleID = 47, achievementID = 46, categoryID = 97 }, -- the Explorer
    { titleID = 34, achievementID = 714, categoryID = 95 }, -- Conqueror
    { titleID = 98, achievementID = 762, categoryID = 201 }, -- Ambassador
    { titleID = 43, achievementID = 913, categoryID = 155 }, -- Elder
    { titleID = 48, achievementID = 943, categoryID = 201 }, -- the Diplomat
    { titleID = 99, achievementID = 945, categoryID = 201 }, -- the Argent Champion
    { titleID = 100, achievementID = 953, categoryID = 201 }, -- Guardian of Cenarius
    { titleID = 42, achievementID = 978, categoryID = 96 }, -- the Seeker
    { titleID = 46, achievementID = 1015, categoryID = 201 }, -- the Exalted
    { titleID = 45, achievementID = 1039, categoryID = 155 }, -- Flame Keeper
    { titleID = 41, achievementID = 1175, categoryID = 95 }, -- Battlemaster
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
    { titleID = 119, achievementID = 2767, categoryID = 14941 }, -- of Silvermoon
    { titleID = 120, achievementID = 2768, categoryID = 14941 }, -- of Thunder Bluff
    { titleID = 121, achievementID = 2769, categoryID = 14941 }, -- of the Undercity
    { titleID = 122, achievementID = 2798, categoryID = 155 }, -- the Noble
    { titleID = 133, achievementID = 3478, categoryID = 155 }, -- the Pilgrim
    { titleID = 139, achievementID = 4583, categoryID = 14922 }, -- Bane of the Fallen King
    { titleID = 138, achievementID = 4584, categoryID = 14922 }, -- the Light of Dawn
    { titleID = 141, achievementID = 4598, categoryID = 14866 }, -- of the Ashen Verdict
    { titleID = 148, achievementID = 4854, categoryID = 15071 }, -- Assistant Professor
    { titleID = 149, achievementID = 4855, categoryID = 15071 }, -- Associate Professor
    { titleID = 187, achievementID = 5116, categoryID = 15068 }, -- Blackwing's Bane
    { titleID = 186, achievementID = 5121, categoryID = 15068 }, -- Dragonslayer
    { titleID = 151, achievementID = 5123, categoryID = 15068 }, -- of the Four Winds
    { titleID = 153, achievementID = 5325, categoryID = 15092 }, -- Veteran of the Horde
    { titleID = 23, achievementID = 5338, categoryID = 15092 }, -- Centurion
    { titleID = 27, achievementID = 5342, categoryID = 15092 }, -- Warlord
    { titleID = 15, achievementID = 5345, categoryID = 15092 }, -- Scout
    { titleID = 16, achievementID = 5346, categoryID = 15092 }, -- Grunt
    { titleID = 3, achievementID = 5347, categoryID = 15092 }, -- Sergeant
    { titleID = 18, achievementID = 5348, categoryID = 15092 }, -- Senior Sergeant
    { titleID = 19, achievementID = 5349, categoryID = 15092 }, -- First Sergeant
    { titleID = 20, achievementID = 5350, categoryID = 15092 }, -- Stone Guard
    { titleID = 21, achievementID = 5351, categoryID = 15092 }, -- Blood Guard
    { titleID = 22, achievementID = 5352, categoryID = 15092 }, -- Legionnaire
    { titleID = 24, achievementID = 5353, categoryID = 15092 }, -- Champion
    { titleID = 25, achievementID = 5354, categoryID = 15092 }, -- Lieutenant General
    { titleID = 26, achievementID = 5355, categoryID = 15092 }, -- General
    { titleID = 28, achievementID = 5356, categoryID = 15092 }, -- High Warlord
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
    { titleID = 203, achievementID = 6926, categoryID = 168 }, -- the Tranquil Master
    { titleID = 183, achievementID = 6941, categoryID = 15092 }, -- Hero of the Horde
    { titleID = 202, achievementID = 7306, categoryID = 170 }, -- Master of the Ways
    { titleID = 205, achievementID = 7479, categoryID = 15114 }, -- Shado-Master
    { titleID = 206, achievementID = 7509, categoryID = 15302 }, -- the Scenaturdist
    { titleID = 93, achievementID = 7520, categoryID = 96 }, -- Loremaster
    { titleID = 208, achievementID = 7612, categoryID = 15071 }, -- Seeker of Knowledge
    { titleID = 218, achievementID = 8023, categoryID = 15114 }, -- the Wakener
    { titleID = 220, achievementID = 8055, categoryID = 95 }, -- Khan
    { titleID = 222, achievementID = 8067, categoryID = 15107 }, -- Storm's End
    { titleID = 221, achievementID = 8121, categoryID = 15110 }, -- the Stormbreaker
    { titleID = 240, achievementID = 8397, categoryID = 15118 }, -- the Crazy Cat Lady
    { titleID = 252, achievementID = 8397, categoryID = 15118 }, -- the Crazy Cat Man
    { titleID = 214, achievementID = 8482, categoryID = 15107 }, -- Hellscream's Downfall
    { titleID = 212, achievementID = 8680, categoryID = 15107 }, -- Liberator of Orgrimmar
    { titleID = 304, achievementID = 8965, categoryID = 15231 }, -- Empire's Twilight
    { titleID = 301, achievementID = 8973, categoryID = 15231 }, -- Ironbane
    { titleID = 110, achievementID = 9058, categoryID = 15228 }, -- Jenkins
    { titleID = 278, achievementID = 9072, categoryID = 15232 }, -- Talon King
    { titleID = 279, achievementID = 9072, categoryID = 15232 }, -- Talon Queen
    { titleID = 260, achievementID = 9094, categoryID = 15303 }, -- Architect
    { titleID = 305, achievementID = 9464, categoryID = 169 }, -- Artisan
    { titleID = 269, achievementID = 9508, categoryID = 15303 }, -- Warlord of Draenor
    { titleID = 267, achievementID = 9509, categoryID = 15303 }, -- Draenei Destroyer
    { titleID = 264, achievementID = 9510, categoryID = 15303 }, -- the Dwarfstalker
    { titleID = 263, achievementID = 9511, categoryID = 15303 }, -- Gnomebane
    { titleID = 262, achievementID = 9512, categoryID = 15303 }, -- the Manslayer
    { titleID = 266, achievementID = 9513, categoryID = 15303 }, -- Scourge of the Kaldorei
    { titleID = 268, achievementID = 9514, categoryID = 15303 }, -- Terror of the Tushui
    { titleID = 265, achievementID = 9515, categoryID = 15303 }, -- Worgen Hunter
    { titleID = 300, achievementID = 9619, categoryID = 168 }, -- the Savage Hero
    { titleID = 277, achievementID = 9706, categoryID = 15303 }, -- Stable Master
    { titleID = 307, achievementID = 9924, categoryID = 97 }, -- Field Photographer
    { titleID = 319, achievementID = 10043, categoryID = 15231 }, -- Defiler's End
    { titleID = 317, achievementID = 10164, categoryID = 15303 }, -- Captain
    { titleID = 318, achievementID = 10265, categoryID = 15220 }, -- of the Jungle
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
    { titleID = 377, achievementID = 12604, categoryID = 15283 }, -- Conqueror of Azeroth
    { titleID = 383, achievementID = 12861, categoryID = 15283 }, -- Contender
    { titleID = 382, achievementID = 13134, categoryID = 15307 }, -- Expedition Leader
    { titleID = 386, achievementID = 13314, categoryID = 15286 }, -- Hero of Dazar'alor
    { titleID = 403, achievementID = 13555, categoryID = 15298 }, -- Junkyard
    { titleID = 405, achievementID = 13638, categoryID = 15298 }, -- of the Deeps
    { titleID = 404, achievementID = 13733, categoryID = 15286 }, -- the Eternal
    { titleID = 412, achievementID = 13924, categoryID = 15284 }, -- Veteran of the Fourth War
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
    { titleID = 650, achievementID = 41095, categoryID = 15522 }, -- Delver
    { titleID = 550, achievementID = 41197, categoryID = 15531 }, -- High Explorer
    { titleID = 605, achievementID = 41236, categoryID = 15526 }, -- Liberator of Undermine
    { titleID = 606, achievementID = 41350, categoryID = 15530 }, -- Darkfuse Diplomat
    { titleID = 607, achievementID = 41352, categoryID = 15530 }, -- Trade-Duke
    { titleID = 613, achievementID = 41596, categoryID = 15526 }, -- Junkmaestro
    { titleID = 615, achievementID = 41611, categoryID = 15526 }, -- Void Vanquisher
    { titleID = 616, achievementID = 41629, categoryID = 15521 }, -- Part-Timer
    { titleID = 629, achievementID = 41820, categoryID = 15506 }, -- of Hammerfall
    { titleID = 550, achievementID = 42203, categoryID = 15531 }, -- High Explorer
    { titleID = 551, achievementID = 42301, categoryID = 15604 }, -- Timerunner
    { titleID = 598, achievementID = 42779, categoryID = 15523 }, -- Flickering
    { titleID = 646, achievementID = 60935, categoryID = 15604 }, -- Chronoscholar
    { titleID = 754, achievementID = 61052, categoryID = 15553 }, -- Dustlord
    { titleID = 659, achievementID = 61079, categoryID = 15604 }, -- of the Infinite Chaos
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
}

SFC.Cosmetics = {
    { itemID = 43348, achievementID = 45, categoryID = 97 }, -- Tabard of the Explorer
    { itemID = 49052, achievementID = 3957, categoryID = 15003 }, -- Tabard of Conquest
    { itemID = 49054, achievementID = 3957, categoryID = 15003 }, -- Tabard of Conquest
    { itemID = 43300, achievementID = 7520, categoryID = 96 }, -- Loremaster's Colors
    { itemID = 128362, achievementID = 10255, categoryID = 15303 }, -- Captain's Hat
    { itemID = 128363, achievementID = 10255, categoryID = 15303 }, -- Captain's Hat
    { itemID = 128364, achievementID = 10258, categoryID = 15303 }, -- Fleet Commander's Hat
    { itemID = 128365, achievementID = 10258, categoryID = 15303 }, -- Fleet Commander's Hat
    { itemID = 156666, achievementID = 12290, categoryID = 15119 }, -- Master Trainer's Tabard
    { itemID = 183693, achievementID = 14763, categoryID = 15441 }, -- Plague Doctor's Mask
    { itemID = 199669, achievementID = 15939, categoryID = 15462 }, -- Spiked Crimson Spaulders
    { itemID = 200882, achievementID = 16444, categoryID = 15466 }, -- Big Kinook's Spare Ladle
    { itemID = 203431, achievementID = 17334, categoryID = 92 }, -- Ensemble: Burden of Unrelenting Justice
    { itemID = 208150, achievementID = 18643, categoryID = 15465 }, -- Blue Tweed Cap
    { itemID = 208149, achievementID = 18645, categoryID = 15465 }, -- Brown Tweed Cap
    { itemID = 208490, achievementID = 18706, categoryID = 15467 }, -- Ensemble: Infinite Acolyte's Regalia
    { itemID = 209062, achievementID = 18901, categoryID = 15492 }, -- Ensemble: Chromatically Calibrated Holo-Gogs
    { itemID = 209064, achievementID = 18905, categoryID = 15492 }, -- Ensemble: Chromatically Calibrated Retinal Armor
    { itemID = 209066, achievementID = 18906, categoryID = 15492 }, -- Ensemble: Chromatically Calibrated Cranial Cannons
    { itemID = 209067, achievementID = 18907, categoryID = 15492 }, -- Ensemble: Chromatically Calibrated Ectoplasmic Specs
    { itemID = 209063, achievementID = 18908, categoryID = 15492 }, -- Ensemble: Chromatically Calibrated Bio-Optic Killshades
    { itemID = 210414, achievementID = 19317, categoryID = 15465 }, -- Forest Lord's Antlers
    { itemID = 219125, achievementID = 19515, categoryID = 169 }, -- Formed Artisan's Talent
    { itemID = 219132, achievementID = 20596, categoryID = 15506 }, -- Crimson Cartographer's Orientation
    { itemID = 219115, achievementID = 40138, categoryID = 15524 }, -- Versatile Peddler's Trinkets
    { itemID = 226160, achievementID = 40360, categoryID = 15506 }, -- Hillhelm Farmhand's Hoe
    { itemID = 226161, achievementID = 40360, categoryID = 15506 }, -- Hillhelm Farmhand's Watering Can
    { itemID = 219105, achievementID = 40618, categoryID = 15506 }, -- Sandy Quotidian Wear
    { itemID = 232646, achievementID = 41052, categoryID = 15506 }, -- Root Defender's Spear
    { itemID = 232647, achievementID = 41052, categoryID = 15506 }, -- Root Defender's Shield
    { itemID = 219110, achievementID = 41169, categoryID = 15530 }, -- Vermillion Patron's Elegance
    { itemID = 234521, achievementID = 41351, categoryID = 15530 }, -- Ensemble: Rusty Bruiser's Outfit
    { itemID = 253200, achievementID = 42583, categoryID = 15604 }, -- Felscorned Scythe of the Unmaker
    { itemID = 253201, achievementID = 42583, categoryID = 15604 }, -- Felscorned Scythe of the Unmaker
    { itemID = 253285, achievementID = 42583, categoryID = 15604 }, -- Felscorned Scythe of the Unmaker
    { itemID = 253344, achievementID = 42605, categoryID = 15604 }, -- Kaldorei Queen's Sarong
    { itemID = 253345, achievementID = 42605, categoryID = 15604 }, -- Kaldorei Queen's Crown
    { itemID = 253346, achievementID = 42605, categoryID = 15604 }, -- Kaldorei Queen's Robe
    { itemID = 253347, achievementID = 42605, categoryID = 15604 }, -- Kaldorei Queen's Sash
    { itemID = 253348, achievementID = 42605, categoryID = 15604 }, -- Kaldorei Queen's Anklets
    { itemID = 253349, achievementID = 42605, categoryID = 15604 }, -- Kaldorei Queen's Bangles
    { itemID = 253231, achievementID = 42666, categoryID = 15604 }, -- Fallen King's Corrupted Blades
    { itemID = 257105, achievementID = 42690, categoryID = 15604 }, -- Ensemble: Sargerei Commander's Hellforged Regalia
    { itemID = 143518, achievementID = 61024, categoryID = 15604 }, -- Ensemble: Funerary Plate of the Chosen Dead
    { itemID = 143519, achievementID = 61024, categoryID = 15604 }, -- Ensemble: Funerary Plate of the Chosen Dead
    { itemID = 143520, achievementID = 61024, categoryID = 15604 }, -- Ensemble: Funerary Plate of the Chosen Dead
    { itemID = 143521, achievementID = 61024, categoryID = 15604 }, -- Ensemble: Funerary Plate of the Chosen Dead
    { itemID = 241595, achievementID = 61024, categoryID = 15604 }, -- Ensemble: Funerary Plate of the Chosen Dead
    { itemID = 241603, achievementID = 61026, categoryID = 15604 }, -- Ensemble: Garb of the Chosen Dead
    { itemID = 241604, achievementID = 61026, categoryID = 15604 }, -- Ensemble: Garb of the Chosen Dead
    { itemID = 241605, achievementID = 61026, categoryID = 15604 }, -- Ensemble: Garb of the Chosen Dead
    { itemID = 241606, achievementID = 61026, categoryID = 15604 }, -- Ensemble: Garb of the Chosen Dead
    { itemID = 241607, achievementID = 61027, categoryID = 15604 }, -- Ensemble: Regalia of the Chosen Dead
    { itemID = 241608, achievementID = 61027, categoryID = 15604 }, -- Ensemble: Regalia of the Chosen Dead
    { itemID = 241609, achievementID = 61027, categoryID = 15604 }, -- Ensemble: Regalia of the Chosen Dead
    { itemID = 241610, achievementID = 61027, categoryID = 15604 }, -- Ensemble: Regalia of the Chosen Dead
    { itemID = 257104, achievementID = 61070, categoryID = 15604 }, -- Ensemble: Sargerei Commander's Voidscarred Regalia
    { itemID = 257106, achievementID = 61078, categoryID = 15604 }, -- Ensemble: Sargerei Commander's Lightbound Regalia
    { itemID = 253343, achievementID = 61337, categoryID = 15604 }, -- Ensemble: Sargerei Commander's Felscorned Regalia
}
