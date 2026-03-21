Framework = {
    FrameworkName = 'qb', -- esx or qb
    FileName = 'qb-core', -- es_extended  qb-core
    SQLWrapper = 'oxmysql', --  oxmysql  mysql-async  ghmattimysql
    UseButyLicense = false -- true  false - httpsbutycall.tebex.iopackage5743295
}

Prices = {
    PaymentMethod = 'bank', -- bank  cash
    Theoretical = 2500,
    Practical = 7500
}

NPC = {
    Position = vector4(-1802.9653, -1069.0258, 12.0188, 224.3602),
    Model = 'a_m_y_surfer_01'
}

Blip = {
    Sprite = 427,
    Color = 18,
    Scale = 0.7,
    Label = 'Vaarschool Nextup'
}

TheoreticalExam = {
    MistakeMax = 3,
    ExamTime = 5, -- In minutes
    Questions = {
        {
            Question = 'Hoe heet de voorkant van een boot',
            Answers = {
                { Text = 'Achterkant', Right = false },
                { Text = 'Boeg', Right = true },
                { Text = 'Frontier', Right = false }
            }
        },
        {
            Question = 'Wie heeft voorrang bij een brug als beide boten even groot zijn',
            Answers = {
                { Text = 'De boot die stroomopwaarts vaart', Right = false },
                { Text = 'De boot met de minste mensen', Right = false },
                { Text = 'De boot die eerst arriveert', Right = true }
            }
        },
        {
            Question = 'Welke term verwijst naar de linkerzijde van de boot als je naar voren kijkt',
            Answers = {
                { Text = 'Stuurboord', Right = false },
                { Text = 'Bakboord', Right = true },
                { Text = 'Ladebord', Right = false }
            }
        },
        {
            Question = 'Moet je altijd een reddingsvest dragen op het water',
            Answers = {
                { Text = 'Ja, altijd voor iedereen aan boord', Right = true },
                { Text = 'Nee, alleen als het ruw is', Right = false },
                { Text = 'Alleen voor kinderen', Right = false }
            }
        },
        {
            Question = "Welk licht voer je \'s nachts als je stil ligt (geankerd) op binnenwater",
            Answers = {
                { Text = 'Een wit rondomlicht', Right = true },
                { Text = 'Twee witte lichten boven elkaar', Right = false },
                { Text = 'Groen en rood boordlicht', Right = false }
            }
        },
        {
            Question = 'Wat is de maximale toegestane alcoholpromillage als je vaart met een pleziervaartuig',
            Answers = {
                { Text = '0.8 %', Right = false },
                { Text = '0.5 %', Right = true },
                { Text = '0.2 %', Right = false }
            }
        },
        {
            Question = 'Wat voor veiligheidsspul moet je altijd bij je hebben als je met een vaartuig vaart op Nederlandse binnenwateren',
            Answers = {
                { Text = 'Een EHBO-Set', Right = false },
                { Text = 'Een brandblusser en een reddingsboei of -vest', Right = true },
                { Text = 'Een grote parasol tegen de zon', Right = false }
            }
        },
        {
            Question = 'Wat is het belangrijkste verschil tussen bakboord en stuurboord?',
            Answers = {
                { Text = 'Een grote barbecue voor aan boord', Right = false },
                { Text = 'Bakboord is links als je vooruit kijkt', Right = true },
                { Text = 'Stuurboord is altijd de kant waar je anker ligt', Right = false }
            }
        },
        {
            Question = 'Wat betekent een gele driehoek met een zwarte rand op een bord langs het water',
            Answers = {
                { Text = 'Hier mag je supersnel varen', Right = false },
                { Text = 'Gratis parkeerplaats voor boten', Right = false },
                { Text = 'Gevaarlijke plek of waarschuwing (bijv. ondiepte, stroom, brug)', Right = true }
            }
        }
    }
}
PracticalExam = {
    MissionTime = 10, -- In minutes
    Model = 'speeder',
    VehiclePlate = 'Vaarschool Nextup',    SpawnCoords = {
        vector4(-880.2708, -1340.0054, -0.0104, 198.4105)
    },
    CheckpointMarker = { Type = 6, Size = 25.0, Color = { 47, 92, 115, 255 } },
    Texts = {
        -- First mission
        [1] = 'Verlaat de haven rustig.',
        -- Second mission
        [2] = 'Navigeer de route, zonder af te wijken van de route.',
        -- Third mission
        [3] = 'Vermijd obstakels',
        -- Fourth mission
        [4] = 'Navigeer de route door de kanalen van Los Santos',
        -- Fifth mission
        [5] = 'Parkeer de boot zonder te crashen'
    },
    Routes = {
        {
            -- First mission
            {
                { Pos = vector3(-835.23, -1529.29, 0.12) }
            },
            -- Second mission
            {
                { Pos = vector3(-907.18, -1600.54, 0.12) },
                { Pos = vector3(-989.66, -1689.09, 0.03) },
                { Pos = vector3(-1077.44, -1772.11, 0.3) },
                { Pos = vector3(-1195.42, -1876.2, 0.28) },
                { Pos = vector3(-1259.57, -1969.62, 0.22) },
                { Pos = vector3(-1346.27, -1997.89, 0.38) },
                { Pos = vector3(-1433.55, -2047.24, -0.07) },
                { Pos = vector3(-1559.25, -2163.55, 0.34) },
                { Pos = vector3(-1687.87, -2261.56, 0.53) }
            },
            -- Third mission
            {
                { Pos = vector3(-1829.74, -2658.66, 0.92) },
                { Pos = vector3(-1915.89, -2803.36, 1.33) },
                { Pos = vector3(-1969.02, -2779.17, 0.53) },
                { Pos = vector3(-1881.45, -2637.39, 0.92) }
            },
            -- Fourth mission
            {
                { Pos = vector3(-1054.7, -1752.16, 0.4) },
                { Pos = vector3(-884.52, -1582.59, 0.03) },
                { Pos = vector3(-843.25, -1457.1, -0.04) },
                { Pos = vector3(-912.36, -1355.74, -0.08) },
                { Pos = vector3(-988.33, -1356.51, -0.05) },
                { Pos = vector3(-1057.62, -1229.95, -0.51) },
                { Pos = vector3(-1106.41, -1150.69, -0.54) },
                { Pos = vector3(-1113.44, -1120.62, -0.37) },
                { Pos = vector3(-1000.25, -1054.48, -0.45) },
                { Pos = vector3(-947.37, -1024.16, -0.45) },
                { Pos = vector3(-914.38, -1073.83, -0.5) },
                { Pos = vector3(-899.48, -1118.03, -0.58) },
                { Pos = vector3(-948.45, -1147.04, -0.56) },
                { Pos = vector3(-1008.26, -1181.01, -0.41) },
                { Pos = vector3(-1058.91, -1235.53, -0.46) },
                { Pos = vector3(-982.39, -1364.26, -0.03) },
                { Pos = vector3(-926.6, -1358.44, -0.08) },
                { Pos = vector3(-835.98, -1464.27, -0.04) }
            },
            -- Fifth mission
            {
                { Pos = vector3(-859.13, -1486.98, -0.09) }
            }
        }
    }
}

Translation = {
    OpenMenu = '~w~Druk op ~ub~[E]~wu~ ~w~om de Nextup Vaarschool te openen',
    NotEnoughMoney = 'Helaas, je hebt niet genoeg geld hiervoor.'
}