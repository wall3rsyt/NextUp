-- ╔══════════════════════════════════════╗
-- ║     0r-weaponReality  client.lua     ║
-- ╚══════════════════════════════════════╝

-- ┌─ Framework Init ─────────────────────┐
local framework = Config.Framework

if framework == "oldesx" then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif framework == "esx" then
    ESX = exports['es_extended']:getSharedObject()
elseif framework == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif framework == "oldqb" then
    QBCore = nil
    TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
end

-- ┌─ Constants & State ──────────────────┐
local RAD                = math.pi / 180
local savedWeaponPositions = {}
local weaponThrewAwayHash  = nil

local lastHitTime   = 0
local COOLDOWN_MS   = 2000

local keyPressed    = false
local weaponAdded   = false

-- Camera
local camtoggle     = false
local cam           = nil
local originalFov   = 50.0
local bekle         = 1000
local lastWeapon    = nil

-- Throw cooldown
local lastUsed      = 0

-- Laser flags
local creationLaser = false
local deletionLaser = false

-- ┌─ Helpers ────────────────────────────┐
local function isQB()  return framework == "qb"  or framework == "oldqb" end
local function isESX() return framework == "esx" or framework == "oldesx" end

local function RemoveWeaponFromInventory(weaponName, ped)
    local victimID = GetPlayerServerId(NetworkGetEntityOwner(ped))
    TriggerServerEvent('0r-weaponReality:weaponRemoveFromInventory', weaponName, victimID)
end

local function HideTextUI()
    if Config.PickUpMenu == "textui" then
        if Config.TextUI == "qb-textui" then
            exports['qb-core']:HideText()
        elseif Config.TextUI == "ox-textui" then
            exports['ox_lib']:hideTextUI()
        end
    end
end

local function ShowTextUI()
    if Config.PickUpMenu == "textui" then
        if Config.TextUI == "qb-textui" then
            exports['qb-core']:DrawText(Config.TakeWeaponText["TextUI"], 'left')
        elseif Config.TextUI == "ox-textui" then
            exports['ox_lib']:showTextUI(Config.TakeWeaponText["TextUI"])
        end
    end
end

local function RemoveWeaponPickup(weaponPos, pickup)
    RemovePickup(pickup)
    if weaponPos.pickup ~= pickup then
        RemovePickup(weaponPos.pickup)
    end
end

-- ┌─ Prop / Physics ─────────────────────┐
local function GetDirectionFromRotation(rotation)
    local rx = RAD * rotation.x
    local rz = RAD * rotation.z
    local cosX = math.abs(math.cos(rx))
    return vector3(
        -math.sin(rz) * cosX,
         math.cos(rz) * cosX,
         math.sin(rx)
    )
end

local function PerformPhysics(entity)
    FreezeEntityPosition(entity, false)
    local rot = GetGameplayCamRot(2)
    local dir = GetDirectionFromRotation(rot)
    SetEntityHeading(entity, rot.z + 90.0)
    SetEntityVelocity(entity, dir.x * 25, dir.y * 25, 25 * dir.z)
end

local function CreateProp(modelHash, ...)
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do Wait(0) end
    local obj = CreateObject(modelHash, ...)
    SetModelAsNoLongerNeeded(modelHash)
    return obj
end

-- ┌─ Drop Weapon Logic ──────────────────┐
local function DropWeapon(victim)
    local hit, bone = GetPedLastDamageBone(victim)
    if not hit then return end

    local currentTime = GetGameTimer()
    if currentTime - lastHitTime <= COOLDOWN_MS then return end
    lastHitTime = currentTime

    local handBones = { [18905]=true, [57005]=true, [28252]=true, [14201]=true, [24816]=true, [51826]=true }
    if not handBones[bone] then return end
    if not IsPedArmed(victim, 14) then return end

    local weapon      = GetSelectedPedWeapon(victim)
    local pedPosition = GetEntityCoords(victim)
    local pickupHash  = GetPickupHashFromWeapon(weapon)
    local weaponName  = Config.Weapons[tostring(weapon)]

    SetPedToRagdoll(victim, 1000, 1000, 0, 0, 0, 0)
    SetCurrentPedWeapon(victim, `WEAPON_UNARMED`, true)
    weaponThrewAwayHash = weapon

    if Config.Debug then
        print("{DROP WEAPON WHEN HIT} weapon: " .. weapon)
        print("{DROP WEAPON WHEN HIT} pickupHash: " .. pickupHash)
    end

    RemoveWeaponFromInventory(weaponName, victim)
    TriggerServerEvent('0r-weaponReality:weaponThrown', pickupHash, pedPosition, weaponName, weapon)
end

AddEventHandler("gameEventTriggered", function(name, args)
    if not Config.DropWeaponWhenHitHand then return end
    DropWeapon(args[1])
end)

-- ┌─ Pickup Loop ────────────────────────┐
CreateThread(function()
    while true do
        Wait(0)
        if #savedWeaponPositions == 0 then
            Wait(500)
        else
            local pedCoords = GetEntityCoords(PlayerPedId())
            local nearAny   = false

            for i, weaponPos in ipairs(savedWeaponPositions) do
                local dist = #(vector3(weaponPos.x, weaponPos.y, weaponPos.z) - pedCoords)

                if dist < 5.0 then
                    nearAny = true

                    if Config.PickUpMenu == "drawtext" then
                        DrawText3D(weaponPos.x, weaponPos.y, weaponPos.z - 1, Config.TakeWeaponText["DrawText"])
                    else
                        ShowTextUI()
                    end

                    if IsControlJustReleased(0, 38) then
                        ClearPedTasksImmediately(PlayerPedId())
                        FreezeEntityPosition(PlayerPedId(), true)
                        PlayAnim(PlayerPedId(), "pickup_object", "pickup_low", -8.0, 8.0, -1, 49, 1.0)
                        Wait(800)
                        ClearPedTasks(PlayerPedId())
                        FreezeEntityPosition(PlayerPedId(), false)
                        Wait(math.random(100, 1000))
                        TriggerServerEvent('0r-weaponReality:takeWeaponFromGround', weaponPos.pickup, weaponPos.realWeapon, weaponPos.randomWeaponID)
                    end
                end
            end

            if not nearAny then
                HideTextUI()
            end
        end
    end
end)

-- ┌─ Network Events ─────────────────────┐
RegisterNetEvent('0r-weaponReality:Notification')
AddEventHandler('0r-weaponReality:Notification', function(message)
    Notification(message)
end)

RegisterNetEvent("0r-weaponReality:createOnClient")
AddEventHandler("0r-weaponReality:createOnClient", function(pickupHash, finalCoords, weaponName, threwHash, randomWeaponID)
    local hash   = GetPickupHashFromWeapon(threwHash)
    local pickup = CreatePickupRotate(hash, finalCoords.x, finalCoords.y, finalCoords.z, 0, 0, 0, 8, 1, 1, true, threwHash)
    table.insert(savedWeaponPositions, {
        weapon       = hash,
        x            = finalCoords.x,
        y            = finalCoords.y,
        z            = finalCoords.z + 1,
        realWeapon   = weaponName,
        pickup       = pickup,
        randomWeaponID = randomWeaponID,
    })
end)

RegisterNetEvent('0r-weaponReality:takeWeaponFromGround:client')
AddEventHandler('0r-weaponReality:takeWeaponFromGround:client', function(pickup)
    HideTextUI()
    for i, weaponPos in ipairs(savedWeaponPositions) do
        if weaponPos.pickup == pickup then
            TriggerServerEvent('0r-weaponReality:takeWeaponFromGround', weaponPos.pickup, weaponPos.realWeapon)
            table.remove(savedWeaponPositions, i)
            RemoveWeaponPickup(weaponPos, pickup)
            break
        end
    end
end)

RegisterNetEvent("0r-weaponReality:DeleteOnClient")
AddEventHandler("0r-weaponReality:DeleteOnClient", function(pickup)
    for i, weaponPos in ipairs(savedWeaponPositions) do
        if weaponPos.pickup == pickup then
            table.remove(savedWeaponPositions, i)
            RemoveWeaponPickup(weaponPos, pickup)
            break
        end
    end
end)

-- ┌─ Throw Weapon ───────────────────────┐
local function ToggleCreationLaser()
    deletionLaser  = false
    creationLaser  = not creationLaser

    if not creationLaser then
        ClearPedTasks(PlayerPedId())
        return
    end

    -- Aim animation
    CreateThread(function()
        PlayAnim(PlayerPedId(), "weapons@first_person@aim_rng@generic@projectile@shared@core", "aim_med_loop", -8.0, 8.0, -1, 49)
    end)

    -- Laser loop
    CreateThread(function()
        local laserColor = { r = Config.Lasers["R"], g = Config.Lasers["G"], b = Config.Lasers["B"], a = Config.Lasers["A"] }

        while creationLaser do
            local hit, coords = DrawLaser(Config.Lasers["Text"], laserColor)

            if IsControlJustReleased(0, 38) then
                creationLaser = false

                if not hit then
                    Notification(Config.Notifications['tooLongDistance'].message)
                    break
                end

                local ped        = PlayerPedId()
                local weapon     = GetSelectedPedWeapon(ped)
                weaponThrewAwayHash = weapon

                SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)

                CreateThread(function()
                    PlayAnim(ped, "weapons@first_person@aim_rng@generic@projectile@shared@core", "throw_m_fb_stand", -8.0, 8.0, -1, 49)
                    Wait(1000)
                    ClearPedTasks(ped)
                end)

                Wait(550)

                local prop  = GetWeaponObjectFromPed(ped, true)
                local model = GetEntityModel(prop)
                RemoveWeaponFromPed(ped, weapon)
                DeleteEntity(prop)

                prop = CreateProp(model, coords.x, coords.y, coords.z, true, false, true)
                PerformPhysics(prop)

                -- Wait until prop stops moving
                local prevPos = GetEntityCoords(prop)
                repeat
                    Wait(500)
                    local newPos = GetEntityCoords(prop)
                    local moved  = Vdist2(prevPos.x, prevPos.y, prevPos.z, newPos.x, newPos.y, newPos.z) >= 0.1
                    prevPos = newPos
                until not moved

                local finalCoords = prevPos
                DeleteEntity(prop)

                local weaponName = Config.Weapons[tostring(weapon)]
                RemoveWeaponFromInventory(weaponName, ped)
                Notification(Config.Notifications['weaponThrown'].message)

                if Config.Debug then
                    print("{THROW WEAPON} weapon: " .. weapon)
                    print("{THROW WEAPON} pickupHash: " .. GetPickupHashFromWeapon(weapon))
                end

                TriggerServerEvent('0r-weaponReality:weaponThrown', GetPickupHashFromWeapon(weapon), finalCoords, weaponName, weapon)
                break
            end

            Wait(0)
        end
    end)
end

RegisterCommand("0r-weaponReality:ThrowWeapon", function()
    local currentTime = GetGameTimer() / 5000
    if currentTime - lastUsed < 1 then
        return Notification(Config.Notifications['toofast_throw'].message)
    end
    lastUsed = currentTime

    if not Config.ThrowWeapon then return end

    local ped = PlayerPedId()
    if IsPedArmed(ped, 14) then
        ToggleCreationLaser()
    else
        Notification(Config.Notifications['NoWeapon'].message)
    end
end)

RegisterKeyMapping('0r-weaponReality:ThrowWeapon', 'Throw Weapon', 'keyboard', Config.ThrowWeaponMenuOpenKey)

-- ┌─ Weapon Running Animation ───────────────┐
local JERRY_HASH = GetHashKey("weapon_petrolcan")

RegisterCommand("0r-weaponReality:ChangeWeaponRunningAnimation", function()
    if Config.WeaponAnimation == "always" then
        Notification(Config.Notifications['changedAnimationsAlways'].message)
        return
    end
    keyPressed = not keyPressed
    local msg = keyPressed and Config.Notifications['changedanimationsTrue'].message
                           or  Config.Notifications['changedanimationsFalse'].message
    Notification(msg)
end)

RegisterKeyMapping('0r-weaponReality:ChangeWeaponRunningAnimation', 'Change Weapon Running Animation', 'keyboard', Config.ChangeWeaponRunningAnimationKey)

CreateThread(function()
    while true do
        Wait(100)
        local ped      = PlayerPedId()
        local isAlways = Config.WeaponAnimation == "always"
        local isKey    = Config.WeaponAnimation == "key"
        local active   = isAlways or (isKey and keyPressed)

        -- Give & remove jerry can once to unlock clipset
        if active and not weaponAdded then
            GiveWeaponToPed(ped, JERRY_HASH, 0, false, true)
            RemoveWeaponFromPed(ped, JERRY_HASH)
            weaponAdded = true
        end

        if active then
            if IsPedArmed(ped, 4) then
                SetPedWeaponMovementClipset(ped, "move_ped_wpn_jerrycan_generic", 0.50)
            else
                ResetPedWeaponMovementClipset(ped, 0.0)
            end
        elseif isKey and not keyPressed then
            ResetPedWeaponMovementClipset(ped, 0.0)
        end
    end
end)

-- ┌─ Disabled World Pickups ─────────────┐
local disabledPickups = {
    `PICKUP_WEAPON_ADVANCEDRIFLE`,   `PICKUP_WEAPON_APPISTOL`,
    `PICKUP_WEAPON_ASSAULTRIFLE`,    `PICKUP_WEAPON_ASSAULTRIFLE_MK2`,
    `PICKUP_WEAPON_ASSAULTSHOTGUN`,  `PICKUP_WEAPON_ASSAULTSMG`,
    `PICKUP_WEAPON_AUTOSHOTGUN`,     `PICKUP_WEAPON_BAT`,
    `PICKUP_WEAPON_BATTLEAXE`,       `PICKUP_WEAPON_BOTTLE`,
    `PICKUP_WEAPON_BULLPUPRIFLE`,    `PICKUP_WEAPON_BULLPUPRIFLE_MK2`,
    `PICKUP_WEAPON_BULLPUPSHOTGUN`,  `PICKUP_WEAPON_CARBINERIFLE`,
    `PICKUP_WEAPON_CARBINERIFLE_MK2`,`PICKUP_WEAPON_COMBATMG`,
    `PICKUP_WEAPON_COMBATMG_MK2`,    `PICKUP_WEAPON_COMBATPDW`,
    `PICKUP_WEAPON_COMBATPISTOL`,    `PICKUP_WEAPON_COMPACTLAUNCHER`,
    `PICKUP_WEAPON_COMPACTRIFLE`,    `PICKUP_WEAPON_CROWBAR`,
    `PICKUP_WEAPON_DAGGER`,          `PICKUP_WEAPON_DBSHOTGUN`,
    `PICKUP_WEAPON_DOUBLEACTION`,    `PICKUP_WEAPON_FIREWORK`,
    `PICKUP_WEAPON_FLAREGUN`,        `PICKUP_WEAPON_FLASHLIGHT`,
    `PICKUP_WEAPON_GRENADE`,         `PICKUP_WEAPON_GRENADELAUNCHER`,
    `PICKUP_WEAPON_GUSENBERG`,       `PICKUP_WEAPON_GolfClub`,
    `PICKUP_WEAPON_HAMMER`,          `PICKUP_WEAPON_HATCHET`,
    `PICKUP_WEAPON_HEAVYPISTOL`,     `PICKUP_WEAPON_HEAVYSHOTGUN`,
    `PICKUP_WEAPON_HEAVYSNIPER`,     `PICKUP_WEAPON_HEAVYSNIPER_MK2`,
    `PICKUP_WEAPON_HOMINGLAUNCHER`,  `PICKUP_WEAPON_KNIFE`,
    `PICKUP_WEAPON_KNUCKLE`,         `PICKUP_WEAPON_MACHETE`,
    `PICKUP_WEAPON_MACHINEPISTOL`,   `PICKUP_WEAPON_MARKSMANPISTOL`,
    `PICKUP_WEAPON_MARKSMANRIFLE`,   `PICKUP_WEAPON_MARKSMANRIFLE_MK2`,
    `PICKUP_WEAPON_MG`,              `PICKUP_WEAPON_MICROSMG`,
    `PICKUP_WEAPON_MINIGUN`,         `PICKUP_WEAPON_MINISMG`,
    `PICKUP_WEAPON_MOLOTOV`,         `PICKUP_WEAPON_MUSKET`,
    `PICKUP_WEAPON_NIGHTSTICK`,      `PICKUP_WEAPON_PETROLCAN`,
    `PICKUP_WEAPON_PIPEBOMB`,        `PICKUP_WEAPON_PISTOL`,
    `PICKUP_WEAPON_PISTOL50`,        `PICKUP_WEAPON_PISTOL_MK2`,
    `PICKUP_WEAPON_POOLCUE`,         `PICKUP_WEAPON_PROXMINE`,
    `PICKUP_WEAPON_PUMPSHOTGUN`,     `PICKUP_WEAPON_PUMPSHOTGUN_MK2`,
    `PICKUP_WEAPON_RAILGUN`,         `PICKUP_WEAPON_RAYCARBINE`,
    `PICKUP_WEAPON_RAYMINIGUN`,      `PICKUP_WEAPON_RAYPISTOL`,
    `PICKUP_WEAPON_REVOLVER`,        `PICKUP_WEAPON_REVOLVER_MK2`,
    `PICKUP_WEAPON_RPG`,             `PICKUP_WEAPON_SAWNOFFSHOTGUN`,
    `PICKUP_WEAPON_SMG`,             `PICKUP_WEAPON_SMG_MK2`,
    `PICKUP_WEAPON_SMOKEGRENADE`,    `PICKUP_WEAPON_SNIPERRIFLE`,
    `PICKUP_WEAPON_SNSPISTOL`,       `PICKUP_WEAPON_SNSPISTOL_MK2`,
    `PICKUP_WEAPON_SPECIALCARBINE`,  `PICKUP_WEAPON_SPECIALCARBINE_MK2`,
    `PICKUP_WEAPON_STICKYBOMB`,      `PICKUP_WEAPON_STONE_HATCHET`,
    `PICKUP_WEAPON_STUNGUN`,         `PICKUP_WEAPON_SWITCHBLADE`,
    `PICKUP_WEAPON_VINTAGEPISTOL`,   `PICKUP_WEAPON_WRENCH`,
}

CreateThread(function()
    local playerID = PlayerId()
    for _, hash in ipairs(disabledPickups) do
        ToggleUsePickupsForPlayer(playerID, hash, false)
    end
end)

-- ┌─ Shoulder Swap Camera ───────────────┐
local function ChangeCameraRotation()
    while camtoggle do
        Wait(1)
        SetCamRot(cam, GetEntityRotation(PlayerPedId(), 2), 2)
    end
end

local function ToggleCamera()
    local ped = PlayerPedId()
    DisableControlAction(0, 0)

    if not (IsPedArmed(ped, 14) and IsPlayerFreeAiming(PlayerId())) then return end

    SetBlackout(false)

    if camtoggle then
        SetCamActive(cam, false)
        RenderScriptCams(false, true, 500, true, true)
        SetCamFov(cam, originalFov)
        camtoggle = false
    else
        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
        AttachCamToPedBone(cam, ped, 31086, -0.3, -1.2, 0.1, GetEntityHeading(ped))
        SetCamAffectsAiming(cam, false)
        SetCamFov(cam, originalFov)
        RenderScriptCams(true, true, 500, true, true)
        camtoggle = true
        ChangeCameraRotation()
    end
end

RegisterCommand("shoulderSwap", function()
    if Config.ShoulderSwap then
        ToggleCamera()
    else
        Notification(Config.Notifications['shoulderSwapDisabled'].message)
    end
end, false)

RegisterKeyMapping("shoulderSwap", "Shoulder Swap", "keyboard", Config.DefaultShoulderSwapKey)

CreateThread(function()
    while true do
        SetBlackout(false)
        Wait(bekle)
        local ped = PlayerPedId()

        if IsPlayerFreeAiming(PlayerId()) then
            bekle = 0
            local currentWeapon = GetSelectedPedWeapon(ped)
            if currentWeapon ~= lastWeapon then
                lastWeapon = currentWeapon
            end
            if IsControlJustPressed(0, 246) then
                ToggleCamera()
            end
        else
            bekle = 1000
            camtoggle = false
            if cam ~= nil then
                SetCamActive(cam, false)
                RenderScriptCams(false, true, 500, true, true)
                SetCamFov(cam, originalFov)
            end
        end
    end
end)

-- ┌─ Drop Weapon On Death ───────────────┐
AddEventHandler('baseevents:onPlayerDied', function()
    if not Config.WhenDeadDropGun then return end

    local ped = PlayerPedId()
    if not IsPedArmed(ped, 14) then
        if Config.Debug then print("{DROP WEAPON WHEN DIE} Died without weapon.") end
        return
    end

    local weapon      = GetSelectedPedWeapon(ped)
    local pedPosition = GetEntityCoords(ped)
    local pickupHash  = GetPickupHashFromWeapon(weapon)
    local weaponName  = Config.Weapons[tostring(weapon)]

    SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
    weaponThrewAwayHash = weapon

    RemoveWeaponFromInventory(weaponName, ped)

    if Config.Debug then
        print("{DROP WEAPON WHEN DIE} weapon: " .. weapon)
        print("{DROP WEAPON WHEN DIE} pickupHash: " .. pickupHash)
    end

    TriggerServerEvent('0r-weaponReality:weaponThrown', pickupHash, pedPosition, weaponName, weapon)
end)

-- ┌─ Debug Command ──────────────────────┐
RegisterCommand("checkSpotsAdmin", function()
    if Config.Debug then
        Notification(Config.Notifications['checkSpotsAdmin'].message)
        print(json.encode(savedWeaponPositions))
    end
end)