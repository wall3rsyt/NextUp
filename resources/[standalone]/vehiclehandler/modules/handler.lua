local Progress <const> = lib.load('data.progress')
local Settings <const> = lib.load('data.vehicle')

local BONES <const> = {
    [0] = 'wheel_lf',
          'wheel_rf',
          'wheel_lm',
          'wheel_rm',
          'wheel_lr',
          'wheel_rr'
}

---@class privateHandlerData
---@field active boolean
---@field limited boolean
---@field control boolean
---@field oxfuel boolean
---@field electric boolean
---@field class number | false
---@field model number | false
---@field data table

---@class Handler : OxClass
---@field private private privateHandlerData
---@diagnostic disable-next-line: assign-type-mismatch
local Handler = lib.class('vehiclehandler')

function Handler:constructor()
    self:setActive(false)
    self:setLimited(false)
    self:setControl(true)
    self.private.oxfuel = GetResourceState('ox_fuel') == 'started'
end

-- Getters
function Handler:isActive()   return self.private.active   end
function Handler:isLimited()  return self.private.limited  end
function Handler:canControl() return self.private.control  end
function Handler:isFuelOx()   return self.private.oxfuel   end
function Handler:isElectric() return self.private.electric end
function Handler:getClass()   return self.private.class    end
function Handler:getModel()   return self.private.model    end

---@param state string
---@return number | nil
function Handler:getData(state)
    if type(state) ~= 'string' then return end
    return self.private.data[state]
end

---@return boolean
function Handler:isValid()
    return cache.ped ~= nil and (cache.vehicle ~= nil or self.private.class == 16)
end

---@param vehicle number
---@param coords vector3
---@return boolean
function Handler:isTireBroken(vehicle, coords)
    if not vehicle or not coords then return false end

    for k, v in pairs(BONES) do
        local bone = GetEntityBoneIndexByName(vehicle, v)
        if bone ~= -1 and IsVehicleTyreBurst(vehicle, k, true) then
            local pos = GetWorldPositionOfEntityBone(vehicle, bone)
            if #(coords - pos) < 2.5 then return true end
        end
    end

    return false
end

---@param state boolean
function Handler:setActive(state)
    if type(state) ~= 'boolean' then return end

    self.private.active = state

    if state then
        local vehicle = cache.vehicle
        self.private.class    = GetVehicleClass(vehicle) or false
        self.private.model    = GetEntityModel(vehicle)
        self.private.electric = GetIsVehicleElectric(self.private.model)
    else
        self.private.class    = false
        self.private.model    = false
        self.private.electric = false
        self.private.data     = { engine = 0, body = 0, speed = 0 }
    end
end

---@param state boolean
function Handler:setLimited(state)
    if type(state) == 'boolean' then self.private.limited = state end
end

---@param state boolean
function Handler:setControl(state)
    if type(state) == 'boolean' then self.private.control = state end
end

---@param data { engine: number, body: number, speed: number }
---@return number | nil, number | nil, number | nil
function Handler:setData(data)
    if type(data) ~= 'table' then return end
    self.private.data = data
    return data.engine, data.body, data.speed
end

---@param vehicle number
---@return boolean | nil, vector3 | nil, number | nil, number | nil
function Handler:getFixData(vehicle)
    if not vehicle or vehicle == 0 then return end

    local backengine = Settings.backengine[GetEntityModel(vehicle)]
    local offset     = GetOffsetFromEntityInWorldCoords(vehicle, 0, backengine and -2.5 or 2.5, 0)
    local index      = backengine and 5 or 4
    local engine     = GetVehicleEngineHealth(vehicle)

    return backengine, offset, index, engine
end

---@param vehicle number
---@param index number
function Handler:breakTire(vehicle, index)
    if type(vehicle) ~= 'number' or type(index) ~= 'number' then return end

    local bone = GetEntityBoneIndexByName(vehicle, BONES[index])
    if bone == -1 or IsVehicleTyreBurst(vehicle, index, true) then return end

    lib.callback('vehiclehandler:sync', false, function()
        SetVehicleTyreBurst(vehicle, index, true, 1000.0)
        BreakOffVehicleWheel(vehicle, index, false, true, true, false)
    end)
end

-- Helper: wraps inv_busy state + progress circle
---@param progressKey string
---@param fn function called on success
---@return boolean success
local function withProgress(progressKey, fn)
    LocalPlayer.state:set('inv_busy', true, true)
    local success = lib.progressCircle(Progress[progressKey])
    if success then fn() end
    LocalPlayer.state:set('inv_busy', false, true)
    return success
end

-- Helper: set fuel on vehicle
---@param vehicle number
---@param level number
local function setFuel(vehicle, level)
    if GetResourceState('ox_fuel') == 'started' then
        Entity(vehicle).state.fuel = level
    end
    SetVehicleFuelLevel(vehicle, level)
    DecorSetFloat(vehicle, '_FUEL_LEVEL', GetVehicleFuelLevel(vehicle))
end

---@param vehicle number
---@param coords vector3
---@return boolean
function Handler:fixTire(vehicle, coords)
    if not self:isTireBroken(vehicle, coords) then return false end

    local lastengine = GetVehicleEngineHealth(vehicle)
    local lastbody   = GetVehicleBodyHealth(vehicle)
    local lastdirt   = GetVehicleDirtLevel(vehicle)

    return withProgress('tirekit', function()
        lib.callback('vehiclehandler:sync', false, function()
            SetVehicleFixed(vehicle)
            SetVehicleEngineHealth(vehicle, lastengine)
            SetVehicleBodyHealth(vehicle, lastbody)
            SetVehicleDirtLevel(vehicle, lastdirt)
        end)
    end)
end

---@param vehicle number
---@param coords vector3
---@param fixtype string
---@return boolean
function Handler:fixVehicle(vehicle, coords, fixtype)
    local backengine, offset, hoodindex, engine = self:getFixData(vehicle)

    if #(coords - offset) >= 2.0 then
        if backengine then lib.notify({ title = locale('notify.backEngine'), type = 'error' }) end
        return false
    end

    if (fixtype == 'smallkit' and engine >= 500) or (fixtype == 'bigkit' and engine >= 1000) then
        lib.notify({ title = locale('notify.cannotRepair'), type = 'error' })
        return false
    end

    LocalPlayer.state:set('inv_busy', true, true)

    if hoodindex then
        lib.callback('vehiclehandler:sync', false, function()
            SetVehicleDoorOpen(vehicle, hoodindex, false, false)
        end)
    end

    local success = lib.progressCircle(Progress[fixtype])

    if hoodindex then
        lib.callback('vehiclehandler:sync', false, function()
            SetVehicleDoorShut(vehicle, hoodindex, false)
        end)
        repeat Wait(100) until not IsVehicleDoorFullyOpen(vehicle, hoodindex)
    end

    if success then
        lib.callback('vehiclehandler:sync', false, function()
            if fixtype == 'smallkit' then
                SetVehicleEngineHealth(vehicle, 500.0)
                if GetVehicleBodyHealth(vehicle) < 500 then
                    SetVehicleBodyHealth(vehicle, 500.0)
                end
            else
                SetVehicleFixed(vehicle)
            end
            SetVehicleUndriveable(vehicle, false)
        end)
    end

    LocalPlayer.state:set('inv_busy', false, true)
    return success
end

---@param fixtype string
---@return boolean | nil
function Handler:basicfix(fixtype)
    if not cache.ped or type(fixtype) ~= 'string' then return false end

    local coords  = GetEntityCoords(cache.ped)
    local vehicle = lib.getClosestVehicle(coords, 3.0, false)
    if not vehicle or vehicle == 0 then return false end

    if fixtype == 'tirekit' then
        return self:fixTire(vehicle, coords)
    elseif fixtype == 'smallkit' or fixtype == 'bigkit' then
        return self:fixVehicle(vehicle, coords, fixtype)
    end
end

---@return boolean
function Handler:basicwash()
    if not cache.ped then return false end

    local pos = GetEntityCoords(cache.ped)
    local vehicle, vehpos = lib.getClosestVehicle(pos, 3.0, false)
    if not vehicle or vehicle == 0 then return false end
    if #(pos - vehpos) > 3.0 or cache.vehicle then return false end

    TaskStartScenarioInPlace(cache.ped, 'WORLD_HUMAN_MAID_CLEAN', 0, true)

    local success = withProgress('cleankit', function()
        lib.callback('vehiclehandler:sync', false, function()
            SetVehicleDirtLevel(vehicle, 0.0)
            WashDecalsFromVehicle(vehicle, 1.0)
        end)
    end)

    ClearAllPedProps(cache.ped)
    ClearPedTasks(cache.ped)
    return success
end

---@return boolean
function Handler:adminfix()
    if not self:isValid() then return false end

    local success = lib.callback.await('ox_lib:checkPlayerAce', false, 'command.fix')
    if not success then return false end

    lib.callback('vehiclehandler:sync', false, function()
        SetVehicleFixed(cache.vehicle)
        ResetVehicleWheels(cache.vehicle, true)
        setFuel(cache.vehicle, 100.0)
        SetVehicleUndriveable(cache.vehicle, false)
        SetVehicleEngineOn(cache.vehicle, true, true, true)
    end)

    return true
end

---@return boolean
function Handler:adminwash()
    if not self:isValid() then return false end

    local success = lib.callback.await('ox_lib:checkPlayerAce', false, 'command.wash')
    if not success then return false end

    lib.callback('vehiclehandler:sync', false, function()
        SetVehicleDirtLevel(cache.vehicle, 0.0)
        WashDecalsFromVehicle(cache.vehicle, 1.0)
    end)

    return true
end

---@param newlevel number
---@return boolean
function Handler:adminfuel(newlevel)
    if not self:isValid() or not newlevel then return false end

    local success = lib.callback.await('ox_lib:checkPlayerAce', false, 'command.setfuel')
    if not success then return false end

    local level = lib.math.clamp(newlevel, 0.0, 100.0)

    lib.callback('vehiclehandler:sync', false, function()
        setFuel(cache.vehicle, level)
        SetVehicleUndriveable(cache.vehicle, false)
        SetVehicleEngineOn(cache.vehicle, true, true, true)
    end)

    return true
end

return Handler