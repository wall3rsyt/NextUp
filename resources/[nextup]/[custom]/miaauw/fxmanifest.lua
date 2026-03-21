shared_script '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua'
fx_version 'cerulean'
game 'gta5'

name 'scoreboard'
description 'NL RP Scoreboard - Qbox'
version '1.0.0'

escrow_ignore {
    'html/index.html',
    'html/images/*.png',
    'config.lua',
}

shared_scripts {
    'config.lua',
}

client_scripts {
    'client.lua',
}

server_scripts {
    'server.lua',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/images/politie.png',
    'html/images/ambu.png',
    'html/images/pech.png',
}