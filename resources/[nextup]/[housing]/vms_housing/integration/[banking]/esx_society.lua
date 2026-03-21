if Config.Banking ~= 'esx_society' then
    return
end

function GetSocietyMoney(societyName)
    local society = exports['esx_society']:GetSociety(societyName)
    return society.account
end

---@class AddSocietyMoney
---@param reason string
---| 'salesContract'
---| 'rentalContract'
---| 'salesMarketplace'
---| 'rentMarketplace'
---| 'rentalIncome'
function AddSocietyMoney(societyName, amount, reason)
    TriggerEvent('esx_addonaccount:getSharedAccount', societyName, function(account)
        account.addMoney(amount)
    end)
end

---@class RemoveSocietyMoney
---@param reason string
---| 'purchaseProperty'
function RemoveSocietyMoney(societyName, amount, reason)
    TriggerEvent('esx_addonaccount:getSharedAccount', societyName, function(account)
        account.removeMoney(amount)
    end)
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