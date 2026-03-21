Config.Jail = {}

Config.Jail.EnableJail = true -- enable jail system
Config.Jail.NeedDuty = true -- officer need to be on duty?
Config.Jail.RemoveItems = false -- 'locker' / 'wipe' / false ['locker' = all items will go to locker, 'wipe' = all items will be removed, false = nothing will happen]
Config.Jail.WhitelistedItems = { -- items that will not be removed [set to false if none]
    ['money'] = true,
}
Config.Jail.RemoveItems = { -- items which will be removed when player get out of jail
    ['burger'] = true,
    ['water'] = true,
}
Config.Jail.JailTimer = true -- enable jail timer [visible text ui on top of the screen]
Config.Jail.ReduceOfflineTime = false -- reduce offline time [if player is offline, time will be reduced]

-- SCRIPT WILL TELEPORT YOU AFTER DEATH TO ONE OF AVAILABLE BEDS :)
Config.Jail.Hospital = {
    enabled = true, -- enable hospital system?
    treatTime = 30, -- time it takes to treat a player
    reviveEvent = 'p_ambulancejob:RevivePlayer', -- client event to revive player without any args
    beds = {
        vector4(1785.9260, 2613.8350, 51.0082, 180.4699),
        vector4(1788.3591, 2613.9778, 51.0082, 180.5261),
        vector4(1790.6190, 2614.0393, 51.0082, 180.2590),
        vector4(1790.2001, 2609.7688, 50.9699, 359.4071),
        vector4(1787.8474, 2609.7656, 50.9700, 0.0675),
        vector4(1785.6639, 2609.8467, 50.9700, 0.6679)
    }
}

Config.Jail.Commands = {
    ['jail'] = 'jail',
    ['unjail'] = 'unjail',
    ['shortjail'] = 'shortjail'
}

Config.Jail.Access = {
    ['jail'] = { -- jail command [/jail id months fine reason]
        ['owner'] = true, -- player with owner group/permission can use
        ['admin'] = true, -- player with admin group/permission can use
    },
    ['unjail'] = { -- unjail command [/unjail id]
        ['owner'] = true, -- player with owner group/permission can use
        ['admin'] = true, -- player with admin group/permission can use
    },
    ['shortjail'] = { -- shortjail command [it will short player jail time /short jail id months]
        ['owner'] = true, -- player with owner group/permission can use
        ['admin'] = true, -- player with admin group/permission can use
    }
}

Config.Jail.Outfit = {
    ["male"] = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 345,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 0,
        pants_1 = 138,   pants_2 = 0,
        shoes_1 = 132,   shoes_2 = 0,
        helmet_1 = -1,  helmet_2 = 0,
        mask_1 = 0,     mask_2 = 0,
        chain_1 = 0,    chain_2 = 0,
        ears_1 = 2,     ears_2 = 0
    },
    ["female"] = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 338,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 44,
        pants_1 = 145,   pants_2 = 0,
        shoes_1 = 137,   shoes_2 = 0,
        helmet_1 = -1,  helmet_2 = 0,
        mask_1 = 0,     mask_2 = 0,
        chain_1 = 0,    chain_2 = 0,
        ears_1 = 2,     ears_2 = 0
    }
}

Config.Jail.ConvertMonths = function(months)
    return math.floor(months * 60) -- month = 1 minute
end

Config.Jail.ConvertMonths_2 = function(time)
    return math.floor(time / 60) -- seconds to month (1 minute)
end

Config.Jail.SetUniform = function()
    local uniformObject
            
    local playerSex = Core.GetPlayerSex()
    local sex = nil
    if playerSex == 'm' or playerSex == 0 then
        sex = 'male'
    else
        sex = 'female'
    end

    uniformObject = Config.Jail.Outfit[sex]

    if uniformObject then
        Editable.setClothes(Editable.convertSkin(uniformObject))
    end
end

Config.Jail.Zone = {
    jailCoords = vector4(1755.2000, 2492.9490, 45.6513, 212.2371), -- tp here on jail
    unJailCoords = vector4(1846.5839, 2585.7852, 45.6720, 273.4318), -- tp here on ujail
    points = { -- BORDER POINTS OF JAIL MAP [https://overextended.dev/ox_lib/Modules/Zones/Shared#libzonespoly]
        vector3(1851.6860, 2612.5491, 40.6460),
        vector3(1852.1394, 2701.5581, 40.6460),
        vector3(1773.6439, 2767.1697, 40.6460),
        vector3(1648.2583, 2762.4854, 40.6460),
        vector3(1566.2778, 2682.9824, 40.6460),
        vector3(1530.6156, 2586.8628, 40.6460),
        vector3(1537.3165, 2467.2065, 40.6460),
        vector3(1657.2385, 2390.4211, 40.6460),
        vector3(1763.3314, 2406.4651, 40.6460),
        vector3(1827.3147, 2472.8708, 40.6460),
        vector3(1817.7594, 2533.5786, 40.6460),
        vector3(1820.1619, 2567.2734, 40.6460),
        vector3(1852.0808, 2567.8420, 40.6460),
        vector3(1852.4672, 2625.8269, 40.6460)
    },
    thickness = 50 -- thickness of border
}

Config.Jail.Cutscene = {
    isEnabled = true, -- enable cutscene? [if false it will teleport you to jail]
    playerPos = vector4(402.915, -996.759, -99.0002, 185.2249), -- player position
    cameraPos = { 
        x = 402.9453, y = -998.3599, z = -98.7041, -- camera coords
        rotationX = -5.4330, rotationY = 0.0, rotationZ = 0.31496 -- camera rotation
    },
}

Config.Jail.Tutorial = {
    isEnabled = true,
    points = {
        [1] = {
            duration = 5000,
            camCoords = vector3(1844.3916, 2580.3611, 46.8879),
            pointCoords = vector3(1839.5210, 2581.6890, 45.8905),
            camFov = 50.0,
            marker = {
                coords = vector3(1839.5165, 2581.7146, 45.9906),
                rot = vector3(0.0, 180.0, 0.0),
                type = 3,
                color = {255, 255, 255, 100}, -- rgba
                scale = 0.5,
            },
            text = 'Jail Locker - You can get your items here after finishing your sentence',
        },
        [2] = {
            duration = 4500,
            camCoords = vector3(1755.9613, 2500.9077, 46.7515),
            pointCoords = vector3(1755.5260, 2498.2148, 45.8214),
            text = 'Info Center - You can check your sentence or get a work to short your time',
            camFov = 60.0,
            marker = {
                coords = vector3(1755.2795, 2497.3257, 46.5559),
                rot = vector3(0.0, 180.0, 0.0),
                type = 3,
                color = {255, 255, 255, 100}, -- rgba
                scale = 0.5,
            },
        },
        [3] = {
            duration = 4000,
            camCoords = vector3(1595.3795, 2537.5793, 47.7293),
            pointCoords = vector3(1591.3011, 2541.7803, 45.9285),
            text = 'Laundry - One of place where you can work to short your sentence',
            camFov = 60.0,
        },
        [4] = {
            duration = 4000,
            camCoords = vector3(1567.7051, 2548.1458, 46.8292),
            pointCoords = vector3(1580.4064, 2548.0740, 45.6993),
            text = 'Woodwork - One of place where you can work to short your sentence',
            camFov = 60.0,
        },
    }
}

-- IT WILL EXECUTE WHEN PLAYER GET FINED [SERVER SIDED ONLY!]
Config.Jail.OnPlayerFine = function(playerId, fine, officerName, officerId) -- SERVER SIDE
    -- do something
end

-- IT WILL EXECUTE WHEN PLAYER GET JAILED [SERVER SIDED ONLY!]
Config.Jail.OnPlayerJailed = function(player, months, fine, officerName, officerId) -- SERVER SIDE
    -- do something
end

-- IT WILL EXECUTE WHEN PLAYER GET UNJAILED [SERVER SIDED ONLY!]
Config.Jail.OnPlayerUnJailed = function(player) -- SERVER SIDE
    TriggerClientEvent('p_policejob/jail/clearJob', player)
    if GetResourceState('illenium-appearance') == 'started' then
        TriggerClientEvent('illenium-appearance:client:reloadSkin', player, true)
    else
        if GetResourceState('es_extended') == 'started' then
            local xPlayer = ESX.GetPlayerFromId(player)
            local row = MySQL.single.await('SELECT skin FROM users WHERE identifier = ?', {xPlayer.identifier})
            if row and row.skin then
                local plySkin = json.decode(row.skin)
                TriggerClientEvent('skinchanger:loadClothes', player, plySkin, plySkin)
            end
        else
            local QBCore = exports['qb-core']:GetCoreObject()
            local Player = QBCore.Functions.GetPlayer(player)
            local result = MySQL.query.await('SELECT * FROM playerskins WHERE citizenid = ? AND active = ?', { Player.PlayerData.citizenid, 1 })
            if result[1] ~= nil then
                TriggerClientEvent("qb-clothes:loadSkin", player, false, result[1].model, result[1].skin)
            else
                TriggerClientEvent("qb-clothes:loadSkin", player, true)
            end
        end
    end
    -- do something
end

Config.Jail.Lockers = {
    ['MissionRow'] = {
        coords = vector3(465.61, -990.98, 27.2),
        radius = 0.75,
        drawSprite = true,
        options = {
            {
                name = 'MissionRow_Jail_Locker',
                label = locale('jail_locker'),
                icon = 'fa-solid fa-id-card',
                distance = 2,
                drawSprite = true,
                groups = {['police'] = 1},
                onSelect = function()
                    OpenPlayerLocker()
                end,
                canInteract = function()
                    local dutyData = Editable.CheckDuty()
                    return dutyData.status == 1
                end
            },
            {
                name = 'MissionRow_Evidence_Locker',
                label = locale('evidence_locker'),
                icon = 'fa-solid fa-id-card',
                distance = 2,
                drawSprite = true,
                groups = {['police'] = 1},
                onSelect = function()
                    OpenPlayerEvidence()
                end,
                canInteract = function()
                    local dutyData = Editable.CheckDuty()
                    return dutyData.status == 1
                end
            }
        }
    }
}

Config.Jail.PersonalPrisonLocker = {
    coords = vector3(1838.72, 2581.64, 45.89),
    radius = 0.75,
    label = locale('jail_locker'),
    icon = 'fa-solid fa-id-card',
    distance = 2,
    drawSprite = true,
}

-- INFO CENTER [CHECK SENTENCE AND JAIL JOBS]
Config.Jail.Ped = {
    model = 's_m_y_cop_01',
    anim = {},
    coords = vector4(1755.2795, 2497.3257, 45.6559, 300.7351) -- coords of ped and target
}

Config.Jail.Jobs = {
    [locale('laundry')] = {
        [1] = { -- 1ST STEP
            target = {label = locale('take_laundry'), icon = 'fa-solid fa-tshirt'},
            locations = { -- script will select random location from table
                vector3(1591.77, 2549.59, 45.7),
            },
            blipData = {
                sprite = 514, color = 5, label = locale('laundry'), scale = 0.8
            },
            onStart = function()
                Editable.showHelpNotify(locale('laundry'), locale('laundry_start_help'))
            end,
            progress = {
                duration = 7500, label = locale('taking_laundry'),
                anim = {scenario = 'PROP_HUMAN_BUM_BIN'},
                disable = {move = true, combat = true, car = true},
            },
            onEnd = function()
                jailJobs.playAnim({
                    animDict = 'anim@heists@box_carry@', animClip = 'idle', flag = 49,
                    propModel = 'v_ind_rc_overallfld', propBone = 28422,
                    propCoords = vector3(0.0, -0.08, -0.17), propRot = vector3(0.0, 0.0, 0.0),
                    disableSprint = true
                })
            end,
        },
        [2] = {
            target = {label = locale('put_laundry'), icon = 'fa-solid fa-tshirt'},
            locations = {
                vector3(1596.92, 2541.54, 45.6), vector3(1596.92, 2540.85, 45.5),
                vector3(1596.96, 2539.45, 45.6), vector3(1588.68, 2538.05, 45.65),
                vector3(1588.68, 2539.41, 45.6), vector3(1588.67, 2540.86, 45.6),
            },
            blipData = {
                sprite = 514, color = 5, label = locale('laundry'), scale = 0.8
            },
            onStart = function()
                Editable.showHelpNotify(locale('laundry'), locale('laundry_second_help'))
            end,
            onSelect = function()
                local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'easy'}, {'w', 'a', 's', 'd'})
                if success then
                    jailJobs.stopAnim()
                end
                return success
            end,
            progress = {
                duration = 7500, label = locale('making_laundry'),
                anim = {scenario = 'PROP_HUMAN_BUM_BIN'},
                disable = {move = true, combat = true, car = true},
            },
            onEnd = function()
                jailJobs.playAnim({
                    animDict = 'anim@heists@box_carry@', animClip = 'idle', flag = 49,
                    propModel = 'p_overalls_02_s', propBone = 28422,
                    propCoords = vector3(0.0, -0.08, -0.17), propRot = vector3(0.0, 0.0, 0.0),
                    disableSprint = true
                })
            end
        },
        [3] = {
            target = {label = locale('fold_laundry'), icon = 'fa-solid fa-tshirt'},
            locations = {
                vector3(1591.7, 2540.97, 45.6), vector3(1591.78, 2538.66, 45.5),
                vector3(1593.54, 2540.93, 45.6), vector3(1593.91, 2538.61, 45.5),
            },
            blipData = {
                sprite = 514, color = 5, label = locale('laundry'), scale = 0.8
            },
            onStart = function()
                Editable.showHelpNotify(locale('laundry'), locale('laundry_finish_help'))
            end,
            months = {min = 10, max = 15}, -- how much months will be removed [random select between min and max]
            onSelect = function()
                local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'easy'}, {'w', 'a', 's', 'd'})
                if success then
                    jailJobs.stopAnim()
                end
                return success
            end,
            progress = {
                duration = 7500, label = locale('folding_laundry'),
                anim = {scenario = 'PROP_HUMAN_BUM_BIN'},
                disable = {move = true, combat = true, car = true},
            },
            onEnd = function()
                Editable.hideHelpNotify()
            end
        }
    },
    [locale('woodwork')] = {
        [1] = { -- 1ST STEP
            target = {label = locale('take_wood'), icon = 'fa-solid fa-tree'},
            locations = { -- script will select random location from table
                vector3(1566.62, 2548.06, 46.0), vector3(1567.13, 2550.08, 46.0),
            },
            blipData = {
                sprite = 514, color = 5, label = locale('woodwork'), scale = 0.8
            },
            onStart = function()
                Editable.showHelpNotify(locale('woodwork'), locale('woodwork_start_help'))
            end,
            progress = {
                duration = 7500, label = locale('taking_wood'),
                anim = {scenario = 'PROP_HUMAN_BUM_BIN'},
                disable = {move = true, combat = true, car = true},
            },
            onEnd = function()
                jailJobs.playAnim({
                    animDict = 'missfinale_c2mcs_1', animClip = 'fin_c2_mcs_1_camman', flag = 49,
                    propModel = 'bzzz_lumberjack_wood_pack_3a_static', propBone = 6286,
                    -- PROPS CREDITS - https://forum.cfx.re/t/props-woods-for-lumberjack/5119893
                    propCoords = vector3(0.09, 0.1, -0.06), propRot = vector3(6.28, 0.0, 10.64),
                    disableSprint = true
                })
            end,
        },
        [2] = {
            target = {label = locale('process_wood'), icon = 'fa-solid fa-tree'},
            locations = {
                vector3(1570.9, 2550.35, 45.5), vector3(1574.61, 2550.47, 45.5),
                vector3(1570.87, 2545.74, 45.5), vector3(1578.4, 2550.41, 45.6),
                vector3(1574.65, 2545.84, 45.4), vector3(1578.35, 2545.74, 45.5),
                vector3(1581.95, 2550.44, 45.6), vector3(1581.95, 2545.75, 45.6),
            },
            blipData = {
                sprite = 514, color = 5, label = locale('woodwork'), scale = 0.8
            },
            onStart = function()
                Editable.showHelpNotify(locale('woodwork'), locale('woodwork_second_help'))
            end,
            onSelect = function()
                local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'easy'}, {'w', 'a', 's', 'd'})
                if success then
                    jailJobs.stopAnim()
                end
                return success
            end,
            progress = {
                duration = 7500, label = locale('processing_wood'),
                anim = {dict = 'anim@heists@fleeca_bank@drilling', clip = 'drill_right_end', flag = 1},
                disable = {move = true, combat = true, car = true},
                prop = {model = `prop_tool_consaw`, pos = vec3(0.1, 0.04, 0.35), rot = vec3(5.78, -9.1, -79.23)}
            },
            onEnd = function()
                ClearPedTasks(cache.ped)
                SetTimeout(200, function()
                    jailJobs.playAnim({
                        animDict = 'anim@heists@box_carry@', animClip = 'idle', flag = 49,
                        propModel = 'bzzz_lumberjack_wood_pack_2d', propBone = 28422,
                        propCoords = vector3(0.02, -0.15, -0.17), propRot = vector3(1.3, 0.0, 90.74),
                        disableSprint = true
                    })
                end)
            end
        },
        [3] = {
            target = {label = locale('woodwork_finish'), icon = 'fa-solid fa-tree'},
            locations = { -- script will select random location from table
                vector3(1566.62, 2548.06, 46.0), vector3(1567.13, 2550.08, 46.0),
            },
            blipData = {
                sprite = 514, color = 5, label = locale('woodwork'), scale = 0.8
            },
            onStart = function()
                Editable.showHelpNotify(locale('woodwork'), locale('woodwork_finish_help'))
            end,
            months = {min = 2, max = 5}, -- how much months will be removed [random select between min and max]
            onSelect = function()
                local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'easy'}, {'w', 'a', 's', 'd'})
                if success then
                    jailJobs.stopAnim()
                end
                return success
            end,
            progress = {
                duration = 7500, label = locale('putting_desks'),
                anim = {scenario = 'PROP_HUMAN_BUM_BIN'},
                disable = {move = true, combat = true, car = true},
            },
            onEnd = function()
                Editable.hideHelpNotify()
            end
        }
    },
}

-- JAIL UTILITIES

Config.Jail.Utils = {}

Config.Jail.Utils.Showers = {
    {coords = vec3(1697.4, 2578.94, 45.4), radius = 0.9, duration = 10000},
    {coords = vec3(1697.26, 2577.38, 45.4), radius = 0.9, duration = 10000},
    {coords = vec3(1697.36, 2575.73, 45.5), radius = 0.9, duration = 10000},
}

Config.Jail.Utils.Kitchens = {
    ['Kitchen_1'] = {
        coords = vec3(1735.6, 2587.45, 45.7),
        items = {
            ['water'] = {label = locale('water')},
            ['burger'] = {label = locale('burger')},
        }
    }
}

Config.Jail.Utils.Undress = function()
    local p = promise.new()
    local oldSkin = Editable.GetPlayerSkin()
    local firstDict = lib.requestAnimDict('missmic4')
    local secondDict = lib.requestAnimDict('re@construction')
    TaskPlayAnim(cache.ped, firstDict, 'michael_tux_fidget', -8.0, 8.0, 2000, 51)
    Editable.setClothes({
        ['arms'] = 15,
        ['tshirt_1'] = 15, ['tshirt_2'] = 0,
        ['torso_1'] = 15, ['torso_2'] = 0,
        ['bproof_1'] = 0, ['bproof_2'] = 0
    })
    Citizen.Wait(2000)
    TaskPlayAnim(cache.ped, secondDict, 'out_of_breath', -8.0, 8.0, 2000, 51)
    Citizen.Wait(1000)
    Editable.setClothes({
        ['arms'] = 15,
        ['pants_1'] = 14, ['pants_2'] = 0,
        ['shoes_1'] = 34, ['shoes_2'] = 0,
        ['tshirt_1'] = 15, ['tshirt_2'] = 0,
        ['torso_1'] = 15, ['torso_2'] = 0,
        ['bproof_1'] = 0, ['bproof_2'] = 0
    })
    ClearPedTasks(cache.ped)
    Citizen.Wait(250)
    p:resolve(oldSkin)

    local await = Citizen.Await(p)
    RemoveAnimDict(firstDict)
    RemoveAnimDict(secondDict)
    return await
end