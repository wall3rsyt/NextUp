CreateThread(function()
    Wait(1000)
    
    if not Config.Shells.K4MB1_MainHousingPack then return end
    
    if Config.Shells.K4MB1_AllShellsSubPack then
        return warn(("^3You cannot have ^1%s^3 and ^1%s^3 running at the same time.^7"):format('K4MB1_MainHousingPack', 'K4MB1-AllShellsSubPack'))
    end
    
    local shells = {
        ['shell_trailer'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
            label = 'Trailer',
    
            tags = {'empty', 'k4mb1'},
            rooms = 2,
    
            model = 'k4_trailer1_shell',
    
            doors = {
                x = -1.37,
                y = -1.95,
                z = 498.52,
                heading = 2.67,
            },
            
            interactable = {
                {
                    target = vector4(-1.88, 2.15, 499.46, 0.21),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-1.816921, 2.166766, 499.499),
                                player = vector4(-1.89, 1.49, 498.52, 359.35),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-1.816921, 2.166766, 499.499),
                                player = vector4(-1.89, 1.49, 498.52, 359.35),
                            },
                        },
                    }
                },
                {
                    -- marker = vector3(-2.92, 1.7, 499.4),
                    target = vector4(-2.92, 1.7, 499.4, 2.7),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-2.978536, 1.983136, 500.724),
                                player = vector4(-2.92, 1.7, 498.55, 2.7),
                            },
                        }
                    },
                },
            },
    
            images = {
                'https://cfx-nui-vms_housing/html/images/shell/shell_trailer.png',
            },
        },
        ['default_housing3_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Default Housing 3',
            model = 'k4_trailer2_shell',
            rooms = 0,
            
            doors = vector4(-1.2943, -2.0242, 498.5209, 1.4574),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(0.65549999475479, -2.02839994430542, 499.527587890625),
                                player = vector4(0.60100001096725, -1.32430005073547, 498.527587890625, 190.49380493164065)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        },
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(0.53179997205734, -2.02460002899169, 499.5476989746094),
                                player = vector4(0.6104000210762, -1.32200002670288, 498.527587890625, 183.4293975830078)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        }
                    },
                    target = vector4(0.58710002899169, -2.01130008697509, 500.02740478515625, 0),
                    targetSize = vector3(0.90500056743621, 0.80500066280364, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(-2.96889996528625, 1.97650003433227, 500.74029541015625),
                                player = vector4(-2.88299989700317, 1.80529999732971, 498.585693359375, 53.7323989868164)
                            },
                            type = 'shower',
                            timeUsage = 10000
                        }
                    },
                    target = vector4(-2.94409990310668, 1.70780003070831, 501.1751098632813, 0),
                    targetSize = vector3(1.14000034332275, 1.26000022888183, 2.77001690864563)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/default_housing3_k4mb1.png'},
        },
        ['shell_v16low'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
            label = 'Apartment Low',
    
            tags = {'empty', 'k4mb1'},
            rooms = 1,
    
            model = 'k4_v16low1_shell',
    
            doors = {
                x = 4.7,
                y = -6.5,
                z = 497.35,
                heading = 5.42,
            },
    
            interactable = {
                {
                    target = vector4(4.09, 6.22, 500.31, -2.14),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(4.187847, 6.333992, 500.5624),
                                player = vector4(4.25, 5.54, 499.35, 359.04),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(4.187847, 6.333992, 500.5624),
                                player = vector4(4.25, 5.54, 499.35, 359.04),
                            },
                        },
                    }
                },
            },
    
            images = {
                'https://cfx-nui-vms_housing/html/images/shell/shell_v16low.png',
            },
        },
        ['default_housing5_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Default Housing 5',
            model = 'k4_v16low2_shell',
            rooms = 0,
            
            doors = vector4(1.3561, -14.3721, 498.5019, 0.1346),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-1.21749997138977, -5.21789979934692, 499.705810546875),
                                player = vector4(-1.09140002727508, -4.53159999847412, 498.50579833984375, 185.5428009033203)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(-1.29550004005432, -5.18779993057251, 500.08990478515625, 0),
                    targetSize = vector3(1.20500028133392, 0.85500061511993, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(1.4811999797821, 4.57170009613037, 499.4462890625),
                                player = vector4(2.1301999092102, 4.57380008697509, 498.5057067871094, 95.91000366210938)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(1.62779998779296, 4.57019996643066, 500.01361083984375, 0),
                    targetSize = vector3(0.74000072479248, 0.69500076770782, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(1.82920002937316, 3.56419992446899, 500.8652038574219),
                                player = vector4(1.93340003490448, 3.498300075531, 498.5833129882813, 81.42870330810547)
                            },
                            type = 'shower',
                            timeUsage = 10000
                        }
                    },
                    target = vector4(2.15529990196228, 3.40310001373291, 501.5804138183594, 0),
                    targetSize = vector3(1.75499975681304, 1.15000033378601, 3.58503556251525)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/default_housing5_k4mb1.png'},
        },
        ['shell_lester'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
            tags = {'empty', 'k4mb1'},
    
            label = 'Lester',
            model = 'k4_lester1_shell',
            rooms = 0,
            
            doors = vector4(-1.5352, -5.9851, 498.6249, 0.0323),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_lester.png'},
        },
        ['default_housing1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Default Housing 1',
            model = 'k4_lester2_shell',
            rooms = 0,
    
            doors = vector4(-2.1335, -5.9916, 498.6793, 358.0429),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/default_housing1_k4mb1.png'},
        },
        ['shell_trevor'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
            label = 'Trevor Home',
    
            tags = {'empty', 'k4mb1'},
            rooms = 3,
    
            model = 'k4_trevor1_shell',
    
            doors = {
                x = 0.18,
                y = -3.63,
                z = 498.59,
                heading = 0.21,
            },
    
            interactable = {
                {
                    target = vector4(3.24, -3.77, 499.3, 180.43),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(3.180808, -3.843895, 499.55),
                                player = vector4(3.2, -3.16, 498.6, 179.47),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(3.180808, -3.843895, 499.55),
                                player = vector4(3.2, -3.16, 498.6, 179.47),
                            },
                        },
                    }
                },
                {
                    target = vector4(4.16, -3.07, 499.6, 269.61),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(3.989548, -3.665935, 500.6445),
                                player = vector4(4.14, -3.62, 498.45, 167.56),
                            },
                        }
                    },
                },
            },
            
            images = {
                'https://cfx-nui-vms_housing/html/images/shell/shell_trevor.png',
            },
        },
        ['default_housing4_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Default Housing 4',
            model = 'k4_trevor2_shell',
            rooms = 0,
            
            doors = vector4(0.1562, -3.8584, 498.5879, 355.9936),
    
            interactable = {
                {
                    target = vector4(3.16960000991821, -3.81220006942749, 499.9801025390625, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(3.18109989166259, -3.84599995613098, 499.5679931640625),
                                player = vector4(3.19689989089965, -3.19840002059936, 498.587890625, 179.97410583496097)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.75500071048736, 0.75500071048736, 1.35499989986419)
                },
                {
                    target = vector4(4.20900011062622, -3.07159996032714, 500.8245849609375, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(4.00750017166137, -3.68190002441406, 500.66790771484375),
                                player = vector4(4.13430023193359, -3.57310009002685, 498.7242126464844, 153.41839599609375)
                            },
                            billType = 'water',
                            waterUsage = 120000,
                            type = 'shower',
                            timeUsage = 10000
                        }
                    },
                    targetSize = vector3(1.05499923229217, 2.15000295639038, 2.59001278877258)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/default_housing4_k4mb1.png'},
        },
        ['shell_v16mid'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
            label = 'Apartment Mid',
    
            tags = {'empty', 'k4mb1'},
            rooms = 2,
    
            model = 'k4_v16mid1_shell',
    
            doors = {
                x = 1.42,
                y = -10.22,
                z = 498.51,
                heading = 352.43,
            },
    
            interactable = {
                {
                    target = vector4(1.77, 8.73, 499.5, 89.4),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(1.490127, 8.72, 499.4692),
                                player = vector4(2.13, 8.8, 498.51, 91.81),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(1.490127, 8.72, 499.4692),
                                player = vector4(2.13, 8.8, 498.51, 91.81),
                            },
                        },
                    }
                },
                {
                    target = vector4(2.18, 7.46, 499.55, 174.5),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(1.83032, 7.71, 500.8185),
                                player = vector4(2.05, 7.6, 498.55, 93.26),
                            },
                        }
                    },
                },
            },
            
            images = {
                'https://cfx-nui-vms_housing/html/images/shell/shell_v16mid.png',
            },
        },
        ['default_housing6_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Default Housing 6',
            model = 'k4_v16mid2_shell',
            rooms = 0,
            
            doors = vector4(4.7064, -6.5469, 497.3412, 1.6645),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(4.17920017242431, 6.32490015029907, 500.5603942871094),
                                player = vector4(4.12139987945556, 5.65240001678466, 499.34039306640625, 2.94580006599426)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        },
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(4.17729997634887, 6.33069992065429, 500.5404052734375),
                                player = vector4(4.18550014495849, 5.64970016479492, 499.34039306640625, 2.91779994964599)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(4.12799978256225, 6.29470014572143, 500.8804931640625, 0),
                    targetSize = vector3(1.14500033855438, 1.09500038623809, 1.20000004768371)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/default_housing6_k4mb1.png'},
        },
        ['shell_ranch'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
            tags = {'empty', 'k4mb1'},
    
            label = 'Ranch',
            model = 'k4_ranch1_shell',
            rooms = 0,
            
            doors = vector4(-3.7754, -6.5034, 499.2162, 269.3096),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_ranch.png'},
        },
        ['default_housing2_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Default Housing 2',
            model = 'k4_ranch2_shell',
            rooms = 0,
            
            doors = vector4(-5.6099, -5.0954, 498.7083, 271.5574),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(1.77900004386901, 17.77140045166015, 499.33441162109375),
                                player = vector4(1.14900004863739, 17.77420043945312, 498.4142150878906, 270.9128112792969)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(1.6576999425888, 17.73660087585449, 499.8543090820313, 0),
                    targetSize = vector3(0.66000080108642, 0.93500053882598, 1.20000004768371)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/default_housing2_k4mb1.png'},
        },
        ['shell_frankaunt'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
            label = 'Franklin Home',
    
            tags = {'empty', 'k4mb1'},
            rooms = 4,
    
            model = 'k4_shell_medium1',
    
            doors = {
                x = -0.34,
                y = -5.64,
                z = 498.43,
                heading = 3.4,
            },
            
            interactable = {
                {
                    target = vector4(-3.26, -2.72, 499.26, -173.82),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-3.058464, -2.782931, 499.4339),
                                player = vector4(-3.24, -1.97, 498.43, 178.36),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-3.058464, -2.782931, 499.4339),
                                player = vector4(-3.24, -1.97, 498.43, 178.36),
                            },
                        },
                    }
                },
                {
                    target = vector4(-5.15, -1.92, 498.56, 88.45),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-5.021169, -2.469955, 500.576),
                                player = vector4(-5.12, -2.2, 498.55, 180.31),
                            },
                        }
                    },
                },
            },
    
            images = {
                'https://cfx-nui-vms_housing/html/images/shell/shell_frankaunt.png',
            },
        },
        ['medium_housing1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Medium Housing 1',
            model = 'k4_shell_medium2',
            rooms = 0,
            
            doors = vector4(-0.275, -5.8341, 498.4459, 2.5892),
    
            interactable = {
                {
                    target = vector4(-3.24880003929138, -2.65260004997253, 499.966796875, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-3.05029988288879, -2.77349996566772, 499.4461059570313),
                                player = vector4(-3.13579988479614, -2.17779994010925, 498.4460144042969, 183.077392578125)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.60000085830688, 0.49500095844268, 1.20000004768371)
                },
                {
                    target = vector4(3.59660005569458, 7.61399984359741, 500.0268859863281, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(3.67549991607666, 7.53380012512207, 499.64599609375),
                                player = vector4(3.75209999084472, 6.87839984893798, 498.4460144042969, 3.52160000801086)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(1.2900002002716, 1.17000031471252, 1.20000004768371)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/medium_housing1_k4mb1.png'},
        },
        ['shell_medium2'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Medium 2',
            model = 'k4_shell_medium3',
            rooms = 0,
            
            doors = vector4(6.071, 0.2818, 498.3337, 358.5476),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_medium2.png'},
        },
        ['medium_housing2_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Medium Housing 2',
            model = 'k4_shell_medium4',
            rooms = 0,
            
            doors = vector4(6.0465, 0.281, 498.3337, 357.7201),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/medium_housing2_k4mb1.png'},
        },
        ['shell_medium3'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Medium 3',
            model = 'k4_shell_medium5',
            rooms = 0,
            
            doors = vector4(5.8919, -1.6776, 500.1845, 87.5525),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_medium3.png'},
        },
        ['medium_housing3_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Medium Housing 3',
            model = 'k4_shell_medium6',
            rooms = 0,
            
            doors = vector4(5.8908, -1.6523, 500.1836, 89.3483),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/medium_housing3_k4mb1.png'},
        },
        ['shell_apartment1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Apartment 1',
            model = 'k4_highend1_shell',
            rooms = 0,
            
            doors = vector4(-2.2203, 9.0183, 502.1964, 179.6264),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(5.71519994735717, 3.14179992675781, 503.3765869140625),
                                player = vector4(5.10869979858398, 3.14019989967346, 502.1965942382813, 272.6606140136719)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        },
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(5.71150016784668, 3.14079999923706, 503.3765869140625),
                                player = vector4(5.11870002746582, 3.16020011901855, 502.1965942382813, 274.6252136230469)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(5.73439979553222, 2.97149991989135, 503.7713012695313, 0),
                    targetSize = vector3(0.86500060558319, 1.21500027179718, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(3.93169999122619, 2.93910002708435, 499.39801025390625),
                                player = vector4(3.85660004615783, 2.33640003204345, 498.39788818359375, 2.43169999122619)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(3.92950010299682, 2.91820001602172, 499.7372131347656, 0),
                    targetSize = vector3(1.02000045776367, 0.86000061035156, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(5.35760021209716, 2.94239997863769, 499.39801025390625),
                                player = vector4(5.32119989395141, 2.30419993400573, 498.39788818359375, 357.7966003417969)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(5.37419986724853, 3.03369998931884, 499.7372131347656, 0),
                    targetSize = vector3(0.8850005865097, 1.14500033855438, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(1.51049995422363, -2.92930006980896, 501.3369140625),
                                player = vector4(1.39810001850128, -2.90129995346069, 498.4212951660156, 103.43250274658205)
                            },
                            type = 'shower',
                            timeUsage = 10000
                        }
                    },
                    target = vector4(1.49670004844665, -3.0527000427246, 500.8508911132813, 0),
                    targetSize = vector3(3.03002309799194, 2.14000272750854, 2.45000958442688)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_apartment1.png'},
        },
        ['highend_housing1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'High-end Housing 1',
            model = 'k4_highend2_shell',
            rooms = 0,
            
            doors = vector4(-2.2203, 9.0183, 502.1964, 179.6264),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(5.71519994735717, 3.14179992675781, 503.3765869140625),
                                player = vector4(5.10869979858398, 3.14019989967346, 502.1965942382813, 272.6606140136719)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        },
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(5.71150016784668, 3.14079999923706, 503.3765869140625),
                                player = vector4(5.11870002746582, 3.16020011901855, 502.1965942382813, 274.6252136230469)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(5.73439979553222, 2.97149991989135, 503.7713012695313, 0),
                    targetSize = vector3(0.86500060558319, 1.21500027179718, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(3.93169999122619, 2.93910002708435, 499.39801025390625),
                                player = vector4(3.85660004615783, 2.33640003204345, 498.39788818359375, 2.43169999122619)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(3.92950010299682, 2.91820001602172, 499.7372131347656, 0),
                    targetSize = vector3(1.02000045776367, 0.86000061035156, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(5.35760021209716, 2.94239997863769, 499.39801025390625),
                                player = vector4(5.32119989395141, 2.30419993400573, 498.39788818359375, 357.7966003417969)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(5.37419986724853, 3.03369998931884, 499.7372131347656, 0),
                    targetSize = vector3(0.8850005865097, 1.14500033855438, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(1.51049995422363, -2.92930006980896, 501.3369140625),
                                player = vector4(1.39810001850128, -2.90129995346069, 498.4212951660156, 103.43250274658205)
                            },
                            type = 'shower',
                            timeUsage = 10000
                        }
                    },
                    target = vector4(1.49670004844665, -3.0527000427246, 500.8508911132813, 0),
                    targetSize = vector3(3.03002309799194, 2.14000272750854, 2.45000958442688)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/highend_housing1_k4mb1.png'},
        },
        ['shell_apartment2'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Apartment 2',
            model = 'k4_highend3_shell',
            rooms = 0,
            
            doors = vector4(-2.2203, 9.0183, 502.1964, 179.6264),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(5.71519994735717, 3.14179992675781, 503.3765869140625),
                                player = vector4(5.10869979858398, 3.14019989967346, 502.1965942382813, 272.6606140136719)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        },
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(5.71150016784668, 3.14079999923706, 503.3765869140625),
                                player = vector4(5.11870002746582, 3.16020011901855, 502.1965942382813, 274.6252136230469)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(5.73439979553222, 2.97149991989135, 503.7713012695313, 0),
                    targetSize = vector3(0.86500060558319, 1.21500027179718, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(3.93169999122619, 2.93910002708435, 499.39801025390625),
                                player = vector4(3.85660004615783, 2.33640003204345, 498.39788818359375, 2.43169999122619)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(3.92950010299682, 2.91820001602172, 499.7372131347656, 0),
                    targetSize = vector3(1.02000045776367, 0.86000061035156, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(5.35760021209716, 2.94239997863769, 499.39801025390625),
                                player = vector4(5.32119989395141, 2.30419993400573, 498.39788818359375, 357.7966003417969)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(5.37419986724853, 3.03369998931884, 499.7372131347656, 0),
                    targetSize = vector3(0.8850005865097, 1.14500033855438, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(1.51049995422363, -2.92930006980896, 501.3369140625),
                                player = vector4(1.39810001850128, -2.90129995346069, 498.4212951660156, 103.43250274658205)
                            },
                            type = 'shower',
                            timeUsage = 10000
                        }
                    },
                    target = vector4(1.49670004844665, -3.0527000427246, 500.8508911132813, 0),
                    targetSize = vector3(3.03002309799194, 2.14000272750854, 2.45000958442688)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_apartment2.png'},
        },
        ['highend_housing2_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'High-end Housing 2',
            model = 'k4_highend4_shell',
            rooms = 0,
            
            doors = vector4(-2.2203, 9.0183, 502.1964, 179.6264),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(5.71519994735717, 3.14179992675781, 503.3765869140625),
                                player = vector4(5.10869979858398, 3.14019989967346, 502.1965942382813, 272.6606140136719)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        },
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(5.71150016784668, 3.14079999923706, 503.3765869140625),
                                player = vector4(5.11870002746582, 3.16020011901855, 502.1965942382813, 274.6252136230469)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(5.73439979553222, 2.97149991989135, 503.7713012695313, 0),
                    targetSize = vector3(0.86500060558319, 1.21500027179718, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(3.93169999122619, 2.93910002708435, 499.39801025390625),
                                player = vector4(3.85660004615783, 2.33640003204345, 498.39788818359375, 2.43169999122619)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(3.92950010299682, 2.91820001602172, 499.7372131347656, 0),
                    targetSize = vector3(1.02000045776367, 0.86000061035156, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(5.35760021209716, 2.94239997863769, 499.39801025390625),
                                player = vector4(5.32119989395141, 2.30419993400573, 498.39788818359375, 357.7966003417969)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(5.37419986724853, 3.03369998931884, 499.7372131347656, 0),
                    targetSize = vector3(0.8850005865097, 1.14500033855438, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(1.51049995422363, -2.92930006980896, 501.3369140625),
                                player = vector4(1.39810001850128, -2.90129995346069, 498.4212951660156, 103.43250274658205)
                            },
                            type = 'shower',
                            timeUsage = 10000
                        }
                    },
                    target = vector4(1.49670004844665, -3.0527000427246, 500.8508911132813, 0),
                    targetSize = vector3(3.03002309799194, 2.14000272750854, 2.45000958442688)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/highend_housing2_k4mb1.png'},
        },
        ['shell_apartment3'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Apartment 3',
            model = 'k4_highend5_shell',
            rooms = 0,
            
            doors = vector4(11.7026, 4.6768, 501.004, 131.2293),
    
            interactable = {
                {
                    target = vector4(-14.18540000915527, -4.97380018234252, 501.1619873046875, 34),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-14.07590007781982, -4.89249992370605, 500.90380859375),
                                player = vector4(-13.6697998046875, -5.60150003433227, 499.6039123535156, 34.85430145263672)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(1.59999990463256, 1.5, 1.20000004768371)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_apartment3.png'},
        },
        ['highend_housing3_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'High-end Housing 3',
            model = 'k4_highend6_shell',
            rooms = 0,
            
            doors = vector4(11.7384, 4.5981, 501.0049, 126.6386),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-14.07409954071045, -4.88770008087158, 500.8846130371094),
                                player = vector4(-13.60490036010742, -5.58139991760253, 499.6046142578125, 35.38790130615234)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        },
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-14.07069969177246, -4.89949989318847, 500.8846130371094),
                                player = vector4(-13.57689952850341, -5.63870000839233, 499.6046142578125, 34.70610046386719)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(-14.19449996948242, -4.79320001602172, 501.1619873046875, 306),
                    targetSize = vector3(1.5, 1.5, 1.20000004768371)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/highend_housing3_k4mb1.png'},
        },
        ['shell_highend'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'High-End',
            model = 'k4_highend7_shell',
            rooms = 0,
            
            doors = vector4(-22.3644, -0.3758, 506.2018, 268.9712),
    
            interactable = {
                {
                    target = vector4(-6.95709991455078, 8.59210014343261, 506.4065856933594, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-7.10909986495971, 8.43220043182373, 506.1592102050781),
                                player = vector4(-7.22949981689453, 9.21059989929199, 504.7992858886719, 186.4947052001953)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(1.78499972820281, 1.0250004529953, 1.20000004768371)
                },
                {
                    target = vector4(-8.66380023956298, 5.5096001625061, 501.339599609375, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-8.63799953460693, 5.59450006484985, 500.9948120117188),
                                player = vector4(-8.64579963684082, 6.25799989700317, 499.99560546875, 182.05499267578128)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(1.03500044345855, 1.14500033855438, 1.20000004768371)
                },
                {
                    target = vector4(-7.21229982376098, 5.5507001876831, 501.339599609375, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-7.20900011062622, 5.59060001373291, 501.0155944824219),
                                player = vector4(-7.18769979476928, 6.26579999923706, 499.9945068359375, 181.27549743652344)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.75500071048736, 0.89500057697296, 1.20000004768371)
                },
                {
                    target = vector4(-6.72319984436035, 9.62430000305175, 502.4212951660156, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(-6.16750001907348, 9.63319969177246, 502.408203125),
                                player = vector4(-6.41680002212524, 9.56550025939941, 500.0368041992188, 254.8453063964844)
                            },
                            billType = 'water',
                            waterUsage = 120000,
                            type = 'shower',
                            timeUsage = 10000
                        }
                    },
                    targetSize = vector3(2.0450005531311, 1.4650000333786, 2.76001667976379)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_highend.png'},
        },
        ['deluxe_housing1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Deluxe Housing 1',
            model = 'k4_highend8_shell',
            rooms = 0,
            
            doors = vector4(-22.3495, -0.3469, 506.2066, 274.0184),
    
            interactable = {
                {
                    target = vector4(-8.67700004577636, 5.64319992065429, 501.339599609375, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-8.63650035858154, 5.59420013427734, 501),
                                player = vector4(-8.58679962158203, 6.27869987487793, 499.9997863769531, 180.78619384765625)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.71000075340271, 0.77000069618225, 1.20000004768371)
                },
                {
                    target = vector4(-7.21220016479492, 5.63210010528564, 501.339599609375, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-7.20749998092651, 5.59189987182617, 501),
                                player = vector4(-7.21799993515014, 6.24410009384155, 499.9997863769531, 178.72390747070312)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.72500073909759, 0.70000076293945, 1.20000004768371)
                },
                {
                    target = vector4(-6.75430011749267, 9.6451997756958, 502.4212951660156, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(-6.15509986877441, 9.6265001296997, 502.3992004394531),
                                player = vector4(-6.19250011444091, 9.67319965362548, 500.0368041992188, 270.1065063476563)
                            },
                            billType = 'water',
                            waterUsage = 120000,
                            type = 'shower',
                            timeUsage = 10000
                        }
                    },
                    targetSize = vector3(2.05000066757202, 1.5, 3.16002583503723)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/deluxe_housing1_k4mb1.png'},
        },
        ['shell_highendv2'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'High-End V2',
            model = 'k4_highend9_shell',
            rooms = 0,
            
            doors = vector4(-10.4266, 0.854, 500.9306, 271.1348),
    
            interactable = {
                {
                    target = vector4(-2.91650009155273, 17.97179985046386, 501.0730895996094, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-2.93650007247924, 17.96839904785156, 500.7491149902344),
                                player = vector4(-2.26139998435974, 17.91920089721679, 499.72900390625, 88.77469635009766)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.68500077724456, 0.81000065803527, 1.20000004768371)
                },
                {
                    target = vector4(-2.90829992294311, 16.56299972534179, 501.0730895996094, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-2.94549989700317, 16.53520011901855, 500.7290954589844),
                                player = vector4(-2.31620001792907, 16.49860000610351, 499.72900390625, 87.2583999633789)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.66000080108642, 0.72000074386596, 1.20000004768371)
                },
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_highendv2.png'},
        },
        ['deluxe_housing2_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Deluxe Housing 2',
            model = 'k4_highend10_shell',
            rooms = 0,
            
            doors = vector4(-10.4266, 0.9391, 500.9294, 268.7006),
    
            interactable = {
                {
                    target = vector4(-3.03329992294311, 16.55249977111816, 501.0730895996094, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-2.94670009613037, 16.53400039672851, 500.7489929199219),
                                player = vector4(-2.32990002632141, 16.49099922180175, 499.7291870117188, 90.9281997680664)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.96000051498413, 0.73500072956085, 1.20000004768371)
                },
                {
                    target = vector4(-2.86610007286071, 17.98250007629394, 501.0730895996094, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-2.94930005073547, 17.96610069274902, 500.7492980957031),
                                player = vector4(-2.32620000839233, 17.91650009155273, 499.7291870117188, 91.19200134277344)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.79500067234039, 0.73500072956085, 1.20000004768371)
                },
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/deluxe_housing2_k4mb1.png'},
        },
        ['shell_michael'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
            label = 'Michael Home',
    
            tags = {'empty', 'k4mb1'},
            rooms = 6,
    
            model = 'k4_michael_shell',
    
            doors = {
                x = -9.33,
                y = 5.68,
                z = 494.94,
                heading = 271.62,
            },
    
            images = {
                'https://cfx-nui-vms_housing/html/images/shell/shell_michael.png',
            },
        },
        ['deluxe_housing3_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Deluxe Housing 3',
            model = 'k4_michael2_shell',
            rooms = 0,
            
            doors = vector4(-9.5858, 5.7369, 494.931, 265.3249),
    
            interactable = {
                {
                    target = vector4(11.93850040435791, 6.39639997482299, 496.7799987792969, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(11.81040000915527, 6.14169979095459, 496.7236022949219),
                                player = vector4(11.17210006713867, 6.21339988708496, 495.3836975097656, 269.1722106933594)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(1.13000035285949, 1.22500026226043, 1.20000004768371)
                },
                {
                    target = vector4(-2.03080010414123, -7.19290018081665, 500.9544982910156, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-2.15190005302429, -7.20970010757446, 500.4390869140625),
                                player = vector4(-1.52079999446868, -7.27040004730224, 499.518798828125, 87.34590148925781)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.67000079154968, 0.82500064373016, 1.20000004768371)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/deluxe_housing3_k4mb1.png'},
        },
        ['shell_banham'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Banham',
            model = 'k4_banham1_shell',
            rooms = 0,
            
            doors = vector4(-3.2979, -1.5442, 500.2328, 91.287),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(5.08230018615722, 7.98129987716674, 501.3085021972656),
                                player = vector4(5.06180000305175, 7.26599979400634, 500.2284851074219, 359.2152099609375)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        },
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(5.08339977264404, 7.97989988327026, 501.3085021972656),
                                player = vector4(5.10249996185302, 7.27129983901977, 500.2284851074219, 2.99210000038146)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        }
                    },
                    target = vector4(5.05989980697631, 7.85690021514892, 501.6156921386719, 0),
                    targetSize = vector3(1.10000038146972, 0.87500059604644, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(6.31799983978271, 7.97819995880126, 501.3085021972656),
                                player = vector4(6.35650014877319, 7.26270008087158, 500.2283935546875, 358.6387939453125)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        },
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(6.3189001083374, 7.98140001296997, 501.3085021972656),
                                player = vector4(6.29570007324218, 7.24100017547607, 500.2283935546875, 359.91180419921875)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(6.34189987182617, 7.86880016326904, 501.6156921386719, 0),
                    targetSize = vector3(1.09000039100646, 0.89500057697296, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(8.56739997863769, 2.07220005989074, 502.7077026367188),
                                player = vector4(8.45650005340576, 2.12930011749267, 500.2283935546875, 265.4637145996094)
                            },
                            type = 'shower',
                            timeUsage = 10000
                        }
                    },
                    target = vector4(7.71619987487793, 3.00609993934631, 503.010498046875, 0),
                    targetSize = vector3(2.58501291275024, 4.08004713058471, 2.75501656532287)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_banham.png'},
        },
        ['modern_housing1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Modern Housing 1',
            model = 'k4_westons2_shell',
            rooms = 0,
            
            doors = vector4(4.3168, 10.6303, 500.3439, 176.4297),
    
            interactable = {
                {
                    target = vector4(-7.18779993057251, 21.29619979858398, 497.96630859375, 0),
                    targetSize = vector3(1.20500028133392, 0.84000062942504, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-7.16680002212524, 21.93099975585937, 496.5797119140625, 180.52139282226565),
                                particles = vector3(-7.19509983062744, 21.23660087585449, 497.6597900390625)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-8.46100044250488, 21.27400016784668, 497.96630859375, 0),
                    targetSize = vector3(0.9900004863739, 0.82000064849853, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-8.38949966430664, 21.9365005493164, 496.5797119140625, 181.7200927734375),
                                particles = vector3(-8.4306001663208, 21.23340034484863, 497.6597900390625)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-9.84879970550537, 26.16939926147461, 498.8543090820313, 0),
                    targetSize = vector3(2.69001531600952, 3.99504518508911, 2.94002079963684),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-10.5625, 27.17160034179687, 496.5798950195313, 82.86840057373047),
                                particles = vector3(-10.67640018463134, 27.13610076904297, 499.0589904785156)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/modern_housing1_k4mb1.png'},
        },
        ['shell_westons'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Westons',
            model = 'k4_westons1_shell',
            rooms = 1,
            
            doors = vector4(4.3031, 10.6311, 500.344, 183.6886),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-7.1939001083374, 21.23240089416504, 497.6597900390625),
                                player = vector4(-7.09689998626709, 21.96890068054199, 496.5797119140625, 180.6179962158203)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        },
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-7.19659996032714, 21.23399925231933, 497.6596984863281),
                                player = vector4(-7.16569995880126, 21.94930076599121, 496.5797119140625, 180.9416046142578)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        }
                    },
                    target = vector4(-7.20410013198852, 21.28969955444336, 497.9661865234375, 0),
                    targetSize = vector3(1.08000040054321, 0.82500064373016, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-8.43000030517578, 21.23509979248047, 497.6596984863281),
                                player = vector4(-8.41370010375976, 21.96470069885254, 496.5797119140625, 181.5634002685547)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        },
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-8.42959976196289, 21.22949981689453, 497.6596984863281),
                                player = vector4(-8.41160011291503, 21.949800491333, 496.5797119140625, 183.10850524902344)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(-8.46979999542236, 21.297700881958, 497.9661865234375, 0),
                    targetSize = vector3(1.0250004529953, 0.81000065803527, 1.20000004768371)
                },
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_westons.png'},
        },
        ['modern_housing2_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Modern Housing 2',
            model = 'k4_westons4_shell',
            rooms = 0,
            
            doors = vector4(-1.8498, 10.6005, 500.3439, 176.3815),
    
            interactable = {
                {
                    target = vector4(10.97010040283203, 21.3696002960205, 498.1546936035156, 0),
                    targetSize = vector3(1.02000045776367, 0.87500059604644, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(11.06149959564209, 21.94739913940429, 496.5799865722656, 183.80760192871097),
                                particles = vector3(10.99059963226318, 21.23139953613281, 497.66009521484375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(9.69960021972656, 21.31310081481933, 498.1546936035156, 0),
                    targetSize = vector3(0.93500053882598, 0.98000049591064, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(9.79399967193603, 21.99410057067871, 496.5801086425781, 180.0924072265625),
                                particles = vector3(9.75710010528564, 21.23320007324218, 497.66009521484375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(12.41409969329834, 26.16720008850097, 498.8055114746094, 0),
                    targetSize = vector3(2.69501543045043, 4.04504632949829, 2.44000935554504),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(13.18780040740966, 27.24710083007812, 496.58099365234375, 248.28770446777344),
                                particles = vector3(13.2677001953125, 27.152099609375, 499.0593872070313)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/modern_housing2_k4mb1.png'},
        },
        ['shell_westons2'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Westons 2',
            model = 'k4_westons3_shell',
            rooms = 0,
            
            doors = vector4(-1.8093, 10.5981, 500.3449, 180.7974),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(9.75500011444091, 21.22340011596679, 497.6610107421875),
                                player = vector4(9.77760028839111, 21.93140029907226, 496.5809020996094, 178.01600646972656)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        },
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(9.75549983978271, 21.22979927062988, 497.6610107421875),
                                player = vector4(9.78569984436035, 21.95210075378418, 496.5809020996094, 179.63299560546875)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        }
                    },
                    target = vector4(9.73989963531494, 21.36899948120117, 497.96630859375, 0),
                    targetSize = vector3(1.08000040054321, 1.00000047683715, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(10.99090003967285, 21.22979927062988, 497.660888671875),
                                player = vector4(10.99050045013427, 21.93110084533691, 496.5809020996094, 178.2436981201172)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        },
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(10.99059963226318, 21.22949981689453, 497.660888671875),
                                player = vector4(11.0802001953125, 21.94179916381836, 496.5809020996094, 180.07369995117188)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        }
                    },
                    target = vector4(10.96339988708496, 21.29100036621093, 497.9913024902344, 0),
                    targetSize = vector3(1.08500039577484, 0.84500062465667, 1.25)
                },
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_westons2.png'},
        },
        ['modern_housing3_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Modern Housing 3',
            model = 'k4_banham2_shell',
            rooms = 0,
            
            doors = vector4(-3.2628, -1.5233, 500.2323, 87.3609),
    
            interactable = {
                {
                    target = vector4(5.05849981307983, 7.94110012054443, 501.6156921386719, 0),
                    targetSize = vector3(1.11500036716461, 0.87500059604644, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(5.06669998168945, 7.27059984207153, 500.2283935546875, 1.22689998149871),
                                particles = vector3(5.07910013198852, 7.98169994354248, 501.3085021972656)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(6.32299995422363, 8.00030040740966, 501.6156921386719, 0),
                    targetSize = vector3(1.21500027179718, 0.96000051498413, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(6.32420015335083, 7.28319978713989, 500.2283020019531, 1.65760004520416),
                                particles = vector3(6.3221001625061, 7.98239994049072, 501.3084106445313)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/modern_housing3_k4mb1.png'},
        },
    }
    
    addShells(shells)
end)
