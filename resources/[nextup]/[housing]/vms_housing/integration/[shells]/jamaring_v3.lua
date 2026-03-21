CreateThread(function()
    Wait(1000)

    if not Config.Shells.JamaringMapsShellsV3 then return end
    
    local shells = {
        ['jamaring_shellv3_1'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 1 (V3)',
            model = 'jamaring_shellv3_1',
            rooms = 0,
            
            doors = vector4(-0.002, -0.0321, 498.8588, 271.557),
    
            interactable = {
                {
                    targetSize = vector3(2.1000018119812, 1.5, 2.60001301765441),
                    target = vector4(3.01370000839233, 6.86630010604858, 501.3385925292969, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(2.42689990997314, 6.92280006408691, 501.210693359375),
                                player = vector4(2.84949994087219, 6.89739990234375, 498.83880615234375, 71.36160278320312)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                },
                {
                    targetSize = vector3(0.99500048160552, 1.0250004529953, 1.20000004768371),
                    target = vector4(2.75760006904602, 11.40009975433349, 500.1990966796875, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(2.81990003585815, 11.41409969329834, 499.85888671875),
                                player = vector4(3.48429989814758, 11.43080043792724, 498.8587951660156, 92.91190338134766)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(2.81990003585815, 11.41409969329834, 499.85888671875),
                                player = vector4(3.48429989814758, 11.43080043792724, 498.8587951660156, 92.91190338134766)
                            },
                            billType = 'water',
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shellv3_1.png'},
        },
        ['jamaring_shellv3_2'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 2 (V3)',
            model = 'jamaring_shellv3_2',
            rooms = 0,
            
            doors = vector4(-0.002, -0.0321, 498.8588, 271.557),
    
            interactable = {
                {
                    targetSize = vector3(2.1000018119812, 1.5, 2.60001301765441),
                    target = vector4(3.01370000839233, 6.86630010604858, 501.3385925292969, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(2.42689990997314, 6.92280006408691, 501.210693359375),
                                player = vector4(2.84949994087219, 6.89739990234375, 498.83880615234375, 71.36160278320312)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                },
                {
                    targetSize = vector3(0.99500048160552, 1.0250004529953, 1.20000004768371),
                    target = vector4(2.75760006904602, 11.40009975433349, 500.1990966796875, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(2.81990003585815, 11.41409969329834, 499.85888671875),
                                player = vector4(3.48429989814758, 11.43080043792724, 498.8587951660156, 92.91190338134766)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(2.81990003585815, 11.41409969329834, 499.85888671875),
                                player = vector4(3.48429989814758, 11.43080043792724, 498.8587951660156, 92.91190338134766)
                            },
                            billType = 'water',
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shellv3_2.png'},
        },
    
        ['jamaring_shellv3_3'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 3 (V3)',
            model = 'jamaring_shellv3_3',
            rooms = 0,
            
            doors = vector4(0.0976, -0.2259, 499.0006, 3.6798),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shellv3_3.png'},
        },
        ['jamaring_shellv3_4'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 4 (V3)',
            model = 'jamaring_shellv3_4',
            rooms = 0,
            
            doors = vector4(0.0976, -0.2259, 499.0006, 3.6798),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shellv3_4.png'},
        },
    
        ['jamaring_shellv3_5'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 5 (V3)',
            model = 'jamaring_shellv3_5',
            rooms = 0,
            
            doors = vector4(0.153, -0.2257, 499.0005, 354.8985),
    
            interactable = {
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(19.26309967041015, 17.8031005859375, 500.4284973144531, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(19.12770080566406, 17.84440040588379, 500.1606140136719),
                                player = vector4(18.31060028076172, 17.85059928894043, 499.0006103515625, 268.9465942382813)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(19.12770080566406, 17.84440040588379, 500.1606140136719),
                                player = vector4(18.31060028076172, 17.85059928894043, 499.0006103515625, 268.9465942382813)
                            },
                            billType = 'water',
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shellv3_5.png'},
        },
        ['jamaring_shellv3_6'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 6 (V3)',
            model = 'jamaring_shellv3_6',
            rooms = 0,
            
            doors = vector4(0.153, -0.2257, 499.0005, 354.8985),
    
            interactable = {
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(19.26309967041015, 17.8031005859375, 500.4284973144531, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(19.12770080566406, 17.84440040588379, 500.1606140136719),
                                player = vector4(18.31060028076172, 17.85059928894043, 499.0006103515625, 268.9465942382813)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(19.12770080566406, 17.84440040588379, 500.1606140136719),
                                player = vector4(18.31060028076172, 17.85059928894043, 499.0006103515625, 268.9465942382813)
                            },
                            billType = 'water',
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shellv3_6.png'},
        },
    
        ['jamaring_shellv3_7'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 7 (V3)',
            model = 'jamaring_shellv3_7',
            rooms = 0,
            
            doors = vector4(-0.0994, 0.1004, 499.7242, 179.9861),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shellv3_7.png'},
        },
        ['jamaring_shellv3_8'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 8 (V3)',
            model = 'jamaring_shellv3_8',
            rooms = 0,
            
            doors = vector4(-0.0994, 0.1004, 499.7242, 179.9861),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shellv3_8.png'},
        },
    
        ['jamaring_shellv3_9'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 9 (V3)',
            model = 'jamaring_shellv3_9',
            rooms = 0,
            
            doors = vector4(-0.0417, 0.4325, 498.8522, 179.19),
    
            interactable = {
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(2.57690000534057, 13.1205997467041, 505.2484130859375, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(2.55450010299682, 13.02869987487793, 505.0015869140625),
                                player = vector4(2.53110003471374, 12.42850017547607, 503.6817932128906, 359.93890380859375)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(2.55450010299682, 13.02869987487793, 505.0015869140625),
                                player = vector4(2.53110003471374, 12.42850017547607, 503.6817932128906, 359.93890380859375)
                            },
                            billType = 'water',
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shellv3_9.png'},
        },
        ['jamaring_shellv3_10'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 10 (V3)',
            model = 'jamaring_shellv3_10',
            rooms = 0,
            
            doors = vector4(-0.0417, 0.4325, 498.8522, 179.19),
    
            interactable = {
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(2.57690000534057, 13.1205997467041, 505.2484130859375, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(2.55450010299682, 13.02869987487793, 505.0015869140625),
                                player = vector4(2.53110003471374, 12.42850017547607, 503.6817932128906, 359.93890380859375)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(2.55450010299682, 13.02869987487793, 505.0015869140625),
                                player = vector4(2.53110003471374, 12.42850017547607, 503.6817932128906, 359.93890380859375)
                            },
                            billType = 'water',
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shellv3_10.png'},
        },
    }
    
    addShells(shells)
end)