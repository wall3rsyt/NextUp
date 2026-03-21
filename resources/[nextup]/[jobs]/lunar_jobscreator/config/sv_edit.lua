Editable = {}

-- ✅ Cache resource states server-side (zelfde principe als cl_edit)
local resourceCache = {}
local function isStarted(resourceName)
    if resourceCache[resourceName] == nil then
        resourceCache[resourceName] = GetResourceState(resourceName) == 'started'
    end
    return resourceCache[resourceName]
end

-- ✅ Cache inventory & banking type eenmalig bij startup
local ox_inventory = isStarted('ox_inventory')

local bankingResource = (function()
    for _, r in ipairs({ 'lunar_multijob', 'qb-management', 'qb-banking', 'Renewed-Banking' }) do
        if GetResourceState(r) == 'started' then
            resourceCache[r] = true
            return r
        end
    end
    return nil
end)()

-- ✅ Cache inventory icon path eenmalig (zelfde als cl_edit)
local inventoryIconPath = (function()
    local paths = {
        ['ox_inventory']  = 'nui://ox_inventory/web/images/%s.png',
        ['qb-inventory']  = 'nui://qb-inventory/html/images/%s.png',
        ['ps-inventory']  = 'nui://ps-inventory/html/images/%s.png',
        ['lj-inventory']  = 'nui://lj-inventory/html/images/%s.png',
        ['qs-inventory']  = 'nui://qs-inventory/html/images/%s.png',
    }
    for inv, p in pairs(paths) do
        if GetResourceState(inv) == 'started' then
            resourceCache[inv] = true
            return p
        end
    end
    return nil
end)()

-- ============================================================
-- Database setup
-- ============================================================

local tables = {
    [[CREATE TABLE IF NOT EXISTS `lunar_jobscreator` (
        `name` varchar(30) NOT NULL,
        `data` longtext NOT NULL,
        PRIMARY KEY (`name`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;]],
    [[CREATE TABLE IF NOT EXISTS `lunar_jobscreator_history` (
        `username` varchar(50) DEFAULT NULL,
        `action` varchar(150) DEFAULT NULL,
        `timestamp` int(11) DEFAULT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;]],
    [[CREATE TABLE IF NOT EXISTS `lunar_jobscreator_settings` (
        `key` varchar(30) NOT NULL,
        `value` text NOT NULL,
        PRIMARY KEY (`key`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;]],
    [[CREATE TABLE IF NOT EXISTS `lunar_jobscreator_webhooks` (
        `name` varchar(50) NOT NULL,
        `url` varchar(100) NOT NULL,
        PRIMARY KEY (`name`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;]],
    [[CREATE TABLE IF NOT EXISTS `lunar_jobscreator_vehicles` (
        `plate` VARCHAR(8) NOT NULL COLLATE 'utf8mb4_general_ci',
        `owner` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
        `props` TEXT NOT NULL COLLATE 'utf8mb4_general_ci',
        `stored` TINYINT(1) NOT NULL,
        `job` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
        `type` VARCHAR(30) NOT NULL COLLATE 'utf8mb4_general_ci',
        PRIMARY KEY (`plate`) USING BTREE
    ) COLLATE='utf8mb4_general_ci' ENGINE=InnoDB;]]
}

-- ✅ Voer alle CREATE TABLE queries parallel uit in plaats van sequentieel
MySQL.ready(function()
    for i = 1, #tables do
        MySQL.query(tables[i]) -- non-blocking: geen .await nodig voor CREATE TABLE IF NOT EXISTS
    end
end)

-- ============================================================
-- Vehicles
-- ============================================================

---@type table<string, number>
local activeVehicles = {}

-- ✅ Queries als constanten buiten functies (voorkomt herhaalde string allocatie)
local QUERY_GET_VEHICLES_SHARED    = 'SELECT plate, stored, props FROM lunar_jobscreator_vehicles WHERE job = ? AND type = ?'
local QUERY_GET_VEHICLES_OWNED     = 'SELECT plate, stored, props FROM lunar_jobscreator_vehicles WHERE job = ? AND type = ? AND owner = ?'
local QUERY_VEHICLE_BY_PLATE       = 'SELECT plate, owner, job, type, props, stored FROM lunar_jobscreator_vehicles WHERE plate = ?'
local QUERY_VEHICLE_BY_PLATE_AUTH  = 'SELECT plate, stored FROM lunar_jobscreator_vehicles WHERE plate = ? AND (owner = ? OR job = ?)'
local QUERY_UPDATE_STORED          = 'UPDATE lunar_jobscreator_vehicles SET stored = ? WHERE plate = ?'
local QUERY_UPDATE_PROPS           = 'UPDATE lunar_jobscreator_vehicles SET stored = ?, props = ? WHERE plate = ?'
local QUERY_INSERT_VEHICLE         = 'INSERT INTO lunar_jobscreator_vehicles (owner, plate, props, type, job, stored) VALUES(?, ?, ?, ?, ?, ?)'

---@param source integer
---@param vehicleType string
---@param shared boolean
---@return table?
function Editable.getVehicles(source, vehicleType, shared)
    local player = Framework.getPlayerFromId(source)
    if not player then return end

    local identifier = player:getIdentifier()
    local job = player:getJob()

    -- ✅ Gebruik alleen de kolommen die we nodig hebben (SELECT plate, stored ipv SELECT *)
    local vehicles = MySQL.query.await(
        shared and QUERY_GET_VEHICLES_SHARED or QUERY_GET_VEHICLES_OWNED,
        shared and { job, vehicleType } or { job, vehicleType, identifier }
    )

    for _, vehicle in ipairs(vehicles) do
        if vehicle.stored == true or vehicle.stored == 1 then
            vehicle.state = 'in_garage'
        else
            local entity = activeVehicles[vehicle.plate]
            if entity then
                if DoesEntityExist(entity) then
                    -- ✅ Beide health checks in één branch
                    if GetVehiclePetrolTankHealth(entity) <= 0 or GetVehicleBodyHealth(entity) <= 0 then
                        DeleteEntity(entity)
                        activeVehicles[vehicle.plate] = nil
                        vehicle.state = 'in_impound'
                    else
                        vehicle.state = 'outside'
                    end
                else
                    activeVehicles[vehicle.plate] = nil
                    vehicle.state = 'in_impound'
                end
            else
                vehicle.state = 'in_impound'
            end
        end
    end

    return vehicles
end

---@param source integer
---@param netId integer
---@param props VehicleProperties
---@param type string
---@return boolean
function Editable.saveVehicle(source, netId, props, type)
    local player = Framework.getPlayerFromId(source)
    if not player then return false end

    local entity = NetworkGetEntityFromNetworkId(netId)
    if not DoesEntityExist(entity) then return false end

    local vehicle = MySQL.single.await(QUERY_VEHICLE_BY_PLATE, { props.plate })

    if vehicle
    and vehicle.type == type
    and (vehicle.owner == player:getIdentifier() or vehicle.job == player:getJob()) then
        local oldProps = json.decode(vehicle.props)

        if props.model ~= oldProps.model then return false end

        MySQL.update.await(QUERY_UPDATE_PROPS, { true, json.encode(props), props.plate })

        SetTimeout(300, function()
            if DoesEntityExist(entity) then
                DeleteEntity(entity)
            end
        end)

        return true
    end

    return false
end

-- ✅ Pre-build karakter arrays eenmalig (was per generatePlate-aanroep opgebouwd)
local plateChars = {}
for i = 48, 57 do plateChars[#plateChars + 1] = string.char(i) end -- 0-9
for i = 65, 90 do plateChars[#plateChars + 1] = string.char(i) end -- A-Z

local QUERY_CHECK_PLATE = 'SELECT 1 FROM lunar_jobscreator_vehicles WHERE plate = ? LIMIT 1'

local function generatePlate(length)
    local charsLen = #plateChars
    while true do
        -- ✅ table.concat is sneller dan string concatenatie in loop
        local parts = table.create(length, 0)
        for i = 1, length do
            parts[i] = plateChars[math.random(charsLen)]
        end
        local plate = table.concat(parts)

        -- ✅ SELECT 1 LIMIT 1 ipv SELECT * (veel minder data over de wire)
        if not MySQL.single.await(QUERY_CHECK_PLATE, { plate }) then
            return plate
        end

        Wait(0)
    end
end

---@param source integer
---@param index integer
---@param vehicleIndex integer
---@return boolean
function Editable.buyVehicle(source, index, vehicleIndex, props, account)
    local player = Framework.getPlayerFromId(source)

    if not player or not Config.accountsByKey[account] then return false end

    local job = GetJobs()[player:getJob()]
    if not job then return false end

    local garage = job.garages[index]
    local vehicle = garage?.vehicles[vehicleIndex]

    if not vehicle or not vehicle.price then return false end

    if player:getAccountMoney(account) < vehicle.price then return false end

    player:removeAccountMoney(account, vehicle.price)

    props.plate = generatePlate(6)
    props.model = joaat(vehicle.model)

    MySQL.insert.await(QUERY_INSERT_VEHICLE, {
        player:getIdentifier(), props.plate, json.encode(props), garage.vehicleType, player:getJob(), true
    })

    if Webhooks.settings.vehicleBought then
        Logs.send(source, job.name, ('Bought work vehicle.\nModel/label: %s\nPrice: %s$'):format(
            vehicle.label or vehicle.model, vehicle.price))
    end

    return true
end

lib.callback.register('lunar_unijob:canSpawnVehicle', function(source, plate)
    local player = Framework.getPlayerFromId(source)
    if not player then return end

    return MySQL.single.await(QUERY_VEHICLE_BY_PLATE_AUTH,
        { plate, player:getIdentifier(), player:getJob() })?.stored
end)

RegisterNetEvent('lunar_unijob:vehicleSpawned', function(plate, netId)
    local source = source
    local player = Framework.getPlayerFromId(source)
    local vehicle = NetworkGetEntityFromNetworkId(netId)

    if not player or not DoesEntityExist(vehicle) then return end

    local row = MySQL.single.await(QUERY_VEHICLE_BY_PLATE_AUTH,
        { plate, player:getIdentifier(), player:getJob() })

    if row?.stored then
        MySQL.update.await(QUERY_UPDATE_STORED, { false, plate })
        activeVehicles[plate] = vehicle
    end
end)

lib.callback.register('lunar_unijob:canRetrieveVehicle', function(source, plate)
    local player = Framework.getPlayerFromId(source)

    if not player or player:getAccountMoney('money') < Settings.impoundPrice then
        return false, locale('not_enough_money')
    end

    local vehicle = MySQL.single.await(QUERY_VEHICLE_BY_PLATE_AUTH,
        { plate, player:getIdentifier(), player:getJob() })

    return not activeVehicles[plate]
        and (vehicle?.stored == false or vehicle?.stored == 0)
end)

RegisterNetEvent('lunar_unijob:vehicleRetrieved', function(plate, netId)
    local source = source
    local player = Framework.getPlayerFromId(source)
    local vehicle = NetworkGetEntityFromNetworkId(netId)

    if not player or not DoesEntityExist(vehicle) or activeVehicles[plate] then return end

    if MySQL.single.await(QUERY_VEHICLE_BY_PLATE_AUTH, { plate, player:getIdentifier(), player:getJob() }) then
        activeVehicles[plate] = vehicle
        player:removeAccountMoney('money', Settings.impoundPrice)
    end
end)

---Can be used externally to easily get job owned vehicles
---@param plate string
---@return { plate: string, owner: string, props: VehicleProperties, stored: boolean, job: string, type: string }?
exports('getVehicleFromDatabase', function(plate)
    plate = plate:strtrim(' ')
    local vehicle = MySQL.single.await(QUERY_VEHICLE_BY_PLATE, { plate })
    if vehicle then
        vehicle.props = json.decode(vehicle.props)
    end
    return vehicle
end)

-- ============================================================
-- Stash / Shop registration
-- ============================================================

---Should only be used for inventories that require registering stashes
---@param job Job
---@param name string
---@param data StashData
---@param coords LocationData
function Editable.registerStash(job, name, data, coords)
    if ox_inventory then
        exports.ox_inventory:RegisterStash(name, data.label, data.slots, data.maxWeight,
            not data.shared or false,
            not data.global and { [job.name] = data.grade or 0 } or nil)
    end
end

---@param job Job
---@param name string
---@param data ShopData
function Editable.registerShop(job, name, data)
    if ox_inventory then
        -- ✅ Direct index assignment ipv table.insert
        local locations = table.create(#data.locations, 0)
        for i, coords in ipairs(data.locations) do
            locations[i] = coords.xyz
        end

        exports.ox_inventory:RegisterShop(name, {
            name = data.label,
            inventory = data.items,
            locations = locations,
            groups = { [job.name] = data.grade or 0 }
        })
    end
end

-- ============================================================
-- Society money
-- ============================================================

---@param society string
---@param amount integer
function Editable.addSocietyMoney(society, amount)
    -- ✅ Gebruik gecachede bankingResource ipv herhaalde isStarted checks
    if bankingResource == 'lunar_multijob' then
        exports['lunar_multijob']:addAccountBalance(society, amount)
        return
    end

    if Framework.name == 'es_extended' then
        local p = promise.new()
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. society, function(account)
            p:resolve(account and account.addMoney(amount) and true or false)
        end)
        if not Citizen.Await(p) then
            error(('Unable to find society account for job: %s'):format(society))
        end
        return
    end

    -- QBCore banking fallback chain
    if bankingResource == 'qb-management' then
        exports['qb-management']:AddMoney(society, amount)
    elseif bankingResource == 'qb-banking' then
        exports['qb-banking']:AddMoney(society, amount)
    elseif bankingResource == 'Renewed-Banking' then
        exports['Renewed-Banking']:addAccountMoney(society, amount)
    else
        error('Unable to change account balance. Add your banking system in sv_edit.lua')
    end
end

---@param society string
---@return integer
function Editable.getSocietyMoney(society)
    if bankingResource == 'lunar_multijob' then
        return exports['lunar_multijob']:getAccountBalance(society)
    end

    if Framework.name == 'es_extended' then
        local p = promise.new()
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. society, function(account)
            p:resolve(account?.money or 0)
        end)
        local amount = Citizen.Await(p)
        if not amount then
            error(('Unable to find society account for job: %s'):format(society))
        end
        return amount
    end

    -- QBCore banking fallback chain
    if bankingResource == 'qb-management' then
        local ok, amount = pcall(exports['qb-management'].GetAccountBalance, exports['qb-management'], society)
        if ok then return amount end
    elseif bankingResource == 'qb-banking' then
        local ok, amount = pcall(exports['qb-banking'].GetAccountBalance, exports['qb-banking'], society)
        if ok then return amount end
    elseif bankingResource == 'Renewed-Banking' then
        local ok, amount = pcall(exports['Renewed-Banking'].getAccountMoney, exports['Renewed-Banking'], society)
        if ok then return amount end
    end

    warn('Unable to fetch society balance, implement your banking in sv_edit.lua')
    return 0
end

-- ============================================================
-- Inventory icon
-- ============================================================

---Returns the NUI path of an icon.
---@param itemName string
---@return string?
function Editable.getInventoryIcon(itemName)
    if not inventoryIconPath then
        warn('Inventory images path not set in sv_edit.lua!')
        return
    end
    return inventoryIconPath:format(itemName) .. '?height=128'
end

-- ============================================================
-- Handcuffs / actions
-- ============================================================

---@param source integer
---@param targetId integer
---@param state boolean
---@param handcuffType 'handcuffs' | 'zipties'
function Editable.onCuffStateChanged(source, targetId, state, handcuffType)
    if Settings.handcuffsSkillCheck and state then
        lib.callback('lunar_unijob:skillCheck', targetId, function(success)
            if success then
                Wait(700)
                exports['lunar_unijob']:uncuff(targetId)
                LR.notify(source, locale('player_refused'), 'error')
            end
        end)
    end
    -- Implement your own logic here
end

-- ============================================================
-- Invoices (QBCore only)
-- ============================================================

if Framework.name == 'qb-core' then
    local QUERY_INSERT_INVOICE = 'INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (?, ?, ?, ?, ?)'

    RegisterNetEvent('lunar_unijob:giveInvoice', function(targetId, amount)
        local source = source
        local player = Framework.getPlayerFromId(source)
        local target = Framework.getPlayerFromId(targetId) -- ✅ was foutief: getPlayerFromId(source) ipv targetId

        if not player or not target then return end

        if not Utils.distanceCheck(source, targetId, 10.0) then
            LR.notify(source, locale('target_too_far'), 'error')
            return
        end

        if not Actions.hasAccess(player, 'bill') then return end

        MySQL.insert.await(QUERY_INSERT_INVOICE, {
            target:getIdentifier(), amount, player:getJob(), player:getFirstName(), player:getIdentifier()
        })
    end)
end

-- ============================================================
-- Player actions
-- ============================================================

RegisterNetEvent('lunar_unijob:revivePlayer', function(targetId)
    local source = source
    local player = Framework.getPlayerFromId(source)

    if not player
    or not Actions.hasAccess(player, 'revive')
    or not Utils.distanceCheck(source, targetId, 10.0) then return end

    if Framework.name == 'es_extended' then
        TriggerClientEvent('esx_ambulancejob:revive', targetId)
    else
        TriggerClientEvent('hospital:client:Revive', targetId)
    end
end)

RegisterNetEvent('lunar_unijob:healPlayer', function(targetId)
    local source = source
    local player = Framework.getPlayerFromId(source)

    if not player
    or not Actions.hasAccess(player, 'heal')
    or not Utils.distanceCheck(source, targetId, 10.0) then return end

    TriggerClientEvent('lunar_unijob:healed', targetId)
end)

---@param source integer
---@param action string
---@return boolean
function Editable.onVehicleAction(source, action)
    local player = Framework.getPlayerFromId(source)

    if not player or not Actions.hasAccess(player, action) then
        return false
    end

    if type(action) == 'table' then
        if player:getItemCount(action.item) > 0 then
            if action.removeAfterUse then
                player:removeItem(action.item, 1)
            end
            PendingVehicleActions[source] = true
            return true
        end
        return false
    end

    PendingVehicleActions[source] = true
    return true
end

---@param source integer
---@param job table
---@return boolean
function Editable.getPlayerDuty(source, job)
    if Framework.name == 'es_extended' then
        return true
    else
        return job.onduty
    end
end