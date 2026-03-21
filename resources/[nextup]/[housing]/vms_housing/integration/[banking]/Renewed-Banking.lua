if Config.Banking ~= 'Renewed-Banking' then
    return
end

function GetSocietyMoney(societyName)
    local money = exports['Renewed-Banking']:getAccountMoney(societyName)
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
    exports['Renewed-Banking']:addAccountMoney(societyName, amount)
end

---@class RemoveSocietyMoney
---@param reason string
---| 'purchaseProperty'
function RemoveSocietyMoney(societyName, amount, reason)
    exports['Renewed-Banking']:removeAccountMoney(societyName, amount)
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

end