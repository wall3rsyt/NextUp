---Job names must be lower case (top level table key)
---@type table<string, Job>
return {

    -- ==========================================
    --  CIVILIAN / STANDAARD
    -- ==========================================

    ['unemployed'] = {
        label = 'Burger',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Freelancer',
                payment = 10
            },
        },
    },

    -- ==========================================
    --  POLITIE
    -- ==========================================

    ['police'] = {
        label = 'Politie',
        type = 'leo',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            -- EXECUTIEVE RANGEN
            [0] = {
                name = 'Agent in Opleiding',
                payment = 50
            },
            [1] = {
                name = 'Agent',
                payment = 65
            },
            [2] = {
                name = 'Senior Agent',
                payment = 80
            },
            [3] = {
                name = 'Brigadier',
                payment = 95
            },
            [4] = {
                name = 'Sergeant',
                payment = 105
            },
            -- OFFICIEREN
            [5] = {
                name = 'Inspecteur',
                payment = 120
            },
            [6] = {
                name = 'Hoofdinspecteur',
                payment = 135
            },
            [7] = {
                name = 'Commissaris',
                payment = 150
            },
            [8] = {
                name = 'Hoofdcommissaris',
                payment = 165
            },
            -- KORPSLEIDING
            [9] = {
                name = 'Operationeel Directeur',
                payment = 180
            },
            [10] = {
                name = 'Plaatsvervangend Korpschef',
                payment = 195
            },
            [11] = {
                name = 'Korpschef',
                isboss = true,
                bankAuth = true,
                payment = 225
            },
        },
    },

    -- ==========================================
    --  DSI / ARRESTATIETEAM
    -- ==========================================

    ['dsi'] = {
        label = 'DSI - Arrestatieteam',
        type = 'leo',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'AT Aspirant',
                payment = 80
            },
            [1] = {
                name = 'AT Operator',
                payment = 100
            },
            [2] = {
                name = 'AT Senior Operator',
                payment = 115
            },
            [3] = {
                name = 'AT Schutter',
                payment = 125
            },
            [4] = {
                name = 'AT Teamleider',
                payment = 140
            },
            [5] = {
                name = 'AT Instructeur',
                payment = 150
            },
            [6] = {
                name = 'AT Officier',
                payment = 165
            },
            [7] = {
                name = 'AT Hoofdofficier',
                payment = 180
            },
            [8] = {
                name = 'Commandant DSI',
                isboss = true,
                bankAuth = true,
                payment = 210
            },
        },
    },

    -- ==========================================
    --  KONINKLIJKE MARECHAUSSEE (KMAR)
    -- ==========================================

    ['kmar'] = {
        label = 'Koninklijke Marechaussee',
        type = 'leo',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Marechaussee in Opleiding',
                payment = 50
            },
            [1] = {
                name = 'Marechaussee der 3e Klasse',
                payment = 70
            },
            [2] = {
                name = 'Marechaussee der 2e Klasse',
                payment = 85
            },
            [3] = {
                name = 'Marechaussee der 1e Klasse',
                payment = 100
            },
            [4] = {
                name = 'Korporaal',
                payment = 110
            },
            [5] = {
                name = 'Sergeant',
                payment = 125
            },
            [6] = {
                name = 'Sergeant der 1e Klasse',
                payment = 135
            },
            [7] = {
                name = 'Adjudant-Onderofficier',
                payment = 145
            },
            [8] = {
                name = 'Luitenant',
                payment = 155
            },
            [9] = {
                name = 'Kapitein',
                isboss = true,
                bankAuth = true,
                payment = 175
            },
        },
    },

    -- ==========================================
    --  AMBULANCE / GENEESKUNDIGE HULPVERLENING
    -- ==========================================

    ['ambulance'] = {
        label = 'Ambulance',
        type = 'ems',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            -- BASIS
            [0] = {
                name = 'Stagiair',
                payment = 50
            },
            [1] = {
                name = 'Ambulancehulpverlener',
                payment = 60
            },
            [2] = {
                name = 'Ambulancechauffeur',
                payment = 70
            },
            -- VERPLEEGKUNDIG
            [3] = {
                name = 'Ambulanceverpleegkundige',
                payment = 82
            },
            [4] = {
                name = 'Senior Ambulanceverpleegkundige',
                payment = 95
            },
            [5] = {
                name = 'Verpleegkundig Specialist',
                payment = 108
            },
            -- MEDISCH
            [6] = {
                name = 'Basisarts',
                payment = 120
            },
            [7] = {
                name = 'Arts',
                payment = 135
            },
            [8] = {
                name = 'Traumaarts',
                payment = 150
            },
            [9] = {
                name = 'Anesthesioloog',
                payment = 165
            },
            -- MANAGEMENT
            [10] = {
                name = 'Medisch Manager Ambulancezorg',
                payment = 185
            },
            [11] = {
                name = 'Regionaal Directeur GGD/GHOR',
                isboss = true,
                bankAuth = true,
                payment = 215
            },
        },
    },

    -- ==========================================
    --  UITDIENST JOBS (Overheid - standaard uitkering)
    -- ==========================================

    ['police_uitdienst'] = {
        label = 'Politie (Uitdienst)',
        type = 'leo',
        defaultDuty = false,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Agent in Opleiding',
                payment = 20
            },
            [1] = {
                name = 'Agent',
                payment = 25
            },
            [2] = {
                name = 'Senior Agent',
                payment = 28
            },
            [3] = {
                name = 'Brigadier',
                payment = 32
            },
            [4] = {
                name = 'Sergeant',
                payment = 35
            },
            [5] = {
                name = 'Inspecteur',
                payment = 38
            },
            [6] = {
                name = 'Hoofdinspecteur',
                payment = 42
            },
            [7] = {
                name = 'Commissaris',
                payment = 46
            },
            [8] = {
                name = 'Hoofdcommissaris',
                payment = 50
            },
            [9] = {
                name = 'Operationeel Directeur',
                payment = 55
            },
            [10] = {
                name = 'Plaatsvervangend Korpschef',
                payment = 60
            },
            [11] = {
                name = 'Korpschef',
                isboss = true,
                bankAuth = true,
                payment = 70
            },
        },
    },

    ['kmar_uitdienst'] = {
        label = 'Marechaussee (Uitdienst)',
        type = 'leo',
        defaultDuty = false,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Marechaussee in Opleiding',
                payment = 20
            },
            [1] = {
                name = 'Marechaussee der 3e Klasse',
                payment = 25
            },
            [2] = {
                name = 'Marechaussee der 2e Klasse',
                payment = 30
            },
            [3] = {
                name = 'Marechaussee der 1e Klasse',
                payment = 35
            },
            [4] = {
                name = 'Korporaal',
                payment = 38
            },
            [5] = {
                name = 'Sergeant',
                payment = 42
            },
            [6] = {
                name = 'Sergeant der 1e Klasse',
                payment = 45
            },
            [7] = {
                name = 'Adjudant-Onderofficier',
                payment = 48
            },
            [8] = {
                name = 'Luitenant',
                payment = 52
            },
            [9] = {
                name = 'Kapitein',
                isboss = true,
                bankAuth = true,
                payment = 60
            },
        },
    },

    ['ambulance_uitdienst'] = {
        label = 'Ambulance (Uitdienst)',
        type = 'ems',
        defaultDuty = false,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Stagiair',
                payment = 15
            },
            [1] = {
                name = 'Ambulancehulpverlener',
                payment = 18
            },
            [2] = {
                name = 'Ambulancechauffeur',
                payment = 20
            },
            [3] = {
                name = 'Ambulanceverpleegkundige',
                payment = 24
            },
            [4] = {
                name = 'Senior Ambulanceverpleegkundige',
                payment = 28
            },
            [5] = {
                name = 'Verpleegkundig Specialist',
                payment = 32
            },
            [6] = {
                name = 'Basisarts',
                payment = 36
            },
            [7] = {
                name = 'Arts',
                payment = 40
            },
            [8] = {
                name = 'Traumaarts',
                payment = 44
            },
            [9] = {
                name = 'Anesthesioloog',
                payment = 48
            },
            [10] = {
                name = 'Medisch Manager Ambulancezorg',
                payment = 55
            },
            [11] = {
                name = 'Regionaal Directeur GGD/GHOR',
                isboss = true,
                bankAuth = true,
                payment = 65
            },
        },
    },

    ['pechhulp_uitdienst'] = {
        label = 'Pechhulp (Uitdienst)',
        type = 'mechanic',
        defaultDuty = false,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Stagiair',
                payment = 15
            },
            [1] = {
                name = 'Hulpverlener',
                payment = 20
            },
            [2] = {
                name = 'Monteur',
                payment = 25
            },
            [3] = {
                name = 'Senior Monteur',
                payment = 30
            },
            [4] = {
                name = 'Specialist',
                payment = 35
            },
            [5] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 45
            },
        },
    },

    -- ==========================================
    --  BRANDWEER
    -- ==========================================

    ['fire_department'] = {
        label = 'Brandweer',
        type = 'fire',
        defaultDuty = true,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Stagiair',
                payment = 0
            },
            [1] = {
                name = 'Brandwacht',
                payment = 60
            },
            [2] = {
                name = 'Brandweervrouw/-man',
                payment = 75
            },
            [3] = {
                name = 'Onderbrandmeester',
                payment = 90
            },
            [4] = {
                name = 'Brandmeester',
                payment = 105
            },
            [5] = {
                name = 'Hoofdbrandmeester',
                payment = 120
            },
            [6] = {
                name = 'Bevelvoerder',
                payment = 135
            },
            [7] = {
                name = 'Commandant',
                isboss = true,
                bankAuth = true,
                payment = 165
            },
        },
    },

    -- ==========================================
    --  PECHHULP / WEGENWACHT
    -- ==========================================

    ['pechhulp'] = {
        label = 'Pechhulp',
        type = 'mechanic',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Stagiair',
                payment = 40
            },
            [1] = {
                name = 'Hulpverlener',
                payment = 60
            },
            [2] = {
                name = 'Monteur',
                payment = 75
            },
            [3] = {
                name = 'Senior Monteur',
                payment = 90
            },
            [4] = {
                name = 'Specialist',
                payment = 110
            },
            [5] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 135
            },
        },
    },

    -- ==========================================
    --  TAKELDIENST / SLEEPWAGEN
    -- ==========================================

    ['tow'] = {
        label = 'Takeldienst',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Chauffeur',
                payment = 50
            },
            [1] = {
                name = 'Senior Chauffeur',
                payment = 65
            },
            [2] = {
                name = 'Voorman',
                payment = 80
            },
            [3] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 100
            },
        },
    },

    -- ==========================================
    --  MONTEUR / GARAGE
    -- ==========================================

    ['mechanic'] = {
        label = 'Monteur',
        type = 'mechanic',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Leerling',
                payment = 50
            },
            [1] = {
                name = 'Medewerker',
                payment = 65
            },
            [2] = {
                name = 'Monteur',
                payment = 80
            },
            [3] = {
                name = 'Senior Monteur',
                payment = 100
            },
            [4] = {
                name = 'Hoofdmonteur',
                payment = 120
            },
            [5] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },

    -- ==========================================
    --  RECHTBANK / JUSTITIE
    -- ==========================================

    ['judge'] = {
        label = 'Rechtbank',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Griffier',
                payment = 75
            },
            [1] = {
                name = 'Officier van Justitie',
                payment = 100
            },
            [2] = {
                name = 'Rechter',
                payment = 125
            },
            [3] = {
                name = 'Hoofdrechter',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },

    ['lawyer'] = {
        label = 'Advocatenkantoor',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Stagiair',
                payment = 50
            },
            [1] = {
                name = 'Junior Advocaat',
                payment = 70
            },
            [2] = {
                name = 'Advocaat',
                payment = 90
            },
            [3] = {
                name = 'Senior Advocaat',
                payment = 115
            },
            [4] = {
                name = 'Partner',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },

    -- ==========================================
    --  MEDIA / NIEUWS
    -- ==========================================

    ['reporter'] = {
        label = 'Journalist',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Freelancer',
                payment = 40
            },
            [1] = {
                name = 'Verslaggever',
                payment = 55
            },
            [2] = {
                name = 'Journalist',
                payment = 70
            },
            [3] = {
                name = 'Hoofdredacteur',
                isboss = true,
                bankAuth = true,
                payment = 100
            },
        },
    },

    -- ==========================================
    --  VASTGOED
    -- ==========================================

    ['realestate'] = {
        label = 'Vastgoed',
        type = 'realestate',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Stagiair',
                payment = 50
            },
            [1] = {
                name = 'Woningmakelaar',
                payment = 75
            },
            [2] = {
                name = 'Commercieel Makelaar',
                payment = 100
            },
            [3] = {
                name = 'Senior Makelaar',
                payment = 125
            },
            [4] = {
                name = 'Directeur',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },

    -- ==========================================
    --  TRANSPORT / LOGISTIEK
    -- ==========================================

    ['taxi'] = {
        label = 'Taxi',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Stagiair',
                payment = 50
            },
            [1] = {
                name = 'Chauffeur',
                payment = 65
            },
            [2] = {
                name = 'Senior Chauffeur',
                payment = 80
            },
            [3] = {
                name = 'Dispatcher',
                payment = 100
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 125
            },
        },
    },

    ['bus'] = {
        label = 'Busmaatschappij',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Chauffeur',
                payment = 50
            },
            [1] = {
                name = 'Senior Chauffeur',
                payment = 65
            },
            [2] = {
                name = 'Dienstleider',
                isboss = true,
                bankAuth = true,
                payment = 85
            },
        },
    },

    ['bus_driver'] = {
        label = 'Buschauffeur',
        defaultDuty = true,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Chauffeur',
                payment = 0
            },
        },
    },

    ['trucker'] = {
        label = 'Vrachtwagenchauffeur',
        defaultDuty = true,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Chauffeur',
                payment = 0
            },
            [1] = {
                name = 'Senior Chauffeur',
                payment = 60
            },
            [2] = {
                name = 'Teamleider',
                isboss = true,
                bankAuth = true,
                payment = 85
            },
        },
    },

    ['roadhelper'] = {
        label = 'pech op de weg',
        defaultDuty = true,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Medewerker',
                payment = 0
            },
        },
    },

    ['forklifter'] = {
        label = 'Vorkheftruckchauffeur',
        defaultDuty = true,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Operator',
                payment = 0
            },
        },
    },

    -- ==========================================
    --  VOERTUIGEN / DEALER
    -- ==========================================

    ['cardealer'] = {
        label = 'Autodealer',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Stagiair',
                payment = 50
            },
            [1] = {
                name = 'Verkoper',
                payment = 70
            },
            [2] = {
                name = 'Bedrijfsverkoper',
                payment = 90
            },
            [3] = {
                name = 'Financieel Adviseur',
                payment = 115
            },
            [4] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
        },
    },

    ['project_car'] = {
        label = 'Project Auto',
        defaultDuty = true,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Ingenieur',
                payment = 0
            },
        },
    },

    -- ==========================================
    --  HORECA / ETEN & DRINKEN
    -- ==========================================

    ['hotdog'] = {
        label = 'Hotdogkraam',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Verkoper',
                payment = 50
            },
        },
    },

    ['mobile_hotdog'] = {
        label = 'Mobiele Hotdog',
        defaultDuty = true,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Verkoper',
                payment = 0
            },
        },
    },

    ['pizza_delivery'] = {
        label = 'Pizzabezorger',
        defaultDuty = true,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Bezorger',
                payment = 0
            },
        },
    },

    -- ==========================================
    --  BEZORGING / KOERIERS
    -- ==========================================

    ['news_delivery'] = {
        label = 'Krantenbezorger',
        defaultDuty = true,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Bezorger',
                payment = 0
            },
        },
    },

    -- ==========================================
    --  GEMEENTEDIENSTEN / OPENBARE WERKEN
    -- ==========================================

    ['garbage'] = {
        label = 'Afvalverwerking',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Vuilnisman',
                payment = 50
            },
            [1] = {
                name = 'Senior Vuilnisman',
                payment = 65
            },
            [2] = {
                name = 'Voorman',
                isboss = true,
                bankAuth = true,
                payment = 80
            },
        },
    },

    ['gardener'] = {
        label = 'Hovenier',
        defaultDuty = true,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Medewerker',
                payment = 0
            },
        },
    },

    ['electrician'] = {
        label = 'Elektricien',
        defaultDuty = true,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Leerling',
                payment = 0
            },
            [1] = {
                name = 'Elektricien',
                payment = 55
            },
            [2] = {
                name = 'Hoofdelektricien',
                isboss = true,
                bankAuth = true,
                payment = 80
            },
        },
    },

    -- ==========================================
    --  AGRARISCH / NATUUR
    -- ==========================================

    ['vineyard'] = {
        label = 'Wijngaard',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            [0] = {
                name = 'Plukker',
                payment = 50
            },
            [1] = {
                name = 'Wijnmaker',
                payment = 70
            },
            [2] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 90
            },
        },
    },

    ['farmer'] = {
        label = 'Boerderij',
        defaultDuty = true,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Medewerker',
                payment = 0
            },
            [1] = {
                name = 'Boer',
                payment = 55
            },
            [2] = {
                name = 'Eigenaar',
                isboss = true,
                bankAuth = true,
                payment = 80
            },
        },
    },

    ['hunter'] = {
        label = 'Jager',
        defaultDuty = true,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Jager',
                payment = 0
            },
        },
    },

    ['diver'] = {
        label = 'Duiker',
        defaultDuty = true,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Duiker',
                payment = 0
            },
        },
    },

    ['detectorist'] = {
        label = 'Metaaldetectivist',
        defaultDuty = true,
        offDutyPay = true,
        grades = {
            [0] = {
                name = 'Medewerker',
                payment = 0
            },
        },
    },

}