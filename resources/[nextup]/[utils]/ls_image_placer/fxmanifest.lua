shared_script '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua'
fx_version 'cerulean'
games      { 'gta5' }
lua54 'yes'

author 'Lith Studios | Swizz'
description 'Real-time image placement tool by Lith Studios'
version '1.2.7'

ui_page 'ui/ui.html'

--
-- Server
--

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/editable/frameworks.lua',
    'server/json.lua',
    'server/database.lua',
    'server/editable/server_config.lua',
    'server/server.lua',
    'server/editable/editable.lua',
}

--
-- Client
--

client_scripts {
    'config.lua',
    'client/functions.lua',
    'client/client.lua',
    'client/cache.lua',
    'client/editable/*'
}

escrow_ignore {
    'config.lua',
    'server/editable/editable.lua',
    'server/editable/server_config.lua',
    'server/editable/frameworks.lua',
    'client/editable/*'
}

files {
    'images/*.png',
    'images/*.jpg',
    'images/*.jpeg',
    'images/*.gif',
    'ui/ui.html',
    'ui/js/script.js',
    'ui/fonts/*.ttf',
    'ui/js/jqeury.js',
    'ui/gif.html',
    'images/data/data.json'
}

dependency '/assetpacks'