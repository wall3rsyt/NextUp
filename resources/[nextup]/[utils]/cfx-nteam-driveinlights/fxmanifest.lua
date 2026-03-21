shared_script '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'Drive-In Cinema Light Controller'
description 'By NTeam Development'
version '1.0.0'

client_scripts {
    'config.lua',
    'client.lua'
}

server_scripts {
    'server.lua'
}

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/style.css',
    'ui/script.js'
}

escrow_ignore {
    'config.lua'
}

dependency '/assetpacks'
dependency '/assetpacks'