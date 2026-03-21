Config.Extras = {}

-- @param: Enabled [boolean] - Enable or disable the extras feature
Config.Extras.Enabled = false

Config.Extras.Points = {
    ['Mission_Row'] = {
        coords = vector3(422.0407, -1022.2838, 28.9565),
        options = {
            ['liveries'] = true,
            ['stickers'] = true,
            ['wash'] = true,
            ['fix'] = true,

            -- LIST OF VEHICLE MODS [https://docs.fivem.net/natives/?_0x6AF0636DDEDCB6DD]
            ['mods'] = {
                [0] = 'Spoiler',
                [1] = 'Front bumper',
                [2] = 'Rear bumper',
                [3] = 'Side skirts',
                [4] = 'Exhaust',
                [5] = 'Roll Cage',
                [6] = 'Grill',
                [7] = 'Hood',
                [8] = 'Fender',
                [9] = 'Right fender',
                [10] = 'Roof',
                [11] = 'Engine',
                [12] = 'Brakes',
                [13] = 'Transmission',
                [14] = 'Horn',
                [15] = 'Suspension',
                [16] = 'Armor',
            }
        },
        allowedJobs = {
            ['police'] = 0, -- job name and grade
            ['sheriff'] = 0
        }
    }
}

Config.Extras.Callsigns = { -- THIS IS READY FOR SEB5A POLICE VEHICLE PACK
    ['cvpi'] = {
        [1] = 10, -- FIRST NUMBER = 10TH VEHICLE MOD IN cvpi VEHICLE MODEL
        [2] = 9, -- SECOND NUMBER = 9TH VEHICLE MOD IN cvpi VEHICLE MODEL
        [3] = 8 -- THIRD NUMBER = 8TH VEHICLE MOD IN cvpi VEHICLE MODEL
    },
    ['emstahoe'] = {
        [1] = 10,
        [2] = 9,
        [3] = 8
    },
    ['polbuffalo4'] = {
        [1] = 8,
        [2] = 9,
        [3] = 10
    },
    ['polgranger2'] = {
        [1] = 8,
        [2] = 9,
        [3] = 10
    },
    ['policeexp'] = {
        [1] = 10,
        [2] = 9,
        [3] = 8
    },
    ['polscout'] = {
        [1] = 8,
        [2] = 9,
        [3] = 10
    },
    ['poltorrence'] = {
        [1] = 8,
        [2] = 9,
        [3] = 10
    },
    ['polvigero'] = {
        [1] = 8,
        [2] = 9,
        [3] = 10
    },
}