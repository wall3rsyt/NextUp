RegisterCommand(Config.commandNames.devMode, function(source, args)
    local player = source

    if IsPlayerAceAllowed(player, 'ls_image_placer.Admin') or CheckJobAndRank(source) then
        TriggerClientEvent('ls_image_placer:DevMode', player)
    else
        TriggerClientEvent('ls_image_placer:ShowNotification', source, 'You don\'t have permission to do this')
    end
end)

RegisterCommand(Config.commandNames.deleteImage, function(source, args)
    local player = source

    if IsPlayerAceAllowed(player, 'ls_image_placer.Admin') or CheckJobAndRank(source) then
        TriggerClientEvent('ls_image_placer:DeleteImage', player)
    else
        TriggerClientEvent('ls_image_placer:ShowNotification', source, 'You don\'t have permission to do this')
    end
end)

RegisterCommand(Config.commandNames.disableAdminAccess, function(source, args, raw)
    TriggerClientEvent('ls_image_placer:Client:DisableAdminPrivileges', source)
    TriggerClientEvent('ls_image_placer:ShowNotification', source, 'You switched your image viewing privileges')
end, true)

function SendToDiscord(x, y, z, player, image)
    local name = 'Image Placer Bot'
    local embed = {
        {
            ["color"] = 16753920,
            ["title"] = "**".. 'New Image Uploaded!' .."**",
            ["description"] = string.format("**Player** = %s \n **x** = %f \n **y** = %f \n **z** = %f \n **Image** = %s \n **PlayerID** = %d", GetPlayerName(player), x, y, z, image, player),
            ["footer"] = {
                ["text"] = 'Lith Studios | Swizz',
            },
        }
    }
    PerformHttpRequest(ServerConfig.webhook.url, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

