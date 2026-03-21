shared_script '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua'
fx_version 'cerulean'
game 'gta5'
author 'pScripts [tebex.pscripts.store]'
description 'Police MDT v2 with Dispatch'
lua54 'yes'
version '2.1.4'

ui_page 'web/build/index.html'

client_scripts {
	'editable/client.lua',
	'modules/**/client.lua',
	'modules/dispatch/client_alerts.lua',
	'modules/dispatch/menu_client.lua',
	'modules/dispatch/ps-dispatch-alerts.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'editable/server.lua',
	'modules/**/server.lua',
	'modules/base/version_check.lua',
	'config/server.lua'
}

shared_scripts {
	'@ox_lib/init.lua',
	'config/shared.lua'
}

files {
	'data/*.lua',
	'web/build/index.html',
	'web/build/**/*',
	'web/assets/*.png',
	'web/assets/sounds/*.mp3',
	'web/tiles/**/*',
	'web/tiles/**/**/*',
	'web/tiles/**/*.jpg',
	'web/tiles/**/**/*.jpg',
	'web/tiles/*.jpg',
	'web/tiles/*.png',
  	'locales/*.json'
}

escrow_ignore {
	'editable/*.lua',
	'data/*.lua',
	'config/*.lua',
	'modules/dispatch/ps-dispatch-alerts.lua',
	'modules/dispatch/client_alerts.lua',
	'modules/mysql/server.lua'
}

dependencies {
	'ox_lib',
	'p_bridge'
}

provide 'piotreq_gpt'
-- provide 'cd_dispatch'
-- provide 'lb-tablet'
-- provide 'ps-dispatch'
-- provide 'qs-dispatch'
dependency '/assetpacks'