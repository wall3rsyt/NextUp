if Config.Banking ~= 'okokBanking' then
    return
end

function GetSocietyMoney(societyName)
    local money = exports['okokBanking']:GetAccount(societyName)
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
    exports['okokBanking']:AddMoney(societyName, amount)
end

---@class RemoveSocietyMoney
---@param reason string
---| 'purchaseProperty'
function RemoveSocietyMoney(societyName, amount, reason)
    exports['okokBanking']:RemoveMoney(societyName, amount)
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