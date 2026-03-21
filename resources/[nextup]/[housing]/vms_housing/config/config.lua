Config = Config or {}

-- ███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
-- ██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
-- █████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
-- ██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
-- ██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
-- ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝

-- QBox is gebaseerd op QB-Core, gebruik QB-Core als framework
local DetectActiveFramework = function()
    if GetResourceState('es_extended') == 'started' then
        return "ESX"
    elseif GetResourceState('qb-core') == 'started' then
        return "QB-Core"
    end
end

Config.Core = DetectActiveFramework()
Config.CoreExport = function()
    if Config.Core == "ESX" then
        return exports['es_extended']:getSharedObject()
    elseif Config.Core == "QB-Core" then
        return exports['qb-core']:GetCoreObject()
    end
end

Config.PlayerLoaded       = Config.Core == "ESX" and "esx:playerLoaded"   or "QBCore:Client:OnPlayerLoaded"
Config.PlayerLogoutServer = Config.Core == "ESX" and "esx:playerDropped"  or "QBCore:Server:OnPlayerUnload"
Config.PlayerSetJob       = Config.Core == "ESX" and "esx:setJob"         or "QBCore:Client:OnJobUpdate"



-- ███╗   ███╗ █████╗ ██╗███╗   ██╗    ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
Config.AutoExecuteQuery = true

-- Log methode: 'discord' / 'fivemanage'
Config.Logs = 'discord'

Config.Debug            = false
Config.DebugTarget      = false
Config.DebugPolyZone    = false
Config.DebugRegionsZone = false

-- ox_target gebruiken (geen DrawText of TextUI)
Config.UseTarget    = true
Config.UseTextUI    = false
Config.UseDrawText  = false
Config.UseDrawTextBox = false

Config.FurnitureScreenshotsPath = 'html/images/furniture/'
Config.AutoLoadKuzQualityShells = false



--  ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ██╗         ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
Config.Blips = {
    ['Motel'] = {
        enabled = true,
        sprite = 475,
        display = 2,
        scale = 0.9,
        color = 0,
        name = TRANSLATE('blip.motel'),
    },
    ['Building'] = {
        enabled = true,
        sprite = 475,
        display = 2,
        scale = 0.9,
        color = 0,
        name = TRANSLATE('blip.building'),
    },
    ['HouseAgency'] = {
        enabled = true,
        sprite = 40,
        display = 2,
        scale = 0.8,
        color = 11,
        blipCategory = 11,
        name = TRANSLATE('blip.house_agency'),
    },
    ['HouseOwner'] = {
        enabled = true,
        sprite = 40,
        display = 2,
        scale = 0.8,
        color = 0,
        blipCategory = 11,
        name = TRANSLATE('blip.house_owner'),
    },
    ['HouseRenter'] = {
        enabled = true,
        sprite = 40,
        display = 2,
        scale = 0.8,
        color = 0,
        blipCategory = 11,
        name = TRANSLATE('blip.house_renter'),
    },
    ['HouseKeyHolder'] = {
        enabled = true,
        sprite = 811,
        display = 2,
        scale = 0.9,
        color = 26,
        blipCategory = 11,
        name = TRANSLATE('blip.house_key_holder'),
    },
    ['HouseForSale'] = {
        enabled = true,
        sprite = 350,
        display = 2,
        scale = 0.6,
        color = 0,
        blipCategory = 10,
        name = TRANSLATE('blip.house_for_sale'),
    },
    ['Marketplace'] = {
        enabled = true,
        sprite = 476,
        display = 2,
        scale = 1.0,
        color = 2,
        name = TRANSLATE('blip.marketplace'),
    },
}

Config.AreaUnit = "m2"

-- Spelers terugplaatsen in property na reconnect
Config.TeleportToLastPropertyOnJoin = true

-- Alleen spelers met permissies kunnen meubels bedienen
Config.FurnitureInteractionAccess = 2
Config.StaticInteractionAccess    = 1

-- Politie mag ook interacten tijdens een raid
Config.AllowInteractionUnderRaid = true

Config.AllowChangeStoragePosition  = true
Config.AllowChangeWardrobePosition = true

-- Geen limiet op aantal properties per speler
Config.MaxPropertiesPerPlayer = false

-- Spelers kunnen property verlaten ook als deur op slot staat
Config.AllowExitOnLocked = true

-- Bezoekers hebben 20 seconden om een property te bekijken voor aankoop
Config.MaxVisitingTime = 20

Config.InteriorBoundaryCheck = true

Config.SaleSignColor = '#20763f'

Config.RentalCycles = {
    ['weekly']  = true,
    ['monthly'] = true,
}

Config.GivePropertyCommand = {
    Enabled = true,
    Name = 'giveproperty',
    Help = 'Geef Property',
    Groups = 'admin',
    Suggestions = {
        {name = 'identifier', label = 'Speler ID / Identifier of CitizenID / Agency naam'},
        {name = 'propertyId', label = 'Property ID'},
    },
}

Config.HideOccupiedMotelRooms = false



-- ███████╗████████╗ █████╗ ██████╗ ████████╗███████╗██████╗      █████╗ ██████╗  █████╗ ██████╗ ████████╗███╗   ███╗███████╗███╗   ██╗████████╗███████╗
-- Starter appartementen zijn UITGESCHAKELD
Config.StarterApartments = {
    Object = 1627,
    Name = 'Starter Appartement #%s',
    Type = 'shell',

    Shell = 'standardmotel_shell',
    Ipl = 'apa_v_mp_h_01_a',

    DefaultPurchasePrice = 0,
    DefaultRentPrice = 0,

    AllowFurnitureInside = true,
    AllowChangeTheme = true,
    DefaultThemeIpl = 'modern',

    AllowSell     = false,
    AllowTransfer = false,
    AllowRent     = false,

    -- Zet Delivery.Enabled op false omdat starter appartementen uitgeschakeld zijn
    Delivery = {
        Enabled = false,
        Coords = vector4(2.4304, -2.1917, 498.4416, 79.99999237060547),
    },

    Storage = {
        Enabled = false,
        Coords = vector3(1.5388, -3.0803, 499.7162),
        Slots = 20,
        Weight = 25000,
    },

    Wardrobe = {
        Enabled = false,
        Coords = vector3(1.3227, 2.8945, 500.0726),
    },
}



-- ██╗  ██╗ ██████╗ ██╗   ██╗███████╗██╗███╗   ██╗ ██████╗     ███╗   ███╗ █████╗ ███╗   ██╗ █████╗  ██████╗ ███████╗███╗   ███╗███████╗███╗   ██╗████████╗
Config.HousingManagement = {
    Command     = 'housemanage',
    Key         = 'F6',
    Description = 'Property beheer menu',
}

-- 50% terugbetaald bij verkoop via menu
Config.AutomaticSell = 50



-- ██╗  ██╗███████╗██╗   ██╗███████╗    ███████╗██╗   ██╗███████╗████████╗███████╗███╗   ███╗
Config.UseKeysOnItem = true   -- Sleutels als inventory items (ox_inventory compatible)
Config.KeysLimit     = 8
Config.KeyPrice      = 300
Config.LockReplacementPrice    = 1000
Config.RemoveKeysOnRentEnd     = true
Config.AutomaticGiveKeyForProperty = true
Config.RequireKeysInsideInterior   = false



-- ██████╗  ██████╗  ██████╗ ██████╗     ███████╗████████╗ █████╗ ████████╗███████╗
Config.SaveDoorsState    = true
Config.DefaultDoorsLocked = true

Config.DoorsSpeed = {
    Single = 10.0,
    Double = 10.0,
    Gate   = 5.0,
}



-- ██████╗ ███████╗██████╗ ███╗   ███╗██╗███████╗███████╗██╗ ██████╗ ███╗   ██╗███████╗
Config.DefaultPermissionsForRenter = {
    'garage',
    'furniture',
    'billPayments',
    'keysManage',
    'upgradesManage',
}

Config.PermissionsLimit = 10



-- ████████╗ █████╗ ██╗  ██╗███████╗███████╗
Config.CityHallTaxes = {
    PropertyPurchase = {
        Enabled = true,
        Type    = 'percentage',
        Value   = 3,
        Title   = 'Property Aankoop - %s %s',
    },
    PropertyResale = {
        Enabled = true,
        Type    = 'percentage',
        Value   = 12,
        Title   = 'Property Doorverkoop - %s %s',
    },
    RentalIncome = {
        Enabled = true,
        Type    = 'percentage',
        Value   = 15,
        Title   = 'Property Verhuur - %s %s',
    },
    PropertyCadastralTax = {
        Enabled = true,
        Type    = 'percentage',
        Value   = 1,
        Title   = 'Onroerendgoedbelasting - %s %s',
    },
    AgencyRentalIncome = {
        Enabled = true,
        Type    = 'percentage',
        Value   = 5,
        Title   = 'Makelaar Verhuur - %s %s',
    },
    AgencyPropertyPurchase = {
        Enabled = true,
        Type    = 'percentage',
        Value   = 3,
        Title   = 'Makelaar Aankoop - %s %s',
    },
    AgencyPropertyResale = {
        Enabled = true,
        Type    = 'percentage',
        Value   = 12,
        Title   = 'Makelaar Doorverkoop - %s %s',
    },
}



-- ██████╗ ██╗██╗     ██╗     ███████╗
Config.UseServiceBills       = true
Config.AllowedUnpaidBills     = 2
Config.AllowedUnpaidRentBills = 2
Config.RemoveBillsOnRentEnd   = true
Config.OptimizeBillsTable     = true



-- ███████╗███████╗ ██████╗██╗   ██╗██████╗ ██╗████████╗██╗   ██╗
-- REALISTISCH: Politie vereist, eigenaar moet online zijn
Config.Lockpick = {
    Enable = false,

    PoliceJobs     = { 'police', 'sheriff' },
    RequiredPolice = 1, -- Minimaal 1 agent online vereist

    RequiredOwnerOnline = true, -- Eigenaar moet online zijn voor inbraak

    Item = {
        Required    = true,
        Name        = 'lockpick',
        Count       = 1,
        RemoveOnUse = true,
    },
}

Config.Alarm = {
    AlertPoliceOnlyWithUpgrade = true,

    AlarmJobs = { 'police', 'sheriff' },

    AlertPoliceOnLockpickStart   = true,
    AlertPoliceOnLockpickSuccess = false,
    AlertPoliceOnLockpickFail    = false,

    AllowPhoneAlerts = true,

    VerificationCodeExpiryTime = 180,
    PhoneNumberMaxLength       = 15,

    AlertOwnerOnLockpickStart   = true,
    AlertOwnerOnLockpickSuccess = false,
    AlertOwnerOnLockpickFail    = false,
}

Config.PropertyLockdown = {
    Enable = true,

    ObjectModel = 'prop_barrier_work05',

    Jobs = { 'police' },

    Item = {
        Required    = true,
        Name        = 'police_barrier',
        Count       = 1,
        RemoveOnUse = true,
    },
}

Config.PropertyRaids = {
    Enable = true,

    Jobs = { 'police' },

    InteractiveBuildInMinigame = {
        Use = true,

        Hits = {
            Normal              = 5,
            AntiBurglaryDoors   = {8, 12},
        },

        Outline = true,
        OutlineColors = {
            Default = {9, 181, 15, 255},
            Hover   = {181, 9, 9, 255},
        },
    },

    AntiBurglaryDoors = {
        AllowRaid   = true,
        RaidChance  = 10,
        BreakOnRam  = true,
    },

    Item = {
        Required    = true,
        Name        = 'police_stormram',
        Count       = 1,
        RemoveOnUse = true,
    },
}



-- ██████╗  ██████╗ ██╗    ██╗███████╗██████╗     ██████╗  ██████╗ ██╗  ██╗
Config.PowerBox = {
    ObjectModel = {
        Opened = 'm24_1_prop_m41_circuitbox_open_01a',
        Closed = 'm24_1_prop_m41_circuitbox_01a',
    },

    Actions = {
        ['TurnOn'] = {
            Item = {
                Required         = false,
                Name             = nil,
                Count            = 1,
                RemoveOnUse      = true,
                ShowOnlyWithItem = true,
            },
            Explode = { AllowOnFail = false, Chance = 0 },
            Electrocution = {
                AllowOnFail = true, Chance = 40, Duration = {5000, 10000},
                Knockback   = { Allow = true, Chance = 50, Force = {5, 10} },
                Damage      = { Allow = true, Chance = 50, Value = {5, 15} },
                Death       = { Allow = false, Chance = 0 },
            },
        },
        ['Repair'] = {
            Item = {
                Required         = true,
                Name             = 'insulating_tape',
                Count            = 1,
                RemoveOnUse      = true,
                ShowOnlyWithItem = true,
            },
            Explode = { AllowOnFail = true, Chance = 10 },
            Electrocution = {
                AllowOnFail = true, Chance = 70, Duration = {20000, 30000},
                Knockback   = { Allow = true, Chance = 50, Force = {10, 18} },
                Damage      = { Allow = true, Chance = 75, Value = {10, 20} },
                Death       = { Allow = true, Chance = 10 },
            },
        },
        ['TurnOff'] = {
            Item = {
                Required         = false,
                Name             = nil,
                Count            = 1,
                RemoveOnUse      = true,
                ShowOnlyWithItem = true,
            },
            Explode = { AllowOnFail = false, Chance = 10 },
            Electrocution = {
                AllowOnFail = true, Chance = 90, Duration = {20000, 30000},
                Knockback   = { Allow = true, Chance = 60, Force = 10 },
                Damage      = { Allow = true, Chance = 80, Value = {8, 16} },
                Death       = { Allow = false, Chance = 0 },
            },
        },
        ['Destroy'] = {
            Item = {
                Required         = true,
                Name             = 'pliers',
                Count            = 1,
                RemoveOnUse      = true,
                ShowOnlyWithItem = true,
            },
            Explode = { AllowOnFail = true, Chance = 35 },
            Electrocution = {
                AllowOnFail = true, Chance = 80, Duration = {20000, 30000},
                Knockback   = { Allow = true, Chance = 100, Force = {10, 20} },
                Damage      = { Allow = true, Chance = 80, Value = {10, 25} },
                Death       = { Allow = true, Chance = 30 },
            },
        },
    },
}



-- ██╗  ██╗ ██████╗ ██╗   ██╗███████╗██╗███╗   ██╗ ██████╗      ██████╗██████╗ ███████╗ █████╗ ████████╗ ██████╗ ██████╗
Config.HousingCreator = {
    Command     = 'housing',
    Key         = 'F7',
    Description = 'Open Housing Creator',
    Access = {
        Job   = {},
        Group = {
            ['god'] = {
                ['Property:Create']       = true,
                ['Property:RemoveOwner']  = true,
                ['Property:RemoveRenter'] = true,
                ['Property:Teleport']     = true,
                ['Property:Edit']         = true,
                ['Property:Delete']       = true,
                ['Furniture:Create']      = true,
                ['Furniture:Edit']        = true,
                ['Furniture:Delete']      = true,
                ['CreateNewShell']        = true,
            },
            ['admin'] = {
                ['Property:Create']       = true,
                ['Property:RemoveOwner']  = true,
                ['Property:RemoveRenter'] = true,
                ['Property:Teleport']     = true,
                ['Property:Edit']         = true,
                ['Property:Delete']       = true,
                ['Furniture:Create']      = true,
                ['Furniture:Edit']        = true,
                ['Furniture:Delete']      = true,
                ['CreateNewShell']        = true,
            },
        },
    }
}

Config.HousingCreatorControls = {
    ['SELECT']       = {controlIndex = 24},
    ['BACK']         = {controlIndex = 70},
    ['SCROLL_DOWN']  = {controlIndex = 180},
    ['SCROLL_UP']    = {controlIndex = 181},
    ['LEFT_CTRL']    = {controlIndex = 210},
    ['ENTER']        = {controlIndex = 191},
    ['CANCEL']       = {controlIndex = 202},
    ['ARROW_UP']     = {controlIndex = 172},
    ['ARROW_DOWN']   = {controlIndex = 173},
    ['ARROW_LEFT']   = {controlIndex = 174},
    ['ARROW_RIGHT']  = {controlIndex = 175},
    ['EXIT_PREVIEW'] = {controlIndex = 73, control = 'X'},
}



-- ██████╗ ███████╗ █████╗ ██╗         ███████╗███████╗████████╗ █████╗ ████████╗███████╗
Config.RealEstate = {
    Command     = 'realestate',
    Description = 'Open Makelaar Menu',
    Key         = nil,

    PercentageForAgent  = 10,
    PercentageForAgency = 90,

    Jobs = {
        ['dynasty8'] = {
            Label       = 'Dynasty 8',
            SocietyName = 'dynasty8',

            AllowSellProperties = true,
            AllowRentProperties = true,

            Blip = {
                enabled = true,
                sprite  = 476,
                display = 2,
                scale   = 1.0,
                color   = 2,
                name    = 'Dynasty 8',
            },
            BlipCoords = vector3(-720.11, -382.26, 34.8),

            Showroom = {
                PlayersCanPurchaseProperties = false,
                PlayersCanRentProperties     = true,
                TargetCoords = vector4(-720.11, -382.26, 34.8, 159.53),
                TargetSize   = vec3(2.0, 1.6, 1.8),
            },

            Grades = {
                [0] = {
                    perms = {
                        ['BossMenuAccess']      = false,
                        ['PropertyAccess']      = true,
                        ['PurchaseProperties']  = false,
                        ['SellProperties']      = false,
                        ['RentProperties']      = false,
                        ['TerminateRental']     = true,
                        ['UpdatePropertyPrice'] = false,
                        ['ListProperty']        = false,
                    },
                },
                [1] = {
                    perms = {
                        ['BossMenuAccess']      = false,
                        ['PropertyAccess']      = true,
                        ['PurchaseProperties']  = true,
                        ['SellProperties']      = true,
                        ['RentProperties']      = true,
                        ['TerminateRental']     = true,
                        ['UpdatePropertyPrice'] = true,
                        ['ListProperty']        = true,
                    },
                },
                [2] = {
                    perms = {
                        ['BossMenuAccess']      = true,
                        ['PropertyAccess']      = true,
                        ['PurchaseProperties']  = true,
                        ['SellProperties']      = true,
                        ['RentProperties']      = true,
                        ['TerminateRental']     = true,
                        ['UpdatePropertyPrice'] = true,
                        ['ListProperty']        = true,
                    },
                },
            }
        },
    }
}

Config.MaxPropertiesPerAgency = false



-- ███╗   ███╗ █████╗ ██████╗ ██╗  ██╗███████╗████████╗██████╗ ██╗      █████╗  ██████╗███████╗
Config.Marketplace = {
    Enabled                  = true,
    AllowTransactionFromMenu = true,
    ShowSecondaryMarketOnly  = false,
    IncludeMotelRooms        = false,
    IncludeBuldingApartments = false,

    Blip       = Config.Blips['Marketplace'],
    BlipCoords = vector3(-1082.89, -249.45, 43.98),

    TargetCoords = vector4(-1083.08, -249.66, 44.02, 296.5),
    TargetSize   = vec3(2.0, 1.6, 1.8),

    Ped = {
        Model     = 'ig_drfriedlander',
        Coords    = vector4(-1082.72, -249.5, 43.02, 296.32),
        Animation = {'switch@michael@sitting', 'idle'},
    },
}



-- ███████╗██╗   ██╗██████╗ ███╗   ██╗██╗████████╗██╗   ██╗██████╗ ███████╗
Config.HousingFurniture = {
    Command     = 'furniture',
    Key         = nil,
    Description = 'Property meubel menu',
}

Config.RequirePurchaseFurniture = true
Config.FurnitureSellPercentage  = 80
Config.FurnitureLimit           = 10
Config.RemoveFurnitureOnRentEnd = true

Config.FurnitureLimitPerProperty = {
    ['p_v_43_safe_s'] = 3,
}

Config.FurnitureControls = {
    ['CLOSE']           = {controlIndex = 202},
    ['ACCEPT']          = {controlIndex = 201},
    ['UP']              = {controlIndex = 172},
    ['DOWN']            = {controlIndex = 173},
    ['ROTATE_LEFT']     = {controlIndex = 181},
    ['ROTATE_RIGHT']    = {controlIndex = 180},
    ['SPEED_DOWN']      = {controlIndex = 210},
    ['SNAP_TO_GROUND']  = {controlIndex = 19},
    ['ENABLE_CURSOR']   = {controlIndex = 238},
    ['CHANGE_MODE']     = {controlIndex = 58},
    ['CLEAN_MOP']       = {controlIndex = 58},
    ['MOWER_EXIT']      = {controlIndex = 73},
    ['GIZMO_TRANSLATION'] = {control = 'X'},
    ['GIZMO_ROTATION']    = {control = 'C'},
}

Config.FurnitureSettings = {
    HeightSpeed        = 0.01,
    HeightSpeedSlow    = 0.005,
    RotateSpeed        = 5.0,
    RotateSpeedSlow    = 1.0,
    CancelOutsideZone  = true,
    GizmoMaxDistanceIPL   = 50.0,
    GizmoMaxMarginShell   = 2.5,
}

Config.Cameras = {
    ['prop_cctv_cam_04c'] = true,
    ['prop_cctv_cam_05a'] = true,
    ['prop_cctv_cam_06a'] = true,
}



-- ██████╗ ██╗██████╗ ████████╗     █████╗ ███╗   ██╗██████╗      ██████╗██╗     ███████╗ █████╗ ███╗   ██╗██╗███╗   ██╗ ██████╗
Config.DirtSystem        = true
Config.DirtSlipping      = true
Config.DirtSlippingChance = 60
Config.MaxDirtPerProperty = 8
Config.DirtSpawnChance    = 80
Config.DirtSpawnTimeout   = {30000, 80000}

Config.DirtObjects = {
    {model = 'vms_dirtfootsteps', spawn = true},
    {model = 'vms_coffeestain1',  spawn = false},
    {model = 'vms_coffeestain2',  spawn = false},
    {model = 'vms_crumbs1',       spawn = false},
    {model = 'vms_crumbs2',       spawn = false},
    {model = 'vms_dirtmud1',      spawn = true},
    {model = 'vms_dirtmud2',      spawn = true},
    {model = 'vms_dirtmud3',      spawn = true},
    {model = 'vms_dirtmud4',      spawn = true},
    {model = 'vms_ketchupspill',  spawn = false},
    {model = 'vms_liquidspill1',  spawn = false},
    {model = 'vms_liquidspill2',  spawn = false},
    {model = 'vms_liquidspill3',  spawn = false},
    {model = 'vms_liquidspill4',  spawn = false},
    {model = 'vms_mustardspill',  spawn = false},
    {model = 'vms_oilspill1',     spawn = false},
    {model = 'vms_oilspill2',     spawn = false},
    {model = 'vms_sodaspill1',    spawn = false},
    {model = 'vms_winestain1',    spawn = false},
}



--  ██████╗ ██████╗  █████╗ ███████╗███████╗    ███╗   ███╗ ██████╗ ██╗    ██╗██╗███╗   ██╗ ██████╗
Config.GrassSystem = true

Config.GrassObjects = {
    [1] = { 'vms_grass_a_1', 'vms_grass_a_2', 'vms_grass_a_3', 'vms_grass_a_4', 'vms_grass_a_5' },
    [2] = { 'vms_grass_b_1', 'vms_grass_b_2', 'vms_grass_b_3', 'vms_grass_b_4', 'vms_grass_b_5' },
}

Config.GrassLimit = 50

Config.GrassLevels = {
    [0] = { growthTime = 12 * 60 * 60 },
    [1] = { growthTime = 24 * 60 * 60 },
    [2] = { growthTime = 36 * 60 * 60 },
    [3] = { growthTime = 48 * 60 * 60 },
    [4] = { growthTime = 72 * 60 * 60 },
    [5] = { growthTime = nil },
}

Config.GrassLawnMower = {
    DisableJump = true,
    DisableRun  = true,
}

Config.GrassMowerVehicles = {
    [joaat('mower')] = true,
}



-- ██████╗ ███████╗██╗     ██╗██╗   ██╗███████╗██████╗ ██╗███████╗███████╗
-- REALISTISCH: Dozen uitpakken (DeliveryType = 3)
Config.DeliveryType   = 3
Config.DeliveryObject = 'prop_boxpile_01a'

Config.Deliveries = {
    ['1'] = {
        defaultDeliveryCharge = 2000,
        defaultDeliveryTime   = 30 * 60 * 1000,  -- 30 minuten
    },
    ['2'] = {
        defaultDeliveryCharge = 2000,
        defaultDeliveryTime   = 60 * 60 * 1000,  -- 60 minuten
    },
    ['3'] = {
        defaultDeliveryCharge = 2000,
        defaultDeliveryTime   = 180 * 60 * 1000, -- 180 minuten
    },
}



-- ██╗   ██╗██████╗  ██████╗ ██████╗  █████╗ ██████╗ ███████╗███████╗
Config.HousingUpgrades = {
    ['alarm'] = {
        metadata = 'alarm',
        price    = 60000,
        icon     = 'fa-solid fa-car-on',
        label    = "Alarmsysteem",
        description = [[
            Een geavanceerd alarmsysteem dat direct een melding geeft bij ongeautoriseerde toegang.
            Zeer effectief tegen inbraken, ook wanneer je offline bent.
        ]],
    },

    ['anti_burglary_doors'] = {
        metadata = 'antiBurglaryDoors',
        price    = 80000,
        icon     = 'fa-solid fa-door-closed',
        label    = "Anti-Inbraakdeuren",
        description = [[
            Versterkte deuren die bestand zijn tegen geweld.
            Voegt extra beveiliging toe en vertraagt inbraakpogingen aanzienlijk.
        ]],
    },

    ['smart_peephole'] = {
        metadata = 'smartPeephole',
        price    = 80000,
        icon     = 'fa-solid fa-door-closed',
        label    = "Slim Deurspionnetje",
        description = [[
            Vervang je gewone deurspionnetje door een elektronische versie met groter zichtveld
            en meer controle over wat er buiten je deur gebeurt.
        ]],
    },

    ['furniture_limit'] = {
        metadata = 'furnitureLimit',
        icon     = 'fa-solid fa-couch',
        label    = "Meubel Limiet",
        description = ([[
            Upgrade om meer meubels in je property te plaatsen.
            Huidige limiet: %s — na deze upgrade wordt dit 30.
        ]]):format(Config.FurnitureLimit),

        levels = {
            ['1'] = {
                limit       = 30,
                price       = 60000,
                description = "Verhoog je meubellimiet van 30 naar 50.",
            },
            ['2'] = {
                limit       = 50,
                price       = 80000,
                description = "Verhoog je meubellimiet van 50 naar 100.",
            },
            ['3'] = {
                limit       = 100,
                price       = 100000,
                description = "Verhoog je meubellimiet van 100 naar 150.",
            },
            ['4'] = {
                limit       = 150,
                price       = 120000,
                description = "Maximale meubellimiet bereikt. Geen verdere upgrades beschikbaar.",
            },
        },
    },

    ['doorbell'] = {
        metadata = 'doorbell',
        icon     = 'fa-solid fa-bell',
        label    = "Deurbel Geluid",
        description = [[
            Pas het geluid van je deurbel aan naar jouw smaak.
            Kies uit diverse tonen voor een persoonlijk tintje.
        ]],

        types = {
            ['default'] = {
                label       = 'Standaard Bel',
                price       = 0,
                audioFile   = 'doorbell',
                audioVolume = { inside = 0.1, outside = 0.1 },
            },
            ['cartoon'] = {
                label       = 'Cartoon Melodische Bel',
                price       = 3000,
                audioFile   = 'doorbell-cartoon',
                audioVolume = { inside = 0.1, outside = 0.1 },
            },
            ['christmas'] = {
                label       = 'Kerst Bel',
                price       = 3000,
                audioFile   = 'doorbell-christmas',
                audioVolume = { inside = 0.1, outside = 0.1 },
            },
            ['futuristic'] = {
                label       = 'Futuristische Bel',
                price       = 3000,
                audioFile   = 'doorbell-futuristic',
                audioVolume = { inside = 0.1, outside = 0.1 },
            },
            ['modern'] = {
                label       = 'Moderne Bel',
                price       = 3000,
                audioFile   = 'doorbell-modern',
                audioVolume = { inside = 0.1, outside = 0.1 },
            },
            ['discrete'] = {
                label       = 'Discrete Bel',
                price       = 3000,
                audioFile   = 'doorbell-discrete',
                audioVolume = { inside = 0.1, outside = 0.1 },
            },
            ['melodic'] = {
                label       = 'Melodische Bel',
                price       = 3000,
                audioFile   = 'doorbell-melodic',
                audioVolume = { inside = 0.1, outside = 0.1 },
            },
            ['buzzer'] = {
                label       = 'Zoemer Bel',
                price       = 3000,
                audioFile   = 'doorbell-buzzer',
                audioVolume = { inside = 0.1, outside = 0.1 },
            },
            ['classic'] = {
                label       = 'Klassieke Bel',
                price       = 3000,
                audioFile   = 'doorbell-classic',
                audioVolume = { inside = 0.1, outside = 0.1 },
            },
            ['classic2'] = {
                label       = 'Klassieke Bel 2',
                price       = 3000,
                audioFile   = 'doorbell-classic2',
                audioVolume = { inside = 0.1, outside = 0.1 },
            },
        }
    }
}