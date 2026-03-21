CreateThread(function()
    Wait(1000)

    if not Config.Shells.K4MB1_FurnishedHousingPack then return end
    
    if Config.Shells.K4MB1_AllShellsSubPack then
        return warn(("^3You cannot have ^1%s^3 and ^1%s^3 running at the same time.^7"):format('K4MB1_FurnishedHousingPack', 'K4MB1-AllShellsSubPack'))
    end
    
    local shells = {
        ['k4mb1_trap2_shell'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Trap 2',
            model = 'k4_house1_furn',
            rooms = 0,
            
            doors = vector4(-7.1435, -1.3721, 498.7477, 175.361),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_trap2_shell.png'},
        },
        ['k4mb1_motel2_shell'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Motel 2',
            model = 'k4_house2_furn',
            rooms = 0,
            
            doors = vector4(-0.2137, -0.1012, 499.9955, 274.6361),
    
            interactable = {
                {
                    target = vector4(6.08839988708496, 2.81139993667602, 502.4551086425781, 0),
                    targetSize = vector3(1.25000023841857, 2.17000341415405, 2.59001278877258),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(6.11219978332519, 2.26239991188049, 499.95550537109375, 185.3594970703125),
                                particles = vector3(6.11229991912841, 2.1382999420166, 502.214599609375)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(3.48270010948181, 3.55570006370544, 501.46929931640625, 0),
                    targetSize = vector3(0.9900004863739, 0.60000085830688, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(3.43020009994506, 3.0848000049591, 499.99468994140625, 359.2934875488281),
                                particles = vector3(3.47420001029968, 3.59170007705688, 501.11468505859375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_motel2_shell.png'},
        },
        ['furnitured_lowapart'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Low Apartment',
            model = 'k4_house3_furn',
            rooms = 2,
            
            doors = vector4(4.9859, -1.4798, 499.3405, 358.747),
    
            interactable = {
                {
                    target = vector4(-6.0317997932434, -0.92830002307891, 501.85400390625, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(-5.78840017318725, -0.42750000953674, 501.6997985839844),
                                player = vector4(-5.87430000305175, -0.50470000505447, 499.431884765625, 292.18310546875)
                            },
                            billType = 'water',
                            waterUsage = 120000,
                            type = 'shower',
                            timeUsage = 10000
                        }
                    },
                    targetSize = vector3(1.27500021457672, 2.04000043869018, 2.43500924110412)
                },
                {
                    target = vector4(-4.74499988555908, -0.14460000395774, 500.6585083007813, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-4.5261001586914, -0.03030000068247, 500.3411865234375),
                                player = vector4(-4.71129989624023, -0.64190000295639, 499.3411865234375, 346.1051940917969)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.67000079154968, 0.56000089645385, 1.20000004768371)
                },
                {
                    target = vector4(5.34140014648437, 5.13840007781982, 500.9114990234375, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(5.40749979019165, 5.05590009689331, 500.56060791015625),
                                player = vector4(5.58409976959228, 4.38800001144409, 499.3406066894531, 10.35970020294189)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        },
                        {
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(5.40290021896362, 5.07679986953735, 500.54058837890625),
                                player = vector4(5.50339984893798, 4.37550020217895, 499.3406066894531, 4.94449996948242)
                            },
                            billType = 'water',
                            waterUsage = 300,
                            type = 'sink_drink',
                            timeUsage = 5000
                        }
                    },
                    targetSize = vector3(1.5, 1.5, 1.20000004768371)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/furnitured_lowapart.png'},
        },
        ['furnitured_midapart'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
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
        ['kambi_furnishedhouse1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Furnished House 1',
            model = 'k4_house5_furn',
            rooms = 0,
            
            doors = vector4(-0.7781, -2.3495, 499.9955, 268.2168),
    
            interactable = {
                {
                    target = vector4(4.6628999710083, -3.10590004920959, 501.1748962402344, 0),
                    targetSize = vector3(0.57500088214874, 0.5500009059906, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(4.12449979782104, -3.04850006103515, 499.9953918457031, 270.61279296875),
                                particles = vector3(4.70219993591308, -3.16759991645813, 501.0954895019531)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/kambi_furnishedhouse1.png'},
        },
        ['safehouse_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Safe House',
            model = 'k4_house6_furn',
            rooms = 0,
            
            doors = vector4(-5.3011, 0.9917, 498.1637, 270.1903),
    
            interactable = {
                {
                    target = vector4(0.59600001573562, 3.7033998966217, 499.7157897949219, 0),
                    targetSize = vector3(1.37000012397766, 0.66000080108642, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(0.52829998731613, 3.08470010757446, 498.1632080078125, 359.8976135253906),
                                particles = vector3(0.59420001506805, 3.65879988670349, 499.4631042480469)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(5.02099990844726, 4.86339998245239, 499.5963134765625, 0),
                    targetSize = vector3(0.59000086784362, 1.23000025749206, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(4.42880010604858, 4.93470001220703, 498.1628112792969, 269.5994873046875),
                                particles = vector3(5.0265998840332, 4.87039995193481, 499.30279541015625)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(4.02069997787475, 7.10820007324218, 500.7478942871094, 0),
                    targetSize = vector3(2.60501337051391, 1.07500040531158, 2.75001645088195),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(4.84280014038085, 7.22459983825683, 498.1683044433594, 280.5999145507813),
                                particles = vector3(4.88430023193359, 7.14010000228881, 500.5618896484375)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/safehouse_k4mb1.png'},
        },
        ['luxury_housing3_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Luxury Housing 3',
            model = 'k4_house7_furn',
            rooms = 0,
            
            doors = vector4(-6.3826, -1.0078, 498.2944, 269.258),
    
            interactable = {
                {
                    target = vector4(1.60640001296997, -5.74679994583129, 499.8259887695313, 0),
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.33270001411437, -4.94610023498535, 498.29449462890625, 178.49009704589844),
                                particles = vector3(1.30770003795623, -5.75570011138916, 499.41461181640625)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-4.74580001831054, 5.31069993972778, 500.909912109375, 0),
                    targetSize = vector3(1.58999991416931, 1.55999994277954, 3.62003636360168),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-4.7943000793457, 4.92379999160766, 498.29541015625, 342.9130859375),
                                particles = vector3(-4.72800016403198, 5.01070022583007, 500.7546081542969)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-3.22919988632202, 5.36100006103515, 500.202392578125, 0),
                    targetSize = vector3(0.93000054359436, 0.82500064373016, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-3.24000000953674, 4.71859979629516, 498.2952880859375, 357.4952087402344),
                                particles = vector3(-3.23000001907348, 5.29610013961792, 499.815185546875)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-2.13260006904602, 5.40269994735717, 500.202392578125, 0),
                    targetSize = vector3(0.87000060081481, 0.8500006198883, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-2.15019989013671, 4.72060012817382, 498.2952880859375, 358.1921997070313),
                                particles = vector3(-2.14949989318847, 5.289400100708, 499.815185546875)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/luxury_housing3_k4mb1.png'},
        },
        ['luxury_housing4_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Luxury Housing 4',
            model = 'k4_house8_furn',
            rooms = 0,
            
            doors = vector4(-6.3826, -1.0078, 498.2944, 269.258),
    
            interactable = {
                {
                    target = vector4(1.60640001296997, -5.74679994583129, 499.8259887695313, 0),
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.33270001411437, -4.94610023498535, 498.29449462890625, 178.49009704589844),
                                particles = vector3(1.30770003795623, -5.75570011138916, 499.41461181640625)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-4.74580001831054, 5.31069993972778, 500.909912109375, 0),
                    targetSize = vector3(1.58999991416931, 1.55999994277954, 3.62003636360168),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-4.7943000793457, 4.92379999160766, 498.29541015625, 342.9130859375),
                                particles = vector3(-4.72800016403198, 5.01070022583007, 500.7546081542969)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-3.22919988632202, 5.36100006103515, 500.202392578125, 0),
                    targetSize = vector3(0.93000054359436, 0.82500064373016, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-3.24000000953674, 4.71859979629516, 498.2952880859375, 357.4952087402344),
                                particles = vector3(-3.23000001907348, 5.29610013961792, 499.815185546875)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-2.13260006904602, 5.40269994735717, 500.202392578125, 0),
                    targetSize = vector3(0.87000060081481, 0.8500006198883, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-2.15019989013671, 4.72060012817382, 498.2952880859375, 358.1921997070313),
                                particles = vector3(-2.14949989318847, 5.289400100708, 499.815185546875)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/luxury_housing4_k4mb1.png'},
        },
        ['furnitured_motel'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Motel',
            model = 'k4_motel1_furn',
            rooms = 1,
            
            doors = vector4(-1.5181, -3.967, 498.6499, 359.9074),
    
            interactable = {
                {
                    target = vector4(1.11099994182586, 4.01049995422363, 500.2167053222656, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(1.0388000011444, 4.13679981231689, 499.6300048828125),
                                player = vector4(1.05970001220703, 3.59100008010864, 498.64990234375, 0.44190001487731)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.72000074386596, 0.47500097751617, 1.20000004768371)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/furnitured_motel.png'},
        },
        ['standardmotel_shell'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
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
        ['k4mb1_casinohotel_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Casino Hotel',
            model = 'k4_hotel3_furn',
            rooms = 0,
            
            doors = vector4(-3.1696, -0.0628, 498.4167, 269.2626),
    
            interactable = {
                {
                    target = vector4(2.3775999546051, -3.1654999256134, 501.19720458984375, 0),
                    targetSize = vector3(2.32000684738159, 3.24502801895141, 2.75001645088195),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(2.29850006103515, -4.07200002670288, 498.4176940917969, 205.4219970703125),
                                particles = vector3(2.29760003089904, -4.3373999595642, 500.89691162109375)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(0.22769999504089, -4.5595998764038, 499.8388977050781, 0),
                    targetSize = vector3(0.83000063896179, 1.10500037670135, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(0.25879999995231, -3.75200009346008, 498.4176025390625, 181.34500122070312),
                                particles = vector3(0.21680000424385, -4.46169996261596, 499.4977111816406)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-1.02110004425048, -4.43429994583129, 499.8028869628906, 0),
                    targetSize = vector3(1.03500044345855, 0.81000065803527, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-1.02180004119873, -3.78449988365173, 498.4176025390625, 181.22320556640625),
                                particles = vector3(-1.0135999917984, -4.45340013504028, 499.4977111816406)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_casinohotel_shell.png'},
        },
        ['highendmotel_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'High-end Motel',
            model = 'k4_hotel1_furn',
            rooms = 0,
            
            doors = vector4(3.1467, 3.4619, 498.4734, 181.6849),
    
            interactable = {
                {
                    target = vector4(-2.88590002059936, 5.80910015106201, 499.7627868652344, 0),
                    targetSize = vector3(1.01000046730041, 1.07000041007995, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-2.90420007705688, 4.99359989166259, 498.473388671875, 358.7502136230469),
                                particles = vector3(-2.87709999084472, 5.71630001068115, 499.4736022949219)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-4.3189001083374, 5.70620012283325, 499.7627868652344, 0),
                    targetSize = vector3(0.97500050067901, 0.81000065803527, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-4.36740016937255, 5.10739994049072, 498.473388671875, 2.4869999885559),
                                particles = vector3(-4.3043999671936, 5.71640014648437, 499.4736022949219)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/highendmotel_shell.png'},
        },
        ['modernhotel_shell'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
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
        ['classicmotel_shell'] = {
            tags = {'empty', 'k4mb1'},

            label = 'Classic Hotel',
            model = 'k4_hotel2_furn',
            rooms = 0,
            
            doors = vector4(0.0899, -3.7166, 498.6568, 1.917),

            interactable = {
                {
                    options = {
                        {
                            timeUsage = 5000,
                            coords = {
                                player = vector4(-4.30690002441406, -0.63990002870559, 498.6453857421875, 95.05809783935548),
                                particles = vector3(-5.23810005187988, -0.78469997644424, 499.6654968261719)
                            },
                            billType = 'water',
                            type = 'sink_drink',
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            waterUsage = 300
                        },
                        {
                            timeUsage = 7000,
                            coords = {
                                player = vector4(-4.31930017471313, -0.67379999160766, 498.6453857421875, 93.91290283203124),
                                particles = vector3(-5.23719978332519, -0.78670001029968, 499.6654968261719)
                            },
                            billType = 'water',
                            type = 'sink',
                            targetIcon = 'fa-solid fa-sink',
                            waterUsage = 5000
                        }
                    },
                    target = vector4(-5.03579998016357, -0.54000002145767, 500.23541259765625, 0),
                    targetSize = vector3(0.94500052928924, 2.16000318527221, 1.20000004768371)
                }
            },

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_hotel2_furn.png'},
        },
        ['modernhotel2_shell'] = {
            tags = {'furnished', 'k4mb1'},

            label = 'Modern Hotel 2',
            model = 'k4_hotel5_furn',
            rooms = 1,
            
            doors = vector4(4.9243, 4.2605, 498.1742, 182.9991),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_hotel5_furn.png'},
        },
        ['modernhotel3_shell'] = {
            tags = {'furnished', 'k4mb1'},

            label = 'Modern Hotel 3',
            model = 'k4_hotel6_furn',
            rooms = 1,
            
            doors = vector4(4.9478, 4.2645, 498.1742, 180.7423),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_hotel6_furn.png'},
        },
    }
    
    addShells(shells)
end)