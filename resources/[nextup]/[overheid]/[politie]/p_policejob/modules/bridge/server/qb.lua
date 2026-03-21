if GetResourceState('qbx_core'):find('start') or GetResourceState('es_extended'):find('start') then return end
lib.print.info('Loaded QB Bridge')

QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Server:PlayerLoaded', function(player)
    TriggerEvent('p_policejob/server/playerLoaded', player.PlayerData.source) -- DONT TOUCH IT!
end)

Core = {
    ---@param plate: string [vehicle plate]
    ---@return table|nil [vehicle data or nil]
    GetVehicleByPlate = function(plate)
        local row = MySQL.single.await('SELECT * FROM player_vehicles WHERE plate = ?', {plate})
        return row or nil
    end,
    --@param playerId: number [existing player id]
    --@param status: string [status to check, e.g. 'hunger', 'thirst', 'drunk']
    --@return number [status value in millions, e.g. 0.5 for 500000]
    getPlayerStatus = function(playerId, status)
        if status == 'drunk' then
            local result = lib.callback.await('p_policejob/server/breathalyzer/getPlayerAlcohol', playerId)
            return result
        end

        return 0
    end,

    --@param playerId: number [existing player id]
    --@param key: string [player data key]
    --@param value: any [player data value]
    setPlayerData = function(playerId, key, value)
        local xPlayer = QBCore.Functions.GetPlayer(playerId)
        xPlayer.Functions.SetMetaData(key, value)
    end,

    --@param playerId: number [existing player id]
    --@return xPlayer: table [player object or nil]
    GetPlayerFromId = function(playerId)
        local xPlayer = QBCore.Functions.GetPlayer(playerId)
        if not xPlayer then return nil end
        xPlayer.identifier = xPlayer.PlayerData.citizenid
        xPlayer.source = xPlayer.PlayerData.source
        return xPlayer
    end,

    --@param identifier: string [player identifier]
    --@return xPlayer: table [player object or nil]
    GetPlayerFromIdentifier = function(identifier)
        local xPlayer = QBCore.Functions.GetPlayerByCitizenId(identifier)
        if not xPlayer then return nil end
        xPlayer.source = xPlayer.PlayerData.source
        xPlayer.identifier = xPlayer.PlayerData.citizenid
        return xPlayer
    end,

    --@param playerId: number [existing player id]
    --@return identifier: string [player identifier or nil]
    GetPlayerByCitizenId = function(citizenid)
        local row = MySQL.single.await('SELECT citizenid FROM players WHERE '..Config.SSN..' = ?', {citizenid})
        return row and row.citizenid or nil
    end,

    --@param playerId: number [existing player id]
    --@return string [player identifier or nil]
    GetPlayerId = function(playerId)
        local xPlayer = QBCore.Functions.GetPlayer(playerId)
        if not xPlayer then return nil end
        return xPlayer.PlayerData.citizenid
    end,

    --@param identifier: string [player identifier]
    --@return string [player callsign or 'Unknown']
    FetchPlayerBadge = function(identifier) -- FOR GPS SYSTEM
        if Config.GPS.UseCallSign then
            local xPlayer = Core.GetPlayerFromIdentifier(identifier)
            return xPlayer.Functions.GetMetaData('callsign') or locale('no_data')
        else
            local row = MySQL.single.await('SELECT badge FROM players WHERE citizenid = ? LIMIT 1', {identifier})
            return row and row.badge or locale('no_data')
        end
    end,

    -- FOR JAIL SYSTEM
    --@param xPlayer: table [player object]
    --@param fine: number [fine amount]
    --@param reason: string [reason for the fine]
    --@param job: string [job name]
    PayFine = function(xPlayer, fine, reason, job)
        xPlayer.Functions.RemoveMoney('bank', fine)
        -- you can implement society payment here if needed
    end,

    --@param xPlayer: table | number [player object | player id]
    --@return table [player job data or nil]
    GetPlayerJob = function(xPlayer)
        local xPlayer = type(xPlayer) == 'number' and Core.GetPlayerFromId(xPlayer) or xPlayer
        if not xPlayer then 
            return {
                name = 'unemployed',
                grade = 0,
                label = 'unemployed'
            }
        end
        
        local playerJob = xPlayer.PlayerData.job
        return {
            name = playerJob.name,
            grade = tonumber(playerJob.grade.level),
            label = playerJob.label
        }
    end,

    --@param xPlayer: table | number [player object | player id]
    --@param separate: boolean [if true, returns first and last name separately]
    --@return name: string [player name or first and last name]
    GetPlayerName = function(xPlayer, separate)
        local xPlayer = type(xPlayer) == 'number' and Core.GetPlayerFromId(xPlayer) or xPlayer
        if not xPlayer or type(xPlayer) ~= 'table' then return 'Unknown' end
        if separate then
            return xPlayer.PlayerData.charinfo.firstname, xPlayer.PlayerData.charinfo.lastname
        else
            return xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
        end
    end,

    --@param xPlayer: table | number [player object | player id]
    --@return string [player gender or 'Unknown']
    GetPlayerGender = function(xPlayer)
        local xPlayer = type(xPlayer) == 'number' and Core.GetPlayerFromId(xPlayer) or xPlayer
        if not xPlayer or type(xPlayer) ~= 'table' then return 'Unknown' end
        return xPlayer.PlayerData.charinfo.gender == 0 and 'male' or 'female'
    end,

    GetPlayers = function()
        return QBCore.Functions.GetQBPlayers()
    end,

    --@param citizenid: string [player identifier]
    --@return number [jail time in seconds or 0]
    GetPlayerJail = function(citizenid)
        local row = MySQL.single.await('SELECT jail FROM players WHERE citizenid = ?', {citizenid})
        return row and row.jail or 0
    end,

    --@param jail: number [jail time in seconds]
    --@param citizenid: string [player identifier]
    UpdatePlayerJail = function(jail, citizenid)
        MySQL.update('UPDATE players SET jail = ? WHERE citizenid = ?', {jail, citizenid})
    end,

    --@param data table: {[jailTime: number] = identifier: string}
    UpdatePlayersJail = function(data)
        if #data > 0 then
            MySQL.prepare('UPDATE players SET jail = ? WHERE citizenid = ?', data)
        end
    end,

    --@param playerId: number [existing player id]
    --@return string [player group or 'user']
    GetPlayerGroup = function(playerId)
        local permissions = QBCore.Functions.GetPermission(playerId)
        return permissions['admin'] and 'admin' or 'user'
    end,

    --@param identifier: string [player identifier]
    --@param jobName: string [job name]
    --@return table [list of player vehicles]
    GetPlayerJobVehicles = function(identifier, jobName)
        local result = MySQL.query.await('SELECT * FROM player_vehicles WHERE citizenid = ? AND job = ? AND state = 1', {identifier, jobName})
        return result
    end,

    --@param playerId: number [existing player id]
    --@return number [player money in specified account or 0]
    GetPlayerMoney = function(playerId, account)
        local xPlayer = QBCore.Functions.GetPlayer(playerId)
        return xPlayer.PlayerData.money[account] or 0
    end,

    --@param playerId: number [existing player id]
    --@param amount: number [amount to remove]
    --@param account: string [account type, e.g. 'bank', 'cash']
    RemovePlayerMoney = function(playerId, amount, account)
        local xPlayer = QBCore.Functions.GetPlayer(playerId)
        xPlayer.Functions.RemoveMoney(account, amount)
    end,

    ReducePlayersJail = function()
        local playersJail = MySQL.query.await('SELECT citizenid, jail FROM players WHERE jail > 0')
        local data = {}
        for _, playerJail in ipairs(playersJail) do
            local xTarget = Core.GetPlayerFromIdentifier(playerJail.citizenid)
            if not xTarget then
                local newTime = playerJail.jail - Config.Jail.ConvertMonths(1)
                if newTime <= 0 then
                    newTime = 0
                end
                data[#data + 1] = {newTime, playerJail.citizenid}
            end
        end
        Core.UpdatePlayersJail(data)
    end,

    --@param playerId: number [officer server id]
    --@param targetId: number [target server id]
    --@param licenseType: string [license type, e.g. 'weapon', 'driver']
    GrantLicense = function(playerId, targetId, licenseType)
        local target = QBCore.Functions.GetPlayer(targetId)
        if not target then return end

        if not target.PlayerData.metadata.licences then
            target.PlayerData.metadata.licences = {}
        end

        target.PlayerData.metadata.licences[licenseType] = true
        target.Functions.SetMetaData('licences', target.PlayerData.metadata.licences)
    end,

    --@param playerId: number [officer server id]
    --@param targetId: number [target server id]
    --@param licenseType: string [license type, e.g. 'weapon', 'driver']
    RevokeLicense = function(playerId, targetId, licenseType)
        local target = QBCore.Functions.GetPlayer(targetId)
        if not target then return end

        if not target.PlayerData.metadata.licences then
            target.PlayerData.metadata.licences = {}
        end
        
        target.PlayerData.metadata.licences[licenseType] = nil
        target.Functions.SetMetaData('licences', target.PlayerData.metadata.licences)
    end,

    GetVehicleByPlate = function(vehiclePlate)
        local row = MySQL.single.await('SELECT * FROM player_vehicles WHERE plate = ?', {vehiclePlate})
        if not row then return nil end

        local vehMods = json.decode(row.mods)
        vehMods.vehicle = row.vehicle
        vehMods.hash = row.hash
        vehMods.license = row.license
        if row.vin then
            vehMods.vin = row.vin
        end
        return {
            owner = row.citizenid,
            plate = vehiclePlate,
            vehicle = vehMods,
        }
    end,

    RemoveVehicleByPlate = function(vehiclePlate)
        MySQL.update('DELETE FROM player_vehicles WHERE plate = ?', {vehiclePlate})
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
            plate = data.plate,
            location = data.location,
            owner = identifier,
            license = vehMods.license,
            hash = vehMods.hash,
            vehicle = vehMods.vehicle,
            mods = json.encode(vehMods),
            vin = vehMods.vin or nil
        }

        if values.vin then
            table.insert(queries, 'INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, vin, state) VALUES (@license, @owner, @vehicle, @hash, @mods, @plate, @vin, 1)')
        else
            table.insert(queries, 'INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (@license, @owner, @vehicle, @hash, @mods, @plate, 1)')
        end

        local result = MySQL.transaction.await(queries, values)
        return result
    end
}

lib.callback.register('p_policejob/getGroup', function(playerId)
    return Core.GetPlayerGroup(playerId)
end)

lib.callback.register('p_policejob/server_garage/takeOutVehicle', function(source, vehicleData)
    local xPlayer = Core.GetPlayerFromId(source)
    local result = MySQL.single.await(
        'SELECT * FROM player_vehicles WHERE citizenid = ? AND plate = ?',
    {xPlayer.identifier, vehicleData.plate})
    if not result then return false end

    if result.hash and tonumber(result.hash) ~= tonumber(joaat(vehicleData.model)) then
        return false
    end

    MySQL.update(
        'UPDATE player_vehicles SET state = 0, hash = ? WHERE citizenid = ? AND plate = ?',
    {joaat(vehicleData.model), xPlayer.identifier, vehicleData.plate})
    
    local mods = result.mods and json.decode(result.mods) or {}
    mods.plate = result.plate
    return mods
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
        'SELECT * FROM player_vehicles WHERE citizenid = ? AND hash = ? AND plate = ?',
    {xPlayer.identifier, tostring(joaat(data.model)), data.plate})
    if not result then return end

    DeleteEntity(entity)
    MySQL.update(
        'UPDATE player_vehicles SET state = 1, mods = ? WHERE citizenid = ? AND hash = ? AND plate = ?',
    {json.encode(data.properties), xPlayer.identifier, tostring(joaat(data.model)), data.plate})
    Editable.showNotify(_source, locale('vehicle_stored'), 'success')
end)

SetTimeout(2000, function()
    if Config.RadioList.Enabled then
        RegisterNetEvent('hospital:server:SetDeathStatus', function(state)
            local _source = source
            playerRadioDeath(_source, state)
        end)
    end
end)

lib.callback.register('p_policejob/server/getPlayerSkin', function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', { Player.PlayerData.citizenid, 1 })
    if result and result[1] then
        return result[1].skin
    end

    return nil
end)

-- BACKWARD COMPATIBILITY WITH QB-POLICEJOB

RegisterNetEvent('p_policejob/server/toggleDuty', function(state)
    local _source = source
    local xPlayer = QBCore.Functions.GetPlayer(_source)
    xPlayer.Functions.SetJobDuty(state)
    Editable.showNotify(_source, state and locale('duty_on') or locale('duty_off'), 'success')
    if GetResourceState('piotreq_jobcore') == 'started' then
        exports['piotreq_jobcore']:SwitchDuty(_source, {duty = state and 1 or 0})
    end

    local copsCount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for i = 1, #players do
        local player = players[i]
        if player and Config.Jobs[player.PlayerData.job.name] and player.PlayerData.job.onduty then
            copsCount = copsCount + 1
        end
    end
    TriggerEvent('police:SetCopCount', copsCount)
    TriggerClientEvent('police:SetCopCount', -1, copsCount)
end)

QBCore.Functions.CreateCallback('police:GetDutyPlayers', function(_, cb)
    local dutyPlayers = {}
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v and v.PlayerData.job.type == 'leo' and v.PlayerData.job.onduty then
            dutyPlayers[#dutyPlayers + 1] = {
                source = v.PlayerData.source,
                label = v.PlayerData.metadata['callsign'],
                job = v.PlayerData.job.name
            }
        end
    end
    cb(dutyPlayers)
end)

QBCore.Functions.CreateCallback('police:GetCops', function(_, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v and v.PlayerData.job.type == 'leo' and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

QBCore.Functions.CreateCallback('police:server:isPlayerDead', function(_, cb, playerId)
    local Player = QBCore.Functions.GetPlayer(playerId)
    cb(Player.PlayerData.metadata['isdead'])
end)

QBCore.Functions.CreateCallback('police:IsSilencedWeapon', function(source, cb, weapon)
    local Player = QBCore.Functions.GetPlayer(source)
    local itemInfo = Player.Functions.GetItemByName(QBCore.Shared.Weapons[weapon]['name'])
    local retval = false
    if itemInfo then
        if itemInfo.info and itemInfo.info.attachments then
            for k in pairs(itemInfo.info.attachments) do
                if itemInfo.info.attachments[k].component == 'COMPONENT_AT_AR_SUPP_02' or
                    itemInfo.info.attachments[k].component == 'COMPONENT_AT_AR_SUPP' or
                    itemInfo.info.attachments[k].component == 'COMPONENT_AT_PI_SUPP_02' or
                    itemInfo.info.attachments[k].component == 'COMPONENT_AT_PI_SUPP' then
                    retval = true
                end
            end
        end
    end
    cb(retval)
end)


QBCore.Functions.CreateCallback('police:server:IsPoliceForcePresent', function(_, cb)
    local retval = false
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v and v.PlayerData.job.type == 'leo' and v.PlayerData.job.grade.level >= 2 then
            retval = true
            break
        end
    end
    cb(retval)
end)

RegisterNetEvent('police:server:UpdateCurrentCops', function()
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    if updatingCops then return end
    updatingCops = true
    for _, v in pairs(players) do
        if v and v.PlayerData.job.type == 'leo' and v.PlayerData.job.onduty then
            amount += 1
        end
    end
    TriggerClientEvent('police:SetCopCount', -1, amount)
    updatingCops = false
end)