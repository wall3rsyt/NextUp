-- ╔══════════════════════════════════════╗
-- ║     0r-weaponReality  server.lua     ║
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

-- ┌─ Resource Start ─────────────────────┐
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    print(("^4[%s]^2[INFO]^7 Script started. ^6[FRAMEWORK:]^7 ^3%s^7")
        :format(resourceName, framework))

    if Config.WeaponAnimation == "always" then
        TriggerClientEvent('0r-weaponReality:weaponAnimation', -1, "xd")
    end
end)

-- ┌─ Weapon Thrown ──────────────────────┐
RegisterServerEvent('0r-weaponReality:weaponThrown')
AddEventHandler('0r-weaponReality:weaponThrown', function(pickupHash, finalCoords, weaponName, weaponThrewAwayHash)
    local src = source

    -- Generate a unique ID (not already in use)
    local randomWeaponID
    repeat
        randomWeaponID = math.random(100, 999)
    until not DroppedWeapons[randomWeaponID]

    DroppedWeapons[randomWeaponID] = {
        owner      = src,
        weaponHash = weaponThrewAwayHash,
        weaponName = weaponName,
    }

    TriggerClientEvent('0r-weaponReality:createOnClient', -1, pickupHash, finalCoords, weaponName, weaponThrewAwayHash, randomWeaponID)
end)