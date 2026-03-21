Config.Objects = {}

Config.Objects.NeedDuty = true -- need to be on duty to remove props?
Config.Objects.Type = 'vehicle' -- menu / vehicle [vehicle = only available in vehicle trunk]
Config.Objects.RequireOpenTrunk = true -- need to open trunk to access objects?
Config.Objects.maxObjectsPerUse = 10 -- max objects per use through object menu

-- TODO:
-- Config.Objects.PoliceTape = {
--     tapeModel = 'prop_cordon_tape',
-- }

-- THIS IS FOR VEHICLE TRUNK
Config.Objects.RestrictedVehicles = {
    ['police'] = {
        ['p_ld_stinger_s'] = {label = locale('stinger'), item = 'spike_strip', icon = 'fa-solid fa-road-spikes'},
        ['prop_consign_01a'] = {label = locale('consign'), item = 'consign', icon = 'fa-solid fa-signs-post'},
        ['prop_roadcone02a'] = {label = locale('roadcone'), item = 'road_cone'},
        ['prop_barrier_work06a'] = {label = locale('barrier'), item = 'barrier', icon = 'fa-solid fa-road-barrier'},
        ['prop_air_conelight'] = {label = locale('roadcone_light'), item = 'roadcone_light'},
    },

    ['polbabatunde2'] = {
        ['p_ld_stinger_s'] = {label = locale('stinger'), item = 'spike_strip', icon = 'fa-solid fa-road-spikes'},
        ['prop_consign_01a'] = {label = locale('consign'), item = 'consign', icon = 'fa-solid fa-signs-post'},
        ['prop_roadcone02a'] = {label = locale('roadcone'), item = 'road_cone'},
        ['prop_barrier_work06a'] = {label = locale('barrier'), item = 'barrier', icon = 'fa-solid fa-road-barrier'},
        ['prop_air_conelight'] = {label = locale('roadcone_light'), item = 'roadcone_light'},
    },

    ['kanzlerSRTlineEU2'] = {
        ['p_ld_stinger_s'] = {label = locale('stinger'), item = 'spike_strip', icon = 'fa-solid fa-road-spikes'},
        ['prop_consign_01a'] = {label = locale('consign'), item = 'consign', icon = 'fa-solid fa-signs-post'},
        ['prop_roadcone02a'] = {label = locale('roadcone'), item = 'road_cone'},
        ['prop_barrier_work06a'] = {label = locale('barrier'), item = 'barrier', icon = 'fa-solid fa-road-barrier'},
        ['prop_air_conelight'] = {label = locale('roadcone_light'), item = 'roadcone_light'},
    },

    ['polevasiontdb'] = {
        ['p_ld_stinger_s'] = {label = locale('stinger'), item = 'spike_strip', icon = 'fa-solid fa-road-spikes'},
        ['prop_consign_01a'] = {label = locale('consign'), item = 'consign', icon = 'fa-solid fa-signs-post'},
        ['prop_roadcone02a'] = {label = locale('roadcone'), item = 'road_cone'},
        ['prop_barrier_work06a'] = {label = locale('barrier'), item = 'barrier', icon = 'fa-solid fa-road-barrier'},
        ['prop_air_conelight'] = {label = locale('roadcone_light'), item = 'roadcone_light'},
    },

    ['everonpol'] = {
        ['p_ld_stinger_s'] = {label = locale('stinger'), item = 'spike_strip', icon = 'fa-solid fa-road-spikes'},
        ['prop_consign_01a'] = {label = locale('consign'), item = 'consign', icon = 'fa-solid fa-signs-post'},
        ['prop_roadcone02a'] = {label = locale('roadcone'), item = 'road_cone'},
        ['prop_barrier_work06a'] = {label = locale('barrier'), item = 'barrier', icon = 'fa-solid fa-road-barrier'},
        ['prop_air_conelight'] = {label = locale('roadcone_light'), item = 'roadcone_light'},
    },

    ['Polsr6'] = {
        ['p_ld_stinger_s'] = {label = locale('stinger'), item = 'spike_strip', icon = 'fa-solid fa-road-spikes'},
        ['prop_consign_01a'] = {label = locale('consign'), item = 'consign', icon = 'fa-solid fa-signs-post'},
        ['prop_roadcone02a'] = {label = locale('roadcone'), item = 'road_cone'},
        ['prop_barrier_work06a'] = {label = locale('barrier'), item = 'barrier', icon = 'fa-solid fa-road-barrier'},
        ['prop_air_conelight'] = {label = locale('roadcone_light'), item = 'roadcone_light'},
    },

    ['polubermacht'] = {
        ['p_ld_stinger_s'] = {label = locale('stinger'), item = 'spike_strip', icon = 'fa-solid fa-road-spikes'},
        ['prop_consign_01a'] = {label = locale('consign'), item = 'consign', icon = 'fa-solid fa-signs-post'},
        ['prop_roadcone02a'] = {label = locale('roadcone'), item = 'road_cone'},
        ['prop_barrier_work06a'] = {label = locale('barrier'), item = 'barrier', icon = 'fa-solid fa-road-barrier'},
        ['prop_air_conelight'] = {label = locale('roadcone_light'), item = 'roadcone_light'},
    },

    ['unmrebla'] = {
        ['p_ld_stinger_s'] = {label = locale('stinger'), item = 'spike_strip', icon = 'fa-solid fa-road-spikes'},
        ['prop_consign_01a'] = {label = locale('consign'), item = 'consign', icon = 'fa-solid fa-signs-post'},
        ['prop_roadcone02a'] = {label = locale('roadcone'), item = 'road_cone'},
        ['prop_barrier_work06a'] = {label = locale('barrier'), item = 'barrier', icon = 'fa-solid fa-road-barrier'},
        ['prop_air_conelight'] = {label = locale('roadcone_light'), item = 'roadcone_light'},
    },

    ['brickdual4sa'] = {
        ['prop_consign_01a'] = {label = locale('consign'), item = 'consign', icon = 'fa-solid fa-signs-post'},
        ['prop_roadcone02a'] = {label = locale('roadcone'), item = 'road_cone'},
        ['prop_barrier_work06a'] = {label = locale('barrier'), item = 'barrier', icon = 'fa-solid fa-road-barrier'},
        ['prop_air_conelight'] = {label = locale('roadcone_light'), item = 'roadcone_light'},
    },
    
    ['sporetranseranmbsa'] = {
        ['prop_consign_01a'] = {label = locale('consign'), item = 'consign', icon = 'fa-solid fa-signs-post'},
        ['prop_roadcone02a'] = {label = locale('roadcone'), item = 'road_cone'},
        ['prop_barrier_work06a'] = {label = locale('barrier'), item = 'barrier', icon = 'fa-solid fa-road-barrier'},
        ['prop_air_conelight'] = {label = locale('roadcone_light'), item = 'roadcone_light'},
    },    
}

-- THIS IS FOR OBJECTS MENU
Config.Objects.Jobs = {
    ['police'] = {
        ['p_ld_stinger_s'] = locale('stinger'),
        ['prop_consign_01a'] = locale('consign'),
        ['prop_roadcone02a'] = locale('roadcone'),
        ['prop_barrier_work06a'] = locale('barrier'),
        ['prop_air_conelight'] = locale('roadcone_light'),
    },

    ['mechanic'] = {
        --['p_ld_stinger_s'] = locale('stinger'),
        ['prop_consign_01a'] = locale('consign'),
        ['prop_roadcone02a'] = locale('roadcone'),
        ['prop_barrier_work06a'] = locale('barrier'),
        ['prop_air_conelight'] = locale('roadcone_light'),
    },    
}

Config.Objects.SpikeStripItem = {
    enabled = true, -- IF YOU WANT SPIKE TRIPS AS ITEM, REMOVE MODEL 'p_ld_stinger_s' FROM CONFIG ABOVE
    jobRestricted = true, -- IS ONLY ALLOWED FOR JOBS?
    allowedJobs = Config.Jobs,
}

Config.Objects.ShowHelpNotify = function()
    if GetResourceState('p_helper') == 'started' then
        exports['p_helper']:showHelper({
            {
                keys = {'X'},
                label = locale('cancel')
            },
            {
                keys = {'<', '>'},
                label = locale('rotate_left_right')
            },
            {
                keys = {'E'},
                label = locale('confirm')
            },
        })
    else
        lib.showTextUI('[X] - Annuleer | [<] [>] - Roteer | [E] - Bevestig')
    end
end

Config.Objects.HideHelpNotify = function()
    if GetResourceState('p_helper') == 'started' then
        exports['p_helper']:hideHelper()
    else
        lib.hideTextUI()
    end
end