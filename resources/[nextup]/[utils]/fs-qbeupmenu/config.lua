Config = {}

-- Definieer welke jobs toegang hebben tot welke categorieën
Config.AllowedJobs = {
    ["police"]          = {"Politie"},
    ["kmar"]            = {"Marechaussee"},
    ["dsi"]             = {"DSI"},
    ["ambulance"]       = {"Ambulance"},
    ["fire_department"] = {"Brandweer"},
    ["mechanic"]        = {"Pechhulp"},
    ["pechhulp"]        = {"Pechhulp"},
}

-- De eerste is het type identificator. Dit kan elk type zijn uit deze lijst:
-- https://docs.fivem.net/docs/scripting-reference/runtimes/lua/functions/GetPlayerIdentifiers/#license-types
-- De tweede is de waarde van de identificator.
Config.Admins = {
    {"discord", "x"},
    {"steam",   "x"},
    {"license", "x"},
    {"fivem",   "x"}
}

-- Admins hebben toegang tot alle categorieën
Config.AdminCategories = {
    "Politie",
    "Marechaussee",
    "DSI",
    "Ambulance",
    "Brandweer",
    "Pechhulp",
}

Config.UseMultiJob = false