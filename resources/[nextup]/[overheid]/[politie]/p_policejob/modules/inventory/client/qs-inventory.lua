if GetResourceState('qs-inventory') ~= 'started' then return end

local notRemovable = {
    ['handcuffs'] = true,
    ['photo'] = true,
    ['camera'] = true,
    ['police_radar'] = true
}

Inventory = {
    openInventory = function(invType, data, items)
        if invType == 'stash' then
            if data.owner then   
                TriggerServerEvent('policejob/registerStash', data.id..'_'..data.owner, 50, 10000)
            else
                TriggerServerEvent('policejob/registerStash', data, 50, 10000)
            end
        elseif invType == 'shop' then
            local shopData = {
                label = data.type,
                items = items
            }
            for i = 1, #shopData.items, 1 do
                shopData.items[i].slot = i
                shopData.items[i].amount = 999999
            end
            TriggerServerEvent("inventory:server:OpenInventory", "shop", data.type..'_'..data.id, shopData)
        elseif invType == 'player' then
            TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", data)
            TriggerEvent("inventory:client:SetCurrentStash", "otherplayer", data)
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
        if data and data.useable then
            if not notRemovable[data.name] then
                TriggerServerEvent('p_policejob/inventory/removeItem', data.name, 1)
            end
        end
        cb(true)
    end,
}

RegisterNetEvent('qb-inventory:client:itemRemoved', function(item, amount, totalAmount)
    if item == 'body_cam' and totalAmount < 1 and exports['p_policejob']:isBodycamActive() then
        TriggerServerEvent('p_policejob/server_bodycam/useBodyCam')
    elseif item == 'gps' and totalAmount < 1 and exports['p_policejob']:isGpsActive() then
        exports['p_policejob']:gps()
    end
end)