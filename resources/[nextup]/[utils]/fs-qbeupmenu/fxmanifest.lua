shared_script '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua'
fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'LupoFG'
description 'fivemservices.nl'

files {
    'outfits.json',
    'config.lua'
}

client_scripts {
    'menu.lua'
}

server_scripts {
    'server.lua'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

escrow_ignore {
    'config.lua'
}
dependency '/assetpacks'