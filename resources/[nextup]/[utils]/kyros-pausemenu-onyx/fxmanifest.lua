shared_script '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua'
fx_version 'cerulean'
game 'gta5'

author 'Kyros FiveM'
description 'Custom Pause Menu'
version '1.0.0'
lua54 'yes'

dependencies { 
    'kyros-pausemenu-onyx', -- ⚠️PLEASE READ⚠️; Requires kyros-pausemenu-onyx to work properly.
}

shared_scripts {
    'config.lua'
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/img/*.jpg',
    'html/img/*.png'
}


escrow_ignore {
    'config.lua',
}
dependency '/assetpacks'