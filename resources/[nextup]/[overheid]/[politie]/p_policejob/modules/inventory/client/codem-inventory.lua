if GetResourceState('codem-inventory') ~= 'started' then return end

Inventory = {
    openInventory = function(invType, data)
        if invType == 'stash' then
            if data.owner then
                TriggerServerEvent("inventory:server:OpenInventory", "stash", data.id..'_'..data.owner, {
                    maxweight = 250000,
                    slots = 100,
                })
            else
                TriggerServerEvent("inventory:server:OpenInventory", "stash", data, {
                    maxweight = 250000,
                    slots = 100,
                })
            end
        elseif invType == 'player' then
            TriggerEvent('codem-inventory:client:openplayerinventory', data)
        else
            TriggerServerEvent('p_policejob/inventory/openInventory', invType, data)
        end
    end,
    getItemCount = function(itemName)
        if ESX then
            local items = ESX.GetPlayerData().inventory
            if items then
                for k, v in pairs(items) do
                    if v.name == itemName then
                        return v.count or 0
                    end
                end
            end

            return 0
        elseif QBCore then
            local items = QBCore.Functions.GetPlayerData().items
            for _, item in pairs(items) do
                if item.name == itemName then
                    return item.amount
                end
            end

            return 0
        elseif GetResourceState('qbx_core') == 'started' then
            local items = exports['qbx_core']:GetPlayerData().items
            for _, item in pairs(items) do
                if item.name == itemName then
                    return item.amount
                end
            end

            return 0
        end
    end,
    useItem = function(data, cb)
        cb(true)
    end,
}