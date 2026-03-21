-- nx_merged | knockout server

RegisterNetEvent('nx_merged:knockoutPlayer', function(targetId)
    if targetId then
        TriggerClientEvent('nx_merged:doKnockout', targetId)
    end
end)
