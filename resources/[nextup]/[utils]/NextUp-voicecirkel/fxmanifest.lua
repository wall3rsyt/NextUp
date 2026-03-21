shared_script '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua'
fx_version 'cerulean'
games { 'rdr3', 'gta5' }
author '<Discord : Errorism#0009>'
description 'This resource is created by Errorism\'s Scripts'
lua54 'yes'

client_scripts {
	'client/**/*',
    'config/cl.config.lua'
}

dependencies {
	'pma-voice',
    '/server:6129',                -- requires at least server build 6129
    '/onesync',                    -- requires onesync to be enabled
}