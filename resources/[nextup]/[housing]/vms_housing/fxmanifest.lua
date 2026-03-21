shared_script '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'vames™'
description 'vms_housing'
version '1.3.0'

shared_scripts {
	'config/config.translation.lua',

	'config/config.lua',
	'config/config.integrations.lua',
	'config/config.regions.lua',

	'shared/*.lua',
	'integration/[shells]/*.lua',
	'integration/[ipl]/*.lua',
}

client_scripts {
	'config/config.client.lua',
	
	'integration/[weather]/*.lua',
	'integration/[clothing]/*.lua',
	'integration/[bossmenu]/*.lua',
	'integration/[garages]/**/client.lua',
	'integration/[inventory]/**/client.lua',
	'integration/[dispatch]/**/client.lua',
	'integration/[menu]/*.lua',

	'client/lib.lua',
	'client/init.lua',
	'client/functions.lua',
	'client/main.lua',
	'client/nui.lua',
	'client/modules/*.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	
	'config/config.webhooks.lua',
	'config/config.server.lua',

	'integration/[phone]/*.lua',
	'integration/[banking]/*.lua',
	'integration/[garages]/**/server.lua',
	'integration/[inventory]/**/server.lua',
	'integration/[dispatch]/**/server.lua',
	'integration/[migration]/*.lua',

	'server/version_check.lua',
	'server/init.lua',
	'server/lib.lua',
	'server/main.lua',
	'server/modules/*.lua',
}

ui_page 'html/ui.html'

files {
	'html/*.*',
	'html/**/*.*',
	'config/*.js',
	'config/*.json',
	'stream/*.ytyp',
}

data_file 'DLC_ITYP_REQUEST' 'stream/vms_housing_objects.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/vms_salesign.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/grass.ytyp'

escrow_ignore {
	'stream/prop_big_cin_screen.ydr',

	'integration/*.lua',
	'integration/**/*.lua',
	
	'config/*.lua',

	'server/version_check.lua',
}
dependency '/assetpacks'