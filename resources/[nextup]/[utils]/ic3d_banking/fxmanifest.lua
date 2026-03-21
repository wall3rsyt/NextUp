shared_script '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
description 'Banking System (ESX & QBCore)'
author 'ic3d_'
version '1.3'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'locales.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

ui_page 'html/index.html'

files {
    'html/**'
}

dependency 'ox_lib'

server_exports {
    'GetAccount',
    'AddMoney',
    'RemoveMoney'
}

provide 'okokBanking'

escrow_ignore{'config.lua', 'locales.lua'}
dependency '/assetpacks'