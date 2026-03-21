Config = {}
Config.Debug = false -- Set to true to enable debug mode

Config.Logs = {}
Config.Logs.Enabled = true
-- Use code "LBLOGS" for 20% off the https://fivemanage.com/ Logs Pro plan.
Config.Logs.Service = "discord" -- fivemanage, discord or ox_lib. if discord, set your webhook in server/apiKeys.lua
Config.Logs.Avatar = true -- attempt to get the player's avatar for discord logging?
Config.Logs.Dataset = "default" -- fivemanage dataset
Config.Logs.Actions = {
    Calls = true,
    Messages = true,
    InstaPic = false,
    Birdy = false,
    YellowPages = true,
    Marketplace = true,
    Mail = true,
    Wallet = true,
    DarkChat = true,
    Services = true,
    Crypto = false,
    Trendy = false,
    Uploads = true
}

Config.DatabaseChecker = {}
Config.DatabaseChecker.Enabled = true
Config.DatabaseChecker.AutoFix = true

--[[ FRAMEWORK OPTIONS ]] --
Config.Framework = "qbox" -- qbx_core
Config.CustomFramework = false
Config.QBMailEvent = false
Config.QBOldJobMethod = false

Config.Item = {}
Config.Item.Require = true -- require a phone item to use the phone
Config.Item.Name = "phone"
Config.Item.Unique = false
Config.Item.Inventory = "ox_inventory"

Config.ServerSideSpawn = false
Config.PropSpawn = "state"

Config.PhoneModel = `lb_phone_prop`
Config.PhoneRotation = vector3(0.0, 0.0, 180.0)
Config.PhoneOffset = vector3(0.0, -0.005, 0.0)
Config.LandscapeRotation = vector3(0.0, 90.0, 180.0)
Config.LandscapeOffset = vector3(-0.03, -0.005, -0.02)

Config.DisableOpenNUI = true

Config.DynamicIsland = true
Config.SetupScreen = true
Config.AppDownloadTime = 2000

Config.AutoDisableSparkAccounts = true
Config.AutoDeleteNotifications = true
Config.MaxNotifications = 30
Config.NotificationsUpdateZIndex = true
Config.DisabledNotifications = {
    -- "DarkChat",
}

Config.AutoJoinDarkChat = {
    -- "general",
}

Config.WhitelistApps = {
    -- ["Weather"] = { "police", "ambulance" }
}

Config.BlacklistApps = {
    -- ["Maps"] = { "police" }
}

Config.ChangePassword = {
    ["Trendy"] = true,
    ["InstaPic"] = true,
    ["Birdy"] = true,
    ["DarkChat"] = true,
    ["Mail"] = true,
}

Config.DeleteAccount = {
    ["Trendy"] = false,
    ["InstaPic"] = false,
    ["Birdy"] = false,
    ["DarkChat"] = false,
    ["Mail"] = false,
    ["Spark"] = false,
}

Config.Companies = {}
Config.Companies.Enabled = false -- spelers kunnen bedrijven/diensten bellen
Config.Companies.MessageOffline = false
Config.Companies.DefaultCallsDisabled = false
Config.Companies.AllowAnonymous = false
Config.Companies.SeeEmployees = "employees"
Config.Companies.DeleteConversations = true
Config.Companies.AllowNoService = false
Config.Companies.Services = {
    {
        job = "police",
        name = "Politie",
        icon = "https://cdn.discordapp.com/attachments/1183148008498528337/1481413238573764861/288a9e4a-c73a-4b97-895b-94fb4843b023.png?ex=69b72d97&is=69b5dc17&hm=3b110058f333688675620a5367c28854368e797d5f7c98c02a4d5058be0461ad&",
        canCall = true,
        canMessage = true,
        bossRanks = { "boss" },
        location = {
            name = "Mission Row",
            coords = {
                x = 437.6986,
                y = -982.1099,
            }
        },
        quickReplies = {
            ["APPS.SERVICES.QUICK_REPLIES.REQUEST_LOCATION.TITLE"] = "APPS.SERVICES.QUICK_REPLIES.REQUEST_LOCATION.MESSAGE",
            ["APPS.SERVICES.QUICK_REPLIES.OFFICER_EN_ROUTE.TITLE"] = "APPS.SERVICES.QUICK_REPLIES.OFFICER_EN_ROUTE.MESSAGE",
        },
    },
    {
        job = "ambulance",
        name = "Ambulance",
        icon = "https://cdn-icons-png.flaticon.com/128/1032/1032989.png",
        canCall = true,
        canMessage = true,
        bossRanks = {"boss", "doctor"},
        location = {
            name = "NextUp Ziekenhuis",
            coords = {
                x = -316.1300,
                y = -603.7900,
            }
        }
    },
    {
        job = "mechanic",
        name = "Pechulpdienst",
        icon = "https://cdn-icons-png.flaticon.com/128/10281/10281554.png",
        canCall = true,
        canMessage = true,
        bossRanks = {"boss", "worker"},
        location = {
            name = "Pechulp HQ",
            coords = {
                x = -338.2800,
                y = -138.1702,
            }
        }
    },
    -- {
    --     job = "taxi",
    --     name = "Taxi",
    --     icon = "https://cdn-icons-png.flaticon.com/128/433/433449.png",
    --     canCall = true,
    --     canMessage = true,
    --     bossRanks = {"boss", "driver"},
    --     location = {
    --         name = "Taxi HQ",
    --         coords = {
    --             x = 984.2,
    --             y = -219.0
    --         }
    --     }
    -- },
}

Config.Companies.Contacts = {}

Config.Companies.Management = {
    Enabled = true,
    Duty = true,
    Deposit = true,
    Withdraw = true,
    Hire = true,
    Fire = true,
    Promote = true,
}

Config.CustomApps = {}

Config.Valet = {}
Config.Valet.Enabled = false
Config.Valet.VehicleTypes = { "car", "vehicle" }
Config.Valet.Price = 100
Config.Valet.Model = `S_M_Y_XMech_01`
Config.Valet.Drive = true
Config.Valet.DisableDamages = false
Config.Valet.FixTakeOut = false

Config.HouseScript = "vms_housing"

--[[ VOICE OPTIONS ]] --
Config.Voice = {}
Config.Voice.CallEffects = false
Config.Voice.SpatialAudio = true
Config.Voice.SpatialAudioSubmixes = 1
Config.Voice.System = "pma" -- pma-voice
Config.Voice.HearNearby = true
Config.Voice.RecordNearby = false
Config.Voice.WaitUntilNotTalking = false

--[[ PHONE OPTIONS ]] --
Config.Sound = {}
Config.Sound.System = "native"
Config.Sound.Sync = true
Config.Sound.Volume = {}
Config.Sound.Volume.Multiplier = 1.0
Config.Sound.Volume.Static = false
Config.Sound.Volume.Min = 0.0
Config.Sound.Volume.Max = 1.0
Config.Sound.MaxDistance = 30.0

Config.Sound.Ringtones = {
    ["default"] = { name = "23", soundSet = "ringtone" },
    ["ringtone 1"] = { name = "1", soundSet = "ringtone" },
    ["ringtone 2"] = { name = "7", soundSet = "ringtone" },
    ["ringtone 3"] = { name = "10", soundSet = "ringtone" },
    ["ringtone 4"] = { name = "13", soundSet = "ringtone" },
    ["ringtone 5"] = { name = "15", soundSet = "ringtone" },
    ["ringtone 6"] = { name = "17", soundSet = "ringtone" },
    ["ringtone 7"] = { name = "19", soundSet = "ringtone" },
    ["ringtone 8"] = { name = "21", soundSet = "ringtone" },
    ["ringtone 9"] = { name = "24", soundSet = "ringtone" },
}

Config.Sound.Notifications = {
    ["default"] = { name = "1", soundSet = "notification" },
    ["notification 1"] = { name = "2", soundSet = "notification" },
    ["notification 2"] = { name = "3", soundSet = "notification" },
    ["notification 3"] = { name = "4", soundSet = "notification" },
    ["notification 4"] = { name = "5", soundSet = "notification" },
    ["notification 5"] = { name = "6", soundSet = "notification" },
    ["notification 6"] = { name = "7", soundSet = "notification" },
    ["notification 7"] = { name = "8", soundSet = "notification" },
}

Config.Sound.AppNotifications = {
    -- ["Messages"] = "default"
}

Config.CellTowers = {}
Config.CellTowers.Enabled = true
Config.CellTowers.Debug = false
Config.CellTowers.MinService = 0
Config.CellTowers.Range = {
    [4] = 250.0,
    [3] = 500.0,
    [2] = 750.0,
    [1] = 1500.0,
}

Config.Locations = {
    {
        position = vector2(437.6986, -982.1099),
        name = "Politiebureau",
        description = "NextUp Landelijke Politie",
        icon = "https://cdn.discordapp.com/attachments/1183148008498528337/1481413238573764861/288a9e4a-c73a-4b97-895b-94fb4843b023.png?ex=69b72d97&is=69b5dc17&hm=3b110058f333688675620a5367c28854368e797d5f7c98c02a4d5058be0461ad&",
    },
    {
        position = vector2(-316.1300, -603.7900),
        name = "NextUp Ziekenhuis",
        description = "NextUp Landelijke Ambulance",
        icon = "https://cdn-icons-png.flaticon.com/128/1032/1032989.png",
    },
}

Config.Locales = {
    { locale = "en", name = "English" },
    { locale = "de", name = "Deutsch" },
    { locale = "fr", name = "Français" },
    { locale = "es", name = "Español" },
    { locale = "nl", name = "Nederlands" },
    { locale = "dk", name = "Dansk" },
    { locale = "no", name = "Norsk" },
    { locale = "th", name = "ไทย" },
    { locale = "ar", name = "عربي" },
    { locale = "ru", name = "Русский" },
    { locale = "cs", name = "Czech" },
    { locale = "sv", name = "Svenska" },
    { locale = "pl", name = "Polski" },
    { locale = "hu", name = "Magyar" },
    { locale = "tr", name = "Türkçe" },
    { locale = "pt-br", name = "Português (Brasil)" },
    { locale = "pt-pt", name = "Português" },
    { locale = "it", name = "Italiano" },
    { locale = "ua", name = "Українська" },
    { locale = "ba", name = "Bosanski" },
    { locale = "zh-cn", name = "简体中文 (Chinese Simplified)" },
    { locale = "ro", name = "Romana" },
    { locale = "ja", name = "日本語" },
    { locale = "ko", name = "한국어" },
}

Config.DefaultLocale = "nl"             -- Standaard taal: Nederlands
Config.DateLocale = "nl-NL"             -- Datum notatie: Nederlands
Config.DateFormat = "auto"

Config.FrameColor = "#0066ff"
Config.AllowFrameColorChange = false

Config.PhoneNumber = {}
Config.PhoneNumber.Format = "{2}-{4}-{4}" -- bijv. 06-1234-5678
Config.PhoneNumber.Length = 8
Config.PhoneNumber.Prefixes = {
    "06"
}

Config.Battery = {}
Config.Battery.Enabled = false
Config.Battery.ChargeInterval = { 5, 10 }
Config.Battery.DischargeInterval = { 50, 60 }
Config.Battery.DischargeWhenInactiveInterval = { 80, 120 }
Config.Battery.DischargeWhenInactive = true

Config.CurrencyFormat = "EUR %s"        -- Euro valuta
Config.MaxTransferAmount = 250000
Config.TransferOffline = false

Config.TransferLimits = {}
Config.TransferLimits.Daily = false
Config.TransferLimits.Weekly = false

Config.EnableMessagePay = true
Config.EnableVoiceMessages = true
Config.EnableGIFs = false
Config.GIFsFilter = "low"

Config.CityName = "Next Up NL"
Config.RealTime = true
Config.CustomTime = false

Config.EmailDomain = "nextup.nl"
Config.AutoCreateEmail = false
Config.DeleteMail = true
Config.ConvertMailToMarkdown = true

Config.DeleteMessages = true
Config.GroupMessageMemberLimit = false

Config.SyncFlash = true
Config.EndLiveClose = false

Config.AllowExternal = {
    Gallery = false,
    Birdy = false,
    InstaPic = false,
    Spark = false,
    Trendy = false,
    Pages = false,
    MarketPlace = false,
    Mail = false,
    Messages = false,
    Other = false,
}

Config.ExternalBlacklistedDomains = {
    "imgur.com",
    "discord.com",
    "discordapp.com",
}

Config.ExternalWhitelistedDomains = {
    -- "fivemanage.com"
}

Config.UploadWhitelistedDomains = {
    "fivemanage.com",
    "fmfile.com",
    "qbox.re",
    "cfx.re"
}

Config.NameFilter = ".+"

Config.WordBlacklist = {}
Config.WordBlacklist.Enabled = true
Config.WordBlacklist.Apps = {
    Birdy = false,
    InstaPic = false,
    Trendy = false,
    Spark = true,
    Messages = true,
    Pages = true,
    MarketPlace = true,
    DarkChat = true,
    Mail = true,
    Other = true,
}
Config.WordBlacklist.Words = {
    -- Voeg hier blacklisted woorden toe indien gewenst
}

Config.AutoFollow = {}
Config.AutoFollow.Enabled = false
Config.AutoFollow.Birdy = { Enabled = false, Accounts = {} }
Config.AutoFollow.InstaPic = { Enabled = false, Accounts = {} }
Config.AutoFollow.Trendy = { Enabled = false, Accounts = {} }

Config.AutoBackup = true

Config.Post = {}
Config.Post.Birdy = true
Config.Post.InstaPic = true
Config.Post.Accounts = {
    Birdy = {
        Username = "Birdy",
        Avatar = "https://loaf-scripts.com/fivem/lb-phone/icons/Birdy.png"
    },
    InstaPic = {
        Username = "InstaPic",
        Avatar = "https://loaf-scripts.com/fivem/lb-phone/icons/InstaPic.png"
    }
}

Config.BirdyTrending = {}
Config.BirdyTrending.Enabled = true
Config.BirdyTrending.Reset = 7 * 24

Config.BirdyNotifications = false
Config.InstaPicLiveNotifications = false

Config.PromoteBirdy = {}
Config.PromoteBirdy.Enabled = false
Config.PromoteBirdy.Cost = 2500
Config.PromoteBirdy.Views = 100

Config.UsernameFilter = {
    Regex = "[a-zA-Z0-9]+",
    LuaPattern = "^[%w]+$",
}

Config.TrendyTTS = {
    {"English (US) - Female", "en_us_001"},
    {"English (US) - Male 1", "en_us_006"},
    {"English (US) - Male 2", "en_us_007"},
    {"English (US) - Male 3", "en_us_009"},
    {"English (US) - Male 4", "en_us_010"},
    {"English (UK) - Male 1", "en_uk_001"},
    {"English (UK) - Male 2", "en_uk_003"},
    {"English (AU) - Female", "en_au_001"},
    {"English (AU) - Male", "en_au_002"},
    {"French - Male 1", "fr_001"},
    {"French - Male 2", "fr_002"},
    {"German - Female", "de_001"},
    {"German - Male", "de_002"},
    {"Spanish - Male", "es_002"},
    {"Spanish (MX) - Male", "es_mx_002"},
    {"Portuguese (BR) - Female 2", "br_003"},
    {"Portuguese (BR) - Female 3", "br_004"},
    {"Portuguese (BR) - Male", "br_005"},
    {"Indonesian - Female", "id_001"},
    {"Japanese - Female 1", "jp_001"},
    {"Japanese - Female 2", "jp_003"},
    {"Japanese - Female 3", "jp_005"},
    {"Japanese - Male", "jp_006"},
    {"Korean - Male 1", "kr_002"},
    {"Korean - Male 2", "kr_004"},
    {"Korean - Female", "kr_003"},
    {"Ghostface (Scream)", "en_us_ghostface"},
    {"Chewbacca (Star Wars)", "en_us_chewbacca"},
    {"C3PO (Star Wars)", "en_us_c3po"},
    {"Stitch (Lilo & Stitch)", "en_us_stitch"},
    {"Stormtrooper (Star Wars)", "en_us_stormtrooper"},
    {"Rocket (Guardians of the Galaxy)", "en_us_rocket"},
    {"Singing - Alto", "en_female_f08_salut_damour"},
    {"Singing - Tenor", "en_male_m03_lobby"},
    {"Singing - Sunshine Soon", "en_male_m03_sunshine_soon"},
    {"Singing - Warmy Breeze", "en_female_f08_warmy_breeze"},
    {"Singing - Glorious", "en_female_ht_f08_glorious"},
    {"Singing - It Goes Up", "en_male_sing_funny_it_goes_up"},
    {"Singing - Chipmunk", "en_male_m2_xhxs_m03_silly"},
    {"Singing - Dramatic", "en_female_ht_f08_wonderful_world"}
}

Config.DynamicWebRTC = {}
Config.DynamicWebRTC.Enabled = false
Config.DynamicWebRTC.Service = "cloudflare"
Config.DynamicWebRTC.RemoveStun = false

--[[ CRYPTO - UITGESCHAKELD ]] --
Config.Crypto = {}
Config.Crypto.Enabled = false
Config.Crypto.Refund = false
Config.Crypto.UpdateInterval = 5
Config.Crypto.Coins = {
    ["lbc"] = {
        name = "LB Coin",
        icon = "./assets/img/icons/crypto/coins/lbc.webp",
        initialValue = 50.0,
        changes = {
            { weight = 500, change = { 0.0, 2.0 } },
            { weight = 490, change = { -2.0, -0.0 } },
            { weight = 5,   change = { 5.0, 15.0 } },
            { weight = 5,   change = { -15.0, -5.0 } }
        },
        permissions = { buy = true, sell = true, transfer = true }
    }
}
Config.Crypto.QBit = false
Config.Crypto.Limits = {}
Config.Crypto.Limits.Buy = 1000000
Config.Crypto.Limits.Sell = 1000000

--[[ BROWSER APP - INGESCHAKELD ]] --
Config.Browser = {}
Config.Browser.CX = "a71915d3303ad48b4"
Config.Browser.DefaultBookmarks = {
    {
        title = "LB",
        url = "https://youtube.com/wall3rss",
        icon = "https://lbscripts.com/assets/favicon.ico"
    }
}
Config.Browser.WhitelistedDomains = {
    -- "lbscripts.com",
}
Config.Browser.BlacklistedDomains = {
    -- "example.com",
}

Config.KeyBinds = {
    Open = {
        Command = "phone",
        Bind = "F1",
        Description = "Telefoon openen"
    },
    Focus = {
        Command = "togglePhoneFocus",
        Bind = "LMENU",
        Description = "Cursor op telefoon aan/uitzetten"
    },
    StopSounds = {
        Command = "stopSounds",
        Bind = false,
        Description = "Alle telefoongeluiden stoppen"
    },
    FlipCamera = {
        Command = "flipCam",
        Bind = "UP",
        Description = "Camera omdraaien"
    },
    TakePhoto = {
        Command = "takePhoto",
        Bind = "RETURN",
        Description = "Foto / video maken"
    },
    ToggleFlash = {
        Command = "toggleCameraFlash",
        Bind = "E",
        Description = "Flitser aan/uitzetten"
    },
    LeftMode = {
        Command = "leftMode",
        Bind = "LEFT",
        Description = "Modus wisselen"
    },
    RightMode = {
        Command = "rightMode",
        Bind = "RIGHT",
        Description = "Modus wisselen"
    },
    RollLeft = {
        Command = "cameraRollLeft",
        Bind = "Z",
        Description = "Camera naar links draaien"
    },
    RollRight = {
        Command = "cameraRollRight",
        Bind = "C",
        Description = "Camera naar rechts draaien"
    },
    FreezeCamera = {
        Command = "cameraFreeze",
        Bind = "X",
        Description = "Camera bevriezen"
    },
    AnswerCall = {
        Command = "answerCall",
        Bind = "RETURN",
        Description = "Oproep beantwoorden"
    },
    DeclineCall = {
        Command = "declineCall",
        Bind = "BACK",
        Description = "Oproep weigeren"
    },
    UnlockPhone = {
        Bind = "SPACE",
        Description = "Telefoon ontgrendelen",
    },
}

Config.KeepInput = true
Config.DisableFocusTalking = false

--[[ PHOTO / VIDEO OPTIONS ]] --
Config.Camera = {}
Config.Camera.ShowTip = true
Config.Camera.Walkable = true
Config.Camera.Roll = true
Config.Camera.AllowRunning = true
Config.Camera.MaxFOV = 70.0
Config.Camera.DefaultFOV = 60.0
Config.Camera.MinFOV = 10.0
Config.Camera.MaxLookUp = 80.0
Config.Camera.MaxLookDown = -80.0

Config.Camera.Vehicle = {}
Config.Camera.Vehicle.Zoom = true
Config.Camera.Vehicle.MaxFOV = 80.0
Config.Camera.Vehicle.DefaultFOV = 60.0
Config.Camera.Vehicle.MinFOV = 10.0
Config.Camera.Vehicle.MaxLookUp = 50.0
Config.Camera.Vehicle.MaxLookDown = -30.0
Config.Camera.Vehicle.MaxLeftRight = 120.0
Config.Camera.Vehicle.MinLeftRight = -120.0

Config.Camera.Selfie = {}
Config.Camera.Selfie.Offset = vector3(0.05, 0.55, 0.6)
Config.Camera.Selfie.Rotation = vector3(10.0, 0.0, -180.0)
Config.Camera.Selfie.MaxFov = 90.0
Config.Camera.Selfie.DefaultFov = 60.0
Config.Camera.Selfie.MinFov = 50.0

Config.Camera.Freeze = {}
Config.Camera.Freeze.Enabled = false
Config.Camera.Freeze.MaxDistance = 10.0
Config.Camera.Freeze.MaxTime = 60

--[[ UPLOAD OPTIES - FIVEMANAGE ]] --
-- Vergeet niet je Fivemanage API key in te stellen in: lb-phone/server/apiKeys.lua
-- Gebruik code LBPHONE10 voor 10% korting op Fivemanage
Config.UploadMethod = {}
Config.UploadMethod.Video = "Fivemanage"
Config.UploadMethod.Image = "Fivemanage"
Config.UploadMethod.Audio = "Fivemanage"

Config.Video = {}
Config.Video.Bitrate = 400
Config.Video.FrameRate = 24
Config.Video.MaxSize = 25
Config.Video.MaxDuration = 60

Config.Image = {}
Config.Image.Mime = "image/webp"
Config.Image.Quality = 0.95