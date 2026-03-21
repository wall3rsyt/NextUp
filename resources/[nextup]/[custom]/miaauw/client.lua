local isOpen = false

local function updateScoreboard()
    TriggerServerEvent('scoreboard:getServiceCounts')
end

-- Ontvang config max waarden bij spawnen
RegisterNetEvent('scoreboard:receiveConfig', function(data)
    SendNUIMessage({
        type       = 'update',
        maxPlayers = data.maxPlayers,
        maxPolitie = data.maxPolitie,
        maxAmbu    = data.maxAmbu,
        maxPech    = data.maxPech,
    })
end)

-- Ontvang live data bij TAB
RegisterNetEvent('scoreboard:receiveCounts', function(data)
    SendNUIMessage({
        type       = 'update',
        players    = data.players,
        maxPlayers = data.maxPlayers,
        politie    = data.politie,
        maxPolitie = data.maxPolitie,
        ambu       = data.ambu,
        maxAmbu    = data.maxAmbu,
        pech       = data.pech,
        maxPech    = data.maxPech,
        ping       = data.ping,
    })
end)

RegisterCommand('+openscoreboard', function()
    isOpen = true
    SendNUIMessage({ type = 'show' })
    updateScoreboard()
end, false)

RegisterCommand('-openscoreboard', function()
    isOpen = false
    SendNUIMessage({ type = 'hide' })
end, false)

RegisterKeyMapping('+openscoreboard', 'Scoreboard openen', 'keyboard', 'TAB')

-- Laad config waarden direct bij spawnen
AddEventHandler('playerSpawned', function()
    TriggerServerEvent('scoreboard:getConfig')
end)

CreateThread(function()
    while true do
        Wait(5000)
        if isOpen then
            updateScoreboard()
        end
    end
end)
