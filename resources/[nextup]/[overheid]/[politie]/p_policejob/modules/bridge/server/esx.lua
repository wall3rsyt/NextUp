if not GetResourceState('es_extended'):find('start') then return end
lib.print.info('Loaded ESX Bridge')

ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx:playerLoaded', function(player)
    TriggerEvent('p_policejob/server/playerLoaded', player) -- DONT TOUCH IT!
end)

local function trimString(string)
    string = string:gsub("^%s*(.-)%s*$", "%1")
    return string
end

Core = {
    ---@param plate: string [vehicle plate]
    ---@return table|nil [vehicle data or nil]
    GetVehicleByPlate = function(plate)
        local row = MySQL.single.await('SELECT * FROM owned_vehicles WHERE plate = ?', {trimString(plate)})
        return row or nil
    end,
    --@param playerId: number [existing player id]
    --@param status: string [status to check, e.g. 'hunger', 'thirst', 'drunk']
    --@return number [status value in millions, e.g. 0.5 for 500000]
    getPlayerStatus = function(playerId, statusName)
        local xPlayer = ESX.GetPlayerFromId(playerId)
	    if not xPlayer then
		    return 0
	    end
        
        return lib.callback.await('p_policejob/server/breathalyzer/getPlayerAlcohol', playerId) or 0
    end,

    --@param playerId: number [existing player id]
    --@param key: string [player data key]
    --@param value: any [player data value]
    setPlayerData = function(playerId, key, value)
        local xPlayer = ESX.GetPlayerFromId(playerId)
        xPlayer.set(key, value)
    end,

    --@param playerId: number [existing player id]
    --@return xPlayer: table [player object or nil]
    GetPlayerFromId = function(playerId)
        return ESX.GetPlayerFromId(playerId)
    end,

    --@param identifier: string [player identifier]
    --@return xPlayer: table [player object or nil]
    GetPlayerFromIdentifier = function(identifier)
        return ESX.GetPlayerFromIdentifier(identifier)
    end,

    --@param playerId: number [existing player id]
    --@return identifier: string [player identifier or nil]
    GetPlayerByCitizenId = function(citizenid)
        local row = MySQL.single.await('SELECT identifier FROM users WHERE '..Config.SSN..' = ?', {citizenid})
        return row and row.identifier or nil
    end,

    --@param playerId: number [existing player id]
    --@return string [player identifier or nil]
    GetPlayerId = function(playerId)
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if not xPlayer then return nil end
        return xPlayer.identifier
    end,

    --@param identifier: string [player identifier]
    --@return string [player callsign or 'Unknown']
    FetchPlayerBadge = function(identifier) -- FOR GPS SYSTEM
        if Config.GPS.UseCallSign then
            local xPlayer = Core.GetPlayerFromIdentifier(identifier)
            return xPlayer.get('callsign') or locale('no_data')
        else
            local row = MySQL.single.await('SELECT badge FROM users WHERE identifier = ? LIMIT 1', {identifier})
            return row and row.badge or locale('no_data')
        end
    end,

    -- FOR JAIL SYSTEM
    --@param xPlayer: table [player object]
    --@param fine: number [fine amount]
    --@param reason: string [reason for the fine]
    --@param job: string [job name]
    PayFine = function(xPlayer, fine, reason, job)
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..job, function(account)
            if account then
                account.addMoney(fine)
            end
        end)
        xPlayer.removeAccountMoney('bank', fine)
    end,

    --@param xPlayer: number or table [player id or player object]
    --@return table [job: string, grade: number, label: string]
    GetPlayerJob = function(xPlayer)
        local xPlayer = type(xPlayer) == 'number' and Core.GetPlayerFromId(xPlayer) or xPlayer
        if not xPlayer then return nil end
        local playerJob = xPlayer.job
        return {
            name = playerJob.name,
            grade = tonumber(playerJob.grade),
            label = playerJob.label
        }
    end,

    --@param xPlayer: number or table [player id or player object]
    --@param separate: boolean [if true, return first and last name separately]
    --@return string [player name or 'Unknown']
    GetPlayerName = function(xPlayer, separate)
        local xPlayer = type(xPlayer) == 'number' and Core.GetPlayerFromId(xPlayer) or xPlayer
        if not xPlayer or type(xPlayer) ~= 'table' then return 'Unknown' end
        if separate then
            return xPlayer.get('firstName'), xPlayer.get('lastName')
        else
            return xPlayer.get('firstName')..' '..xPlayer.get('lastName')
        end
    end,

    --@param xPlayer: number or table [player id or player object]
    --@return string [player gender or 'm']
    GetPlayerGender = function(xPlayer)
        local xPlayer = type(xPlayer) == 'number' and Core.GetPlayerFromId(xPlayer) or xPlayer
        if not xPlayer then return 'Unknown' end
        return xPlayer.get('sex') == 'm' and 'male' or 'female'
    end,

    --@return table [list of players]
    GetPlayers = function()
        return ESX.GetExtendedPlayers()
    end,

    --@param citizenid: string [player identifier]
    --@return number [jail time in seconds or 0]
    GetPlayerJail = function(citizenid)
        local row = MySQL.single.await('SELECT jail FROM users WHERE identifier = ?', {citizenid})
        return row and row.jail or 0
    end,

    --@param jail: number [jail time in seconds]
    --@param citizenid: string [player identifier]
    UpdatePlayerJail = function(jail, citizenid)
        MySQL.update('UPDATE users SET jail = ? WHERE identifier = ?', {jail, citizenid})
    end,

    --@param data table: {[jailTime: number] = identifier: string}
    UpdatePlayersJail = function(data)
        MySQL.prepare('UPDATE users SET jail = ? WHERE identifier = ?', data)
    end,

    --@param playerId number [existing player id]
    --@return string [group name]
    GetPlayerGroup = function(playerId)
        local xPlayer = ESX.GetPlayerFromId(playerId)
        return xPlayer.getGroup()
    end,

    -- FOR GARAGE SYSTEM
    --@param identifier: string [player identifier]
    --@param jobName: string [job name]
    --@return table [list of vehicles]
    GetPlayerJobVehicles = function(identifier, jobName)
        local result = MySQL.query.await('SELECT * FROM owned_vehicles WHERE owner = ? AND job = ? AND stored = ?', {identifier, jobName, 1})
        return result
    end,

    --@param playerId: number [existing player id]
    --@return money: number [player money]
    GetPlayerMoney = function(playerId, account)
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if not xPlayer then return 0 end
        return xPlayer.getAccount(account)?.money or 0
    end,

    --@param playerId: number [existing player id]
    --@param amount: number [amount to remove]
    RemovePlayerMoney = function(playerId, amount, account)
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if not xPlayer then return end
        xPlayer.removeAccountMoney(account, amount)
    end,

    -- [Config.Jail.ReduceOfflineTime]
    ReducePlayersJail = function()
        local playersJail = MySQL.query.await('SELECT identifier, jail FROM users WHERE jail > 0')

        local data = {}
        for _, playerJail in ipairs(playersJail) do
            local xTarget = Core.GetPlayerFromIdentifier(playerJail.identifier)
            if not xTarget then
                local newJailTime = playerJail.jail - Config.Jail.ConvertMonths(1)
                if newJailTime <= 0 then
                    newJailTime = 0
                end
                data[#data + 1] = {newJailTime, playerJail.identifier}
            end
        end

        if #data > 0 then
            Core.UpdatePlayersJail(data)
        end
    end,

    --@param playerId: number [existing player id]
    --@param targetId: number [target player id]
    --@param licenseType: string [license type, e.g. 'weapon', 'driver']
    GrantLicense = function(playerId, targetId, licenseType)
        TriggerEvent('esx_license:addLicense', targetId, licenseType)
    end,

    --@param playerId: number [existing player id]
    --@param targetId: number [target player id]
    --@param licenseType: string [license type, e.g. 'weapon', 'driver']
    RevokeLicense = function(playerId, targetId, licenseType)
        local identifier = Core.GetPlayerId(targetId)
        MySQL.update('DELETE FROM user_licenses WHERE type = ? AND owner = ?', {licenseType, identifier})
    end,

    GetVehicleByPlate = function(vehiclePlate)
        local row = MySQL.single.await('SELECT * FROM owned_vehicles WHERE plate = ?', {trimString(vehiclePlate)})
        if not row then return nil end

        local vehMods = json.decode(row.vehicle)
        if row.vin then
            vehMods.vin = row.vin
        end
        return {
            owner = row.owner,
            plate = vehiclePlate,
            vehicle = vehMods,
        }
    end,

    RemoveVehicleByPlate = function(vehiclePlate)
        MySQL.update('DELETE FROM owned_vehicles WHERE plate = ?', {trimString(vehiclePlate)})
    end,

    AddVehicleToImpound = function(playerId, vehicleData, location, reason, price, duration)
        local identifier = Core.GetPlayerId(playerId) -- officer identifier
        local id = MySQL.insert.await('INSERT INTO police_impound (officer, officer_name, owner, plate, vehicle, location, reason, price, duration) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
            identifier,
            Core.GetPlayerName(playerId),
            vehicleData.owner,
            vehicleData.plate,
            json.encode(vehicleData.vehicle),
            location,
            reason,
            price,
            os.time() + (duration * 60 * 60)
        })
        if id then
            return true
        end

        return false
    end,

    RemoveVehicleFromImpound = function(playerId, data)
        if data.duration > os.time() then
            local plyMoney = Core.GetPlayerMoney(playerId, 'bank')
            if plyMoney < data.price then
                Editable.showNotify(playerId, locale('not_enough_money'), 'error')
                return false
            end

            Core.RemovePlayerMoney(playerId, data.price, 'bank')
        end

        local identifier = Core.GetPlayerId(playerId)
        local vehMods = json.decode(data.vehicle)

        local queries = {
            'DELETE FROM police_impound WHERE plate = @plate AND location = @location AND owner = @owner',
        }

        local values = {
            plate = trimString(data.plate),
            location = data.location,
            owner = identifier,
            mods = json.encode(vehMods),
            stored = 1,
            vin = vehMods.vin or nil
        }

        if values.vin then
            table.insert(queries, 'INSERT INTO owned_vehicles (owner, plate, vehicle, stored, vin) VALUES (@owner, @plate, @mods, @stored, @vin)')
        else
            table.insert(queries, 'INSERT INTO owned_vehicles (owner, plate, vehicle, stored) VALUES (@owner, @plate, @mods, @stored)')
        end

        local result = MySQL.transaction.await(queries, values)
        return result
    end
}

-- GARAGE FUNCTIONALITY
lib.callback.register('p_policejob/server_garage/takeOutVehicle', function(source, vehicleData)
    local xPlayer = Core.GetPlayerFromId(source)
    local result = MySQL.single.await(
        'SELECT * FROM owned_vehicles WHERE owner = ? AND JSON_UNQUOTE(JSON_EXTRACT(vehicle, "$.model")) = ? AND JSON_UNQUOTE(JSON_EXTRACT(vehicle, "$.plate")) = ?',
    {xPlayer.identifier, vehicleData.model, vehicleData.plate})
    if not result then return false end

    MySQL.update(
        'UPDATE owned_vehicles SET stored = 0 WHERE owner = ? AND JSON_UNQUOTE(JSON_EXTRACT(vehicle, "$.model")) = ? AND JSON_UNQUOTE(JSON_EXTRACT(vehicle, "$.plate")) = ?',
    {xPlayer.identifier, vehicleData.model, vehicleData.plate})
    return json.decode(result.vehicle)
end)

RegisterNetEvent('p_policejob/server_garage/storeVehicle', function(data)
    local _source = source
    local xPlayer = Core.GetPlayerFromId(_source)
    local entity = utils.getEntityFromNetId(data.netId)
    if not entity or entity == 0 then
        return
    end

    local state = Entity(entity).state
    if state.isPoliceVehicle then
        DeleteEntity(entity)
    end
    local result = MySQL.single.await(
        'SELECT * FROM owned_vehicles WHERE owner = ? AND JSON_UNQUOTE(JSON_EXTRACT(vehicle, "$.model")) = ? AND JSON_UNQUOTE(JSON_EXTRACT(vehicle, "$.plate")) = ?',
    {xPlayer.identifier, data.model, data.plate})
    if not result then return end

    DeleteEntity(entity)
    MySQL.update(
        'UPDATE owned_vehicles SET stored = 1, vehicle = ? WHERE owner = ? AND JSON_UNQUOTE(JSON_EXTRACT(vehicle, "$.model")) = ? AND JSON_UNQUOTE(JSON_EXTRACT(vehicle, "$.plate")) = ?',
    {json.encode(data.properties), xPlayer.identifier, data.model, data.plate})
    Editable.showNotify(_source, locale('vehicle_stored'), 'success')
end)

SetTimeout(2000, function()
    if Config.RadioList.Enabled then
        RegisterNetEvent('esx:onPlayerDeath', function()
            local _source = source
            playerRadioDeath(_source, true)
        end)
        
        RegisterNetEvent('esx:onPlayerSpawn', function()
            local _source = source
            playerRadioDeath(_source, false)
        end)
    end
end)