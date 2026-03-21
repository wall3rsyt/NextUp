Config = {} -- dont touch this!

-- Script use p_bridge as dependency [https://github.com/PiotreeQ/p_bridge]
-- It includes language, framework, inventory and much more!

---@class settings
---@field useBuckets boolean [true = use buckets to spawn vehicles and examiner peds, false = do not use buckets]
---@field spawnOffset vec3 [player spawn offset related to vehicle on start practice test]
---@field speedUnit string [KMH | MPH]
---@field speedLimit number | false [false = no speed limit on practice exam]
---@field speedLimitFails number | false [false = no speed limit fails on practice exam, number = how many times player can exceed speed limit before failing]
---@field minVehicleHealth number | false [false = no minimum vehicle health requirement, number = when vehicle reach this health, exam will be failed]
---@field timeLimit number | false [false = no time limit on practice exam, number = time limit in minutes]

---@class examinerPed
---@field spawn boolean [true = spawn ped, false = not spawn ped]
---@field spawnOffset vec3 [spawn offset related to vehicle]
---@field model string [model of ped]
---@field followPlayer boolean [false = will spawn in vehicle, true = will follow player, if player enter vehicle ped also will enter, same for exit]

Config.Tasks = {
    settings = {
        useBuckets = true,
        spawnOffset = vector3(-1.0, 0.0, 0.0),
        examinerPed = {
            spawn = true,
            spawnOffset = vector3(0.5, 0.0, 0.0),
            model = 'ig_mp_agent14',
            anim = {dict = 'missfam4', clip = 'base', flag = 49},
            prop = {model = 'p_amb_clipboard_01', bone = 36029, coords = vec3(0.16, 0.08, 0.1), rot = vec3(-130.0, -50.0, 0.0)},
        },
        speedUnit = 'KPH', -- SPEED UNIT
        speedLimit = 50, -- SPEED LIMIT [IN UNIT ABOVE!]
        speedLimitFails = 3,
        minVehicleHealth = 600,
        timeLimit = 15,
    },
    variants = {
        --@param value: string [unique task name]
        --@param label: string [display name in task editor]
        --@param disableSetup: boolean [if true, task cannot be set up in editor]
        -- THESE ARE DEFAULT TASK VARIANTS, DO NOT REMOVE!  
        {value = 'park_front', label = 'Park Vehicle Front'},
        {value = 'park_back', label = 'Park Vehicle Back'},
        {value = 'drive_through', label = 'Drive Through'},

        -- ADDITIONAL TASK VARIANTS GO HERE [THEY NEED LOGIC TO WORK!]
        {value = 'turn_on_headlights', label = 'Turn on Headlights', disableSetup = true},
        {value = 'seat_belt', label = 'Fasten your seat belt', disableSetup = true},
        {value = 'look_around', label = 'Look around', disableSetup = true},
    },

    functionality = {
        -- function name must be the same as value in variant!
        turn_on_headlights = function(taskData)
            local _, lightsOn, beamsOn = GetVehicleLightsState(cache.vehicle)
            while not lightsOn and not beamsOn do
                Citizen.Wait(500)
                _, lightsOn, beamsOn = GetVehicleLightsState(cache.vehicle)
                if lightsOn or beamsOn then
                    break
                end
            end 

            -- when task is done, function must return true to execute next task
            PlaySoundFrontend(-1, "RACE_PLACED", "HUD_AWARDS")
            return true
        end,
        seat_belt = function(taskData)
            -- Logic for fastening seat belt
            if GetResourceState('esx_cruisecontrol') ~= 'started' then
                lib.print.error('esx_cruisecontrol is missing, change export in config.lua!')
                return false
            end
            local seatBelt = exports['esx_cruisecontrol']:isSeatbeltOn()
            while not seatBelt do
                Citizen.Wait(200)
                seatBelt = exports['esx_cruisecontrol']:isSeatbeltOn()
                if seatBelt then
                    break
                end
            end
            -- when task is done, function must return true to execute next task
            PlaySoundFrontend(-1, "RACE_PLACED", "HUD_AWARDS")
            return true
        end,
        look_around = function(taskData)
            FreezeEntityPosition(cache.vehicle, true)
            Bridge.Notify.showNotify(locale('look_left'), 'inform')
            Citizen.Wait(5000)
            Bridge.Notify.showNotify(locale('look_right'), 'inform')
            Citizen.Wait(5000)
            Bridge.Notify.showNotify(locale('you_can_drive'), 'inform')
            FreezeEntityPosition(cache.vehicle, false)
            return true
        end
    }
}

---@class Config.Creator
---@field schoolTypes {[type]: {label, theory, practice}}
---@field key string [school type]
---@field label string [display name in creator]
---@field theory string [license name to add after passing theory exam]
---@field practice string [license name to add after passing practice exam]

Config.Creator = {
    allowedGroups = {
        ['owner'] = true,
        ['admin'] = true,
    },
    schoolTypes = {
        ['car'] = {label = 'Car', theory = 'car_theory', practice = 'car_practice'},
        ['bike'] = {label = 'Bike', theory = 'bike_theory', practice = 'bike_practice'},
        ['truck'] = {label = 'Truck', theory = 'truck_theory', practice = 'truck_practice'}
    }
}

---@class Config.Practice
---@field examFailCooldown number | false [cooldown in seconds to start new exam after failing, false = no cooldown]
---@field price number | false [false = free, number = price to start the exam]
Config.Practice = {
    examFailCooldown = 300,
    price = 500, -- Set to false for free exam
    canStart = function(schoolData)
        return true
    end,
}

---@class Config.Theory
---@field examFailCooldown number | false [cooldown in seconds to start new exam after failing, false = no cooldown]
---@field price number | false [false = free, number = price to start the exam]
Config.Theory = {
    theme = 'modern', -- default | modern
    examFailCooldown = 300,
    requiredSuccessRate = 0.9, -- 90% correct answers to pass the exam
    price = 250, -- Set to false for free exam
    canStart = function(schoolData)
        return true
    end,
}