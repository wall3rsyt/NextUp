--[[---------------------------------------------------------------------------------------
	Wraith ARS 2X — config.lua
	Aangepast voor Nederlandse FiveM server
	Origineel door WolfKnight — MIT License
---------------------------------------------------------------------------------------]]--

CONFIG = {}

-- ══════════════════════════════════════════════════════════════════════════════════════
--  FUNCTIONALITEIT
-- ══════════════════════════════════════════════════════════════════════════════════════

-- Snelheidslimiet vergrendeling (FAST box)
-- true = agenten kunnen een drempelsnelheid instellen; voertuigen erboven worden automatisch vergrendeld
CONFIG.allow_fast_limit         = true

-- FAST limiet bovenaan het menu tonen (handig voor dagelijks gebruik op snelwegen)
CONFIG.fast_limit_first_in_menu = true

-- Alleen echte spelers automatisch vergrendelen (geen NPC's) — realistischer voor RP
CONFIG.only_lock_players        = true

-- Snelstartgids tonen bij eerste gebruik
CONFIG.allow_quick_start_video  = true

-- Passagier (bijrijder) kan het scherm bekijken
CONFIG.allow_passenger_view     = true

-- Passagier kan de radar ook bedienen (false = alleen bestuurder)
CONFIG.allow_passenger_control  = false

-- Sonoran CAD integratie
CONFIG.use_sonorancad           = false


-- ══════════════════════════════════════════════════════════════════════════════════════
--  TOETSENBINDINGEN
--  Aanpasbaar per speler via: GTA Instellingen → Toetsenbindingen → FiveM
-- ══════════════════════════════════════════════════════════════════════════════════════
CONFIG.keyDefaults = {
	remote_control   = "f5",       -- Afstandsbediening openen/sluiten
	key_lock         = "l",        -- Toetsenbordvergrendeling aan/uit
	front_lock       = "numpad8",  -- Voorantenne vergrendelen/vrijgeven
	rear_lock        = "numpad5",  -- Achterantenne vergrendelen/vrijgeven
	plate_front_lock = "numpad9",  -- Kentekenlezer voor vergrendelen/vrijgeven
	plate_rear_lock  = "numpad6",  -- Kentekenlezer achter vergrendelen/vrijgeven
}


-- ══════════════════════════════════════════════════════════════════════════════════════
--  STANDAARD MENU-INSTELLINGEN
-- ══════════════════════════════════════════════════════════════════════════════════════
CONFIG.menuDefaults = {
	-- Snellere doelen weergeven in de FAST box
	fastDisplay = true,

	-- Detectiegevoeligheid (0.2 – 1.0)
	same        = 0.6,   -- zelfde rijrichting
	opp         = 0.6,   -- tegemoetkomend verkeer

	-- Geluidsvolumes (0.0 – 1.0)
	beep        = 0.6,   -- piep bij vergrendeling
	voice       = 0.6,   -- gesproken bevestiging
	plateAudio  = 0.6,   -- kentekenlezer audio

	-- !! BELANGRIJK: kmh voor Nederlandse wegen !!
	speedType   = "kmh",

	-- Automatische snelheidsvergrendeling
	fastLock    = false,

	-- Drempelsnelheid voor automatische vergrendeling (km/u)
	-- Snelweg: 130 | Buiten bebouwde kom: 80 | Bebouwde kom: 50
	fastLimit   = 80,
}


-- ══════════════════════════════════════════════════════════════════════════════════════
--  STANDAARD UI-INSTELLINGEN
-- ══════════════════════════════════════════════════════════════════════════════════════
CONFIG.uiDefaults = {
	-- Schaalgrootte per UI-element (0.25 – 2.5)
	scale = {
		radar       = 0.75,
		remote      = 0.75,
		plateReader = 0.75,
	},

	-- Veiligheidszone in pixels (meervoud van 5, bereik: 0 – 100)
	safezone = 20,
}