Config.GPS = {}

--@param Config.GPS.Enabled: boolean [true | false] (enable/disable gps?)
Config.GPS.Enabled = false

--@param Config.GPS.NeedDuty: boolean [true | false] (need to be on duty to turn on/off gps?)
Config.GPS.NeedDuty = false

--@param Config.GPS.ShortRange: boolean [true | false] (only visible closests blips on minimap?)
Config.GPS.ShortRange = false

--@param Config.GPS.RefreshRate: number (in milliseconds) [1000 = 1s]
Config.GPS.RefreshRate = 2500

--@param Config.GPS.UseCallSign: boolean [true | false] (use job call sign setted by /callsign ?)
Config.GPS.UseCallSign = false

Config.GPS.Jobs = {
    ['police'] = { -- YOU CAN USE GPS FOR DIFFERENT JOBS ALSO (MECHANIC, EMS, ETC)
        color = 63,
        lights = 1,
        display = 'LSPD',
        types = {
            onFoot = {
                color = 63,
                lights = 1,
                sprite = 1,
                scale = 1.1,
                heading = true
            },
            inVeh = {
                color = 63,
                lights = 1,
                sprite = 56,
                scale = 1.1,
                heading = true
            },
            boat = {
                color = 63,
                lights = 1,
                sprite = 427,
                scale = 1.1,
                heading = true
            },
            plane = {
                color = 63,
                lights = 1,
                sprite = 43,
                scale = 1.1,
                heading = true
            },
            heli = {
                color = 63,
                lights = 1,
                sprite = 43,
                scale = 1.1,
                heading = true
            },
            bike = {
                color = 63,
                lights = 1,
                sprite = 1,
                scale = 1.1,
                heading = true
            },
        }
    },
}