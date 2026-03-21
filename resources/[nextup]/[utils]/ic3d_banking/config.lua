Config = {}
Config.Debug = false
Config.DefaultLocale = 'nl'
Config.ErrorSounds = true
Config.UseTargetSystem = true
Config.AtmModels = {
    `prop_atm_01`,
    `prop_atm_02`,
    `prop_atm_03`,
    `prop_fleeca_atm`
}
Config.AtmLimit = 1000000
Config.AtmDeposit = true
Config.Banks = {
    {
        name = "Bank - Legion Square",
        coords = {
            vector3(147.3210, -1043.7657, 31.4870, 173.0624),
            vector3(145.6112, -1042.7705, 30.9624, 179.6372),
            vector3(144.1108, -1042.3386, 31.3665, 133.3773)
        },
        blip = {
            enabled = true,
            sprite = 108,
            color = 2,
            scale = 0.7
        }
    },
    {
        name = "Bank - Rockford Hills",
        coords = vector3(-1212.98, -330.84, 36.79),
        blip = {
            enabled = true,
            sprite = 108,
            color = 2,
            scale = 0.7
        }
    },
    {
        name = "Bank - Great Ocean Highway",
        coords = vector3(-2962.47, 482.93, 15.5),
        blip = {
            enabled = true,
            sprite = 108,
            color = 69,
            scale = 0.7
        }
    },
    {
        name = "Bank - Paleto Bay",
        coords = vector3(-113.01, 6470.24, 31.43),
        blip = {
            enabled = true,
            sprite = 108,
            color = 69,
            scale = 0.7
        }
    },
    {
        name = "Bank - Downtown Vinewood",
        coords = vector3(314.16, -279.09, 53.97),
        blip = {
            enabled = true,
            sprite = 108,
            color = 69,
            scale = 0.7
        }
    },
    {
        name = "Bank - Burton",
        coords = vector3(-350.99, -49.99, 48.84),
        blip = {
            enabled = true,
            sprite = 108,
            color = 69,
            scale = 0.7
        }
    },
    {
        name = "Bank - Sandy Shores",
        coords = vector3(1175.02, 2706.87, 37.89),
        blip = {
            enabled = true,
            sprite = 108,
            color = 69,
            scale = 0.7
        }
    },
    {
        name = "Bank - Pacific Standard",
        coords = vector3(246.63, 223.62, 106.0),
        blip = {
            enabled = true,
            sprite = 108,
            color = 69,
            scale = 0.7
        }
    },
}
Config.Marker = {
    type = 2,
    scale = vector3(0.3, 0.2, 0.15),
    color = { r = 59, g = 130, b = 246, a = 150 },
    bobUpAndDown = true,
    faceCamera = false,
    rotate = true,
    drawDistance = 15.0
}
Config.TransactionLimits = {
    deposit = 1000000,
    withdraw = 1000000,
    transfer = 1000000
}
-- ================================================
--   UI SYSTEEM - ox_lib
-- ================================================
Config.TextUISystem = "ox_lib"
Config.TextUI = {
    show = function(text, opts)
        lib.showTextUI(text, opts)
    end,
    hide = function()
        lib.hideTextUI()
    end
}
-- ================================================
--   NOTIFICATIES - ox_lib
-- ================================================
Config.NotifySystem = "ox_lib"
Config.Notify = function(type, message)
    lib.notify({
        title = Locales[Config.DefaultLocale]['bank_title'],
        description = message,
        type = type,
        position = 'center-left',
        icon = 'building-columns'
    })
end