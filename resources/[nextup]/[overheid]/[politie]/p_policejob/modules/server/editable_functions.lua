Editable = {
    showNotify = function(playerId, text, type)
        TriggerClientEvent('ox_lib:notify', playerId, {title = 'Police', description = text, type = type or 'inform'})
    end,
    isPlayerDead = function(playerId)
        local stateBag = Player(playerId).state
        return stateBag.isDead or stateBag.dead
    end,
    IsOnDuty = function(identifier)
        return GetResourceState('piotreq_jobcore') ~= 'missing' and exports['piotreq_jobcore']:isPlayerOnDuty(identifier) or true
    end,
    GetPlayerDutyData = function(identifier)
        return GetResourceState('piotreq_jobcore') ~= 'missing' and exports['piotreq_jobcore']:GetPlayerDutyData(identifier) or {status = 1}
    end,
}

lib.callback.register('p_policejob/server/getPlayerPrivateClothes', function(source)
    local _source = source
    local identifier = Core.GetPlayerId(_source)
    if GetResourceState('rcore_clothing') == 'started' then
        return exports["rcore_clothing"]:getSkinByIdentifier(identifier)
    elseif GetResourceState('bl_appearance') == 'started' then
        return exports['bl_appearance']:GetPlayerAppearance(_source)
    elseif GetResourceState('es_extended') == 'started' then
        local row = MySQL.single.await('SELECT skin FROM users WHERE identifier = ?', {
            identifier
        })
        return row and json.decode(row.skin) or nil
    elseif GetResourceState('qb-core') == 'started' or GetResourceState('qbx_core') == 'started' then
        local row = MySQL.single.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = 1', {
            identifier
        })
        return row and json.decode(row.skin) or nil
    end
end)

-- DONT TOUCH IT [IT ONLY WORKS FOR OX INVENTORY]
if GetResourceState('ox_inventory') ~= 'missing' then
    exports['ox_inventory']:registerHook('swapItems', function(payload)
        local targetId = payload.fromInventory
        if (payload.action == 'swap' or payload.action == 'move') and (targetId ~= payload.toInventory) and payload.fromType == 'player' and payload.toType == 'player' then
            if GlobalState.activeGPS[targetId] then
                local xTarget = Core.GetPlayerFromId(targetId)
                RemoveUnit(targetId)
                local playerName = Core.GetPlayerName(targetId)
                if GetResourceState('piotreq_gpt') == 'started' then
                    exports['piotreq_gpt']:SendAlert(targetId, {
                        title = locale('kidnapped_officer'),
                        code = 'BK-0',
                        canAnswer = false,
                        maxOfficers = 7,
                        time = 5,
                        blip = {
                            scale = 1.1,
                            sprite = 280,
                            color = 1,
                            alpha = 200,
                            name = locale('kidnapped_officer')
                        },
                        info = {
                            {icon = 'fa-solid fa-road', isStreet = true},
                            {icon = 'fa-solid fa-id-card', data = playerName},
                        },
                        notifyTime = 10000,
                        jobs = {['police'] = true, ['sheriff'] = true}
                    })
                elseif GetResourceState('cd_dispatch') == 'started' then
                    local playerPed = GetPlayerPed(targetId)
                    local plyCoords = GetEntityCoords(playerPed)
                    TriggerClientEvent('cd_dispatch:AddNotification', -1, {
                        job_table = {'police', 'sheriff'},
                        coords = vector3(plyCoords.x, plyCoords.y, plyCoords.z),
                        title = 'BK-0',
                        message = locale('kidnapped_officer'),
                        flash = 0,
                        unique_id = tostring(math.random(0000000,9999999)),
                        sound = 1,
                        blip = {
                            sprite = 431,
                            scale = 1.2,
                            colour = 3,
                            flashes = false,
                            text = locale('kidnapped_officer'),
                            time = 5,
                            radius = 0,
                        }
                    })
                elseif GetResourceState('ps-dispatch') == 'started' then
                    TriggerClientEvent('ps-dispatch:client:officerdown', targetId)
                elseif GetResourceState('qs-dispatch') == 'started' then
                    TriggerClientEvent('p_policejob/qs-dispatch/alert', _source, 'OfficerDown')
                elseif GetResourceState('rcore_dispatch') == 'started' then
                    local playerPed = GetPlayerPed(targetId)
                    local plyCoords = GetEntityCoords(playerPed)
                    local data = {
                        code = 'BK-0',
                        default_priority = 'high',
                        coords = plyCoords,
                        job = 'police',
                        text = locale('kidnapped_officer'),
                        type = 'alerts',
                        blip_time = 5, 
                        blip = {
                            sprite = 280,
                            colour = 1,
                            scale = 0.7,
                            text = locale('kidnapped_officer'), 
                            flashes = false,
                            radius = 0,
                        }
                    }
                    TriggerEvent('rcore_dispatch:server:sendAlert', data)
                elseif GetResourceState('codem-dispatch') == 'started' then
                    TriggerClientEvent('p_policejob/codem-dispatch/alert', _source, {
                        type = 'BackUp',
                        header = locale('kidnapped_officer'),
                        text = locale('kidnapped_officer'),
                        code = 'BK-0',
                    })
                elseif GetResourceState('lb-tablet') == 'started' then
                    local playerPed = GetPlayerPed(_source)
                    local plyCoords = GetEntityCoords(playerPed)
                    exports["lb-tablet"]:AddDispatch({
                        priority = 'high',
                        code = 'BK-0',
                        title = locale('kidnapped_officer'),
                        description = locale('kidnapped_officer'),
                        location = {label = '', coords = {x = plyCoords.x, y = plyCoords.y}},
                        time = 60,
                        job = 'police'
                    })
                elseif GetResourceState('tk_dispatch') == 'started' then
                    local playerPed = GetPlayerPed(_source)
                    local plyCoords = GetEntityCoords(playerPed)
                    exports['tk_dispatch']:addCall({
                        title = locale('kidnapped_officer'),
                        code = 'BK-0',
                        priority = 'high',
                        message = locale('kidnapped_officer'),
                        coords = plyCoords,
                        jobs = {'police'},
                        blip = {
                            sprite = 280,
                            color = 1,
                            scale = 0.7,
                            shortRange = true
                        }
                    })
                elseif GetResourceState('kibra-dispatch') == 'started' then
                    exports["kibra-dispatch"]:SendAlert(_source,locale('kidnapped_officer'), "BK-0", "fa-user", {"police"}, 280)
                end
                exports['p_policejob']:PlaySound(targetId, {
                    distance = 10,
                    file = 'panic',
                    volume = 0.5
                })
            end
        end
        return true
    end, {
        itemFilter = {
            gps = true
        }
    })
end

local antiSpam = {}
local function canUseCommand(playerId)
    local _source = playerId
    if _source < 1 then
        return false
    end

    local xPlayer = Core.GetPlayerFromId(_source)
    if antiSpam[_source] then
        Editable.showNotify(_source, locale('anti_spam'), 'error')
        return false
    end

    local playerJob = Core.GetPlayerJob(xPlayer)
    if not Config.Jobs[playerJob.name] then
        Editable.showNotify(_source, locale('you_cant_do_it'), 'error')
        return false
    end

    local dutyData = Editable.GetPlayerDutyData(xPlayer.identifier)
    if dutyData.status ~= 1 then
        Editable.showNotify(_source, locale('not_on_duty'), 'error')
        return false
    end

    return true
end

lib.addCommand('10-13a', {
    help = locale('10-13a_command'),
    restricted = false
}, function(source, args, raw)
    local _source = source
    if not canUseCommand(_source) then return end
    local playerName = Core.GetPlayerName(_source)
    if GetResourceState('piotreq_gpt') == 'started' then
        exports['piotreq_gpt']:SendAlert(_source, {
            title = locale('need_support'),
            code = '10-13A',
            canAnswer = false,
            maxOfficers = 7,
            time = 5,
            blip = {
                scale = 1.1,
                sprite = 280,
                color = 1,
                alpha = 200,
                name = locale('need_support')
            },
            info = {
                {icon = 'fa-solid fa-road', isStreet = true},
                {icon = 'fa-solid fa-id-card', data = playerName},
            },
            type = 'risk',
            notifyTime = 10000,
            jobs = {['police'] = true, ['sheriff'] = true}
        })
    elseif GetResourceState('cd_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = {'police', 'sheriff'},
            coords = vector3(plyCoords.x, plyCoords.y, plyCoords.z),
            title = '10-13A',
            message = locale('need_support'),
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            sound = 1,
            blip = {
                sprite = 431,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = locale('need_support'),
                time = 5,
                radius = 0,
            }
        })
    elseif GetResourceState('kibra-dispatch') == 'started' then
        exports["kibra-dispatch"]:SendAlert(_source, locale('need_support'), "10-13A", "fa-user", {"police"}, 431)
    elseif GetResourceState('ps-dispatch') == 'started' then
        TriggerClientEvent('ps-dispatch:client:officerdown', _source)
    elseif GetResourceState('qs-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/qs-dispatch/alert', _source, 'OfficerDown')
    elseif GetResourceState('rcore_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        local data = {
            code = '10-13A',
            default_priority = 'medium',
            coords = plyCoords,
            job = {'police', 'sheriff'},
            text = locale('need_support'),
            type = 'alerts',
            blip_time = 5, 
            blip = {
                sprite = 280,
                colour = 1,
                scale = 0.7,
                text = locale('need_support'), 
                flashes = false,
                radius = 0,
            }
        }
        TriggerEvent('rcore_dispatch:server:sendAlert', data)
    elseif GetResourceState('codem-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/codem-dispatch/alert', _source, {
            type = 'BackUp',
            header = locale('need_support'),
            text = locale('need_support'),
            code = '10-13A',
        })
    elseif GetResourceState('lb-tablet') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        exports["lb-tablet"]:AddDispatch({
            priority = 'high',
            code = '10-13A',
            title = locale('need_support'),
            description = locale('need_support'),
            location = {label = '', coords = {x = plyCoords.x, y = plyCoords.y}},
            time = 60,
            job = 'police'
        })
    elseif GetResourceState('tk_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        exports['tk_dispatch']:addCall({
            title = locale('need_support'),
            code = '10-13A',
            priority = 'high',
            message = locale('need_support'),
            coords = plyCoords,
            jobs = {'police'},
            blip = {
                sprite = 280,
                color = 1,
                scale = 0.7,
                shortRange = true
            }
        })
    end
    exports['p_policejob']:PlaySound(_source, {
        distance = 10,
        file = 'panic',
        volume = 0.5
    })
    antiSpam[_source] = true
    SetTimeout(5000, function()
        antiSpam[_source] = nil
    end)
end)

lib.addCommand('10-13b', {
    help = locale('10-13b_command'),
    restricted = false
}, function(source, args, raw)
    local _source = source
    if not canUseCommand(_source) then return end

    local playerName = Core.GetPlayerName(_source)
    if GetResourceState('piotreq_gpt') == 'started' then
        exports['piotreq_gpt']:SendAlert(_source, {
            title = locale('need_support'),
            code = '10-13B',
            canAnswer = false,
            maxOfficers = 7,
            time = 5,
            blip = {
                scale = 1.1,
                sprite = 280,
                color = 1,
                alpha = 200,
                name = locale('need_support')
            },
            info = {
                {icon = 'fa-solid fa-road', isStreet = true},
                {icon = 'fa-solid fa-id-card', data = playerName},
            },
            type = 'risk',
            notifyTime = 10000,
            jobs = {['police'] = true, ['sheriff'] = true}
        })
    elseif GetResourceState('cd_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = {'police', 'sheriff'},
            coords = vector3(plyCoords.x, plyCoords.y, plyCoords.z),
            title = '10-13B',
            message = locale('need_support'),
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            sound = 1,
            blip = {
                sprite = 431,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = locale('need_support'),
                time = 5,
                radius = 0,
            }
        })
    elseif GetResourceState('kibra-dispatch') == 'started' then
        exports["kibra-dispatch"]:SendAlert(_source, locale('need_support'), "10-13B", "fa-user", {"police"}, 431)
    elseif GetResourceState('ps-dispatch') == 'started' then
        TriggerClientEvent('ps-dispatch:client:officerdown', _source)
    elseif GetResourceState('qs-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/qs-dispatch/alert', _source, 'OfficerDown')
    elseif GetResourceState('rcore_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        local data = {
            code = '10-13B',
            default_priority = 'medium',
            coords = plyCoords,
            job = {'police', 'sheriff'},
            text = locale('need_support'),
            type = 'alerts',
            blip_time = 5, 
            blip = {
                sprite = 280,
                colour = 1,
                scale = 0.7,
                text = locale('need_support'), 
                flashes = false,
                radius = 0,
            }
        }
        TriggerEvent('rcore_dispatch:server:sendAlert', data)
    elseif GetResourceState('codem-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/codem-dispatch/alert', _source, {
            type = 'BackUp',
            header = locale('need_support'),
            text = locale('need_support'),
            code = '10-13B',
        })
    elseif GetResourceState('lb-tablet') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        exports["lb-tablet"]:AddDispatch({
            priority = 'high',
            code = '10-13B',
            title = locale('need_support'),
            description = locale('need_support'),
            location = {label = '', coords = {x = plyCoords.x, y = plyCoords.y}},
            time = 60,
            job = 'police'
        })
    elseif GetResourceState('tk_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        exports['tk_dispatch']:addCall({
            title = locale('need_support'),
            code = '10-13B',
            priority = 'high',
            message = locale('need_support'),
            coords = plyCoords,
            jobs = {'police'},
            blip = {
                sprite = 280,
                color = 1,
                scale = 0.7,
                shortRange = true
            }
        })
    end
    exports['p_policejob']:PlaySound(_source, {
        distance = 10,
        file = 'panic',
        volume = 0.5
    })
    antiSpam[_source] = true
    SetTimeout(5000, function()
        antiSpam[_source] = nil
    end)
end)

lib.addCommand('bk0', {
    help = locale('bk0_command'),
    restricted = false
}, function(source, args, raw)
    local _source = source
    if not canUseCommand(_source) then return end

    local playerName = Core.GetPlayerName(_source)
    if GetResourceState('piotreq_gpt') == 'started' then
        exports['piotreq_gpt']:SendAlert(_source, {
            title = locale('instant_support'),
            code = 'BK0',
            canAnswer = false,
            maxOfficers = 7,
            time = 5,
            blip = {
                scale = 1.1,
                sprite = 280,
                color = 1,
                alpha = 200,
                name = locale('instant_support')
            },
            info = {
                {icon = 'fa-solid fa-road', isStreet = true},
                {icon = 'fa-solid fa-id-card', data = playerName},
            },
            type = 'risk',
            notifyTime = 10000,
            jobs = {['police'] = true, ['sheriff'] = true}
        })
    elseif GetResourceState('cd_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = {'police', 'sheriff'},
            coords = vector3(plyCoords.x, plyCoords.y, plyCoords.z),
            title = 'BK0',
            message = locale('instant_support'),
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            sound = 1,
            blip = {
                sprite = 431,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = locale('instant_support'),
                time = 5,
                radius = 0,
            }
        })
    elseif GetResourceState('kibra-dispatch') == 'started' then
        exports["kibra-dispatch"]:SendAlert(_source, locale('instant_support'), "BK0", "fa-user", {"police"}, 431)
    elseif GetResourceState('ps-dispatch') == 'started' then
        TriggerClientEvent('ps-dispatch:client:officerdown', _source)
    elseif GetResourceState('qs-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/qs-dispatch/alert', _source, 'OfficerDown')
    elseif GetResourceState('rcore_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        local data = {
            code = 'BK-0',
            default_priority = 'high',
            coords = plyCoords,
            job = {'police', 'sheriff'},
            text = locale('instant_support'),
            type = 'alerts',
            blip_time = 5, 
            blip = {
                sprite = 280,
                colour = 1,
                scale = 0.7,
                text = locale('instant_support'), 
                flashes = false,
                radius = 0,
            }
        }
        TriggerEvent('rcore_dispatch:server:sendAlert', data)
    elseif GetResourceState('codem-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/codem-dispatch/alert', _source, {
            type = 'BackUp',
            header = locale('instant_support'),
            text = locale('instant_support'),
            code = 'BK-0',
        })
    elseif GetResourceState('lb-tablet') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        exports["lb-tablet"]:AddDispatch({
            priority = 'high',
            code = 'BK-0',
            title = locale('instant_support'),
            description = locale('instant_support'),
            location = {label = '', coords = {x = plyCoords.x, y = plyCoords.y}},
            time = 60,
            job = 'police'
        })
    elseif GetResourceState('tk_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        exports['tk_dispatch']:addCall({
            title = locale('instant_support'),
            code = 'BK-0',
            priority = 'high',
            message = locale('instant_support'),
            coords = plyCoords,
            jobs = {'police'},
            blip = {
                sprite = 280,
                color = 1,
                scale = 0.7,
                shortRange = true
            }
        })
    end
    antiSpam[_source] = true
    SetTimeout(5000, function()
        antiSpam[_source] = nil
    end)
end)

lib.addCommand('i', {
    help = locale('custom_alert_command'),
    params = {
        {
            name = 'text',
            type = 'longString',
            help = locale('custom_alert_text')
        },
    },
    restricted = false
}, function(source, args, raw)
    local _source = source
    if not args.text then return end
    if not canUseCommand(_source) then return end
    local playerName = Core.GetPlayerName(_source)
    if GetResourceState('piotreq_gpt') == 'started' then
        exports['piotreq_gpt']:SendAlert(_source, {
            title = locale('custom_alert'),
            code = '00',
            canAnswer = false,
            maxOfficers = 7,
            time = 5,
            blip = {
                scale = 1.1,
                sprite = 280,
                color = 1,
                alpha = 200,
                name = locale('custom_alert')
            },
            info = {
                {icon = 'fa-solid fa-road', isStreet = true},
                {icon = 'fa-solid fa-id-card', data = args.text},
            },
            type = 'normal',
            notifyTime = 10000,
            jobs = {['police'] = true, ['sheriff'] = true}
        })
    elseif GetResourceState('cd_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = {'police', 'sheriff'},
            coords = vector3(plyCoords.x, plyCoords.y, plyCoords.z),
            title = locale('custom_alert'),
            message = args.text,
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            sound = 1,
            blip = {
                sprite = 431,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = locale('custom_alert'),
                time = 5,
                radius = 0,
            }
        })
    elseif GetResourceState('kibra-dispatch') == 'started' then
        exports["kibra-dispatch"]:SendAlert(_source, args.text, locale('custom_alert'), "fa-user", {"police"}, 431)
    elseif GetResourceState('rcore_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        local data = {
            code = '00',
            default_priority = 'medium',
            coords = plyCoords,
            job = {'police', 'sheriff'},
            text = args.text,
            type = 'alerts',
            blip_time = 5, 
            blip = {
                sprite = 280,
                colour = 1,
                scale = 0.7,
                text = locale('custom_alert'), 
                flashes = false,
                radius = 0,
            }
        }
        TriggerEvent('rcore_dispatch:server:sendAlert', data)
    elseif GetResourceState('codem-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/codem-dispatch/alert', _source, {
            type = 'BackUp',
            header = locale('custom_alert'),
            text = args.text,
            code = '00',
        })
    elseif GetResourceState('lb-tablet') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        exports["lb-tablet"]:AddDispatch({
            priority = 'high',
            code = '00',
            title = 'Back Up',
            description = args.text,
            location = {label = '', coords = {x = plyCoords.x, y = plyCoords.y}},
            time = 60,
            job = 'police'
        })
    end
    antiSpam[_source] = true
    SetTimeout(5000, function()
        antiSpam[_source] = nil
    end)
end)

RegisterNetEvent('p_policejob:BandAlert', function(targetId) -- alert for band removing
    local _source = source

    local xPlayer = Core.GetPlayerFromId(_source)
    local xTarget = Core.GetPlayerFromId(targetId)

    if not xPlayer or not xTarget then return end

    local targetState = Player(targetId).state
    if not targetState.hasTrackingBand then return end

    local plyCoords = GetEntityCoords(GetPlayerPed(_source))
    local targetCoords = GetEntityCoords(GetPlayerPed(targetId))
    if #(plyCoords - targetCoords) > 5 then return end
    
    if GetResourceState('piotreq_gpt') == 'started' then
        exports['piotreq_gpt']:SendAlert(targetId, {
            title = locale('gps_band_alert'),
            code = 'ALERT',
            canAnswer = false,
            maxOfficers = 7,
            time = 5,
            blip = {
                scale = 1.1,
                sprite = 280,
                color = 1,
                alpha = 200,
                name = locale('gps_band_alert')
            },
            info = {
                {icon = 'fa-solid fa-road', isStreet = true},
            },
            type = 'risk',
            notifyTime = 10000,
        })
    elseif GetResourceState('cd_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = {'police', 'sheriff'},
            coords = vector3(plyCoords.x, plyCoords.y, plyCoords.z),
            title = locale('gps_band_alert'),
            message = 'ALERT',
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            sound = 1,
            blip = {
                sprite = 431,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = locale('gps_band_alert'),
                time = 5,
                radius = 0,
            }
        })
    elseif GetResourceState('kibra-dispatch') == 'started' then
        exports["kibra-dispatch"]:SendAlert(_source, locale('gps_band_alert'), 'ALERT', "fa-user", {"police"}, 431)
    elseif GetResourceState('ps-dispatch') == 'started' then
        TriggerClientEvent('ps-dispatch:client:officerdown', _source)
    elseif GetResourceState('qs-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/qs-dispatch/alert', _source, 'SuspiciousActivity')
    elseif GetResourceState('rcore_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        local data = {
            code = 'ALERT',
            default_priority = 'high',
            coords = plyCoords,
            job = {'police', 'sheriff'},
            text = locale('gps_band_alert'),
            type = 'alerts',
            blip_time = 5, 
            blip = {
                sprite = 280,
                colour = 1,
                scale = 0.7,
                text = locale('gps_band_alert'), 
                flashes = false,
                radius = 0,
            }
        }
        TriggerEvent('rcore_dispatch:server:sendAlert', data)
    elseif GetResourceState('codem-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/codem-dispatch/alert', _source, {
            type = 'BackUp',
            header = locale('gps_band_alert'),
            text = locale('gps_band_alert'),
            code = 'ALERT',
        })
    elseif GetResourceState('lb-tablet') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        exports["lb-tablet"]:AddDispatch({
            priority = 'high',
            code = 'ALERT',
            title = locale('gps_band_alert'),
            description = locale('gps_band_alert'),
            location = {label = '', coords = {x = plyCoords.x, y = plyCoords.y}},
            time = 60,
            job = 'police'
        })
    elseif GetResourceState('tk_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        exports['tk_dispatch']:addCall({
            title = locale('gps_band_alert'),
            code = 'BK-0',
            priority = 'high',
            message = locale('gps_band_alert'),
            coords = plyCoords,
            jobs = {'police'},
            blip = {
                sprite = 280,
                color = 1,
                scale = 0.7,
                shortRange = true
            }
        })
    end
end)

RegisterNetEvent('p_policejob:TowVehicle', function(data)
    local _source = source
    local xPlayer = Core.GetPlayerFromId(_source)
    local playerJob = Core.GetPlayerJob(xPlayer)
    if not Config.Jobs[playerJob.name] or Config.Jobs[playerJob.name] > playerJob.grade then
        return
    end

    local entity = utils.getEntityFromNetId(data.netId)
    if entity == 0 or not DoesEntityExist(entity) then
        return
    end

    local plyCoords = GetEntityCoords(GetPlayerPed(_source))
    local targetCoords = GetEntityCoords(entity)
    if #(plyCoords - targetCoords) > 5 then return end

    DeleteEntity(entity)
    Editable.showNotify(_source, locale('vehicle_has_been_towed'), 'success')
end)

local bellTime = os.time()
RegisterNetEvent('p_policejob/server_bell/UseBell', function(data)
    local _source = source
    local stationData = Config.Stations[data.station]
    if not stationData then
        return
    end

    local bellData = stationData.bells[data.bell]
    if not bellData then
        return
    end

    if bellTime > os.time() then
        Editable.showNotify(_source, locale('bell_cooldown', bellTime - os.time()), 'error')
        return
    end

    bellTime = os.time() + 30
    if GetResourceState('piotreq_gpt') == 'started' then
        exports['piotreq_gpt']:SendAlert(_source, {
            title = locale('bell_alert'),
            code = locale('bell'),
            canAnswer = true,
            maxOfficers = 1,
            time = 1,
            blip = {
                scale = 0.8,
                sprite = 409,
                color = 1,
                alpha = 150,
                name = locale('bell_alert')
            },
            info = {
                {icon = 'fa-solid fa-road', isStreet = true},
            },
            type = 'normal',
            notifyTime = 4000,
            jobs = bellData.jobs
        })
    elseif GetResourceState('cd_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        TriggerClientEvent('cd_dispatch:AddNotification', -1, {
            job_table = {'police', 'sheriff'},
            coords = vector3(plyCoords.x, plyCoords.y, plyCoords.z),
            title = locale('bell_alert'),
            message = locale('bell'),
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            sound = 1,
            blip = {
                sprite = 431,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = locale('bell_alert'),
                time = 5,
                radius = 0,
            }
        })
    elseif GetResourceState('kibra-dispatch') == 'started' then
        exports["kibra-dispatch"]:SendAlert(_source, locale('bell_alert'), locale('bell_alert'), "fa-bell", {"police"}, 431)
    elseif GetResourceState('rcore_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        local data = {
            code = locale('bell'),
            default_priority = 'low',
            coords = plyCoords,
            job = {'police', 'sheriff'},
            text = locale('bell_alert'),
            type = 'alerts',
            blip_time = 5, 
            blip = {
                sprite = 280,
                colour = 1,
                scale = 0.7,
                text = locale('bell_alert'), 
                flashes = false,
                radius = 0,
            }
        }
        TriggerEvent('rcore_dispatch:server:sendAlert', data)
    elseif GetResourceState('codem-dispatch') == 'started' then
        TriggerClientEvent('p_policejob/codem-dispatch/alert', _source, {
            type = 'BackUp',
            header = locale('bell'),
            text = locale('bell_alert'),
            code = locale('bell'),
        })
    elseif GetResourceState('lb-tablet') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        exports["lb-tablet"]:AddDispatch({
            priority = 'low',
            code = locale('bell'),
            title = locale('bell'),
            description = locale('bell_alert'),
            location = {label = '', coords = {x = plyCoords.x, y = plyCoords.y}},
            time = 60,
            job = 'police'
        })
    elseif GetResourceState('ps-dispatch') == 'started' then
        TriggerEvent('ps-dispatch:server:notify', {
        message = "Citizen used Bell",
        codeName = "Bell",
        code = 'bell',
        icon = 'fas fa-bell',
        priority = 2,
        coords = GetEntityCoords(GetPlayerPed(_source)), -- Coords of the player
        alert = {
            radius = 0, -- Radius around the blip
            sprite = 280, -- Sprite of the blip
            color = 4, -- Color of the blip
            scale = 0.75, -- Scale of the blip
            length = 2, -- How long it stays on the map
        },
        jobs = {'police', 'sheriff'},
        })
    elseif GetResourceState('tk_dispatch') == 'started' then
        local playerPed = GetPlayerPed(_source)
        local plyCoords = GetEntityCoords(playerPed)
        exports['tk_dispatch']:addCall({
            title = locale('bell'),
            code = locale('bell'),
            priority = 'low',
            message = locale('bell_alert'),
            coords = plyCoords,
            jobs = {'police'},
            blip = {
                sprite = 280,
                color = 1,
                scale = 0.7,
                shortRange = true
            }
        })
    else
        print('[ERROR] SET CUSTOM DISPATCH ALERT IN EDITABLE SERVER')
    end
end)

lib.callback.register('p_policejob/server_outfits/fetchJobData', function(source)
    local _source = source
    local xPlayer = Core.GetPlayerFromId(_source)
    local serverData = {
        grades = {},
        jobName = Core.GetPlayerJob(xPlayer).name,
        licenses = {}
    }
    if GetResourceState('piotreq_gpt') == 'started' then
        local licenses = exports['piotreq_gpt']:getLicenses()[serverData.jobName]
        for k, v in pairs(licenses) do
            serverData.licenses[#serverData.licenses + 1] = {
                value = k,
                label = v.label
            }
        end
    end
    if GetResourceState('es_extended') == 'started' then
        local job_grades = MySQL.query.await('SELECT * FROM job_grades')
        for i = 1, #job_grades, 1 do
            local job_grade = job_grades[i]
            if job_grade.job_name == serverData.jobName then
                serverData.grades[#serverData.grades + 1] = {
                    value = tostring(job_grade.grade),
                    label = job_grade.label
                }
            end
        end
    elseif GetResourceState('qb-core') == 'started' then
        local QBCore = exports['qb-core']:GetCoreObject()
        for jobName, jobData in pairs(QBCore.Shared.Jobs) do
            for grade, gradeInfo in pairs(jobData.grades) do
                if jobName == serverData.jobName then
                    serverData.grades[#serverData.grades + 1] = {
                        value = tostring(grade),
                        label = gradeInfo.name
                    }
                end
            end
        end
    elseif GetResourceState('qbx_core') == 'started' then
        for jobName, jobData in pairs(exports['qbx_core']:GetJobs()) do
            for grade, gradeInfo in pairs(jobData.grades) do
                if jobName == serverData.jobName then
                    serverData.grades[#serverData.grades + 1] = {
                        value = tostring(grade),
                        label = gradeInfo.name
                    }
                end
            end
        end
    end

    return serverData
end)

RegisterNetEvent('p_policejob/server_outfits/createOutfit', function(data, skin)
    local _source = source
    local grades = {}
    local licenses = nil
    for i = 1, #data[2], 1 do
        grades[tostring(data[2][i])] = true
    end
    if data[5] then
        licenses = {}
        for i = 1, #data[5], 1 do
            licenses[data[5][i]] = true
        end
    end
    local id = MySQL.insert.await(
        'INSERT INTO police_outfits (job, grade, label, gender, license, requirements, skin) VALUES (@job, @grade, @label, @gender, @license, @requirements, @skin)', {
        ['@job'] = data[1],
        ['@grade'] = json.encode(grades),
        ['@label'] = data[3],
        ['@gender'] = data[4],
        ['@license'] = licenses and json.encode(licenses) or 'none',
        ['@requirements'] = data[6],
        ['@skin'] = json.encode(skin)
    })
    if id then
        Editable.showNotify(_source, locale('outfit_created', data[3], data[1]), 'success')
    end
end)

lib.callback.register('p_policejob/server_outfits/getOutfits', function(source, playerGender)
    local _source = source
    local xPlayer = Core.GetPlayerFromId(_source)
    local playerJob = Core.GetPlayerJob(xPlayer)
    local outfits = {}
    local result = MySQL.query.await('SELECT * FROM police_outfits WHERE job = ?', {playerJob.name})
    for i = 1, #result, 1 do
        local outfit = result[i]
        if playerGender == outfit.gender then
            local grades = json.decode(outfit.grade)
            local licenses = outfit.license ~= 'none' and json.decode(outfit.license) or nil
            local hasGrade, hasLicense = grades[tostring(playerJob.grade)], false
            if (outfit.requirements == 'required_grade' or outfit.requirements == 'required_both') and not hasGrade then
                goto skip
            end
            
            if outfit.requirements == 'required_license' or outfit.requirements == 'required_both' then
                if licenses then
                    local row = MySQL.single.await('SELECT licences FROM p_mdt_officers WHERE identifier = ?', {xPlayer.identifier})
                    local plyLicenses = row and json.decode(row.licences) or {}
                    for j = 1, #plyLicenses, 1 do
                        if licenses[plyLicenses[j]] then
                            hasLicense = true
                            break
                        end
                    end
                end
    
                if not hasLicense then
                    goto skip
                end
            end
    
            outfits[#outfits + 1] = {
                label = outfit.label,
                skin = outfit.skin
            }
        end

        ::skip::
    end
    return outfits
end)

lib.callback.register('p_policejob/server_outfits/fetchAllOutfits', function(source)
    local _source = source
    local xPlayer = Core.GetPlayerFromId(_source)
    local playerJob = Core.GetPlayerJob(xPlayer)
    local result = MySQL.query.await('SELECT * FROM police_outfits')
    return result
end)

RegisterNetEvent('p_policejob/server_outfits/removeOutfits', function(outfits)
    local _source = source
    local xPlayer = Core.GetPlayerFromId(_source)
    local playerJob = Core.GetPlayerJob(xPlayer)
	if not Config.OutfitsAccess[playerJob.name] or Config.OutfitsAccess[playerJob.name] > tonumber(playerJob.grade) then
		return
	end

    local data = {}
    for i = 1, #outfits do
        data[i] = {outfits[i]}
    end
    MySQL.prepare('DELETE FROM police_outfits WHERE id = ?', data)
    Editable.showNotify(_source, locale('outfits_removed'), 'success')
end)

RegisterNetEvent('p_policejob/server_jail/SendScreenShot', function(data)
    local _source = source
    local webhook = Webhooks['jail']
    if not data.officer then return end
    if not webhook or webhook == 'WEBHOOK HERE' then -- dont touch it
        print('[ERROR] SET WEBHOOKS IN CONFIG.WEBHOOKS')
        print('[ERROR] SET WEBHOOKS IN CONFIG.WEBHOOKS')
        print('[ERROR] SET WEBHOOKS IN CONFIG.WEBHOOKS')
        print('[ERROR] SET WEBHOOKS IN CONFIG.WEBHOOKS')
        print('[ERROR] SET WEBHOOKS IN CONFIG.WEBHOOKS')
        print('[ERROR] SET WEBHOOKS IN CONFIG.WEBHOOKS')
        print('[ERROR] SET WEBHOOKS IN CONFIG.WEBHOOKS')
        return
    end

    local playerName = Core.GetPlayerName(_source)
    local embeds = {
		{
			["avatar_url"] = "https://r2.fivemanage.com/xlufCGKYLtGfU8IBmjOL9/LOGO3.png",
			["username"] = locale('bolingbroke'),
			["author"] = {
				["name"] = locale('bolingbroke'),
				["icon_url"] = "https://r2.fivemanage.com/xlufCGKYLtGfU8IBmjOL9/LOGO3.png",
			},
			["description"] = locale('jail_screenshot', playerName, data.officer, data.jail, data.fine, data.reason),
			["type"]="rich",
			["color"] =5793266,
			["image"]= {
				["url"]=data.url
			},
			["footer"] = {
				["text"] = os.date() .. " | "..locale('bolingbroke'),
				["icon_url"] = "https://r2.fivemanage.com/xlufCGKYLtGfU8IBmjOL9/LOGO3.png",
			},
		}
	}
	PerformHttpRequest(Webhooks['jail'], function(err, text, headers) end, 'POST', json.encode({ username = 'pScripts', avatar_url = 'https://r2.fivemanage.com/xlufCGKYLtGfU8IBmjOL9/LOGO3.png',embeds = embeds}), { ['Content-Type'] = 'application/json' })
end)

lib.addCommand('callsign', {
    help = locale('commands.callsign'),
    params = {
        {
            name = 'callsign',
            type = 'string',
            help = locale('callsign_number'),
        }
    },
}, function(source, args)
    local _source = source
    Core.setPlayerData(_source, 'callsign', args.callsign)
end)

-- GRANT/REVOKE LICENSE FUNCTIONALITY

lib.addCommand('grantlicense', {
    help = locale('license_grant_command'),
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = locale('license_grant_playerid')
        },
        {
            name = 'license',
            type = 'string',
            help = locale('license_grant_license')
        },
    },
}, function(source, args, raw)
    if not args.target or not args.license then
        return
    end
    
    local playerJob = Core.GetPlayerJob(source)
    if Config.Jobs[playerJob.name] then
        Core.GrantLicense(source, args.target, args.license)
    end
end)

lib.addCommand('revokelicense', {
    help = locale('license_revoke_command'),
    params = {
        {
            name = 'target',
            type = 'playerId',
            help = locale('license_revoke_playerid')
        },
        {
            name = 'license',
            type = 'string',
            help = locale('license_revoke_license')
        },
    },
}, function(source, args, raw)
    if not args.target or not args.license then
        return
    end
    
    local playerJob = Core.GetPlayerJob(source)
    if Config.Jobs[playerJob.name] then
        Core.RevokeLicense(source, args.target, args.license)
    end
end)

RegisterNetEvent('p_policejob/inventory/removeItem', function(itemName, itemCount)
    Inventory.removePlayerItem(source, itemName, itemCount)
end)