local function flags(...)
    local t = {}
    for _, v in ipairs({...}) do t[v] = true end
    return t
end

return {
    units            = 'kmh',   -- (mph, kmh)
    breaktire        = true,    -- Enable/Disable breaking off vehicle wheel on impact
    threshold = {
        health = 50.0,          -- Health difference needed to break off wheel
        speed  = 50.0,          -- Speed difference needed to break off wheel
        heavy  = 90.0,          -- Speed difference needed to disable vehicle instantly
    },
    globalmultiplier = 20.0,    -- Base damage multiplier (lower = less damage)
    classmultiplier = {         -- Add-on damage multiplier per vehicle class
        [0] = 1.0,              -- Compacts
              1.0,              -- Sedans
              1.0,              -- SUVs
              0.95,             -- Coupes
              1.0,              -- Muscle
              0.95,             -- Sports Classics
              0.95,             -- Sports
              0.95,             -- Super
              0.47,             -- Motorcycles
              0.7,              -- Off-road
              0.25,             -- Industrial
              0.35,             -- Utility
              0.85,             -- Vans
              1.0,              -- Bicycles
              0.4,              -- Boats
              0.7,              -- Helicopters
              0.7,              -- Planes
              0.75,             -- Service
              0.35,             -- Emergency
              0.27,             -- Military
              0.43,             -- Commercial
              0.1,              -- Trains
              1.0,              -- Open Wheel
    },
    regulated = {               -- Prevent controls while flipped/airborne per class
        [0] = true,             -- Compacts
              true,             -- Sedans
              true,             -- SUVs
              true,             -- Coupes
              true,             -- Muscle
              true,             -- Sports Classics
              true,             -- Sports
              true,             -- Super
              false,            -- Motorcycles
              true,             -- Off-road
              true,             -- Industrial
              true,             -- Utility
              true,             -- Vans
              false,            -- Bicycles
              false,            -- Boats
              false,            -- Helicopters
              false,            -- Planes
              true,             -- Service
              true,             -- Emergency
              false,            -- Military
              true,             -- Commercial
              false,            -- Trains
              true,             -- Open Wheel
    },
    exclusions = flags(         -- Models excluded from rotation control despite regulated class
        `deluxo`, `scramjet`, `vigilante`
    ),
    backengine = flags(         -- Models with rear-mounted engines
        `ninef`,    `adder`,     `vagner`,    `t20`,       `infernus`,
        `zentorno`, `reaper`,    `comet2`,    `jester`,    `jester2`,
        `cheetah`,  `cheetah2`,  `prototipo`, `turismor`,  `pfister811`,
        `ardent`,   `nero`,      `nero2`,     `tempesta`,  `vacca`,
        `bullet`,   `osiris`,    `entityxf`,  `turismo2`,  `fmj`,
        `re7b`,     `tyrus`,     `italigtb`,  `penetrator`,`monroe`,
        `ninef2`,   `stingergt`, `surfer`,    `surfer2`,   `comet3`
    ),
}