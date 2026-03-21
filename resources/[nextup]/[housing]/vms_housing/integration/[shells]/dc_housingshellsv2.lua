CreateThread(function()
    Wait(1000)
    
    if not Config.Shells.DCCustomzV2 then return end
    
    local shells = {
        ['dc_apartmentfive'] = {
            label = 'DC Apartment 5',
    
            tags = {'dc', 'dccustomz', 'apartment'},
            rooms = 3,
            model = 'dc_apartmentfive',
    
            doors = {
                x = -11.472069740295, y = -4.8625102043152, z = 498.50942993164, heading = 270.00881958008
            },
    
            interactable = {
                {
                    target = vector4(-3.90, -4.69, 499.64, 357.50),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-3.97, -4.68, 499.71),
                                particlesrot = vector3(-115.60, 180.00, 62.40),
                                player = vector4(-3.7888085842133, -5.483057975769, 498.50942993164, 359.75756835938),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-3.97, -4.68, 499.71),
                                particlesrot = vector3(-115.60, 180.00, 62.40),
                                player = vector4(-3.7888085842133, -5.483057975769, 498.50942993164, 359.75756835938),
                            },
                        },
                    }
                },
                {
                    target = vector4(2.37, -5.91, 499.63, 89.61),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(2.37, -5.95, 499.60),
                                particlesrot = vector3(-105.30, 180.00, 84.60),
                                player = vector4(3.1680805683136, -5.9293165206909, 498.50955200195, 89.608581542969),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(2.37, -5.95, 499.60),
                                particlesrot = vector3(-105.30, 180.00, 84.60),
                                player = vector4(3.1680805683136, -5.9293165206909, 498.50955200195, 89.608581542969),
                            },
                        },
                    }
                },
                {
                    target = vector4(-12.45, 1.30, 499.63, 89.21),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-12.45, 1.26, 499.58),
                                particlesrot = vector3(-110.20, 180.00, 84.60),
                                player = vector4(-11.60570526123, 1.2815455198288, 498.50970458984, 89.212364196777),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-12.45, 1.26, 499.58),
                                particlesrot = vector3(-110.20, 180.00, 84.60),
                                player = vector4(-11.60570526123, 1.2815455198288, 498.50970458984, 89.212364196777),
                            },
                        },
                    }
                },
                {
                    target = vector4(-12.47, 0.48, 499.62, 89.22),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-12.45, 0.43, 499.58),
                                particlesrot = vector3(-110.20, 180.00, 84.60),
                                player = vector4(-11.608427047729, 0.47960543632507, 498.50970458984, 89.219665527344),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-12.45, 0.43, 499.58),
                                particlesrot = vector3(-110.20, 180.00, 84.60),
                                player = vector4(-11.608427047729, 0.47960543632507, 498.50970458984, 89.219665527344),
                            },
                        },
                    }
                },
                {
                    target = vector4(4.63, -8.46, 499.59, 267.69),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(4.40, -8.47, 500.85),
                                particlesrot = vector3(-52.30, 180.00, 84.60),
                                player = vector4(3.550000667572, -8.4148902893066, 498.61099243164, 267.68572998047),
                            },
                        }
                    },
                },
                {
                    target = vector4(-10.18, -2.17, 499.60, 270.74),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-10.40, -2.19, 500.87),
                                particlesrot = vector3(-50.70, 180.00, 84.60),
                                player = vector4(-11.21346282959, -2.1608781814575, 498.61102294922, 270.74429321289),
                            },
                        }
                    },
                },
            },
    
            images = {
                "https://r2.fivemanage.com/s9nylBx2i81FdGej13LAs/apt5.png",
            },
        },
    
        ['dc_apartment6'] = {
            label = 'DC Apartment 6',
    
            tags = {'dc', 'dccustomz', 'apartment'},
            rooms = 2,
            model = 'dc_apartment6',
    
            doors = { x = -5.2048506736755, y = -6.2922930717468, z = 498.55276489258, heading = 0.46853676438332 },
    
            interactable = {
                {
                    target = vector4(-10.09, -4.15, 499.66, 1.08),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-10.23, -4.12, 499.70),
                                particlesrot = vector3(-70.50, 180.00, -122.80),
                                player = vector4(-10.06126499176, -4.8099374771118, 498.55276489258, 1.0816692113876),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-10.23, -4.12, 499.70),
                                particlesrot = vector3(-70.50, 180.00, -122.80),
                                player = vector4(-10.06126499176, -4.8099374771118, 498.55276489258, 1.0816692113876),
                            },
                        },
                    }
                },
                {
                    target = vector4(0.27, -2.55, 499.55, 269.52),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(0.20, -2.56, 499.60),
                                particlesrot = vector3(-70.00, 180.00, 84.60),
                                player = vector4(-0.58066159486771, -2.5639579296112, 498.55279541016, 269.52410888672),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(0.20, -2.56, 499.60),
                                particlesrot = vector3(-70.00, 180.00, 84.60),
                                player = vector4(-0.58066159486771, -2.5639579296112, 498.55279541016, 269.52410888672),
                            },
                        },
                    }
                },
                {
                    target = vector4(8.54, -3.99, 499.52, 4.60),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(8.55, -4.07, 499.61),
                                particlesrot = vector3(-71.00, 180.00, 180.00),
                                player = vector4(8.5744466781616, -4.8525476455688, 498.55279541016, 4.6039891242981),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(8.55, -4.07, 499.61),
                                particlesrot = vector3(-71.00, 180.00, 180.00),
                                player = vector4(8.5744466781616, -4.8525476455688, 498.55279541016, 4.6039891242981),
                            },
                        },
                    }
                },
                {
                    target = vector4(11.13, -4.58, 499.64, 3.31),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(11.12, -4.80, 500.93),
                                particlesrot = vector3(-125.70, 180.00, 1.80),
                                player = vector4(11.164874076843, -5.6267557144165, 498.66171264648, 359.88751220703),
                            },
                        }
                    },
                },
                {
                    target = vector4(-0.30, -5.14, 499.65, 268.20),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-0.54, -5.16, 500.91),
                                particlesrot = vector3(-47.70, 180.00, 90.80),
                                player = vector4(-1.3707300424576, -5.1466016769409, 498.66180419922, 268.20040893555),
                            },
                        }
                    },
                },
            },
    
            images = {
                "https://r2.fivemanage.com/s9nylBx2i81FdGej13LAs/apt6.png",
            },
        },
    
        ['dc_house9'] = {
            label = 'DC House 9',
    
            tags = {'dc', 'dccustomz', 'house'},
            rooms = 3,
            model = 'dc_house9',
    
            doors = { x = -2.3419280052185, y = -9.7690401077271, z = 498.05755615234, heading = 3.3584182262421 },
    
            interactable = {
                {
                    target = vector4(-3.94, -0.62, 500.16, 2.93),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-3.94, -0.62, 499.16),
                                player = vector4(-3.9513823986053, -1.3843365907669, 498.05758666992, 2.9290888309479),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-3.94, -0.62, 499.16),
                                player = vector4(-3.9513823986053, -1.3843365907669, 498.05758666992, 2.9290888309479),
                            },
                        },
                    }
                },
                {
                    target = vector4(-11.85, -0.39, 500.08, 273.53),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-11.97, -0.25, 499.34),
                                player = vector4(-12.523687362671, -0.38529682159424, 498.05783081055, 273.53192138672),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-11.97, -0.25, 499.34),
                                player = vector4(-12.523687362671, -0.38529682159424, 498.05783081055, 273.53192138672),
                            },
                        },
                    }
                },
                {
                    target = vector4(8.73, -3.86, 500.17, 359.14),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(8.73, -3.87, 499.17),
                                player = vector4(8.73388671875, -4.6207628250122, 498.05798339844, 359.1432800293),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(8.73, -3.87, 499.17),
                                player = vector4(8.73388671875, -4.6207628250122, 498.05798339844, 359.1432800293),
                            },
                        },
                    }
                },
                {
                    target = vector4(5.84, 6.67, 500.16, 1.30),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(5.84, 6.67, 499.16),
                                player = vector4(5.8344402313232, 5.8300070762634, 498.05798339844, 1.303319811821),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(5.84, 6.67, 499.16),
                                player = vector4(5.8344402313232, 5.8300070762634, 498.05798339844, 1.303319811821),
                            },
                        },
                    }
                },
                {
                    target = vector4(6.84, 6.67, 500.17, 358.99),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(6.84, 6.67, 499.16),
                                player = vector4(6.8913254737854, 5.9100136756897, 498.05798339844, 358.98721313477),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(6.84, 6.67, 499.16),
                                player = vector4(6.8913254737854, 5.9100136756897, 498.05798339844, 358.98721313477),
                            },
                        },
                    }
                },
                {
                    target = vector4(9.88, 5.53, 500.30, 270.65),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(9.74, 5.52, 500.08),
                                player = vector4(9.5586261749268, 5.5402069091797, 498.06793212891, 273.04772949219),
                            },
                        }
                    },
                },
                {
                    target = vector4(10.87, -3.73, 500.02, 0.23),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(10.87, -3.92, 500.42),
                                player = vector4(10.91835975647, -4.1860027313232, 498.15545654297, 5.0841274261475),
                            },
                        }
                    },
                },
            },
    
            images = {
                "https://r2.fivemanage.com/s9nylBx2i81FdGej13LAs/h9.png",
            },
        },
    
        ['dc_house10'] = {
            label = 'DC House 10',
    
            tags = {'dc', 'dccustomz', 'house'},
            rooms = 5,
            model = 'dc_house10',
    
            doors = { x = 0.32056307792664, y = -8.4807271957397, z = 497.81198120117, heading = 3.2627828121185 },
    
            interactable = {
                {
                    target = vector4(-9.28, 0.30, 498.89, 90.44),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-8.99, 0.36, 498.08),
                                particlesrot = vector3(-104.20, 180.00, 16.00),
                                player = vector4(-8.391713142395, 0.36078494787216, 496.81173706055, 90.437126159668),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-8.99, 0.36, 498.08),
                                particlesrot = vector3(-104.20, 180.00, 16.00),
                                player = vector4(-8.391713142395, 0.36078494787216, 496.81173706055, 90.437126159668),
                            },
                        },
                    }
                },
                {
                    target = vector4(4.68, -6.24, 498.68, 269.78),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(4.63, -6.28, 497.83),
                                particlesrot = vector3(-62.80, 180.00, 76.80),
                                player = vector4(3.8491144180298, -6.2603192329407, 496.81170654297, 269.60180664062),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(4.63, -6.28, 497.83),
                                particlesrot = vector3(-62.80, 180.00, 76.80),
                                player = vector4(3.8491144180298, -6.2603192329407, 496.81170654297, 269.60180664062),
                            },
                        },
                    }
                },
                {
                    target = vector4(2.00, 8.57, 501.86, 92.15),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(2.04, 8.61, 501.00),
                                particlesrot = vector3(-69.00, 180.00, -91.40),
                                player = vector4(2.8278052806854, 8.5869560241699, 499.99334716797, 92.15153503418),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(2.04, 8.61, 501.00),
                                particlesrot = vector3(-69.00, 180.00, -91.40),
                                player = vector4(2.8278052806854, 8.5869560241699, 499.99334716797, 92.15153503418),
                            },
                        },
                    }
                },
                {
                    target = vector4(9.91, -2.80, 501.87, 4.09),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(9.92, -2.86, 501.01),
                                particlesrot = vector3(-105.40, 180.00, 0.00),
                                player = vector4(9.942569732666, -3.6408457756042, 499.9928894043, 2.9359796047211),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(9.92, -2.86, 501.01),
                                particlesrot = vector3(-105.40, 180.00, 0.00),
                                player = vector4(9.942569732666, -3.6408457756042, 499.9928894043, 2.9359796047211),
                            },
                        },
                    }
                },
                {
                    target = vector4(-13.23, -4.68, 501.85, 91.97),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-13.20, -4.64, 500.99),
                                particlesrot = vector3(-72.00, 180.00, -100.20),
                                player = vector4(-12.417949676514, -4.6453475952148, 499.99337768555, 91.967834472656),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-13.20, -4.64, 500.99),
                                particlesrot = vector3(-72.00, 180.00, -100.20),
                                player = vector4(-12.417949676514, -4.6453475952148, 499.99337768555, 91.967834472656),
                            },
                        },
                    }
                },
                {
                    target = vector4(-13.24, -3.66, 501.86, 94.01),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-13.20, -3.61, 500.99),
                                particlesrot = vector3(-72.00, 180.00, -100.20),
                                player = vector4(-12.414129257202, -3.6197476387024, 499.99331665039, 89.864990234375),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-13.20, -3.61, 500.99),
                                particlesrot = vector3(-72.00, 180.00, -100.20),
                                player = vector4(-12.414129257202, -3.6197476387024, 499.99331665039, 89.864990234375),
                            },
                        },
                    }
                },
                {
                    target = vector4(2.49, 10.51, 501.88, 89.93),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(3.04, 10.45, 502.21),
                                particlesrot = vector3(-87.60, 180.00, 0.00),
                                player = vector4(3.1102659702301, 10.451471328735, 500.01901245117, 92.249610900879),
                            },
                        }
                    },
                },
                {
                    target = vector4(11.84, -3.31, 500.88, 2.22),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(11.78, -3.88, 502.22),
                                particlesrot = vector3(-89.00, 180.00, 0.00),
                                player = vector4(11.777987480164, -3.9219529628754, 500.01852416992, 0.090098604559898),
                            },
                        }
                    },
                },
                {
                    target = vector4(-13.33, -0.96, 501.14, 99.41),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-12.82, -0.78, 502.44),
                                particlesrot = vector3(-87.00, 180.00, -97.20),
                                player = vector4(-12.800652503967, -0.82090324163437, 500.00247192383, 84.373847961426),
                            },
                        }
                    },
                },
            },
    
            images = {
                "https://r2.fivemanage.com/s9nylBx2i81FdGej13LAs/h10.png",
            },
        },
    
        ['dc_house11'] = {
            label = 'DC House 11',
    
            tags = {'dc', 'dccustomz', 'house'},
            rooms = 9,
            model = 'dc_house11',
    
            doors = { x = -8.8897371292114, y = 8.6469125747681, z = 497.07870483398, heading = 182.44624328613 },
    
            interactable = {
                {
                    target = vector4(-4.13, 3.92, 498.15, 271.69),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-4.07, 3.94, 497.21),
                                particlesrot = vector3(-70.00, 180.00, 84.60),
                                player = vector4(-4.8220200538635, 3.9470138549805, 496.07873535156, 271.68914794922),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-4.07, 3.94, 497.21),
                                particlesrot = vector3(-70.00, 180.00, 84.60),
                                player = vector4(-4.8220200538635, 3.9470138549805, 496.07873535156, 271.68914794922),
                            },
                        },
                    }
                },
                {
                    target = vector4(-2.01, -9.42, 497.06, 272.41),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-2.27, -9.40, 497.24),
                                particlesrot = vector3(-70.00, 180.00, 0.00),
                                player = vector4(-2.8362150192261, -9.4124698638916, 496.07873535156, 272.4079284668),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-2.27, -9.40, 497.24),
                                particlesrot = vector3(-70.00, 180.00, 0.00),
                                player = vector4(-2.8362150192261, -9.4124698638916, 496.07873535156, 272.4079284668),
                            },
                        },
                    }
                },
                {
                    target = vector4(-21.69, -5.00, 502.00, 91.53),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-21.72, -5.02, 502.10),
                                particlesrot = vector3(-69.40, 180.00, -96.60),
                                player = vector4(-20.919137954712, -5.0198616981506, 500.99328613281, 91.527404785156),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-21.72, -5.02, 502.10),
                                particlesrot = vector3(-69.40, 180.00, -96.60),
                                player = vector4(-20.919137954712, -5.0198616981506, 500.99328613281, 91.527404785156),
                            },
                        },
                    }
                },
                {
                    target = vector4(-21.69, -3.41, 502.02, 99.87),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-21.72, -3.38, 502.10),
                                particlesrot = vector3(-69.40, 180.00, -96.60),
                                player = vector4(-20.919281005859, -3.3789496421814, 500.99325561523, 91.411560058594),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-21.72, -3.38, 502.10),
                                particlesrot = vector3(-69.40, 180.00, -96.60),
                                player = vector4(-20.919281005859, -3.3789496421814, 500.99325561523, 91.411560058594),
                            },
                        },
                    }
                },
                {
                    target = vector4(-8.29, 9.18, 501.30, 271.63),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-8.28, 9.21, 501.41),
                                particlesrot = vector3(-68.90, 180.00, -271.80),
                                player = vector4(-9.0218811035156, 9.2111892700195, 500.27886962891, 271.62640380859),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-8.28, 9.21, 501.41),
                                particlesrot = vector3(-68.90, 180.00, -271.80),
                                player = vector4(-9.0218811035156, 9.2111892700195, 500.27886962891, 271.62640380859),
                            },
                        },
                    }
                },
                {
                    target = vector4(-8.31, -6.66, 501.34, 269.87),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-8.29, -6.64, 501.40),
                                particlesrot = vector3(-70.00, 180.00, 87.90),
                                player = vector4(-9.0199327468872, -6.6252388954163, 500.27886962891, 269.8669128418),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-8.29, -6.64, 501.40),
                                particlesrot = vector3(-70.00, 180.00, 87.90),
                                player = vector4(-9.0199327468872, -6.6252388954163, 500.27886962891, 269.8669128418),
                            },
                        },
                    }
                },
                {
                    target = vector4(1.45, 12.07, 501.32, 182.78),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(1.49, 12.06, 501.40),
                                particlesrot = vector3(-103.00, 180.00, -186.00),
                                player = vector4(1.4758334159851, 12.790407180786, 500.27844238281, 182.77537536621),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(1.49, 12.06, 501.40),
                                particlesrot = vector3(-103.00, 180.00, -186.00),
                                player = vector4(1.4758334159851, 12.790407180786, 500.27844238281, 182.77537536621),
                            },
                        },
                    }
                },
                {
                    target = vector4(1.50, -9.47, 501.32, 0.37),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(1.49, -9.45, 501.40),
                                particlesrot = vector3(-69.10, 180.00, -177.40),
                                player = vector4(1.4785056114197, -10.190398216248, 500.27841186523, 0.3717959523201),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(1.49, -9.45, 501.40),
                                particlesrot = vector3(-69.10, 180.00, -177.40),
                                player = vector4(1.4785056114197, -10.190398216248, 500.27841186523, 0.3717959523201),
                            },
                        },
                    }
                },
                {
                    target = vector4(17.81, 9.24, 501.32, 90.93),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(17.80, 9.24, 501.40),
                                particlesrot = vector3(-57.60, 180.00, -103.60),
                                player = vector4(18.54133605957, 9.2103176116943, 500.27850341797, 90.928062438965),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(17.80, 9.24, 501.40),
                                particlesrot = vector3(-57.60, 180.00, -103.60),
                                player = vector4(18.54133605957, 9.2103176116943, 500.27850341797, 90.928062438965),
                            },
                        },
                    }
                },
                {
                    target = vector4(17.79, -6.58, 501.30, 91.48),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(17.80, -6.64, 501.40),
                                particlesrot = vector3(-101.20, 180.00, -278.80),
                                player = vector4(18.533617019653, -6.597222328186, 500.27841186523, 91.47688293457),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(17.80, -6.64, 501.40),
                                particlesrot = vector3(-101.20, 180.00, -278.80),
                                player = vector4(18.533617019653, -6.597222328186, 500.27841186523, 91.47688293457),
                            },
                        },
                    }
                },
                {
                    target = vector4(20.24, 0.54, 501.32, 91.71),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(20.23, 0.51, 501.41),
                                particlesrot = vector3(-102.90, 180.00, -267.30),
                                player = vector4(20.959106445312, 0.5567302107811, 500.27841186523, 91.705924987793),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(20.23, 0.51, 501.41),
                                particlesrot = vector3(-102.90, 180.00, -267.30),
                                player = vector4(20.959106445312, 0.5567302107811, 500.27841186523, 91.705924987793),
                            },
                        },
                    }
                },
                {
                    target = vector4(-0.15, 6.35, 496.26, 181.92),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-0.12, 6.33, 496.32),
                                particlesrot = vector3(-72.20, 180.00, -362.70),
                                player = vector4(-0.10794447362423, 7.0714907646179, 495.19311523438, 181.92028808594),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-0.12, 6.33, 496.32),
                                particlesrot = vector3(-72.20, 180.00, -362.70),
                                player = vector4(-0.10794447362423, 7.0714907646179, 495.19311523438, 181.92028808594),
                            },
                        },
                    }
                },
                {
                    target = vector4(-18.81, -7.22, 502.12, 2.73),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-18.65, -7.76, 503.45),
                                particlesrot = vector3(-87.40, 180.00, -199.20),
                                player = vector4(-18.715944290161, -7.7915716171265, 501.00335693359, 358.27996826172),
                            },
                        }
                    },
                },
                {
                    target = vector4(-10.54, 7.73, 501.16, 179.36),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-10.53, 8.28, 502.73),
                                particlesrot = vector3(-84.90, 180.00, -352.81),
                                player = vector4(-10.49901676178, 8.3497648239136, 500.33227539062, 182.13827514648),
                            },
                        }
                    },
                },
                {
                    target = vector4(-10.53, -5.13, 501.16, 2.05),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-10.52, -5.67, 502.72),
                                particlesrot = vector3(-86.80, 180.00, -77.40),
                                player = vector4(-10.519675254822, -5.677149772644, 500.3323059082, 1.6244080066681),
                            },
                        }
                    },
                },
                {
                    target = vector4(-0.02, 14.30, 501.15, 89.35),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(0.54, 14.27, 502.73),
                                particlesrot = vector3(-88.60, 180.00, -273.40),
                                player = vector4(0.55560487508774, 14.263493537903, 500.33224487305, 85.609878540039),
                            },
                        }
                    },
                },
                {
                    target = vector4(-0.02, -11.70, 501.14, 90.38),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(0.55, -11.68, 502.74),
                                particlesrot = vector3(-87.20, 180.00, -186.20),
                                player = vector4(0.56417441368103, -11.686405181885, 500.3323059082, 90.227432250977),
                            },
                        }
                    },
                },
                {
                    target = vector4(20.04, 7.72, 501.15, 181.84),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(20.04, 8.28, 502.73),
                                particlesrot = vector3(-84.00, 180.00, -216.40),
                                player = vector4(0.56417441368103, -11.686405181885, 500.3323059082, 90.227432250977),
                            },
                        }
                    },
                },
                {
                    target = vector4(20.04, -5.13, 501.16, 3.22),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(20.03, -5.70, 502.73),
                                particlesrot = vector3(-90.60, 180.00, -267.30),
                                player = vector4(19.990888595581, -5.7813711166382, 500.3323059082, 0.81582808494568),
                            },
                        }
                    },
                },
                {
                    target = vector4(22.47, -0.97, 501.15, 179.72),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(22.45, -0.42, 502.72),
                                particlesrot = vector3(-86.30, 180.00, -267.30),
                                player = vector4(22.470043182373, -0.36259010434151, 500.33227539062, 181.94471740723),
                            },
                        }
                    },
                },
                {
                    target = vector4(-1.61, 8.58, 496.07, 90.79),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-1.06, 8.56, 497.64),
                                particlesrot = vector3(-89.40, 180.00, -437.91),
                                player = vector4(22.470043182373, -0.36259010434151, 500.33227539062, 181.94471740723),
                            },
                        }
                    },
                },
            },
    
            images = {
                "https://r2.fivemanage.com/s9nylBx2i81FdGej13LAs/h11.png",
            },
        },
    
        ['dc_house12'] = {
            label = 'DC House 12',
    
            tags = {'dc', 'dccustomz', 'house'},
            rooms = 6,
            model = 'dc_house12',
    
            doors = { x = 9.4583702087402, y = 2.0204410552979, z = 497.91906738281, heading = 93.90796661377 },
    
            interactable = {
                {
                    target = vector4(5.86, -4.77, 497.96, 270.98),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(5.87, -4.75, 498.04),
                                particlesrot = vector3(-73.40, 180.00, 81.10),
                                player = vector4(5.1373529434204, -4.733913898468, 496.91906738281, 270.98358154297),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(5.87, -4.75, 498.04),
                                particlesrot = vector3(-73.40, 180.00, 81.10),
                                player = vector4(5.1373529434204, -4.733913898468, 496.91906738281, 270.98358154297),
                            },
                        },
                    }
                },
                {
                    target = vector4(0.72, -4.80, 497.85, 45.34),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(0.83, -4.90, 498.05),
                                particlesrot = vector3(-90.20, 180.00, -141.50),
                                player = vector4(1.1972702741623, -5.3105392456055, 496.91909790039, 45.336006164551),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(0.83, -4.90, 498.05),
                                particlesrot = vector3(-90.20, 180.00, -141.50),
                                player = vector4(1.1972702741623, -5.3105392456055, 496.91909790039, 45.336006164551),
                            },
                        },
                    }
                },
                {
                    target = vector4(5.92, 8.91, 497.57, 271.19),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(5.94, 8.92, 497.64),
                                particlesrot = vector3(-74.00, 180.00, 84.60),
                                player = vector4(5.2036643028259, 8.912088394165, 496.51943969727, 271.18609619141),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(5.94, 8.92, 497.64),
                                particlesrot = vector3(-74.00, 180.00, 84.60),
                                player = vector4(5.2036643028259, 8.912088394165, 496.51943969727, 271.18609619141),
                            },
                        },
                    }
                },
                {
                    target = vector4(5.93, -13.60, 501.52, 270.28),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(5.94, -13.60, 501.59),
                                particlesrot = vector3(-71.20, 180.00, 84.60),
                                player = vector4(5.2093915939331, -13.592838287354, 500.46875, 270.27755737305),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(5.94, -13.60, 501.59),
                                particlesrot = vector3(-71.20, 180.00, 84.60),
                                player = vector4(5.2093915939331, -13.592838287354, 500.46875, 270.27755737305),
                            },
                        },
                    }
                },
                {
                    target = vector4(5.92, 13.55, 501.55, 269.43),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(5.94, 13.57, 501.59),
                                particlesrot = vector3(-72.10, 180.00, 84.60),
                                player = vector4(5.2132911682129, 13.598805427551, 500.46865844727, 269.43188476562),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(5.94, 13.57, 501.59),
                                particlesrot = vector3(-72.10, 180.00, 84.60),
                                player = vector4(5.2132911682129, 13.598805427551, 500.46865844727, 269.43188476562),
                            },
                        },
                    }
                },
                {
                    target = vector4(-5.40, 0.82, 501.55, 274.69),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-5.41, 0.87, 501.57),
                                particlesrot = vector3(-79.30, 180.00, 84.60),
                                player = vector4(-6.0058393478394, 0.88833421468735, 500.46871948242, 274.6923828125),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-5.41, 0.87, 501.57),
                                particlesrot = vector3(-79.30, 180.00, 84.60),
                                player = vector4(-6.0058393478394, 0.88833421468735, 500.46871948242, 274.6923828125),
                            },
                        },
                    }
                },
                {
                    target = vector4(-5.37, 0.09, 501.51, 271.87),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-5.41, 0.08, 501.57),
                                particlesrot = vector3(-79.30, 180.00, 84.60),
                                player = vector4(-6.0058393478394, 0.094283081591129, 500.46871948242, 272.37677001953),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-5.41, 0.08, 501.57),
                                particlesrot = vector3(-79.30, 180.00, 84.60),
                                player = vector4(-6.0058393478394, 0.094283081591129, 500.46871948242, 272.37677001953),
                            },
                        },
                    }
                },
                {
                    target = vector4(6.05, 11.10, 497.41, 274.48),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(5.50, 11.07, 498.99),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(5.4661383628845, 11.109323501587, 496.57278442383, 273.70629882812),
                            },
                        }
                    },
                },
                {
                    target = vector4(6.05, -15.76, 501.35, 273.50),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(5.51, -15.75, 502.94),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(5.4372091293335, -15.763103485107, 500.52239990234, 270.83547973633),
                            },
                        }
                    },
                },
                {
                    target = vector4(6.05, 15.73, 501.36, 271.59),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(5.51, 15.72, 502.93),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(5.4280872344971, 15.776906967163, 500.52233886719, 270.03076171875),
                            },
                        }
                    },
                },
                {
                    target = vector4(-7.45, -0.51, 501.60, 189.46),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-7.59, 0.02, 502.92),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(-7.5652236938477, 0.070261634886265, 500.47924804688, 181.7557220459),
                            },
                        }
                    },
                },
            },
    
            images = {
                "https://r2.fivemanage.com/s9nylBx2i81FdGej13LAs/h12.png",
            },
        },
    
        ['dc_house13'] = {
            label = 'DC House 13',
    
            tags = {'dc', 'dccustomz', 'house'},
            rooms = 3,
            model = 'dc_house13',
    
            doors = { x = 5.3431153297424, y = -5.8380222320557, z = 499.12744140625, heading = 0.72004836797714 },
    
            interactable = {
                {
                    target = vector4(-4.56, -4.81, 499.18, 182.48),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-4.55, -4.76, 499.24),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(-4.585910320282, -4.0697617530823, 498.12786865234, 182.4797668457),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-4.55, -4.76, 499.24),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(-4.585910320282, -4.0697617530823, 498.12786865234, 182.4797668457),
                            },
                        },
                    }
                },
                {
                    target = vector4(7.00, 11.11, 499.20, 93.91),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(7.04, 11.07, 499.24),
                                particlesrot = vector3(-95.60, 180.00, 84.60),
                                player = vector4(7.7577548027039, 11.102391242981, 498.12789916992, 93.910003662109),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(7.04, 11.07, 499.24),
                                particlesrot = vector3(-95.60, 180.00, 84.60),
                                player = vector4(7.7577548027039, 11.102391242981, 498.12789916992, 93.910003662109),
                            },
                        },
                    }
                },
                {
                    target = vector4(7.00, 12.21, 499.18, 90.34),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(7.04, 12.18, 499.24),
                                particlesrot = vector3(-95.60, 180.00, 84.60),
                                player = vector4(7.7533659934998, 12.190788269043, 498.12789916992, 90.336990356445),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(7.04, 12.18, 499.24),
                                particlesrot = vector3(-95.60, 180.00, 84.60),
                                player = vector4(7.7533659934998, 12.190788269043, 498.12789916992, 90.336990356445),
                            },
                        },
                    }
                },
                {
                    target = vector4(-2.73, 4.15, 499.24, 270.38),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-2.94, 4.07, 499.46),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(-3.550660610199, 4.0495090484619, 498.1279296875, 270.37936401367),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-2.94, 4.07, 499.46),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(-3.550660610199, 4.0495090484619, 498.1279296875, 270.37936401367),
                            },
                        },
                    }
                },
                {
                    target = vector4(-7.07, -4.09, 499.11, 182.93),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-7.05, -3.44, 500.57),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(-7.0663471221924, -3.3068811893463, 498.29217529297, 178.85264587402),
                            },
                        }
                    },
                },
                {
                    target = vector4(9.93, 14.56, 499.21, 360.00),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(9.88, 13.89, 500.57),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(9.8937673568726, 13.829818725586, 498.12948608398, 0.47757983207703),
                            },
                        }
                    },
                },
            },
    
            images = {
                "https://r2.fivemanage.com/s9nylBx2i81FdGej13LAs/h13.png",
            },
        },
    
        ['dc_townhouse3'] = {
            label = 'DC Townhouse 3',
    
            tags = {'dc', 'dccustomz', 'townhouse'},
            rooms = 3,
            model = 'dc_townhouse3',
    
            doors = { x = 6.0651559829712, y = -3.413426399231, z = 497.97509765625, heading = 95.595329284668 },
    
            interactable = {
                {
                    target = vector4(-5.45, 2.21, 498.04, 86.64),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-5.38, 2.10, 498.16),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(-4.6918640136719, 2.0163192749023, 496.97457885742, 86.639358520508),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-5.38, 2.10, 498.16),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(-4.6918640136719, 2.0163192749023, 496.97457885742, 86.639358520508),
                            },
                        },
                    }
                },
                {
                    target = vector4(4.44, 5.42, 501.25, 261.77),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(4.42, 5.38, 501.25),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(3.7759125232697, 5.3677968978882, 500.15490722656, 270.00073242188),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(4.42, 5.38, 501.25),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(3.7759125232697, 5.3677968978882, 500.15490722656, 270.00073242188),
                            },
                        },
                    }
                },
                {
                    target = vector4(0.94, -2.28, 498.01, 298.60),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(0.89, -2.25, 498.05),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(0.2620, -2.2600, 496.9746, 270.6780),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(0.89, -2.25, 498.05),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(0.2620, -2.2600, 496.9746, 270.6780),
                            },
                        },
                    }
                },
                {
                    target = vector4(1.37, -5.38, 501.21, 271.77),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(1.31, -5.33, 501.24),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(0.67000085115433, -5.3542728424072, 500.15441894531, 271.77291870117),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(1.31, -5.33, 501.24),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(0.67000085115433, -5.3542728424072, 500.15441894531, 271.77291870117),
                            },
                        },
                    }
                },
                {
                    target = vector4(4.70, 7.66, 501.24, 285.00),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(4.48, 7.66, 502.59),
                                particlesrot = vector3(-55.90, 180.00, 84.60),
                                player = vector4(3.8183760643005, 7.7157039642334, 500.35137939453, 269.81146240234),
                            },
                        }
                    },
                },
                {
                    target = vector4(1.60, -7.68, 501.33, 273.86),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(1.39, -7.69, 502.60),
                                particlesrot = vector3(-58.60, 180.00, 84.60),
                                player = vector4(0.76246917247772, -7.667845249176, 500.35153198242, 268.99505615234),
                            },
                        }
                    },
                },
            },
    
            images = {
                "https://r2.fivemanage.com/s9nylBx2i81FdGej13LAs/th3.png",
            },
        },
    
        ['dc_townhouse4'] = {
            label = 'DC Townhouse 4',
    
            tags = {'dc', 'dccustomz', 'townhouse'},
            rooms = 3,
            model = 'dc_townhouse4',
    
            doors = { x = 6.0651559829712, y = -3.413426399231, z = 497.97509765625, heading = 95.595329284668 },
    
            interactable = {
                {
                    target = vector4(-5.45, 2.21, 498.04, 86.64),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-5.38, 2.10, 498.16),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(-4.6918640136719, 2.0163192749023, 496.97457885742, 86.639358520508),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-5.38, 2.10, 498.16),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(-4.6918640136719, 2.0163192749023, 496.97457885742, 86.639358520508),
                            },
                        },
                    }
                },
                {
                    target = vector4(4.44, 5.42, 501.25, 261.77),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(4.42, 5.38, 501.25),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(3.7759125232697, 5.3677968978882, 500.15490722656, 270.00073242188),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(4.42, 5.38, 501.25),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(3.7759125232697, 5.3677968978882, 500.15490722656, 270.00073242188),
                            },
                        },
                    }
                },
                {
                    target = vector4(0.94, -2.28, 498.01, 298.60),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(0.89, -2.25, 498.05),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(0.2620, -2.2600, 496.9746, 270.6780),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(0.89, -2.25, 498.05),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(0.2620, -2.2600, 496.9746, 270.6780),
                            },
                        },
                    }
                },
                {
                    target = vector4(1.37, -5.38, 501.21, 271.77),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(1.31, -5.33, 501.24),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(0.67000085115433, -5.3542728424072, 500.15441894531, 271.77291870117),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(1.31, -5.33, 501.24),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(0.67000085115433, -5.3542728424072, 500.15441894531, 271.77291870117),
                            },
                        },
                    }
                },
                {
                    target = vector4(4.70, 7.66, 501.24, 285.00),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(4.48, 7.66, 502.59),
                                particlesrot = vector3(-55.90, 180.00, 84.60),
                                player = vector4(3.8183760643005, 7.7157039642334, 500.35137939453, 269.81146240234),
                            },
                        }
                    },
                },
                {
                    target = vector4(1.60, -7.68, 501.33, 273.86),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(1.39, -7.69, 502.60),
                                particlesrot = vector3(-58.60, 180.00, 84.60),
                                player = vector4(0.76246917247772, -7.667845249176, 500.35153198242, 268.99505615234),
                            },
                        }
                    },
                },
            },
    
            images = {
                "https://r2.fivemanage.com/s9nylBx2i81FdGej13LAs/th4.png",
            },
        },
    
        ['dc_trap4'] = {
            label = 'DC Trap 4',
    
            tags = {'dc', 'dccustomz', 'trap'},
            rooms = 2,
            model = 'dc_trap4',
    
            doors = { x = -0.090316377580166, y = 4.5222444534302, z = 499.69976806641, heading = 179.91328430176 },
    
            interactable = {
                {
                    target = vector4(-1.62, -0.78, 499.70, 181.92),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-1.61, -0.65, 499.81),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(-1.6225817203522, 0.039637267589569, 498.69973754883, 181.91761779785),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-1.61, -0.65, 499.81),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(-1.6225817203522, 0.039637267589569, 498.69973754883, 181.91761779785),
                            },
                        },
                    }
                },
                {
                    target = vector4(3.63, 4.41, 499.89, 0.32),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(3.54, 4.41, 499.90),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(3.5316090583801, 3.7711110115051, 498.69979858398, 0.31814312934875),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(3.54, 4.41, 499.90),
                                particlesrot = vector3(-87.90, 180.00, 84.60),
                                player = vector4(3.5316090583801, 3.7711110115051, 498.69979858398, 0.31814312934875),
                            },
                        },
                    }
                },
                {
                    target = vector4(-3.33, 0.95, 499.95, 353.53),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-3.32, 0.74, 501.15),
                                particlesrot = vector3(-56.60, 180.00, 177.30),
                                player = vector4(-3.362889289856, 0.15850454568863, 498.89932250977, 353.53143310547),
                            },
                        }
                    },
                },
            },
    
            images = {
                "https://r2.fivemanage.com/s9nylBx2i81FdGej13LAs/tr4.png",
            },
        },
    }
    
    addShells(shells)
end)