local curWeapon          = nil
local ox_inventory       = exports.ox_inventory
local ped                = cache.ped
local playerLoaded       = false

-- ─────────────────────────────────────────
--  Framework
-- ─────────────────────────────────────────

local function getPlayerItems()
    if GetResourceState('qbx_core') == 'started' then
        local p = exports.qbx_core:GetPlayerData()
        return p and p.items or {}
    end
    if GetResourceState('qb-core') == 'started' then
        local p = exports['qb-core']:GetCoreObject().Functions.GetPlayerData()
        return p and p.items or {}
    end
    return {}
end

-- ─────────────────────────────────────────
--  Wapens
-- ─────────────────────────────────────────

local Weapons = {
    [`WEAPON_ADVANCEDRIFLE`]        = { object = `w_ar_advancedrifle`,        item = 'WEAPON_ADVANCEDRIFLE',        rot = vector3(0,0,0) },
    [`WEAPON_ASSAULTRIFLE`]         = { object = `w_ar_assaultrifle`,          item = 'WEAPON_ASSAULTRIFLE',         rot = vector3(0,0,0) },
    [`WEAPON_ASSAULTRIFLE_MK2`]     = { object = `w_ar_assaultriflemk2`,       item = 'WEAPON_ASSAULTRIFLE_MK2',     rot = vector3(0,0,0) },
    [`WEAPON_ASSAULTSHOTGUN`]       = { object = `w_sg_assaultshotgun`,        item = 'WEAPON_ASSAULTSHOTGUN',       rot = vector3(0,0,0) },
    [`WEAPON_ASSAULTSMG`]           = { object = `w_sb_assaultsmg`,            item = 'WEAPON_ASSAULTSMG',           rot = vector3(0,0,0) },
    [`WEAPON_BULLPUPRIFLE`]         = { object = `w_ar_bullpuprifle`,          item = 'WEAPON_BULLPUPRIFLE',         rot = vector3(0,0,0) },
    [`WEAPON_BULLPUPRIFLE_MK2`]     = { object = `w_ar_bullpupriflemk2`,       item = 'WEAPON_BULLPUPRIFLE_MK2',     rot = vector3(0,0,0) },
    [`WEAPON_BULLPUPSHOTGUN`]       = { object = `w_sg_bullpupshotgun`,        item = 'WEAPON_BULLPUPSHOTGUN',       rot = vector3(0,0,0) },
    [`WEAPON_CARBINERIFLE`]         = { object = `w_ar_carbinerifle`,          item = 'WEAPON_CARBINERIFLE',         rot = vector3(0,0,0) },
    [`WEAPON_CARBINERIFLE_MK2`]     = { object = `w_ar_carbineriflemk2`,       item = 'WEAPON_CARBINERIFLE_MK2',     rot = vector3(0,0,0) },
    [`WEAPON_COMBATMG`]             = { object = `w_mg_combatmg`,              item = 'WEAPON_COMBATMG',             rot = vector3(0,0,0) },
    [`WEAPON_COMBATMG_MK2`]         = { object = `w_mg_combatmgmk2`,           item = 'WEAPON_COMBATMG_MK2',         rot = vector3(0,0,0) },
    [`WEAPON_COMBATPDW`]            = { object = `w_sb_pdw`,                   item = 'WEAPON_COMBATPDW',            rot = vector3(0,0,0) },
    [`WEAPON_COMBATSHOTGUN`]        = { object = `w_sg_pumpshotgunh4`,         item = 'WEAPON_COMBATSHOTGUN',        rot = vector3(0,0,0) },
    [`WEAPON_COMPACTRIFLE`]         = { object = `w_ar_assaultrifle_smg`,      item = 'WEAPON_COMPACTRIFLE',         rot = vector3(0,0,0) },
    [`WEAPON_DBSHOTGUN`]            = { object = `w_sg_doublebarrel`,          item = 'WEAPON_DBSHOTGUN',            rot = vector3(0,0,0) },
    [`WEAPON_FIREWORK`]             = { object = `w_lr_firework`,              item = 'WEAPON_FIREWORK',             rot = vector3(0,0,0) },
    [`WEAPON_GUSENBERG`]            = { object = `w_sb_gusenberg`,             item = 'WEAPON_GUSENBERG',            rot = vector3(0,0,0) },
    [`WEAPON_HEAVYRIFLE`]           = { object = `w_ar_heavyrifleh`,           item = 'WEAPON_HEAVYRIFLE',           rot = vector3(0,0,0) },
    [`WEAPON_HEAVYSHOTGUN`]         = { object = `w_sg_heavyshotgun`,          item = 'WEAPON_HEAVYSHOTGUN',         rot = vector3(0,0,0) },
    [`WEAPON_HEAVYSNIPER`]          = { object = `w_sr_heavysniper`,           item = 'WEAPON_HEAVYSNIPER',          rot = vector3(0,0,0) },
    [`WEAPON_HEAVYSNIPER_MK2`]      = { object = `w_sr_heavysnipermk2`,        item = 'WEAPON_HEAVYSNIPER_MK2',      rot = vector3(0,0,0) },
    [`WEAPON_MARKSMANRIFLE`]        = { object = `w_sr_marksmanrifle`,         item = 'WEAPON_MARKSMANRIFLE',        rot = vector3(0,0,0) },
    [`WEAPON_MARKSMANRIFLE_MK2`]    = { object = `w_sr_marksmanriflemk2`,      item = 'WEAPON_MARKSMANRIFLE_MK2',    rot = vector3(0,0,0) },
    [`WEAPON_MG`]                   = { object = `w_mg_mg`,                    item = 'WEAPON_MG',                   rot = vector3(0,0,0) },
    [`WEAPON_MICROSMG`]             = { object = `w_sb_microsmg`,              item = 'WEAPON_MICROSMG',             rot = vector3(0,0,0) },
    [`WEAPON_MILITARYRIFLE`]        = { object = `w_ar_bullpuprifleh4`,        item = 'WEAPON_MILITARYRIFLE',        rot = vector3(0,0,0) },
    [`WEAPON_MINISMG`]              = { object = `w_sb_minismg`,               item = 'WEAPON_MINISMG',              rot = vector3(0,0,0) },
    [`WEAPON_MUSKET`]               = { object = `w_ar_musket`,                item = 'WEAPON_MUSKET',               rot = vector3(0,0,0) },
    [`WEAPON_PUMPSHOTGUN`]          = { object = `w_sg_pumpshotgun`,           item = 'WEAPON_PUMPSHOTGUN',          rot = vector3(0,0,0) },
    [`WEAPON_PUMPSHOTGUN_MK2`]      = { object = `w_sg_pumpshotgunmk2`,        item = 'WEAPON_PUMPSHOTGUN_MK2',      rot = vector3(0,0,0) },
    [`WEAPON_SAWNOFFSHOTGUN`]       = { object = `w_sg_sawnoff`,               item = 'WEAPON_SAWNOFFSHOTGUN',       rot = vector3(0,0,0) },
    [`WEAPON_SMG`]                  = { object = `w_sb_smg`,                   item = 'WEAPON_SMG',                  rot = vector3(0,0,0) },
    [`WEAPON_SMG_MK2`]              = { object = `w_sb_smgmk2`,                item = 'WEAPON_SMG_MK2',              rot = vector3(0,0,0) },
    [`WEAPON_SNIPERRIFLE`]          = { object = `w_sr_sniperrifle`,           item = 'WEAPON_SNIPERRIFLE',          rot = vector3(0,0,0) },
    [`WEAPON_SPECIALCARBINE`]       = { object = `w_ar_specialcarbine`,        item = 'WEAPON_SPECIALCARBINE',       rot = vector3(0,0,0) },
    [`WEAPON_SPECIALCARBINE_MK2`]   = { object = `w_ar_specialcarbinemk2`,     item = 'WEAPON_SPECIALCARBINE_MK2',   rot = vector3(0,0,0) },
    [`WEAPON_AUTOSHOTGUN`]          = { object = `w_sg_sweeper`,               item = 'WEAPON_AUTOSHOTGUN',          rot = vector3(0,0,0) },
    [`WEAPON_PRECISIONRIFLE`]       = { object = `w_sr_precisionrifle_reh`,    item = 'WEAPON_PRECISIONRIFLE',       rot = vector3(0,0,0) },
    [`WEAPON_TACTICALRIFLE`]        = { object = `w_ar_carbinerifle_reh`,      item = 'WEAPON_TACTICALRIFLE',        rot = vector3(0,0,0) },
    [`WEAPON_RAYMINIGUN`]           = { object = `w_mg_sminigun`,              item = 'WEAPON_RAYMINIGUN',           rot = vector3(0,0,0) },
    [`WEAPON_RAYCARBINE`]           = { object = `w_ar_srifle`,                item = 'WEAPON_RAYCARBINE',           rot = vector3(0,0,0) },
    [`WEAPON_RAILGUN`]              = { object = `w_ar_railgun`,               item = 'WEAPON_RAILGUN',              rot = vector3(0,0,0) },
    [`WEAPON_RPG`]                  = { object = `w_lr_rpg`,                   item = 'WEAPON_RPG',                  rot = vector3(0,0,0) },
    [`WEAPON_HOMINGLAUNCHER`]       = { object = `w_lr_homing`,                item = 'WEAPON_HOMINGLAUNCHER',       rot = vector3(0,0,0) },
    [`WEAPON_MINIGUN`]              = { object = `w_mg_minigun`,               item = 'WEAPON_MINIGUN',              rot = vector3(0,0,0) },
    [`WEAPON_BAT`]                  = { object = `w_me_bat`,                   item = 'WEAPON_BAT',                  rot = vector3(0,92.5,0) },
    [`WEAPON_BATTLEAXE`]            = { object = `w_me_battleaxe`,             item = 'WEAPON_BATTLEAXE',            rot = vector3(0,92.5,0) },
    [`WEAPON_CROWBAR`]              = { object = `w_me_crowbar`,               item = 'WEAPON_CROWBAR',              rot = vector3(0,92.5,0) },
    [`WEAPON_FIREEXTINGUISHER`]     = { object = `w_am_fire_exting`,           item = 'WEAPON_FIREEXTINGUISHER',     rot = vector3(0,92.5,0) },
    [`WEAPON_GOLFCLUB`]             = { object = `w_me_gclub`,                 item = 'WEAPON_GOLFCLUB',             rot = vector3(0,92.5,0) },
    [`WEAPON_HATCHET`]              = { object = `w_me_hatchet`,               item = 'WEAPON_HATCHET',              rot = vector3(0,92.5,0) },
    [`WEAPON_HAZARDCAN`]            = { object = `w_ch_jerrycan`,              item = 'WEAPON_HAZARDCAN',            rot = vector3(0,92.5,0) },
    [`WEAPON_FERTILIZERCAN`]        = { object = `w_am_jerrycan_sf`,           item = 'WEAPON_FERTILIZERCAN',        rot = vector3(0,92.5,0) },
    [`WEAPON_MACHETE`]              = { object = `w_me_machette_lr`,           item = 'WEAPON_MACHETE',              rot = vector3(0,92.5,0) },
    [`WEAPON_NIGHTSTICK`]           = { object = `w_me_nightstick`,            item = 'WEAPON_NIGHTSTICK',           rot = vector3(0,92.5,0) },
    [`WEAPON_PETROLCAN`]            = { object = `w_am_jerrycan`,              item = 'WEAPON_PETROLCAN',            rot = vector3(0,92.5,0) },
    [`WEAPON_POOLCUE`]              = { object = `w_me_poolcue`,               item = 'WEAPON_POOLCUE',              rot = vector3(0,92.5,0) },
    [`WEAPON_STONE_HATCHET`]        = { object = `w_me_stonehatchet`,          item = 'WEAPON_STONE_HATCHET',        rot = vector3(0,92.5,0) },
    [`WEAPON_WRENCH`]               = { object = `w_me_wrench`,                item = 'WEAPON_WRENCH',               rot = vector3(0,92.5,0) },
    [`WEAPON_CANDYCANE`]            = { object = `w_me_candy_xm3`,             item = 'WEAPON_CANDYCANE',            rot = vector3(0,92.5,0) },
}

local BONE_INDEX         = 24816
local BACKPACK_COMPONENT = 5

local slots = {
    [1] = { pos = vec3(0.14, -0.17,  0.0), entity = nil, hash = nil, wep = nil },
    [2] = { pos = vec3(0.14,  0.16,  0.0), entity = nil, hash = nil, wep = nil },
    [3] = { pos = vec3(0.14, -0.21,  0.0), entity = nil, hash = nil, wep = nil },
    [4] = { pos = vec3(0.14,  0.20,  0.0), entity = nil, hash = nil, wep = nil },
}

local backpackSnapshot = {}

-- ─────────────────────────────────────────
--  Helpers
-- ─────────────────────────────────────────

local function hasBackpack()
    return GetPedDrawableVariation(ped, BACKPACK_COMPONENT) ~= 0
end

local function safeDeleteEntity(entity)
    if entity and entity ~= 0 and DoesEntityExist(entity) then
        SetEntityAsMissionEntity(entity, false, false)
        NetworkRequestControlOfEntity(entity)
        DeleteEntity(entity)
    end
end

local function clearSlot(i)
    safeDeleteEntity(slots[i].entity)
    slots[i].entity = nil
    slots[i].hash   = nil
    slots[i].wep    = nil
end

local function clearAllSlots()
    for i = 1, #slots do clearSlot(i) end
end

local function checkForSlot(hash)
    for i = 1, #slots do
        if slots[i].hash == hash then return false end
    end
    for i = 1, #slots do
        if not slots[i].entity then return i end
    end
    return false
end

local function attachWeaponProp(slotIndex, hash)
    local wepData = Weapons[hash]
    lib.requestModel(wepData.object, 500)
    local coords  = GetEntityCoords(ped)
    local prop    = CreateObject(wepData.object, coords.x, coords.y, coords.z, true, true, true)
    local p       = slots[slotIndex].pos
    AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, BONE_INDEX),
        p.x, p.y, p.z,
        wepData.rot.x, wepData.rot.y, wepData.rot.z,
        true, true, false, true, 2, true)
    slots[slotIndex].entity = prop
    slots[slotIndex].hash   = hash
    slots[slotIndex].wep    = wepData.item
end

-- ─────────────────────────────────────────
--  Core
-- ─────────────────────────────────────────

local function putOnBack(hash)
    if not hash or not Weapons[hash] then return end
    if hasBackpack() then return end
    local slot = checkForSlot(hash)
    if not slot then return end
    attachWeaponProp(slot, hash)
end

local function removeFromSlot(hash)
    if not Weapons[hash] then return end
    local count = ox_inventory:Search(2, Weapons[hash].item)
    for i = 1, #slots do
        if slots[i].hash == hash and (not count or count <= 0 or hash == curWeapon) then
            clearSlot(i)
        end
    end
end

local function snapshotAndClear()
    backpackSnapshot = {}
    for i = 1, #slots do
        if slots[i].hash then
            backpackSnapshot[#backpackSnapshot + 1] = slots[i].hash
        end
    end
    clearAllSlots()
end

local function restoreFromSnapshot()
    for _, hash in ipairs(backpackSnapshot) do
        if hash ~= curWeapon then putOnBack(hash) end
    end
    backpackSnapshot = {}
end

local function loadInventoryWeapons()
    for hash, v in pairs(Weapons) do
        local count = ox_inventory:Search(2, v.item)
        if count and count >= 1 then putOnBack(hash) end
    end
end

-- ─────────────────────────────────────────
--  Events
-- ─────────────────────────────────────────

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then clearAllSlots() end
end)

AddEventHandler('ox_inventory:currentWeapon', function(data)
    if not LocalPlayer.state.isLoggedIn then return end
    if data then
        if Weapons[data.hash] then
            putOnBack(curWeapon)
            curWeapon = data.hash
            removeFromSlot(data.hash)
        end
    else
        if curWeapon then putOnBack(curWeapon) end
        curWeapon = nil
    end
end)

AddEventHandler('ox_inventory:updateInventory', function(changes)
    if not LocalPlayer.state.isLoggedIn then return end
    playerLoaded = true
    for _, v in pairs(changes) do
        if type(v) == 'table' then
            local hash = joaat(v.name)
            if Weapons[hash] then
                if curWeapon ~= hash then putOnBack(hash) else removeFromSlot(hash) end
            end
        elseif type(v) == 'boolean' then
            for i = 1, #slots do
                if slots[i].wep then
                    local count = ox_inventory:Search(2, slots[i].wep)
                    if not count or count <= 0 then clearSlot(i) end
                end
            end
        end
    end
end)

-- ─────────────────────────────────────────
--  Cache
-- ─────────────────────────────────────────

lib.onCache('ped', function(value) ped = value end)

lib.onCache('vehicle', function(value)
    if value then
        clearAllSlots()
    else
        if GetResourceState('ox_inventory') ~= 'started' or not playerLoaded then return end
        if #backpackSnapshot > 0 then restoreFromSnapshot() else loadInventoryWeapons() end
    end
end)

-- ─────────────────────────────────────────
--  Startup + integrity loop
-- ─────────────────────────────────────────

CreateThread(function()
    while not LocalPlayer.state.isLoggedIn do Wait(1000) end
    Wait(3000)

    for _, v in pairs(getPlayerItems()) do
        local hash = joaat(v.name)
        if Weapons[hash] then putOnBack(hash) end
    end

    local wasWearingBackpack = hasBackpack()

    while true do
        Wait(250)
        if not LocalPlayer.state.isLoggedIn then goto continue end

        local wearing = hasBackpack()

        if wearing ~= wasWearingBackpack then
            if wearing then snapshotAndClear() else restoreFromSnapshot() end
            wasWearingBackpack = wearing
        end

        if not wearing then
            for i, v in ipairs(slots) do
                if v.wep and v.hash then
                    local w        = Weapons[v.hash]
                    local exists   = v.entity and v.entity ~= 0 and DoesEntityExist(v.entity)
                    local attached = exists and IsEntityAttachedToEntity(v.entity, ped)
                    local valid    = attached and GetEntityModel(v.entity) == w.object

                    if not valid then
                        if exists and not attached then safeDeleteEntity(v.entity) end
                        lib.requestModel(w.object, 500)
                        local c    = GetEntityCoords(ped)
                        local prop = CreateObject(w.object, c.x, c.y, c.z, true, true, true)
                        slots[i].entity = prop
                        AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, BONE_INDEX),
                            v.pos.x, v.pos.y, v.pos.z,
                            w.rot.x, w.rot.y, w.rot.z,
                            true, true, false, true, 2, true)
                    end
                end
            end
        end

        ::continue::
    end
end)

-- ─────────────────────────────────────────
--  Debug
-- ─────────────────────────────────────────

RegisterCommand('propstuck', function()
    for _, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(v, ped) and v ~= GetCurrentPedWeaponEntityIndex(ped) then
            safeDeleteEntity(v)
        end
    end
end)

RegisterCommand('propdrop', function()
    for _, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(v, ped) and v ~= GetCurrentPedWeaponEntityIndex(ped) then
            DetachEntity(v)
        end
    end
end)