Config = {}

-- ─────────────────────────────────────────────────────────────
-- LOKALISATIE
-- ─────────────────────────────────────────────────────────────
Config.Locale              = "nl"
Config.NumberAndDateFormat = "nl-NL"
Config.Currency            = "€%s"
Config.SpeedUnit           = "kph"
Config.DistanceUnit        = "km"

-- ─────────────────────────────────────────────────────────────
-- FRAMEWORK & INTEGRATIES
-- ─────────────────────────────────────────────────────────────
Config.Framework     = "Qbox"
Config.FuelSystem    = "ox_fuel"
Config.VehicleKeys   = "auto"
Config.Notifications = "ox_lib"

-- ─────────────────────────────────────────────────────────────
-- INTERACTIES
-- ─────────────────────────────────────────────────────────────
Config.InteractionMethod = "textui"
Config.DrawText          = "auto"
Config.Target            = "auto"
Config.DrawText3d        = "auto"
Config.RadialMenu        = "auto"

-- ─────────────────────────────────────────────────────────────
-- FRAMEWORK JOBS
-- ─────────────────────────────────────────────────────────────
Config.UseFrameworkJobs = true

-- ─────────────────────────────────────────────────────────────
-- TEXT UI PROMPTS (Nederlands)
-- ─────────────────────────────────────────────────────────────
Config.OpenShowroomPrompt      = "[E] Showroom openen"
Config.OpenShowroomKeyBind     = 38
Config.ViewInShowroomPrompt    = "[E] Bekijk in showroom"
Config.ViewInShowroomKeyBind   = 38
Config.OpenManagementPrompt    = "[E] Beheer dealership"
Config.OpenManagementKeyBind   = 38
Config.SellVehiclePrompt       = "[E] Voertuig verkopen"
Config.SellVehicleKeyBind      = 38
Config.SpawnVehiclesWithServerSetter = false

-- ─────────────────────────────────────────────────────────────
-- FINANCIERING
-- ─────────────────────────────────────────────────────────────
Config.FinancePayments                    = 12
Config.FinanceDownPayment                 = 0.1
Config.FinanceInterest                    = 0.1
Config.FinancePaymentInterval             = 12
Config.FinancePaymentFailedHoursUntilRepo = 1
Config.MaxFinancedVehiclesPerPlayer       = 5
Config.FinanceProcessOfflinePlayers       = true
Config.ShowVehicleImages                  = true

-- ─────────────────────────────────────────────────────────────
-- VOERTUIG AANKOPEN
-- ─────────────────────────────────────────────────────────────
Config.PlateFormat      = "AA^2^4 AAA"
Config.HideVehicleStats = false

-- ─────────────────────────────────────────────────────────────
-- PROEFRITTEN
-- ─────────────────────────────────────────────────────────────
Config.TestDrivePlate                = "PROEF111"
Config.TestDriveTimeSeconds          = 120
Config.TestDriveNotInBucket          = false
Config.DealershipMaxActiveTestDrives = 5

-- ─────────────────────────────────────────────────────────────
-- DISPLAY VOERTUIGEN (showroom)
-- ─────────────────────────────────────────────────────────────
Config.DisplayVehiclesPlate              = "DEALER"
Config.DisplayVehiclesHidePurchasePrompt = false

-- ─────────────────────────────────────────────────────────────
-- DEALERSHIP VOORRAAD INKOOP
-- ─────────────────────────────────────────────────────────────
Config.TruckingMissionForOrderDeliveries = true
Config.DealerPurchasePrice               = 0.8
Config.VehicleOrderTime                  = 1
Config.ManagerCanChangePriceOfVehicles   = true

-- ─────────────────────────────────────────────────────────────
-- BLIP NAAM FORMAAT
-- ─────────────────────────────────────────────────────────────
Config.BlipNameFormat = "Dealership: %s"

-- ─────────────────────────────────────────────────────────────
-- CATEGORIEËN (Nederlands) — origineel, alle categorieën
-- ─────────────────────────────────────────────────────────────
Config.Categories = {
    planes         = "Vliegtuigen",
    sportsclassics = "Sport Klassiekers",
    sedans         = "Sedans",
    compacts       = "Compacten",
    motorcycles    = "Motorfietsen",
    super          = "Super",
    offroad        = "Offroad",
    helicopters    = "Helikopters",
    coupes         = "Coupés",
    muscle         = "Muscle",
    boats          = "Boten",
    vans           = "Bestelwagens",
    sports         = "Sportwagens",
    suvs           = "SUV's",
    commercial     = "Commercieel",
    cycles         = "Fietsen",
    industrial     = "Industrieel",
}

-- ─────────────────────────────────────────────────────────────
-- MEDEWERKER PERMISSIES
-- ─────────────────────────────────────────────────────────────
Config.EmployeePermissions = {
    ["Manager"] = {
        "ADMIN",
    },
    ["Supervisor"] = {
        "MANAGE_INVENTORY",
        "VIEW_RECORDS",
        "SELL",
        "DELIVER",
    },
    ["Verkoper"] = {
        "SELL",
        "VIEW_RECORDS",
        "DELIVER",
    },
}

-- ─────────────────────────────────────────────────────────────
-- COMMANDO'S (Nederlands)
-- ─────────────────────────────────────────────────────────────
Config.MyFinanceCommand   = "mijnfinanciering"
Config.DirectSaleCommand  = "directverkoop"
Config.DealerAdminCommand = "dealeradmin"

-- ─────────────────────────────────────────────────────────────
-- TECHNISCHE OPTIES
-- ─────────────────────────────────────────────────────────────
Config.EntityStreamingDistance          = 100.0
Config.RemoveGeneratorsAroundDealership = true
Config.AutoRunSQL                       = true
Config.ReturnToPreviousRoutingBucket    = false
Config.HideWatermark                    = true
Config.Debug                            = false