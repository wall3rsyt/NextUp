if not lib then print('^1ox_lib must be started before this resource.^0') return end
lib.locale()

---@class Handler : OxClass
local Handler = require 'modules.handler'
local Settings <const> = lib.load('data.vehicle')
local Units <const> = Settings.units == 'mph' and 2.23694 or 3.6

---@param vehicle number
local function startThread(vehicle)
    if not vehicle or not Handler or Handler:isActive() then return end

    Handler:setActive(true)

    local oxfuel  = Handler:isFuelOx()
    local electric = Handler:isElectric()
    local class   = Handler:getClass()
    local model   = Handler:getModel()
    local regulated = Settings.regulated[class] and not Settings.exclusions[model]

    CreateThread(function()
        while cache.vehicle == vehicle and cache.seat == -1 do

            local engine, body, speed = Handler:setData({
                engine = GetVehicleEngineHealth(vehicle),
                body   = GetVehicleBodyHealth(vehicle),
                speed  = GetEntitySpeed(vehicle) * Units
            })

            -- Clamp negative health values
            if engine < 0 then SetVehicleEngineHealth(vehicle, 0.0) end
            if body   < 0 then SetVehicleBodyHealth(vehicle, 0.0)   end

            -- Driveability: engine
            if engine <= 0 and IsVehicleDriveable(vehicle, true) then
                SetVehicleUndriveable(vehicle, true)
            end

            -- Driveability: fuel
            if not electric and class ~= 14 then
                local fuel = oxfuel and Entity(vehicle).state.fuel or GetVehicleFuelLevel(vehicle)
                if fuel <= 7 and IsVehicleDriveable(vehicle, true) then
                    SetVehicleUndriveable(vehicle, true)
                end
            end

            -- Torque reduction below half-life
            if not Handler:isLimited() and engine < 500 then
                Handler:setLimited(true)

                CreateThread(function()
                    while cache.vehicle == vehicle and cache.seat == -1 do
                        local lvl = Handler:getData('engine')
                        if lvl >= 500 then break end
                        SetVehicleCheatPowerIncrease(vehicle, (lvl + 500) / 1100)
                        Wait(1)
                    end
                    Handler:setLimited(false)
                end)
            end

            -- Rotation control while flipped/airborne
            if regulated then
                local flipped = speed < 2.0 and (function()
                    local r = GetEntityRoll(vehicle)
                    return r > 75.0 or r < -75.0
                end)() or IsEntityInAir(vehicle)

                if flipped then
                    if Handler:canControl() then
                        Handler:setControl(false)

                        CreateThread(function()
                            while not Handler:canControl() and cache.seat == -1 do
                                DisableControlAction(2, 59, true)
                                DisableControlAction(2, 60, true)
                                Wait(1)
                            end
                            if not Handler:canControl() then Handler:setControl(true) end
                        end)
                    end
                elseif not Handler:canControl() then
                    Handler:setControl(true)
                end
            end

            Wait(300)
        end

        Handler:setActive(false)

        if cache.vehicle and cache.seat == -1 then
            startThread(cache.vehicle)
        end
    end)
end

AddEventHandler('entityDamaged', function(victim, _, weapon)
    if not Handler or not Handler:isActive() then return end
    if victim ~= cache.vehicle then return end
    if GetWeapontypeGroup(weapon) ~= 0 then return end
    if Handler:getClass() == 14 then return end

    local bodyDiff = Handler:getData('body') - GetVehicleBodyHealth(cache.vehicle)

    -- Engine damage based on body damage
    if bodyDiff > 0 then
        local newEngine = GetVehicleEngineHealth(cache.vehicle)
            - (bodyDiff * Settings.globalmultiplier * Settings.classmultiplier[Handler:getClass()])

        SetVehicleEngineHealth(cache.vehicle, math.max(0.0, newEngine))
    end

    -- Impact handling
    local speedDiff = Handler:getData('speed') - (GetEntitySpeed(cache.vehicle) * Units)
    if speedDiff < Settings.threshold.speed then return end

    if Settings.breaktire and bodyDiff >= Settings.threshold.health then
        math.randomseed(GetGameTimer())
        Handler:breakTire(cache.vehicle, math.random(0, 1))
    end

    if speedDiff >= Settings.threshold.heavy then
        SetVehicleUndriveable(cache.vehicle, true)
        SetVehicleEngineHealth(cache.vehicle, 0.0)
        SetVehicleEngineOn(cache.vehicle, false, true, false)
    end
end)

-- Callbacks
local callbacks = {
    ['vehiclehandler:basicfix']  = function(fixtype) return Handler and Handler:basicfix(fixtype) end,
    ['vehiclehandler:basicwash'] = function()        return Handler and Handler:basicwash() end,
    ['vehiclehandler:adminfix']  = function()        return Handler and Handler:isActive() and Handler:adminfix() end,
    ['vehiclehandler:adminwash'] = function()        return Handler and Handler:isActive() and Handler:adminwash() end,
    ['vehiclehandler:adminfuel'] = function(level)   return Handler and Handler:isActive() and Handler:adminfuel(level) end,
}

for name, fn in pairs(callbacks) do
    lib.callback.register(name, fn)
end

lib.onCache('seat', function(seat)
    if seat == -1 then startThread(cache.vehicle) end
end)

CreateThread(function()
    Handler = Handler:new()
    if cache.seat == -1 then startThread(cache.vehicle) end
end)