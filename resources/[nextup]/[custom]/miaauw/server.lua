-- Stuur alleen config waarden (max aantallen) naar client bij spawnen
RegisterNetEvent('scoreboard:getConfig', function()
    local src = source
    TriggerClientEvent('scoreboard:receiveConfig', src, {
        maxPlayers = Config.MaxPlayers,
        maxPolitie = Config.MaxPolitie,
        maxAmbu    = Config.MaxAmbu,
        maxPech    = Config.MaxPech,
    })
end)

-- Stuur live data bij TAB
RegisterNetEvent('scoreboard:getServiceCounts', function()
    local src = source

    local politieCount = exports.qbx_core:GetDutyCountJob(Config.JobPolitie)
    local ambuCount    = exports.qbx_core:GetDutyCountJob(Config.JobAmbu)
    local pechCount    = exports.qbx_core:GetDutyCountJob(Config.JobPech)
    local ping         = GetPlayerPing(tostring(src))

    TriggerClientEvent('scoreboard:receiveCounts', src, {
        players    = #GetPlayers(),
        maxPlayers = Config.MaxPlayers,
        politie    = politieCount,
        maxPolitie = Config.MaxPolitie,
        ambu       = ambuCount,
        maxAmbu    = Config.MaxAmbu,
        pech       = pechCount,
        maxPech    = Config.MaxPech,
        ping       = ping,
    })
end)
