if Config.Inventory ~= 'jaksam_inventory' then
    return
end

function OpenStorage(metadata)
    exports['jaksam_inventory']:openInventory(metadata.id)
end