Config = {}

-- Language: 'en' | 'de' | 'fr' | 'es' | 'pt' | 'it' | 'nl' | 'pl' | 'tr' | 'cs' | 'ro' | 'ru' | 'sv'
Config.Locale = 'nl'

-- Framework: 'auto' | 'qb' | 'esx' | 'standalone'
Config.Framework = 'auto'

-- Notification system: 'agency-notify' | 'framework'
-- agency-notify (default): https://agency-script.tebex.io/package/6937769
-- framework: Uses QBCore/ESX built-in notifications
-- If standalone, agency-notify is required!
Config.NotifySystem = 'agency-notify'

-- Key to interact with elevator (default: E)
Config.InteractKey = 38 -- E

-- Distance to show marker / interact
Config.MarkerDistance = 15.0
Config.InteractDistance = 2.0

-- Marker settings
Config.Marker = {
    type = 20,
    scale = vec3(0.5, 0.5, 0.3),
    color = {r = 59, g = 130, b = 246, a = 180},
    bobUpAndDown = true,
    rotate = true,
}

-- Travel time in ms (simulated elevator travel)
Config.TravelTime = 1000

-- Screen effect during travel
Config.ScreenEffect = true

-- Ding sound on arrival (GTA native sound)
Config.DingSound = true

-- Configurator command (admin only)
Config.ConfiguratorCommand = 'aelevator'

-- Ace permission for configurator (set to false to allow everyone)
Config.ConfiguratorPermission = 'command.aelevator'
