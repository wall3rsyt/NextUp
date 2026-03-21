if Config.Banking ~= 'tgg-banking' then
    return
end

function GetSocietyMoney(societyName)
    local money = exports['tgg-banking']:GetSocietyAccountMoney(societyName)
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
    exports['tgg-banking']:AddSocietyMoney(societyName, amount)
end

---@class RemoveSocietyMoney
---@param reason string
---| 'purchaseProperty'
function RemoveSocietyMoney(societyName, amount, reason)
    exports['tgg-banking']:RemoveSocietyMoney(societyName, amount)
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
    local society = exports['tgg-banking']:GetSocietyAccount(societyName)

    if not society then
        return
    end

    if type == 'propertyPurchase' then
        local title = ('Purchased Property %s %s'):format(data.propertyAddress, data.propertyRegion)
        exports['tgg-banking']:AddTransaction(nil, society.iban, 'withdraw', data.amount, title)
        
    elseif type == 'propertySale' then
        local title = ('Sold %s %s for %s'):format(data.propertyAddress, data.propertyRegion, data.buyerName)
        exports['tgg-banking']:AddTransaction(society.iban, nil, 'deposit', data.amount, title)

    elseif type == 'propertyRent' then
        local cycle = data.rentalCycle and 'weekly' and 'Weekly' or 'Monthly'
        local title = ('Rented %s %s for %s (%s)'):format(data.propertyAddress, data.propertyRegion, data.buyerName, cycle)
        exports['tgg-banking']:AddTransaction(society.iban, nil, 'deposit', data.amount, title)

    elseif type == 'rentalIncome' then
        local cycle = data.rentalCycle and 'weekly' and 'Weekly' or 'Monthly'
        local title = ('%s paid the rent for %s %s'):format(data.buyerName, data.propertyAddress, data.propertyRegion)
        exports['tgg-banking']:AddTransaction(society.iban, nil, 'deposit', data.amount, title)

    end
end