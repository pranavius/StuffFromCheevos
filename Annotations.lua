---@class CacheData
---@field name string
---@field icon number

---@class SFCDatabaseSchema: table
---@field debug boolean
---@field itemsCache table<number, CacheData>
---@field filters { showCompleted: boolean, searchTerm: string, sortOrder: string }
---@field uiOptions { animateProgressBar: boolean, fadeWindowWhenMoving: boolean }

---@class DataItem
---@field itemID number?
---@field spellID number?
---@field achievementID number
---@field categoryID number
---@field faction string?

---@class Reward
---@field name string
---@field type "Mount"|"Title"|"Cosmetic"|"Customization"|"Toy"|"Pet"|"Decor"
---@field achievementID number
---@field categoryID number
---@field itemID number?
---@field spellID number?
---@field icon number|string|nil
---@field atlas string?
---@field faction string?