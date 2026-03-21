if GetResourceState('qs-inventory') ~= 'started' then return end

RegisterNetEvent('policejob/registerStash', function(stashId, slots, weight)
    exports['qs-inventory']:RegisterStash(source, stashId, slots, weight)
end)

Inventory = {
    getItemCount = function(playerId, itemName)
        return exports['qs-inventory']:GetItemTotalAmount(playerId, itemName)
    end,
    addPlayerItem = function(playerId, itemName, itemCount, metadata, slot)
        exports['qs-inventory']:AddItem(playerId, itemName, itemCount, slot, metadata)
    end,
    removePlayerItem = function(playerId, itemName, itemCount, metadata, slot)
        exports['qs-inventory']:RemoveItem(playerId, itemName, itemCount, slot, metadata)
    end,
    registerStash = function(name, label, slots, weight, owner, job, coords)
    end,
    getInventoryItems = function(playerId)
        local items = exports['qs-inventory']:GetInventory(playerId) or {}
        for i = 1, #items, 1 do
            if items[i] and items[i].info then
                items[i].metadata = items[i].info
            end
        end
        return items
    end,
    clearInventory = function(inventory, keep)
        if type(inventory) == 'string' then
            local stashItems = exports['qs-inventory']:GetStashItems(inventory)
            for slot, itemData in pairs(stashItems) do
                -- print('removing item', itemData.name, itemData.amount, slot)
                exports['qs-inventory']:RemoveItemIntoStash(inventory, itemData.name, itemData.amount, slot, 50, 100000)
            end
        else
            exports['qs-inventory']:ClearInventory(inventory)
        end
    end,
    getItemSlot = function(playerId, slot)
        local itemSlot = nil
        local inventory = exports['qs-inventory']:GetInventory(playerId)
        for k, v in pairs(inventory) do
            if v.slot == slot then
                itemSlot = v
                break
            end
        end

        return itemSlot
    end,
    registerShop = function(shopName, shopData)
    end,
    addStashItem = function(stashData, itemName, itemCount, metadata, slot)
        exports['qs-inventory']:AddItemIntoStash(stashData.id..'_'..stashData.owner, itemName, itemCount, slot, metadata)
    end,
}

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
    ['vest_strong'] = function(playerId)
        TriggerClientEvent('p_policejob/use_vest/vest_strong', playerId)
    end,
    ['vest_normal'] = function(playerId)
        TriggerClientEvent('p_policejob/use_vest/vest_normal', playerId)
    end,
    ['camera'] = function(playerId)
        TriggerClientEvent('p_policejob/client_camera/useCamera', playerId)
    end,
    ['photo'] = function(playerId, item)
        if item and item.info then
            TriggerClientEvent('p_policejob/client_camera/ShowPhoto', playerId, item.info.photoURL)
        end
    end,
    ['body_cam'] = function(playerId, item)
        exports['p_policejob']:useBodyCamItem(playerId)
    end,
    ['player_clothes'] = function(playerId, item)
        local result = lib.callback.await('p_policejob/client_divingsuit/UseClothes', playerId)
        if result then
            Inventory.removePlayerItem(playerId, 'player_clothes', 1)
            Inventory.addPlayerItem(playerId, 'police_diving_suit', 1)
        end
    end,
    ['police_diving_suit'] = function(playerId, item)
        local result = lib.callback.await('p_policejob/client_divingsuit/UseSuit', playerId)
        if result then
            Inventory.removePlayerItem(playerId, 'police_diving_suit', 1)
            Inventory.addPlayerItem(playerId, 'player_clothes', 1)
        end
    end,
    ['police_shield'] = function(playerId, item)
        TriggerClientEvent('p_policejob/client/objects/togglePoliceShield', playerId)
    end,
    ['handcuffs'] = function(playerId)
        TriggerClientEvent('p_policejob/useHandcuffs', playerId)
    end
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