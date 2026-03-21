-- =============================================
--   qbx_vehiclekeys - shared.lua
--   Simpel: geen gedoe met sleutels
-- =============================================

return {

    giveKeysOnSpawn       = true,
    giveKeysOnRetrieve    = true,
    giveKeysOnPurchase    = true,
    giveKeysOnCarjack     = true,

    hotwire               = false,
    hotwireChance         = 1.0,
    hotwireMinTime        = 0,
    hotwireMaxTime        = 0,
    requiresHotwireItem   = false,

    lockpick              = false,
    lockpickChance        = 0.0,
    lockpickMinTime       = 0,
    lockpickMaxTime       = 0,
    breakLockpickChance   = 0.0,
    requiresLockpickItem  = false,

    openDoorsWithoutKey   = true,
    autoLock              = false,
    autoLockDistance      = 0.0,
    autoLockTimeout       = 0,

    giveKeys              = true,
    sharedKeys            = true,

    alertOnHotwire        = false,
    alertDelay            = 0,

    jobsWithoutKeys       = {},

    blacklistedVehicles   = {},

    useProgressBar        = false,
    keysAsItem            = false,

}