-- ╔══════════════════════════════════════╗
-- ║  0r-weaponReality  server_noescrow  ║
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

-- ┌─ State ──────────────────────────────┐
DroppedWeapons = {}

-- ┌─ Helpers ────────────────────────────┐
local function isQB()  return framework == "qb" or framework == "oldqb"  end
local function isESX() return framework == "esx" or framework == "oldesx" end

local function GetPlayer(src)
    if isQB()  then return QBCore.Functions.GetPlayer(src) end
    if isESX() then return ESX.GetPlayerFromId(src) end
end

-- Adds a weapon to a player's inventory based on configured system
local function AddWeaponToInventory(src, xPlayer, weaponName)
    local inv = Config.Inventory

    if Config.NewQBInventory then
        local serie = tostring(
            QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) ..
            QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) ..
            QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4)
        )
        xPlayer.Functions.AddItem(weaponName, 1, false, { serie = serie, quality = 100 })
        return
    end

    if inv == "qb-inventory" or inv == "lj-inventory" then
        xPlayer.Functions.AddItem(weaponName, 1)
    elseif inv == "ox-inventory" then
        exports['ox_inventory']:AddItem(src, weaponName, 1)
    elseif inv == "qs-inventory" then
        exports['qs-inventory']:AddItem(src, weaponName, 1)
    elseif inv == "esx-inventory" then
        xPlayer.addWeapon(weaponName, 1)
    else
        print("[0r-weaponReality] Unsupported inventory: " .. tostring(inv))
    end
end

-- Removes a weapon from a player's inventory based on configured system
local function RemoveWeaponFromInventory(src, xPlayer, weaponName)
    local inv = Config.Inventory

    if isQB() then
        if inv == "qb-inventory" or inv == "lj-inventory" then
            xPlayer.Functions.RemoveItem(weaponName, 1)
        elseif inv == "ox-inventory" then
            exports['ox_inventory']:RemoveItem(src, weaponName, 1)
        elseif inv == "qs-inventory" then
            xPlayer.Functions.RemoveItem(string.lower(weaponName), 1)
        end
    elseif isESX() then
        if inv == "qb-inventory" or inv == "lj-inventory" then
            xPlayer.Functions.RemoveItem(weaponName, 1)
        elseif inv == "ox-inventory" then
            exports['ox_inventory']:RemoveItem(src, weaponName, 1)
        elseif inv == "qs-inventory" then
            exports['qs-inventory']:RemoveItem(src, string.lower(weaponName), 1)
        elseif inv == "esx-inventory" then
            xPlayer.removeWeapon(weaponName)
        end
    end
end

-- ┌─ Take Weapon From Ground ────────────┐
RegisterServerEvent('0r-weaponReality:takeWeaponFromGround')
AddEventHandler('0r-weaponReality:takeWeaponFromGround', function(pickup, weaponName, weaponRandomID)
    local src = source

    if not DroppedWeapons[weaponRandomID] then
        TriggerClientEvent('0r-weaponReality:Notification', src, "It's Too Late.")
        return
    end

    local xPlayer = GetPlayer(src)
    if not xPlayer then
        print("[0r-weaponReality] takeWeaponFromGround: xPlayer not found for src " .. tostring(src))
        return
    end

    TriggerClientEvent('0r-weaponReality:Notification', src, "You picked up a weapon: " .. weaponName)
    TriggerClientEvent('0r-weaponReality:DeleteOnClient', -1, pickup)

    AddWeaponToInventory(src, xPlayer, weaponName)
    DroppedWeapons[weaponRandomID] = nil
end)

-- ┌─ Remove Weapon From Inventory ───────┐
RegisterServerEvent('0r-weaponReality:weaponRemoveFromInventory')
AddEventHandler('0r-weaponReality:weaponRemoveFromInventory', function(weaponName, victimID)
    local xPlayer = GetPlayer(victimID)
    if not xPlayer then
        print("[0r-weaponReality] weaponRemoveFromInventory: xPlayer not found for id " .. tostring(victimID))
        return
    end

    RemoveWeaponFromInventory(victimID, xPlayer, weaponName)
end)