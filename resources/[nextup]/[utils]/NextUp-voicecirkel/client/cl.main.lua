local voiceModes = {}
local proximityRangeEndTime = 0
local currentProximityRange = 0
local markerThreadActive = false

function CreateProximityRange(proximityRange)
    currentProximityRange = proximityRange
    proximityRangeEndTime = GetGameTimer() + 2000

    if markerThreadActive then return end
    markerThreadActive = true

    Citizen.CreateThread(function()
        while GetGameTimer() < proximityRangeEndTime do
            Wait(0)
            Client.DrawMarker(currentProximityRange)
        end
        markerThreadActive = false
    end)
end

TriggerEvent("pma-voice:settingsCallback", function(voiceSettings)
    voiceModes = voiceSettings.voiceModes
end)

AddEventHandler('pma-voice:setTalkingMode', function(mode)
    local modeData = voiceModes[mode]
    if modeData then
        CreateProximityRange(modeData[1])
    end
end)