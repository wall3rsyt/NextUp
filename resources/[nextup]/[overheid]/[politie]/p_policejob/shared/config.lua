Config = {}

-- CHECK INSTALL FOLDER FIRST!
-- SUPPORTED FRAMEWORKS: ESX / QBCORE / QBOX [You can add yours in bridge folder]
-- SUPPORTED INVENTORIES: ox_inventory / qb-inventory / ps-inventory / qs-inventory / tgiann-inventory / codem-inventory / core_inventory [You can add yours in inventory folder]
-- SUPPORTED TARGETS: ox_target / qb-target [You can add yours in target folder]

Config.Language = 'nl' -- pl / en / de / fr / tr
Config.Logs = false -- true / false
Config.Debug = false
Config.Commands = true -- set to false if you want dont want to use commands
Config.OxRadial = false -- enable ox radial menu? (you can edit this in bridge/client)
Config.PoliceMenu = true -- set to true if you want to use F6 OX LIB MENU
Config.PoliceMenuKey = 'F6' -- key to open police menu

lib.locale(Config.Language or 'en')

Config.SSN = 'id' -- database column for character unique id

-- POLICE JOBS ON YOUR SERVER
--@param jobName [string]: grade [number]
Config.Jobs = {
    ['police'] = 0,
    ['sheriff'] = 0
}

--@param jobName [string]: grade [number]
Config.OutfitsAccess = { -- permissions for /police_outfit
    ['police'] = 0,
    ['sheriff'] = 0
}

-- POLICE STATIONS
Config.Stations = {
    ['MissionRow'] = {
        -- LIST OF BLIPS, IF YOU WANT TO REMOVE THEM, SET blips = {}
        blips = {
            {
                sprite = 60, color = 29, scale = 0.95, display = 2,
                label = 'Politiebureau', coords = vector3(437.6986, -982.1099, 30.6904)
            },
        },

        -- LIST OF BELL RINGS, IF YOU WANT TO REMOVE THEM, SET bells = {}
        bells = {
            {
                coords = vector3(443.68, -990.37, 30.26), radius = 0.75,
                jobs = {['police'] = true}, -- which jobs will get alert
            }
        },

        -- LIST OF TRASHES TO REMOVE ITEMS, IF YOU WANT TO REMOVE THEM, SET trashes = {}
        trashes = {
            {
                coords = vector3(431.10, -997.99, 30.28), radius = 0.75,
                allowedJobs = {['police'] = 0}, -- which jobs can access trashes
            }
        },

        -- LIST OF BODYCAMS MENU, IF YOU WANT TO REMOVE THEM, SET bodycams = {}
        bodycams = {
            --{
            --    coords = vector3(443.9766, -994.2385, 30.2377), radius = 0.75,
            --    allowedJobs = {['police'] = 0, ['sheriff'] = 0}, -- which jobs can access bodycams
            --}
        },

        toggleDuty = {
            {
                coords = vector3(456.80, -984.07, 31.12), radius = 0.75,
                allowedJobs = {['police'] = 0, ['sheriff'] = 0},
            }
        },
    }, 
} 

-- POLICE SHOPS [ARMOURIES]
Config.Shops = {
    ['Armory'] = { -- NAME MUST BE UNIQUE
        label = 'Politie Wapenkamer', -- LABEL
        locations = {
            vector4(454.7720, -974.6797, 30.2522, 181.7381)
        },
        ped = {
            model = 'mp_s_m_armoured_01',
            anim = {dict = 'amb@world_human_cop_idles@male@idle_b', clip = 'idle_b', flag = 1},
            onCreate = function(entity)
                -- you can implement some logic [for example set some clothes/props :)]
            end
        },
        requiredDuty = true,
        radius = 0.75,
        allowedJobs = {['police'] = 0, ['sheriff'] = 0},
        inventory = {
            {name = 'evidence_camera', price = 0},
            {name = 'megaphone', price = 0},
            {name = 'wheel_clamp', price = 0},
            {name = 'breathalyzer', price = 0},
            {name = 'police_shield' , price = 0},
            {name = 'WEAPON_RADAR', price = 0},
            {name = 'spike_strip', price = 0},
            {name = 'police_diving_suit', price = 0},
            {name = 'tracking_band', price = 0},
            {name = 'body_cam', price = 0},
            {name = 'gps', price = 0},
            {name = 'camera', price = 0},
            {name = 'radio', price = 0},
            {name = 'handcuffs', price = 0},
            {name = 'vest_normal', price = 10},
            {name = 'vest_strong', price = 100},
            {name = 'WEAPON_FLASHLIGHT', price = 100},
            {name = 'WEAPON_NIGHTSTICK', price = 100, metadata = {registered = true, serial = 'POL'}},
            {name = 'WEAPON_STUNGUN', price = 100, metadata = {registered = true, serial = 'POL'}},
            {name = 'WEAPON_FM1_P320', price = 500, grade = 1, metadata = {registered = true, serial = 'POL'}},
            {name = 'WEAPON_FM1_GLOCK19', price = 500, grade = 1, metadata = {registered = true, serial = 'POL'}},
            {name = 'WEAPON_MCXRATTLER', price = 1000, grade = 40, metadata = {registered = true, serial = 'POL'}},
            {name = 'ammo-pistol-politie', price = 3, grade = 1},
            {name = 'ammo-rifle-politie', price = 5, grade = 92},
            {name = 'WEAPON_FM1_SPEARLT', price = 2000, grade = 92, metadata = {registered = true, serial = 'POL'}},
            {name = 'WEAPON_FM2_SPEARLT', price = 2000, grade = 92, metadata = {registered = true, serial = 'POL'}},
            {name = 'WEAPON_FM3_SPEARLT', price = 2000, grade = 92, metadata = {registered = true, serial = 'POL'}},
            {name = 'WEAPON_FM4_SPEARLT', price = 2000, grade = 92, metadata = {registered = true, serial = 'POL'}},
            {name = 'WEAPON_FM5_SPEARLT', price = 2000, grade = 92, metadata = {registered = true, serial = 'POL'}},
            {name = 'WEAPON_FM6_SPEARLT', price = 2000, grade = 92, metadata = {registered = true, serial = 'POL'}},
            {name = 'WEAPON_FM1_HK416', price = 2000, grade = 92, metadata = {registered = true, serial = 'POL'}},
            {name = 'WEAPON_FM2_HK416', price = 2000, grade = 92, metadata = {registered = true, serial = 'POL'}},
        },
    },
    -- ['Armory_2'] = {
    --     label = 'Police Armory',
    --     locations = {
    --         vector4(449.4452, -1005.2921, 30.7074, 0.5456)
    --     },
    --     ped = {
    --         model = 'mp_s_m_armoured_01',
    --         anim = {dict = 'amb@world_human_cop_idles@male@idle_b', clip = 'idle_b', flag = 1},
    --         onCreate = function(entity)
    --         end
    --     },
    --     requiredDuty = false,
    --     radius = 0.75,
    --     allowedJobs = {['police'] = 0, ['sheriff'] = 0},
    --     inventory = {
    --         {name = 'evidence_camera', price = 0},
    --         {name = 'megaphone', price = 0},
    --         {name = 'wheel_clamp', price = 0},
    --         {name = 'breathalyzer', price = 0},
    --         {name = 'police_shield' , price = 0},
    --         {name = 'WEAPON_RADAR', price = 0},
    --         {name = 'spike_strip', price = 0},
    --         {name = 'police_diving_suit', price = 0},
    --         {name = 'tracking_band', price = 0},
    --         {name = 'body_cam', price = 0},
    --         {name = 'gps', price = 0},
    --         {name = 'camera', price = 0},
    --         {name = 'radio', price = 0},
    --         {name = 'handcuffs', price = 0},
    --         {name = 'vest_normal', price = 10},
    --         {name = 'vest_strong', price = 100},
    --         {name = 'ammo-9', price = 5},
    --         {name = 'ammo-rifle', price = 5},
    --         {name = 'ammo-shotgun', price = 5},
    --         {name = 'WEAPON_FLASHLIGHT', price = 100},
    --         {name = 'WEAPON_NIGHTSTICK', price = 100, metadata = {registered = true, serial = 'POL'}},
    --         {name = 'WEAPON_COMBATPISTOL', price = 1000, license = 'weapon', grade = 1, metadata = {registered = true, serial = 'POL'}},
    --         {name = 'WEAPON_STUNGUN', price = 1000, metadata = {registered = true, serial = 'POL'}},
    --         {name = 'WEAPON_PUMPSHOTGUN', price = 10000, license = 'weapon', grade = 5, metadata = {registered = true, serial = 'POL'}},
    --         {name = 'WEAPON_CARBINERIFLE', price = 15000, license = 'weapon', grade = 10, metadata = {registered = true, serial = 'POL'}},
    --     },
    -- },
}

-- WARDROBES FOR POLICE
Config.Wardrobes = {
    --['MissionRow'] = {
    --    coords = vector3(464.6, -1008.23, 31.0),
    --    radius = 0.75,
    --    drawSprite = false,
    --}
}

Config.Lockers = {
    ['MissionRow'] = {
        coords = vector3(472.4391, -973.0375, 30.2518),
        radius = 1.5,
        drawSprite = false,
        options = {
            {
                name = 'MissionRow_Locker',
                label = locale('private_locker'),
                icon = 'fa-solid fa-box-open',
                distance = 2,
                groups = Config.Jobs,
                isLocker = true,
                lockerOwner = true,
                lockerLabel = locale('private_locker'),
                lockerSlots = 50, lockerWeight = 500000,
                onSelect = function()
                    Inventory.openInventory('stash', 'MissionRow_Locker')
                end,
                canInteract = function()
                    local dutyData = Editable.CheckDuty()
                    return dutyData.status == 1
                end
            }
        }
    }
}

-- RADIO SYSTEM IN RADIAL MENU [OX_LIB RADIAL], SET TO {} IF YOU DONT WANT TO USE
Config.Radio = {}

Config.CameraShowHelpNotify = function()
    if GetResourceState('p_helper') == 'started' then
        exports['p_helper']:showHelper({
            {
                keys = {'X'},
                label = 'Cancel'
            },
            {
                keys = {'ENTER'},
                label = 'Make Photo'
            },
        })
    else
        lib.showTextUI(locale('camera_helper'))
    end
end

Config.CameraHideHelpNotify = function()
    if GetResourceState('p_helper') == 'started' then
        exports['p_helper']:hideHelper()
    else
        lib.hideTextUI()
    end
end

Config.CameraAccess = false

-- YOU CAN SET CAMERA ITEM ACCESS FOR EACH JOB
-- Config.CameraAccess = {
--     ['police'] = 0,
--     ['sheriff'] = 0
-- }