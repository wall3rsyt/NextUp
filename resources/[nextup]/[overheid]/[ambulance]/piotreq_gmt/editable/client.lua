GMT.Editable = {}

-- ================================================
--   FRAMEWORK INITIALISATIE
-- ================================================

local frameworkObj = nil

if Config.Framework == 'ESX' then
    frameworkObj = exports['es_extended']:getSharedObject()
elseif Config.Framework == 'QB' then
    frameworkObj = exports['qb-core']:GetCoreObject()
end

-- ================================================
--   SPELER JOB OPHALEN
-- ================================================

GMT.Editable.GetPlayerJob = function()
    if Config.Framework == 'ESX' then
        return frameworkObj.GetPlayerData().job

    elseif Config.Framework == 'QB' then
        local playerJob = frameworkObj.Functions.GetPlayerData().job
        if not playerJob then return nil end
        return {
            name  = playerJob.name,
            grade = tonumber(playerJob.grade.level),
            label = playerJob.label,
        }

    elseif Config.Framework == 'QBOX' then
        local playerJob = exports['qbx_core']:GetPlayerData().job
        if not playerJob then return nil end
        return {
            name  = playerJob.name,
            grade = tonumber(playerJob.grade.level),
            label = playerJob.label,
        }
    end
end

-- ================================================
--   NOTIFICATIES
-- ================================================

GMT.Editable.Notify = function(text, type)
    lib.notify({
        title       = 'Melding',
        description = text,
        type        = type or 'inform'
    })
end

-- ================================================
--   SPELER IDENTIFIER
-- ================================================

GMT.Editable.GetPlayerIdentifier = function()
    return lib.callback.await('piotreq_gmt/getPlayerIdentifier', false)
end

-- ================================================
--   VOERTUIG SPAWNEN
-- ================================================

GMT.Editable.SpawnVehicle = function(model, coords, heading, cb)
    lib.requestModel(model)
    local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, heading, true, false)
    while not DoesEntityExist(vehicle) do
        Wait(0)
    end
    cb(vehicle)
end

-- ================================================
--   VOERTUIG PROPERTIES
-- ================================================

GMT.Editable.SetVehProperties = function(vehicle, properties)
    lib.setVehicleProperties(vehicle, properties)
end

-- ================================================
--   SPAWN PUNT VRIJ CONTROLEREN
-- ================================================

GMT.Editable.IsPointClear = function(coords, dist)
    local vehicles = lib.getNearbyVehicles(vector3(coords.x, coords.y, coords.z), dist, false)
    return #vehicles == 0
end

-- ================================================
--   KENTEKEN FORMATTEREN
-- ================================================

GMT.Editable.FormatPlate = function(plateFormat)
    return plateFormat:format(math.random(111111, 999999))
end

-- ================================================
--   KEYBIND - MELDINGEN OPENEN
-- ================================================

lib.addKeybind({
    name        = 'Medic_Dispatch',
    description = locale('reports'),
    defaultKey  = 'DELETE',
    onPressed   = function()
        OpenDispatch()
    end,
})