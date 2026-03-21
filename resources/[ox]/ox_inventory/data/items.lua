return {
    -- ==================== VOORBEELDITEMS ====================
    ['testburger'] = {
        label = 'Test Burger',
        weight = 220,
        degrade = 60,
        client = {
            image = 'burger_chicken.png',
            status = { hunger = 200000 },
            anim = 'eating',
            prop = 'burger',
            usetime = 2500,
            export = 'ox_inventory_examples.testburger'
        },
        server = {
            export = 'ox_inventory_examples.testburger',
            test = 'what an amazingly delicious burger, amirite?'
        },
        buttons = {
            {
                label = 'Eraan likken',
                action = function(slot)
                    print('Je likte de burger')
                end
            },
            {
                label = 'Knijpen',
                action = function(slot)
                    print('Je kneep in de burger :(')
                end
            },
            {
                label = 'Wat noem je een vegan burger?',
                group = 'Burger grappen',
                action = function(slot)
                    print('Een vergissing.')
                end
            },
        },
        consume = 0.3
    },

    -- ==================== MEDISCH ====================
    ['bandage'] = {
        label = 'Verband',
        description = 'Goed voor het stelpen van bloedingen en kleine verwondingen.',
        weight = 115,
        stack = true,
        close = true
    },

    ['firstaid'] = {
        label = 'EHBO-doos',
        weight = 800,
        stack = true,
    },

    ['ifaks'] = {
        label = 'Individueel EHBO-pakket',
        weight = 500,
        stack = true,
    },

    ['painkillers'] = {
        label = 'Pijnstillers',
        weight = 50,
        stack = true,
        close = false,
        description = 'Medicatie om pijn te verlichten en koorts te verlagen.',
    },

    ['medical_kit'] = {
        label = 'Medische tas',
        weight = 1200,
        stack = false,
        close = false,
        description = 'Een basis medische tas met essentiële benodigdheden voor kleine verwondingen.',
    },

    ['advanced_medical_kit'] = {
        label = 'Geavanceerde medische tas',
        weight = 2000,
        stack = false,
        close = false,
        description = 'Een geavanceerde medische tas met extra middelen en apparatuur voor ernstige verwondingen.',
    },

    ['blood_bag_250'] = {
        label = 'Bloedzak 250ml',
        weight = 280,
        stack = true,
        close = false,
        description = 'Een zak van 250ml bloed voor bloedtransfusies.',
    },

    ['blood_bag_500'] = {
        label = 'Bloedzak 500ml',
        weight = 550,
        stack = true,
        close = false,
        description = 'Een zak van 500ml bloed voor bloedtransfusies.',
    },

    ['adrenaline'] = {
        label = 'Adrenaline',
        weight = 30,
        stack = true,
        close = false,
    },

    ['morphine'] = {
        label = 'Morfine',
        weight = 30,
        stack = true,
        close = false,
        description = 'Medicatie om zware pijn te verlichten.',
    },

    ['suture_kit'] = {
        label = 'Hechtset',
        weight = 150,
        stack = true,
        close = false,
        description = 'Medisch hulpmiddel om wonden te hechten.',
    },

    ['icepack'] = {
        label = 'IJszak',
        weight = 200,
        stack = true,
        close = false,
        description = 'Een zak ijs om zwelling te verminderen en pijn te verzachten.',
    },

    ['splint'] = {
        label = 'Spalk',
        weight = 150,
        stack = true,
        close = false,
        description = 'Een hulpmiddel om druk op een ledemaat uit te oefenen.',
    },

    ['defibrilator'] = {
        label = 'Defibrillator',
        weight = 3000,
        stack = false,
        close = true,
    },

    ['bodybag'] = {
        label = 'Lijkzak',
        weight = 400,
        stack = true,
        close = false,
    },

    ['gauze'] = {
        label = 'Gaasverband',
        weight = 20,
        stack = true,
        close = true,
        description = 'Dun, open geweven gaas voor verbanden en wondverzorging.',
    },

    ['ointment'] = {
        label = 'Zalf',
        weight = 80,
        stack = true,
        close = true,
        description = 'Medische crème voor genezing en infectiepreventie bij kleine wonden.',
    },

    ['disinfectant'] = {
        label = 'Desinfectans',
        weight = 200,
        stack = true,
        close = true,
        description = 'Een vloeistof die bacteriën en micro-organismen op oppervlakken doodt.',
    },

    ['cyclonamine'] = {
        label = 'Cyclonamine',
        weight = 30,
        stack = true,
        close = true,
    },

    ['tourniquet'] = {
        label = 'Tourniquet',
        weight = 100,
        stack = true,
        close = true,
        description = 'Een hulpmiddel om bloeding te stoppen door druk op een ledemaat.',
    },

    ['medicbag'] = {
        label = 'Medische tas',
        weight = 2500,
        stack = false,
        close = true,
        description = 'Een tas met medische hulpmiddelen en benodigdheden.',
    },

    ['antipyretics'] = {
        label = 'Koortswerend middel',
        weight = 50,
        stack = true,
        close = true,
        description = 'Medicatie die koorts verlaagt.',
    },

    ['ambulance_gps'] = {
        label = 'Ambulance GPS',
        weight = 250,
        stack = false,
        close = true,
    },

    ['crutch'] = {
        label = 'Kruk',
        weight = 800,
        stack = false,
        close = true,
    },

    ['wheelchair'] = {
        label = 'Rolstoel',
        weight = 18000,
        stack = false,
        close = true,
    },

    ['stretcher'] = {
        label = 'Brancard',
        weight = 7000,
        stack = false,
        close = true,
    },

    -- ==================== ETEN & DRINKEN ====================
    ['burger'] = {
        label = 'Hamburger',
        weight = 220,
        stack = true,
        client = {
            status = { hunger = 200000 },
            anim = 'eating',
            prop = 'burger',
            usetime = 2500,
            notification = 'Je at een heerlijke hamburger'
        },
    },

    ['sprunk'] = {
        label = 'Sprunk',
        weight = 350,
        stack = true,
        client = {
            status = { thirst = 200000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
            usetime = 2500,
            notification = 'Je leste je dorst met een Sprunk'
        }
    },

    ['water'] = {
        label = 'Water',
        weight = 500,
        stack = true,
        client = {
            status = { thirst = 200000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
            usetime = 2500,
            cancel = true,
            notification = 'Je dronk verfrissend water'
        }
    },

    ['mustard'] = {
        label = 'Mosterd',
        weight = 500,
        stack = true,
        client = {
            status = { hunger = 25000, thirst = 25000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
            usetime = 2500,
            notification = 'Je... dronk mosterd'
        }
    },

    ['sandwich'] = {
        label = 'Broodje',
        weight = 200,
        stack = true,
    },

    ['coffee'] = {
        label = 'Koffie',
        weight = 250,
        stack = true,
        client = {
            status = { thirst = 200000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = {
                model = 'v_res_mcofcup',
                bone = 18905,
                pos = vec3(0.14, 0.0, 0.07),
                rot = vec3(-119.7, -54.56, 7.22)
            },
            usetime = 6500,
        }
    },

    ['vodka'] = {
        label = 'Wodka',
        weight = 500,
        stack = true,
    },

    ['whiskey'] = {
        label = 'Whiskey',
        weight = 400,
        stack = true,
    },

    ['beer'] = {
        label = 'Bier',
        weight = 350,
        stack = true,
    },

    ['wine'] = {
        label = 'Wijn',
        weight = 750,
        stack = true,
    },

    ['grape'] = {
        label = 'Druif',
        weight = 5,
        stack = true,
    },

    ['grapejuice'] = {
        label = 'Druivensap',
        weight = 300,
        stack = true,
    },

    ['mojito'] = {
        label = 'Mojito',
        weight = 300,
        stack = true,
    },

    ['champagne'] = {
        label = 'Champagne',
        weight = 750,
        stack = true,
    },

    ['tequila'] = {
        label = 'Tequila',
        weight = 400,
        stack = true,
    },

    ['martini'] = {
        label = 'Martini',
        weight = 300,
        stack = true,
    },

    ['icetea'] = {
        label = 'IJsthee',
        weight = 350,
        stack = true,
    },

    ['lemonade'] = {
        label = 'Limonade',
        weight = 350,
        stack = true,
    },

    -- Snacks & chips
    ['chips_cheese'] = {
        label = 'Chips Big Cheese',
        weight = 130,
        stack = true,
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = 'mxc_vend_prop_item_chips1', bone = 57005, pos = vec3(0.16, 0.01, -0.04), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 6500,
        }
    },
    ['chips_paprika'] = {
        label = 'Chips Paprika',
        weight = 130,
        stack = true,
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = 'mxc_vend_prop_item_chips2', bone = 57005, pos = vec3(0.16, 0.01, -0.04), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 6500,
        }
    },
    ['chips_ribs'] = {
        label = 'Chips Sticky Ribs',
        weight = 130,
        stack = true,
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = 'mxc_vend_prop_item_chips3', bone = 57005, pos = vec3(0.16, 0.01, -0.04), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 6500,
        }
    },
    ['chips_salt'] = {
        label = 'Chips Zout & Azijn',
        weight = 130,
        stack = true,
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = 'mxc_vend_prop_item_chips4', bone = 57005, pos = vec3(0.16, 0.01, -0.04), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 6500,
        }
    },
    ['chips_supersalt'] = {
        label = 'Chips Extra Zout',
        weight = 130,
        stack = true,
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = 'mxc_vend_prop_item_chips5', bone = 57005, pos = vec3(0.16, 0.01, -0.04), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 6500,
        }
    },
    ['chips_habanero'] = {
        label = 'Chips Habanero',
        weight = 130,
        stack = true,
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = 'mxc_vend_prop_item_chips6', bone = 57005, pos = vec3(0.16, 0.01, -0.04), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 6500,
        }
    },

    ['chocolate_meteorite'] = {
        label = 'Chocolade: Meteoriet',
        weight = 50,
        stack = true,
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = `mxc_vend_prop_item_chocolate1`, bone = 18905, pos = vec3(0.12, 0.04, 0.01), rot = vec3(51.55, -47.5, -4.65) },
            usetime = 2500,
        }
    },
    ['chocolate_captain'] = {
        label = "Chocolade: Kapitein's Log",
        weight = 50,
        stack = true,
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = `mxc_vend_prop_item_chocolate2`, bone = 18905, pos = vec3(0.12, 0.04, 0.01), rot = vec3(51.55, -47.5, -4.65) },
            usetime = 2500,
        }
    },

    ['candy_zebra'] = {
        label = 'Snoep: Zebrabar',
        weight = 40,
        stack = true,
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger_fp' },
            prop = { model = `mxc_vend_prop_item_candybar1`, bone = 18905, pos = vec3(0.12, 0.04, 0.01), rot = vec3(51.55, -47.5, -4.65) },
            usetime = 2500,
        }
    },
    ['candy_psqs'] = {
        label = "Snoep: P's & Q's",
        weight = 40,
        stack = true,
        client = {
            status = { hunger = 200000 },
            anim = { dict = 'mp_player_inteat@pnq', clip = 'loop' },
            prop = { model = `mxc_vend_prop_item_candybar2`, bone = 18905, pos = vec3(0.14, -0.02, 0.06), rot = vec3(65.76, -57.6, 2.8) },
            usetime = 2500,
        }
    },

    ['condom'] = {
        label = 'Condoom',
        weight = 5,
        stack = true,
    },

    ['medicine_laxmax'] = {
        label = 'Medicijn: Laxeermiddel',
        weight = 80,
        stack = true,
        client = {
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = 'mxc_vend_prop_item_medical1', bone = 57005, pos = vec3(0.16, 0.01, -0.07), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 1500,
        }
    },
    ['medicine_alcopatch'] = {
        label = 'Medicijn: AlcoPlakker',
        weight = 30,
        stack = true,
        client = {
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = 'mxc_vend_prop_item_medical2', bone = 57005, pos = vec3(0.16, 0.01, -0.07), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 1500,
        }
    },
    ['medicine_mollis'] = {
        label = 'Medicijn: Mollis',
        weight = 80,
        stack = true,
        client = {
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = 'mxc_vend_prop_item_medical3', bone = 57005, pos = vec3(0.16, 0.01, -0.07), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 1500,
        }
    },
    ['medicine_betta'] = {
        label = 'Medicijn: Betta',
        weight = 80,
        stack = true,
        client = {
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = 'mxc_vend_prop_item_medical4', bone = 57005, pos = vec3(0.16, 0.01, -0.07), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 1500,
        }
    },

    ['gum_peppermint'] = {
        label = 'Kauwgom: Pepermunt',
        weight = 15,
        stack = true,
        client = {
            anim = { dict = 'mp_player_inteat@pnq', clip = 'loop' },
            prop = { model = `mxc_vend_prop_item_gum1`, bone = 18905, pos = vec3(0.14, -0.02, 0.06), rot = vec3(65.76, -57.6, 2.8) },
            usetime = 2500,
        }
    },
    ['gum_cinnamon'] = {
        label = 'Kauwgom: Kaneel',
        weight = 15,
        stack = true,
        client = {
            anim = { dict = 'mp_player_inteat@pnq', clip = 'loop' },
            prop = { model = `mxc_vend_prop_item_gum2`, bone = 18905, pos = vec3(0.14, -0.02, 0.06), rot = vec3(65.76, -57.6, 2.8) },
            usetime = 2500,
        }
    },
    ['gum_spearmint'] = {
        label = 'Kauwgom: Spearmint',
        weight = 15,
        stack = true,
        client = {
            anim = { dict = 'mp_player_inteat@pnq', clip = 'loop' },
            prop = { model = `mxc_vend_prop_item_gum3`, bone = 18905, pos = vec3(0.14, -0.02, 0.06), rot = vec3(65.76, -57.6, 2.8) },
            usetime = 2500,
        }
    },

    -- Flessen
    ['bottle_cola'] = {
        label = 'Cola flesje',
        weight = 500,
        stack = true,
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `mxc_vend_prop_item_bottle1`, bone = 18905, pos = vec3(0.12, -0.03, 0.03), rot = vec3(-98.4, 0.0, -15.0) },
            usetime = 2500,
        }
    },
    ['bottle_junk'] = {
        label = 'Junk flesje',
        weight = 500,
        stack = true,
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `mxc_vend_prop_item_bottle2`, bone = 18905, pos = vec3(0.12, -0.03, 0.03), rot = vec3(-98.4, 0.0, -15.0) },
            usetime = 2500,
        }
    },
    ['bottle_orang'] = {
        label = 'Orang Tang flesje',
        weight = 500,
        stack = true,
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `mxc_vend_prop_item_bottle3`, bone = 18905, pos = vec3(0.12, -0.03, 0.03), rot = vec3(-98.4, 0.0, -15.0) },
            usetime = 2500,
        }
    },
    ['bottle_tonic'] = {
        label = 'Tonic flesje',
        weight = 500,
        stack = true,
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `mxc_vend_prop_item_bottle4`, bone = 18905, pos = vec3(0.12, -0.03, 0.03), rot = vec3(-98.4, 0.0, -15.0) },
            usetime = 2500,
        }
    },
    ['bottle_water'] = {
        label = 'Water flesje',
        weight = 500,
        stack = true,
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `mxc_vend_prop_item_bottle5`, bone = 18905, pos = vec3(0.12, -0.03, 0.03), rot = vec3(-98.4, 0.0, -15.0) },
            usetime = 2500,
        }
    },
    ['bottle_sprunk'] = {
        label = 'Sprunk flesje',
        weight = 500,
        stack = true,
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `mxc_vend_prop_item_bottle6`, bone = 18905, pos = vec3(0.12, -0.03, 0.03), rot = vec3(-98.4, 0.0, -15.0) },
            usetime = 2500,
        }
    },

    -- Blikjes
    ['can_cola'] = {
        label = 'Cola blikje',
        weight = 330,
        stack = true,
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = `mxc_vend_prop_item_cansoda1`, bone = 57005, pos = vec3(0.14, 0.01, -0.04), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 2500,
        }
    },
    ['can_orang'] = {
        label = 'Orang Tang blikje',
        weight = 330,
        stack = true,
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = `mxc_vend_prop_item_cansoda2`, bone = 57005, pos = vec3(0.14, 0.01, -0.04), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 2500,
        }
    },
    ['can_junk'] = {
        label = 'Junk blikje',
        weight = 330,
        stack = true,
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = `mxc_vend_prop_item_cansoda3`, bone = 57005, pos = vec3(0.14, 0.01, -0.04), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 2500,
        }
    },
    ['can_sprunk'] = {
        label = 'Sprunk blikje',
        weight = 330,
        stack = true,
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = `mxc_vend_prop_item_cansoda4`, bone = 57005, pos = vec3(0.14, 0.01, -0.04), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 2500,
        }
    },
    ['can_logger'] = {
        label = 'Logger blikje',
        weight = 330,
        stack = true,
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = `mxc_vend_prop_item_canbeer1`, bone = 57005, pos = vec3(0.14, 0.01, -0.04), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 2500,
        }
    },
    ['can_blarneys'] = {
        label = "Blarneys blikje",
        weight = 330,
        stack = true,
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = `mxc_vend_prop_item_canbeer2`, bone = 57005, pos = vec3(0.14, 0.01, -0.04), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 2500,
        }
    },
    ['can_hoplivion'] = {
        label = 'Hoplivion blikje',
        weight = 330,
        stack = true,
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = `mxc_vend_prop_item_canbeer3`, bone = 57005, pos = vec3(0.14, 0.01, -0.04), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 2500,
        }
    },
    ['can_cerbeza'] = {
        label = 'Cerbeza blikje',
        weight = 330,
        stack = true,
        client = {
            status = { thirst = 300000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_a' },
            prop = { model = `mxc_vend_prop_item_canbeer4`, bone = 57005, pos = vec3(0.14, 0.01, -0.04), rot = vec3(-64.96, 36.0, -3.0) },
            usetime = 2500,
        }
    },

    -- Burgershop items
    ['burger_bleeder'] = { label = 'Bleeder Burger', weight = 300, stack = true },
    ['burger_heartstopper'] = { label = 'Hartstilstand Burger', weight = 500, stack = true },
    ['burger_torpedo'] = { label = 'Torpedo Broodje', weight = 200, stack = true },
    ['burger_meatfree'] = { label = 'Vleesvrije Burger', weight = 200, stack = true },
    ['burger_moneyshot'] = { label = 'Money Shot Burger', weight = 300, stack = true },
    ['burger_chickenwrap'] = { label = 'Kipwrap', weight = 200, stack = true },
    ['burger_donut'] = { label = 'Donut', weight = 100, stack = true },
    ['burger_applepie'] = { label = 'Appeltaart', weight = 200, stack = true },
    ['burger_fries'] = { label = 'Frietjes', weight = 150, stack = true },
    ['burger_coffee'] = { label = 'Koffie', weight = 250, stack = true },
    ['burger_ecola'] = { label = 'eCola', weight = 350, stack = true },
    ['burger_sprunk'] = { label = 'Sprunk', weight = 350, stack = true },
    ['burger_emptycup'] = { label = 'Leeg bekertje', weight = 20, stack = true },

    -- Kookingrediënten
    ['bacon'] = { label = 'Spek', weight = 100, stack = true },
    ['bun'] = { label = 'Hamburgerbroodje', weight = 80, stack = true },
    ['baguette'] = { label = 'Stokbrood', weight = 250, stack = true },
    ['cheddar'] = { label = 'Cheddar kaas', weight = 30, stack = true },
    ['raw_chicken'] = { label = 'Rauwe kip', weight = 300, stack = true },
    ['chicken_strips'] = { label = 'Kipstrips', weight = 200, stack = true },
    ['cooked_patty'] = { label = 'Gebakken burgerpatty', weight = 150, stack = true },
    ['patty'] = { label = 'Rauwe burgerpatty', weight = 150, stack = true },
    ['sliced_onion'] = { label = 'Gesneden ui', weight = 50, stack = true },
    ['lettuce'] = { label = 'Verse sla', weight = 50, stack = true },
    ['tomato'] = { label = 'Tomaat', weight = 80, stack = true },
    ['wrap'] = { label = 'Tortillawrap', weight = 60, stack = true },
    ['sliced_potato'] = { label = 'Aardappel', weight = 200, stack = true },

    -- ==================== DOCUMENTEN & IDs ====================
    ['money'] = {
        label = 'Geld',
        weight = 1,
        stack = true,
    },

    ['black_money'] = {
        label = 'Zwart Geld',
        weight = 1,
        stack = true,
    },

    ['id_card'] = {
        label = 'Identiteitskaart',
        weight = 5,
        stack = false,
    },

    ['driving_license'] = {
        label = 'Rijbewijs',
        weight = 5,
        stack = false,
    },

    ['driver_license'] = {
        label = 'Rijbewijs',
        weight = 5,
        stack = false,
    },

    ['flying_license'] = {
        label = 'Vliegbrevet',
        weight = 5,
        stack = false,
    },

    ['boat_license'] = {
        label = 'Vaarbewijs',
        weight = 5,
        stack = false,
    },

    ['weaponlicense'] = {
        label = 'Wapenverlof',
        weight = 5,
        stack = false,
    },

    ['weapon_license'] = {
        label = 'Wapenverlof',
        weight = 5,
        stack = false,
    },

    ['lawyerpass'] = {
        label = 'Advocatenpas',
        weight = 5,
        stack = false,
    },

    ['police_badge'] = {
        label = 'Politiebadge',
        weight = 50,
        stack = false,
    },

    ['sheriff_badge'] = {
        label = 'Sheriffbadge',
        weight = 50,
        stack = false,
    },

    ['fib_badge'] = {
        label = 'FIB-badge',
        weight = 50,
        stack = false,
    },

    ['traffic_ticket'] = {
        label = 'Verkeersboete',
        weight = 5,
        stack = false,
        close = false,
        consume = 0,
    },

    ['contract'] = {
        label = 'Contract',
        weight = 10,
        stack = false,
    },

    ['stickynote'] = {
        label = 'Plakbriefje',
        weight = 1,
        stack = true,
    },

    -- ==================== UITRUSTING & TOOLS ====================
    ['lockpick'] = {
        label = 'Dievenpincet',
        weight = 50,
        stack = true,
    },

    ['advancedlockpick'] = {
        label = 'Geavanceerd dievenpincet',
        weight = 100,
        stack = true,
    },

    ['screwdriverset'] = {
        label = 'Schroevendraaier set',
        weight = 400,
        stack = true,
    },

    ['electronickit'] = {
        label = 'Elektronicakit',
        weight = 400,
        stack = true,
    },

    ['cleaningkit'] = {
        label = 'Reinigingsset',
        weight = 300,
        stack = true,
    },

    ['repairkit'] = {
        label = 'Reparatieset',
        weight = 2500,
        stack = true,
    },

    ['advancedrepairkit'] = {
        label = 'Geavanceerde reparatieset',
        weight = 4000,
        stack = true,
    },

    ['phone'] = {
        label = 'Telefoon',
        weight = 190,
        stack = true,
        consume = 0,
        client = {
            add = function(total)
                if total > 0 then
                    pcall(function() return exports['lb-phone']:setPhoneVisible(true) end)
                end
            end,
            remove = function(total)
                if total < 1 then
                    pcall(function() return exports['lb-phone']:setPhoneVisible(false) end)
                end
            end
        }
    },

    ['burner_phone'] = {
        label = 'Wegwerptelefoon',
        weight = 150,
        stack = true,
    },

    ['radio'] = {
        label = 'Radio',
        weight = 400,
        allowArmed = true,
        consume = 0,
        stack = true,
        client = {
            event = 'mm_radio:client:use'
        }
    },

    ['jammer'] = {
        label = 'Radiostoorder',
        weight = 3000,
        allowArmed = true,
        stack = true,
        client = {
            event = 'mm_radio:client:usejammer'
        }
    },

    ['radiocell'] = {
        label = 'AAA Batterijen',
        weight = 30,
        stack = true,
        allowArmed = true,
        client = {
            event = 'mm_radio:client:recharge'
        }
    },

    ['binoculars'] = {
        label = 'Verrekijker',
        weight = 600,
        stack = true,
    },

    ['lighter'] = {
        label = 'Aansteker',
        weight = 25,
        stack = true,
    },

    ['walking_stick'] = {
        label = 'Wandelstok',
        weight = 400,
        stack = true,
    },

    ['parachute'] = {
        label = 'Parachute',
        weight = 8000,
        stack = false,
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 1500
        }
    },

    ['armour'] = {
        label = 'Kogelwerend vest',
        weight = 3000,
        stack = false,
        client = {
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            usetime = 3500
        }
    },

    ['harness'] = {
        label = 'Veiligheidsharnas',
        weight = 800,
        stack = true,
    },

    ['clothing'] = {
        label = 'Kleding',
        weight = 400,
        stack = false,
        consume = 0,
    },

    ['outfit_bag'] = {
        label = 'Kledingtas',
        weight = 500,
        stack = false,
        close = true,
        client = {
            export = 'wais-outfitbag.useBag'
        },
        metadata = {}
    },

    -- ==================== VUURWAPENGERELATEERD ====================
    ['drill'] = {
        label = 'Boormachine',
        weight = 2500,
        stack = false,
    },

    ['thermite'] = {
        label = 'Thermiet',
        weight = 500,
        stack = true,
    },

    ['gatecrack'] = {
        label = 'Hekbreker',
        weight = 800,
        stack = true,
    },

    ['cryptostick'] = {
        label = 'Cryptostick',
        weight = 30,
        stack = true,
    },

    ['trojan_usb'] = {
        label = 'Trojaans USB-stick',
        weight = 20,
        stack = true,
    },

    ['security_card_01'] = {
        label = 'Beveiligingspas A',
        weight = 5,
        stack = true,
    },

    ['security_card_02'] = {
        label = 'Beveiligingspas B',
        weight = 5,
        stack = true,
    },

    -- ==================== WAPENLICENTIES / BLUEPRINTS ====================
    ['blueprint_advancedrifle'] = { label = 'Blauwdruk - Geavanceerd geweer', description = 'Blauwdruk voor het geavanceerd geweer.', weight = 50, stack = false },
    ['blueprint_appistol'] = { label = 'Blauwdruk - APPistool', description = 'Blauwdruk voor het APPistool.', weight = 50, stack = false },
    ['blueprint_assaultrifle'] = { label = 'Blauwdruk - Aanvalsgeweer', description = 'Blauwdruk voor het aanvalsgeweer.', weight = 50, stack = false },
    ['blueprint_assaultrifle_mk2'] = { label = 'Blauwdruk - Aanvalsgeweer MK2', description = 'Blauwdruk voor het aanvalsgeweer MK2.', weight = 50, stack = false },
    ['blueprint_assaultshotgun'] = { label = 'Blauwdruk - Aanvalshagelgeweer', description = 'Blauwdruk voor het aanvalshagelgeweer.', weight = 50, stack = false },
    ['blueprint_assaultsmg'] = { label = 'Blauwdruk - Aanvals-SMG', description = 'Blauwdruk voor de aanvals-SMG.', weight = 50, stack = false },
    ['blueprint_bullpuprifle'] = { label = 'Blauwdruk - Bullpup Rifle', weight = 50, stack = false },
    ['blueprint_bullpuprifle_mk2'] = { label = 'Blauwdruk - Bullpup Rifle MK2', weight = 50, stack = false },
    ['blueprint_bullpupshotgun'] = { label = 'Blauwdruk - Bullpup Hagelgeweer', weight = 50, stack = false },
    ['blueprint_carbinerifle'] = { label = 'Blauwdruk - Karabijn', weight = 50, stack = false },
    ['blueprint_carbinerifle_mk2'] = { label = 'Blauwdruk - Karabijn MK2', weight = 50, stack = false },
    ['blueprint_combatmg'] = { label = 'Blauwdruk - Gevechts-MG', weight = 50, stack = false },
    ['blueprint_combatmg_mk2'] = { label = 'Blauwdruk - Gevechts-MG MK2', weight = 50, stack = false },
    ['blueprint_combatpdw'] = { label = 'Blauwdruk - Gevechts-PDW', weight = 50, stack = false },
    ['blueprint_combatpistol'] = { label = 'Blauwdruk - Gevechtspistoool', weight = 50, stack = false },
    ['blueprint_combatshotgun'] = { label = 'Blauwdruk - Gevechtshagelgeweer', weight = 50, stack = false },
    ['blueprint_compactrifle'] = { label = 'Blauwdruk - Compact Geweer', weight = 50, stack = false },
    ['blueprint_digiscanner'] = { label = 'Blauwdruk - Digiscanner', weight = 50, stack = false },
    ['blueprint_gusenberg'] = { label = 'Blauwdruk - Gusenberg', weight = 50, stack = false },
    ['blueprint_heavypistol'] = { label = 'Blauwdruk - Zwaar Pistool', weight = 50, stack = false },
    ['blueprint_heavyrifle'] = { label = 'Blauwdruk - Zwaar Geweer', weight = 50, stack = false },
    ['blueprint_heavyshotgun'] = { label = 'Blauwdruk - Zwaar Hagelgeweer', weight = 50, stack = false },
    ['blueprint_heavysniper'] = { label = 'Blauwdruk - Zwaar Sluipschuttersgeweer', weight = 50, stack = false },
    ['blueprint_heavysniper_mk2'] = { label = 'Blauwdruk - Zwaar Sluipschuttersgeweer MK2', weight = 50, stack = false },
    ['blueprint_machinepistol'] = { label = 'Blauwdruk - Machinepistool', weight = 50, stack = false },
    ['blueprint_marksmanpistol'] = { label = 'Blauwdruk - Schutterspistool', weight = 50, stack = false },
    ['blueprint_marksmanrifle'] = { label = 'Blauwdruk - Schuttersgeweer', weight = 50, stack = false },
    ['blueprint_marksmanrifle_mk2'] = { label = 'Blauwdruk - Schuttersgeweer MK2', weight = 50, stack = false },
    ['blueprint_metaldetector'] = { label = 'Blauwdruk - Metaaldetector', weight = 50, stack = false },
    ['blueprint_mg'] = { label = 'Blauwdruk - Machinegeweer', weight = 50, stack = false },
    ['blueprint_militaryrifle'] = { label = 'Blauwdruk - Militair Geweer', weight = 50, stack = false },
    ['blueprint_minismg'] = { label = 'Blauwdruk - Mini-SMG', weight = 50, stack = false },
    ['blueprint_musket'] = { label = 'Blauwdruk - Musket', weight = 50, stack = false },
    ['blueprint_pistol'] = { label = 'Blauwdruk - Pistool', weight = 50, stack = false },
    ['blueprint_pistol_mk2'] = { label = 'Blauwdruk - Pistool MK2', weight = 50, stack = false },
    ['blueprint_pistol50'] = { label = 'Blauwdruk - Pistool .50', weight = 50, stack = false },
    ['blueprint_precisionrifle'] = { label = 'Blauwdruk - Precisiegeweer', weight = 50, stack = false },
    ['blueprint_pumpshotgun'] = { label = 'Blauwdruk - Pomphagelgeweer', weight = 50, stack = false },
    ['blueprint_pumpshotgun_mk2'] = { label = 'Blauwdruk - Pomphagelgeweer MK2', weight = 50, stack = false },
    ['blueprint_revolver'] = { label = 'Blauwdruk - Revolver', weight = 50, stack = false },
    ['blueprint_revolver_mk2'] = { label = 'Blauwdruk - Revolver MK2', weight = 50, stack = false },
    ['blueprint_smg'] = { label = 'Blauwdruk - SMG', weight = 50, stack = false },
    ['blueprint_smg_mk2'] = { label = 'Blauwdruk - SMG MK2', weight = 50, stack = false },
    ['blueprint_snspistol'] = { label = 'Blauwdruk - SNS Pistool', weight = 50, stack = false },
    ['blueprint_specialcarbine'] = { label = 'Blauwdruk - Speciale Karabijn', weight = 50, stack = false },
    ['blueprint_specialcarbine_mk2'] = { label = 'Blauwdruk - Speciale Karabijn MK2', weight = 50, stack = false },
    ['blueprint_tacticalrifle'] = { label = 'Blauwdruk - Tactisch Geweer', weight = 50, stack = false },
    ['blueprint_tecpistol'] = { label = 'Blauwdruk - Tec Pistool', weight = 50, stack = false },

    -- ==================== VUURWERK ====================
    ['firework1'] = { label = 'Vuurwerk: 2Brothers', weight = 400, stack = true },
    ['firework2'] = { label = 'Vuurwerk: Klappers', weight = 400, stack = true },
    ['firework3'] = { label = 'Vuurwerk: WipeOut', weight = 400, stack = true },
    ['firework4'] = { label = 'Vuurwerk: Treurwilg', weight = 400, stack = true },

    -- ==================== GRONDSTOFFEN ====================
    ['steel'] = { label = 'Staal', weight = 500, stack = true },
    ['rubber'] = { label = 'Rubber', weight = 200, stack = true },
    ['metalscrap'] = { label = 'Metaalschroot', weight = 300, stack = true },
    ['iron'] = { label = 'IJzer', weight = 500, stack = true },
    ['copper'] = { label = 'Koper', weight = 400, stack = true },
    ['aluminum'] = { label = 'Aluminium', weight = 270, stack = true },
    ['plastic'] = { label = 'Plastic', weight = 100, stack = true },
    ['glass'] = { label = 'Glas', weight = 250, stack = true },

    -- ==================== WAARDEVOLLE SPULLEN ====================
    ['diamond_ring'] = { label = 'Diamanten ring', weight = 10, stack = false },
    ['rolex'] = { label = 'Gouden horloge', weight = 150, stack = false },
    ['goldbar'] = { label = 'Goudstaaf', weight = 12500, stack = true },
    ['goldchain'] = { label = 'Gouden ketting', weight = 80, stack = false },

    -- ==================== ELEKTRONICA ====================
    ['toaster'] = { label = 'Broodrooster', weight = 1200, stack = false },
    ['small_tv'] = { label = 'Kleine tv', weight = 3500, stack = false },

    -- ==================== DUIKUITRUSTING ====================
    ['diving_gear'] = {
        label = 'Duikuitrusting',
        weight = 15000,
        stack = false,
    },

    ['diving_fill'] = {
        label = 'Duikfles',
        weight = 3000,
        stack = false,
    },

    ['antipatharia_coral'] = { label = 'Antipatharia koraal', weight = 500, stack = true },
    ['dendrogyra_coral'] = { label = 'Dendrogyra koraal', weight = 500, stack = true },

    -- ==================== VOERTUIGEN ====================
    ['jerry_can'] = {
        label = 'Jerrycan',
        weight = 5000,
        stack = false,
    },

    ['nitrous'] = {
        label = 'Lachgas',
        weight = 2000,
        stack = false,
    },

    -- ==================== BEWIJS (POLITIE) ====================
    ['empty_evidence_bag'] = { label = 'Lege bewijszak', weight = 30, stack = true },
    ['filled_evidence_bag'] = { label = 'Gevulde bewijszak', weight = 200, stack = true },

    ['fingerprint'] = {
        label = 'Vingerafdrukmonster',
        weight = 5,
        stack = false,
        consume = 0,
    },

    ['bullet'] = {
        label = 'Kogelmonster',
        weight = 5,
        stack = false,
        consume = 0,
    },

    ['blood'] = {
        label = 'Bloedmonster',
        weight = 5,
        stack = false,
        consume = 0,
    },

    ['tracking_band'] = {
        label = 'GPS-band',
        weight = 200,
        stack = false,
        close = false,
        consume = 0,
    },

    -- ==================== POLITIE-UITRUSTING ====================
    ['handcuffs'] = {
        label = 'Handboeien',
        weight = 300,
        stack = true,
        close = false,
        consume = 0,
        client = {
            export = 'p_policejob.handcuffs'
        }
    },

    ['cable_ties'] = {
        label = 'Kabelbinders',
        weight = 30,
        stack = true,
        close = false,
        consume = 0,
    },

    ['zipties'] = {
        label = 'Kabelbinders',
        weight = 30,
        stack = true,
    },

    ['mouthtape'] = {
        label = 'Mondtape',
        weight = 50,
        stack = true,
        close = false,
        consume = 0,
    },

    ['headbag'] = {
        label = 'Hoofdzak',
        weight = 50,
        stack = false,
        close = false,
    },

    ['police_shield'] = {
        label = 'Politieschild',
        weight = 5000,
        stack = false,
        close = false,
        consume = 0,
        client = {
            event = 'p_policejob/client/objects/togglePoliceShield'
        }
    },

    ['police_rappel'] = {
        label = 'Politie rappellijn',
        weight = 800,
        stack = true,
        close = true,
        consume = 0,
        client = {
            event = 'p_policejob/client/heli/usePoliceRappel'
        }
    },

    ['fingerprint_scanner'] = {
        label = 'Vingerafdrukscanner',
        weight = 300,
        stack = true,
        close = true,
        client = {
            export = 'p_policejob.useScanner'
        }
    },

    ['spike_strip'] = {
        label = 'Geniepmat',
        weight = 2000,
        stack = true,
        consume = 1,
        client = {
            export = 'p_policejob.spike_strip'
        }
    },

    ['road_cone'] = { label = 'Verkeerskegel', weight = 1500, stack = true },
    ['consign'] = { label = 'Verkeersbord', weight = 3000, stack = true },
    ['barrier'] = { label = 'Verkeersbarricade', weight = 8000, stack = false },
    ['roadcone_light'] = { label = 'Verlichte verkeerskegel', weight = 1600, stack = true },

    ['police_diving_suit'] = {
        label = 'Politie duikpak',
        weight = 5000,
        consume = 0,
        stack = false,
        server = { export = 'p_policejob.police_diving_suit' }
    },

    ['player_clothes'] = {
        label = 'Jouw kleding',
        weight = 400,
        consume = 0,
        stack = false,
        server = { export = 'p_policejob.player_clothes' }
    },

    ['vest_normal'] = {
        label = 'Kogelwerend vest',
        weight = 3000,
        stack = false,
        consume = 1,
        client = { export = 'p_policejob.vest_normal' }
    },

    ['vest_strong'] = {
        label = 'Zwaar kogelwerend vest',
        weight = 4000,
        stack = false,
        consume = 1,
        client = { export = 'p_policejob.vest_strong' }
    },

    ['body_cam'] = {
        label = 'Lichaamscamera',
        weight = 150,
        consume = 0,
        stack = true,
        server = { export = 'p_policejob.body_cam' }
    },

    ['gps'] = {
        label = 'GPS',
        weight = 150,
        stack = true,
        consume = 0,
        allowArmed = true,
        client = {
            export = 'p_policejob.gps',
            remove = function(total)
                if total < 1 then
                    local activeGPS = exports['p_policejob']:isGpsActive()
                    if activeGPS then exports['p_policejob']:gps() end
                end
            end
        }
    },

    ['camera'] = {
        label = 'Camera',
        stack = true,
        close = true,
        consume = 0,
        weight = 600,
        client = { export = 'p_policejob.camera' }
    },

    ['evidence_camera'] = {
        label = 'Bewijscamera',
        weight = 400,
        stack = true,
        close = true,
        client = { export = 'p_policejob.evidence_camera' }
    },

    ['photo'] = {
        label = 'Foto',
        stack = false,
        close = true,
        weight = 5,
        consume = 0,
        server = { export = 'p_policejob.photo' },
        buttons = {
            {
                label = 'URL kopiëren',
                action = function(slot)
                    TriggerServerEvent('p_policejob/server_camera/CopyPhoto', slot)
                end
            },
        },
    },

    ['megaphone'] = {
        label = 'Megafoon',
        weight = 800,
        stack = true,
        close = false,
        consume = 0,
        client = { export = 'p_policejob.useMegaphone' }
    },

    ['breathalyzer'] = {
        label = 'Blaastest',
        weight = 200,
        stack = true,
        close = true,
        consume = 0,
        client = { export = 'p_policejob.useBreathalyzer' }
    },

    ['cuffs_key'] = {
        label = 'Boeiensleutel',
        weight = 20,
        stack = true,
        close = false,
        consume = 0,
    },

    ['wheel_clamp'] = {
        label = 'Wielklem',
        weight = 5000,
        stack = false,
        close = false,
        consume = 0,
    },

    -- ==================== DRUGS - GRONDSTOFFEN ====================
    ['ammonia'] = { label = 'Ammoniak', weight = 500, stack = true },
    ['sodium_benzoate'] = { label = 'Natriumbenzoaat', weight = 750, stack = true },
    ['baking_soda'] = { label = 'Baksoda', weight = 200, stack = true },
    ['safrole_oil'] = { label = 'Safrololie', weight = 300, stack = true },
    ['aniline_solution'] = { label = 'Anilinesolutie', weight = 250, stack = true },
    ['npp_chemical'] = { label = 'NPP-chemicalie', weight = 300, stack = true },
    ['ergot_fungus'] = { label = 'Moederkoren', weight = 50, stack = true },
    ['generic_leaf'] = { label = 'Blad', weight = 20, stack = true },
    ['anesthetic'] = { label = 'Anesthesie', weight = 200, stack = true },

    ['syringe'] = { label = 'Spuit', weight = 20, stack = true },
    ['plastic_bag'] = { label = 'Plastic zak', weight = 10, stack = true },
    ['pipe'] = { label = 'Pijp', weight = 100, stack = true },
    ['art_papers'] = { label = 'Kunstpapier', weight = 5, stack = true },
    ['chocolate_chips'] = { label = 'Chocoladeschilfers', weight = 100, stack = true },

    -- Verwerkingsmateriaal
    ['meth_tray'] = { label = 'Meth-lade', weight = 1000, stack = true },
    ['meth_table'] = { label = 'Methtafel', weight = 20000, stack = false },
    ['coke_table'] = { label = 'Cocaïnetafel', weight = 20000, stack = false },
    ['weed_table'] = { label = 'Wiettafel', weight = 20000, stack = false },
    ['chem_table'] = { label = 'Chemietafel', weight = 20000, stack = false },

    -- Kweekbenodigdheden
    ['weed_pot'] = { label = 'Bloempot', weight = 500, stack = true },
    ['trowel'] = { label = 'Troffel', weight = 200, stack = false },
    ['fertilizer'] = { label = 'Kunstmest', weight = 1000, stack = true },
    ['water_can'] = { label = 'Gieter', weight = 1500, stack = false },
    ['weed_nutrition'] = { label = 'Plantenvoeding', weight = 1000, stack = true },
    ['weed_papers'] = { label = 'Vloeitjes', weight = 5, stack = true },
    ['rolling_paper'] = { label = 'Vloeitjes', weight = 5, stack = true },
    ['empty_weed_bag'] = { label = 'Lege wietzak', weight = 5, stack = true },
    ['cookie_dough'] = { label = 'Koekjesdeeg', weight = 200, stack = true },

    -- Lichten
    ['light1'] = { label = 'Draagbare lamp', weight = 1500, stack = false },
    ['light2'] = { label = 'Draagbare lamp', weight = 1500, stack = false },

    -- ==================== DRUGS - EINDPRODUCTEN ====================
    ['meth'] = { label = 'Crystal meth', weight = 5, stack = true },
    ['meth_bag'] = { label = 'Methzakje', weight = 10, stack = true },
    ['meth_syringe'] = { label = 'Methspuit', weight = 20, stack = true },

    ['coke_seed'] = { label = 'Cocaplant zaad', weight = 5, stack = true },
    ['coke_leaf'] = { label = 'Cocablad', weight = 20, stack = true },
    ['coke_paste'] = { label = 'Cocaïnepasta', weight = 100, stack = true },
    ['coke'] = { label = 'Cocaïne', weight = 5, stack = true },
    ['coke_bag'] = { label = 'Cocaïnezakje', weight = 10, stack = true },
    ['coke_brick'] = { label = 'Cocaïneblok', weight = 1000, stack = true },
    ['coke_small_brick'] = { label = 'Cocaïnepakket', weight = 500, stack = true },
    ['coke_doll'] = { label = 'Cocaïnepop', weight = 500, stack = true },
    ['cokebaggy'] = { label = 'Zakje coke', weight = 10, stack = true },

    ['weed_seed'] = { label = 'Wietszaadje', weight = 1, stack = true },
    ['weed_ak47_seed'] = { label = 'AK47 zaad', weight = 1, stack = true },
    ['weed_skunk_seed'] = { label = 'Skunk zaad', weight = 1, stack = true },
    ['weed_amnesia_seed'] = { label = 'Amnesia zaad', weight = 1, stack = true },
    ['weed_og-kush_seed'] = { label = 'OGKush zaad', weight = 1, stack = true },
    ['weed_white-widow_seed'] = { label = 'White Widow zaad', weight = 1, stack = true },
    ['weed_purple-haze_seed'] = { label = 'Purple Haze zaad', weight = 1, stack = true },
    ['weed_bud'] = { label = 'Wietknop', weight = 15, stack = true },
    ['clean_weed_bud'] = { label = 'Schone wietknop', weight = 10, stack = true },
    ['weed_cookie'] = { label = 'Wietkoekje', weight = 30, stack = true },
    ['weed_bag'] = { label = 'Wietzakje', weight = 10, stack = true },
    ['weed_joint'] = { label = 'Joint', weight = 5, stack = true },
    ['weed_ak47'] = { label = 'AK47 2g', weight = 20, stack = true },
    ['weed_skunk'] = { label = 'Skunk 2g', weight = 20, stack = true },
    ['weed_amnesia'] = { label = 'Amnesia 2g', weight = 20, stack = true },
    ['weed_og-kush'] = { label = 'OGKush 2g', weight = 20, stack = true },
    ['weed_white-widow'] = { label = 'White Widow 2g', weight = 20, stack = true },
    ['weed_purple-haze'] = { label = 'Purple Haze 2g', weight = 20, stack = true },
    ['weed_brick'] = { label = 'Wietblok', weight = 1000, stack = true },
    ['cannabis'] = { label = 'Wiet', weight = 5, stack = true },
    ['joint'] = { label = 'Joint', weight = 5, stack = true },

    ['poppy_seeds'] = { label = 'Maanzaad', weight = 5, stack = true },
    ['poppy_plant'] = { label = 'Maanplant', weight = 80, stack = true },
    ['opium'] = { label = 'Opium', weight = 10, stack = true },
    ['heroin'] = { label = 'Heroïne', weight = 5, stack = true },
    ['heroin_bag'] = { label = 'Heroïnezakje', weight = 10, stack = true },
    ['heroin_syringe'] = { label = 'Heroïnespuit', weight = 20, stack = true },

    ['lsd_liquid'] = { label = 'LSD vloeistof', weight = 10, stack = true },
    ['lsd'] = { label = 'LSD', weight = 1, stack = true },

    ['ecstasy_crystals'] = { label = 'XTC-kristallen', weight = 5, stack = true },
    ['ecstasy_pill'] = { label = 'XTC-pil', weight = 1, stack = true },
    ['xtcbaggy'] = { label = 'Zakje XTC', weight = 5, stack = true },

    ['mushrooms'] = { label = 'Paddenstoelen', weight = 10, stack = true },
    ['mushroom_powder'] = { label = 'Paddenstoelpoeder', weight = 5, stack = true },
    ['mushroom_chocolate'] = { label = 'Magic chocolate', weight = 30, stack = true },

    ['ketamine'] = { label = 'Ketamine', weight = 5, stack = true },
    ['ketamine_bag'] = { label = 'Ketaminezakje', weight = 10, stack = true },

    ['crack'] = { label = 'Crack', weight = 5, stack = true },
    ['crack_bag'] = { label = 'Crackzakje', weight = 10, stack = true },
    ['crack_pipe'] = { label = 'Crackpijp', weight = 80, stack = true },
    ['crack_syringe'] = { label = 'Crackspuit', weight = 20, stack = true },
    ['crack_baggy'] = { label = 'Zakje crack', weight = 10, stack = true },

    ['fentanyl'] = { label = 'Fentanyl', weight = 1, stack = true },
    ['fentanyl_bag'] = { label = 'Fentanylzakje', weight = 5, stack = true },

    ['oxy'] = { label = 'Oxycodon', weight = 5, stack = true },

    -- ==================== SIGARETTEN & VAPEN ====================
    ['cigs_redwood'] = { label = 'Sigaretten: Redwood', weight = 80, stack = true, client = { anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c' }, prop = { model = 'prop_cs_ciggy_01b', bone = 57005, pos = vec3(0.18, 0.02, 0.02), rot = vec3(0, 103.42, 0) }, usetime = 10000 } },
    ['cigs_redwood2'] = { label = 'Sigaretten: Redwood 2', weight = 80, stack = true, client = { anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c' }, prop = { model = 'prop_cs_ciggy_01b', bone = 57005, pos = vec3(0.18, 0.02, 0.02), rot = vec3(0, 103.42, 0) }, usetime = 10000 } },
    ['cigs_debonaireb'] = { label = 'Sigaretten: Debonaire Blauw', weight = 80, stack = true, client = { anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c' }, prop = { model = 'prop_cs_ciggy_01b', bone = 57005, pos = vec3(0.18, 0.02, 0.02), rot = vec3(0, 103.42, 0) }, usetime = 10000 } },
    ['cigs_debonaireg'] = { label = 'Sigaretten: Debonaire Groen', weight = 80, stack = true, client = { anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c' }, prop = { model = 'prop_cs_ciggy_01b', bone = 57005, pos = vec3(0.18, 0.02, 0.02), rot = vec3(0, 103.42, 0) }, usetime = 10000 } },
    ['cigs_cardiaque'] = { label = 'Sigaretten: Cardiaque', weight = 80, stack = true, client = { anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c' }, prop = { model = 'prop_cs_ciggy_01b', bone = 57005, pos = vec3(0.18, 0.02, 0.02), rot = vec3(0, 103.42, 0) }, usetime = 10000 } },
    ['cigs_69brand'] = { label = 'Sigaretten: 69Brand', weight = 80, stack = true, client = { anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c' }, prop = { model = 'prop_cs_ciggy_01b', bone = 57005, pos = vec3(0.18, 0.02, 0.02), rot = vec3(0, 103.42, 0) }, usetime = 10000 } },
    ['cigs_cok'] = { label = 'Sigaretten: CoK', weight = 80, stack = true, client = { anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c' }, prop = { model = 'prop_cs_ciggy_01b', bone = 57005, pos = vec3(0.18, 0.02, 0.02), rot = vec3(0, 103.42, 0) }, usetime = 10000 } },
    ['cigs_estancia'] = { label = 'Sigaren: Estancia', weight = 80, stack = true, client = { anim = { dict = 'amb@world_human_aa_smoke@male@idle_a', clip = 'idle_c' }, prop = { model = 'prop_cs_ciggy_01b', bone = 57005, pos = vec3(0.18, 0.02, 0.02), rot = vec3(0, 103.42, 0) }, usetime = 10000 } },

    ['svapo_vaporglow1a'] = { label = 'Vaporglow 1A', weight = 50, stack = true },
    ['svapo_vaporglow1b'] = { label = 'Vaporglow 1B', weight = 50, stack = true },
    ['svapo_vaporglow1c'] = { label = 'Vaporglow 1C', weight = 50, stack = true },
    ['svapo_vaporglow1d'] = { label = 'Vaporglow 1D', weight = 50, stack = true },
    ['svapo_vaporglow1e'] = { label = 'Vaporglow 1E', weight = 50, stack = true },
    ['svapo_vaporglow1f'] = { label = 'Vaporglow 1F', weight = 50, stack = true },
    ['svapo_evape1a'] = { label = 'E-Vape 1A', weight = 50, stack = true },
    ['svapo_evape1b'] = { label = 'E-Vape 1B', weight = 50, stack = true },
    ['svapo_evape1c'] = { label = 'E-Vape 1C', weight = 50, stack = true },
    ['svapo_evape1d'] = { label = 'E-Vape 1D', weight = 50, stack = true },
    ['svapo_evape1e'] = { label = 'E-Vape 1E', weight = 50, stack = true },
    ['svapo_evape1f'] = { label = 'E-Vape 1F', weight = 50, stack = true },
    ['svapo_evape2a'] = { label = 'E-Vape 2A', weight = 50, stack = true },
    ['svapo_evape2b'] = { label = 'E-Vape 2B', weight = 50, stack = true },
    ['svapo_evape2c'] = { label = 'E-Vape 2C', weight = 50, stack = true },
    ['svapo_evape2d'] = { label = 'E-Vape 2D', weight = 50, stack = true },
    ['svapo_evape2e'] = { label = 'E-Vape 2E', weight = 50, stack = true },
    ['svapo_evape2f'] = { label = 'E-Vape 2F', weight = 50, stack = true },
    ['svapo_smoke1a'] = { label = 'Sigaret 1A', weight = 80, stack = true },
    ['svapo_smoke1b'] = { label = 'Sigaret 1B', weight = 80, stack = true },
    ['svapo_smoke1c'] = { label = 'Sigaret 1C', weight = 80, stack = true },
    ['svapo_smoke1d'] = { label = 'Sigaret 1D', weight = 80, stack = true },
    ['svapo_smoke1e'] = { label = 'Sigaret 1E', weight = 80, stack = true },
    ['svapo_smoke1f'] = { label = 'Sigaret 1F', weight = 80, stack = true },
    ['svapo_evape_box'] = { label = 'E-Vape doos', weight = 300, stack = true },
    ['svapo_evape2_box'] = { label = 'E-Vape 2 doos', weight = 300, stack = true },
    ['svapo_smoke_box'] = { label = 'Sigarettendoos', weight = 300, stack = true },
    ['svapo_sumo_box'] = { label = 'Sumo doos', weight = 300, stack = true },
    ['svapo_vaporglow_box'] = { label = 'Vaporglow doos', weight = 300, stack = true },

    -- ==================== WIJN ====================
    ['red_grapes'] = { label = 'Rode druiven', weight = 200, stack = true },
    ['white_grapes'] = { label = 'Witte druiven', weight = 200, stack = true },
    ['white_wine_juice'] = { label = 'Witte wijnsap', weight = 1000, stack = true },
    ['red_wine_juice'] = { label = 'Rode wijnsap', weight = 1000, stack = true },
    ['empty_bottle'] = { label = 'Lege wijnfles', weight = 400, stack = true },
    ['white_wine'] = { label = 'Witte wijn', weight = 1200, stack = true },
    ['red_wine'] = { label = 'Rode wijn', weight = 1200, stack = true },
    ['grape_snips'] = { label = 'Druivenschaar', weight = 200, stack = false },

    -- ==================== GEVONDEN VOORWERPEN (METAALDETECTIE) ====================
    ['gold_tooth'] = {
        label = 'Gouden tand',
        weight = 1,
        stack = true,
        close = false,
    },

    ['dirty_photo'] = {
        label = 'Vuile foto',
        weight = 1,
        stack = true,
        close = false,
    },

    ['chain'] = {
        label = 'Ketting',
        weight = 1,
        stack = true,
        close = false,
    },

    ['medal'] = {
        label = 'Medaille',
        weight = 1,
        stack = true,
        close = false,
    },

    ['rusted_tin'] = {
        label = 'Verroest blik',
        weight = 1,
        stack = true,
        close = false,
    },

    ['nail'] = {
        label = 'Spijker',
        weight = 1,
        stack = true,
        close = false,
    },

    ['ring'] = {
        label = 'Ring',
        weight = 1,
        stack = true,
        close = false,
    },

    ['vehicle_tyre'] = {
        label = 'Voertuigband',
        weight = 1,
        stack = true,
        close = false,
    },

    ['vehicle_door'] = {
        label = 'Voertuigdeur',
        weight = 1,
        stack = true,
        close = false,
    },

    -- ==================== OVERIGE ====================
    ['garbage'] = { label = 'Afval', weight = 200, stack = true },

    ['paperbag'] = {
        label = 'Papieren zak',
        weight = 20,
        stack = false,
        close = false,
        consume = 0,
    },

    ['panties'] = {
        label = 'Ondergoed',
        weight = 50,
        stack = false,
        consume = 0,
        client = {
            status = { thirst = -100000, stress = -25000 },
            anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
            prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
            usetime = 2500,
        }
    },
        ['gps'] = {
        label = 'GPS',
        weight = 1,
        stack = false,
        close = false,
    },
}