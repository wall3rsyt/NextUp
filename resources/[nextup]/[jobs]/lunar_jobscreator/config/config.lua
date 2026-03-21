/*
    THANKS FOR PURCHASING OUR JOBS CREATOR SCRIPTS! <3
    
    Target, 3D prompts, notifications and progress bar can be configured in lunar_bridge/config
    Minigames can be configured in lunar_contracts/config/cl_edit.lua
    Want to use dirty money item as an account? Configure it in lunar_bridge/config/config.lua

    Need help with the script?
    Join our discord, claim the customer role and open a support ticket:
    https://discord.gg/AAuvQYgyqX
*/

Config = {}

-- The command to open up the menu
-- You can also use /edit job_name for faster access
Config.command = 'jobscreator'

-- The /jobscreator menu locales are separate from the normal in-game locales
-- You can find them in web/dist/locales
Config.uiLanguage = 'nl'

-- Setting this to false is not recommended!
-- You would need to manage your database/jobs.lua manually.
Config.registerJobInFramework = true

-- If radius isn't specified in the job
Config.defaultRadius = 1.25

-- The groups that can use /jobscreator, /uncuff, /edit
-- Ignore this if you're on qb-core and use this inside server.cfg: add_ace group.admin jobscreator_admin allow
Config.adminGroups = {
    ['admin'] = true,
    ['god'] = true
}

-- The accounts used for cash registers and 
Config.accounts = {
    'money', 'bank'
}

-- You can add a font name here
-- Don't add <font face=""> etc., just add the font name
Config.blipsFont = ''

-- Show save vehicle option always
Config.forceSaveVehicleOption = false

Config.actionsMenu = true -- Enables the F6 menu, you can change the bind in cl_edit.lua
Config.actionsMenuPosition = 'top-right'
Config.radialMenu = false         -- Enables the ox_lib radial menu for actions
Config.disableTargetInteractions = false -- Completely disables the player and vehicle interactions through target

-- Force the animation to play every 100ms
-- Could potentially hurt performance
Config.forceCuffAnim = false

-- Beware, changing this won't change it for player that already joined the server before, the previous bind is saved for them.
-- Tackling only works if a player is sprinting
Config.tackleKeybind = 'G'
Config.tackleCooldown = 10000 -- milliseconds

---@type 'normal' | 'quasar' | false
Config.lockpickMinigame = 'normal'

-- The alarm code for every job
Config.alarmCode = '10-69'

-- Currently supports esx_status and qb-smallresources for hunger and thirst
-- addThirst, addHunger can be edited in cl_edit.lua
---@type table<string, UsableItem>

local EAT_ANIM    = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' }
local EAT_PROP    = { model = `prop_cs_burger_01`, position = vec3(0.02, 0.02, -0.02), rotation = vec3(0.0, 0.0, 0.0) }
local DRINK_ANIM  = { dict = 'mp_player_intdrink', clip = 'loop_bottle' }
local BOTTLE_PROP = { model = `prop_ld_flow_bottle`, position = vector3(0.03, 0.03, 0.02), rotation = vector3(0.0, 0.0, -1.5) }

Config.usableItems = {
    ['burger_fries'] = {
        progress = 'Aan het eten...',
        duration = 3000,
        animation = EAT_ANIM,
        prop = EAT_PROP,
        hunger = 200000
    },
    ['burger_applepie'] = {
        progress = 'Aan het eten...',
        duration = 3000,
        animation = EAT_ANIM,
        prop = EAT_PROP,
        hunger = 200000
    },
    ['burger_bleeder'] = {
        progress = 'Aan het eten...',
        duration = 3000,
        animation = EAT_ANIM,
        prop = EAT_PROP,
        hunger = 200000
    },
    ['burger_chickenwrap'] = {
        progress = 'Aan het eten...',
        duration = 3000,
        animation = EAT_ANIM,
        prop = EAT_PROP,
        hunger = 200000
    },
    ['burger_donut'] = {
        progress = 'Aan het eten...',
        duration = 3000,
        animation = EAT_ANIM,
        prop = EAT_PROP,
        hunger = 200000
    },
    ['burger_heartstopper'] = {
        progress = 'Aan het eten...',
        duration = 3000,
        animation = EAT_ANIM,
        prop = EAT_PROP,
        hunger = 200000
    },
    ['burger_meatfree'] = {
        progress = 'Aan het eten...',
        duration = 3000,
        animation = EAT_ANIM,
        prop = EAT_PROP,
        hunger = 200000
    },
    ['burger_moneyshot'] = {
        progress = 'Aan het eten...',
        duration = 3000,
        animation = EAT_ANIM,
        prop = EAT_PROP,
        hunger = 200000
    },
    ['burger_torpedo'] = {
        progress = 'Aan het eten...',
        duration = 3000,
        animation = EAT_ANIM,
        prop = EAT_PROP,
        hunger = 200000
    },
    ['burger_ecola'] = {
        progress = 'Aan het drinken...',
        duration = 3000,
        animation = DRINK_ANIM,
        prop = BOTTLE_PROP,
        thirst = 200000
    },
    ['burger_sprunk'] = {
        progress = 'Aan het drinken...',
        duration = 3000,
        animation = DRINK_ANIM,
        prop = BOTTLE_PROP,
        thirst = 200000
    },
    ['burger_coffee'] = {
        progress = 'Aan het drinken...',
        duration = 3000,
        animation = DRINK_ANIM,
        prop = {
            model = `p_ing_coffeecup_01`,
            position = vector3(0.03, 0.03, 0.02),
            rotation = vector3(0.0, 0.0, -1.5)
        },
        thirst = 200000
    },
    ['champagne'] = {
        progress = 'Aan het drinken...',
        duration = 3000,
        animation = DRINK_ANIM,
        prop = BOTTLE_PROP,
        thirst = 200000
    },
    ['icetea'] = {
        progress = 'Aan het drinken...',
        duration = 3000,
        animation = DRINK_ANIM,
        prop = BOTTLE_PROP,
        thirst = 200000
    },
    ['lemonade'] = {
        progress = 'Aan het drinken...',
        duration = 3000,
        animation = DRINK_ANIM,
        prop = BOTTLE_PROP,
        thirst = 200000
    },
    ['martini'] = {
        progress = 'Aan het drinken...',
        duration = 3000,
        animation = DRINK_ANIM,
        prop = BOTTLE_PROP,
        thirst = 200000
    },
    ['mojito'] = {
        progress = 'Aan het drinken...',
        duration = 3000,
        animation = DRINK_ANIM,
        prop = BOTTLE_PROP,
        thirst = 200000
    },
    ['red_wine'] = {
        progress = 'Aan het drinken...',
        duration = 3000,
        animation = DRINK_ANIM,
        prop = {
            model = `prop_wine_red`,
            position = vector3(0.03, 0.03, -0.22),
            rotation = vector3(0.0, 0.0, -1.5)
        },
        thirst = 200000
    },
    ['white_wine'] = {
        progress = 'Aan het drinken...',
        duration = 3000,
        animation = DRINK_ANIM,
        prop = {
            model = `prop_wine_white`,
            position = vector3(0.03, 0.03, -0.22),
            rotation = vector3(0.0, 0.0, -1.5)
        },
        thirst = 200000
    },
    ['vodka'] = {
        progress = 'Aan het drinken...',
        duration = 3000,
        animation = DRINK_ANIM,
        prop = BOTTLE_PROP,
        thirst = 200000
    },
    ['tequila'] = {
        progress = 'Aan het drinken...',
        duration = 3000,
        animation = DRINK_ANIM,
        prop = BOTTLE_PROP,
        thirst = 200000
    },
}