-- Wraith ARS 2X — fxmanifest.lua
-- Aangepast voor wk_wars2x NL build
-- Origineel door WolfKnight — MIT License © 2020-2021

fx_version "cerulean"
game      "gta5"

name        "Wraith ARS 2X"
description "Politie radar en kentekenlezer systeem voor FiveM"
author      "WolfKnight"
version     "1.3.1"

-- Gedeeld script (lore-friendly voertuigpack)
shared_script "@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua"

-- NUI bestanden
ui_page "nui/radar.html"

files {
	"nui/radar.html",
	"nui/radar.css",
	"nui/radar.js",
	"nui/images/*.png",
	"nui/images/plates/*.png",
	"nui/fonts/*.ttf",
	"nui/fonts/Segment7Standard.otf",
	"nui/sounds/*.ogg",
}

-- Server scripts (volgorde: versiecheck → exports → sync)
server_scripts {
	"sv_version_check.lua",
	"sv_exports.lua",
	"sv_sync.lua",
}
server_export "TogglePlateLock"

-- Client scripts (volgorde: config → utils → speler → radar → lezer → sync)
client_scripts {
	"config.lua",
	"cl_utils.lua",
	"cl_player.lua",
	"cl_radar.lua",
	"cl_plate_reader.lua",
	"cl_sync.lua",
}