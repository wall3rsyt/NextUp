-- =============================================
--  qbox-bagweapondraw — client/main.lua
--  Volledig standalone, geen framework nodig
--  Geoptimaliseerd: minimale CPU gebruik
-- =============================================

local ped            = PlayerPedId()
local lastWeapon     = `weapon_unarmed`
local lastDrawable   = -1
local clipsetActive  = false

-- =============================================
--  Helpers
-- =============================================

local function log(msg)
    if Config.Debug then
        print('^3[bagweapondraw]^7 ' .. msg)
    end
end

local function hasBag()
    local drawable = GetPedDrawableVariation(ped, Config.BagComponent)
    for _, v in ipairs(Config.NoTasValues) do
        if drawable == v then return false end
    end
    return true
end

local function applyDrawSpeed()
    SetPedWeaponMovementClipset(ped, 'move_weapon_rifle_high')
    clipsetActive = true

    -- Versnел intro animaties na korte delay
    SetTimeout(80, function()
        local anims = {
            { 'weapons@rifle@',         'intro' },
            { 'weapons@assault_rifle@', 'intro' },
            { 'weapons@smg@',           'intro' },
            { 'weapons@shotgun@',       'intro' },
            { 'weapons@sniper@',        'intro' },
        }
        for _, a in ipairs(anims) do
            if HasAnimDictLoaded(a[1]) then
                SetAnimSpeed(ped, a[1], a[2], Config.DrawSpeed)
            end
        end
        log('Draw speed ' .. Config.DrawSpeed .. 'x actief')
    end)
end

local function resetDrawSpeed()
    ResetPedWeaponMovementClipset(ped)
    clipsetActive = false
    log('Draw speed gereset')
end

-- =============================================
--  Wapen wissel detectie
-- =============================================

CreateThread(function()
    while true do
        -- Slaap langer als ped niet verandert (optimalisatie)
        Wait(100)

        ped = PlayerPedId()
        local weapon = GetSelectedPedWeapon(ped)

        if weapon ~= lastWeapon then
            lastWeapon = weapon

            if clipsetActive then
                resetDrawSpeed()
            end

            if Config.LongWeapons[weapon] and hasBag() then
                applyDrawSpeed()
            end
        end
    end
end)

-- =============================================
--  Kleding wissel detectie (lagere frequentie)
-- =============================================

CreateThread(function()
    while true do
        Wait(500)

        ped = PlayerPedId()
        local drawable = GetPedDrawableVariation(ped, Config.BagComponent)

        if drawable ~= lastDrawable then
            lastDrawable = drawable
            log('Kleding gewijzigd — component 5: ' .. drawable)

            -- Tas uitgetrokken terwijl clipset actief
            if clipsetActive and not hasBag() then
                resetDrawSpeed()
            end

            -- Tas aangetrokken met lang wapen in hand
            if not clipsetActive and hasBag() and Config.LongWeapons[GetSelectedPedWeapon(ped)] then
                applyDrawSpeed()
            end
        end
    end
end)

-- =============================================
--  Debug command
-- =============================================

RegisterCommand('bagdebug', function()
    ped = PlayerPedId()
    local drawable = GetPedDrawableVariation(ped, Config.BagComponent)
    local weapon   = GetSelectedPedWeapon(ped)
    print(string.format(
        '^3[bagweapondraw]^7 Component 5: %d | Tas: %s | Lang wapen: %s | Clipset: %s',
        drawable,
        tostring(hasBag()),
        tostring(Config.LongWeapons[weapon] == true),
        tostring(clipsetActive)
    ))
end, false)
