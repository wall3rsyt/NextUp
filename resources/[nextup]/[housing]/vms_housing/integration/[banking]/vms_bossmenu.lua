if Config.Banking ~= 'vms_bossmenu' then
    return
end

function GetSocietyMoney(societyName)
    local money = exports['vms_bossmenu']:getMoney(societyName)
    return money
end

---@class AddSocietyMoney
---@param reason string
---| 'salesContract'
---| 'rentalContract'
---| 'salesMarketplace'
---| 'rentMarketplace'
---| 'rentalIncome'
function AddSocietyMoney(societyName, amount, reason)
    exports['vms_bossmenu']:addMoney(societyName, amount)
end

---@class RemoveSocietyMoney
---@param reason string
---| 'purchaseProperty'
function RemoveSocietyMoney(societyName, amount, reason)
    exports['vms_bossmenu']:removeMoney(societyName, amount)
end


---@class RegisterSocietyTransaction

---@class data
---@ propertyName
---@ propertyAddress
---@ propertyRegion
---@ rentalCycle
---@ agentName
---@ agentIdentifier
---@ buyerName
---@ buyerIdentifier
---@ sellerName
---@ sellerIdentifier
function RegisterSocietyTransaction(src, societyName, type, data)
    if type == 'propertyPurchase' then
        local title = ('Purchased Property %s %s'):format(data.propertyAddress, data.propertyRegion)
        exports['vms_bossmenu']:addTransaction(src, societyName, nil, 'transfer_outgoing', data.amount, title)
        
    elseif type == 'propertySale' then
        local title = ('Sold %s %s for %s'):format(data.propertyAddress, data.propertyRegion, data.buyerName)
        exports['vms_bossmenu']:addTransaction(src, societyName, nil, 'transfer_incoming', data.amount, title)

    elseif type == 'propertyRent' then
        local cycle = data.rentalCycle and 'weekly' and 'Weekly' or 'Monthly'
        local title = ('Rented %s %s for %s (%s)'):format(data.propertyAddress, data.propertyRegion, data.buyerName, cycle)
        exports['vms_bossmenu']:addTransaction(src, societyName, nil, 'transfer_incoming', data.amount, title)

    elseif type == 'rentalIncome' then
        local cycle = data.rentalCycle and 'weekly' and 'Weekly' or 'Monthly'
        local title = ('%s paid the rent for %s %s'):format(data.buyerName, data.propertyAddress, data.propertyRegion)
        exports['vms_bossmenu']:addTransaction(src, societyName, nil, 'transfer_incoming', data.amount, title)

    end
end