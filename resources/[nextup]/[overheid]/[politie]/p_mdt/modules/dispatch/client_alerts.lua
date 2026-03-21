while not Config?.Dispatch do
    Citizen.Wait(100)
end

if Config.Dispatch.disableDispatch then
    return
end

Alerts = {}

---@type number
Alerts.antiSpam = {
    ['shooting'] = GetGameTimer() + 5000 -- to avoid alert on server join
}

---@type boolean
Alerts.inIgnoredZone = false

-- For testing purposes, enable debug mode in p_bridge config, you will see all zones
---@type table<number, {coords: vector3, size: vector3}>
Alerts.IgnoredShootingZones = {
    {
        coords = vec3(13.7427, -1097.2809, 29.8347),
        size = vec3(10.0, 10.0, 10.0),
        rotation = 0.0
    }
}

Alerts.IgnoredWeapons = {
    [`WEAPON_UNARMED`] = true,
    [`WEAPON_PETROLCAN`] = true,
    [`WEAPON_FLARE`] = true,
    [`WEAPON_FIREEXTINGUISHER`] = true,
    [`WEAPON_SNOWBALL`] = true,
    [`WEAPON_BALL`] = true,
    [`WEAPON_SMOKEGRENADE`] = true,
    [`WEAPON_STICKYBOMB`] = true,
}

function Alerts:initZones()
    for _, zone in ipairs(self.IgnoredShootingZones) do
        lib.zones.box({
            coords = zone.coords,
            size = zone.size,
            rotation = zone.rotation or 0.0,
            debug = Bridge?.Config?.Debug,
            onEnter = function()
                self.inIgnoredZone = true
            end,
            onExit = function()
                self.inIgnoredZone = false
            end
        })
    end
end

function Alerts:hasIgnoredWeapon()
    local weaponHash = GetSelectedPedWeapon(cache.ped)
    return self.IgnoredWeapons[weaponHash] or false
end

AddEventHandler('CEventGunShot', function(witnesses, ped)
    if not Config.Dispatch.defaultAlerts['shooting'] then return end
    if ped ~= cache.ped then return end
    if IsPedCurrentWeaponSilenced(cache.ped) then return end
    if witnesses and not lib.table.contains(witnesses, cache.ped) then return end
    if Alerts.inIgnoredZone or Alerts:hasIgnoredWeapon() then return end
    if Alerts.antiSpam['shooting'] and Alerts.antiSpam['shooting'] > GetGameTimer() then return end
    if not IsPedShooting(cache.ped) then return end

    if GetResourceState('nass_paintball') == 'started' then
        if exports['nass_paintball']:inGame() then return end
    end

    if GetResourceState('pug-paintball') == 'started' then
        if exports["pug-paintball"]:IsInPaintball() then return end
    end
        
    if GetResourceState('brutal_paintball') == 'started' then
        if exports.brutal_paintball:isInPaintball() then return end
    end

    if GetResourceState('0r-paintball-v2') == 'started' then
        if exports['0r-paintball-v2']:inGame() then return end
    end

    if GetResourceState('qs-deathmatch') == 'started' then
        if exports['qs-deathmatch']:IsPlayerInDM() then return end
    end

    if not Bridge?.Config?.Debug then
        local playerJob = Bridge.Framework.fetchPlayerJob()
        if Config.Departments[playerJob.name] then
            return -- do not send shooting alert if player is police
        end
    end

    Alerts.antiSpam['shooting'] = GetGameTimer() + 10000 -- 10 sec anti spam for shooting alert
    local coords = GetEntityCoords(cache.ped)
    TriggerServerEvent('p_mdt/createAlert', {
        priority = 'medium',
        code = '10-71',
        title = cache.vehicle and locale('vehicleshotsfired') or locale('shooting'),
        description = locale('shooting_description'),
        street = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z)),
        coords = coords,
        blip = {
            sprite = 110,
            color = 1,
            scale = 1.0,
            pulseBlip = false
        },
        alertTime = 180, -- seconds
        sound = 'shots_fired' -- custom sound from web/assets/sounds
    })
end)

AddEventHandler('CEventPedJackingMyVehicle', function(_, ped)
    if ped ~= cache.ped then return end
    if not Config.Dispatch.defaultAlerts['carjacking'] then return end
    if Alerts.antiSpam['carjacking'] and Alerts.antiSpam['carjacking'] > GetGameTimer() then return end

    if not Bridge?.Config?.Debug then
        local playerJob = Bridge.Framework.fetchPlayerJob()
        if Config.Departments[playerJob.name] then
            return -- do not send shooting alert if player is police
        end
    end

    Alerts.antiSpam['carjacking'] = GetGameTimer() + 5000 -- 5 sec anti spam for carjacking alert
    local vehicle = GetVehiclePedIsUsing(ped, true)
    local coords = GetEntityCoords(cache.ped)
    TriggerServerEvent('p_mdt/createAlert', {
        priority = 'low',
        code = '10-65',
        title = locale('carjacking'),
        description = locale('carjacking_description'),
        street = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z)),
        coords = coords,
        blip = {
            sprite = 225,
            color = 5,
            scale = 1.0,
            pulseBlip = true
        },
        fields = {
            {
                label = locale('model'),
                value = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))),
                icon = 'fa-light fa-car'
            }
        },
        alertTime = 180, -- seconds
    })
end)

AddEventHandler('CEventShockingCarAlarm', function(_, ped)
    if ped ~= cache.ped then return end
    if not Config.Dispatch.defaultAlerts['vehicletheft'] then return end
    if Alerts.antiSpam['vehicletheft'] and Alerts.antiSpam['vehicletheft'] > GetGameTimer() then return end

    if not Bridge?.Config?.Debug then
        local playerJob = Bridge.Framework.fetchPlayerJob()
        if Config.Departments[playerJob.name] then
            return -- do not send shooting alert if player is police
        end
    end

    Alerts.antiSpam['vehicletheft'] = GetGameTimer() + 5000 -- 5 sec anti spam for vehicletheft alert
    local vehicle = GetVehiclePedIsUsing(ped, true)
    local coords = GetEntityCoords(cache.ped)
    TriggerServerEvent('p_mdt/createAlert', {
        priority = 'low',
        code = '10-66',
        title = locale('vehicletheft'),
        description = locale('vehicletheft_description'),
        street = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z)),
        coords = coords,
        blip = {
            sprite = 225,
            color = 5,
            scale = 1.0,
            pulseBlip = true
        },
        fields = {
            {
                label = locale('model'),
                value = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))),
                icon = 'fa-light fa-car'
            }
        },
        alertTime = 180, -- seconds
    })
end)

CreateThread(function()
    Alerts:initZones()
end)