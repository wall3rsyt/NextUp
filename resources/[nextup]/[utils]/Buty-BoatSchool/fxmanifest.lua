shared_script '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua'
fx_version 'adamant'
game 'gta5'

name "Buty-BoatSchool"
description "This script is a boat school"
author "Buty"

lua54 "yes"

shared_scripts {
    'shared/*'
}

client_scripts {
    'client/main.lua',
    'client/open.lua',
    'client/functions.lua',
    'client/nui.lua'
}

server_scripts {
    'server/sql.lua',
    'server/debug.lua',
    'server/open.lua',
    'server/main.lua'
}

ui_page 'html/index.html'

files { 'html/*', 'html/img/*' }

escrow_ignore {
	"shared/config.lua",
	"client/open.lua",
    "server/open.lua",
}
dependency '/assetpacks'