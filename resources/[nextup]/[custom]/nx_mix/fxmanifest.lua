shared_script '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua'
fx_version 'cerulean'
game 'gta5'
author 'nx'
description 'meerdere scripts'
version '1.1.0'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua',
}

client_scripts {
    'client/benen.lua',
    'client/firstperson.lua',
    'client/knockout.lua',
    'client/hostage.lua',
    'client/wapenoprug.lua',
    'client/Wapenanim.lua',
}

server_scripts {
    'server/knockout.lua',
    'server/hostage.lua',
}
