if GetResourceState('qb-inventory') ~= 'started' or GetResourceState('jpr-inventory') == 'started' then return end


local QBCore = exports['qb-core']:GetCoreObject()
Inventory = {
    getItemCount = function(playerId, itemName)
        return exports['qb-inventory']:GetItemCount(playerId, itemName)
    end,
    addPlayerItem = function(playerId, itemName, itemCount, metadata, slot)
        exports['qb-inventory']:AddItem(playerId, itemName, itemCount, slot, metadata)
    end,
    removePlayerItem = function(playerId, itemName, itemCount, metadata, slot)
        exports['qb-inventory']:RemoveItem(playerId, itemName, itemCount, slot)
    end,
    registerStash = function(name, label, slots, weight, owner, job, coords)
    end,
    getInventoryItems = function(playerId)
        local Player = QBCore.Functions.GetPlayer(playerId)
        local items = Player.PlayerData.items
        for i = 1, #items do
            if items[i] and items[i].info then
                items[i].metadata = items[i].info
            end
            if items[i] and items[i].amount then
                items[i].count = items[i].amount
            end
        end
        return items
    end,
    clearInventory = function(inventory, keep)
        if type(inventory) == 'string' then
            exports['qb-inventory']:ClearStash(inventory)
        else
            exports['qb-inventory']:ClearInventory(inventory)
        end
    end,
    getItemSlot = function(playerId, slot)
        local itemSlot = exports['qb-inventory']:GetItemBySlot(playerId, slot)
        itemSlot.metadata = itemSlot.info
        return itemSlot
    end,
    registerShop = function(shopName, shopData)
        for i = 1, #shopData.inventory, 1 do
            shopData.inventory[i].amount = 9999
        end
        exports['qb-inventory']:CreateShop({
            name = shopName,
            label = shopData.label,
            slots = #shopData.inventory,
            items = shopData.inventory
        })
    end,
    addStashItem = function(stashData, itemName, itemCount, metadata, slot)
        exports['qb-inventory']:AddItem(stashData.id..'_'..stashData.owner, itemName, itemCount, slot, metadata)
    end,
}

lib.callback.register('p_policejob/inventory/getItemCount', function(source, itemName)
    return Inventory.getItemCount(source, itemName)
end)

RegisterNetEvent('p_policejob/inventory/openInventory', function(invType, data)
    if invType == 'shop' then
        exports['qb-inventory']:OpenShop(source, data.type)
    elseif invType == 'player' then
        exports['qb-inventory']:OpenInventoryById(source, data)
    else
        exports['qb-inventory']:OpenInventory(source, data)
    end
end)

local itemsFunctions = {
    ['evidence_camera'] = function(playerId)
        TriggerClientEvent('p_policejob/client/evidence/useEvidenceCamera', playerId)
    end,
    ['fingerprint_scanner'] = function(playerId)
        TriggerClientEvent('p_policejob/client/evidence/useScanner', playerId)
    end,
    ['police_rappel'] = function(playerId)
        TriggerClientEvent('p_policejob/client/heli/usePoliceRappel', playerId)
    end,
    ['megaphone'] = function(playerId)
        TriggerClientEvent('p_policejob/client_megaphone/useMegaphone', playerId)
    end,
    ['handcuffs'] = function(playerId)
        TriggerClientEvent('p_policejob/useHandcuffs', playerId)
    end,
    ['photo'] = function(playerId, item)
        TriggerClientEvent('p_policejob/client_camera/ShowPhoto', playerId, item.info.photoURL)
    end,
    ['camera'] = function(playerId)
        TriggerClientEvent('p_policejob/client_camera/useCamera', playerId)
    end,
    ['gps'] = function(playerId, item)
        TriggerClientEvent('p_policejob/client_gps/UseGPS', playerId)
    end,
    ['body_cam'] = function(playerId, item)
        exports['p_policejob']:useBodyCamItem(playerId)
    end,
    ['vest_strong'] = function(playerId, item)
        TriggerClientEvent('p_policejob/use_vest/vest_strong', playerId)
        Inventory.removePlayerItem(playerId, item.name, 1)
    end,
    ['vest_normal'] = function(playerId, item)
        TriggerClientEvent('p_policejob/use_vest/vest_normal', playerId)
        Inventory.removePlayerItem(playerId, item.name, 1)
    end,
    ['player_clothes'] = function(playerId, item)
        local result = lib.callback.await('p_policejob/client_divingsuit/UseClothes', playerId)
        if result then
            Inventory.removePlayerItem(playerId, item.name, 1)
            Inventory.addPlayerItem(playerId, 'police_diving_suit', 1)
        end
    end,
    ['police_diving_suit'] = function(playerId, item)
        local result = lib.callback.await('p_policejob/client_divingsuit/UseSuit', playerId)
        if result then
            Inventory.removePlayerItem(playerId, item.name, 1)
            Inventory.addPlayerItem(playerId, 'player_clothes', 1)
        end
    end,
    ['police_radar'] = function(playerId, item)
        TriggerClientEvent('p_policejob/toggleHandRadar', playerId)
    end,
    ['spike_strip'] = function(playerId, item)
        local result = lib.callback.await('p_policejob/useSpikeStrip', playerId)
        if result then
            Inventory.removePlayerItem(playerId, item.name, 1)
        end
    end,
    ['police_shield'] = function(playerId, item)
        TriggerClientEvent('p_policejob/client/objects/togglePoliceShield', playerId)
    end,
}

Citizen.CreateThread(function()
    if GetResourceState('es_extended') == 'started' then
        local ESX = exports['es_extended']:getSharedObject()
        for itemName, itemFunction in pairs(itemsFunctions) do
            ESX.RegisterUsableItem(itemName, itemFunction)
        end
    elseif GetResourceState('qbx_core') == 'started' then
        for itemName, itemFunction in pairs(itemsFunctions) do
            exports['qbx_core']:CreateUseableItem(itemName, itemFunction)
        end
    elseif GetResourceState('qb-core') == 'started' and GetResourceState('qbx_core') ~= 'started' then
        local QBCore = exports['qb-core']:GetCoreObject()
        for itemName, itemFunction in pairs(itemsFunctions) do
            QBCore.Functions.CreateUseableItem(itemName, itemFunction)
        end
    end
end)