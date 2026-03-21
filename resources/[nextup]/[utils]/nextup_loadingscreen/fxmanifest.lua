shared_script '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua'
fx_version 'cerulean'
game 'gta5'

name 'NextUp Loading Screen'
description 'Premium FiveM Loading Screen by NextUp'
author 'NextUpRP'
version '1.0.0'

loadscreen 'html/index.html'
loadscreen_manual_shutdown 'yes'
loadscreen_cursor 'yes'

-- Escrow: deze bestanden worden versleuteld via Tebex/Portal
-- config.lua staat NIET in deze lijst → blijft leesbaar voor kopers
escrow_ignore {
  'config.lua',
}

files {
  'html/index.html',
  'html/style.css',
  'html/script.js',
  --'html/img/*.png',
  --'html/img/*.jpg',
  --'html/img/*.webp',
}

-- Client script (wordt versleuteld door escrow)
client_scripts {
  'client.lua',
}

-- Config wordt als laatste geladen zodat het beschikbaar is
shared_scripts {
  'config.lua',
}

dependency '/assetpacks'