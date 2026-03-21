shared_script '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua'
fx_version 'cerulean'
game 'gta5'

name 'Agency-Elevator'
description 'Advanced Elevator System with modern NUI - QB / ESX / Standalone'
author 'Agency-Scripts'
version '1.1.5'

lua54 'yes'

dependencies {
    'oxmysql',
}

shared_scripts {
    'shared/locales.lua',
    'shared/locale/*.lua',
    'config.lua',
}

client_scripts {
    'client/main.lua',
    'client/configurator.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/configurator.lua',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
}

escrow_ignore {
    'config.lua',
    'shared/locales.lua',
    'shared/locale/*.lua',
    'sql/install.sql',
}

dependency '/assetpacks'