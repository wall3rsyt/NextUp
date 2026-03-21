--[[
    ██╗    ██╗██╗████████╗██╗    ██╗ █████╗ ███████╗
    ██║    ██║██║╚══██╔══╝██║    ██║██╔══██╗██╔════╝
    ██║ █╗ ██║██║   ██║   ██║ █╗ ██║███████║███████╗
    ██║███╗██║██║   ██║   ██║███╗██║██╔══██║╚════██║
    ╚███╔███╔╝██║   ██║   ╚███╔███╔╝██║  ██║███████║
     ╚══╝╚══╝ ╚═╝   ╚═╝    ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝
    Witwas Script v5.0
    Idle: ~0.00ms  |  In-Use: ~0.05ms
--]]

Config = {}

-- =============================================
--  BEVEILIGING / TOKEN SYSTEEM
-- =============================================
Config.Token = {
    secure = true,
    diff   = 750,
}

-- =============================================
--  TAAL
-- =============================================
Config.Locale = 'nl'

-- =============================================
--  INTERACTIE SYSTEEM
-- =============================================
Config.Interactie = 'auto'

-- =============================================
--  WITWAS INSTELLINGEN
-- =============================================
Config.MinBedrag    = 500
Config.WasPercentage = 30

Config.WasPerKlop = {
    min = 10,
    max = 25,
}

Config.LocatieCooldown = 30
Config.SessieCooldown  = 600

-- =============================================
--  KLOP ANIMATIE
-- =============================================
Config.KlopAnimatie = {
    dict  = 'timetable@jimmy@doorknock@',
    anim  = 'knockdoor_idle',
    duur  = 6000,
    flags = 49,
}

-- =============================================
--  MARKER
-- =============================================
Config.Marker = {
    enabled      = true,
    type         = 27,
    schaal       = vector3(0.5, 0.5, 0.5),
    kleur        = { r = 0, g = 200, b = 100, a = 180 },
    bobbing      = true,
    tekenAfstand = 12.0,
}

-- =============================================
--  DIRTY MONEY ITEM NAAM PER INVENTORY
-- =============================================
Config.DirtyMoneyItem = {
    default             = 'black_money',
    ['ox_inventory']    = 'black_money',
    ['qb-inventory']    = 'black_money',
    ['ps-inventory']    = 'black_money',
    ['qs-inventory']    = 'black_money',
    ['codem-inventory'] = 'black_money',
}
Config.DirtyMoneyItemOverride = nil

-- =============================================
--  DISCORD LOGGING
-- =============================================
Config.Discord = {
    enabled      = true,
    webhook      = "https://discord.com/api/webhooks/1480017853800517803/cuetYdheIs51llUCoKyUKE1Fj-0jyydQqIUOzHxX6xzqeWUyjw6RpFrik7nLn97OpLel",
    botNaam      = "Witwas Logger",
    botAvatar    = "",  -- eventueel een directe link: "https://i.imgur.com/....png"
    kleurStart   = 3447003,   -- ≈ #3498DB (blauw)
    kleurKlop    = 3066993,   -- ≈ #2ECC71 (groen)
    kleurCancel  = 15158332,  -- ≈ #E74C3C (rood)
    kleurAC      = 15548997,  -- ≈ #F1C40F (geel)
    kleurEinde   = 10181046,  -- ≈ #9B59B6 (paars)
    kleurDeepweb = 7419530,   -- ≈ #71368A (donker paars/blauw)
}

-- =============================================
--  BLIP VOOR ACTIEVE WASLOCATIE
-- =============================================
Config.WasBlip = {
    sprite = 280,
    color  = 2,
    schaal = 0.8,
    naam   = '💰 Witwas Locatie',
    route  = true,
}

-- =============================================
--  DEEPWEB INSTELLINGEN
-- =============================================
Config.Deepweb = {
    enabled  = true,
    kans     = 25,

    wasPerKlop = {
        min = 30,
        max = 50,
    },

 lbPhone = {
    enabled  = true,
    channel  = 'kloppen',
    username = 'kippetjetosti',
},

    blip = {
        sprite = 161,
        color  = 27,
        schaal = 0.8,
        route  = true,
    },
}

-- =============================================
--  PED INSTELLINGEN
-- =============================================
Config.PedInstellingen = {
    animDict = 'anim@amb@casino@games@slots@ped_a',
    animName = 'idle_a',
    scenario = 'WORLD_HUMAN_STAND_MOBILE',
}

-- =============================================
--  START LOCATIE
-- =============================================
Config.StartLocatie = {
    label         = 'Start Locatie',
    coords        = vector4(650.2596, -1021.5170, 22.2087, 268.0027),
    model         = 'g_m_y_lost_01',
    targetAfstand = 2.0,
}

-- =============================================
--  WAS LOCATIES — 40 echte vanille GTA V voordeur coords
--  Allemaal beloopbare panden: 24/7, Ammu-Nation,
--  Fleeca, wijnwinkel, kledingwinkel, kapper,
--  wasserette, pizzeria, bar, benzinestation enz.
-- =============================================
Config.WasLocaties = {

    -- === Deuren ===
    { label = 'Chinese Restaurant Deur',              coords = vector4(-664.3665, -1218.3593, 11.8129, 209.0504), targetAfstand = 2.0 },
    { label = 'Sandy Deur',              coords = vector4(1573.2875, 3614.8875, 35.4185, 298.9305), targetAfstand = 2.0 },
    { label = 'Sandy Deur 2 ',              coords = vector4(1657.4738, 4839.1128, 42.0230, 99.8423), targetAfstand = 2.0 },
    { label = 'Paleto Deur Loods',              coords = vector4(96.1477, 6363.0825, 31.3759, 210.3829), targetAfstand = 2.0 },
    { label = 'Pier Deur',              coords = vector4(-1594.2600, 5193.0659, 4.3101, 24.5193), targetAfstand = 2.0 },
    { label = 'Vissers Deur',              coords = vector4(3807.8037, 4478.5859, 6.3654, 27.9854), targetAfstand = 2.0 },
    { label = 'Frogor',              coords = vector4(2832.5625, 2800.0676, 57.4806, 282.3764), targetAfstand = 2.0 },
    { label = 'Idk meer',              coords = vector4(114.3881, -1961.2365, 21.3342, 205.9986), targetAfstand = 2.0 },
    { label = 'Villa Huis Deur',              coords = vector4(-747.3917, 808.3682, 215.1439, 112.6193), targetAfstand = 2.0 },
}

-- =============================================
--  DEEPWEB LOCATIES — 15 verlaten / afgelegen deuren
--  Port, industriegebied, woestijn, bergen, buitenwijken
-- =============================================
Config.DeepwebLocaties = {

    -- === PORT / ELYSIAN ISLAND ===
    { label = 'Loods achterdeur - Terminal',            coords = vector4(466.98,  -3006.02,   5.90,   92.0), targetAfstand = 2.0 },
    { label = 'Container kade - Elysian Island',        coords = vector4(274.30,  -2891.47,   5.91,   45.0), targetAfstand = 2.0 },
    { label = 'Cargo loods - LSIA',                     coords = vector4(-995.03, -2821.37,  13.95,  267.0), targetAfstand = 2.0 },

    -- === CYPRESS FLATS / LA MESA ===
    { label = 'Fabriekshal zijdeur - Cypress Flats',    coords = vector4(662.34,  -1012.18,  22.16,    2.0), targetAfstand = 2.0 },
    { label = 'Vleesverwerking - Cypress Flats',        coords = vector4(632.65,  -2046.66,  30.04,  271.0), targetAfstand = 2.0 },
    { label = 'Pakhuis achterdeur - La Mesa',           coords = vector4(774.51,  -1898.67,  26.17,  180.0), targetAfstand = 2.0 },
    { label = 'Verlaten garage - Murrieta Heights',     coords = vector4(869.67,  -1561.62,  30.10,   90.0), targetAfstand = 2.0 },

    -- === STRAWBERRY / DAVIS ===
    { label = 'Verlaten garage - Strawberry',           coords = vector4(133.90,  -1715.30,  29.29,  309.0), targetAfstand = 2.0 },
    { label = 'Bouwplaats ingang - Strawberry',         coords = vector4(193.07,  -1638.17,  29.29,   50.0), targetAfstand = 2.0 },

    -- === SANDY SHORES / WOESTIJN ===
    { label = 'Verlaten benzinestation - Sandy Shores', coords = vector4(1693.88,  3595.55,  35.61,   27.0), targetAfstand = 2.0 },
    { label = 'Boerderij - Grand Senora Desert',        coords = vector4(1384.75,  1128.53, 114.56,  192.0), targetAfstand = 2.0 },
    { label = 'Verlaten loods - Alamo Sea',             coords = vector4(2360.52,  4758.46,  34.07,  270.0), targetAfstand = 2.0 },

    -- === PALETO BAY / BLAINE COUNTY NOORD ===
    { label = 'Slachterij achterdeur - Paleto Bay',     coords = vector4(-615.56,  5344.61,  65.94,  316.0), targetAfstand = 2.0 },
    { label = 'Verlaten boerderij - Paleto',            coords = vector4(-829.29,  5375.03,  35.05,   90.0), targetAfstand = 2.0 },

    -- === CHUMASH ===
    { label = 'Verlaten loods - Chumash',               coords = vector4(-3198.73, 1111.42,  19.84,  180.0), targetAfstand = 2.0 },
}
-- =============================================