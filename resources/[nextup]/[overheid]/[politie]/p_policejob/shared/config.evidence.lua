Config.Evidence = {}

Config.Evidence.Enabled = false -- toggle evidence system

Config.Evidence.Interact = '3d_text' -- target / 3d_text
Config.Evidence.TargetExpire = 120 -- [if u are using target] how long evidences will be visible after player hide flashlight

-- finger print scanner
Config.Evidence.Scanner = {
    useRequest = true, -- if true, it will send request to player to scan his fingerprint
    useMugshot = true, -- if true, it will use mugshot from player [required MugShotBase64 from github]
}

-- return true if you want to prevent evidence spawn
Config.Evidence.preventEvidence = function()
    if GetResourceState('pug-paintball') == 'started' then
        return exports["pug-paintball"]:IsInPaintball()
    end

    return false
end

Config.Evidence.Evidences = {
    ['gunpowder'] = {
        checkGloves = true, -- check if player has gloves on
        expire = 10 -- 10 minutes [from player hands]
    },
    ['projectile'] = {
        color = {255, 0, 0, 200}, -- RGBA
        range = 20, -- from what distance the evidence will be visible
        length = 3.5, -- line length
        expire = 60, -- 60 minutes
    },
    ['bullet'] = {
        color = {200, 100, 0, 100}, -- RGBA
        range = 20, -- from what distance the evidence will be visible
        prop = 'e_ch_a', -- yellow
        expire = 60, -- 60 minutes
    },
    ['blood'] = {
        color = {255, 0, 0, 200}, -- RGBA
        range = 20, -- from what distance the evidence will be visible
        prop = 'e_ch_b', -- red
        cooldown = 10, -- cooldown in seconds
        chance = 100, -- chance to spawn blood evidence after getting hit
        expire = 60, -- 60 minutes
    },
    ['fingerprint'] = { -- use export from our docs to add this evidence
        color = {0, 0, 255, 200}, -- RGBA
        range = 20, -- from what distance the evidence will be visible
        expire = 60, -- 60 minutes
    },
    ['vehicle_fingerprint'] = {
        chance = 100,
        expire = 60, -- 60 minutes
    },
    ['weed_sample'] = {
        color = {10, 200, 10, 200}, -- RGBA
        range = 20, -- from what distance the evidence will be visible
        prop = 'sf_prop_sf_bag_weed_open_01c', -- red
        expire = 60, -- 60 minutes
    },
}

Config.Evidence.Laboratories = {
    ['MissionRow'] = {
        coords = vector3(467.09, -1001.62, 34.45),
        process = {
            ['blood'] = 10,
            ['bullet'] = 10,
            ['fingerprint'] = 10,
            ['footprint'] = 10,
            ['weed_sample'] = 10,
        }
    }
}

Config.Evidence.Registry = {
    ['MissionRow'] = {
        coords = vector3(471.57, -1002.95, 34.3), -- coords for registry
    }
}

Config.Evidence.currentProps = {} -- table to store current props for evidences [dont touch it!!!!!!!!]

Config.Evidence.CustomFunctions = {
    ['weed_sample'] = function(data) -- 'weed_sample' is item name which will be added after collecting it
        if Config.Evidence.Evidences[data.type]?.prop and not Config.Evidence.currentProps[data.id] then
            Config.Evidence.currentProps[data.id] = true
            local paperModel = lib.requestModel(Config.Evidence.Evidences[data.type].prop)
            local tempObj = CreateObject(paperModel, data.coords, false, false, false)
            SetEntityRotation(tempObj, 90.0, 90.0, 90.0, 2, true)
            FreezeEntityPosition(tempObj, true)
            PlaceObjectOnGroundProperly(tempObj)
            SetEntityAlpha(tempObj, 220)
            SetEntityAsMissionEntity(tempObj, true, true)
            SetModelAsNoLongerNeeded(paperModel)
            Config.Evidence.currentProps[data.id] = tempObj
            if Config.Evidence.Interact == 'target' then
                Target.addLocalEntity(Config.Evidence.currentProps[data.id], 
                {
                    {
                        name = 'p_policejob/take_evidence_weed_sample',
                        label = locale('pickup_evidence'),
                        icon ='fa-solid fa-weed',
                        distance = 2.0,
                        onSelect = function()
                            local isPolice = Config.Jobs[Core.GetPlayerJob()?.name] ~= nil
                            local animDict = lib.requestAnimDict(isPolice and 'anim@scripted@freemode@postertag@collect_can@male@' or 'switch@franklin@cleaning_car')
                            TaskPlayAnim(cache.ped, animDict, isPolice and 'poster_tag_collect_can_var02_male' or '001946_01_gc_fras_v2_ig_5_base', 8.0, -8.0, 3500, 1, 0)
                            PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                            TriggerServerEvent('p_policejob/server_evidence/takeEvidence', data)
                            local evidenceId = data.id
                            DeleteObject(Config.Evidence.currentProps[evidenceId])
                            Config.Evidence.currentProps[evidenceId] = nil
                            RemoveAnimDict(animDict)
                        end,
                        canInteract = function()
                            local playerJob = Core.GetPlayerJob()
                            if Config.Jobs[playerJob.name] then
                                return true
                            end

                            return false
                        end
                    },
                    {
                        name = 'p_policejob/clean_evidence_weed_sample',
                        label = locale('clean_evidence'),
                        icon ='fa-solid fa-weed',
                        distance = 2.0,
                        onSelect = function()
                            local isPolice = Config.Jobs[Core.GetPlayerJob()?.name] ~= nil
                            local animDict = lib.requestAnimDict(isPolice and 'anim@scripted@freemode@postertag@collect_can@male@' or 'switch@franklin@cleaning_car')
                            TaskPlayAnim(cache.ped, animDict, isPolice and 'poster_tag_collect_can_var02_male' or '001946_01_gc_fras_v2_ig_5_base', 8.0, -8.0, 3500, 1, 0)
                            PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                            TriggerServerEvent('p_policejob/server_evidence/takeEvidence', data)
                            local evidenceId = data.id
                            DeleteObject(Config.Evidence.currentProps[evidenceId])
                            -- closestEvidence = {}
                            Config.Evidence.currentProps[evidenceId] = nil
                            RemoveAnimDict(animDict)
                        end,
                        canInteract = function()
                            local playerJob = Core.GetPlayerJob()
                            if Config.Jobs[playerJob.name] then
                                return false
                            end

                            return true
                        end
                    },
                })
            end
        end

        local color = Config.Evidence.Evidences['weed_sample']?.color or {10, 200, 10, 200}
        DrawMarker(
            27, data.coords, 
            0.0, 0.0, 0.0, 
            0.0, 0.0, 0.0, 
            0.25, 0.25, 0.25, 
            color[1], color[2], color[3], color[4], 
            false, false
        )
    end
}

local noGlovesData = { -- numbers with no gloves
    [-1] = true, [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true,
    [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true,
    [12] = true, [13] = true, [14] = true, [15] = true, [16] = true,
    [113] = true, [114] = true, [115] = true, [199] = true,
}

Config.Evidence.checkPlayerGloves = function()
    local playerGloves = GetPedDrawableVariation(cache.ped, 3) -- 0 is the index for gloves
    if noGlovesData[playerGloves] then
        return false -- No gloves equipped
    end

    return true -- Gloves are equipped
end

Config.Evidence.Weapons = {
    [joaat('WEAPON_PISTOL')] = {
        name = locale('pistol'),
        ammo = locale('ammo_pistol'),
    },
    [joaat('WEAPON_COMBATPISTOL')] = {
        name = locale('combat_pistol'),
        ammo = locale('ammo_pistol'),
    },
    [joaat('WEAPON_APPISTOL')] = {
        name = locale('ap_pistol'),
        ammo = locale('ammo_pistol'),
    },
    [joaat('WEAPON_MICROSMG')] = {
        name = locale('micro_smg'),
        ammo = locale('ammo_smg'),
    },
    [joaat('WEAPON_SMG')] = {
        name = locale('smg'),
        ammo = locale('ammo_smg'),
    },
    [joaat('WEAPON_ASSAULTRIFLE')] = {
        name = locale('assault_rifle'),
        ammo = locale('ammo_rifle'),
    },
    [joaat('WEAPON_CARBINERIFLE')] = {
        name = locale('carbine_rifle'),
        ammo = locale('ammo_rifle'),
    },
    [joaat('WEAPON_PUMPSHOTGUN')] = {
        name = locale('pump_shotgun'),
        ammo = locale('ammo_shotgun'),
    },
    [joaat('WEAPON_SAWNOFFSHOTGUN')] = {
        name = locale('sawn_off_shotgun'),
        ammo = locale('ammo_shotgun'),
    },
    [joaat('WEAPON_SNIPERRIFLE')] = {
        name = locale('sniper_rifle'),
        ammo = locale('ammo_sniper'),
    },
    [joaat('WEAPON_HEAVYSNIPER')] = {
        name = locale('heavy_sniper'),
        ammo = locale('ammo_sniper'),
    },
    [joaat('WEAPON_BATTLERIFLE')] = {
        name = 'Battle Rifle',
        ammo = 'Rifle Ammo',
    },
    [joaat('WEAPON_ADVANCEDRIFLE')] = {
        name = 'Advanced Rifle',
        ammo = 'Rifle Ammo',
    },
    [joaat('WEAPON_ASSAULTRIFLE_MK2')] = {
        name = 'Assault Rifle MK2',
        ammo = 'Rifle Ammo',
    },
    [joaat('WEAPON_ASSAULTSHOTGUN')] = {
        name = 'Assault Shotgun',
        ammo = 'Shotgun Ammo',
    },
    [joaat('WEAPON_ASSAULTSMG')] = {
        name = 'Assault SMG',
        ammo = 'Rifle Ammo',
    },
    [joaat('WEAPON_BULLPUPRIFLE')] = {
        name = 'Bullpup Rifle',
        ammo = 'Rifle Ammo',
    },
    [joaat('WEAPON_BULLPUPRIFLE_MK2')] = {
        name = 'Bullpup Rifle MK2',
        ammo = 'Rifle Ammo',
    },
    [joaat('WEAPON_CARBINERIFLE_MK2')] = {
        name = 'Carbine Rifle MK2',
        ammo = 'Rifle Ammo',
    },
    [joaat('WEAPON_CERAMICPISTOL')] = {
        name = 'Ceramic Pistol',
        ammo = '.9mm Ammo',
    },
    [joaat('WEAPON_PISTOLXM3')] = {
        name = 'WM 29 Pistol',
        ammo = '.9mm Ammo',
    },
    [joaat('WEAPON_COMBATMG')] = {
        name = 'Combat MG',
        ammo = 'Rifle Ammo',
    },
    [joaat('WEAPON_COMBATMG_MK2')] = {
        name = 'Combat MG MK2',
        ammo = 'Rifle Ammo',
    },
    [joaat('WEAPON_COMBATPDW')] = {
        name = 'Combat PDW',
        ammo = '.9mm Ammo',
    },
    [joaat('WEAPON_COMBATSHOTGUN')] = {
        name = 'Combat Shotgun',
        ammo = 'Shotgun Ammo',
    },
    [joaat('WEAPON_COMPACTRIFLE')] = {
        name = 'Compact Rifle',
        ammo = 'Rifle Ammo',
    },
    [joaat('WEAPON_DBSHOTGUN')] = {
        name = 'Double Barrel Shotgun',
        ammo = 'Shotgun Ammo',
    },
    [joaat('WEAPON_DOUBLEACTION')] = {
        name = 'Double Action Revolver',
        ammo = 'Ammo .38',
    },
    [joaat('WEAPON_GUSENBERG')] = {
        name = 'Gusenberg',
        ammo = 'Ammo .45',
    },
    [joaat('WEAPON_HEAVYRIFLE')] = {
        name = 'Heavy Rifle',
        ammo = 'Rifle Ammo',
    },
    [joaat('WEAPON_HEAVYPISTOL')] = {
        name = 'Heavy Pistol',
        ammo = 'Ammo .45',
    },
    [joaat('WEAPON_HEAVYSHOTGUN')] = {
        name = 'Heavy Shotgun',
        ammo = 'Shotgun Ammo',
    },
    [joaat('WEAPON_MACHINEPISTOL')] = {
        name = 'Machine Pistol',
        ammo = '.9mm Ammo',
    },
    [joaat('WEAPON_MG')] = {
        name = 'Machine Gun',
        ammo = 'Rifle Ammo',
    },
    [joaat('WEAPON_MILITARYRIFLE')] = {
        name = 'Military Rifle',
        ammo = 'Rifle Ammo',
    },
    [joaat('WEAPON_MINISMG')] = {
        name = 'Mini SMG',
        ammo = '.9mm Ammo',
    },
    [joaat('WEAPON_MUSKET')] = {
        name = 'Musket',
        ammo = 'Musket Ammo',
    },
    [joaat('WEAPON_NAVYREVOLVER')] = {
        name = 'Navy Revolver',
        ammo = 'Ammo .44',
    },
    [joaat('WEAPON_GADGETPISTOL')] = {
        name = 'Perico Pistol',
        ammo = '.9mm Ammo',
    },
    [joaat('WEAPON_PISTOL50')] = {
        name = 'Pistol .50',
        ammo = 'Ammo .50',
    },
    [joaat('WEAPON_PISTOL_MK2')] = {
        name = 'Pistol MK2',
        ammo = '.9mm Ammo',
    },
    [joaat('WEAPON_PUMPSHOTGUN_MK2')] = {
        name = 'Pump Shotgun MK2',
        ammo = 'Shotgun Ammo',
    },
    [joaat('WEAPON_REVOLVER')] = {
        name = 'Revolver',
        ammo = 'Ammo .44',
    },
    [joaat('WEAPON_REVOLVER_MK2')] = {
        name = 'Revolver MK2',
        ammo = 'Ammo .44',
    },
    [joaat('WEAPON_SMG_MK2')] = {
        name = 'SMG Mk2',
        ammo = '.9mm Ammo',
    },
    [joaat('WEAPON_SNSPISTOL')] = {
        name = 'SNS Pistol',
        ammo = 'Ammo .45',
    },
    [joaat('WEAPON_SPECIALCARBINE')] = {
        name = 'Special Carbine',
        ammo = 'Rifle Ammo',
    },
    [joaat('WEAPON_SPECIALCARBINE_MK2')] = {
        name = 'Special Carbine MK2',
        ammo = 'Rifle Ammo',
    },
    [joaat('WEAPON_AUTOSHOTGUN')] = {
        name = 'Sweeper Shotgun',
        ammo = 'Shotgun Ammo',
    },
    [joaat('WEAPON_VINTAGEPISTOL')] = {
        name = 'Vintage Pistol',
        ammo = '.9mm Ammo',
    },
    [joaat('WEAPON_TACTICALRIFLE')] = {
        name = 'Tactical Rifle',
        ammo = 'Rifle Ammo',
    },
}