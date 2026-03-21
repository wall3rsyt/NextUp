shared_script '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua'
fx_version  'cerulean'
game        'gta5'
lua54       'yes'

name        'vehiclehandler'
description 'Collision/damage handling for FiveM.'
author      'QuantumMalice'
repository  'https://github.com/QuantumMalice/vehiclehandler'
version '1.4.3'

files {
    'data/progress.lua',
    'data/vehicle.lua',
    'modules/handler.lua',
    'locales/*.json'
}

shared_script '@ox_lib/init.lua'
client_script 'client.lua'
server_script 'server.lua'

dependencies {
    'ox_lib',
}