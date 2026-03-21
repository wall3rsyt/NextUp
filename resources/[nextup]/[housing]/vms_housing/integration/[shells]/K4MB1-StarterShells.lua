CreateThread(function()
    Wait(1000)
    
    if not Config.Shells.K4MB1_StarterShells then return end
    
    if Config.Shells.K4MB1 then
        return warn(("^3You cannot have ^1%s^3 and ^1%s^3 running at the same time.^7"):format('K4MB1_StarterShells', 'k4mb1shellstarter'))
    end
    
    local shells = {
        ['standardmotel_shell'] = {
            label = 'Standard Motel',
    
            tags = {'furnished', 'k4mb1'},
            rooms = 1,
    
            model = 'k4_motel2_furn',
    
            doors = {
                x = -0.34,
                y = -2.46,
                z = 498.44,
                heading = 273.05
            },
    
            interactable = {
                {
                    target = vector4(-3.05, 1.9, 499.18, 89.42),
                    targetSize = vector3(0.9, 0.8, 2.0),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-3.181917, 1.890949, 499.4141),
                                player = vector4(-2.36, 1.91, 498.45, 91.9),
                            },
                        },
                        {
                            timeUsage = 5000,
                            targetIcon = "fa-solid fa-glass-water-droplet",
                            type = 'sink_drink',
                            waterUsage = 300, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-3.181917, 1.890949, 499.4141),
                                player = vector4(-2.36, 1.91, 498.45, 91.9),
                            },
                        },
                    }
                },
                {
                    target = vector4(-2.47, 0.68, 499.52, 173.06),
                    targetSize = vector3(2.0, 1.1, 3.3),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = "fa-solid fa-shower",
                            type = 'shower',
                            waterUsage = 120000, -- Mililiters
                            billType = 'water',
                            coords = {
                                particles = vector3(-2.808648, 0.9071249, 500.7754),
                                player = vector4(-2.61, 0.7, 498.52, 86.88),
                            },
                        }
                    },
                },
            },
            
            images = {
                'https://cfx-nui-vms_housing/html/images/shell/standardmotel_shell.png',
            },
        },
        
        ['modernhotel_shell'] = {
            label = 'Modern Hotel',
    
            tags = {'furnished', 'k4mb1'},
            rooms = 1,
    
            model = 'k4_hotel4_furn',
    
            doors = {
                x = 4.93,
                y = 4.13,
                z = 498.18,
                heading = 180.57,
            },
    
            images = {
                'https://cfx-nui-vms_housing/html/images/shell/modernhotel_shell.png',
            },
        },
    
        ['shell_v16low'] = {
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
    
        ['shell_v16mid'] = {
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
    
        ['shell_frankaunt'] = {
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
    
        ['shell_michael'] = {
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
        
        ['shell_trevor'] = {
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
        
        ['shell_trailer'] = {
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
        
        ['shell_garagem'] = {
            label = 'Garage',
    
            tags = {'empty', 'k4mb1'},
            rooms = 1,
    
            model = 'k4_garage6_shell',
    
            doors = {
                x = 3.64,
                y = -7.03,
                z = 498.25,
                heading = 0.43,
            },
            
            images = {
                'https://cfx-nui-vms_housing/html/images/shell/shell_garagem.png',
            },
        },
    
        ['shell_warehouse1'] = {
            label = 'Warehouse',
    
            tags = {'empty', 'k4mb1'},
            rooms = 1,
    
            model = 'k4_warehouse1_shell',
            
            doors = {
                x = 8.48,
                y = 0.12,
                z = 498.05,
                heading = 88.87,
            },
            
            images = {
                'https://cfx-nui-vms_housing/html/images/shell/shell_warehouse1.png',
            },
        },
        
        ['container_shell'] = {
            label = 'Container',
    
            tags = {'empty', 'k4mb1'},
            rooms = 1,
    
            model = 'k4_container_shell',
    
            doors = {
                x = -0.02,
                y = -5.54,
                z = 498.79,
                heading = 2.64,
            },
            
            images = {
                'https://cfx-nui-vms_housing/html/images/shell/container_shell.png',
            },
        },
    
        ['k4mb1_warehouse_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Warehouse',
            model = 'k4_warehouse4_shell',
            rooms = 0,
            
            doors = vector4(8.7008, -3.3682, 497.5053, 85.5066),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_warehouse_shell.png'},
        },
        
        ['k4mb1_apartment_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Apartment',
            model = 'k4_house3_shell',
            rooms = 0,
            
            doors = vector4(2.9913, -3.622, 498.7553, 88.501),
    
            interactable = {
                {
                    target = vector4(1.02730000019073, -5.06909990310668, 500.2253112792969, 0),
                    targetSize = vector3(0.76500070095062, 0.76000070571899, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.06589996814727, -4.5297999382019, 498.7554016113281, 177.9611053466797),
                                particles = vector3(0.9666000008583, -5.13920021057128, 499.83538818359375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.22759999334812, 4.15010023117065, 500.180908203125, 0),
                    targetSize = vector3(0.62000095844268, 0.4650011062622, 0.83000040054321),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(0.20340000092983, 3.70880007743835, 498.7544860839844, 0.17409999668598),
                                particles = vector3(0.24050000309944, 4.18930006027221, 499.7345886230469)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_apartment_shell.png'},
        },
        
        ['k4mb1_farmhouse_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Farm House',
            model = 'k4_house11_shell',
            rooms = 0,
            
            doors = vector4(0.6662, -9.4758, 497.7579, 272.752),
    
            interactable = {
                {
                    target = vector4(4.19509983062744, -2.03169989585876, 499.2861022949219, 0),
                    targetSize = vector3(1.00500047206878, 0.72500073909759, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(4.1612000465393, -2.55029988288879, 497.7579040527344, 0.87260001897811),
                                particles = vector3(4.21750020980835, -1.97169995307922, 498.7179870605469)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(4.75339984893798, 8.24139976501464, 499.3179931640625, 0),
                    targetSize = vector3(0.74000072479248, 1.38000011444091, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(4.13649988174438, 8.27569961547851, 497.7579040527344, 284.1875),
                                particles = vector3(4.81120014190673, 8.31960010528564, 498.9978942871094)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-3.46580004692077, 6.09420013427734, 499.3175964355469, 0),
                    targetSize = vector3(1.30500018596649, 0.80500066280364, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-3.37989997863769, 5.44119977951049, 497.7579040527344, 0.71840000152587),
                                particles = vector3(-3.41799998283386, 6.12410020828247, 498.9978942871094)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-10.78009986877441, 4.7943000793457, 499.2847900390625, 0),
                    targetSize = vector3(0.79000067710876, 0.9900004863739, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-10.33189964294433, 4.78819990158081, 497.7579040527344, 87.0197982788086),
                                particles = vector3(-10.88230037689209, 4.791100025177, 498.7181091308594)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-3.30229997634887, 3.19050002098083, 505.0328979492188, 0),
                    targetSize = vector3(1.24500024318695, 1.38000011444091, 2.58501267433166),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-3.476900100708, 3.46499991416931, 502.5408935546875, 22.39599990844726),
                                particles = vector3(-3.51999998092651, 3.50230002403259, 504.3717956542969)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-0.8711000084877, 0.58530002832412, 504.0361022949219, 0),
                    targetSize = vector3(0.79500067234039, 0.71500074863433, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-0.81470000743865, 1.17789995670318, 502.5120849609375, 181.3025054931641),
                                particles = vector3(-0.85430002212524, 0.51219999790191, 503.4722900390625)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(2.4662001132965, -4.93410015106201, 504.0361022949219, 0),
                    targetSize = vector3(0.81000065803527, 0.60000085830688, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(2.4128999710083, -5.46120023727417, 502.5120849609375, 357.0932922363281),
                                particles = vector3(2.46440005302429, -4.92899990081787, 503.4721984863281)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_farmhouse_shell.png'},
        },
        
        ['k4mb1_modern_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Modern',
            model = 'k4_modern9_shell',
            rooms = 0,
            
            doors = vector4(-8.2235, 4.0056, 498.3985, 273.693),
    
            interactable = {
                {
                    options = {
                        {
                            coords = {
                                particles = vector3(-2.37660002708435, 1.1061999797821, 499.3788146972656),
                                player = vector4(-3.10240006446838, 1.15339994430542, 498.3988037109375, 270.7684020996094)
                            },
                            targetIcon = 'fa-solid fa-sink',
                            waterUsage = 5000,
                            type = 'sink',
                            billType = 'water',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(-2.46700000762939, 1.10179996490478, 499.7403869628906, 0),
                    targetSize = vector3(0.65500080585479, 0.71000075340271, 1.20000004768371)
                },
                {
                    options = {
                        {
                            coords = {
                                particles = vector3(-2.38010001182556, -0.32210001349449, 499.3789978027344),
                                player = vector4(-3.09299993515014, -0.30370000004768, 498.3988037109375, 270.7384948730469)
                            },
                            targetIcon = 'fa-solid fa-sink',
                            waterUsage = 5000,
                            type = 'sink',
                            billType = 'water',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(-2.49650001525878, -0.33109998703002, 499.7403869628906, 0),
                    targetSize = vector3(0.72000074386596, 0.69500076770782, 1.20000004768371)
                },
                {
                    options = {
                        {
                            coords = {
                                particles = vector3(-1.37720000743865, -4.34359979629516, 499.6794128417969),
                                player = vector4(-0.56379997730255, -4.39099979400634, 498.3994140625, 87.67030334472656)
                            },
                            targetIcon = 'fa-solid fa-sink',
                            waterUsage = 5000,
                            type = 'sink',
                            billType = 'water',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(-1.14590001106262, -4.30039978027343, 499.93499755859375, 0),
                    targetSize = vector3(1.06500041484832, 1.5, 1.20000004768371)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_modern_shell.png'},
        },
        
        ['shell_lester'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Lester',
            model = 'k4_lester1_shell',
            rooms = 0,
            
            doors = vector4(-1.5352, -5.9851, 498.6249, 0.0323),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_lester.png'},
        },
    
        ['shell_ranch'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Ranch',
            model = 'k4_ranch1_shell',
            rooms = 0,
            
            doors = vector4(-3.7754, -6.5034, 499.2162, 269.3096),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_ranch.png'},
        },
        
        ['furnitured_midapart'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Mid Apartment',
            model = 'k4_house4_furn',
            rooms = 3,
            
            doors = vector4(1.4748, -10.1958, 498.5003, 2.2573),
    
            interactable = {
                {
                    target = vector4(-1.31159996986389, -0.98240000009536, 500.0896911621094, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-1.22179996967315, -1.07529997825622, 499.7257995605469),
                                player = vector4(-1.15989995002746, -0.40560001134872, 498.50579833984375, 182.97210693359375)
                            },
                            billType = 'water',
                            waterUsage = 300,
                            type = 'sink_drink',
                            timeUsage = 5000
                        },
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-1.22179996967315, -1.07529997825622, 499.7257995605469),
                                player = vector4(-1.15989995002746, -0.40560001134872, 498.50579833984375, 182.97210693359375)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(1.24000024795532, 0.95000052452087, 1.20000004768371)
                },
                {
                    target = vector4(1.59899997711181, 8.72309970855712, 499.8810119628906, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(1.48029994964599, 8.72150039672851, 499.4657897949219),
                                player = vector4(2.11669993400573, 8.71199989318847, 498.5060119628906, 91.16079711914064)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.68500077724456, 0.77000069618225, 1.33499991893768)
                },
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/furnitured_midapart.png'},
        },
        
        ['shell_office1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Office 1',
            model = 'k4_office6_shell',
            rooms = 0,
            
            doors = vector4(4.4837, 5.3705, 499.9955, 181.3904),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_office1.png'},
        },

        ['shell_store1'] = {
            tags = {'empty', 'k4mb1'},

            label = 'Store 1',
            model = 'k4_store1_shell',
            rooms = 0,
            
            doors = vector4(-2.7419, 4.543, 498.376, 183.37),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_store1_shell.png'},
        },
    }
    
    addShells(shells)
end)