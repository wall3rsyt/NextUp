GMT.Editable = {}

-- ================================================
--   FRAMEWORK INITIALISATIE
-- ================================================

local frameworkObj = nil

if Config.Framework == 'ESX' then
    frameworkObj = exports['es_extended']:getSharedObject()
elseif Config.Framework == 'QB' then
    frameworkObj = exports['qb-core']:GetCoreObject()
end

local function isESX() return Config.Framework == 'ESX' end
local function isQB()  return Config.Framework == 'QB' end
local function isQBOX() return Config.Framework == 'QBOX' end

-- ================================================
--   NOTIFICATIES
-- ================================================

GMT.Editable.ShowNotify = function(playerId, text, type)
    TriggerClientEvent('ox_lib:notify', playerId, {
        title = 'Melding',
        description = text,
        type = type or 'inform'
    })
end

GMT.Editable.OnAnswer = function(player, text)
    TriggerClientEvent('ox_lib:notify', player, {
        title = 'Antwoord',
        description = text,
        type = 'inform'
    })
end

-- ================================================
--   SPELER OPHALEN
-- ================================================

GMT.Editable.GetPlayerFromId = function(playerId)
    if isESX() then
        return frameworkObj.GetPlayerFromId(playerId)
    elseif isQB() then
        local xPlayer = frameworkObj.Functions.GetPlayer(playerId)
        if xPlayer then
            xPlayer.identifier = xPlayer.PlayerData.citizenid
            xPlayer.source = playerId
        end
        return xPlayer
    elseif isQBOX() then
        local xPlayer = exports['qbx_core']:GetPlayer(playerId)
        if xPlayer then
            xPlayer.identifier = xPlayer.PlayerData.citizenid
            xPlayer.source = playerId
        end
        return xPlayer
    end
end

GMT.Editable.GetPlayerFromIdentifier = function(identifier)
    if isESX() then
        return frameworkObj.GetPlayerFromIdentifier(identifier)
    elseif isQB() then
        local xPlayer = frameworkObj.Functions.GetPlayerByCitizenId(identifier)
        if xPlayer then
            xPlayer.identifier = xPlayer.PlayerData.citizenid
            xPlayer.source = xPlayer.PlayerData.source
        end
        return xPlayer
    elseif isQBOX() then
        local xPlayer = exports['qbx_core']:GetPlayerByCitizenId(identifier)
        if xPlayer then
            xPlayer.identifier = xPlayer.PlayerData.citizenid
            xPlayer.source = xPlayer.PlayerData.source
        end
        return xPlayer
    end
end

lib.callback.register('piotreq_gmt/getPlayerIdentifier', function(source)
    local xPlayer = GMT.Editable.GetPlayerFromId(source)
    if not xPlayer then return nil end
    return xPlayer.identifier
end)

-- ================================================
--   SPELER INFO
-- ================================================

GMT.Editable.getPlayerJob = function(playerId)
    local xPlayer = GMT.Editable.GetPlayerFromId(playerId)
    if not xPlayer then return nil end

    if isESX() then
        return xPlayer.job
    else
        local job = xPlayer.PlayerData.job
        return {
            name        = job.name,
            grade       = tonumber(job.grade.level),
            label       = job.label,
            grade_label = job.grade.name,
        }
    end
end

GMT.Editable.getName = function(playerId)
    local xPlayer = GMT.Editable.GetPlayerFromId(playerId)
    if not xPlayer then return locale('no_data') end

    if isESX() then
        return xPlayer.getName()
    else
        return xPlayer.PlayerData.charinfo.firstname .. ' ' .. xPlayer.PlayerData.charinfo.lastname
    end
end

GMT.Editable.FetchPlayerBadge = function(identifier)
    local col = isESX() and 'identifier' or 'citizenid'
    local tbl = isESX() and 'users' or 'players'
    local row = MySQL.single.await(('SELECT badge FROM %s WHERE %s = ? LIMIT 1'):format(tbl, col), {identifier})
    return row and row.badge or locale('no_data')
end

GMT.Editable.ChangePlayerBadge = function(identifier, badge)
    local col = isESX() and 'identifier' or 'citizenid'
    local tbl = isESX() and 'users' or 'players'
    local affected = MySQL.update.await(('UPDATE %s SET badge = ? WHERE %s = ?'):format(tbl, col), {badge, identifier})
    return affected > 0
end

GMT.Editable.FetchPlayerRadio = function(player)
    local channel = Player(player).state.radioChannel
    if channel and channel ~= 0 then return channel end
    return locale('no_data')
end

-- ================================================
--   BSN / SSN OPZOEKEN
-- ================================================

GMT.Editable.GetPlayerFromSSN = function(ssn)
    if isESX() then
        local row = MySQL.single.await('SELECT identifier FROM users WHERE ' .. Config.SSN .. ' = ? LIMIT 1', {ssn})
        return row and row.identifier or nil
    else
        local row = MySQL.single.await('SELECT citizenid FROM players WHERE ' .. Config.SSN .. ' = ? LIMIT 1', {tonumber(ssn)})
        return row and row.citizenid or nil
    end
end

-- ================================================
--   JOBS OPHALEN
-- ================================================

GMT.Editable.FetchJobs = function()
    local Jobs = {}

    if isESX() then
        local jobs = MySQL.query.await('SELECT * FROM jobs')
        for _, v in ipairs(jobs) do
            Jobs[v.name] = v
            Jobs[v.name].grades = {}
        end

        local jobGrades = MySQL.query.await('SELECT * FROM job_grades')
        for _, v in ipairs(jobGrades) do
            if Jobs[v.job_name] then
                Jobs[v.job_name].grades[tostring(v.grade)] = v
            else
                print(('[^3WARNING^7] Rang genegeerd voor ^5"%s"^0: job niet gevonden'):format(v.job_name))
            end
        end

        for _, v in pairs(Jobs) do
            if frameworkObj.Table.SizeOf(v.grades) == 0 then
                Jobs[v.name] = nil
                print(('[^3WARNING^7] Job ^5"%s"^0 genegeerd: geen rangen gevonden'):format(v.name))
            end
        end

    else
        local sharedJobs = isQB() and frameworkObj.Shared.Jobs or exports['qbx_core']:GetJobs()

        for k, v in pairs(sharedJobs) do
            Jobs[k] = { name = k, label = v.label, grades = {} }
            for grade, gradeInfo in pairs(v.grades) do
                Jobs[k].grades[tostring(grade)] = {
                    grade = tonumber(grade),
                    label = gradeInfo.name,
                    name  = gradeInfo.name
                }
            end
        end
    end

    return Jobs
end

-- ================================================
--   JOB INSTELLEN
-- ================================================

GMT.Editable.SetPlayerJob = function(identifier, name, grade)
    local timestamp = os.date('%H:%M %d/%m/%Y', os.time())

    if isESX() then
        local xPlayer = frameworkObj.GetPlayerFromIdentifier(identifier)
        if xPlayer then xPlayer.setJob(name, grade) end
        local affected = MySQL.update.await('UPDATE users SET job = ?, job_grade = ?, jobJoined = ? WHERE identifier = ?', {name, grade, timestamp, identifier})
        return affected > 0

    else
        local xPlayer = isQB()
            and frameworkObj.Functions.GetPlayerByCitizenId(identifier)
            or exports['qbx_core']:GetPlayerByCitizenId(identifier)

        if xPlayer then xPlayer.Functions.SetJob(name, grade) end

        local row = MySQL.single.await('SELECT job FROM players WHERE citizenid = ? LIMIT 1', {identifier})
        if not row then return false end

        local jobData = json.decode(row.job)
        jobData.name = name
        jobData.grade.level = grade

        local affected = MySQL.update.await('UPDATE players SET job = ?, jobJoined = ? WHERE citizenid = ?', {json.encode(jobData), timestamp, identifier})
        return affected > 0
    end
end

-- ================================================
--   GARAGE
-- ================================================

GMT.Editable.GetGarage = function(job)
    if isESX() then
        return MySQL.query.await('SELECT garage.*, users.firstname, users.lastname FROM owned_vehicles garage LEFT JOIN users ON garage.owner = users.identifier WHERE garage.job = ? ORDER BY id DESC', {job})
    else
        return MySQL.query.await('SELECT garage.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname FROM player_vehicles garage LEFT JOIN players ON garage.citizenid = players.citizenid WHERE garage.job = ? ORDER BY id DESC', {job})
    end
end

GMT.Editable.BoughtVehicle = function(data)
    if isESX() then
        local id = MySQL.insert.await('INSERT INTO owned_vehicles (plate, vehicle, stored, type, job, vin) VALUES (?, ?, ?, ?, ?, ?)', {
            data.plate, json.encode({plate = data.plate, model = GetHashKey(data.model)}), 1, data.type, data.job, data.vin
        })
        return id ~= nil

    else
        local mods = {engineHealth = 1000.0, bodyHealth = 1000.0, fuelLevel = 100.0, model = GetHashKey(data.model), plate = data.plate}
        local xPlayer = GMT.Editable.GetPlayerFromId(data.player)
        if not xPlayer then return false end

        local id = MySQL.insert.await('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, job, vin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
            xPlayer.PlayerData.license, xPlayer.PlayerData.citizenid, data.model, GetHashKey(data.model), json.encode(mods), data.plate, 1, data.job, data.vin
        })
        return id ~= nil
    end
end

GMT.Editable.ImpoundVehicles = function(data)
    local function deleteVehicles(vehicles)
        for _, veh in ipairs(vehicles) do
            if veh.vehicleid then
                local entity = NetworkGetEntityFromNetworkId(veh.vehicleid)
                if entity and entity ~= 0 and DoesEntityExist(entity) then
                    DeleteEntity(entity)
                end
            end
        end
    end

    if isESX() then
        local vehicles = MySQL.query.await('SELECT * FROM owned_vehicles WHERE job = ? AND stored = 0', {data.job})
        if #vehicles == 0 then return locale('no_vehicles_to_tow') end

        local toPay = 500 * #vehicles
        local p = promise.new()

        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. data.job, function(account)
            if not account then
                p:resolve(locale('society_not_found'))
                return
            end
            if account.money < toPay then
                p:resolve(locale('no_society_funds'))
                return
            end
            account.removeMoney(toPay)
            deleteVehicles(vehicles)
            MySQL.update.await('UPDATE owned_vehicles SET stored = 1 WHERE job = ?', {data.job})
            p:resolve(true)
        end)

        return Citizen.Await(p)

    else
        local xPlayer = GMT.Editable.GetPlayerFromId(data.player)
        if not xPlayer then return false end

        local vehicles = MySQL.query.await('SELECT * FROM player_vehicles WHERE job = ? AND state = 0', {data.job})
        if #vehicles == 0 then return locale('no_vehicles_to_tow') end  -- FIX: was 'no_vehicles_to_impound' (ontbrekende locale)

        local toPay = 500 * #vehicles
        if xPlayer.Functions.GetMoney('bank') < toPay then
            return locale('insufficient_funds')
        end

        deleteVehicles(vehicles)
        MySQL.update.await('UPDATE player_vehicles SET state = 1 WHERE job = ?', {data.job})
        return true
    end
end

-- ================================================
--   DOCUMENTEN
-- ================================================

GMT.Editable.GetDocuments = function(job)
    if isESX() then
        return MySQL.query.await('SELECT documents.*, owner.firstname AS ownerFname, owner.lastname AS ownerLname, worker.firstname AS workerFname, worker.lastname AS workerLname FROM gmt_documents documents LEFT JOIN users AS owner ON documents.owner = owner.identifier LEFT JOIN users AS worker ON documents.officer = worker.identifier WHERE documents.job = ? ORDER BY documents.id DESC', {job})
    else
        return MySQL.query.await('SELECT documents.*, JSON_UNQUOTE(JSON_EXTRACT(owner.charinfo, "$.firstname")) AS ownerFname, JSON_UNQUOTE(JSON_EXTRACT(owner.charinfo, "$.lastname")) AS ownerLname, JSON_UNQUOTE(JSON_EXTRACT(worker.charinfo, "$.firstname")) AS workerFname, JSON_UNQUOTE(JSON_EXTRACT(worker.charinfo, "$.lastname")) AS workerLname FROM gmt_documents documents LEFT JOIN players AS owner ON documents.owner = owner.citizenid LEFT JOIN players AS worker ON documents.officer = worker.citizenid WHERE documents.job = ? ORDER BY documents.id DESC', {job})
    end
end

-- ================================================
--   ROLSTOELEN
-- ================================================

GMT.Editable.GetWheelChairs = function()
    if isESX() then
        return MySQL.query.await('SELECT garage.*, users.firstname, users.lastname FROM owned_vehicles garage LEFT JOIN users ON garage.owner = users.identifier WHERE garage.wheelchair = 1 ORDER BY id DESC')
    else
        return MySQL.query.await('SELECT garage.*, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.firstname")) AS firstname, JSON_UNQUOTE(JSON_EXTRACT(players.charinfo, "$.lastname")) AS lastname FROM player_vehicles garage LEFT JOIN players ON garage.citizenid = players.citizenid WHERE garage.wheelchair = 1 ORDER BY id DESC')
    end
end

GMT.Editable.SetWheelChair = function(data)
    local newPlate = GMT.Editable.GeneratePlate()
    local targetIdentifier = GMT.Editable.GetPlayerFromSSN(data.ssn)

    if not targetIdentifier then
        GMT.Editable.ShowNotify(data.source, locale('person_not_available'))
        return false
    end

    if isESX() then
        local xTarget = frameworkObj.GetPlayerFromIdentifier(targetIdentifier)
        if not xTarget then
            GMT.Editable.ShowNotify(data.source, locale('person_not_available'))
            return false
        end
        local id = MySQL.insert.await('INSERT INTO owned_vehicles (owner, plate, vehicle, stored, type, wheelchair, wheelchairTime) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            xTarget.identifier, newPlate,
            json.encode({model = 'iak_wheelchair', engineHealth = 1000.0, fuelLevel = 100.0, bodyHealth = 1000.0, plate = newPlate}),
            1, 'car', 1, os.time() + (data.hours * 3600)
        })
        if id then GMT.Editable.ShowNotify(data.source, locale('wheelchair_added')) return true end

    else
        local xTarget = isQB()
            and frameworkObj.Functions.GetPlayerByCitizenId(targetIdentifier)
            or exports['qbx_core']:GetPlayerByCitizenId(targetIdentifier)

        if not xTarget then
            GMT.Editable.ShowNotify(data.source, locale('person_not_available'))
            return false
        end
        local id = MySQL.insert.await('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, plate, state, wheelchair, wheelchairTime) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
            xTarget.PlayerData.license, xTarget.PlayerData.citizenid,
            'iak_wheelchair', GetHashKey('iak_wheelchair'),
            newPlate, 1, 1, os.time() + (data.hours * 3600)
        })
        if id then GMT.Editable.ShowNotify(data.source, locale('wheelchair_added')) return true end
    end

    return false
end

GMT.Editable.RemoveWheelChair = function(data)
    local tbl = isESX() and 'owned_vehicles' or 'player_vehicles'
    local row = MySQL.single.await(('SELECT * FROM %s WHERE plate = ? AND wheelchair = 1'):format(tbl), {data.plate})

    if not row then return false end

    if row.vehicleid then
        local entity = NetworkGetEntityFromNetworkId(tonumber(row.vehicleid))
        if entity and entity ~= 0 and DoesEntityExist(entity) then
            DeleteEntity(entity)
        end
    end

    MySQL.update.await(('DELETE FROM %s WHERE plate = ? AND wheelchair = 1'):format(tbl), {data.plate})
    GMT.Editable.ShowNotify(data.source, locale('wheelchair_removed'))
    return true
end

-- ================================================
--   BETALEN / BOETES
-- ================================================

GMT.Editable.Pay = function(data)
    if isESX() then
        local p = promise.new()
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. data.job, function(account)
            if not account then p:resolve(false) return end
            if account.money < data.price then p:resolve(false) return end
            account.removeMoney(data.price)
            p:resolve(true)
        end)
        return Citizen.Await(p)

    else
        local xPlayer = isQB()
            and frameworkObj.Functions.GetPlayer(data.player)
            or exports['qbx_core']:GetPlayer(data.player)
        if not xPlayer then return false end
        if xPlayer.Functions.GetMoney('bank') < data.price then return false end
        xPlayer.Functions.RemoveMoney('bank', data.price)
        return true
    end
end

GMT.Editable.PayFine = function(playerId, data)
    -- FIX: was 'local _source = player' (player bestond niet, playerId wordt nu correct gebruikt)
    local totalFine = tonumber(data.fine)
    local offenses  = data.offenses
    local citizens  = data.citizens

    local displayReason = ''
    for _, v in pairs(offenses) do
        local entry = v.count .. 'x ' .. v.label
        displayReason = displayReason == '' and entry or (displayReason .. ', ' .. entry)
    end

    for _, v in pairs(citizens) do
        if isESX() then
            local xTarget = frameworkObj.GetPlayerFromIdentifier(v.identifier)
            if xTarget then
                xTarget.removeAccountMoney('bank', totalFine)
                GMT.Editable.ShowNotify(xTarget.source, (locale('invoice_issued')):format(totalFine, displayReason))
            end
        elseif isQB() then
            local xTarget = GMT.Editable.GetPlayerFromIdentifier(v.identifier)
            if xTarget then xTarget.Functions.RemoveMoney('bank', totalFine, 'boete-betaling') end
        elseif isQBOX() then
            local xTarget = exports['qbx_core']:GetPlayerByCitizenId(v.identifier)
            if xTarget then xTarget.Functions.RemoveMoney('bank', totalFine, 'boete-betaling') end
        end
    end

    if isESX() then
        local xPlayer = frameworkObj.GetPlayerFromId(playerId)
        if not xPlayer then return end
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. xPlayer.job.name, function(account)
            if account then account.addMoney(totalFine) end
        end)
    elseif isQB() then
        local xPlayer = frameworkObj.Functions.GetPlayer(playerId)
        if xPlayer then exports['qb-banking']:AddMoney(xPlayer.PlayerData.job.name, totalFine, 'boete') end
    elseif isQBOX() then
        -- Configureer hier jouw QBOX society account systeem
        print('[QBOX] Society account nog niet geconfigureerd voor boetes.')
    end
end

-- ================================================
--   KENTEKEN & VIN GENEREREN
-- ================================================

local plateChars = 'ABCDEFGIHJKLMNOPRSTXWYUZ1234567890'

GMT.Editable.GeneratePlate = function()
    local tbl = isESX() and 'owned_vehicles' or 'player_vehicles'
    local newPlate
    repeat
        newPlate = ''
        for i = 1, 8 do
            local r = math.random(1, #plateChars)
            newPlate = newPlate .. plateChars:sub(r, r)
        end
    until not MySQL.single.await(('SELECT plate FROM %s WHERE plate = ?'):format(tbl), {newPlate})
    return newPlate
end

GMT.Editable.GenerateVIN = function()
    if GetResourceState('piotreq_phone') ~= 'missing' then
        return exports['piotreq_phone']:GenerateVIN()
    end
    local tbl = isESX() and 'owned_vehicles' or 'player_vehicles'
    local newVIN
    repeat
        newVIN = ''
        for i = 1, 12 do
            local r = math.random(1, #plateChars)
            newVIN = newVIN .. plateChars:sub(r, r)
        end
    until not MySQL.single.await(('SELECT vin FROM %s WHERE vin = ?'):format(tbl), {newVIN})
    return newVIN
end

exports('GenerateVIN', GMT.Editable.GenerateVIN)

-- ================================================
--   MEDISCHE PROCEDURES
-- ================================================

GMT.Editable.GetLastProcedure = function(identifier)
    return MySQL.single.await('SELECT * FROM gmt_citizens_procedures WHERE player = ? ORDER BY id DESC LIMIT 1', {identifier})
end

-- ================================================
--   MEDEWERKERS OPHALEN
-- ================================================

GMT.Editable.FetchEmployees = function(jobName)
    local request = isESX()
        and 'SELECT * FROM users WHERE job = ?'
        or  'SELECT * FROM players WHERE JSON_EXTRACT(job, "$.name") = ?'

    local employees = MySQL.query.await(request, {jobName})
    local result = {}

    for _, employee in ipairs(employees) do
        local workerIdentifier = employee.identifier or employee.citizenid
        local xEmployee = GMT.Editable.GetPlayerFromIdentifier(workerIdentifier)
        local workerId = xEmployee and (xEmployee.source or xEmployee.PlayerData.source) or nil

        local playerRadio = '-'
        if workerId then
            local channel = GMT.Editable.FetchPlayerRadio(workerId)
            if channel and channel ~= 0 and type(channel) ~= 'string' then
                playerRadio = Config.RadioChannels[tostring(channel)]
                    and ('#' .. channel .. ' - ' .. Config.RadioChannels[tostring(channel)])
                    or  ('#' .. channel)
            end
        end

        local dutyData = exports['piotreq_jobcore']:GetPlayerDutyData(workerIdentifier)
        local charinfo = {
            firstname = employee.charinfo and json.decode(employee.charinfo).firstname or employee.firstname,
            lastname  = employee.charinfo and json.decode(employee.charinfo).lastname  or employee.lastname,
            job_grade = isESX() and employee.job_grade or json.decode(employee.job).grade.level,
        }

        result[#result + 1] = {
            identifier     = workerIdentifier,
            name           = charinfo.firstname .. ' ' .. charinfo.lastname,
            grade_label    = GMT.Jobs[jobName].grades[tostring(charinfo.job_grade)] and GMT.Jobs[jobName].grades[tostring(charinfo.job_grade)].label or locale('no_data'),
            grade          = tonumber(charinfo.job_grade),
            badge          = GMT.Editable.FetchPlayerBadge(workerIdentifier),
            status         = dutyData and dutyData.status or 0,
            radio          = playerRadio,
            dutyTime       = employee.dutyTime or 0,
            lastActive     = employee.lastActive or locale('no_data')
        }
    end

    local order = {[1] = 1, [2] = 2, [0] = 3}
    table.sort(result, function(a, b) return (order[a.status] or 3) < (order[b.status] or 3) end)
    table.sort(result, function(a, b) return b.grade < a.grade end)

    return result
end

-- ================================================
--   SPELER DISCONNECT
-- ================================================

RegisterNetEvent('esx:playerDropped', function(player)
    if not isESX() then return end
    local xPlayer = GMT.Editable.GetPlayerFromId(player)
    if not xPlayer then return end
    MySQL.update('UPDATE users SET lastActive = ? WHERE identifier = ?', {
        os.date('%H:%M %d/%m/%Y', os.time()), xPlayer.identifier
    })
end)