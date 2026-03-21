Editable = {}

-- ✅ Cache resource states at startup (avoids repeated GetResourceState native calls every function call)
local resourceCache = {}
local function isStarted(resourceName)
    if resourceCache[resourceName] == nil then
        resourceCache[resourceName] = GetResourceState(resourceName) == 'started'
    end
    return resourceCache[resourceName]
end

-- ✅ Cache inventory type once at startup instead of checking every call
local inventoryType = (function()
    local inventories = { 'ox_inventory', 'qb-inventory', 'ps-inventory', 'lj-inventory', 'qs-inventory' }
    for _, inv in ipairs(inventories) do
        if GetResourceState(inv) == 'started' then
            resourceCache[inv] = true
            return inv
        end
    end
    return nil
end)()

-- ✅ Cache clothing resource once at startup
local clothingResource = (function()
    local options = { 'fivem-appearance', 'illenium-appearance', 'qb-clothing' }
    for _, r in ipairs(options) do
        if GetResourceState(r) == 'started' then
            resourceCache[r] = true
            return r
        end
    end
    return nil
end)()

-- ✅ Cache inventory icon path once (was re-evaluated on every getInventoryIcon call)
local inventoryIconPath = (function()
    local paths = {
        ['ox_inventory']  = 'nui://ox_inventory/web/images/%s.png',
        ['qb-inventory']  = 'nui://qb-inventory/html/images/%s.png',
        ['ps-inventory']  = 'nui://ps-inventory/html/images/%s.png',
        ['lj-inventory']  = 'nui://lj-inventory/html/images/%s.png',
        ['qs-inventory']  = 'nui://qs-inventory/html/images/%s.png',
    }
    return inventoryType and paths[inventoryType] or nil
end)()

function Editable.openCloakroom()
    if clothingResource == 'fivem-appearance' then
        TriggerEvent('fivem-appearance:clothingShop')
    elseif clothingResource == 'illenium-appearance' then
        TriggerEvent('illenium-appearance:client:openClothingShopMenu', false)
    elseif clothingResource == 'qb-clothing' then
        TriggerEvent('qb-clothing:client:openOutfitMenu')
    else
        error('No script for clothing found! Supported: fivem-appearance/illenium-appearance/qb-clothing')
    end
end

---@param vehicle number
function Editable.onVehicleSpawned(vehicle)
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    local plate = GetVehicleNumberPlateText(vehicle):strtrim(' ')

    if isStarted('qs-vehiclekeys') then
        exports['qs-vehiclekeys']:GiveKeys(plate, model, true)
    else
        TriggerEvent("vehiclekeys:client:SetOwner", plate)
    end
end

function Editable.onVehicleSaved(vehicle)
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    local plate = GetVehicleNumberPlateText(vehicle):strtrim(' ')

    if isStarted('qs-vehiclekeys') then
        exports['qs-vehiclekeys']:RemoveKeys(plate, model)
    else
        TriggerEvent("qb-vehiclekeys:client:RemoveKeys", plate)
    end
end

---@param args { name: string, data: StashData }
function Editable.openStash(args)
    local name, data in args

    if inventoryType == 'ox_inventory' then
        exports.ox_inventory:openInventory('stash', name)
    elseif inventoryType == 'qb-inventory'
        or inventoryType == 'qs-inventory'
        or inventoryType == 'ps-inventory'
        or inventoryType == 'lj-inventory' then
        local stashName = data.shared and name or (name .. '_' .. Framework.getIdentifier())

        TriggerServerEvent('inventory:server:OpenInventory', 'stash', stashName, {
            label = data.label,
            maxweight = data.maxWeight,
            slots = data.slots
        })
        TriggerEvent("inventory:client:SetCurrentStash", stashName)
    else
        warn('Your inventory script doesn\'t support stashes.')
    end
end

---@param data { index: integer, locationIndex: integer, itemIndex: integer }
local function buyItem(data)
    local index, locationIndex, itemIndex in data
    local shop = GetCurrentJob().shops[index]
    local amount = lib.inputDialog(locale('shop_header'), {
        {
            type = 'number',
            label = locale('amount'),
            min = 1,
            required = true
        }
    })?[1]

    if not amount then
        lib.showContext('shop')
        return
    end

    local success, msg = lib.callback.await('lunar_unijob:buyItem', false, index, locationIndex, itemIndex, amount)

    if success then
        if shop.ped then
            LR.progressBar(locale('buying'), 3000, false, {
                dict = 'misscarsteal4@actor',
                clip = 'actor_berating_loop'
            })
        end
        LR.notify(locale('bought_item'), 'success')
    elseif msg then
        LR.notify(msg, 'error')
    end
end

---@param job Job
---@param index integer
---@param locationIndex integer
local function openBuiltinShop(job, index, locationIndex)
    local shop = job.shops[index]
    -- ✅ Pre-allocate options table size hint (avoids repeated table resizing)
    local options = table.create(#shop.items, 0)
    local optCount = 0

    for itemIndex, item in ipairs(shop.items) do
        if HasGrade(item.grade) then
            optCount = optCount + 1
            -- ✅ Direct index assignment instead of table.insert (faster)
            options[optCount] = {
                title = Utils.getItemLabel(item.name),
                description = locale('shop_price', item.price),
                icon = item.icon,
                image = item.image or Editable.getInventoryIcon(item.name),
                onSelect = buyItem,
                args = { index = index, locationIndex = locationIndex, itemIndex = itemIndex }
            }
        end
    end

    lib.registerContext({
        id = 'shop',
        title = locale('shop'),
        options = options
    })

    lib.showContext('shop')
end

---@param data { job: Job, index: integer, locationIndex: integer }
function Editable.openShop(data)
    local job, index, locationIndex in data
    local name = ('%s_shop_%s'):format(job.name, index)

    if inventoryType == 'ox_inventory' then
        exports.ox_inventory:openInventory('shop', { type = name, id = locationIndex })
    elseif inventoryType == 'qb-inventory' or inventoryType == 'ps-inventory'
    or inventoryType == 'lj-inventory' or inventoryType == 'qs-inventory' then
        openBuiltinShop(job, index, locationIndex)
    else
        warn('Configure cl_edit.lua shops for your inventory.')
    end
end

---Used for cash registers and buy garages
---@return { label: string, value: string }[]
function Editable.getPaymentMethods()
    -- ✅ Pre-allocate table
    local options = table.create(#Config.accounts, 0)
    for i, account in ipairs(Config.accounts) do
        options[i] = {
            label = locale(account),
            value = account
        }
    end
    return options
end

---Used to check if player is dead
---@param ped number
function Editable.isDead(ped)
    return IsEntityDead(ped)
        or IsEntityPlayingAnim(ped, 'dead', 'dead_a', 3)
end

---You can add override player actions here
---@type table<string, fun(targetId: number, entity: number)>
PlayerActionOverrides = {}

---You can add override vehicle actions here
---@type table<string, fun(entity: number)>
VehicleActionOverrides = {
    -- impound = function(entity)
    --
    -- end
}

---You can add your own canInteract functions for player/vehicle actions here
---@type table<string, fun(entity: number): boolean?>
Editable.canInteractFilter = {
    revive = function(entity)
        return Editable.isDead(entity)
    end,
    handcuff = function(entity)
        return not Editable.isDead(entity)
    end,
    drag = function(entity)
        return not Editable.isDead(entity)
    end
}

---@param action string
function Editable.actionPerformed(action)
    -- Add your own logic here
end

function Editable.searchPlayer(targetId)
    if not LR.progressBar(locale('searching'), Settings.durations.steal, false, {
        dict = 'missbigscore2aig_7@driver',
        clip = 'boot_r_loop',
        flag = 1
    }) then return end

    if inventoryType == 'ox_inventory' then
        exports.ox_inventory:openInventory('player', targetId)
    else
        TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", targetId)
    end
end

function Editable.giveInvoice(targetId)
    local job = GetCurrentJob()

    if not job then return end

    local amount = lib.inputDialog(locale('invoice_heading'), {
        {
            type = 'number',
            label = locale('invoice_amount'),
            icon = 'dollar-sign',
            min = 1,
            required = true
        }
    })?[1]

    if not amount then return end

    if Framework.name == 'es_extended' then
        TriggerServerEvent('esx_billing:sendBill', targetId, 'society_' .. job.name, job.label, amount)
    else
        TriggerServerEvent('lunar_unijob:giveInvoice', targetId, amount)
    end

    LR.notify(locale('sent_bill'), 'success')
end

function Editable.revivePlayer(targetId)
    if not LR.progressBar(locale('reviving'), Settings.durations.revive, false, {
        dict = 'mini@cpr@char_a@cpr_str',
        clip = 'cpr_pumpchest',
        flag = 1
    }) then return end

    TriggerServerEvent('lunar_unijob:revivePlayer', targetId)
end

function Editable.healPlayer(targetId)
    if not LR.progressBar(locale('healing'), Settings.durations.heal, false, {
        dict = 'missheistdockssetup1clipboard@idle_a',
        clip = 'idle_a',
        flag = 1
    }) then return end

    TriggerServerEvent('lunar_unijob:healPlayer', targetId)
end

-- No need to secure this event, cheaters can abuse natives anyways
RegisterNetEvent('lunar_unijob:healed', function()
    SetEntityHealth(cache.ped, GetEntityMaxHealth(cache.ped))
    LR.notify(locale('healed'), 'success')
end)

function Editable.openBossMenu()
    local job = GetCurrentJob()

    if not job then return end

    if isStarted('lunar_multijob') then
        exports['lunar_multijob']:openBossMenu()
    elseif isStarted('qbx_management') then
        exports.qbx_management:OpenBossMenu('job')
    elseif isStarted('esx_society') then
        Framework.object.UI.Menu.CloseAll()
        TriggerEvent('esx_society:openBossMenu', job.name, function(data, menu)
            if menu then menu.close() end
        end, {
            wash = job.canWash,
            grades = false,
            salary = false
        })
    elseif isStarted('qb-management') then
        TriggerEvent('qb-bossmenu:client:OpenMenu')
    end
end

---@return boolean
function Editable.lockpickMinigame()
    if Config.lockpickMinigame == 'normal' then
        return exports['lockpick']:startLockpick()
    elseif Config.lockpickMinigame == 'quasar' then
        local p = promise.new()
        TriggerEvent('lockpick:client:openLockpick', function(success)
            p:resolve(success)
        end)
        return Citizen.Await(p)
    end

    return true
end

---Returns the NUI path of an icon.
---@param itemName string
---@return string?
function Editable.getInventoryIcon(itemName)
    if not inventoryIconPath then
        warn('Inventory images path not set in cl_edit.lua!')
        return
    end
    -- ✅ Path is already cached, just format it
    return inventoryIconPath:format(itemName) .. '?height=128'
end

Binds = {}

Binds.interact = Utils.addKeybind({
    name = 'unijob_interaction',
    description = 'Used for certain interactions such as cancelling animations etc.',
    defaultMapper = 'keyboard',
    defaultKey = 'G'
})

Binds.actionsMenu = Utils.addKeybind({
    name = 'unijob_actions',
    description = 'Opens the job menu.',
    defaultMapper = 'keyboard',
    defaultKey = 'F6',
})

lib.callback.register('lunar_unijob:skillCheck', function()
    return lib.skillCheck({ 'easy', 'easy', 'medium', 'medium', 'hard' }, { 'e' })
end)

---@param item UsableItem
function Editable.updateStatus(item)
    if item.hunger then Editable.addHunger(item.hunger) end
    if item.thirst then Editable.addThirst(item.thirst) end
end

function Editable.addHunger(amount)
    if Framework.name == 'es_extended' then
        TriggerEvent('esx_status:add', 'hunger', amount)
    else
        local value = Framework.object.Functions.GetPlayerData().metadata.hunger + amount
        TriggerServerEvent('consumables:server:addHunger', value)
    end
end

function Editable.addThirst(amount)
    if Framework.name == 'es_extended' then
        TriggerEvent('esx_status:add', 'thirst', amount)
    else
        local value = Framework.object.Functions.GetPlayerData().metadata.thirst + amount
        TriggerServerEvent('consumables:server:addThirst', value)
    end
end

-- ✅ Handcuff controls: grouped into a flat array for fast iteration
-- Each entry is { control_group, control_id }
-- This avoids 25 separate function calls overhead and is easier to maintain
local handcuffControls = {
    { 0, 24 },  -- Attack
    { 0, 49 },  -- Go inside vehicles
    { 0, 257 }, -- Attack 2 / Disable melee
    { 0, 25 },  -- Aim
    { 0, 263 }, -- Melee Attack 1
    { 0, 45 },  -- Reload
    { 0, 44 },  -- Cover
    { 0, 37 },  -- Select Weapon
    { 0, 23 },  -- Enter
    { 0, 288 }, -- Disable phone
    { 0, 289 }, -- Inventory
    { 0, 170 }, -- Animations
    { 0, 167 }, -- Job
    { 0, 0 },   -- Disable changing view
    { 0, 26 },  -- Disable looking behind
    { 0, 73 },  -- Disable clearing animation
    { 2, 199 }, -- Disable pause screen
    { 0, 59 },  -- Disable steering in vehicle
    { 0, 71 },  -- Disable driving forward
    { 0, 72 },  -- Disable reversing
    { 2, 36 },  -- Disable going stealth
    { 0, 47 },  -- Disable weapon
    { 0, 264 }, -- Disable melee
    { 0, 140 }, -- Disable melee
    { 0, 141 }, -- Disable melee
    { 0, 142 }, -- Disable melee
    { 0, 143 }, -- Disable melee
    { 0, 75 },  -- Disable exit vehicle
    { 27, 75 }, -- Disable exit vehicle (alt group)
}

function Editable.handcuffControls()
    for i = 1, #handcuffControls do
        local c = handcuffControls[i]
        DisableControlAction(c[1], c[2], true)
    end
end