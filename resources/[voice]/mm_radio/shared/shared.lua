---@type number
Shared.MaxFrequency = 500.00 -- Max limiet van het radiokanaal

---@class Jammer
---@field state boolean
---@field model string
---@field permission string[]
---@field default table
---@field range table
---@type Jammer
Shared.Jammer = {
    state = false,
    model = 'sm_prop_smug_jammer',
    permission = {"police"},
    default = {},
    range = {
        min = 10.0,
        max = 100.0,
        step = 5.0,
        default = 30.0
    }
}

---@type string[]
Shared.RadioItem = {
    'radio'
}

---@class Battery
---@field state boolean
---@field consume number
---@field depletionTime number
---@type Battery
Shared.Battery = {
    state = false,
    consume = 1,
    depletionTime = 1, -- in minuten, elke minuut daalt batterij met consume waarde
}

---@type table<string, string>
Shared.RadioNames = {
    -- Politie kanalen 1-10
    ["1"] = "Politie KN#1",   ["1.%"] = "Politie KN#1",
    ["2"] = "Politie KN#2",   ["2.%"] = "Politie KN#2",
    ["3"] = "Politie KN#3",   ["3.%"] = "Politie KN#3",
    ["4"] = "Politie KN#4",   ["4.%"] = "Politie KN#4",
    ["5"] = "Politie KN#5",   ["5.%"] = "Politie KN#5",
    ["6"] = "Politie KN#6",   ["6.%"] = "Politie KN#6",
    ["7"] = "Politie KN#7",   ["7.%"] = "Politie KN#7",
    ["8"] = "Politie KN#8",   ["8.%"] = "Politie KN#8",
    ["9"] = "Politie KN#9",   ["9.%"] = "Politie KN#9",
    ["10"] = "Politie KN#10", ["10.%"] = "Politie KN#10",

    -- Gang kanalen
    ["420"] = "Ballas KN#1",  ["420.%"] = "Ballas KN#1",
    ["421"] = "LostMC KN#1",  ["421.%"] = "LostMC KN#1",
    ["422"] = "Vagos KN#1",   ["422.%"] = "Vagos KN#1",
}

-- Helper functie om politie/ambulance kanalen te genereren (DRY principe)
local function dienst_kanaal(kanaal_id)
    return {
        [kanaal_id] = {
            type = 'job',
            name = {"police", "ambulance"}
        }
    }
end

Shared.RestrictedChannels = {}

-- Vul kanalen 1 t/m 10 automatisch in
for i = 1, 10 do
    Shared.RestrictedChannels[i] = {
        type = 'job',
        name = {"police", "ambulance"}
    }
end

-- Gang kanalen
Shared.RestrictedChannels[420] = { type = 'gang', name = {"ballas"} }
Shared.RestrictedChannels[421] = { type = 'gang', name = {"lostmc"} }
Shared.RestrictedChannels[422] = { type = 'gang', name = {"vagos"} }

lib.locale()