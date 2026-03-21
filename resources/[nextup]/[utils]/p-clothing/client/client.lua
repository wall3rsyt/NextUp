lib.locale()

local lastEquipped = {}
local config = require "shared.config"
local drawables = require "shared.drawables"

---@param anim table
---@param cb function
local function playToggleAnim(anim, cb)
    lib.requestAnimDict(anim.dict)
    local flag = cache.vehicle and 51 or anim.flag
    TaskPlayAnim(cache.ped, anim.dict, anim.name, 3.0, 3.0, anim.dur, flag, 0, false, false, false)
    Wait(math.max(anim.dur - 500, 500))
    cb()
end

---@param key string
local function notify(key)
    lib.notify({ description = locale(key), icon = "shirt" })
end

---@return "male"|"female"|nil
local function getGender()
    local model = GetEntityModel(cache.ped)
    if model == `mp_m_freemode_01` then return "male"
    elseif model == `mp_f_freemode_01` then return "female" end
end

---@param playAnim boolean?
local function resetClothing(playAnim)
    if playAnim then
        local e = drawables.top.anim
        TaskPlayAnim(cache.ped, e.dict, e.name, 3.0, 3.0, 3000, e.flag, 0, false, false, false)
    end

    for _, v in pairs(lastEquipped) do
        if v then
            if v.drawable then
                SetPedComponentVariation(cache.ped, v.id, v.drawable, v.texture, 0)
            elseif v.prop then
                ClearPedProp(cache.ped, v.id)
                SetPedPropIndex(cache.ped, v.id, v.prop, v.texture, true)
            end
        end
    end

    lastEquipped = {}
end

---@param which string
---@return {success: boolean, state: boolean}
local function toggleClothing(which)
    local toggle = drawables[which]
    if not toggle then
        return { success = false, state = false }
    end

    local compId = toggle.drawable
    local cur = {
        id    = compId,
        texture  = GetPedTextureVariation(cache.ped, compId),
        drawable = GetPedDrawableVariation(cache.ped, compId),
    }

    local gender = getGender()

    if which ~= "mask" and not gender then
        notify("not_allowed_ped")
        return { success = false, state = false }
    end

    local tbl = toggle.table

    if not tbl.standalone then
        local variants = tbl[gender]

        if type(variants) == "table" then
            for k, v in pairs(variants) do
                if not toggle.remember then
                    if k == cur.drawable then
                        playToggleAnim(toggle.anim, function()
                            if type(v) == "number" then
                                SetPedComponentVariation(cache.ped, compId, v, cur.texture, 0)
                            end
                        end)
                        return { success = true, state = false }
                    end
                else
                    if not lastEquipped[which] then
                        if k == cur.drawable then
                            playToggleAnim(toggle.anim, function()
                                lastEquipped[which] = cur
                                SetPedComponentVariation(cache.ped, compId, v, cur.texture, 0)
                            end)
                            return { success = true, state = true }
                        end
                    else
                        local last = lastEquipped[which]
                        playToggleAnim(toggle.anim, function()
                            SetPedComponentVariation(cache.ped, compId, last.drawable, last.texture, 0)
                            lastEquipped[which] = false
                        end)
                        return { success = true, state = false }
                    end
                end
            end
        end

        notify("no_variants")
        return { success = false, state = false }
    else
        local target = tbl[gender]

        if not lastEquipped[which] then
            if cur.drawable ~= target then
                playToggleAnim(toggle.anim, function()
                    lastEquipped[which] = cur

                    if type(target) == "number" then
                        SetPedComponentVariation(cache.ped, compId, target, 0, 0)
                    end

                    if tbl.extra then
                        for _, v in pairs(tbl.extra) do
                            local extraCur = {
                                id       = v.drawable,
                                texture  = GetPedTextureVariation(cache.ped, v.drawable),
                                drawable = GetPedDrawableVariation(cache.ped, v.drawable),
                            }
                            SetPedComponentVariation(cache.ped, v.drawable, v.id, v.tex, 0)
                            lastEquipped[v.name] = extraCur
                        end
                    end
                end)
                return { success = true, state = true }
            end
        else
            local last = lastEquipped[which]
            playToggleAnim(toggle.anim, function()
                SetPedComponentVariation(cache.ped, compId, last.drawable, last.texture, 0)
                lastEquipped[which] = false

                if tbl.extra then
                    for _, v in pairs(tbl.extra) do
                        local savedExtra = lastEquipped[v.name]
                        if savedExtra then
                            SetPedComponentVariation(cache.ped, savedExtra.id, savedExtra.drawable, savedExtra.texture, 0)
                            lastEquipped[v.name] = false
                        end
                    end
                end
            end)
            return { success = true, state = false }
        end
    end

    notify("already_wearing")
    return { success = false, state = false }
end

---@param which string
---@return {success: boolean, state: boolean}
local function toggleProps(which)
    local prop = drawables[which]
    if not prop then
        return { success = false, state = false }
    end

    local propId = prop.prop
    local cur = {
        id      = propId,
        prop    = GetPedPropIndex(cache.ped, propId),
        texture = GetPedPropTextureIndex(cache.ped, propId),
    }

    if not prop.variants then
        if cur.prop ~= -1 then
            playToggleAnim(prop.anim.off, function()
                lastEquipped[which] = cur
                ClearPedProp(cache.ped, propId)
            end)
            return { success = true, state = true }
        end

        local last = lastEquipped[which]
        if last then
            playToggleAnim(prop.anim.on, function()
                SetPedPropIndex(cache.ped, propId, last.prop, last.texture, true)
            end)
            lastEquipped[which] = false
            return { success = true, state = false }
        end

        notify("nothing_to_remove")
        return { success = false, state = false }
    end

    local gender = getGender()
    if not gender then
        notify("not_allowed_ped")
        return { success = false, state = false }
    end

    local variations = prop.variants[gender]
    for k, v in pairs(variations) do
        if cur.prop == k then
            playToggleAnim(prop.anim.on, function()
                SetPedPropIndex(cache.ped, propId, v, cur.texture, true)
            end)
            return { success = true, state = true }
        end
    end

    notify("no_variants")
    return { success = false, state = false }
end

---@param name string
---@param data table?
---@return {success: boolean, state?: boolean}
local function action(name, data)
    if name == "reset" then
        resetClothing(true)
        return { success = true }
    elseif name == "cursor" then
        if data then
            SetCursorLocation(data.x, data.y)
            return { success = true }
        end
        return { success = false }
    end

    local entry = drawables[name]
    return entry and (entry.prop ~= nil and toggleProps(name) or toggleClothing(name))
        or { success = false, state = false }
end

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    resetClothing()
end)

RegisterNUICallback("action", function(body, resultCallback)
    resultCallback(action(body.name, body))
end)

local function canInteract(ped)
    if IsPedInAnyVehicle(ped) and not config.allowincars then return false end
    if IsPedSwimmingUnderWater(ped) and not config.allowinwater then return false end
    if IsPedRagdoll(ped) and not config.allowragdolled then return false end
    return true
end

local openState = false

SendNUIMessage({
    action = "setup",
    data = {
        position    = config.position,
        activeColor = config.activeColor,
    }
})

local function toggleOpen()
    if not canInteract(cache.ped) then return end

    openState = not openState
    SetNuiFocus(openState, openState)
    SetNuiFocusKeepInput(openState)

    if openState then
        CreateThread(function()
            while openState do
                DisableControlAction(0, 1, true)
                DisableControlAction(0, 2, true)
                DisableControlAction(0, 24, true)
                Wait(0)
            end
        end)
    end

    SendNUIMessage({ action = "open", data = openState })
end

lib.addKeybind({
    name        = 'clothing',
    onPressed   = toggleOpen,
    defaultKey  = config.defaultKey,
    description = 'open clothing menu',
    onReleased  = config.toggle and nil or toggleOpen,
})

if config.commands then
    for name in pairs(drawables) do
        local cmd  = locale(("command_%s"):format(name))
        local desc = locale(("%s_description"):format(name))

        RegisterCommand(cmd, function() action(name) end, false)
        TriggerEvent('chat:addSuggestion', ("/%s"):format(cmd), desc, {})
    end
end