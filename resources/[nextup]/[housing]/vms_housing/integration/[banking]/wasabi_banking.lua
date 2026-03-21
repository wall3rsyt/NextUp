if Config.Banking ~= 'wasabi_banking' then
    return
end

function GetSocietyMoney(societyName)
    local money = exports['wasabi_banking']:GetAccountBalance(societyName, 'society')
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
    exports['wasabi_banking']:AddMoney('society', societyName, amount)
end

---@class RemoveSocietyMoney
---@param reason string
---| 'purchaseProperty'
function RemoveSocietyMoney(societyName, amount, reason)
    exports['wasabi_banking']:RemoveMoney('society', societyName, amount)
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
        exports['wasabi_banking']:Transaction(societyName, title, data.amount, 'sent', 'society')
        
    elseif type == 'propertySale' then
        local title = ('Sold %s %s for %s'):format(data.propertyAddress, data.propertyRegion, data.buyerName)
        exports['wasabi_banking']:Transaction(societyName, title, data.amount, 'deposit', 'society')

    elseif type == 'propertyRent' then
        local cycle = data.rentalCycle and 'weekly' and 'Weekly' or 'Monthly'
        local title = ('Rented %s %s for %s (%s)'):format(data.propertyAddress, data.propertyRegion, data.buyerName, cycle)
        exports['wasabi_banking']:Transaction(societyName, title, data.amount, 'deposit', 'society')

    elseif type == 'rentalIncome' then
        local cycle = data.rentalCycle and 'weekly' and 'Weekly' or 'Monthly'
        local title = ('%s paid the rent for %s %s'):format(data.buyerName, data.propertyAddress, data.propertyRegion)
        exports['wasabi_banking']:Transaction(societyName, title, data.amount, 'deposit', 'society')


    end
end