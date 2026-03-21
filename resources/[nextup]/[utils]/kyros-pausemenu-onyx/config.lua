
-- ██╗  ██╗██╗   ██╗██████╗  █████╗  ██████╗  ██████╗ ███╗   ███╗   █████╗ ███╗  ██╗██╗   ██╗██╗  ██╗
-- ██║ ██╔╝╚██╗ ██╔╝██╔══██╗██╔══██╗██╔════╝  ██╔══██╗████╗ ████║  ██╔══██╗████╗ ██║╚██╗ ██╔╝╚██╗██╔╝
-- █████═╝  ╚████╔╝ ██████╔╝██║  ██║╚█████╗   ██████╔╝██╔████╔██║  ██║  ██║██╔██╗██║ ╚████╔╝  ╚███╔╝ 
-- ██╔═██╗   ╚██╔╝  ██╔══██╗██║  ██║ ╚═══██╗  ██╔═══╝ ██║╚██╔╝██║  ██║  ██║██║╚████║  ╚██╔╝   ██╔██╗ 
-- ██║ ╚██╗   ██║   ██║  ██║╚█████╔╝██████╔╝  ██║     ██║ ╚═╝ ██║  ╚█████╔╝██║ ╚███║   ██║   ██╔╝╚██╗
-- ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝ ╚════╝ ╚═════╝   ╚═╝     ╚═╝     ╚═╝   ╚════╝ ╚═╝  ╚══╝   ╚═╝   ╚═╝  ╚═╝

Config = {}

--[[ 
    Framework Options:
    - "auto"       : Auto-detect QBCore or ESX
    - "qb"         : Force QBCore
    - "esx"        : Force ESX  
    - "standalone" : No framework (basic info only)
]]
Config.Framework = "qb"

-- Server Information
Config.ServerName = "NextUp"
Config.ServerTagline = "ROLEPLAY"         -- Text under server name (e.g., "ROLEPLAY", "SERIOUS RP")

-- Server Logo (place your logo in html/img/ folder)
-- Use "img/logo.png" for custom logo, or "" to show default icon
Config.ServerLogo = "img/logo.png"

-- Social Links (leave empty "" to hide)
Config.Discord = "https://discord.gg/NextUp"
Config.Website = "https://nextup-roleplay.tebex.io"

-- Visual Options
Config.EnableBlur = true              -- Blur background when menu is open
Config.MapStyle = "dark"         -- Map style: "greyscale", "color", or "dark"

-- Server Rules
-- Option 1: Set a URL to open rules in browser (leave empty "" to use modal instead)
Config.RulesURL = "https://wall3rsyt.github.io/NextUpApv"  -- Example: "https://yourserver.com/rules"

-- Option 2: Rules shown in modal (only used if RulesURL is empty)
Config.Rules = {
    "Respect all players and staff members at all times.",
    "No cheating, hacking, or exploiting game mechanics.",
    "No RDM (Random Deathmatch) or VDM (Vehicle Deathmatch).",
    "Stay in character while roleplaying in the server.",
    "No metagaming or powergaming under any circumstances.",
    "Use /report for any issues with other players."
}
