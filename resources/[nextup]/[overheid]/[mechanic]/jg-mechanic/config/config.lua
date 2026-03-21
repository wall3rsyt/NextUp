Config = {}

-- Integrations
Config.Framework = "Qbox"
Config.Inventory = "ox_inventory"
Config.Notifications = "ox_lib"
Config.ProgressBar = "ox-circle"
Config.SkillCheck = "ox"
Config.DrawText = "ox_lib"
Config.SocietyBanking = "auto"
Config.Menus = "ox"

-- Localisatie
Config.Locale = "nl"
Config.NumberAndDateFormat = "nl-NL"
Config.Currency = "EUR"

-- Job systeem
Config.UseFrameworkJobs = true

-- Mechanic Tablet
Config.UseTabletCommand = "tablet"
Config.TabletConnectionMaxDistance = 5.0

-- Shops
Config.Target = "ox_target"
Config.UseSocietyFund = true
Config.PlayerBalance = "bank"

-- Skill Bars
Config.UseSkillbars = true
Config.ProgressBarDuration = 8000
Config.MaximumSkillCheckAttempts = 3
Config.SkillCheckDifficulty = { "easy", "easy", "medium", "medium", "hard" }
Config.SkillCheckInputs = { "w", "a", "s", "d" }

-- Servicing (Onderhoud)
Config.EnableVehicleServicing = true
Config.ServiceRequiredThreshold = 25
Config.ServicingBlacklist = {
  "police", "police2", "police3", "police4",
  "ambulance", "firetruk",
  "riot", "fbi", "fbi2"
}

-- Nitrous (NOS)
Config.NitrousScreenEffects = true
Config.NitrousRearLightTrails = true
Config.NitrousPowerIncreaseMult = 1.75
Config.NitrousDefaultKeyMapping = "RMENU"
Config.NitrousMaxBottlesPerVehicle = 2
Config.NitrousBottleDuration = 8
Config.NitrousBottleCooldown = 6
Config.NitrousPurgeDrainRate = 0.15

-- Stancing
Config.StanceMinSuspensionHeight = -0.25
Config.StanceMaxSuspensionHeight = 0.25
Config.StanceMinCamber = 0.0
Config.StanceMaxCamber = 0.4
Config.StanceMinTrackWidth = 0.6
Config.StanceMaxTrackWidth = 1.2
Config.StanceNearbyVehiclesFreqMs = 750

-- Reparaties
Config.AllowFixingAtOwnedMechanicsIfNoOneOnDuty = true
Config.DuctTapeMinimumEngineHealth = 150.0
Config.DuctTapeEngineHealthIncrease = 200.0

-- Tuning
Config.TuningGiveInstalledItemBackOnRemoval = true

-- Locations
Config.UseCarLiftPrompt = "[E] Gebruik hefbrug"
Config.UseCarLiftKey = 38
Config.CustomiseVehiclePrompt = "[E] Voertuig aanpassen"
Config.CustomiseVehicleKey = 38

-- Vehicle Props
Config.UpdatePropsOnChange = true
Config.SmoothFirstGear = true
Config.ManualHighRPMNotifications = true

-- Misc
Config.UniqueBlips = true
Config.ModsPricesAsPercentageOfVehicleValue = true
Config.AdminsHaveEmployeePermissions = true
Config.MechanicEmployeesCanSelfServiceMods = false
Config.FullRepairAdminCommand = "vfix"
Config.MechanicAdminCommand = "mechanicadmin"
Config.ChangePlateDuringPreview = "PREVIEW"
Config.RequireManagementForOrderDeletion = false 
Config.UseCustomNamesInTuningMenu = true
Config.DisableNoPaymentOptionForEmployees = false

-- Mechanic Locations
Config.MechanicLocations = {
  Bennys = {
    type = "self-service",
    logo = "bennys.png",
    locations = {
      {
        coords = vector3(-211.6, -1324.73, 30.23),
        size = 8.0,
        showBlip = true,
      }
    },
    blip = {
      id = 74,
      color = 5,
      scale = 0.7
    },
    mods = {
      repair           = { enabled = true, price = 750, percentVehVal = 0.015 },
      performance      = { enabled = true, price = 1000, percentVehVal = 0.02, priceMult = 0.15 },
      cosmetics        = { enabled = true, price = 500, percentVehVal = 0.01, priceMult = 0.1 },
      stance           = { enabled = true, price = 800, percentVehVal = 0.015 },
      respray          = { enabled = true, price = 600, percentVehVal = 0.012 },
      wheels           = { enabled = true, price = 400, percentVehVal = 0.008, priceMult = 0.1 },
      neonLights       = { enabled = true, price = 1500, percentVehVal = 0.02 },
      headlights       = { enabled = true, price = 300, percentVehVal = 0.005 },
      tyreSmoke        = { enabled = true, price = 500, percentVehVal = 0.008 },
      bulletproofTyres = { enabled = false }, -- Volledig uitgeschakeld
      extras           = { enabled = true, price = 200, percentVehVal = 0.005 }
    },
  },

  Pechhulp = {
    type = "owned",
    job = "mechanic",
    jobManagementRanks = {3, 4},
    logo = "ls_customs.png",
    commission = 15,
    locations = {
      {
        coords = vector3(-337.25, -137.2, 38.35),
        size = 6.5,
        showBlip = false,
      },
      {
        coords = vector3(-324.2, -132.0, 38.54),
        size = 3.5,
        showBlip = false,
        employeeOnly = true,
      }
    },
    blip = {
      id = 446,
      color = 0,
      scale = 0.9
    },
    mods = {
      repair           = { enabled = true, price = 500, percentVehVal = 0.01 },
      performance      = { enabled = true, price = 750, percentVehVal = 0.015, priceMult = 0.12 },
      cosmetics        = { enabled = true, price = 400, percentVehVal = 0.008, priceMult = 0.1 },
      stance           = { enabled = true, price = 600, percentVehVal = 0.012 },
      respray          = { enabled = true, price = 450, percentVehVal = 0.009 },
      wheels           = { enabled = true, price = 350, percentVehVal = 0.007, priceMult = 0.1 },
      neonLights       = { enabled = true, price = 1200, percentVehVal = 0.015 },
      headlights       = { enabled = true, price = 250, percentVehVal = 0.004 },
      tyreSmoke        = { enabled = true, price = 400, percentVehVal = 0.006 },
      bulletproofTyres = { enabled = false }, -- Volledig uitgeschakeld
      extras           = { enabled = true, price = 150, percentVehVal = 0.003 }
    },
    tuning = {
      engineSwaps      = { enabled = true, requiresItem = true },
      drivetrains      = { enabled = true, requiresItem = true },
      turbocharging    = { enabled = true, requiresItem = true },
      tyres            = { enabled = true, requiresItem = true },
      brakes           = { enabled = true, requiresItem = true },
      driftTuning      = { enabled = true, requiresItem = true },
      gearboxes        = { enabled = true, requiresItem = true },
    },
    carLifts = {
      vector4(-357.45, -114.17, 38.7, 339.89)
    },
    shops = {
      {
        name = "Onderhoud Onderdelen",
        coords = vector3(-345.54, -131.32, 39.01),
        size = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 47, g = 148, b = 209, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
        items = {
          { name = "engine_oil", label = "Motorolie", price = 75 },
          { name = "tyre_replacement", label = "Bandenset", price = 3500 },
          { name = "clutch_replacement", label = "Koppeling", price = 4000 },
          { name = "air_filter", label = "Luchtfilter", price = 450 },
          { name = "spark_plug", label = "Bougies (set)", price = 200 },
          { name = "suspension_parts", label = "Ophangingsonderdelen", price = 3500 },
          { name = "brakepad_replacement", label = "Remblokken", price = 2000 },
        },
      },
      {
        name = "Performance Upgrades",
        coords = vector3(-343.79, -139.92, 39.01),
        size = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 165, b = 0, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
        items = {
          { name = "turbocharger", label = "Turbo Lader", price = 35000 },
          { name = "v8_engine", label = "V8 Motor Upgrade", price = 55000 },
          { name = "ceramic_brakes", label = "Keramische Remmen", price = 20000 },
        },
      }
    },
    stashes = {
      {
        name = "Onderdelen Opslag",
        coords = vector3(-339.24, -132.2, 39.01),
        size = 2.0,
        usePed = false,
        pedModel = "s_m_m_lathandy_01",
        marker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 76, g = 175, b = 80, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
        slots = 20,
        weight = 100000,
      },
    }
  }
}

-- Elektrische voertuigen
Config.ElectricVehicles = {
  "airtug",     "buffalo5",   "caddy",
  "caddy2",     "caddy3",     "coureur",
  "cyclone",    "cyclone2",   "imorgon",
  "inductor",   "iwagen",     "khamelion",
  "metrotrain", "minitank",   "neon",
  "omnisegt",   "powersurge", "raiden",
  "rcbandito",  "surge",      "tezeract",
  "virtue",     "vivanite",   "voltic",
  "voltic2",
}

-- Performance opties
Config.DisableSound = false
Config.AutoRunSQL = false
Config.Debug = false