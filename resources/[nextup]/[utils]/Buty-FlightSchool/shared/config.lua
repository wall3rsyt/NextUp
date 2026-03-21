-- =============================================
-- FRAMEWORK INSTELLINGEN
-- =============================================

Framework = {
    FrameworkName = 'qb',       -- esx of qb
    FileName = 'qb-core',       -- es_extended / qb-core
    SQLWrapper = 'oxmysql',     -- oxmysql / mysql-async / ghmattimysql
    UseButyLicense = false,
    UseOxTarget = true,         -- true voor ox_target
}

-- =============================================
-- PRIJZEN
-- =============================================

Prices = {
    PaymentMethod = 'bank',     -- bank / cash

    Airplane    = { Theoretical = 10000, Practical = 10000 },
    Helicopter  = { Theoretical = 20000, Practical = 20000 },
}

-- =============================================
-- NPC INSTELLINGEN
-- =============================================

NPC = {
    Position = vector4(-1032.923096, -3015.942871, 12.946533, 59.527554),
    Model = 's_m_m_pilot_01',
}

-- =============================================
-- BLIP (MINIMAP)
-- =============================================

Blip = {
    Sprite = 423,
    Color = 38,
    Scale = 1.0,
    Label = 'Vliegschool',
}

-- =============================================
-- THEORETISCH EXAMEN
-- =============================================

TheoreticalExam = {
    MistakeMax = 2,
    ExamTime = 2.5, -- In minuten

    Questions = {

        -- -------------------------
        -- VLIEGTUIG VRAGEN
        -- -------------------------
        airplane = {
            {
                Question = 'Wat is het belangrijkste onderdeel van een vliegtuig?',
                Answers = {
                    { Text = 'De vleugels',  Right = true  },
                    { Text = 'De motor',     Right = false },
                    { Text = 'De piloot',    Right = false },
                }
            },
            {
                Question = 'Wanneer is het het gevaarlijkst om te vliegen?',
                Answers = {
                    { Text = 'Tijdens een storm',       Right = true  },
                    { Text = 'Op een heldere dag',      Right = false },
                    { Text = 'Op een sterrenachtnacht', Right = false },
                }
            },
            {
                Question = 'Welk dier is het gevaarlijkst voor een vliegtuig?',
                Answers = {
                    { Text = 'Een vogel',   Right = true  },
                    { Text = 'Een vleermuis', Right = false },
                    { Text = 'Een olifant', Right = false },
                }
            },
            {
                Question = 'Wat is het verschil tussen een straalvliegtuig en een turbopropvliegtuig?',
                Answers = {
                    { Text = 'Een straalvliegtuig gebruikt straalmotoren voor stuwkracht, een turboprop gebruikt schroefmotoren.',         Right = true  },
                    { Text = 'Een straalvliegtuig is sneller en efficiënter dan een turboprop, maar ook duurder.',                         Right = false },
                    { Text = 'Een turbopropvliegtuig is langzamer en minder efficiënt dan een straalvliegtuig, maar goedkoper.',           Right = false },
                }
            },
            {
                Question = 'Wat is de slechtste plek om te zitten in een vliegtuig?',
                Answers = {
                    { Text = 'Naast het toilet',          Right = true  },
                    { Text = 'Naast een baby',            Right = true  },
                    { Text = 'Naast een praatgraag persoon', Right = false },
                }
            },
            {
                Question = 'Wat is het belang van kleppen (flaps) op een vliegtuig?',
                Answers = {
                    { Text = 'Flaps vergroten de lift van de vleugels, zodat het vliegtuig bij lagere snelheden kan landen en opstijgen.', Right = true  },
                    { Text = 'Flaps verbeteren de wendbaarheid bij dwarswindcondities.',                                                    Right = false },
                    { Text = 'Flaps kunnen handmatig of automatisch door de piloot worden bediend.',                                       Right = false },
                }
            },
            {
                Question = 'Wat is de meest voorkomende oorzaak van vliegtuigongelukken?',
                Answers = {
                    { Text = 'Pilotenfouten',      Right = true  },
                    { Text = 'Mechanische storing', Right = false },
                    { Text = 'Slecht weer',        Right = false },
                }
            },
            {
                Question = 'Op welke maximale hoogte vliegt een commercieel passagiersvliegtuig?',
                Answers = {
                    { Text = '35.000 voet (±10.700 m)', Right = true  },
                    { Text = '40.000 voet (±12.200 m)', Right = false },
                    { Text = '45.000 voet (±13.700 m)', Right = false },
                }
            },
        },

        -- -------------------------
        -- HELIKOPTER VRAGEN
        -- -------------------------
        helicopter = {
            {
                Question = 'Wat is het primaire doel van de staartrotor van een helikopter?',
                Answers = {
                    { Text = 'Om de helikopter er cooler uit te laten zien',        Right = false },
                    { Text = 'Om voorwaartse stuwkracht te leveren',                Right = false },
                    { Text = 'Om het koppel van de hoofdrotor te compenseren',      Right = true  },
                }
            },
            {
                Question = 'Hoe communiceer je met de verkeerstoren tijdens het vliegen?',
                Answers = {
                    { Text = 'Via handgebaren en knipoogjes', Right = false },
                    { Text = 'Via telepathie',                Right = false },
                    { Text = 'Via de boordradio',             Right = true  },
                }
            },
            {
                Question = 'Wat is tijdens autorotatie de primaire energiebron om de hoofdrotor draaiende te houden?',
                Answers = {
                    { Text = 'Motorvermogen',                              Right = false },
                    { Text = 'Luchtstroom door de rotorbladen',            Right = true  },
                    { Text = 'De accu van de helikopter',                  Right = false },
                }
            },
            {
                Question = 'Hoe noem je een helikopter die niet wil werken?',
                Answers = {
                    { Text = 'Rafael',         Right = false },
                    { Text = 'Avión',          Right = false },
                    { Text = 'Een heli-kopzorg', Right = true  },
                }
            },
            {
                Question = 'Welke vliegmanoeuvre wordt gebruikt voor een snelle bocht van 180 graden zonder hoogte te verliezen?',
                Answers = {
                    { Text = 'Stall Turn',  Right = false },
                    { Text = 'Barrel Roll', Right = false },
                    { Text = 'Pirouette',   Right = true  },
                }
            },
            {
                Question = 'Waarom ging de helikopter naar therapie?',
                Answers = {
                    { Text = 'Hij had rotorproblemen',          Right = false },
                    { Text = 'Om hoogtevrees te verwerken',     Right = false },
                    { Text = 'Voor wat "heli-copter"-therapie', Right = true  },
                }
            },
            {
                Question = 'Wat is het doel van de cyclische besturing in een helikopter?',
                Answers = {
                    { Text = 'Het motorvermogen regelen',                    Right = false },
                    { Text = 'De bladhoek van de hoofdrotorbladen aanpassen', Right = true  },
                    { Text = 'De staartrotor synchroniseren',                Right = false },
                }
            },
            {
                Question = 'Hoe heten de draaiende bladen bovenop een helikopter?',
                Answers = {
                    { Text = 'Helikoptervleugels', Right = false },
                    { Text = 'Helikopterventilatoren', Right = false },
                    { Text = 'Helikopterrotorbladen', Right = true  },
                }
            },
        },
    },
}

-- =============================================
-- PRAKTISCH EXAMEN
-- =============================================

PracticalExam = {
    MissionTime = 10,               -- In minuten
    PlaneModel = 'lazer',
    HelicopterModel = 'frogger',
    VehiclePlate = 'VLIEGSCHOOL',
    SpawnCoords = {
        vector4(-880.391235, -3212.017578, 13.929688, 56.692913),
        vector4(-1053.08,    -3021.68,     13.96,     56.64),
    },
    CheckpointMarker = {
        Type  = 6,
        Size  = 25.0,
        Color = { 47, 92, 115, 255 },
    },
    Texts = {
        [1] = 'Stijg op en vlieg het toestel door de markering',
        [2] = 'Vlieg het toestel door alle markeringen',
        [3] = 'Land het toestel in de markering',
    },

    Routes = {
        airplane = {
            {
                -- Opdracht 1: Opstijgen
                {
                    { Pos = vector3(-1478.29, -2867.07, 50.96) },
                },
                -- Opdracht 2: Route vliegen
                {
                    { Pos = vector3(-1985.79, -2583.05, 208.94) },
                    { Pos = vector3(-3807.71,    19.63, 410.03) },
                    { Pos = vector3(-3267.47,  2473.18, 477.76) },
                    { Pos = vector3( -615.01,  2543.81, 564.87) },
                    { Pos = vector3(  284.09,  2827.10, 238.94) },
                    { Pos = vector3(  579.14,  2912.26, 169.19) },
                    { Pos = vector3(  853.16,  2995.65, 107.86) },
                    { Pos = vector3(  997.62,  3059.63,  57.99) },
                },
                -- Opdracht 3: Landen
                {
                    { Pos = vector3(1274.31, 3135.83, 40.41) },
                },
            },
        },
        helicopter = {
            {
                -- Opdracht 1: Opstijgen
                {
                    { Pos = vector3(-1478.29, -2867.07, 50.96) },
                },
                -- Opdracht 2: Route vliegen
                {
                    { Pos = vector3(-1985.79, -2583.05, 208.94) },
                    { Pos = vector3(-3807.71,    19.63, 410.03) },
                    { Pos = vector3(-3267.47,  2473.18, 477.76) },
                    { Pos = vector3( -615.01,  2543.81, 564.87) },
                    { Pos = vector3(  284.09,  2827.10, 238.94) },
                    { Pos = vector3(  579.14,  2912.26, 169.19) },
                    { Pos = vector3(  853.16,  2995.65, 107.86) },
                    { Pos = vector3(  997.62,  3059.63,  57.99) },
                },
                -- Opdracht 3: Landen
                {
                    { Pos = vector3(1274.31, 3135.83, 40.41) },
                },
            },
        },
    },
}

-- =============================================
-- VERTALINGEN
-- =============================================

Translation = {
    OpenMenu       = '~w~Druk op ~ub~[E]~wu~ ~w~om de vliegschool te openen',
    NotEnoughMoney = 'Je hebt niet genoeg geld',
}