Config = {}

while not locale do Citizen.Wait(0) end

Config.Hospital = 'wxmaps_hospital'

Citizen.CreateThread(function()
    if type(Config.Hospital) == 'string' then
        local hospitalFile = lib.load(('hospitals.%s'):format(Config.Hospital))
        if not hospitalFile then return end

        Config.Hospitals = hospitalFile.Hospital
        Config.TV.points = hospitalFile.TV
        Config.CheckIn.points = hospitalFile.CheckIn
        Config.CheckIn.beds = hospitalFile.CheckInBeds
        Config.Insurance.points = hospitalFile.Insurances
        Config.Shops = hospitalFile.Shops
        Config.Garages = hospitalFile.Garages
        Config.Elevators.points = hospitalFile.Elevators
    elseif type(Config.Hospital) == 'table' then
        for k, v in pairs(Config.Hospital) do
            local hospitalFile = lib.load(('hospitals.%s'):format(v))
            if hospitalFile then
                lib.table.merge(Config.Hospitals, hospitalFile.Hospital)
                lib.table.merge(Config.TV.points, hospitalFile.TV)
                lib.table.merge(Config.CheckIn.points, hospitalFile.CheckIn)
                lib.table.merge(Config.CheckIn.beds, hospitalFile.CheckInBeds)
                lib.table.merge(Config.Insurance.points, hospitalFile.Insurances)
                lib.table.merge(Config.Shops, hospitalFile.Shops)
                lib.table.merge(Config.Garages, hospitalFile.Garages)
                lib.table.merge(Config.Elevators.points, hospitalFile.Elevators)
            end
        end
    else
        for k, v in pairs({'kiiya_hospital', 'fm_hospital', 'wxmaps_hospital', 'prompts_hospital', 'nteam_hospital', 'gabz_hospital', 'hane_hospital', 'fiv3devs_hospital', 'diables_hospital', 'ajaxon_hospital'}) do
            local hospitalFile = lib.load(('hospitals.%s'):format(v))
            if hospitalFile then
                lib.table.merge(Config.Hospitals, hospitalFile.Hospital)
                lib.table.merge(Config.TV.points, hospitalFile.TV)
                lib.table.merge(Config.CheckIn.points, hospitalFile.CheckIn)
                lib.table.merge(Config.CheckIn.beds, hospitalFile.CheckInBeds)
                lib.table.merge(Config.Insurance.points, hospitalFile.Insurances)
                lib.table.merge(Config.Shops, hospitalFile.Shops)
                lib.table.merge(Config.Garages, hospitalFile.Garages)
                lib.table.merge(Config.Elevators.points, hospitalFile.Elevators)
            end
        end
    end
end)

Config.Hospitals = {}
Config.Shops = {}
Config.Garages = {}

Config.Alerts = {
    enabled = true,
    jobs = {'ambulance'},
    menuKey = 'F5',
    menuCommand = 'emsDispatch',
    autoResolveAlert = true
}

Config.TV = {
    enabled = true,
    points = {}
}

Config.CheckIn = {
    enabled = true,
    canPayForOther = true,
    useTextUI = false,
    moneyIntoSociety = false,
    camera = {
        enabled = true,
        offset = vec3(-1.5, 1.25, -0.65),
    },
    AiMedic = {
        enabled = true,
        model = 's_m_m_paramedic_01',
        vehModel = 'ambulance',
        maxMedics = 2,
    },
    onStart = function(hospitalName, spawnType)
        return true
    end,
    onFinish = function(hospitalName, isRespawn)
        local offset = GetOffsetFromEntityInWorldCoords(cache.ped, 0.1, 1.5, 0.0)
        if hospitalName == 'fm_hospital' then
            offset = GetOffsetFromEntityInWorldCoords(cache.ped, 0.35, 0.0, 0.1)
        end
        SetEntityCoordsNoOffset(cache.ped, offset.x, offset.y, offset.z, true, true, true)
    end,
    points = {},
    beds = {}
}

Citizen.CreateThread(function()
    if (type(Config.Hospital) == 'string' and Config.Hospital == 'fm_hospital') or (type(Config.Hospital) == 'table' and lib.table.contains(Config.Hospital, 'fm_hospital')) then
        Config.CheckIn.camera.offset = vec3(1.5, 1.25, -0.65)
    end
end)

Config.Insurance = {
    enabled = true,
    moneyIntoSociety = false,
    options = {
        ['basis'] = {
            label = 'Basis Verzekering',
            price = 1000,
            duration = 7 * 24 * 60 * 60,
        },
        ['premium'] = {
            label = 'Premium Verzekering',
            price = 4000,
            duration = 30 * 24 * 60 * 60,
        }
    },
    points = {}
}

Config.MedicBag = {
    enabled = true,
    prop = {
        model = 'xm_prop_x17_bag_med_01a',
        coords = vector3(0.35, 0.0, 0.01),
        rot = vector3(0.0, 270.0, -120.0)
    },
    anims = {
        putdown = {dict = 'pickup_object', clip = 'pickup_low', flag = 1},
        pickup = {dict = 'pickup_object', clip = 'pickup_low', flag = 1}
    },
    items = {
        ['medicbag'] = {
            ['bandage'] = true,
            ['icepack'] = true,
            ['defibrilator'] = true,
            ['ointment'] = true,
            ['disinfectant'] = true,
            ['splint'] = true,
            ['suture_kit'] = true,
            ['morphine'] = true,
            ['medical_kit'] = true,
            ['advanced_medical_kit'] = true,
            ['blood_bag_250'] = true,
            ['blood_bag_500'] = true,
            ['painkillers'] = true,
            ['gauze'] = true,
            ['adrenaline'] = true,
            ['cyclonamine'] = true,
            ['tourniquet'] = true,
            ['antipyretics'] = true,
        },
        ['medicbag_small'] = {
            ['bandage'] = true,
            ['icepack'] = true,
            ['ointment'] = true,
            ['disinfectant'] = true,
            ['splint'] = true,
            ['morphine'] = true,
            ['medical_kit'] = true,
        }
    }
}

Config.Death = {
    forceDeathAfterHeadshot = true,
    forceDeathAfterFall = false,
    spawnDeadAboveGround = false,
    spawnFullHealthIfAlive = false,
    targetRevive = {
        enabled = true,
        allowedDeathStage = {
            ['bleeding'] = true,
        },
        reviveHealth = 200,
        onStart = function(targetId)
            local animDict = lib.requestAnimDict('amb@medic@standing@tendtodead@idle_a')
            TaskPlayAnim(cache.ped, animDict, 'idle_a', 8.0, -8.0, -1, 1, 0, false, false, false)
            local result = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 2}, 'hard'}, {'w', 'a', 's', 'd'})
            if result then
                if Bridge.Progress.StartCircle({
                    duration = 25000,
                    label = locale('reviving_player'),
                    position = 'center',
                    useWhileDead = true,
                    canCancel = true
                }) then
                    TriggerServerEvent('p_ambulancejob/server/death/targetRevive', targetId)
                end
            end
            RemoveAnimDict(animDict)
            ClearPedTasks(cache.ped)
        end
    },
    preventDeath = function()
        if GetResourceState('ws_ffa_v2') == 'started' then
            return exports["ws_ffa-v2"]:isInZone()
        end
        return false
    end,
    useEnviMedic = false,
    animals = {
        enabled = true,
        anims = {
            [`A_C_Rottweiler`] = {dict = 'creatures@rottweiler@move', clip = 'dead_left', flag = 1},
            [`A_C_Cat_01`] = {dict = 'creatures@cat@move', clip = 'dead_left', flag = 1},
            [`A_C_Pug`] = {dict = 'creatures@pug@move', clip = 'dead_left', flag = 1},
            [`A_C_Chop`] = {dict = 'creatures@rottweiler@move', clip = 'dead_left', flag = 1},
            [`A_C_Husky`] = {dict = 'creatures@rottweiler@move', clip = 'dead_left', flag = 1},
            [`A_C_Boar`] = {dict = 'creatures@boar@move', clip = 'dead_right', flag = 1},
            [`A_C_Cow`] = {dict = 'creatures@cow@move', clip = 'dead_left', flag = 1},
            [`A_C_Deer`] = {dict = 'creatures@deer@move', clip = 'dead_left', flag = 1},
            [`A_C_MtLion`] = {dict = 'creatures@coyote@move', clip = 'dead_left', flag = 1},
            [`A_C_Rabbit_01`] = {dict = 'creatures@rabbit@move', clip = 'dead_left', flag = 1},
            [`A_C_Shepherd`] = {dict = 'creatures@rottweiler@move', clip = 'dead_left', flag = 1},
            [`A_C_Westy`] = {dict = 'creatures@pug@move', clip = 'dead_left', flag = 1},
        }
    },
    commands = {
        ['kill'] = {
            enabled = true,
            names = {'kill', 'slay'},
            restricted = {'group.best', 'group.owner', 'group.admin'},
            canUse = function(playerId, targetId) return true end
        },
        ['killall'] = {
            enabled = false,
            names = {'killall'},
            restricted = {'group.god', 'group.best', 'group.owner', 'group.admin'},
            canUse = function(playerId, targetId) return true end
        },
        ['killradius'] = {
            enabled = false,
            names = {'killradius', 'slayradius'},
            restricted = {'group.god', 'group.best', 'group.owner', 'group.admin'},
            canUse = function(playerId, targetId) return true end
        },
        ['revive'] = {
    enabled = true,
    names = {'revive', 'rev'},
    restricted = {'group.best', 'group.owner', 'group.admin'},
    canUse = function(playerId, targetId) return true end,
    canUseEvent = function(invokingResource) return true end,
    serverFunction = function(playerId, targetId)
        if GetResourceState('qbx_core') == 'started' then
            local Player = exports.qbx_core:GetPlayer(targetId)
            if Player then
                Player.Functions.SetMetaData('isDead', false)
                exports.qbx_core:SetPlayerHealth(targetId, 200)
            end
        end
    end,
    clientFunction = function()
    end
},
['reviveall'] = {
    enabled = true,
    names = {'reviveall', 'revall'},
    restricted = {'group.best', 'group.owner', 'group.admin'},
    canUse = function(playerId, targetId) return true end,
},
['reviveradius'] = {
    enabled = true,
    names = {'reviveradius', 'revradius'},
    restricted = {'group.best', 'group.owner', 'group.admin'},
    canUse = function(playerId, targetId) return true end,
},
['heal'] = {
    enabled = true,
    names = {'heal'},
    restricted = {'group.best', 'group.owner', 'group.admin'},
    canUse = function(playerId, targetId) return true end,
    canUseEvent = function(invokingResource) return true end,
    serverFunction = function(playerId, targetId)
        if GetResourceState('qbx_core') == 'started' then
            local Player = exports.qbx_core:GetPlayer(targetId)
            if Player then
                Player.Functions.SetMetaData('isDead', false)
                exports.qbx_core:SetPlayerHealth(targetId, 200)
            end
        end
    end,
    clientFunction = function()
    end
}
    },

    enabledKeys = {0, 1, 2, 3, 5, 245, 249},
    stages = {
        ['alive'] = {
            enableFadeOut = true,
            onInit = function()
                if GetResourceState('qbx_core') == 'started' then
                    exports['qbx_core']:SetPlayerDead(false)
                end
                if GetResourceState('lb-phone') == 'started' then
                    if not LocalPlayer.state.isCuffed then
                        exports["lb-phone"]:ToggleDisabled(false)
                    end
                end
                if GetResourceState('qs-smartphone-pro') == 'started' then
                    if not LocalPlayer.state.isCuffed then
                        exports['qs-smartphone-pro']:SetCanOpenPhone(true)
                    end
                end
                if GetResourceState('pma-voice') == 'started' then
                    exports['pma-voice']:resetProximityCheck()
                end
            end
        },
        ['vehicle'] = {
            anim = {dict = 'missprologuedead_guard', clip = 'dead_guard', flag = 49},
            onInit = function()
            end
        },
        ['bleeding'] = {
            enabled = true,
            movement = false,
            enableAlert = true,
            anims = {
                {dict = 'dead', clip = 'dead_a', flag = 1},
            },
            time = 300,
            animWhilePrevented = {dict = 'dead', clip = 'dead_a', flag = 1},
            preventAnimation = function()
                if LocalPlayer.state.isCarried then
                    return 'disabled'
                end
                if LocalPlayer.state.draggedBy then
                    return true
                end
                return false
            end,
            onInit = function()
                if GetResourceState('lb-phone') == 'started' then
                    exports["lb-phone"]:ToggleDisabled(true)
                end
                if GetResourceState('qs-smartphone-pro') == 'started' then
                    exports['qs-smartphone-pro']:SetCanOpenPhone(false)
                end
                local disableVoice = true
                if disableVoice and GetResourceState('pma-voice') == 'started' then
                    exports['pma-voice']:overrideProximityCheck(function()
                        return false
                    end)
                end
            end
        },
        ['death'] = {
            time = 600,
            anim = {dict = 'dead', clip = 'dead_a', flag = 1},
            dropItems = {
                enabled = false,
                type = 'chance',
                chance = 50,
                minMedics = 0,
                dropType = 'stash',
                useInsurance = false,
                whitelistItems = {
                    ['phone'] = false,
                    ['simcard'] = false,
                }
            },
            alert = function()
                if GetResourceState('emergencydispatch') == 'started' then
                    TriggerEvent('emergencydispatch:emergencycall:new', "ambulance", "Bewusteloze persoon (automatische melding)", false)
                    return
                end
                if GetResourceState('piotreq_gmt') == 'started' or GetResourceState('pp-ems-mdt') == 'started' then
                    TriggerServerEvent('p_ambulancejob/server/editable/alert')
                    return
                end
                local coords = lib.callback.await('p_ambulancejob/server/editable/getPlyCoords', false)
                if Bridge.Dispatch and Bridge.Dispatch.SendAlert then
                    Bridge.Dispatch.SendAlert({
                        job = {'ambulance'},
                        code = '112',
                        title = 'Medische Melding',
                        coords = coords,
                        time = 60,
                        priority = 'normal',
                        icon = 'fa solid fa-skull',
                        blip = {
                            sprite = 153,
                            color = 1,
                            length = 1,
                            scale = 1.1,
                            name = 'Medisch Noodgeval',
                        }
                    })
                else
                    TriggerServerEvent('p_ambulancejob/server/alerts/new', {
                        code = '112',
                        title = 'Medische Melding',
                        message = 'Ik heb hulp nodig!',
                        coords = coords,
                        expire = 60,
                        blip = {
                            sprite = 153,
                            color = 1,
                            scale = 1.1,
                            pulse = true
                        }
                    })
                end
            end,
            onInit = function()
                if GetResourceState('lb-phone') == 'started' then
                    exports["lb-phone"]:ToggleDisabled(true)
                end
                if GetResourceState('qs-smartphone-pro') == 'started' then
                    exports['qs-smartphone-pro']:SetCanOpenPhone(false)
                end
                local disableVoice = true
                if disableVoice and GetResourceState('pma-voice') == 'started' then
                    exports['pma-voice']:overrideProximityCheck(function()
                        return false
                    end)
                end
            end
        },
        ['recovering'] = {
            enabled = true,
            anim = {dict = 'missfinale_c1@', clip = 'lying_dead_player0', flag = 1},
            maxKnockoutsToDeath = 2,
            weapons = {
                [`WEAPON_UNARMED`] = { label = locale('fist'), recoveryTime = 20, healthAfterRecover = 150 },
                [`WEAPON_BAT`] = { label = locale('bat'), recoveryTime = 25, healthAfterRecover = 150 },
                [`WEAPON_FLASHLIGHT`] = { label = locale('flashlight'), recoveryTime = 20, healthAfterRecover = 150 },
                [`WEAPON_STUNGUN`] = { label = locale('stungun'), recoveryTime = 30, healthAfterRecover = 150 },
                [`WEAPON_STUNGUN_MP`] = { label = locale('stungun'), recoveryTime = 30, healthAfterRecover = 150 },
                [`WEAPON_NIGHTSTICK`] = { label = locale('nightstick'), recoveryTime = 25, healthAfterRecover = 150 },
                [`WEAPON_CANDYCANE`] = { label = locale('candycane'), recoveryTime = 25, healthAfterRecover = 150 },
                [`WEAPON_KNUCKLE`] = { label = locale('knuckle'), recoveryTime = 20, healthAfterRecover = 150 },
            },
            onInit = function()
                local disableVoice = true
                if disableVoice and GetResourceState('pma-voice') == 'started' then
                    exports['pma-voice']:overrideProximityCheck(function()
                        return false
                    end)
                end
            end
        }
    }
}

Config.Bleeding = {
    enabled = true,
    screenEffect = {
        enabled = true,
        requiredValue = 5,
    },
    walkType = false,
    loopInterval = 10000,
    maxValue = 25,
    items = {
        ['gauze'] = {
            value = 1,
            health = 5,
            duration = 3000,
            anim = {dict = 'mp_suicide', clip = 'pill', flag = 49},
        },
        ['adrenaline'] = {
            value = 5,
            health = 10,
            duration = 3000,
            anim = {dict = 'mp_suicide', clip = 'pill', flag = 49},
        },
        ['bandage'] = {
            value = 10,
            health = 20,
            duration = 5000,
            anim = {dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49},
        },
        ['cyclonamine'] = {
            value = 10,
            duration = 3000,
            anim = {dict = 'mp_suicide', clip = 'pill', flag = 49},
        },
        ['tourniquet'] = {
            value = 15,
            duration = 3000,
            anim = {dict = 'mp_suicide', clip = 'pill', flag = 49},
        }
    },
    disabledControlsWhileUsing = {move = false, combat = true, mouse = false, car = true},
    weapons = {
        [`WEAPON_KNIFE`] = 1,
        [`WEAPON_DAGGER`] = 1,
        [`WEAPON_STONE_HATCHET`] = 1,
        [`WEAPON_BATTLEAXE`] = 1,
        [`WEAPON_STUNROD`] = 1,
        [`WEAPON_MACHETE`] = 1,
        [`WEAPON_SWITCHBLADE`] = 1,
        [`WEAPON_HATCHET`] = 1,
        [`WEAPON_PISTOL`] = 2,
        [`WEAPON_VINTAGEPISTOL`] = 2,
        [`WEAPON_PISTOLXM3`] = 2,
        [`WEAPON_CERAMICPISTOL`] = 2,
        [`WEAPON_COMBATPISTOL`] = 2,
        [`WEAPON_SNSPISTOL_MK2`] = 2,
        [`WEAPON_PISTOL50`] = 2,
        [`WEAPON_SNSPISTOL`] = 2,
        [`WEAPON_PISTOL_MK2`] = 2,
        [`WEAPON_HEAVYPISTOL`] = 2,
        [`WEAPON_SMG`] = 3,
        [`WEAPON_COMBATPDW`] = 3,
        [`WEAPON_MICROSMG`] = 3,
        [`WEAPON_MINISMG`] = 3,
        [`WEAPON_RIFLE`] = 4,
        [`WEAPON_SNIPERRIFLE`] = 5,
        [`WEAPON_PUMPSHOTGUN`] = 5,
        [`WEAPON_HEAVYSHOTGUN`] = 5,
        [`WEAPON_PUMPSHOTGUN_MK2`] = 5,
        [`WEAPON_SAWNOFFSHOTGUN`] = 4,
        [`WEAPON_BULLPUPSHOTGUN`] = 4,
        [`WEAPON_ASSAULTSHOTGUN`] = 4,
    },
    onInit = function() end,
    onClear = function() end
}

Config.Crutch = {
    enabled = true,
    allowedJobs = {['ambulance'] = 0},
    disabledControls = {22, 21, 24, 25},
    prop = {
        model = 'prop_mads_crutch01',
        coords = vec3(1.18, -0.36, -0.20),
        rot = vec3(-20.0, -87.0, -20.0),
    }
}

Config.Wheelchair = {
    enabled = true,
    allowedJobs = {['ambulance'] = 0},
    model = 'iak_wheelchair',
    disableExitWhenForced = true
}

Config.DeathScreen = {
    enabled = true,
    setVisibility = function(state, data)
    end,
}

Config.Damages = {
    enabled = true,
    refreshRate = 500,
    reviveAnimation = true,
    advancedHealing = true,
    moneyIntoSociety = true,
    damagesUI = false,
    damagesUIKey = 'TAB',
    informAndFreeze = false,
    preventRegister = function(weaponHash)
        if GetResourceState('nass_paintball') == 'started' then
            if exports['nass_paintball']:inGame() then return true end
        end
        if GetResourceState('pug-paintball') == 'started' then
            if exports["pug-paintball"]:IsInPaintball() then return true end
        end
        if GetResourceState('brutal_paintball') == 'started' then
            if exports.brutal_paintball:isInPaintball() then return true end
        end
        if GetResourceState('0r-paintball-v2') == 'started' then
            if exports['0r-paintball-v2']:inGame() then return true end
        end
        if GetResourceState('qs-deathmatch') == 'started' then
            if exports['qs-deathmatch']:IsPlayerInDM() then return true end
        end
        return false
    end,
    moneyforHealing = {
        perInjury = true,
        amount = 100,
        medicPercent = 20,
    },
    effects = {
        enabled = true,
        generalEffect = true,
        chance = 10,
        bones = {
            ['head'] = {effect = 'blackOut', value = 30},
            ['leftArm'] = {effect = 'shakeAim', value = 30},
            ['rightArm'] = {effect = 'shakeAim', value = 30},
        }
    },
    modifiers = {
        [`WEAPON_UNARMED`] = 0.25,
    },
    bones = {
        ['head'] = {
            ['12844'] = true, ['31086'] = true, ['25260'] = true, ['27474'] = true, ['39317'] = true,
        },
        ['torso'] = {
            ['0'] = true, ['11816'] = true, ['24816'] = true, ['24817'] = true, ['24818'] = true
        },
        ['leftArm'] = {
            ['45509'] = true, ['61163'] = true, ['18905'] = true, ['36029'] = true, ['60309'] = true,
            ['65245'] = true, ['64729'] = true,
        },
        ['rightArm'] = {
            ['2992'] = true, ['6286'] = true, ['24806'] = true, ['28422'] = true, ['37119'] = true,
            ['40269'] = true, ['57005'] = true, ['10706'] = true,
        },
        ['leftLeg'] = {
            ['14201'] = true, ['46078'] = true, ['57717'] = true, ['58271'] = true, ['65245'] = true,
            ['63931'] = true,
        },
        ['rightLeg'] = {
            ['16335'] = true, ['24806'] = true, ['35502'] = true, ['36864'] = true, ['51826'] = true,
            ['52301'] = true,
        }
    },
    weapons = {
        [`WEAPON_UNARMED`] = {
            injuries = {
                [1] = {label = 'Blauwe Plek', color = 'grape.6', items = {['ointment'] = 1}},
                [5] = {label = 'Kleine Snijwond', color = 'red.6', items = {['disinfectant'] = 1, ['gauze'] = 1, ['bandage'] = 1}},
                [7] = {label = 'Diepe Snijwond', color = 'red.7', items = {['disinfectant'] = 1, ['suture_kit'] = 1, ['bandage'] = 1}},
                [10] = {label = 'Breuk', color = 'red.8', items = {['splint'] = 1, ['medical_kit'] = 1}},
                [20] = {label = 'Gebroken Bot', color = 'red.9', items = {['splint'] = 1, ['advanced_medical_kit'] = 2}},
            }
        },
        [`WEAPON_KNIFE`] = {
            injuries = {
                [1] = {label = 'Kleine Messnede', color = 'grape.6', items = {['disinfectant'] = 1, ['gauze'] = 1, ['bandage'] = 1}},
                [2] = {label = 'Lichte Messnede', color = 'red.6', items = {['disinfectant'] = 1, ['gauze'] = 2, ['bandage'] = 1}},
                [3] = {label = 'Diepe Messnede', color = 'red.7', items = {['disinfectant'] = 1, ['suture_kit'] = 1, ['medical_kit'] = 1, ['bandage'] = 1}},
                [4] = {label = 'Steekwond', color = 'red.8', items = {['suture_kit'] = 2, ['advanced_medical_kit'] = 1, ['bandage'] = 2}},
                [5] = {label = 'Doorgesneden Slagader', color = 'red.9', items = {['gauze'] = 2, ['blood_bag_250'] = 1, ['suture_kit'] = 1, ['advanced_medical_kit'] = 1}},
                [6] = {label = 'Kritieke Laceratie', color = 'red.9', items = {['gauze'] = 2, ['blood_bag_500'] = 1, ['suture_kit'] = 1, ['advanced_medical_kit'] = 1}},
            }
        },
        [`WEAPON_PISTOL`] = {
            injuries = {
                [1] = {label = 'Klein Kogelwond', color = 'red.5', items = {['tourniquet'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [3] = {label = 'Kogelwond', color = 'red.6', items = {['bandage'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1, ['morphine'] = 1}},
                [5] = {label = 'Groot Kogelwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['morphine'] = 2}},
                [7] = {label = 'Hevig Bloedend Wond', color = 'red.8', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1, ['morphine'] = 2}},
            }
        },
        [`WEAPON_COMBATPISTOL`] = {
            injuries = {
                [1] = {label = 'Klein Kogelwond', color = 'red.5', items = {['tourniquet'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [3] = {label = 'Kogelwond', color = 'red.6', items = {['bandage'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1, ['morphine'] = 1}},
                [5] = {label = 'Groot Kogelwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['morphine'] = 2}},
                [7] = {label = 'Hevig Bloedend Wond', color = 'red.8', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1, ['morphine'] = 2}},
            }
        },
        [`WEAPON_VINTAGEPISTOL`] = {
            injuries = {
                [1] = {label = 'Klein Kogelwond', color = 'red.5', items = {['tourniquet'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [3] = {label = 'Kogelwond', color = 'red.6', items = {['bandage'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1, ['morphine'] = 1}},
                [5] = {label = 'Groot Kogelwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['morphine'] = 2}},
                [7] = {label = 'Hevig Bloedend Wond', color = 'red.8', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1, ['morphine'] = 2}},
            }
        },
        [`WEAPON_SNSPISTOL_MK2`] = {
            injuries = {
                [1] = {label = 'Klein Kogelwond', color = 'red.5', items = {['tourniquet'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [3] = {label = 'Kogelwond', color = 'red.6', items = {['bandage'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1, ['morphine'] = 1}},
                [5] = {label = 'Groot Kogelwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['morphine'] = 2}},
                [7] = {label = 'Hevig Bloedend Wond', color = 'red.8', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1, ['morphine'] = 2}},
            }
        },
        [`WEAPON_PISTOL50`] = {
            injuries = {
                [1] = {label = 'Klein Kogelwond', color = 'red.5', items = {['tourniquet'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [3] = {label = 'Kogelwond', color = 'red.6', items = {['bandage'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1, ['morphine'] = 1}},
                [5] = {label = 'Groot Kogelwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['morphine'] = 2}},
                [7] = {label = 'Hevig Bloedend Wond', color = 'red.8', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1, ['morphine'] = 2}},
            }
        },
        [`WEAPON_SNSPISTOL`] = {
            injuries = {
                [1] = {label = 'Klein Kogelwond', color = 'red.5', items = {['tourniquet'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [3] = {label = 'Kogelwond', color = 'red.6', items = {['bandage'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1, ['morphine'] = 1}},
                [5] = {label = 'Groot Kogelwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['morphine'] = 2}},
                [7] = {label = 'Hevig Bloedend Wond', color = 'red.8', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1, ['morphine'] = 2}},
            }
        },
        [`WEAPON_PISTOL_MK2`] = {
            injuries = {
                [1] = {label = 'Klein Kogelwond', color = 'red.5', items = {['tourniquet'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [3] = {label = 'Kogelwond', color = 'red.6', items = {['bandage'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1, ['morphine'] = 1}},
                [5] = {label = 'Groot Kogelwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['morphine'] = 2}},
                [7] = {label = 'Hevig Bloedend Wond', color = 'red.8', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1, ['morphine'] = 2}},
            }
        },
        [`WEAPON_HEAVYPISTOL`] = {
            injuries = {
                [1] = {label = 'Klein Kogelwond', color = 'red.5', items = {['tourniquet'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [3] = {label = 'Kogelwond', color = 'red.6', items = {['bandage'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1, ['morphine'] = 1}},
                [5] = {label = 'Groot Kogelwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['morphine'] = 2}},
                [7] = {label = 'Hevig Bloedend Wond', color = 'red.8', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1, ['morphine'] = 2}},
            }
        },
        [`WEAPON_APPISTOL`] = {
            injuries = {
                [1] = {label = 'Klein Kogelwond', color = 'red.5', items = {['tourniquet'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [3] = {label = 'Kogelwond', color = 'red.6', items = {['bandage'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1, ['morphine'] = 1}},
                [5] = {label = 'Groot Kogelwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['morphine'] = 2}},
                [7] = {label = 'Hevig Bloedend Wond', color = 'red.8', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1, ['morphine'] = 2}},
            }
        },
        [`WEAPON_SMG`] = {
            injuries = {
                [1] = {label = 'Licht SMG Wond', color = 'red.6', items = {['tourniquet'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [5] = {label = 'SMG Wond', color = 'red.7', items = {['bandage'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [7] = {label = 'Meerdere SMG Wonden', color = 'red.8', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1}},
                [10] = {label = 'Kritiek SMG Trauma', color = 'red.9', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1}},
                [15] = {label = 'SMG Slagaderschade', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1}},
            }
        },
        [`WEAPON_COMBATPDW`] = {
            injuries = {
                [1] = {label = 'Licht SMG Wond', color = 'red.6', items = {['tourniquet'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [5] = {label = 'SMG Wond', color = 'red.7', items = {['bandage'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [7] = {label = 'Meerdere SMG Wonden', color = 'red.8', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1}},
                [10] = {label = 'Kritiek SMG Trauma', color = 'red.9', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1}},
                [15] = {label = 'SMG Slagaderschade', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1}},
            }
        },
        [`WEAPON_MICROSMG`] = {
            injuries = {
                [1] = {label = 'Licht SMG Wond', color = 'red.6', items = {['tourniquet'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [5] = {label = 'SMG Wond', color = 'red.7', items = {['bandage'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [7] = {label = 'Meerdere SMG Wonden', color = 'red.8', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1}},
                [10] = {label = 'Kritiek SMG Trauma', color = 'red.9', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1}},
                [15] = {label = 'SMG Slagaderschade', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1}},
            }
        },
        [`WEAPON_TECPISTOL`] = {
            injuries = {
                [1] = {label = 'Licht SMG Wond', color = 'red.6', items = {['tourniquet'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [5] = {label = 'SMG Wond', color = 'red.7', items = {['bandage'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [7] = {label = 'Meerdere SMG Wonden', color = 'red.8', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1}},
                [10] = {label = 'Kritiek SMG Trauma', color = 'red.9', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1}},
                [15] = {label = 'SMG Slagaderschade', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1}},
            }
        },
        [`WEAPON_MINISMG`] = {
            injuries = {
                [1] = {label = 'Licht SMG Wond', color = 'red.6', items = {['tourniquet'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [5] = {label = 'SMG Wond', color = 'red.7', items = {['bandage'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [7] = {label = 'Meerdere SMG Wonden', color = 'red.8', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1}},
                [10] = {label = 'Kritiek SMG Trauma', color = 'red.9', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1}},
                [15] = {label = 'SMG Slagaderschade', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1}},
            }
        },
        [`WEAPON_MACHINEPISTOL`] = {
            injuries = {
                [1] = {label = 'Licht SMG Wond', color = 'red.6', items = {['tourniquet'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [5] = {label = 'SMG Wond', color = 'red.7', items = {['bandage'] = 1, ['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [7] = {label = 'Meerdere SMG Wonden', color = 'red.8', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1}},
                [10] = {label = 'Kritiek SMG Trauma', color = 'red.9', items = {['suture_kit'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1}},
                [15] = {label = 'SMG Slagaderschade', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1, ['medical_kit'] = 1}},
            }
        },
        [`WEAPON_CARBINERIFLE`] = {
            injuries = {
                [1] = {label = 'Geweer Scheerwond', color = 'red.6', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [4] = {label = 'Geweer Inwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [7] = {label = 'Geweer Uitwond', color = 'red.8', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [9] = {label = 'Hoge Snelheidsimpact', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1, ['advanced_medical_kit'] = 1}},
                [12] = {label = 'Orgaanschade door Geweer', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 2, ['advanced_medical_kit'] = 1}},
            }
        },
        [`WEAPON_CARBINERIFLE_MK2`] = {
            injuries = {
                [1] = {label = 'Geweer Scheerwond', color = 'red.6', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [4] = {label = 'Geweer Inwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [7] = {label = 'Geweer Uitwond', color = 'red.8', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [9] = {label = 'Hoge Snelheidsimpact', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1, ['advanced_medical_kit'] = 1}},
                [12] = {label = 'Orgaanschade door Geweer', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 2, ['advanced_medical_kit'] = 1}},
            }
        },
        [`WEAPON_ASSAULTRIFLE`] = {
            injuries = {
                [1] = {label = 'Geweer Scheerwond', color = 'red.6', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [4] = {label = 'Geweer Inwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [7] = {label = 'Geweer Uitwond', color = 'red.8', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [9] = {label = 'Hoge Snelheidsimpact', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1, ['advanced_medical_kit'] = 1}},
                [12] = {label = 'Orgaanschade door Geweer', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 2, ['advanced_medical_kit'] = 1}},
            }
        },
        [`WEAPON_ASSAULTRIFLE_MK2`] = {
            injuries = {
                [1] = {label = 'Geweer Scheerwond', color = 'red.6', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [4] = {label = 'Geweer Inwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [7] = {label = 'Geweer Uitwond', color = 'red.8', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [9] = {label = 'Hoge Snelheidsimpact', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1, ['advanced_medical_kit'] = 1}},
                [12] = {label = 'Orgaanschade door Geweer', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 2, ['advanced_medical_kit'] = 1}},
            }
        },
        [`WEAPON_ADVANCEDRIFLE`] = {
            injuries = {
                [1] = {label = 'Geweer Scheerwond', color = 'red.6', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [4] = {label = 'Geweer Inwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [7] = {label = 'Geweer Uitwond', color = 'red.8', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [9] = {label = 'Hoge Snelheidsimpact', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1, ['advanced_medical_kit'] = 1}},
                [12] = {label = 'Orgaanschade door Geweer', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 2, ['advanced_medical_kit'] = 1}},
            }
        },
        [`WEAPON_TACTICALRIFLE`] = {
            injuries = {
                [1] = {label = 'Geweer Scheerwond', color = 'red.6', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [4] = {label = 'Geweer Inwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [7] = {label = 'Geweer Uitwond', color = 'red.8', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [9] = {label = 'Hoge Snelheidsimpact', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1, ['advanced_medical_kit'] = 1}},
                [12] = {label = 'Orgaanschade door Geweer', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 2, ['advanced_medical_kit'] = 1}},
            }
        },
        [`WEAPON_SHOTGUN`] = {
            injuries = {
                [1] = {label = 'Hagelkorrel Wond', color = 'red.6', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [2] = {label = 'Hagel Spreidwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [4] = {label = 'Hagelgeweer Blast Trauma', color = 'red.8', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [6] = {label = 'Dichtbij Verwoesting', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1, ['advanced_medical_kit'] = 1}},
                [8] = {label = 'Kritiek Hagelgeweer Trauma', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 2, ['advanced_medical_kit'] = 1}},
            }
        },
        [`WEAPON_PUMPSHOTGUN`] = {
            injuries = {
                [1] = {label = 'Hagelkorrel Wond', color = 'red.6', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [2] = {label = 'Hagel Spreidwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [4] = {label = 'Hagelgeweer Blast Trauma', color = 'red.8', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [6] = {label = 'Dichtbij Verwoesting', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1, ['advanced_medical_kit'] = 1}},
                [8] = {label = 'Kritiek Hagelgeweer Trauma', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 2, ['advanced_medical_kit'] = 1}},
            }
        },
        [`WEAPON_HEAVYSHOTGUN`] = {
            injuries = {
                [1] = {label = 'Hagelkorrel Wond', color = 'red.6', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1}},
                [2] = {label = 'Hagel Spreidwond', color = 'red.7', items = {['suture_kit'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [4] = {label = 'Hagelgeweer Blast Trauma', color = 'red.8', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_250'] = 1, ['medical_kit'] = 1}},
                [6] = {label = 'Dichtbij Verwoesting', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1, ['advanced_medical_kit'] = 1}},
                [8] = {label = 'Kritiek Hagelgeweer Trauma', color = 'red.9', items = {['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 2, ['advanced_medical_kit'] = 1}},
            }
        },
        [`WEAPON_SNIPERRIFLE`] = {
            injuries = {
                [1] = {label = 'Sluipschutter Scheerwond', color = 'red.7', items = {['bandage'] = 2, ['advanced_medical_kit'] = 1}},
                [2] = {label = 'Zwaar Kaliber Inslag', color = 'red.8', items = {['bandage'] = 3, ['suture_kit'] = 1, ['morphine'] = 1, ['blood_bag_250'] = 1}},
                [3] = {label = 'Pantserborend Wond', color = 'red.9', items = {['bandage'] = 4, ['suture_kit'] = 1, ['cyclonamine'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1}},
                [4] = {label = 'Verwoestend Inslag', color = 'red.9', items = {['bandage'] = 4, ['suture_kit'] = 2, ['cyclonamine'] = 1, ['adrenaline'] = 1, ['blood_bag_500'] = 1}},
                [5] = {label = 'Kritiek Sluipschutter Trauma', color = 'red.9', items = {['bandage'] = 4, ['suture_kit'] = 1, ['cyclonamine'] = 1, ['morphine'] = 1, ['blood_bag_500'] = 1}},
            }
        },
        [`WEAPON_MACHETE`] = {
            injuries = {
                [1] = {label = 'Kapmes Snede', color = 'red.6', items = {['bandage'] = 2, ['disinfectant'] = 1}},
                [3] = {label = 'Diepe Kapmes Snede', color = 'red.7', items = {['bandage'] = 2, ['disinfectant'] = 1, ['suture_kit'] = 1}},
                [5] = {label = 'Doorgesneden Spier', color = 'red.8', items = {['bandage'] = 2, ['suture_kit'] = 1, ['tourniquet'] = 1}},
            }
        },
        [`WEAPON_CROWBAR`] = {
            injuries = {
                [1] = {label = 'Koevoet Blauwe Plek', color = 'grape.6', items = {['bandage'] = 1, ['ointment'] = 1, ['icepack'] = 1}},
                [2] = {label = 'Koevoet Laceratie', color = 'red.6', items = {['bandage'] = 2, ['disinfectant'] = 1}},
                [4] = {label = 'Botbreuk', color = 'red.8', items = {['bandage'] = 3, ['advanced_medical_kit'] = 2}},
                [6] = {label = 'Samengestelde Breuk', color = 'red.9', items = {['bandage'] = 3, ['advanced_medical_kit'] = 2, ['morphine'] = 1, ['adrenaline'] = 1}},
                [8] = {label = 'Ernstig Hoofdtrauma', color = 'red.9', items = {['bandage'] = 3, ['advanced_medical_kit'] = 1, ['morphine'] = 2, ['suture_kit'] = 1}},
            }
        },
        [`WEAPON_WRENCH`] = {
            injuries = {
                [1] = {label = 'Moersleutel Blauwe Plek', color = 'grape.6', items = {['bandage'] = 1, ['ointment'] = 1, ['icepack'] = 1}},
                [2] = {label = 'Moersleutel Laceratie', color = 'red.6', items = {['bandage'] = 2, ['disinfectant'] = 1}},
                [4] = {label = 'Botbreuk', color = 'red.8', items = {['bandage'] = 3, ['advanced_medical_kit'] = 2}},
                [6] = {label = 'Samengestelde Breuk', color = 'red.9', items = {['bandage'] = 3, ['advanced_medical_kit'] = 2, ['morphine'] = 1, ['adrenaline'] = 1}},
                [8] = {label = 'Ernstig Hoofdtrauma', color = 'red.9', items = {['bandage'] = 3, ['advanced_medical_kit'] = 1, ['morphine'] = 2, ['suture_kit'] = 1}},
            }
        },
        [`WEAPON_HAMMER`] = {
            injuries = {
                [1] = {label = 'Hamer Blauwe Plek', color = 'grape.6', items = {['bandage'] = 1, ['icepack'] = 1}},
                [2] = {label = 'Hamer Laceratie', color = 'red.6', items = {['bandage'] = 2}},
                [3] = {label = 'Verbrijzeld Bot', color = 'red.8', items = {['bandage'] = 3, ['advanced_medical_kit'] = 1, ['splint'] = 1}},
                [4] = {label = 'Gebroken Bot', color = 'red.9', items = {['bandage'] = 4, ['advanced_medical_kit'] = 1, ['suture_kit'] = 1}},
                [5] = {label = 'Vergruisd Trauma', color = 'red.9', items = {['bandage'] = 4, ['advanced_medical_kit'] = 1, ['blood_bag_250'] = 1, ['suture_kit'] = 2}},
            }
        },
        [`WEAPON_DAGGER`] = {
            injuries = {
                [1] = {label = 'Kleine Dolksnede', color = 'grape.6', items = {['disinfectant'] = 1, ['gauze'] = 1, ['bandage'] = 1}},
                [2] = {label = 'Lichte Dolksnede', color = 'red.6', items = {['disinfectant'] = 1, ['gauze'] = 2, ['bandage'] = 1}},
                [3] = {label = 'Diepe Dolksnede', color = 'red.7', items = {['disinfectant'] = 1, ['suture_kit'] = 1, ['medical_kit'] = 1, ['bandage'] = 1}},
                [4] = {label = 'Steekwond', color = 'red.8', items = {['suture_kit'] = 2, ['advanced_medical_kit'] = 1, ['bandage'] = 2}},
                [5] = {label = 'Doorgesneden Slagader', color = 'red.9', items = {['gauze'] = 2, ['blood_bag_250'] = 1, ['suture_kit'] = 1, ['advanced_medical_kit'] = 1}},
                [6] = {label = 'Kritieke Laceratie', color = 'red.9', items = {['gauze'] = 2, ['blood_bag_500'] = 1, ['suture_kit'] = 1, ['advanced_medical_kit'] = 1}},
            }
        },
        [`WEAPON_BATTLEAXE`] = {
            injuries = {
                [1] = {label = 'Bijl Blauwe Plek', color = 'grape.6', items = {['bandage'] = 1, ['ointment'] = 1, ['icepack'] = 1}},
                [2] = {label = 'Bijl Laceratie', color = 'red.6', items = {['bandage'] = 2, ['disinfectant'] = 1}},
                [4] = {label = 'Botbreuk', color = 'red.8', items = {['bandage'] = 3, ['advanced_medical_kit'] = 2}},
                [6] = {label = 'Samengestelde Breuk', color = 'red.9', items = {['bandage'] = 3, ['advanced_medical_kit'] = 2, ['morphine'] = 1, ['adrenaline'] = 1}},
                [8] = {label = 'Ernstig Hoofdtrauma', color = 'red.9', items = {['bandage'] = 3, ['advanced_medical_kit'] = 1, ['morphine'] = 2, ['suture_kit'] = 1}},
            }
        },
        [`WEAPON_BAT`] = {
            injuries = {
                [1] = {label = 'Knuppel Blauwe Plek', color = 'grape.6', items = {['bandage'] = 1, ['icepack'] = 1}},
                [2] = {label = 'Knuppel Bult', color = 'red.6', items = {['bandage'] = 2, ['icepack'] = 1}},
                [3] = {label = 'Ribbreuk', color = 'red.7', items = {['bandage'] = 3, ['advanced_medical_kit'] = 1}},
                [4] = {label = 'Meerdere Breuken', color = 'red.8', items = {['bandage'] = 4, ['advanced_medical_kit'] = 2, ['splint'] = 1}},
                [5] = {label = 'Ernstig Stomp Trauma', color = 'red.9', items = {['bandage'] = 5, ['advanced_medical_kit'] = 3, ['blood_bag_250'] = 1}},
            }
        },
        [`WEAPON_EXPLOSION`] = {
            injuries = {
                [1] = {label = 'Explosie Blauwe Plek', color = 'red.6', items = {['bandage'] = 2, ['ointment'] = 1}},
                [2] = {label = 'Scherfwond', color = 'red.7', items = {['bandage'] = 3, ['suture_kit'] = 1, ['ointment'] = 1}},
                [3] = {label = 'Explosie Brandwonden', color = 'red.8', items = {['bandage'] = 3, ['advanced_medical_kit'] = 1, ['ointment'] = 2}},
                [4] = {label = 'Meerdere Scherven', color = 'red.9', items = {['bandage'] = 3, ['suture_kit'] = 2, ['blood_bag_250'] = 1}},
                [5] = {label = 'Catastrofaal Explosiewond', color = 'red.9', items = {['ointment'] = 3, ['suture_kit'] = 1, ['bandage'] = 1, ['gauze'] = 1}},
            }
        },
        [`WEAPON_FIRE`] = {
            injuries = {
                [1] = {label = 'Lichte Brandwond', color = 'orange.6', items = {['ointment'] = 1}},
                [2] = {label = 'Eerste Graad Brandwond', color = 'orange.7', items = {['bandage'] = 1, ['ointment'] = 2}},
                [3] = {label = 'Tweede Graad Brandwond', color = 'red.7', items = {['bandage'] = 2, ['advanced_medical_kit'] = 1, ['ointment'] = 3}},
                [4] = {label = 'Derde Graad Brandwond', color = 'red.9', items = {['bandage'] = 3, ['advanced_medical_kit'] = 2, ['ointment'] = 4, ['morphine'] = 1}},
                [5] = {label = 'Ernstige Brandwonden', color = 'red.9', items = {['bandage'] = 3, ['advanced_medical_kit'] = 3, ['ointment'] = 5, ['suture_kit'] = 1, ['morphine'] = 2}},
            }
        },
        [`WEAPON_FALL`] = {
            injuries = {
                [1] = {label = 'Schaafwond', color = 'grape.6', items = {['bandage'] = 1, ['disinfectant'] = 1}},
                [2] = {label = 'Verstuikte Enkel', color = 'red.6', items = {['bandage'] = 2, ['icepack'] = 1}},
                [3] = {label = 'Gebroken Arm', color = 'red.7', items = {['bandage'] = 3, ['advanced_medical_kit'] = 1, ['splint'] = 1}},
                [4] = {label = 'Meerdere Breuken', color = 'red.8', items = {['bandage'] = 3, ['advanced_medical_kit'] = 2, ['splint'] = 2}},
                [5] = {label = 'Ruggengraatletsel', color = 'red.9', items = {['bandage'] = 3, ['advanced_medical_kit'] = 1, ['blood_bag_500'] = 1, ['suture_kit'] = 2, ['morphine'] = 2}},
            }
        },
        [-1553120962] = {
            injuries = {
                [1] = {label = 'Schaafwond door Wegdek', color = 'red.6', items = {['bandage'] = 2, ['disinfectant'] = 1}},
                [2] = {label = 'Impact Kneuzingen', color = 'red.7', items = {['bandage'] = 3, ['icepack'] = 2}},
                [3] = {label = 'Gebroken Ribben', color = 'red.8', items = {['bandage'] = 1, ['advanced_medical_kit'] = 2, ['splint'] = 1}},
                [4] = {label = 'Interne Bloeding', color = 'red.9', items = {['morphine'] = 2, ['blood_bag_250'] = 1, ['suture_kit'] = 1}},
                [5] = {label = 'Massief Trauma', color = 'red.9', items = {['morphine'] = 2, ['blood_bag_500'] = 1, ['suture_kit'] = 1}},
            }
        },
    }
}

Config.Pulse = {
    enabled = true,
    minPulse = 70,
    maxPulse = 200,
    critical = {
        enabled = true,
        chance = 10,
        requiredInjuries = 5,
        pulse = {35, 50},
    }
}

Config.Temperature = {
    enabled = true,
    minTemperature = 36,
    maxTemperature = 38,
    items = {
        ['icepack'] = -0.5,
        ['antipyretics'] = 0.5,
    },
    critical = {
        enabled = true,
        chance = 10,
        requiredInjuries = 10,
        temperature = {32, 41},
    }
}

Config.Defibrilator = {
    enabled = true,
    allowedJobs = {'ambulance'},
    propModel = 'lifepak15',
    onUse = function(targetId)
        if Bridge.Progress.StartCircle({
            duration = 5000,
            label = locale('preparing_defibrilator'),
            position = 'bottom',
            canCancel = false
        }) then
            local result = lib.skillCheck({'easy', 'medium', 'hard'})
            return result
        end
    end
}

Config.BodyBag = {
    enabled = true,
    respawnPlayer = true,
    dropItems = false,
    prop = {
        model = 'xm_prop_body_bag',
        coords = vec3(-0.4, -0.13, -0.14),
        rot = vec3(-94.32, 93.43, 114.67)
    }
}

Config.Stretcher = {
    enabled = true,
    useDetachTarget = false,
    anims = {
        carry = { dict = 'anim@heists@box_carry@', clip = 'idle', flag = 49 },
        lay = { dict = 'anim@gangops@morgue@table@', clip = 'body_search', flag = 1 }
    },
    prop = {
        model = 'strykergurney',
        foldModel = 'loweredstrykergurney',
        coords = vec3(1.58, -0.08, -0.17),
        rot = vec3(81.91, 10.4, -143.3),
        bone = 18905
    },
    vehicleModels = {
        [`ambulance`] = {
            coords = vec3(0.0, -3.25, -0.25),
            rot = vec3(0.0, 0.0, 0.0)
        },
        [`maverick`] = {
            coords = vec3(0.0, -0.15, -0.45),
            rot = vec3(0.0, 0.0, 0.0)
        }
    },
}

Config.Radial = {
    enabled = false,
    requireDuty = true,
    items = {
        {
            id = 'emsTablet',
            icon = 'tablet',
            label = locale('tablet'),
            onSelect = function()
                if GetResourceState('piotreq_gmt') == 'started' then
                    TriggerEvent('piotreq_gmt:OpenGMT')
                elseif GetResourceState('tk_mdt') == 'started' then
                    exports['tk_mdt']:openUI('ambulance')
                elseif GetResourceState('lb-tablet') == 'started' then
                    TriggerEvent('tablet:toggleOpen')
                elseif GetResourceState('kartik-mdt') == 'started' then
                    exports['kartik-mdt']:openMDT()
                elseif GetResourceState('qf_mdt') == 'started' then
                    exports['qf_mdt']:OpenMDT()
                else
                    lib.print.error('Je gebruikt geen ondersteunde MDT! Voeg toe in config.lua')
                end
            end
        },
        {
            id = 'emsDispatch',
            icon = 'tablet',
            label = locale('dispatch'),
            onSelect = function()
                if GetResourceState('piotreq_gmt') == 'started' then
                    exports['piotreq_gmt']:OpenDispatch()
                    return
                end
                if Bridge.Dispatch and Bridge.Dispatch.Open then
                    Bridge.Dispatch.Open()
                else
                    Alerts:open()
                end
            end
        },
    }
}

Config.Radio = {
    enabled = true,
    channels = {
        {label = '#1 Ambulance', channel = 1, jobs = {'ambulance'}},
        {label = '#2 Ambulance', channel = 2, jobs = {'ambulance'}},
        {label = '#3 Ambulance', channel = 3, jobs = {'ambulance'}},
        {label = '#4 Ambulance', channel = 4, jobs = {'ambulance'}},
        {label = '#5 Ambulance', channel = 5, jobs = {'ambulance'}}
    }
}

Config.Interactions = {
    enabled = true,
    playerBlood = {
        enabled = true,
        healthToRemove = 20,
        cooldownPerPlayer = 10,
        doubleCooldown = true
    },
    options = {
        ['openHealingMenu'] = {
            type = 'player',
            label = locale('heal_player'),
            icon = 'fas fa-suitcase-medical',
            distance = 2.0,
            jobs = {'ambulance'},
            onSelect = function(data)
                local entity = type(data) == 'number' and data or data.entity
                local targetId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                Damages:menu(targetId)
            end,
            canInteract = function(entity)
                return Death.deathType == "none"
            end
        },
        ['checkPlayerInsurance'] = {
            type = 'player',
            label = locale('check_insurance'),
            icon = 'fas fa-file-medical',
            distance = 2.0,
            jobs = {'ambulance'},
            onSelect = function(data)
                if Bridge.Progress.Start({
                    duration = 10000,
                    label = locale('checking_insurance'),
                    canCancel = true,
                    anim = {dict = 'amb@code_human_in_bus_passenger_idles@female@tablet@idle_a', clip = 'idle_a', flag = 49},
                    prop = {model = 'prop_cs_tablet', pos = vec3(0.0, 0.0, -0.02), rot = vec3(0.0, 0.0, 0.0)}
                }) then
                    local entity = type(data) == 'number' and data or data.entity
                    local targetId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                    TriggerServerEvent('p_ambulancejob/server/insurance/check', targetId)
                end
            end,
            canInteract = function(entity)
                return Death.deathType == "none"
            end
        },
        ['putPlayerInVehicle'] = {
            type = 'player',
            label = locale('put_in_vehicle'),
            icon = 'fas fa-car',
            distance = 2.0,
            jobs = {'ambulance'},
            onSelect = function(data, seat)
                local entity = type(data) == 'number' and data or data.entity
                local targetId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                TriggerServerEvent('p_ambulancejob/server/interactions/putInPlayer', {seat = seat, player = targetId})
            end,
            canInteract = function(entity, seat)
                if GetResourceState('p_policejob') == 'started' then
                    return false
                end
                if Death.deathType ~= "none" then
                    return false
                end
                local vehicle, coords = lib.getClosestVehicle(GetEntityCoords(cache.ped), 4.0, false)
                if not vehicle or vehicle == 0 or not IsVehicleSeatFree(vehicle, seat) or not NetworkGetEntityIsNetworked(vehicle) then
                    return false
                end
                local targetId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                return Player(targetId).state.isDead
            end,
        },
        ['takeOutPlayerVehicle'] = {
            type = 'vehicle',
            label = locale('take_out_vehicle'),
            icon = 'fas fa-car',
            distance = 3.0,
            jobs = {'ambulance'},
            onSelect = function(data, seat)
                local entity = type(data) == 'number' and data or data.entity
                local targetId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(entity, seat)))
                TriggerServerEvent('p_ambulancejob/server/interactions/takeOutPlayer', {seat = seat, player = targetId})
            end,
            canInteract = function(entity, seat)
                if GetResourceState('p_policejob') == 'started' then
                    return false
                end
                local seatPed = GetPedInVehicleSeat(entity, seat)
                if not seatPed or seatPed == 0 or not IsPedAPlayer(seatPed) then
                    return false
                end
                local targetId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(seatPed))
                return Death.deathType == "none" and Player(targetId).state.isDead
            end
        },
        ['takePlayerBlood'] = {
            type = 'player',
            label = locale('collect_player_blood'),
            icon = 'fas fa-eye-dropper',
            distance = 3.0,
            jobs = {'ambulance'},
            onSelect = function(data)
                local entity = type(data) == 'number' and data or data.entity
                local targetId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                local function takePlayerBlood(amount)
                    if Bridge.Progress.Start({
                        duration = amount == 250 and 5000 or 10000,
                        label = locale('collecting_blood'),
                        canCancel = true,
                        anim = {dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', clip = 'machinic_loop_mechandplayer', flag = 49},
                        prop = {model = 'prop_syringe_01', pos = vec3(0.04, 0.04, 0.0), rot = vec3(125.44, 0.0, 0.0), bone = 6286}
                    }) then
                        TriggerServerEvent('p_ambulancejob/server/interactions/takeBlood', targetId, amount)
                    end
                end
                lib.registerContext({
                    id = 'take_player_blood_menu',
                    title = locale('take_player_blood_menu'),
                    options = {
                        {
                            title = locale('take_250ml_blood'),
                            description = locale('take_250ml_blood_desc'),
                            icon = 'fas fa-eye-dropper',
                            onSelect = function() takePlayerBlood(250) end
                        },
                        {
                            title = locale('take_500ml_blood'),
                            description = locale('take_500ml_blood_desc'),
                            icon = 'fas fa-eye-dropper',
                            onSelect = function() takePlayerBlood(500) end
                        },
                    }
                })
                lib.showContext('take_player_blood_menu')
            end,
            canInteract = function(entity)
                if not Config.Interactions.playerBlood.enabled then return false end
                local targetId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                return Death.deathType == "none" and not Player(targetId).state.isDead
            end,
        },
        ['carryPlayer'] = {
            type = 'player',
            label = locale('carry_player'),
            icon = 'fas fa-hands-helping',
            distance = 2.0,
            onSelect = function(data)
                local entity = type(data) == 'number' and data or data.entity
                local targetId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                TriggerServerEvent('p_ambulancejob/server/interactions/carryPlayer', targetId)
            end,
            canInteract = function(entity)
                if GetResourceState('p_policejob') == 'started' then
                    return false
                end
                return Death.deathType == "none"
            end,
            needConfirm = true,
            animData = {
                carried = {
                    dict = 'nm',
                    clip = 'firemans_carry',
                    flag = 33,
                    offset = {
                        coords = vector3(0.25, -0.05, 0.63),
                        rotation = vector3(0.25, 0.0, 180.0)
                    }
                },
                carrying = {
                    dict = 'missfinale_c2mcs_1',
                    clip = 'fin_c2_mcs_1_camman',
                    flag = 49
                }
            }
        }
    }
}

Config.GPS = {
    requiredItem = false,
    allowedJobs = {'ambulance'},
    showHeading = true,
    types = {
        ['walk'] = {sprite = 1, color = 1, sirenColor = 63, scale = 1.1},
        ['car'] = {sprite = 56, color = 1, sirenColor = 63, scale = 1.1},
        ['boat'] = {sprite = 755, color = 1, sirenColor = 63, scale = 1.1},
        ['heli'] = {sprite = 43, color = 1, sirenColor = 63, scale = 1.1},
        ['plane'] = {sprite = 758, color = 1, sirenColor = 63, scale = 1.1}
    }
}

Config.Elevators = {
    enabled = false,
    points = {}
}

Config.Beds = {
    enabled = true,
    coords = {
        {
            target = vec3(312.42, -598.66, 42.79),
            offset = vec4(312.21, -598.91, 43.79, 167.00),
        }
    },
    models = {
        [`wx_hospital_bed`] = {
            offset = vec3(-0.2, 0.0, 1.825),
            rot = vec3(0.0, 0.0, 180.0),
            detach = vec3(0.0, -1.65, 0.0)
        },
        [`fm_hsp_med_bed_02`] = {
            offset = vec3(0.0, 0.0, 1.25),
            rot = vec3(0.0, 0.0, 270.0)
        },
        [`fm_hsp_med_bed_01`] = {
            offset = vec3(0.0, 0.0, 1.25),
            rot = vec3(0.0, 0.0, 90.0)
        },
        [`v_med_bed1`] = {
            offset = vec3(-0.2, 0.0, 1.35),
            rot = vec3(0.0, 0.0, 180.0),
            detach = vec3(0.0, -1.65, 0.0)
        },
        [`5d_pillbox_letto1`] = {
            offset = vec3(-0.2, 0.0, 1.35),
            rot = vec3(0.0, 0.0, 180.0),
            detach = vec3(0.0, -1.65, 0.0)
        },
        [`aldore_hospital_med_bed`] = {
            offset = vec3(-0.2, 0.0, 1.35),
            rot = vec3(0.0, 0.0, 90.0),
            detach = vec3(0.0, -1.65, 0.0)
        }
    },
    anims = {
        {dict = 'missfinale_c1@', clip = 'lying_dead_player0', flag = 1}
    }
}

Config.Outfits = {
    enabled = true,
    access = {
        ['ambulance'] = 0
    }
}

Config.Sounds = {
    enabled = true,
    presets = {
        ['damage'] = {
            volume = 0.1,
            sounds = {'fracture1.wav', 'fracture2.wav'}
        },
        ['heal'] = {
            volume = 0.15,
            sounds = {'inject.wav'}
        },
        ['bleeding'] = {
            volume = 0.15,
            sounds = {'slowheartbeat.wav'}
        },
    }
}

Config.BloodTypes = {
    enabled = true,
    overwriteQB = false,
    types = {'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'},
}