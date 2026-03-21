-- ============================================================
--  NextUp Loading Screen — Config
--  Dit bestand is NIET versleuteld. Pas hier alles aan.
-- ============================================================

Config = {}

-- Servernaam (getoond in de loading screen)
Config.ServerName = 'NextUp RP'

-- Max spelers (getoond in stats)
Config.MaxPlayers = 8

-- Uptime tekst
Config.Uptime = '99.9%'

-- Links voor de social buttons
Config.DiscordUrl = 'https://discord.gg/NextUP'
Config.WebsiteUrl = 'https://jouwwebsite.nl'
Config.ForumUrl   = 'https://forum.jouwwebsite.nl'

-- Tagline onder het logo
Config.Tagline = 'Premium Roleplay Experience'

-- Subtitel onder servernaam
Config.SubTitle = 'ROLEPLAY'

-- Aantal gesimuleerde online spelers (als er geen live API is)
Config.SimulatedPlayers = 94

-- Auto shutdown fallback (seconden) — veiligheidsnet als spawn nooit triggert
Config.AutoShutdownAfter = 30

-- Versie tag (linksonder)
Config.Version = 'v1.0.0'

-- Server regels (max 6 regels aanbevolen)
Config.Rules = {
  'Respecteer alle spelers. Toxisch gedrag leidt tot een permanente ban.',
  'RDM en VDM zijn ten strengste verboden. Altijd RP-reden vereist.',
  'Gebruik geen mods, cheats of exploits. Zero tolerance policy.',
  'Blijf altijd in karakter (IRP) tenzij anders aangegeven door staff.',
  'Meld problemen via Discord — niet in-game bij admins.',
  'Nieuw? Lees onze volledige regels op onze website.',
}

-- Live feed berichten (roteren automatisch)
Config.FeedEvents = {
  { dot = '',       text = 'Jaden_Brooks heeft zich aangemeld als politieagent' },
  { dot = 'red',    text = 'Alarm geactiveerd bij Fleeca Bank — Centrale Weg' },
  { dot = '',       text = 'Luna_Vasquez heeft een voertuig gekocht: Sultan RS' },
  { dot = 'purple', text = 'Event: Illegale races starten over 10 minuten' },
  { dot = '',       text = 'Marcus_Webb heeft een appartement gehuurd in Pillbox' },
  { dot = 'red',    text = 'Achtervolging actief — Eenheid 4 gevraagd' },
  { dot = '',       text = 'Nieuwe factie goedgekeurd: Eastside Collective' },
  { dot = 'purple', text = 'Heist afgerond — $340.000 buit gemeld' },
}
