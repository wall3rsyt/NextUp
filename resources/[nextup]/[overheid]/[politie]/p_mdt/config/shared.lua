Config = {} -- do not touch it!

--- IMPORTANT INFO:
--- Please setup your Framework, Target, Inventory etc in p_bridge config
Config.UseCache = true -- If true, some data will be cached for few seconds to reduce server load [good for high population servers]

---@class Config.Departments: Record<jobName: string, Department>
---@class Department
---@field label: string [Full department name]
---@field shortName: string [Short department name]
---@field image: string [URL to department image/logo]
---@field licences: table<string, string> [Table of licences available for officers in this department, it use own licence system!]
Config.Departments = {
    ['police'] = {
        label = 'Nextup Politie',
        shortName = 'Politie',
        image = ('https://media.discordapp.net/attachments/868561831483035718/1481317429584986325/politie_png.png?ex=69b2dfdc&is=69b18e5c&hm=a8aa36b68bce2ba95766c529fdc54ac4253ece125f6a3626c6f79379626fcb5c&=&format=webp&quality=lossless&width=720&height=540'):format(GetCurrentResourceName()),
        licences = {
            ['police_seu'] = 'SEU',
            ['police_eagle'] = 'Eagle'
        },
        citizen_licences = {
            ['driver'] = 'Driver License',
            ['firearm'] = 'Firearm License',
            ['pilot'] = 'Pilot License'
        },
        bossGrades = {3, 4}, -- these grades can setup permissions for every grade in mdt and use /mdt:editconfig
    }
}

---@class Config.MDT
---@field commandName: string | false [Command name to open MDT, false to disable command]
---@field itemName: string | false [Item name to open MDT, false to disable item usage]
---@field canOpenMDT: function [Function to determine if player can open MDT]
Config.MDT = {
    commandName = 'meos',
    itemName = 'police_mdt',
    canOpenMDT = function()
        local stateBags = {'isDead', 'isCuffed', 'dead', 'draggedBy'}
        local playerState = LocalPlayer.state
        for _, bag in ipairs(stateBags) do
            if playerState[bag] then
                return false
            end
        end
        if IsPauseMenuActive() then
            return false
        end
        
        return true
    end,
    chargeTypes = {'Felony', 'Misdemeanor', 'Infraction'},
    disabledSections = {
        -- / dispatch / bolos / citizens / vehicles / properties / weapons / evidences 
        -- / incidents / warrants / charges / reports / judgments / bodycam / applications
        -- / employees / garage / permissions / logs
        ['bodycam'] = GetResourceState('p_policejob') == 'missing',
        -- ['logs'] = true,
        -- ['garage'] = true,
        -- ['applications'] = true,
    },
}

---@class Config.Dispatch
---@field requireDuty: boolean [If true, only players on duty can receive dispatch alerts]
---@field alertsNotification: boolean [If true, players will receive notifications for new dispatch alerts]
---@field supervisorRole: boolean [If true, the first unit to accept an alert is assigned as supervisor, others as regular units, supervisor can finish alert with even active units and also change supervisor]
---@field allowJoiningMultipleAlerts: boolean [If true, officers can join multiple active dispatch alerts]
---@field allowDeleteWithActiveUnits: boolean [If true, dispatch alerts can be deleted even if there are active units assigned]
---@field alertsMenuKey: string | false [Keybind to open the alerts menu, false to disable keybind]
---@field keybinds: table<string, string> [Keybinds for dispatch actions]
Config.Dispatch = {
    disableDispatch = false, -- set to true to disable dispatch system if you want to use different [disable also in disabledSections]
    requireDuty = false,
    alertsNotification = true,
    supervisorRole = true,
    allowJoiningMultipleAlerts = true,
    allowDeleteWithActiveUnits = true,
    alertsMenuKey = 'F9',
    keybinds = {
        ['acceptAlert'] = 'Z',
        ['dismissAlert'] = 'O',
        ['viewAlert'] = 'G',
        ['expandAlert'] = 'J'
    },

    -- YOU CAN ADJUST ALL ALERT IN modules/dispatch/client_alerts.lua !
    defaultAlerts = {
        ['shooting'] = true,
        ['carjacking'] = true,
        ['vehicletheft'] = true,
    }
}


---@class Config.Evidences
---@field itemsMetadata: Record<metadataKey: string, displayName: string> [Table defining metadata keys and their display names for evidence items]
Config.Evidences = {
    depositType = 'digital', -- physical | digital [physical = player need to register evidence item at some coords, digital = through mdt, will remove instantly item]
    depositPoints = {
        ['police'] = {
            vec3(460.86, -989.10, 24.87),
        },
    },
    -- what metadata will be visible in select menu in register evidence
    itemsMetadata = {
        ['serial'] = 'Serial Number',
        ['fingerprint'] = 'Fingerprint',
        ['dna'] = 'DNA Sample'
    }
}

---@class Config.Garage
---@field canImpoundOccupied: boolean [If true, players can impound vehicles that are occupied]
---@field savePropsOnImpound: boolean [If true, vehicle properties will be saved when impounding]
---@field maxParkDistance: number | false [Maximum distance to park a vehicle from the garage point, false to disable limit]
---@field retrieveOnRestart: boolean [If true, vehicles that were in the garage will be retrieved on server restart]
Config.Garage = {
    canImpoundOccupied = false,
    savePropsOnImpound = true,
    maxParkDistance = 5.0,
    retrieveOnRestart = true
}

---@class Config.Applications
---@field enabled: boolean [If true, applications system is enabled]
---@field points: table<string, {title: string, subtitle: string, coords: vector3[]}> [Table of application points by job name]
Config.Applications = {
    enabled = true,
    points = {
        ['police'] = {
            title = 'Police Department Application',
            subtitle = 'Complete all sections to submit your application to join the police force',
            coords = {
                vec3(441.14, -980.34, 30.91),
            }
        },
    },
    onReview = function(sourceId, applicationData, message)
        -- server side function
    end
}

---@class Config.Logs
---@field enabled boolean [If true, logging in MDT is enabled, false = only discord logs]
---@field queryLimit number [Maximum number of logs to query from the database]
---@field expireTime number [Time in seconds after which logs will be deleted]
Config.Logs = {
    enabled = true,
    queryLimit = 500,
    expireTime = 30 * 24 * 60 * 60 -- time in seconds after which logs will be deleted (30 days)
}