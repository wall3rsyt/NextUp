CreateThread(function()
    Wait(1000)

    if not Config.Shells.JamaringMapsShellsV5 then return end
    
    local shells = {
        ['jamaring_v5_1a'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 1A (V5)',
            model = 'jamaring_v5_1a',
            rooms = 0,
            
            doors = vector4(0.2482, -0.013, 500.0003, 267.5788),
    
            interactable = {
                {
                    targetSize = vector3(0.68000078201293, 0.84500062465667, 1.20000004768371),
                    target = vector4(8.03380012512207, 2.65619993209838, 501.5672912597656, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(8.05920028686523, 2.66630005836486, 501.1603088378906),
                                player = vector4(7.43100023269653, 2.66339993476867, 500.0003051757813, 267.3057861328125)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(8.05920028686523, 2.66630005836486, 501.1603088378906),
                                player = vector4(7.43100023269653, 2.66339993476867, 500.0003051757813, 267.3057861328125)
                            },
                            billType = 'water',
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                        }
                    }
                },
                {
                    targetSize = vector3(2.51501131057739, 1.09500038623809, 2.45000958442688),
                    target = vector4(3.50430011749267, 4.82760000228881, 502.4336853027344, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(2.5223000049591, 4.84520006179809, 502.25970458984375),
                                player = vector4(2.6372001171112, 4.72660017013549, 500.0194091796875, 23.56739997863769)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                },
                {
                    targetSize = vector3(0.87000060081481, 0.96500051021575, 1.20000004768371),
                    target = vector4(9.20839977264404, -6.42399978637695, 501.3757019042969, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(9.27900028228759, -6.41149997711181, 501.1004028320313),
                                player = vector4(8.5152997970581, -6.42670011520385, 500.0003967285156, 268.96160888671875)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(9.27900028228759, -6.41149997711181, 501.1004028320313),
                                player = vector4(8.5152997970581, -6.42670011520385, 500.0003967285156, 268.96160888671875)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v5_1a.png'},
        },
        ['jamaring_v5_1b'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 1B (V5)',
            model = 'jamaring_v5_1b',
            rooms = 0,
            
            doors = vector4(0.2482, -0.013, 500.0003, 267.5788),
    
            interactable = {
                {
                    targetSize = vector3(0.68000078201293, 0.84500062465667, 1.20000004768371),
                    target = vector4(8.03380012512207, 2.65619993209838, 501.5672912597656, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(8.05920028686523, 2.66630005836486, 501.1603088378906),
                                player = vector4(7.43100023269653, 2.66339993476867, 500.0003051757813, 267.3057861328125)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(8.05920028686523, 2.66630005836486, 501.1603088378906),
                                player = vector4(7.43100023269653, 2.66339993476867, 500.0003051757813, 267.3057861328125)
                            },
                            billType = 'water',
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                        }
                    }
                },
                {
                    targetSize = vector3(2.51501131057739, 1.09500038623809, 2.45000958442688),
                    target = vector4(3.50430011749267, 4.82760000228881, 502.4336853027344, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(2.5223000049591, 4.84520006179809, 502.25970458984375),
                                player = vector4(2.6372001171112, 4.72660017013549, 500.0194091796875, 23.56739997863769)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                },
                {
                    targetSize = vector3(0.87000060081481, 0.96500051021575, 1.20000004768371),
                    target = vector4(9.20839977264404, -6.42399978637695, 501.3757019042969, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(9.27900028228759, -6.41149997711181, 501.1004028320313),
                                player = vector4(8.5152997970581, -6.42670011520385, 500.0003967285156, 268.96160888671875)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(9.27900028228759, -6.41149997711181, 501.1004028320313),
                                player = vector4(8.5152997970581, -6.42670011520385, 500.0003967285156, 268.96160888671875)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v5_1b.png'},
        },
    
        ['jamaring_v5_2a'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 2A (V5)',
            model = 'jamaring_v5_2a',
            rooms = 0,
            
            doors = vector4(-0.0772, 0.0103, 500.0004, 267.618),
    
            interactable = {
                {
                    targetSize = vector3(2.17000341415405, 1.19500029087066, 2.49001049995422),
                    target = vector4(22.32119941711425, -11.58489990234375, 502.6532897949219, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(21.762300491333, -11.86709976196289, 502.4266052246094),
                                player = vector4(21.96520042419433, -11.70619964599609, 500.2077026367188, 87.86650085449219)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                },
                {
                    targetSize = vector3(0.80500066280364, 1.13000035285949, 1.20000004768371),
                    target = vector4(15.75329971313476, 2.30110001564025, 501.6427001953125, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(15.78339958190918, 2.29500007629394, 501.3670959472656),
                                player = vector4(15.07940006256103, 2.29119992256164, 500.2070007324219, 267.7674865722656)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(15.78339958190918, 2.29500007629394, 501.3670959472656),
                                player = vector4(15.07940006256103, 2.29119992256164, 500.2070007324219, 267.7674865722656)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v5_2a.png'},
        },
        ['jamaring_v5_2b'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 2B (V5)',
            model = 'jamaring_v5_2b',
            rooms = 0,
            
            doors = vector4(-0.0772, 0.0103, 500.0004, 267.618),
    
            interactable = {
                {
                    targetSize = vector3(2.17000341415405, 1.19500029087066, 2.49001049995422),
                    target = vector4(22.32119941711425, -11.58489990234375, 502.6532897949219, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(21.762300491333, -11.86709976196289, 502.4266052246094),
                                player = vector4(21.96520042419433, -11.70619964599609, 500.2077026367188, 87.86650085449219)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                },
                {
                    targetSize = vector3(0.80500066280364, 1.13000035285949, 1.20000004768371),
                    target = vector4(15.75329971313476, 2.30110001564025, 501.6427001953125, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(15.78339958190918, 2.29500007629394, 501.3670959472656),
                                player = vector4(15.07940006256103, 2.29119992256164, 500.2070007324219, 267.7674865722656)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(15.78339958190918, 2.29500007629394, 501.3670959472656),
                                player = vector4(15.07940006256103, 2.29119992256164, 500.2070007324219, 267.7674865722656)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v5_2b.png'},
        },
    
        ['jamaring_v5_3a'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 3A (V5)',
            model = 'jamaring_v5_3a',
            rooms = 0,
            
            doors = vector4(-0.5529, -0.0254, 500.0005, 270.4985),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v5_3a.png'},
        },
        ['jamaring_v5_3b'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 3B (V5)',
            model = 'jamaring_v5_3b',
            rooms = 0,
            
            doors = vector4(-0.5529, -0.0254, 500.0005, 270.4985),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v5_3b.png'},
        },
    
        ['jamaring_v5_4a'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 4A (V5)',
            model = 'jamaring_v5_4a',
            rooms = 0,
            
            doors = vector4(0.2632, 0.0109, 500.0015, 270.4925),
    
            interactable = {
                {
                    targetSize = vector3(1.16000032424926, 0.96000051498413, 1.20000004768371),
                    target = vector4(10.35939979553222, 0.79460000991821, 501.385498046875, 44),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(10.34949970245361, 0.84399998188018, 501.1203918457031),
                                player = vector4(10.88109970092773, 0.31240001320838, 500.0003967285156, 44.02870178222656)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(10.34949970245361, 0.84399998188018, 501.1203918457031),
                                player = vector4(10.88109970092773, 0.31240001320838, 500.0003967285156, 44.02870178222656)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v5_4a.png'},
        },
        ['jamaring_v5_4b'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 4B (V5)',
            model = 'jamaring_v5_4b',
            rooms = 0,
            
            doors = vector4(0.2632, 0.0109, 500.0015, 270.4925),
    
            interactable = {
                {
                    targetSize = vector3(1.16000032424926, 0.96000051498413, 1.20000004768371),
                    target = vector4(10.35939979553222, 0.79460000991821, 501.385498046875, 44),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(10.34949970245361, 0.84399998188018, 501.1203918457031),
                                player = vector4(10.88109970092773, 0.31240001320838, 500.0003967285156, 44.02870178222656)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(10.34949970245361, 0.84399998188018, 501.1203918457031),
                                player = vector4(10.88109970092773, 0.31240001320838, 500.0003967285156, 44.02870178222656)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v5_4b.png'},
        },
    
        ['jamaring_v5_5a'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 5A (V5)',
            model = 'jamaring_v5_5a',
            rooms = 0,
            
            doors = vector4(0.2858, -0.016, 500.0002, 269.2057),
    
            interactable = {
                {
                    targetSize = vector3(1.22500026226043, 1.03000044822692, 1.12500011920928),
                    target = vector4(10.07470035552978, -7.1761999130249, 500.8460083007813, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(10.0516996383667, -7.21339988708496, 500.6166076660156),
                                player = vector4(10.09249973297119, -6.4261999130249, 499.45660400390625, 174.9853057861328)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(10.0516996383667, -7.21339988708496, 500.6166076660156),
                                player = vector4(10.09249973297119, -6.4261999130249, 499.45660400390625, 174.9853057861328)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v5_5a.png'},
        },
        ['jamaring_v5_5b'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring 5B (V5)',
            model = 'jamaring_v5_5b',
            rooms = 0,
            
            doors = vector4(0.2858, -0.016, 500.0002, 269.2057),
    
            interactable = {
                {
                    targetSize = vector3(1.22500026226043, 1.03000044822692, 1.12500011920928),
                    target = vector4(10.07470035552978, -7.1761999130249, 500.8460083007813, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(10.0516996383667, -7.21339988708496, 500.6166076660156),
                                player = vector4(10.09249973297119, -6.4261999130249, 499.45660400390625, 174.9853057861328)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(10.0516996383667, -7.21339988708496, 500.6166076660156),
                                player = vector4(10.09249973297119, -6.4261999130249, 499.45660400390625, 174.9853057861328)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v5_5b.png'},
        },
    }
    
    addShells(shells)
end)