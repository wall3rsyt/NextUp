if Config.BossMenu ~= 'vms_bossmenu' then
    return
end

function OpenBossMenu(societyName)
    exports['vms_bossmenu']:openBossMenu(societyName, 'job')
end