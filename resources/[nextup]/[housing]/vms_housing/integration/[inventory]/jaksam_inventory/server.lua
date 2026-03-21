if Config.Inventory ~= 'jaksam_inventory' then
    return
end

function RegisterStorage(metadata)
    -- This resource does not require stash registration.
end

function RegisterUsableItem(name, cb)
    if Config.Core == "ESX" then
        exports['jaksam_inventory']:registerUsableItem(name, function(src, itemName, itemData)
            cb(src, itemName, { metadata = itemData.metadata })
        end)
        
    elseif Config.Core == "QB-Core" then
        exports['jaksam_inventory']:registerUsableItem(name, function(src, item)
            cb(src, item.name, { metadata = item.metadata })
        end)

    end
end

function GetItem(src, xPlayer, name, data, search)
    if search == 'key' then
        local total = exports['jaksam_inventory']:getTotalItemAmount(src, name, {
            keySerialNumber = data.keySerialNumber
        })
        
        return total >= 1
    end
end

function AddItem(src, xPlayer, name, count, metadata)
    exports['jaksam_inventory']:addItem(src, name, count, metadata)
end

function RemoveItem(src, xPlayer, name, count)
    exports['jaksam_inventory']:removeItem(src, name, count)
end