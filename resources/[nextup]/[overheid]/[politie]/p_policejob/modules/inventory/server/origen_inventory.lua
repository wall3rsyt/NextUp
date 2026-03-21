if GetResourceState('origen_inventory') ~= 'started' then return end

Inventory = {
    getItemCount = function(playerId, itemName, metadata)
        return exports['origen_inventory']:getItemCount(playerId, itemName, metadata or nil)
    end,
    addPlayerItem = function(playerId, itemName, itemCount, metadata)
        exports['origen_inventory']:addItem(playerId, itemName, itemCount, metadata)
    end,
    removePlayerItem = function(playerId, itemName, itemCount, metadata)
        return exports['origen_inventory']:removeItem(playerId, itemName, itemCount, metadata)
    end,
    registerStash = function(name, label, slots, weight, owner, job, coords)
        exports['origen_inventory']:registerStash(name, label, slots, weight, owner, job, coords)
    end,
    getInventoryItems = function(playerId)
        local items = exports['origen_inventory']:getInventoryItems(playerId)
        return items
    end,
    clearInventory = function(inventory, keep)
        exports['origen_inventory']:ClearInventory(inventory)
    end,
    getItemSlot = function(playerId, slot)
        return exports['origen_inventory']:getSlot(playerId, slot)
    end,
    registerShop = function(shopName, shopData)
        exports['origen_inventory']:CreateShop(shopName, {
            label = shopData.label or shopName,
            slots = #shopData.inventory,
            items = shopData.inventory,
            locations = shopData.locations
        })
    end,
    addStashItem = function(stashData, itemName, itemCount, metadata, slot)
        exports['origen_inventory']:addItem(stashData, itemName, itemCount, metadata, slot)
    end,
}