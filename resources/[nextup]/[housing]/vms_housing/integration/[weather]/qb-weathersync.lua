if Config.Weather ~= 'qb-weathersync' and Config.Weather ~= 'qbx_weathersync' then
    return
end

function ToggleWeather(toggle, isIPL)
    if toggle then
        -- When the player enters the house
        if not isIPL then
            TriggerEvent('qb-weathersync:client:DisableSync')

            Citizen.Wait(100)
            
            SetRainLevel(0.0)
            NetworkOverrideClockTime(23, 30, 0)
            ClearOverrideWeather()
            ClearWeatherTypePersist()
            SetWeatherTypePersist('EXTRASUNNY')
            SetWeatherTypeNow('EXTRASUNNY')
            SetWeatherTypeNowPersist('EXTRASUNNY')
        end
    else
        -- When the player leaves the house
        TriggerEvent('qb-weathersync:client:EnableSync')
        SetArtificialLightsState(false)
    end
end