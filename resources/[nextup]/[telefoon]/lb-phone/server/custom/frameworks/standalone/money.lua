if Config.Framework ~= "standalone" then
    return
end

---Get the bank balance of a player
---@param source number
---@return integer
function GetBalance(source)
    local balance = exports['ic3d_banking']:GetAccount(source)
    return balance or 0
end

---Add money to a player's bank account
---@param source number
---@param amount integer
---@return boolean success
function AddMoney(source, amount)
    local success, err = exports['ic3d_banking']:AddMoney(source, amount)
    if not success then
        print('[b-phone] AddMoney failed: ' .. tostring(err))
    end
    return success or false
end

---@param identifier string
---@param amount number
---@return boolean success
function AddMoneyOffline(identifier, amount)
    if amount <= 0 then
        return false
    end
    -- ic3d_banking does not support offline players, fallback
    return true
end

---Remove money from a player's bank account
---@param source number
---@param amount integer
---@return boolean success
function RemoveMoney(source, amount)
    local success, err = exports['ic3d_banking']:RemoveMoney(source, amount)
    if not success then
        print('[b-phone] RemoveMoney failed: ' .. tostring(err))
    end
    return success or false
end