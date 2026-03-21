-----------------------------------------------------------------------------------
-- WAIT! Before editing this file manually, try our new easy configuration tool! --
--            https://configurator.jgscripts.com/advanced-garages                --
-----------------------------------------------------------------------------------
Config = {}

-- Localisatie
Config.Locale = "nl"
Config.NumberAndDateFormat = "nl-NL"
Config.Currency = "EUR"

-- Framework & Integraties
Config.Framework = "Qbox"
Config.FuelSystem = "ox_fuel"
Config.VehicleKeys = "auto"
Config.Notifications = "ox_lib"
Config.Banking = "auto"
Config.Gangs = "auto"

-- UI Prompts
Config.DrawText = "ox_lib"
Config.OpenGarageKeyBind = 38
Config.OpenGaragePrompt = "[E] Garage openen"
Config.OpenImpoundKeyBind = 38
Config.OpenImpoundPrompt = "[E] Depot openen"
Config.InsertVehicleKeyBind = 38
Config.InsertVehiclePrompt = "[E] Voertuig opslaan"
Config.ExitInteriorKeyBind = 38
Config.ExitInteriorPrompt = "[E] Garage verlaten"

-- Target (UIT voor performance)
Config.UseTarget = false
Config.Target = "ox_target"
Config.TargetPed = "s_m_y_valet_01"

-- Radial (UIT voor performance)
Config.UseRadialMenu = false
Config.RadialMenu = "ox_lib"

Config.ShowVehicleImages = true

-- Voertuig Spawning & Opslaan
Config.DoNotSpawnInsideVehicle = false
Config.SaveVehicleDamage = true
Config.AdvancedVehicleDamage = true
Config.SaveVehiclePropsOnInsert = true
Config.CheckVehicleModel = true
Config.SpawnVehiclesWithServerSetter = false -- Beter voor sync

-- Voertuig Transfers
Config.GarageVehicleTransferCost = 750 -- Realistischer voor NL
Config.TransferHidePlayerNames = false
Config.EnableTransfers = {
  betweenGarages = true,
  betweenPlayers = true
}
Config.DisableTransfersToUnregisteredGarages = true

-- Voorkom voertuig duplicatie
Config.AllowInfiniteVehicleSpawns = false
Config.JobGaragesAllowInfiniteVehicleSpawns = false
Config.GangGaragesAllowInfiniteVehicleSpawns = false
Config.GarageVehicleReturnCost = 3500 -- Realistischer sleepkosten
Config.GarageVehicleReturnCostSocietyFund = false

-- Standaard marker instellingen (herbruikbaar)
local defaultMarker = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, rotate = 1 }
local defaultCarBlip = { id = 569, color = 3, scale = 0.7 }
local defaultJobBlip = { id = 357, color = 0, scale = 0.65 }
local defaultImpoundBlip = { id = 68, color = 1, scale = 0.65 }

-- Publieke Garages
Config.GarageShowBlips = true
Config.GarageUniqueBlips = false
Config.GarageUniqueLocations = true
Config.GarageEnableInteriors = false
Config.GarageLocations = {

  ["Centrum"] = {
    coords = vector3(215.09, -805.17, 30.81),
    spawn = {
      vector4(216.84, -802.02, 30.78, 69.82),
      vector4(218.09, -799.42, 30.76, 66.17),
      vector4(219.29, -797.23, 30.75, 65.40),
      vector4(219.59, -794.44, 30.75, 69.35),
      vector4(220.63, -792.03, 30.75, 63.76),
      vector4(206.81, -798.35, 30.99, 248.53)
    },
    distance = 12.0,
    type = "car",
    hideBlip = false,
    hideMarkers = false,
    blip = defaultCarBlip,
    markers = defaultMarker,
  },

  ["Alta"] = {
    coords = vector3(273.0, -343.85, 44.91),
    spawn = vector4(270.75, -340.51, 44.92, 342.03),
    distance = 10.0,
    type = "car",
    hideBlip = false,
    hideMarkers = false,
    blip = defaultCarBlip,
    markers = defaultMarker,
  },

  ["Davis"] = {
    coords = vector3(14.66, -1728.52, 29.3),
    spawn = vector4(23.93, -1722.9, 29.3, 310.58),
    distance = 10.0,
    type = "car",
    hideBlip = false,
    hideMarkers = false,
    blip = defaultCarBlip,
    markers = defaultMarker,
  },

  ["Mirror Park"] = {
    coords = vector3(1032.84, -765.1, 58.18),
    spawn = vector4(1023.2, -764.27, 57.96, 319.66),
    distance = 10.0,
    type = "car",
    hideBlip = false,
    hideMarkers = false,
    blip = defaultCarBlip,
    markers = defaultMarker,
  },

  ["Strand"] = {
    coords = vector3(-1248.69, -1425.71, 4.32),
    spawn = vector4(-1244.27, -1422.08, 4.32, 37.12),
    distance = 10.0,
    type = "car",
    hideBlip = false,
    hideMarkers = false,
    blip = defaultCarBlip,
    markers = defaultMarker,
  },

  ["Chumash"] = {
    coords = vector3(-2961.58, 375.93, 15.02),
    spawn = vector4(-2964.96, 372.07, 14.78, 86.07),
    distance = 10.0,
    type = "car",
    hideBlip = false,
    hideMarkers = false,
    blip = defaultCarBlip,
    markers = defaultMarker,
  },

  ["Sandy Shores Zuid"] = {
    coords = vector3(217.33, 2605.65, 46.04),
    spawn = vector4(216.94, 2608.44, 46.33, 14.07),
    distance = 10.0,
    type = "car",
    hideBlip = false,
    hideMarkers = false,
    blip = defaultCarBlip,
    markers = defaultMarker,
  },

  ["Sandy Shores Noord"] = {
    coords = vector3(1878.44, 3760.1, 32.94),
    spawn = vector4(1880.14, 3757.73, 32.93, 215.54),
    distance = 10.0,
    type = "car",
    hideBlip = false,
    hideMarkers = false,
    blip = defaultCarBlip,
    markers = defaultMarker,
  },

  ["Vinewood"] = {
    coords = vector3(365.21, 295.65, 103.46),
    spawn = vector4(364.84, 289.73, 103.42, 164.23),
    distance = 10.0,
    type = "car",
    hideBlip = false,
    hideMarkers = false,
    blip = defaultCarBlip,
    markers = defaultMarker,
  },

  ["Grapeseed"] = {
    coords = vector3(1713.06, 4745.32, 41.96),
    spawn = vector4(1710.64, 4746.94, 41.95, 90.11),
    distance = 10.0,
    type = "car",
    hideBlip = false,
    hideMarkers = false,
    blip = defaultCarBlip,
    markers = defaultMarker,
  },

  ["Paleto Bay"] = {
    coords = vector3(107.32, 6611.77, 31.98),
    spawn = vector4(110.84, 6607.82, 31.86, 265.28),
    distance = 10.0,
    type = "car",
    hideBlip = false,
    hideMarkers = false,
    blip = defaultCarBlip,
    markers = defaultMarker,
  },

  ["Haven"] = {
    coords = vector3(-795.15, -1510.79, 1.6),
    spawn = vector4(-798.66, -1507.73, -0.47, 102.23),
    distance = 15.0,
    type = "sea",
    hideBlip = false,
    hideMarkers = false,
    blip = { id = 356, color = 3, scale = 0.7 },
    markers = defaultMarker,
  },

  ["Vliegveld"] = {
    coords = vector3(-1243.49, -3391.88, 13.94),
    spawn = vector4(-1258.4, -3394.56, 13.94, 328.23),
    distance = 15.0,
    type = "air",
    hideBlip = false,
    hideMarkers = false,
    blip = { id = 359, color = 3, scale = 0.65 },
    markers = defaultMarker,
  }
}

-- Privé Garages
Config.PrivGarageCreateCommand = "privgarage"
Config.PrivGarageCreateJobRestriction = { "realestate", "makelaardij" }
Config.PrivGarageEnableInteriors = false
Config.PrivGarageHideBlips = true -- Privé garages geen blips
Config.PrivGarageBlip = { id = 357, color = 0, scale = 0.6 }

-- Werk Garages
Config.JobGarageShowBlips = true
Config.JobGarageSetVehicleCommand = "setwerkvoertuig"
Config.JobGarageRemoveVehicleCommand = "verwijderwerkvoertuig"
Config.JobGarageUniqueBlips = true
Config.JobGarageUniqueLocations = true
Config.JobGarageEnableInteriors = false -- Performance
Config.JobGarageLocations = {

  ["Garage Monteur"] = {
    coords = vector3(157.86, -3005.9, 7.03),
    spawn = vector4(165.26, -3014.94, 5.9, 268.8),
    distance = 10.0,
    job = { "mechanic" },
    type = "car",
    hideBlip = false,
    hideMarkers = false,
    blip = { id = 446, color = 47, scale = 0.65 },
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 165, b = 0, a = 120 }, rotate = 1 },
    vehiclesType = "owned",
  },

  ["Garage Politie"] = {
    coords = vector3(434.48, -1016.97, 28.83),
    spawn = {
      vector4(434.55, -1014.54, 28.49, 91.56),
      vector4(436.89, -1018.32, 28.49, 91.56),
      vector4(438.91, -1022.10, 28.49, 91.56),
    },
    distance = 10.0,
    job = { "police" },
    type = "car",
    hideBlip = false,
    hideMarkers = false,
    blip = { id = 330, color = 38, scale = 0.65 },
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 0, g = 100, b = 255, a = 120 }, rotate = 1 },
    vehiclesType = "spawner",
    showLiveriesExtrasMenu = true,
    vehicles = {
      {
        model = "police",
        plate = "POLI",
        minJobGrade = 0,
        nickname = "Surveillance voertuig",
        livery = 1,
        extras = { 1, 2 },
        maxMods = true
      },
      {
        model = "police2",
        plate = "POLI",
        minJobGrade = 2,
        nickname = "Snelweg politie",
        livery = 2,
        extras = {},
        maxMods = true
      },
      {
        model = "police3",
        plate = "POLI",
        minJobGrade = 3,
        nickname = "Onopvallend voertuig",
        livery = 0,
        extras = {},
        maxMods = true
      }
    }
  },

  ["Garage Ambulance"] = {
    coords = vector3(311.29, -592.87, 43.28),
    spawn = vector4(313.56, -590.12, 43.02, 68.92),
    distance = 10.0,
    job = { "ambulance" },
    type = "car",
    hideBlip = false,
    hideMarkers = false,
    blip = { id = 61, color = 1, scale = 0.65 },
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 0, b = 0, a = 120 }, rotate = 1 },
    vehiclesType = "spawner",
    showLiveriesExtrasMenu = true,
    vehicles = {
      {
        model = "ambulance",
        plate = "AMBU",
        minJobGrade = 0,
        nickname = "Ambulance",
        livery = 0,
        extras = {},
        maxMods = true
      }
    }
  }
}

-- Gang Garages
Config.GangEnableCustomESXIntegration = false
Config.GangGarageShowBlips = false -- Geen blips voor gangs (realistischer)
Config.GangGarageSetVehicleCommand = "setgangvoertuig"
Config.GangGarageRemoveVehicleCommand = "verwijdergangvoertuig"
Config.GangGarageUniqueBlips = false
Config.GangGarageUniqueLocations = true
Config.GangGarageEnableInteriors = false -- Performance
Config.GangGarageLocations = {

  ["Lost MC Clubhuis"] = {
    coords = vector3(439.18, -1518.48, 29.28),
    spawn = vector4(439.18, -1518.48, 29.28, 139.06),
    distance = 8.0,
    gang = { "lostmc" },
    type = "car",
    hideBlip = true,
    hideMarkers = false,
    blip = defaultJobBlip,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 139, g = 69, b = 19, a = 120 }, rotate = 1 },
    vehiclesType = "personal",
  }
}

-- Depots
Config.ImpoundCommand = "inbeslagname"
Config.ImpoundFeesSocietyFund = "police"
Config.ImpoundShowBlips = true
Config.ImpoundUniqueBlips = false
Config.ImpoundTimeOptions = { 0, 1, 2, 4, 8, 12, 24, 48, 72, 168 } -- Meer opties
Config.ImpoundLocations = {

  ["Depot Los Santos"] = {
    coords = vector3(410.8, -1626.26, 29.29),
    spawn = {
      vector4(408.44, -1630.88, 29.29, 136.88),
      vector4(401.52, -1637.21, 29.29, 136.88),
    },
    distance = 10.0,
    type = "car",
    job = { "police" },
    hideBlip = false,
    hideMarkers = false,
    blip = defaultImpoundBlip,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 100, b = 100, a = 120 }, rotate = 1 },
  },

  ["Depot Sandy Shores"] = {
    coords = vector3(1649.71, 3789.61, 34.79),
    spawn = vector4(1643.66, 3798.36, 34.49, 216.16),
    distance = 10.0,
    type = "car",
    job = { "police" },
    hideBlip = false,
    hideMarkers = false,
    blip = defaultImpoundBlip,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 100, b = 100, a = 120 }, rotate = 1 },
  },

  ["Depot Paleto Bay"] = {
    coords = vector3(-211.93, 6219.27, 31.49),
    spawn = vector4(-224.83, 6218.59, 31.49, 315.32),
    distance = 10.0,
    type = "car",
    job = { "police" },
    hideBlip = false,
    hideMarkers = false,
    blip = defaultImpoundBlip,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 100, b = 100, a = 120 }, rotate = 1 },
  }
}

-- Garage Interieur
Config.GarageInteriorEntrance = vector4(227.96, -1003.06, -99.0, 0.0)
Config.GarageInteriorCameraCutscene = {
  vector4(227.96, -977.81, -98.99, 0.0),
  vector4(227.96, -1006.96, -98.99, 0.0),
}
Config.GarageInteriorVehiclePositions = {
  vector4(233.0, -984.0, -99.41, 118.0),
  vector4(233.0, -988.5, -99.41, 118.0),
  vector4(233.0, -993.0, -99.41, 118.0),
  vector4(233.0, -997.5, -99.41, 118.0),
  vector4(233.0, -1002.0, -99.41, 118.0),
  vector4(223.6, -979.0, -99.41, 235.2),
  vector4(223.6, -983.6, -99.41, 235.2),
  vector4(223.6, -988.2, -99.41, 235.2),
  vector4(223.6, -992.8, -99.41, 235.2),
  vector4(223.6, -997.4, -99.41, 235.2),
  vector4(223.6, -1002.0, -99.41, 235.2),
}

-- Staff Commando's (Nederlands)
Config.ChangeVehiclePlate = "kenteken"
Config.DeleteVehicleFromDB = "verwijdervoertuig"
Config.ReturnVehicleToGarage = "terugzetgarage"

-- Voertuig Labels
Config.VehicleLabels = {
  ["police"] = "Politie Voertuig",
  ["police2"] = "Snelweg Politie",
  ["police3"] = "Onopvallende Politie",
  ["ambulance"] = "Ambulance",
}

-- Transfer blacklist (hulpdiensten)
Config.PlayerTransferBlacklist = {
  "police",
  "police2",
  "police3",
  "police4",
  "ambulance",
  "firetruk",
  "fbi",
  "fbi2",
  "riot"
}

-- Performance & Debug
Config.AutoRunSQL = true
Config.ReturnToPreviousRoutingBucket = true
Config.HideWatermark = true
Config.__v3Config = true
Config.Debug = false