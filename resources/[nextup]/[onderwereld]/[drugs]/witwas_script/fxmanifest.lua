shared_script '@rola-lore-friendly-pack-v2-RESOURCE-FOUR/init.lua'
fx_version 'cerulean'
game 'gta5'
author 'Witwas Script'
description 'Witwas Script v5.0 - Multi Framework | Auto Detect | Token Security | 19 Languages'
version '5.0.0'

shared_scripts {
    '@ox_lib/init.lua',        -- VERPLICHT: ox_lib
    'shared/framework.lua',    -- auto-detect framework & inventory
    'config.lua',              -- configuratie (stel hier Config.Locale in)
    'locales/locales.lua',     -- alle 19 talen, laadt automatisch op basis van Config.Locale
}

client_scripts {
    'client/ped.lua',      -- start ped spawning & animatie
    'client/ui.lua',       -- markers, proximity loop, interactie systeem
    'client/main.lua',     -- workflow logica
}

server_scripts {
    'server/framework.lua',  -- ESX / QBCore / QBox + inventory bridge
    'server/token.lua',      -- token beveiligingssysteem
    'server/main.lua',       -- sessie management, was logica, discord logging
}

-- =============================================
--  ESCROW IGNORE
--  Deze bestanden worden NIET beschermd —
--  klanten kunnen ze vrijuit aanpassen
-- =============================================
escrow_ignore {
    'config.lua',
    'locales/locales.lua',
}

dependencies {
    'ox_lib',
}

lua54 'yes'
dependency '/assetpacks'
dependency '/assetpacks'