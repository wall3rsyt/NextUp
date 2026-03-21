shared_script '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

version '2.4.1'

client_script 'code/client.lua'

server_scripts {
    'code/server.lua',
    '@mysql-async/lib/MySQL.lua'
}

ui_page 'files/ui/index.html'

files {
    'files/ui/index.html',
    'files/ui/style.css',
    'files/sound/notification.mp3',
    'files/ui/script.js'
}

shared_script '@ox_lib/init.lua' -- Remove this line if you don't use ox_lib
dependency 'ox_lib' -- Remove this line if you don't use ox_lib
dependency '/assetpacks'