if Config.BossMenu ~= 'esx_society' then
    return
end

function OpenBossMenu(societyName)
    exports['esx_society']:OpenBossMenu(societyName)
end