Config = {}

-- =============================================
--  ALGEMEEN
-- =============================================

Config.Debug      = false  -- Zet op true voor /bagdebug en bone-ids in console
Config.debug_bone = false  -- Zet op true om bone-ids te printen in console

-- =============================================
--  TAS / WEAPON DRAW
-- =============================================

-- GTA component 5 = bag slot
-- Als drawable niet in NoTasValues zit = tas aan
Config.BagComponent = 5
Config.NoTasValues  = { 0 }  -- standaard "geen tas" drawables

-- Draw speed multiplier MET tas
-- 1.0 = standaard GTA snelheid
-- 1.8 = realistisch (merkbaar sneller, niet overdreven)
-- 2.5+ = onrealistisch snel
Config.DrawSpeed = 1.8

-- Lange wapens die sneller getrokken worden met tas
Config.LongWeapons = {
    [`weapon_assaultrifle`]       = true,
    [`weapon_assaultrifle_mk2`]   = true,
    [`weapon_carbinerifle`]       = true,
    [`weapon_carbinerifle_mk2`]   = true,
    [`weapon_advancedrifle`]      = true,
    [`weapon_specialcarbine`]     = true,
    [`weapon_specialcarbine_mk2`] = true,
    [`weapon_bullpuprifle`]       = true,
    [`weapon_bullpuprifle_mk2`]   = true,
    [`weapon_compactrifle`]       = true,
    [`weapon_militaryrifle`]      = true,
    [`weapon_heavyrifle`]         = true,
    [`weapon_tacticalrifle`]      = true,
    [`weapon_sniperrifle`]        = true,
    [`weapon_heavysniper`]        = true,
    [`weapon_heavysniper_mk2`]    = true,
    [`weapon_marksmanrifle`]      = true,
    [`weapon_marksmanrifle_mk2`]  = true,
    [`weapon_pumpshotgun`]        = true,
    [`weapon_pumpshotgun_mk2`]    = true,
    [`weapon_sawnoffshotgun`]     = true,
    [`weapon_assaultshotgun`]     = true,
    [`weapon_bullpupshotgun`]     = true,
    [`weapon_heavyshotgun`]       = true,
    [`weapon_dbshotgun`]          = true,
    [`weapon_autoshotgun`]        = true,
    [`weapon_smg`]                = true,
    [`weapon_smg_mk2`]            = true,
    [`weapon_assaultsmg`]         = true,
    [`weapon_combatpdw`]          = true,
    [`weapon_mg`]                 = true,
    [`weapon_combatmg`]           = true,
    [`weapon_combatmg_mk2`]       = true,
    [`weapon_gusenberg`]          = true,
    [`weapon_musket`]             = true,
}

-- Wapens die NOOIT versneld worden (pistolen, messen etc.)
Config.BlacklistedWeapons = {
    [`weapon_pistol`]         = true,
    [`weapon_pistol_mk2`]     = true,
    [`weapon_combatpistol`]   = true,
    [`weapon_appistol`]       = true,
    [`weapon_stungun`]        = true,
    [`weapon_flaregun`]       = true,
    [`weapon_marksmanpistol`] = true,
    [`weapon_revolver`]       = true,
    [`weapon_revolver_mk2`]   = true,
    [`weapon_doubleaction`]   = true,
    [`weapon_ceramicpistol`]  = true,
    [`weapon_navyrevolver`]   = true,
    [`weapon_gadgetpistol`]   = true,
    [`weapon_unarmed`]        = true,
    [`weapon_knife`]          = true,
    [`weapon_bat`]            = true,
    [`weapon_crowbar`]        = true,
    [`weapon_flashlight`]     = true,
}

-- =============================================
--  BENEN (RAGDOLL)
-- =============================================

Config.ragdoll_tijd = 5000  -- Hoe lang speler op de grond blijft (ms)

-- =============================================
--  KNOCKOUT
-- =============================================

Config.knockout_weapons = {
    'WEAPON_PISTOL',
    'WEAPON_PISTOL_MK2',
    'WEAPON_KNIFE',
}

Config.knockout_distance = 2.0  -- Max afstand voor knockout (meters)

-- =============================================
--  HOSTAGE
-- =============================================

Config.hostage_weapons = {
    'WEAPON_PISTOL',
    'WEAPON_SNSPISTOL',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_REVOLVER',
    'WEAPON_MICROSMG',
    'WEAPON_KNIFE',
    'WEAPON_DAGGER',
    'WEAPON_MACHETE',
    'WEAPON_SWITCHBLADE',
    'WEAPON_BATTLEAXE',
    'WEAPON_HATCHET',
}
