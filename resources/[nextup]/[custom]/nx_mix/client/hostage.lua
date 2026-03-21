-- nx_merged | hostage.lua (client)

-- Pre-compute weapon hashes
local allowedWeapons = {}
for _, name in ipairs(Config.hostage_weapons) do
    allowedWeapons[#allowedWeapons + 1] = GetHashKey(name)
end

local hostage = {
    active   = false,
    type     = '',
    target   = -1,
    agressor = { dict = 'anim@gangops@hostage@', anim = 'perp_idle',   flag = 49 },
    victim   = { dict = 'anim@gangops@hostage@', anim = 'victim_idle', flag = 49,
                 attachX = -0.24, attachY = 0.11, attachZ = 0.0 },
}

local HOSTAGE_CONTROLS = {21,24,25,47,58,263,264,257,140,141,142,143,75,22,32,268,33,269,34,270,35,271}

-- Teksten direct als locals zodat locale() niet faalt
local TXT_NEED_GUN      = 'Je hebt een geladen wapen nodig.'
local TXT_NOBODY_NEAR   = 'Er is niemand in de buurt.'
local TXT_KILL_LET      = '[G] Vrijlaten  |  [H] Executeren'
local TXT_HOSTAGE       = 'Je bent gegijzeld.'
local TXT_TITLE         = 'Gijzeling'
local TXT_TARGET        = 'Gijzelen'

-- ─── Helpers ────────────────────────────────────────────────────────────────

local function getClosestPlayer(radius)
    local myPed    = PlayerPedId()
    local myCoords = GetEntityCoords(myPed)
    local closest, closestDist = nil, radius + 1

    for _, id in ipairs(GetActivePlayers()) do
        local targetPed = GetPlayerPed(id)
        if targetPed ~= myPed then
            local dist = #(GetEntityCoords(targetPed) - myCoords)
            if dist < closestDist then
                closest     = id
                closestDist = dist
            end
        end
    end
    return closest
end

local function ensureAnimDict(dict)
    if HasAnimDictLoaded(dict) then return end
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) end
end

local function stopHostage()
    hostage.active = false
    hostage.type   = ''
    hostage.target = -1
end

local function notify(ntype, msg)
    lib.notify({ type = ntype, title = TXT_TITLE, description = msg, position = 'bottom' })
end

-- ─── Take hostage ───────────────────────────────────────────────────────────

local function startHostage(targetEntity)
    if hostage.active then return end

    local ped = PlayerPedId()
    ClearPedSecondaryTask(ped)
    DetachEntity(ped, true, false)

    local foundWeapon
    for _, hash in ipairs(allowedWeapons) do
        if HasPedGotWeapon(ped, hash, false) and GetAmmoInPedWeapon(ped, hash) > 0 then
            foundWeapon = hash
            break
        end
    end

    if not foundWeapon then
        notify('error', TXT_NEED_GUN)
        return
    end

    local targetSrc
    if targetEntity then
        targetSrc = GetPlayerServerId(NetworkGetPlayerIndexFromPed(targetEntity))
    else
        local closest = getClosestPlayer(1.0)
        if closest then targetSrc = GetPlayerServerId(closest) end
    end

    if not targetSrc or targetSrc == -1 then
        notify('error', TXT_NOBODY_NEAR)
        return
    end

    SetCurrentPedWeapon(ped, foundWeapon, true)
    hostage.active = true
    hostage.target = targetSrc
    hostage.type   = 'agressor'

    TriggerServerEvent('TakeHostage:sync', targetSrc)
    ensureAnimDict(hostage.agressor.dict)
end

-- ─── Net Events ─────────────────────────────────────────────────────────────

RegisterNetEvent('TakeHostage:client:hostage')
AddEventHandler('TakeHostage:client:hostage', function() startHostage(nil) end)

RegisterNetEvent('gp_hostage:takeHostage')
AddEventHandler('gp_hostage:takeHostage', function() startHostage(nil) end)

RegisterNetEvent('gp_hostage:takeHostageTarget')
AddEventHandler('gp_hostage:takeHostageTarget', function(data) startHostage(data.entity) end)

RegisterNetEvent('TakeHostage:syncTarget')
AddEventHandler('TakeHostage:syncTarget', function(target)
    hostage.active = true
    hostage.type   = 'hostage'
    ensureAnimDict(hostage.victim.dict)
    local v = hostage.victim
    AttachEntityToEntity(
        PlayerPedId(),
        GetPlayerPed(GetPlayerFromServerId(target)),
        0,
        v.attachX, v.attachY, v.attachZ,
        0.0, 0.0, 0.0,
        false, false, false, false, 2, false
    )
end)

RegisterNetEvent('TakeHostage:releaseHostage')
AddEventHandler('TakeHostage:releaseHostage', function()
    stopHostage()
    local ped = PlayerPedId()
    DetachEntity(ped, true, false)
    ensureAnimDict('reaction@shove')
    TaskPlayAnim(ped, 'reaction@shove', 'shoved_back', 8.0, -8.0, -1, 0, 0, false, false, false)
    Wait(250)
    ClearPedSecondaryTask(ped)
end)

RegisterNetEvent('TakeHostage:killHostage')
AddEventHandler('TakeHostage:killHostage', function()
    stopHostage()
    local ped = PlayerPedId()
    SetEntityHealth(ped, 0)
    DetachEntity(ped, true, false)
    ensureAnimDict('anim@gangops@hostage@')
    TaskPlayAnim(ped, 'anim@gangops@hostage@', 'victim_fail', 8.0, -8.0, -1, 168, 0, false, false, false)
end)

RegisterNetEvent('TakeHostage:cl_stop')
AddEventHandler('TakeHostage:cl_stop', function()
    stopHostage()
    local ped = PlayerPedId()
    ClearPedSecondaryTask(ped)
    DetachEntity(ped, true, false)
end)

-- ─── Anim loop ───────────────────────────────────────────────────────────────

CreateThread(function()
    while true do
        local t = hostage.type
        if t ~= '' then
            local role = t == 'agressor' and hostage.agressor or hostage.victim
            local ped  = PlayerPedId()
            if not IsEntityPlayingAnim(ped, role.dict, role.anim, 3) then
                TaskPlayAnim(ped, role.dict, role.anim, 8.0, -8.0, 100000, role.flag, 0, false, false, false)
            end
            Wait(0)
        else
            Wait(500)
        end
    end
end)

-- ─── Control / UI loop ───────────────────────────────────────────────────────

CreateThread(function()
    local uiShown = false

    while true do
        local t      = hostage.type
        local active = t ~= ''

        if t == 'agressor' then
            local ped = PlayerPedId()
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 47, true)
            DisableControlAction(0, 58, true)
            DisableControlAction(0, 21, true)
            DisablePlayerFiring(ped, true)

            if IsEntityDead(ped) or IsDisabledControlJustPressed(0, 47) then
                local target = hostage.target
                stopHostage()
                ensureAnimDict('reaction@shove')
                TaskPlayAnim(ped, 'reaction@shove', 'shove_var_a', 8.0, -8.0, -1, 168, 0, false, false, false)
                TriggerServerEvent('TakeHostage:releaseHostage', target)

            elseif IsDisabledControlJustPressed(0, 74) then
                local target = hostage.target
                ensureAnimDict('anim@gangops@hostage@')
                TaskPlayAnim(ped, 'anim@gangops@hostage@', 'perp_fail', 8.0, -8.0, -1, 168, 0, false, false, false)
                TriggerServerEvent('TakeHostage:killHostage', target)
                TriggerServerEvent('TakeHostage:stop', target)
                stopHostage()
                Wait(100)
                SetPedShootsAtCoord(ped, 0.0, 0.0, 0.0, false)
            end

        elseif t == 'hostage' then
            for _, control in ipairs(HOSTAGE_CONTROLS) do
                DisableControlAction(0, control, true)
            end
            DisableControlAction(27, 75, true)
        end

        -- UI tonen/verbergen alleen bij state change
        if active and not uiShown then
            uiShown = true
            lib.showTextUI(t == 'agressor' and TXT_KILL_LET or TXT_HOSTAGE, {
                icon     = 'fa-solid fa-handcuffs',
                style    = { borderRadius = 10, backgroundColor = '#1971C2', color = 'white' }
            })
        elseif not active and uiShown then
            uiShown = false
            lib.hideTextUI()
        end

        Wait(active and 0 or 500)
    end
end)

-- ─── ox_target ──────────────────────────────────────────────────────────────

CreateThread(function()
    Wait(100)
    exports.ox_target:addGlobalPlayer({
        {
            name        = 'gijzelen',
            event       = 'gp_hostage:takeHostageTarget',
            icon        = 'fa-solid fa-handcuffs',
            label       = TXT_TARGET,
            canInteract = function(entity)
                return entity ~= PlayerPedId() and not hostage.active
            end,
        }
    })
end)