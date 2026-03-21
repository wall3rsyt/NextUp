if GetResourceState('ak47_inventory') ~= 'started' then return end

Inventory = {
    getItemCount = function(playerId, itemName, metadata)
        return exports['ak47_inventory']:Search(playerId, 'count', itemName, metadata or nil)
    end,
    addPlayerItem = function(playerId, itemName, itemCount, metadata)
        exports['ak47_inventory']:AddItem(playerId, itemName, itemCount, nil, metadata)
    end,
    removePlayerItem = function(playerId, itemName, itemCount, metadata)
        return exports['ak47_inventory']:RemoveItem(playerId, itemName, itemCount, nil, metadata)
    end,
    registerStash = function(name, label, slots, weight, owner, job, coords)
        exports['ak47_inventory']:CreateInventory(name, {
            label = label,
            maxWeight = weight,
            slots = slots,
            type = 'stash',
        })
    end,
    getInventoryItems = function(playerId)
        local items = exports['ak47_inventory']:GetInventoryItems(playerId)
        return items
    end,
    clearInventory = function(inventory)
        exports['ak47_inventory']:ClearInventory(inventory)
    end,
    getItemSlot = function(playerId, slot)
        return exports['ak47_inventory']:GetSlot(playerId, slot)
    end,
    registerShop = function(shopName, shopData)
        lib.print.info('[Warning] origen_inventory is missing registerShop export, create armoury in inventory config instead')
    end,
    addStashItem = function(stashData, itemName, itemCount, metadata, slot)
        exports['ak47_inventory']:AddItem(stashData, itemName, itemCount, nil, metadata)
    end,
}