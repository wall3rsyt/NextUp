if GetResourceState('codem-inventory') ~= 'started' then return end

local ESX, QBCore = nil, nil
if GetResourceState('es_extended') == 'started' then
    ESX = exports['es_extended']:getSharedObject()
elseif GetResourceState('qb-core') == 'started' then
    QBCore = exports['qb-core']:GetCoreObject()
end

Inventory = {
    getItemCount = function(playerId, itemName)
        return exports['codem-inventory']:GetItemsTotalAmount(playerId, itemName)
    end,
    addPlayerItem = function(playerId, itemName, itemCount, metadata, slot)
        exports['codem-inventory']:AddItem(playerId, itemName, itemCount, slot, metadata)
    end,
    removePlayerItem = function(playerId, itemName, itemCount, metadata, slot)
        exports['codem-inventory']:RemoveItem(playerId, itemName, itemCount, slot, metadata) -- metadata = slot
    end,
    registerStash = function(name, label, slots, weight, owner, job, coords)
    end,
    getInventoryItems = function(playerId)
        local identifier = Core.GetPlayerFromId(playerId)?.identifier
        local items = exports['codem-inventory']:GetInventory(identifier, playerId)
        for k, v in pairs(items) do
            if v.info then
                v.metadata = v.info
            end
        end
        return items
    end,
    clearInventory = function(inventory, keep)
        if type(inventory) == 'string' then
            exports['codem-inventory']:UpdateStash(inventory, {})
        else
            exports['codem-inventory']:ClearInventory(inventory)
        end
    end,
    getItemSlot = function(playerId, slot)
        local itemSlot = exports['codem-inventory']:GetItemBySlot(playerId, slot)
        if itemSlot.info then
            itemSlot.metadata = itemSlot.info
        end
        return itemSlot
    end,
    registerShop = function(shopName, shopData)
    end,
    addStashItem = function(stashData, itemName, itemCount, metadata, slot)
        exports['codem-inventory']:AddItem(stashData.id..'_'..stashData.owner, itemName, itemCount, slot, metadata)
    end,
}

lib.callback.register('p_policejob/inventory/getItemCount', function(source, itemName)
    return Inventory.getItemCount(source, itemName)
end)

RegisterNetEvent('p_policejob/inventory/openInventory', function(invType, data)
    if invType == 'player' then
        TriggerClientEvent('codem-inventory:client:robplayer', source, data)
    elseif invType == 'shop' then
        TriggerClientEvent('codem-inventory:openshop', source, data.type)
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
        local metadata = item.metadata or item.info
        if not metadata then return end
        TriggerClientEvent('p_policejob/client_camera/ShowPhoto', playerId, metadata.photoURL)
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
        Inventory.removePlayerItem(playerId, 'vest_strong', 1)
    end,
    ['vest_normal'] = function(playerId, item)
        TriggerClientEvent('p_policejob/use_vest/vest_normal', playerId)
        Inventory.removePlayerItem(playerId, 'vest_normal', 1)
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
    ['police_radar'] = function(playerId, item)
        TriggerClientEvent('p_policejob/toggleHandRadar', playerId)
    end,
    ['spike_strip'] = function(playerId, item)
        local result = lib.callback.await('p_policejob/useSpikeStrip', playerId)
        if result then
            Inventory.removePlayerItem(playerId, 'spike_strip', 1)
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