CreateThread(function()
    Wait(1000)
    
    if not Config.Shells.K4MB1_AllShellsSubPack then return end
    
    local notAllowedShells = {
        'K4MB1_ExclusiveHousingPack',
        'K4MB1_FurnishedHousingPack',
        'K4MB1_GaragesPack',
        'K4MB1_IllegalOperationsPack',
        'K4MB1_MainHousingPack',
        'K4MB1_MiscPack',
        'K4MB1_PremiumHousingPack',
    }
    
    for k, v in ipairs(notAllowedShells) do
        if Config.Shells[v] then
            return warn(("^3You cannot have ^1%s^3 and ^1%s^3 running at the same time.^7"):format('K4MB1-AllShellsSubPack', v))
        end
    end
    
    local shells = {
        ['k4_hotel1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Hotel 1',
            model = 'k4_hotel1_shell',
            rooms = 1,
            
            doors = vector4(5.0248, 4.3555, 498.1766, 176.685),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_hotel1_shell.png'},
        },
    
        ['k4_hotel2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Hotel 2',
            model = 'k4_hotel2_shell',
            rooms = 1,
            
            doors = vector4(4.9882, 4.3631, 498.1768, 177.8868),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_hotel2_shell.png'},
        },
    
        ['k4_hotel3_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Hotel 3',
            model = 'k4_hotel3_shell',
            rooms = 1,
            
            doors = vector4(4.9009, 4.3302, 498.1767, 180.3679),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_hotel3_shell.png'},
        },
    
        ['k4_motel1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Motel 1',
            model = 'k4_motel1_shell',
            rooms = 0,
            
            doors = vector4(-0.4794, -2.4985, 498.4391, 271.1064),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-3.18099999427795, 1.89909994602203, 499.4006958007813),
                                player = vector4(-2.53740000724792, 1.89740002155303, 498.4414978027344, 90.23699951171876)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        },
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-3.17400002479553, 1.900200009346, 499.401611328125),
                                player = vector4(-2.47180008888244, 1.91480004787445, 498.4414978027344, 89.181396484375)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(-3.06820011138916, 1.89839994907379, 499.7492065429688, 0),
                    targetSize = vector3(0.63000082969665, 0.71000075340271, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(-2.81970000267028, 0.8944000005722, 500.7806091308594),
                                player = vector4(-2.68560004234313, 0.77439999580383, 498.5185852050781, 75.29550170898438)
                            },
                            type = 'shower',
                            timeUsage = 10000
                        }
                    },
                    target = vector4(-2.45059990882873, 0.55119997262954, 500.6758117675781, 0),
                    targetSize = vector3(1.57499992847442, 1.48000001907348, 2.30500626564025)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_motel1_shell.png'},
        },
    
        ['k4_motel2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Motel 2',
            model = 'k4_motel2_shell',
            rooms = 0,
            
            doors = vector4(2.9411, 3.299, 498.6609, 181.6949),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-5.23350000381469, -0.78020000457763, 499.68548583984375),
                                player = vector4(-4.2318000793457, -0.72079998254776, 498.6453857421875, 93.73870086669922)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        },
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-5.2337999343872, -0.34029999375343, 499.68548583984375),
                                player = vector4(-4.31589984893798, -0.31450000405311, 498.6453857421875, 88.35230255126953)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        }
                    },
                    target = vector4(-5.08179998397827, -0.55949997901916, 500.23541259765625, 0),
                    targetSize = vector3(1.13000035285949, 1.5, 1.20000004768371)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_motel2_shell.png'},
        },
    
        ['k4_motel3_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Motel 3',
            model = 'k4_motel3_shell',
            rooms = 0,
            
            doors = vector4(3.1247, 3.5053, 498.4735, 180.4526),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-2.87739992141723, 5.71059989929199, 499.4743041992188),
                                player = vector4(-2.89650011062622, 5.07380008697509, 498.4742126464844, 1.09780001640319)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        },
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-2.8791000843048, 5.71029996871948, 499.4743041992188),
                                player = vector4(-2.90829992294311, 5.09899997711181, 498.4742126464844, 357.7939147949219)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        }
                    },
                    target = vector4(-2.84520006179809, 5.79689979553222, 499.7627868652344, 0),
                    targetSize = vector3(0.9550005197525, 0.93000054359436, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-4.30590009689331, 5.70749998092651, 499.4743041992188),
                                player = vector4(-4.31230020523071, 5.0164999961853, 498.4742126464844, 4.88299989700317)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        },
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-4.30609989166259, 5.70190000534057, 499.4743041992188),
                                player = vector4(-4.32940006256103, 5.08239984512329, 498.4742126464844, 1.05840003490448)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    target = vector4(-4.29489994049072, 5.67399978637695, 499.7627868652344, 0),
                    targetSize = vector3(0.93000054359436, 0.72500073909759, 1.20000004768371)
                },
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(-0.47110000252723, 2.8101999759674, 501.4132080078125),
                                player = vector4(-0.56900000572204, 2.79929995536804, 498.4967956542969, 53.67319869995117)
                            },
                            type = 'shower',
                            timeUsage = 10000
                        }
                    },
                    target = vector4(-0.5067999958992, 2.89159989356994, 501.5963134765625, 0),
                    targetSize = vector3(3.16502618789672, 1.77499973773956, 3.39003109931945)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_motel3_shell.png'},
        },
    
        ['stashhouse3_shell'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Stash House 3',
            model = 'stashhouse3_shell',
            rooms = 0,
            
            doors = vector4(-0.146, 5.6094, 497.9828, 180.7346),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/stashhouse3_shell.png'},
        },
    
        ['shell_apartment1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Apartment 1',
            model = 'shell_apartment1',
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
    
        ['shell_apartment2'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Apartment 2',
            model = 'shell_apartment2',
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
    
        ['k4_mansion_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Mansion 1',
            model = 'k4_mansion_shell',
            rooms = 0,
            
            doors = vector4(-0.1631, -0.5678, 500.0086, 180.7168),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(12.54500007629394, -11.77639961242675, 495.7586975097656),
                                player = vector4(12.32649993896484, -11.11069965362548, 494.8385009765625, 198.5126953125)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        },
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(12.53999996185302, -11.77000045776367, 495.7586059570313),
                                player = vector4(12.33640003204345, -11.16359996795654, 494.8385009765625, 197.43490600585935)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        }
                    },
                    target = vector4(12.48439979553222, -11.68659973144531, 496.2789001464844, 20),
                    targetSize = vector3(1.29500019550323, 0.60500085353851, 1.20000004768371)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_mansion_shell.png'},
        },
    
        ['k4_mansion2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Mansion 2',
            model = 'k4_mansion2_shell',
            rooms = 0,
            
            doors = vector4(-0.1631, -0.5678, 500.0086, 180.7168),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(12.54500007629394, -11.77639961242675, 495.7586975097656),
                                player = vector4(12.32649993896484, -11.11069965362548, 494.8385009765625, 198.5126953125)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        },
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(12.53999996185302, -11.77000045776367, 495.7586059570313),
                                player = vector4(12.33640003204345, -11.16359996795654, 494.8385009765625, 197.43490600585935)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        }
                    },
                    target = vector4(12.48439979553222, -11.68659973144531, 496.2789001464844, 20),
                    targetSize = vector3(1.29500019550323, 0.60500085353851, 1.20000004768371)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_mansion2_shell.png'},
        },
    
        ['k4_mansion3_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Mansion 3',
            model = 'k4_mansion3_shell',
            rooms = 0,
            
            doors = vector4(-0.1631, -0.5678, 500.0086, 180.7168),
    
            interactable = {
                {
                    options = {
                        {
                            billType = 'water',
                            waterUsage = 5000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(12.54500007629394, -11.77639961242675, 495.7586975097656),
                                player = vector4(12.32649993896484, -11.11069965362548, 494.8385009765625, 198.5126953125)
                            },
                            type = 'sink',
                            timeUsage = 7000
                        },
                        {
                            billType = 'water',
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(12.53999996185302, -11.77000045776367, 495.7586059570313),
                                player = vector4(12.33640003204345, -11.16359996795654, 494.8385009765625, 197.43490600585935)
                            },
                            type = 'sink_drink',
                            timeUsage = 5000
                        }
                    },
                    target = vector4(12.48439979553222, -11.68659973144531, 496.2789001464844, 20),
                    targetSize = vector3(1.29500019550323, 0.60500085353851, 1.20000004768371)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_mansion3_shell.png'},
        },
    
        ['shell_medium2'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Medium 2',
            model = 'shell_medium2',
            rooms = 0,
            
            doors = vector4(6.071, 0.2818, 498.3337, 358.5476),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_medium2.png'},
        },
    
        ['shell_medium3'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Medium 3',
            model = 'shell_medium3',
            rooms = 0,
            
            doors = vector4(5.8919, -1.6776, 500.1845, 87.5525),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_medium3.png'},
        },
    
        ['shell_banham'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Banham',
            model = 'shell_banham',
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
    
        ['shell_westons'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Westons',
            model = 'shell_westons',
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
    
        ['shell_westons2'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Westons 2',
            model = 'shell_westons2',
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
    
        ['shell_office1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Office 1',
            model = 'shell_office1',
            rooms = 0,
            
            doors = vector4(4.4837, 5.3705, 499.9955, 181.3904),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_office1.png'},
        },
    
        ['shell_office2'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Office 2',
            model = 'shell_office2',
            rooms = 0,
            
            doors = vector4(3.6459, -1.864, 498.0741, 93.5323),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_office2.png'},
        },
    
        ['default_housing1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Default Housing 1',
            model = 'default_housing1_k4mb1',
            rooms = 0,
    
            doors = vector4(-2.1335, -5.9916, 498.6793, 358.0429),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/default_housing1_k4mb1.png'},
        },
    
        ['default_housing2_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Default Housing 2',
            model = 'default_housing2_k4mb1',
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
    
        ['default_housing3_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Default Housing 3',
            model = 'default_housing3_k4mb1',
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
    
        ['default_housing5_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Default Housing 5',
            model = 'default_housing5_k4mb1',
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
    
        ['default_housing6_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Default Housing 6',
            model = 'default_housing6_k4mb1',
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
    
        ['highend_housing1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'High-end Housing 1',
            model = 'highend_housing1_k4mb1',
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
    
        ['highend_housing2_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'High-end Housing 2',
            model = 'highend_housing2_k4mb1',
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
    
        ['highend_housing3_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'High-end Housing 3',
            model = 'highend_housing3_k4mb1',
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
    
        ['shell_ranch'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Ranch',
            model = 'shell_ranch',
            rooms = 0,
            
            doors = vector4(-3.7754, -6.5034, 499.2162, 269.3096),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_ranch.png'},
        },
    
        ['shell_lester'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Lester',
            model = 'shell_lester',
            rooms = 0,
            
            doors = vector4(-1.5352, -5.9851, 498.6249, 0.0323),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_lester.png'},
        },
    
        ['shell_highend'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'High-End',
            model = 'shell_highend',
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
    
        ['shell_highendv2'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'High-End V2',
            model = 'shell_highendv2',
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
    
        ['furnitured_lowapart'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Low Apartment',
            model = 'furnitured_lowapart',
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
            tags = {'furnished', 'k4mb1'},
    
            label = 'Mid Apartment',
            model = 'furnitured_midapart',
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
    
        ['furnitured_motel'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Motel',
            model = 'furnitured_motel',
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
    
        ['container2_shell'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Container 2',
            model = 'container2_shell',
            rooms = 0,
            
            doors = vector4(0.0828, -5.7088, 498.781, 350.4664),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/container2_shell.png'},
        },
    
        ['stashhouse1_shell'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Stash House 1',
            model = 'stashhouse1_shell',
            rooms = 3,
            
            doors = vector4(21.6324, -0.2829, 496.9237, 90.4644),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/stashhouse1_shell.png'},
        },
    
        ['shell_apartment3'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Apartment 3',
            model = 'shell_apartment3',
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
    
        ['shell_garagel'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Garage l',
            model = 'shell_garagel',
            rooms = 0,
            
            doors = vector4(3.8105, -16.4834, 497.9947, 0.5102),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_garagel.png'},
        },
    
        ['shell_garages'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Garages',
            model = 'shell_garages',
            rooms = 0,
            
            doors = vector4(-0.3966, -4.8094, 498.4946, 1.5658),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_garages.png'},
        },
        
        ['new_garages1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'New Garages 1',
            model = 'new_garages1_k4mb1',
            rooms = 0,
            
            doors = vector4(-0.2192, 14.5161, 493.6575, 179.1481),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/new_garages1_k4mb1.png'},
        },
    
        ['new_garages2_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'New Garages 2',
            model = 'new_garages2_k4mb1',
            rooms = 0,
            
            doors = vector4(-3.9324, -0.038, 498.3396, 270.7706),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/new_garages2_k4mb1.png'},
        },
        
        ['new_garages3_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'New Garages 3',
            model = 'new_garages3_k4mb1',
            rooms = 0,
            
            doors = vector4(-3.8934, -0.413, 498.3398, 269.932),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/new_garages3_k4mb1.png'},
        },
    
        ['new_garages4_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'New Garages 4',
            model = 'new_garages4_k4mb1',
            rooms = 0,
            
            doors = vector4(-3.9393, -7.2366, 498.2446, 350.3344),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/new_garages4_k4mb1.png'},
        },
    
        ['shell_officebig'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Office Big',
            model = 'shell_officebig',
            rooms = 0,
            
            doors = vector4(-12.2957, -3.9208, 498.5961, 358.7365),
    
            interactable = {
                {
                    target = vector4(-0.74879997968673, 11.15960025787353, 499.7688903808594, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-0.66460001468658, 11.1535997390747, 499.4371948242188),
                                player = vector4(-0.02899999916553, 11.18410015106201, 498.5964050292969, 89.95850372314453)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(1.26500022411346, 1.07000041007995, 1.20000004768371)
                },
                {
                    target = vector4(-0.7940000295639, 9.57559967041015, 499.8179016113281, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                particles = vector3(-0.66109997034072, 9.566499710083, 499.4366149902344),
                                player = vector4(0.0291000008583, 9.51910018920898, 498.5960998535156, 89.01820373535156)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(1.06000041961669, 0.79500067234039, 1.20000004768371)
                },
                {
                    target = vector4(-0.45699998736381, 5.78389978408813, 501.4888000488281, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(-1.05879998207092, 5.82929992675781, 500.9338073730469),
                                player = vector4(-0.8726999759674, 5.79190015792846, 498.5768127441406, 82.4656982421875)
                            },
                            billType = 'water',
                            waterUsage = 120000,
                            type = 'shower',
                            timeUsage = 10000
                        }
                    },
                    targetSize = vector3(2.09000158309936, 1.5, 3.41503167152404)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_officebig.png'},
        },
    
        ['stashhouse_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Stash House',
            model = 'stashhouse_shell',
            rooms = 3,
            
            doors = vector4(21.6266, -0.3474, 496.9241, 88.1805),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/stashhouse_shell.png'},
        },
    
        ['shell_warehouse2'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Warehouse 2',
            model = 'shell_warehouse2',
            rooms = 1,
            
            doors = vector4(12.456, 0.1663, 496.9355, 102.2598),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_warehouse2.png'},
        },
    
        ['shell_warehouse3'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Warehouse 3',
            model = 'shell_warehouse3',
            rooms = 0,
            
            doors = vector4(2.6057, -1.5809, 498.0482, 94.8552),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_warehouse3.png'},
        },
    
        ['default_housing4_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Default Housing 4',
            model = 'default_housing4_k4mb1',
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
    
        ['deluxe_housing1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Deluxe Housing 1',
            model = 'deluxe_housing1_k4mb1',
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
    
        ['deluxe_housing2_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Deluxe Housing 2',
            model = 'deluxe_housing2_k4mb1',
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
    
        ['deluxe_housing3_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Deluxe Housing 3',
            model = 'deluxe_housing3_k4mb1',
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
    
        ['medium_housing1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Medium Housing 1',
            model = 'medium_housing1_k4mb1',
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
    
        ['medium_housing2_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Medium Housing 2',
            model = 'medium_housing2_k4mb1',
            rooms = 0,
            
            doors = vector4(6.0465, 0.281, 498.3337, 357.7201),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/medium_housing2_k4mb1.png'},
        },
    
        ['medium_housing3_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Medium Housing 3',
            model = 'medium_housing3_k4mb1',
            rooms = 0,
            
            doors = vector4(5.8908, -1.6523, 500.1836, 89.3483),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/medium_housing3_k4mb1.png'},
        },
    
        ['modern_housing1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Modern Housing 1',
            model = 'modern_housing1_k4mb1',
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
    
        ['modern_housing2_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Modern Housing 2',
            model = 'modern_housing2_k4mb1',
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
    
        ['modern_housing3_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Modern Housing 3',
            model = 'modern_housing3_k4mb1',
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
    
        ['vinewood_housing2_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Vinewood Housing 2',
            model = 'vinewood_housing2_k4mb1',
            rooms = 0,
            
            doors = vector4(1.6315, 5.0588, 500.7053, 178.6031),
    
            interactable = {
                {
                    target = vector4(-1.06229996681213, 0.69889998435974, 501.7666015625, 0),
                    targetSize = vector3(1.15500032901763, 1.52999997138977, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-1.81770002841949, 0.79519999027252, 500.2161865234375, 267.8995056152344),
                                particles = vector3(-1.01059997081756, 0.66809999942779, 501.4961853027344)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.78039997816085, 8.5773000717163, 497.12750244140625, 0),
                    targetSize = vector3(0.68000078201293, 0.78500068187713, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.40419995784759, 8.54819965362548, 495.8348083496094, 93.24949645996094),
                                particles = vector3(0.75089997053146, 8.59329986572265, 496.83489990234375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.75150001049041, 10.03139972686767, 497.12750244140625, 0),
                    targetSize = vector3(0.73500072956085, 0.81000065803527, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.39230000972747, 10.00720024108886, 495.8348083496094, 92.46900177001952),
                                particles = vector3(0.75209999084472, 10.01539993286132, 496.83489990234375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(4.7810001373291, 8.1274995803833, 498.1741027832031, 0),
                    targetSize = vector3(1.3950001001358, 2.09000158309936, 2.99002194404602),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(4.85519981384277, 7.61339998245239, 495.8746032714844, 161.7550048828125),
                                particles = vector3(4.79589986801147, 7.55709981918335, 498.2341918945313)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/vinewood_housing2_k4mb1.png'},
        },
    
        ['vinewood_housing3_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Vinewood Housing 3',
            model = 'vinewood_housing3_k4mb1',
            rooms = 0,
            
            doors = vector4(3.3479, 7.0288, 496.6708, 182.3283),
    
            interactable = {
                {
                    target = vector4(-4.33610010147094, -6.99380016326904, 498.2742004394531, 0),
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-3.53889989852905, -7.11679983139038, 496.7213134765625, 91.06120300292967),
                                particles = vector3(-4.39769983291626, -7.04269981384277, 498.0011901855469)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-2.83500003814697, -0.82779997587203, 501.4031066894531, 0),
                    targetSize = vector3(1.03000044822692, 0.9200005531311, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-2.84680008888244, -1.54180002212524, 500.06390380859375, 0.92690002918243),
                                particles = vector3(-2.82739996910095, -0.87279999256134, 501.0640869140625)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-4.2519998550415, -0.88200002908706, 501.4031066894531, 0),
                    targetSize = vector3(0.71000075340271, 0.91000056266784, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-4.3257999420166, -1.50880002975463, 500.0639953613281, 357.9248962402344),
                                particles = vector3(-4.25, -0.87699997425079, 501.0640869140625)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/vinewood_housing3_k4mb1.png'},
        },
    
        ['luxury_housing1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Luxury Housing 1',
            model = 'luxury_housing1_k4mb1',
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/luxury_housing1_k4mb1.png'},
        },
    
        ['luxury_housing2_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Luxury Housing 2',
            model = 'luxury_housing2_k4mb1',
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/luxury_housing2_k4mb1.png'},
        },
    
        ['luxury_housing3_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Luxury Housing 3',
            model = 'luxury_housing3_k4mb1',
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
            model = 'luxury_housing4_k4mb1',
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
    
        ['manor_housing1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Manor Housing 1',
            model = 'manor_housing1_k4mb1',
            rooms = 0,
            
            doors = vector4(6.9688, -9.0966, 494.0295, 2.3698),
    
            interactable = {
                {
                    target = vector4(15.87810039520263, 16.02359962463379, 500.6579895019531, 0),
                    targetSize = vector3(1.55999994277954, 1.15500032901763, 2.89001965522766),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(15.92430019378662, 15.87759971618652, 497.8127136230469, 338.7773132324219),
                                particles = vector3(15.88899993896484, 15.93589973449707, 500.2720031738281)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(17.56850051879882, 16.25139999389648, 499.4129943847656, 358),
                    targetSize = vector3(0.86000061035156, 0.71000075340271, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(17.4557991027832, 15.50100040435791, 497.8127136230469, 2.51830005645751),
                                particles = vector3(17.51969909667968, 16.17329978942871, 499.3125)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(18.66360092163086, 16.39200019836425, 499.4129943847656, 0),
                    targetSize = vector3(1.11500036716461, 1.08500039577484, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(18.49920082092285, 15.68809986114502, 497.8127136230469, 2.1003999710083),
                                particles = vector3(18.60470008850097, 16.18099975585937, 499.3125915527344)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-0.62379997968673, -0.56239998340606, 500.2030029296875, 0),
                    targetSize = vector3(1.57499992847442, 1.38000011444091, 2.38000798225402),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-0.6948999762535, -0.65340000391006, 497.8127136230469, 298.5826110839844),
                                particles = vector3(-0.63090002536773, -0.71969997882843, 500.2720031738281)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(3.26449990272521, -1.23000001907348, 499.26611328125, 0),
                    targetSize = vector3(0.7800006866455, 1.26500022411346, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(2.58299994468688, -1.33270001411437, 497.8125915527344, 272.2049865722656),
                                particles = vector3(3.21760010719299, -1.32009994983673, 499.30609130859375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(3.27449989318847, -2.43600010871887, 499.26611328125, 0),
                    targetSize = vector3(0.80000066757202, 1.10000038146972, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(2.5848000049591, -2.33999991416931, 497.8127136230469, 271.3030090332031),
                                particles = vector3(3.20689988136291, -2.40729999542236, 499.306884765625)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-16.26199913024902, -0.36550000309944, 495.4289855957031, 0),
                    targetSize = vector3(0.83000063896179, 1.11500036716461, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-16.95549964904785, -0.19449999928474, 494.029296875, 272.9964904785156),
                                particles = vector3(-16.1245002746582, -0.18400000035762, 495.1694030761719)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/manor_housing1_k4mb1.png'},
        },
    
        ['safehouse_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Safe House',
            model = 'safehouse_k4mb1',
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
    
        ['warehouse_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Warehouse',
            model = 'warehouse_k4mb1',
            rooms = 0,
            
            doors = vector4(-13.8037, -0.1838, 497.0333, 271.1431),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/warehouse_k4mb1.png'},
        },
    
        ['k4mb1_acid_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Acid',
            model = 'k4mb1_acid_shell',
            rooms = 0,
            
            doors = vector4(-2.6196, 1.849, 499.7511, 177.7259),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_acid_shell.png'},
        },
    
        ['k4mb1_acid2_shell'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Acid 2',
            model = 'k4mb1_acid2_shell',
            rooms = 0,
            
            doors = vector4(-2.6281, 1.8397, 499.751, 174.6233),
    
            interactable = {
                {
                    target = vector4(-1.16190004348754, 1.86510002613067, 501.14801025390625, 0),
                    targetSize = vector3(0.96000051498413, 0.94000053405761, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-1.10790002346038, 1.18560004234313, 499.9346923828125, 359.3485107421875),
                                particles = vector3(-1.12999999523162, 1.7529000043869, 500.9948120117188)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_acid2_shell.png'},
        },
    
        ['k4mb1_apa1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Apa 1',
            model = 'k4mb1_apa1_shell',
            rooms = 0,
            
            doors = vector4(-20.8124, -2.5062, 500.7954, 269.8819),
    
            interactable = {
                {
                    target = vector4(-3.18630003929138, -6.6466999053955, 501.7506103515625, 0),
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-3.10080003738403, -5.8636999130249, 500.19439697265625, 179.65280151367188),
                                particles = vector3(-3.15960001945495, -6.66050004959106, 501.494384765625)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-3.22350001335144, 17.01440048217773, 504.9516906738281, 0),
                    targetSize = vector3(0.65500080585479, 0.81000065803527, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-2.63199996948242, 17.0398998260498, 503.59429931640625, 93.75370025634766),
                                particles = vector3(-3.26500010490417, 17.03720092773437, 504.6142883300781)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-3.24519991874694, 18.47920036315918, 504.9516906738281, 0),
                    targetSize = vector3(0.70500075817108, 0.75500071048736, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-2.61339998245239, 18.43180084228515, 503.59429931640625, 88.24759674072266),
                                particles = vector3(-3.26679992675781, 18.46339988708496, 504.5943908691406)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.76190000772476, 16.56100082397461, 506.1170043945313, 0),
                    targetSize = vector3(1.40500009059906, 2.0450005531311, 2.55001187324523),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(0.78860002756118, 16.13990020751953, 503.6373901367188, 192.96009826660156),
                                particles = vector3(0.76440000534057, 16.0044002532959, 505.99371337890625)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_apa1_shell.png'},
        },
    
        ['k4mb1_apa2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Apa 2',
            model = 'k4mb1_apa2_shell',
            rooms = 0,
            
            doors = vector4(-20.8124, -2.5062, 500.7954, 269.8819),
    
            interactable = {
                {
                    target = vector4(-3.18630003929138, -6.6466999053955, 501.7506103515625, 0),
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-3.10080003738403, -5.8636999130249, 500.19439697265625, 179.65280151367188),
                                particles = vector3(-3.15960001945495, -6.66050004959106, 501.494384765625)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-3.22350001335144, 17.01440048217773, 504.9516906738281, 0),
                    targetSize = vector3(0.65500080585479, 0.81000065803527, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-2.63199996948242, 17.0398998260498, 503.59429931640625, 93.75370025634766),
                                particles = vector3(-3.26500010490417, 17.03720092773437, 504.6142883300781)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-3.24519991874694, 18.47920036315918, 504.9516906738281, 0),
                    targetSize = vector3(0.70500075817108, 0.75500071048736, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-2.61339998245239, 18.43180084228515, 503.59429931640625, 88.24759674072266),
                                particles = vector3(-3.26679992675781, 18.46339988708496, 504.5943908691406)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.76190000772476, 16.56100082397461, 506.1170043945313, 0),
                    targetSize = vector3(1.40500009059906, 2.0450005531311, 2.55001187324523),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(0.78860002756118, 16.13990020751953, 503.6373901367188, 192.96009826660156),
                                particles = vector3(0.76440000534057, 16.0044002532959, 505.99371337890625)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_apa2_shell.png'},
        },
    
        ['k4mb1_apa3_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Apa 3',
            model = 'k4mb1_apa3_shell',
            rooms = 0,
            
            doors = vector4(-20.8124, -2.5062, 500.7954, 269.8819),
    
            interactable = {
                {
                    target = vector4(-3.18630003929138, -6.6466999053955, 501.7506103515625, 0),
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-3.10080003738403, -5.8636999130249, 500.19439697265625, 179.65280151367188),
                                particles = vector3(-3.15960001945495, -6.66050004959106, 501.494384765625)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-3.22350001335144, 17.01440048217773, 504.9516906738281, 0),
                    targetSize = vector3(0.65500080585479, 0.81000065803527, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-2.63199996948242, 17.0398998260498, 503.59429931640625, 93.75370025634766),
                                particles = vector3(-3.26500010490417, 17.03720092773437, 504.6142883300781)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-3.24519991874694, 18.47920036315918, 504.9516906738281, 0),
                    targetSize = vector3(0.70500075817108, 0.75500071048736, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-2.61339998245239, 18.43180084228515, 503.59429931640625, 88.24759674072266),
                                particles = vector3(-3.26679992675781, 18.46339988708496, 504.5943908691406)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.76190000772476, 16.56100082397461, 506.1170043945313, 0),
                    targetSize = vector3(1.40500009059906, 2.0450005531311, 2.55001187324523),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(0.78860002756118, 16.13990020751953, 503.6373901367188, 192.96009826660156),
                                particles = vector3(0.76440000534057, 16.0044002532959, 505.99371337890625)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_apa3_shell.png'},
        },
    
        ['k4mb1_biker1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Biker 1',
            model = 'k4mb1_biker1_shell',
            rooms = 0,
            
            doors = vector4(7.6209, -11.1893, 499.2495, 359.7387),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_biker1_shell.png'},
        },
    
        ['k4mb1_biker2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Biker 2',
            model = 'k4mb1_biker2_shell',
            rooms = 0,
            
            doors = vector4(-9.0398, -8.4413, 499.9975, 269.2645),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_biker2_shell.png'},
        },
    
        ['k4mb1_classic4_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Classic 4',
            model = 'k4mb1_classic4_shell',
            rooms = 0,
            
            doors = vector4(4.797, -2.181, 495.611, 87.2927),
    
            interactable = {
                {
                    target = vector4(-0.79600000381469, -1.06700003147125, 497.2502136230469, 0),
                    targetSize = vector3(1.19500029087066, 1.26500022411346, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-0.93819999694824, -0.21040000021457, 495.61090087890625, 188.64370727539065),
                                particles = vector3(-0.88899999856948, -1.14579999446868, 497.0508117675781)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.44710001349449, 3.37960004806518, 500.36041259765625, 0),
                    targetSize = vector3(0.72000074386596, 0.77500069141387, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.00639998912811, 3.37199997901916, 498.95849609375, 92.8686981201172),
                                particles = vector3(0.40049999952316, 3.40440011024475, 500.0386047363281)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.49340000748634, 4.81689977645874, 500.36041259765625, 0),
                    targetSize = vector3(0.83000063896179, 0.7800006866455, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.00269997119903, 4.83260011672973, 498.95849609375, 95.49169921875),
                                particles = vector3(0.40450000762939, 4.82719993591308, 500.0185852050781)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(4.29090023040771, 2.98320007324218, 501.3934020996094, 2),
                    targetSize = vector3(1.47000002861022, 1.28000020980834, 2.46000981330871),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(4.45819997787475, 2.85159993171691, 498.95849609375, 159.9131011962891),
                                particles = vector3(4.34700012207031, 2.79480004310607, 501.197998046875)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_classic4_shell.png'},
        },
    
        ['k4mb1_classic5_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Classic 5',
            model = 'k4mb1_classic5_shell',
            rooms = 0,
            
            doors = vector4(4.797, -2.181, 495.611, 87.2927),
    
            interactable = {
                {
                    target = vector4(-0.79600000381469, -1.06700003147125, 497.2502136230469, 0),
                    targetSize = vector3(1.19500029087066, 1.26500022411346, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-0.93819999694824, -0.21040000021457, 495.61090087890625, 188.64370727539065),
                                particles = vector3(-0.88899999856948, -1.14579999446868, 497.0508117675781)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.44710001349449, 3.37960004806518, 500.36041259765625, 0),
                    targetSize = vector3(0.72000074386596, 0.77500069141387, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.00639998912811, 3.37199997901916, 498.95849609375, 92.8686981201172),
                                particles = vector3(0.40049999952316, 3.40440011024475, 500.0386047363281)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.49340000748634, 4.81689977645874, 500.36041259765625, 0),
                    targetSize = vector3(0.83000063896179, 0.7800006866455, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.00269997119903, 4.83260011672973, 498.95849609375, 95.49169921875),
                                particles = vector3(0.40450000762939, 4.82719993591308, 500.0185852050781)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(4.29090023040771, 2.98320007324218, 501.3934020996094, 2),
                    targetSize = vector3(1.47000002861022, 1.28000020980834, 2.46000981330871),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(4.45819997787475, 2.85159993171691, 498.95849609375, 159.9131011962891),
                                particles = vector3(4.34700012207031, 2.79480004310607, 501.197998046875)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_classic5_shell.png'},
        },
    
        ['k4mb1_classic6_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Classic 6',
            model = 'k4mb1_classic6_shell',
            rooms = 0,
            
            doors = vector4(4.797, -2.181, 495.611, 87.2927),
    
            interactable = {
                {
                    target = vector4(-0.79600000381469, -1.06700003147125, 497.2502136230469, 0),
                    targetSize = vector3(1.19500029087066, 1.26500022411346, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-0.93819999694824, -0.21040000021457, 495.61090087890625, 188.64370727539065),
                                particles = vector3(-0.88899999856948, -1.14579999446868, 497.0508117675781)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.44710001349449, 3.37960004806518, 500.36041259765625, 0),
                    targetSize = vector3(0.72000074386596, 0.77500069141387, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.00639998912811, 3.37199997901916, 498.95849609375, 92.8686981201172),
                                particles = vector3(0.40049999952316, 3.40440011024475, 500.0386047363281)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.49340000748634, 4.81689977645874, 500.36041259765625, 0),
                    targetSize = vector3(0.83000063896179, 0.7800006866455, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.00269997119903, 4.83260011672973, 498.95849609375, 95.49169921875),
                                particles = vector3(0.40450000762939, 4.82719993591308, 500.0185852050781)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(4.29090023040771, 2.98320007324218, 501.3934020996094, 2),
                    targetSize = vector3(1.47000002861022, 1.28000020980834, 2.46000981330871),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(4.45819997787475, 2.85159993171691, 498.95849609375, 159.9131011962891),
                                particles = vector3(4.34700012207031, 2.79480004310607, 501.197998046875)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_classic6_shell.png'},
        },
        
        ['classichouse_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Classic House 1',
            model = 'classichouse_shell',
            rooms = 0,
            
            doors = vector4(4.7695, -2.1271, 495.615, 89.4723),
    
            interactable = {
                {
                    target = vector4(-0.75950002670288, -0.52640002965927, 497.1517028808594, 0),
                    targetSize = vector3(1.08500039577484, 0.94500052928924, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-0.78869998455047, -0.22990000247955, 495.6148986816406, 181.4904022216797),
                                particles = vector3(-0.88650000095367, -1.14670002460479, 497.0549011230469)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.75, 4.85550022125244, 500.4537048339844, 0),
                    targetSize = vector3(0.90000057220458, 1.01500046253204, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.04929995536804, 4.71789979934692, 499.0280151367188, 74.88610076904297),
                                particles = vector3(0.404599994421, 4.83209991455078, 500.0281066894531)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.75, 3.43009996414184, 500.4389953613281, 0),
                    targetSize = vector3(0.67500078678131, 0.87000060081481, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.12530004978179, 3.34680008888244, 499.0280151367188, 87.35910034179688),
                                particles = vector3(0.40779998898506, 3.40450000762939, 500.0281066894531)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(4.31169986724853, 2.98740005493164, 501.8758850097656, 0),
                    targetSize = vector3(1.49500000476837, 1.28500020503997, 2.89501976966857),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(4.33750009536743, 3.06360006332397, 499.0280151367188, 163.27439880371097),
                                particles = vector3(4.29460000991821, 3.02839994430542, 501.3872985839844)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/classichouse_shell.png'},
        },
    
        ['classichouse2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Classic House 2',
            model = 'classichouse2_shell',
            rooms = 0,
            
            doors = vector4(4.7695, -2.1271, 495.615, 89.4723),
    
            interactable = {
                {
                    target = vector4(-0.75950002670288, -0.52640002965927, 497.1517028808594, 0),
                    targetSize = vector3(1.08500039577484, 0.94500052928924, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-0.78869998455047, -0.22990000247955, 495.6148986816406, 181.4904022216797),
                                particles = vector3(-0.88650000095367, -1.14670002460479, 497.0549011230469)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.75, 4.85550022125244, 500.4537048339844, 0),
                    targetSize = vector3(0.90000057220458, 1.01500046253204, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.04929995536804, 4.71789979934692, 499.0280151367188, 74.88610076904297),
                                particles = vector3(0.404599994421, 4.83209991455078, 500.0281066894531)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.75, 3.43009996414184, 500.4389953613281, 0),
                    targetSize = vector3(0.67500078678131, 0.87000060081481, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.12530004978179, 3.34680008888244, 499.0280151367188, 87.35910034179688),
                                particles = vector3(0.40779998898506, 3.40450000762939, 500.0281066894531)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(4.31169986724853, 2.98740005493164, 501.8758850097656, 0),
                    targetSize = vector3(1.49500000476837, 1.28500020503997, 2.89501976966857),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(4.33750009536743, 3.06360006332397, 499.0280151367188, 163.27439880371097),
                                particles = vector3(4.29460000991821, 3.02839994430542, 501.3872985839844)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/classichouse2_shell.png'},
        },
    
        ['classichouse3_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Classic House 3',
            model = 'classichouse3_shell',
            rooms = 0,
            
            doors = vector4(4.7695, -2.1271, 495.615, 89.4723),
    
            interactable = {
                {
                    target = vector4(-0.75950002670288, -0.52640002965927, 497.1517028808594, 0),
                    targetSize = vector3(1.08500039577484, 0.94500052928924, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-0.78869998455047, -0.22990000247955, 495.6148986816406, 181.4904022216797),
                                particles = vector3(-0.88650000095367, -1.14670002460479, 497.0549011230469)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.75, 4.85550022125244, 500.4537048339844, 0),
                    targetSize = vector3(0.90000057220458, 1.01500046253204, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.04929995536804, 4.71789979934692, 499.0280151367188, 74.88610076904297),
                                particles = vector3(0.404599994421, 4.83209991455078, 500.0281066894531)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(0.75, 3.43009996414184, 500.4389953613281, 0),
                    targetSize = vector3(0.67500078678131, 0.87000060081481, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.12530004978179, 3.34680008888244, 499.0280151367188, 87.35910034179688),
                                particles = vector3(0.40779998898506, 3.40450000762939, 500.0281066894531)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(4.31169986724853, 2.98740005493164, 501.8758850097656, 0),
                    targetSize = vector3(1.49500000476837, 1.28500020503997, 2.89501976966857),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(4.33750009536743, 3.06360006332397, 499.0280151367188, 163.27439880371097),
                                particles = vector3(4.29460000991821, 3.02839994430542, 501.3872985839844)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/classichouse3_shell.png'},
        },
    
        ['k4mb1_drug_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Drug',
            model = 'k4mb1_drug_shell',
            rooms = 0,
            
            doors = vector4(11.0257, 2.0197, 497.1259, 91.5861),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_drug_shell.png'},
        },
    
        ['k4mb1_loft1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Loft 1',
            model = 'k4mb1_loft1_shell',
            rooms = 0,
            
            doors = vector4(6.7655, -2.9909, 499.9945, 87.0819),
    
            interactable = {
                {
                    target = vector4(-2.99099993705749, -0.50150001049041, 501.3467102050781, 0),
                    targetSize = vector3(0.60500085353851, 0.58500087261199, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-2.42829990386962, -0.53320002555847, 499.99468994140625, 100.6312026977539),
                                particles = vector3(-2.99049997329711, -0.68870002031326, 501.1546936035156)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-6.36999988555908, -3.00329995155334, 502.572509765625, 0),
                    targetSize = vector3(1.64499986171722, 2.13500261306762, 2.66001439094543),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-6.3681001663208, -2.62940001487731, 500.0379943847656, 347.2366943359375),
                                particles = vector3(-6.35340023040771, -2.4086000919342, 502.39410400390625)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-3.88450002670288, 0.76859998703002, 501.1322021484375, 0),
                    targetSize = vector3(0.83000063896179, 0.80000066757202, 0.83000040054321),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-4.49749994277954, 0.79409998655319, 499.9955139160156, 269.9872131347656),
                                particles = vector3(-3.82529997825622, 0.78250002861022, 500.8157043457031)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-3.84800004959106, -0.62430000305175, 501.3171997070313, 0),
                    targetSize = vector3(0.69000077247619, 0.79000067710876, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-4.44859981536865, -0.61440002918243, 499.9955139160156, 272.8841857910156),
                                particles = vector3(-3.81520009040832, -0.63959997892379, 500.8157043457031)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_loft1_shell.png'},
        },
    
        ['k4mb1_loft2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Loft 2',
            model = 'k4mb1_loft2_shell',
            rooms = 0,
            
            doors = vector4(8.6622, 1.0343, 499.9947, 87.9078),
    
            interactable = {
                {
                    target = vector4(8.60280036926269, -1.69959998130798, 501.1684875488281, 0),
                    targetSize = vector3(0.81000065803527, 1.00500047206878, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(7.96420001983642, -1.74300003051757, 499.9948120117188, 275.59271240234375),
                                particles = vector3(8.61190032958984, -1.68019998073577, 500.8349914550781)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(4.96960020065307, -0.84340000152587, 502.5226135253906, 0),
                    targetSize = vector3(1.38500010967254, 1.82999968528747, 2.56001210212707),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(4.89330005645751, -0.454499989748, 500.0380859375, 326.7052917480469),
                                particles = vector3(4.97569990158081, -0.38499999046325, 502.4140930175781)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(2.90260004997253, -0.41749998927116, 501.5791931152344, 0),
                    targetSize = vector3(0.67500078678131, 0.62000083923339, 1.26499998569488),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(2.33780002593994, -0.33120000362396, 499.99560546875, 271.06878662109375),
                                particles = vector3(2.89050006866455, -0.25380000472068, 501.1556091308594)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_loft2_shell.png'},
        },
    
        ['k4mb1_loft3_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Loft 3',
            model = 'k4mb1_loft3_shell',
            rooms = 0,
            
            doors = vector4(5.8267, -0.2893, 499.9955, 93.8948),
    
            interactable = {
                {
                    target = vector4(-5.67439985275268, 0.65869998931884, 501.560791015625, 0),
                    targetSize = vector3(0.82500064373016, 0.78500068187713, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-5.08669996261596, 0.55540001392364, 499.9955139160156, 89.91390228271484),
                                particles = vector3(-5.70139980316162, 0.4578999876976, 501.1755981445313)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-4.67959976196289, -1.59099996089935, 501.3387145996094, 0),
                    targetSize = vector3(0.68500077724456, 0.75000071525573, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-4.74149990081787, -2.24379992485046, 499.9955139160156, 356.6271057128906),
                                particles = vector3(-4.69519996643066, -1.5329999923706, 501.05560302734375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-3.23410010337829, -1.56319999694824, 501.3387145996094, 0),
                    targetSize = vector3(0.75500071048736, 0.74000072479248, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-3.26209998130798, -2.15310001373291, 499.9955139160156, 0.70480000972747),
                                particles = vector3(-3.26869988441467, -1.53149998188018, 501.05560302734375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_loft3_shell.png'},
        },
    
        ['k4mb1_motel1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Motel 1',
            model = 'k4mb1_motel1_shell',
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_motel1_shell.png'},
        },
    
        ['k4mb1_motel2_shell'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Motel 2',
            model = 'k4mb1_motel2_shell',
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
    
        ['k4mb1_trap_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Trap',
            model = 'k4mb1_trap_shell',
            rooms = 0,
            
            doors = vector4(-7.1435, -1.3721, 498.7477, 175.361),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_trap_shell.png'},
        },
    
        ['k4mb1_trap2_shell'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Trap 2',
            model = 'k4mb1_trap2_shell',
            rooms = 0,
            
            doors = vector4(-7.1435, -1.3721, 498.7477, 175.361),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_trap2_shell.png'},
        },
    
        ['k4mb1_basement1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Basement 1',
            model = 'k4mb1_basement1_shell',
            rooms = 0,
            
            doors = vector4(-4.3524, -4.8339, 500.5969, 93.0709),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_basement1_shell.png'},
        },
    
        ['k4mb1_basement2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Basement 2',
            model = 'k4mb1_basement2_shell',
            rooms = 0,
            
            doors = vector4(-4.3524, -4.8339, 500.5969, 93.0709),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_basement2_shell.png'},
        },
    
        ['k4mb1_basement3_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Basement 3',
            model = 'k4mb1_basement3_shell',
            rooms = 0,
            
            doors = vector4(-4.3524, -4.8339, 500.5969, 93.0709),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_basement3_shell.png'},
        },
    
        ['k4mb1_basement4_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Basement 4',
            model = 'k4mb1_basement4_shell',
            rooms = 0,
            
            doors = vector4(-4.3524, -4.8339, 500.5969, 93.0709),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_basement4_shell.png'},
        },
    
        ['k4mb1_basement5_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Basement 5',
            model = 'k4mb1_basement5_shell',
            rooms = 0,
            
            doors = vector4(-4.3524, -4.8339, 500.5969, 93.0709),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_basement5_shell.png'},
        },
    
        ['k4mb1_casinohotel_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Casino Hotel',
            model = 'k4mb1_casinohotel_shell',
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
    
        ['k4mb1_house1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'House 1',
            model = 'k4mb1_house1_shell',
            rooms = 0,
            
            doors = vector4(-2.9715, -4.7427, 498.5334, 351.5655),
    
            interactable = {
                {
                    target = vector4(-2.45950007438659, 5.67010021209716, 499.82720947265625, 0),
                    targetSize = vector3(1.22500026226043, 0.93500053882598, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-2.51810002326965, 4.95749998092651, 498.5335083007813, 358.6484985351563),
                                particles = vector3(-2.5064001083374, 5.62589979171752, 499.5935974121094)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-4.62160015106201, 5.67869997024536, 503.0086059570313, 0),
                    targetSize = vector3(1.1850003004074, 0.80000066757202, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-4.65980005264282, 5.17290019989013, 501.276611328125, 3.28369998931884),
                                particles = vector3(-4.65549993515014, 5.67829990386962, 502.5564880371094)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-2.44470000267028, 4.69439983367919, 503.64990234375, 0),
                    targetSize = vector3(1.21500027179718, 2.46501016616821, 2.19000363349914),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-2.34220004081726, 5.28280019760131, 501.5494995117188, 290.3702087402344),
                                particles = vector3(-2.06139993667602, 5.37879991531372, 503.6950988769531)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_house1_shell.png'},
        },
    
        ['k4mb1_house2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'House 2',
            model = 'k4mb1_house2_shell',
            rooms = 0,
            
            doors = vector4(-8.8584, 1.1103, 495.8178, 265.1221),
    
            interactable = {
                {
                    target = vector4(2.40140008926391, -4.66540002822876, 497.3870849609375, 0),
                    targetSize = vector3(0.96000051498413, 1.57499992847442, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(3.20880007743835, -4.21589994430542, 495.8179931640625, 91.4447021484375),
                                particles = vector3(2.34590005874633, -4.2237000465393, 496.99798583984375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-2.77679991722106, -6.02540016174316, 501.78228759765625, 0),
                    targetSize = vector3(0.85500061511993, 0.83000063896179, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-2.11899995803833, -6.07870006561279, 500.1062927246094, 92.27410125732422),
                                particles = vector3(-2.69720005989074, -6.04699993133544, 501.5661926269531)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-2.77629995346069, -5.00649976730346, 501.78228759765625, 0),
                    targetSize = vector3(0.86500060558319, 0.89500057697296, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-2.1366000175476, -5.01510000228881, 500.1062927246094, 91.73809814453124),
                                particles = vector3(-2.69980001449584, -4.99650001525878, 501.5661926269531)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(3.4416000843048, -1.20850002765655, 501.78228759765625, 0),
                    targetSize = vector3(0.86000061035156, 0.87000060081481, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(3.51640009880065, -0.57190001010894, 500.1062927246094, 182.1042022705078),
                                particles = vector3(3.45210003852844, -1.14240002632141, 501.5661926269531)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(2.39079999923706, -1.18850004673004, 501.78228759765625, 0),
                    targetSize = vector3(0.87000060081481, 0.87000060081481, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(2.47009992599487, -0.57230001688003, 500.1062927246094, 179.43569946289065),
                                particles = vector3(2.40580010414123, -1.14199995994567, 501.5661926269531)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(5.04269981384277, -1.01180005073547, 502.5466003417969, 0),
                    targetSize = vector3(1.54499995708465, 1.23000025749206, 2.47001004219055),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(5.12989997863769, -0.90270000696182, 500.1062927246094, 175.1302032470703),
                                particles = vector3(5.04829978942871, -0.93180000782012, 502.4856872558594)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-8.76119995117187, 3.10689997673034, 501.9822998046875, 0),
                    targetSize = vector3(0.76000070571899, 0.91000056266784, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-8.01939964294433, 3.05900001525878, 500.10650634765625, 95.97360229492188),
                                particles = vector3(-8.72630023956298, 3.10339999198913, 501.5661010742188)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-8.76560020446777, 2.0841999053955, 501.9323120117188, 0),
                    targetSize = vector3(0.79500067234039, 0.86000061035156, 1.10000014305114),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-8.20020008087158, 2.01200008392334, 500.10650634765625, 95.4175033569336),
                                particles = vector3(-8.72109985351562, 2.05410003662109, 501.5663146972656)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_house2_shell.png'},
        },
    
        ['k4mb1_house3_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'House 3',
            model = 'k4mb1_house3_shell',
            rooms = 0,
            
            doors = vector4(9.0011, -7.8507, 496.2062, 356.7937),
    
            interactable = {
                {
                    target = vector4(1.41429996490478, -4.5233998298645, 500.8572082519531, 0),
                    targetSize = vector3(0.75500071048736, 0.87000060081481, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(0.77579998970031, -4.48250007629394, 499.51568603515625, 272.1624145507813),
                                particles = vector3(1.41960000991821, -4.50610017776489, 500.5158081054688)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(1.3976000547409, -5.93359994888305, 500.8572082519531, 0),
                    targetSize = vector3(0.75000071525573, 0.86500060558319, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(0.78780001401901, -5.88619995117187, 499.51568603515625, 272.8996887207031),
                                particles = vector3(1.43050003051757, -5.93429994583129, 500.5158081054688)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_house3_shell.png'},
        },
    
        ['k4mb1_house4_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'House 4',
            model = 'k4mb1_house4_shell',
            rooms = 0,
            
            doors = vector4(-2.1196, -2.9156, 497.0076, 1.5431),
    
            interactable = {
                {
                    target = vector4(-0.91109997034072, 4.20660018920898, 498.5625915527344, 0),
                    targetSize = vector3(0.96000051498413, 0.76000070571899, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-0.97939997911453, 4.87909984588623, 497.0076904296875, 181.3612060546875),
                                particles = vector3(-1.00179994106292, 4.14799976348876, 498.0078125)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_house4_shell.png'},
        },
    
        ['k4mb1_furnishedoffice1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Furnished Office 1',
            model = 'k4mb1_furnishedoffice1_shell',
            rooms = 0,
            
            doors = vector4(3.7266, -2.0206, 498.0762, 90.4983),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_furnishedoffice1_shell.png'},
        },
    
        ['k4mb1_furnishedoffice2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Furnished Office 2',
            model = 'k4mb1_furnishedoffice2_shell',
            rooms = 0,
            
            doors = vector4(4.3583, 3.92, 498.2487, 185.8252),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_furnishedoffice2_shell.png'},
        },
    
        ['k4mb1_furnishedoffice3_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Furnished Office 3',
            model = 'k4mb1_furnishedoffice3_shell',
            rooms = 0,
            
            doors = vector4(-0.2388, 5.8427, 498.2997, 89.1062),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_furnishedoffice3_shell.png'},
        },
    
        ['k4mb1_furnishedoffice4_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Furnished Office 4',
            model = 'k4mb1_furnishedoffice4_shell',
            rooms = 0,
            
            doors = vector4(8.9262, -2.2106, 497.4483, 91.1339),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_furnishedoffice4_shell.png'},
        },
    
        ['k4mb1_hoodhouse1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Hood House 1',
            model = 'k4mb1_hoodhouse1_shell',
            rooms = 0,
            
            doors = vector4(-2.2042, -7.391, 499.9954, 90.4586),
    
            interactable = {
                {
                    target = vector4(0.44760000705718, 7.2039999961853, 501.5257873535156, 0),
                    targetSize = vector3(1.21500027179718, 0.88000059127807, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(0.63459998369216, 6.59520006179809, 500.00299072265625, 2.64549994468688),
                                particles = vector3(0.49110001325607, 7.27899980545043, 501.2030029296875)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(2.97810006141662, 7.11059999465942, 502.2373046875, 0),
                    targetSize = vector3(2.06500101089477, 1.28500020503997, 2.28500580787658),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(3.37179994583129, 6.99249982833862, 500.0902099609375, 267.1690979003906),
                                particles = vector3(3.44799995422363, 6.87930011749267, 502.3547973632813)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(2.30780005455017, 4.8604998588562, 501.40130615234375, 0),
                    targetSize = vector3(0.73500072956085, 0.90500056743621, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(2.80660009384155, 4.80810022354126, 499.9953918457031, 91.99970245361328),
                                particles = vector3(2.228600025177, 4.84980010986328, 500.95550537109375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_hoodhouse1_shell.png'},
        },
    
        ['k4mb1_laundry_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Laundry',
            model = 'k4mb1_laundry_shell',
            rooms = 0,
            
            doors = vector4(-9.0254, 6.8918, 495.8819, 179.9983),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_laundry_shell.png'},
        },
    
        ['k4mb1_palhouse1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Pal House 1',
            model = 'k4mb1_palhouse1_shell',
            rooms = 0,
            
            doors = vector4(-0.6366, 5.5982, 497.3319, 87.1881),
    
            interactable = {
                {
                    target = vector4(-3.51430010795593, 6.56489992141723, 498.7547912597656, 0),
                    targetSize = vector3(1.26000022888183, 1.09000039100646, 1.0050002336502),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-3.41370010375976, 6.09289979934692, 497.331787109375, 0.72310000658035),
                                particles = vector3(-3.43400001525878, 6.91209983825683, 498.5118103027344)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-3.72819995880126, -4.13320016860961, 499.74810791015625, 2),
                    targetSize = vector3(2.22500467300415, 1.14000034332275, 2.5400116443634),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-3.14190006256103, -4.16949987411499, 497.4736022949219, 254.64410400390625),
                                particles = vector3(-3.01699995994567, -4.30299997329711, 499.4106140136719)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-5.50080013275146, -3.94460010528564, 498.7673950195313, 0),
                    targetSize = vector3(0.68500077724456, 0.69500076770782, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-5.46299982070922, -4.35860013961792, 497.331787109375, 9.37349987030029),
                                particles = vector3(-5.71869993209838, -3.72199988365173, 498.3319091796875)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-6.22529983520507, -2.15009999275207, 502.876708984375, 0),
                    targetSize = vector3(2.20000410079956, 0.99500048160552, 2.42500901222229),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-6.69820022583007, -2.1340000629425, 500.6588134765625, 80.21849822998047),
                                particles = vector3(-6.84899997711181, -1.95829999446868, 502.6164855957031)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-2.86910009384155, -1.12380003929138, 501.7468872070313, 0),
                    targetSize = vector3(0.535001039505, 0.65000081062316, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-3.33229994773864, -1.00160002708435, 500.5177917480469, 269.3241882324219),
                                particles = vector3(-2.72900009155273, -0.90710002183914, 501.5179138183594)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_palhouse1_shell.png'},
        },
    
        ['k4mb1_sandyhouse1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Sandy House 1',
            model = 'k4mb1_sandyhouse1_shell',
            rooms = 0,
            
            doors = vector4(1.6179, -4.9703, 499.0803, 357.5749),
    
            interactable = {
                {
                    target = vector4(3.19720005989074, -1.50750005245208, 500.4075927734375, 0),
                    targetSize = vector3(1.28500020503997, 0.85500061511993, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(3.44689989089965, -2.05329990386962, 499.0810852050781, 15.20110034942627),
                                particles = vector3(3.27990007400512, -1.46990001201629, 500.3211059570313)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-0.56879997253417, 4.56150007247924, 500.2843933105469, 0),
                    targetSize = vector3(0.9550005197525, 0.73000073432922, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-0.59530001878738, 3.95939993858337, 499.0809020996094, 1.03340005874633),
                                particles = vector3(-0.56739997863769, 4.55620002746582, 500.0411071777344)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_sandyhouse1_shell.png'},
        },
    
        ['kambi_emptyhouse1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Empty House 1',
            model = 'kambi_emptyhouse1',
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/kambi_emptyhouse1.png'},
        },
    
        ['kambi_furnishedhouse1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Furnished House 1',
            model = 'kambi_furnishedhouse1',
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
    
        ['highendmotel_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'High-end Motel',
            model = 'highendmotel_shell',
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
    
        ['k4mb1_apartment_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Apartment',
            model = 'k4mb1_apartment_shell',
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
    
        ['k4mb1_banham_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Banham',
            model = 'k4mb1_banham_shell',
            rooms = 0,
            
            doors = vector4(-1.693, -5.1804, 500.0835, 88.5172),
    
            interactable = {
                {
                    target = vector4(-9.85560035705566, -14.38809967041015, 501.3962097167969, 0),
                    targetSize = vector3(0.85500061511993, 0.67000079154968, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-9.19869995117187, -14.37909984588623, 500.08441162109375, 91.71520233154295),
                                particles = vector3(-9.89890003204345, -14.36979961395263, 501.1437072753906)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-6.76100015640258, 0.10740000009536, 501.4953918457031, 0),
                    targetSize = vector3(0.73000073432922, 1.04000043869018, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-7.33129978179931, 0.12870000302791, 500.0840148925781, 269.6351013183594),
                                particles = vector3(-6.60470008850097, 0.12250000238418, 501.0245056152344)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-7.14249992370605, -1.66050004959106, 502.5364990234375, 0),
                    targetSize = vector3(1.64499986171722, 2.22000455856323, 2.50501084327697),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-7.09200000762939, -2.01340007781982, 500.08441162109375, 172.74339294433597),
                                particles = vector3(-7.17239999771118, -2.01889991760253, 502.4833068847656)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-1.31490004062652, -3.27880001068115, 498.0957946777344, 0),
                    targetSize = vector3(0.7450007200241, 0.98000049591064, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-0.73629999160766, -3.28699994087219, 496.6846008300781, 91.35150146484376),
                                particles = vector3(-1.44060003757476, -3.2888000011444, 497.6247863769531)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(2.4779999256134, -4.94789981842041, 499.126708984375, 0),
                    targetSize = vector3(2.39000844955444, 1.94999957084655, 2.4850103855133),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(2.88879990577697, -4.94019985198974, 496.6846008300781, 283.3122863769531),
                                particles = vector3(2.94120001792907, -4.91580009460449, 499.04400634765625)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_banham_shell.png'},
        },
    
        ['k4mb1_banham2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Banham 2',
            model = 'k4mb1_banham2_shell',
            rooms = 0,
            
            doors = vector4(-1.693, -5.1804, 500.0835, 88.5172),
    
            interactable = {
                {
                    target = vector4(-9.85560035705566, -14.38809967041015, 501.3962097167969, 0),
                    targetSize = vector3(0.85500061511993, 0.67000079154968, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-9.19869995117187, -14.37909984588623, 500.08441162109375, 91.71520233154295),
                                particles = vector3(-9.89890003204345, -14.36979961395263, 501.1437072753906)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-6.76100015640258, 0.10740000009536, 501.4953918457031, 0),
                    targetSize = vector3(0.73000073432922, 1.04000043869018, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-7.33129978179931, 0.12870000302791, 500.0840148925781, 269.6351013183594),
                                particles = vector3(-6.60470008850097, 0.12250000238418, 501.0245056152344)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-7.14249992370605, -1.66050004959106, 502.5364990234375, 0),
                    targetSize = vector3(1.64499986171722, 2.22000455856323, 2.50501084327697),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-7.09200000762939, -2.01340007781982, 500.08441162109375, 172.74339294433597),
                                particles = vector3(-7.17239999771118, -2.01889991760253, 502.4833068847656)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-1.31490004062652, -3.27880001068115, 498.0957946777344, 0),
                    targetSize = vector3(0.7450007200241, 0.98000049591064, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-0.73629999160766, -3.28699994087219, 496.6846008300781, 91.35150146484376),
                                particles = vector3(-1.44060003757476, -3.2888000011444, 497.6247863769531)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(2.4779999256134, -4.94789981842041, 499.126708984375, 0),
                    targetSize = vector3(2.39000844955444, 1.94999957084655, 2.4850103855133),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(2.88879990577697, -4.94019985198974, 496.6846008300781, 283.3122863769531),
                                particles = vector3(2.94120001792907, -4.91580009460449, 499.04400634765625)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_banham2_shell.png'},
        },
    
        ['k4mb1_beachhouse_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Beach House',
            model = 'k4mb1_beachhouse_shell',
            rooms = 0,
            
            doors = vector4(-11.3858, 1.9059, 500.1667, 270.1406),
    
            interactable = {
                {
                    target = vector4(4.9257001876831, 17.11459922790527, 501.41839599609375, 0),
                    targetSize = vector3(0.89500057697296, 0.75000071525573, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(4.91109991073608, 17.71430015563965, 499.9668884277344, 183.6949005126953),
                                particles = vector3(4.94239997863769, 16.98559951782226, 500.9670104980469)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(3.99180006980896, 19.2362995147705, 502.8164978027344, 0),
                    targetSize = vector3(1.85999965667724, 1.70999979972839, 2.90001988410949),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(3.93860006332397, 19.31979942321777, 499.9668884277344, 310.16650390625),
                                particles = vector3(3.97350001335144, 19.31139945983886, 502.4461975097656)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-7.46290016174316, -7.73320007324218, 501.5165100097656, 0),
                    targetSize = vector3(0.64500081539154, 1.01500046253204, 1.35999989509582),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-7.94000005722045, -7.96619987487793, 500.1668090820313, 271.110107421875),
                                particles = vector3(-7.1434998512268, -7.96950006484985, 501.1868896484375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-1.3532999753952, -7.96640014648437, 501.41900634765625, 0),
                    targetSize = vector3(0.72500073909759, 1.01000046730041, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-0.7820000052452, -7.93109989166259, 500.1668090820313, 90.08409881591795),
                                particles = vector3(-1.48919999599456, -7.95289993286132, 501.1669006347656)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(1.27620005607604, -7.2253999710083, 502.6471862792969, 0),
                    targetSize = vector3(1.88499963283538, 1.85999965667724, 2.56001210212707),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(1.19749999046325, -7.060800075531, 500.1676025390625, 345.51409912109375),
                                particles = vector3(1.30400002002716, -7.0071997642517, 502.4661865234375)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_beachhouse_shell.png'},
        },
    
        ['k4mb1_beachhouse2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Beach House 2',
            model = 'k4mb1_beachhouse2_shell',
            rooms = 0,
            
            doors = vector4(-11.3858, 1.9059, 500.1667, 270.1406),
    
            interactable = {
                {
                    target = vector4(4.9257001876831, 17.11459922790527, 501.41839599609375, 0),
                    targetSize = vector3(0.89500057697296, 0.75000071525573, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(4.91109991073608, 17.71430015563965, 499.9668884277344, 183.6949005126953),
                                particles = vector3(4.94239997863769, 16.98559951782226, 500.9670104980469)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(3.99180006980896, 19.2362995147705, 502.8164978027344, 0),
                    targetSize = vector3(1.85999965667724, 1.70999979972839, 2.90001988410949),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(3.93860006332397, 19.31979942321777, 499.9668884277344, 310.16650390625),
                                particles = vector3(3.97350001335144, 19.31139945983886, 502.4461975097656)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-7.46290016174316, -7.73320007324218, 501.5165100097656, 0),
                    targetSize = vector3(0.64500081539154, 1.01500046253204, 1.35999989509582),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-7.94000005722045, -7.96619987487793, 500.1668090820313, 271.110107421875),
                                particles = vector3(-7.1434998512268, -7.96950006484985, 501.1868896484375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-1.3532999753952, -7.96640014648437, 501.41900634765625, 0),
                    targetSize = vector3(0.72500073909759, 1.01000046730041, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-0.7820000052452, -7.93109989166259, 500.1668090820313, 90.08409881591795),
                                particles = vector3(-1.48919999599456, -7.95289993286132, 501.1669006347656)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(1.27620005607604, -7.2253999710083, 502.6471862792969, 0),
                    targetSize = vector3(1.88499963283538, 1.85999965667724, 2.56001210212707),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(1.19749999046325, -7.060800075531, 500.1676025390625, 345.51409912109375),
                                particles = vector3(1.30400002002716, -7.0071997642517, 502.4661865234375)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_beachhouse2_shell.png'},
        },
    
        ['k4mb1_farmhouse_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Farm House',
            model = 'k4mb1_farmhouse_shell',
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
    
        ['k4mb1_house1paleto_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Paleto House',
            model = 'k4mb1_house1paleto_shell',
            rooms = 0,
            
            doors = vector4(10.3071, -3.5772, 498.0222, 91.6208),
    
            interactable = {
                {
                    target = vector4(-6.13159990310668, 2.44400000572204, 500.2752990722656, 0),
                    targetSize = vector3(1.06000041961669, 2.1850037574768, 2.75501656532287),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-6.14659976959228, 2.89709997177124, 497.693115234375, 349.4783935546875),
                                particles = vector3(-5.94490003585815, 3.10159993171691, 499.6424865722656)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-3.12059998512268, 0.99440002441406, 498.7123107910156, 0),
                    targetSize = vector3(0.98000049591064, 0.57000088691711, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-3.06800007820129, 1.49580001831054, 497.5545043945313, 180.1479034423828),
                                particles = vector3(-3.21499991416931, 0.83670002222061, 498.6346130371094)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-8.36400032043457, -6.02349996566772, 500.2904968261719, 0),
                    targetSize = vector3(1.21000027656555, 0.7800006866455, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-8.52330017089843, -5.4197998046875, 498.98388671875, 179.47019958496097),
                                particles = vector3(-8.50319957733154, -6.12249994277954, 500.1438903808594)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_house1paleto_shell.png'},
        },
    
        ['k4mb1_manor2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Manor 2',
            model = 'k4mb1_manor2_shell',
            rooms = 0,
            
            doors = vector4(6.9019, -9.1118, 494.024, 3.708),
    
            interactable = {
                {
                    target = vector4(-19.57769966125488, -3.42429995536804, 495.5740051269531, 0),
                    targetSize = vector3(1.0250004529953, 0.98000049591064, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-18.7583999633789, -3.49169993400573, 494.02398681640625, 92.1052017211914),
                                particles = vector3(-19.77899932861328, -3.44059991836547, 495.16400146484375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-16.30130004882812, -0.34630000591278, 495.5755004882813, 0),
                    targetSize = vector3(0.74000072479248, 1.02000045776367, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-17.0349006652832, -0.08110000193119, 494.02398681640625, 271.9469909667969),
                                particles = vector3(-16.07439994812011, -0.0869999974966, 495.16400146484375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-0.81000000238418, -0.82819998264312, 499.2745971679688, 0),
                    targetSize = vector3(0.71000075340271, 1.5, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-0.31060001254081, -0.88599997758865, 497.8085021972656, 91.95780181884766),
                                particles = vector3(-0.91570001840591, -0.82770001888275, 498.8486022949219)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(19.2012996673584, 0.76569998264312, 499.2745971679688, 0),
                    targetSize = vector3(0.65500080585479, 1.5, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(18.61860084533691, 0.8033999800682, 497.8084106445313, 271.7815856933594),
                                particles = vector3(19.27849960327148, 0.76969999074935, 498.82861328125)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(16.04509925842285, 11.68420028686523, 499.2745971679688, 0),
                    targetSize = vector3(1.30500018596649, 0.64000082015991, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(16.04540061950683, 12.30090045928955, 497.8077087402344, 184.93899536132812),
                                particles = vector3(16.0669994354248, 11.64150047302246, 498.8279113769531)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_manor2_shell.png'},
        },
    
        ['k4mb1_mansion1modern_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Modern Mansion',
            model = 'k4mb1_mansion1modern_shell',
            rooms = 0,
            
            doors = vector4(0.9783, 18.6112, 499.5396, 212.2386),
    
            interactable = {
                {
                    target = vector4(3.30259990692138, 11.21570014953613, 500.9382934570313, 314),
                    targetSize = vector3(1.11000037193298, 0.75000071525573, 1.0400002002716),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(3.73530006408691, 11.67329978942871, 499.5397033691406, 139.908203125),
                                particles = vector3(3.21160006523132, 11.18540000915527, 500.559814453125)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-2.12809991836547, -2.84439992904663, 499.9289855957031, 318),
                    targetSize = vector3(0.58500087261199, 1.08000040054321, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-1.75189995765686, -3.2985999584198, 498.5427856445313, 50.24679946899414),
                                particles = vector3(-2.26830005645751, -2.78979992866516, 499.6629028320313)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-4.11409997940063, -3.31410002708435, 501.3481140136719, 318),
                    targetSize = vector3(1.61999988555908, 1.97499954700469, 2.81001782417297),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-4.31979990005493, -3.17149996757507, 498.5434875488281, 8.41670036315918),
                                particles = vector3(-4.15089988708496, -3.23530006408691, 500.7622985839844)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-0.75360000133514, 6.88049983978271, 502.0848083496094, 314),
                    targetSize = vector3(1.24000024795532, 2.22500467300415, 2.89001965522766),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-0.48960000276565, 7.38579988479614, 499.2394104003906, 301.4657897949219),
                                particles = vector3(-0.52539998292922, 7.14069986343383, 501.4789123535156)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-0.75410002470016, 4.22179985046386, 500.62548828125, 314),
                    targetSize = vector3(0.74000072479248, 1.5, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-1.11559998989105, 4.67329978942871, 499.2394104003906, 223.81280517578128),
                                particles = vector3(-0.6405000090599, 4.12249994277954, 500.3594970703125)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_mansion1modern_shell.png'},
        },
    
        ['k4mb1_mansion_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Mansion',
            model = 'k4mb1_mansion_shell',
            rooms = 0,
            
            doors = vector4(-10.9373, 6.0272, 503.6092, 280.29),
    
            interactable = {
                {
                    target = vector4(-5.4099998474121, -5.01539993286132, 504.7294921875, 10),
                    targetSize = vector3(0.9200005531311, 0.95000052452087, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-4.72580003738403, -4.89120006561279, 503.3999938964844, 100.61289978027344),
                                particles = vector3(-5.55950021743774, -5.02729988098144, 504.4400939941406)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(16.11790084838867, 14.63969993591308, 504.7886047363281, 46),
                    targetSize = vector3(1.03500044345855, 0.70500075817108, 0.85000038146972),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(15.75, 15.11610031127929, 503.39990234375, 223.4654998779297),
                                particles = vector3(16.172700881958, 14.60890007019043, 504.5199890136719)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(15.05529975891113, 13.60060024261474, 504.9635925292969, 46),
                    targetSize = vector3(1.05000042915344, 0.66500079631805, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(14.67850017547607, 14.04590034484863, 503.39990234375, 224.8852996826172),
                                particles = vector3(15.13129997253418, 13.52400016784668, 504.5199890136719)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(12.81830024719238, 12.52260017395019, 506.2694091796875, 46),
                    targetSize = vector3(2.47001028060913, 2.35500764846801, 2.92002034187316),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(12.69159984588623, 12.18889999389648, 503.40478515625, 128.97579956054688),
                                particles = vector3(12.49030017852783, 12.18290042877197, 505.939208984375)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(26.33639907836914, 7.08519983291626, 500.7737121582031, 46),
                    targetSize = vector3(0.94500052928924, 0.7450007200241, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(25.9508991241455, 6.81010007858276, 499.0169982910156, 312.9353942871094),
                                particles = vector3(26.46299934387207, 7.22489976882934, 500.1170959472656)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(27.5231990814209, 6.1744999885559, 500.7737121582031, 44),
                    targetSize = vector3(0.85500061511993, 0.71000075340271, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(26.96669960021972, 5.73680019378662, 499.0169982910156, 310.2781982421875),
                                particles = vector3(27.53400039672851, 6.15390014648437, 500.1370849609375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(24.01320075988769, 2.98629999160766, 501.47210693359375, 46),
                    targetSize = vector3(2.4900107383728, 2.6300139427185, 2.49001049995422),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(23.6117992401123, 2.58179998397827, 499.0224914550781, 315.65130615234375),
                                particles = vector3(23.60390090942382, 2.74460005760192, 501.45849609375)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-25.31189918518066, 2.07360005378723, 500.5784912109375, 10),
                    targetSize = vector3(0.93000054359436, 0.71000075340271, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-25.45929908752441, 2.63619995117187, 499.02191162109375, 188.8759002685547),
                                particles = vector3(-25.29829978942871, 1.97730004787445, 500.1218872070313)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-26.80540084838867, 1.81470000743865, 500.5784912109375, 10),
                    targetSize = vector3(0.73500072956085, 0.70000076293945, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-26.89410018920898, 2.4186999797821, 499.02191162109375, 188.5962066650391),
                                particles = vector3(-26.78319931030273, 1.70899999141693, 500.1218872070313)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-26.83440017700195, 5.11549997329711, 501.36871337890625, 10),
                    targetSize = vector3(2.67001485824584, 1.38500010967254, 2.36000752449035),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-27.36310005187988, 4.8914999961853, 498.98919677734375, 51.85169982910156),
                                particles = vector3(-27.43729972839355, 4.97900009155273, 501.3612060546875)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(4.30410003662109, -1.71029996871948, 496.9200134277344, 10),
                    targetSize = vector3(0.96000051498413, 0.98500049114227, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(4.96899986267089, -1.62679994106292, 495.4403991699219, 101.3668975830078),
                                particles = vector3(4.08230018615722, -1.77499997615814, 496.4804992675781)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(10.2278995513916, 11.91469955444336, 496.9963989257813, 10),
                    targetSize = vector3(0.87500059604644, 0.93000054359436, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(10.20590019226074, 11.39480018615722, 495.440185546875, 12.04389953613281),
                                particles = vector3(10.15830039978027, 12.09479999542236, 496.560302734375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(11.66969966888427, 12.28929996490478, 496.9963989257813, 10),
                    targetSize = vector3(0.83500063419342, 0.67000079154968, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(11.71780014038086, 11.66170024871826, 495.440185546875, 11.13939952850341),
                                particles = vector3(11.63790035247802, 12.36009979248046, 496.560302734375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(11.68910026550293, 8.97929954528808, 497.85400390625, 10),
                    targetSize = vector3(2.67001485824584, 1.4650000333786, 2.49501061439514),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(12.17310047149658, 9.16160011291503, 495.4068908691406, 272.18939208984375),
                                particles = vector3(12.30869960784912, 9.07499980926513, 497.7596130371094)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-19.66990089416504, -2.11599993705749, 496.9914855957031, 10),
                    targetSize = vector3(0.75000071525573, 0.8500006198883, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-19.72430038452148, -1.60300004482269, 495.4349060058594, 187.52099609375),
                                particles = vector3(-19.63489913940429, -2.25300002098083, 496.5549011230469)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-21.14119911193847, -2.36339998245239, 496.9914855957031, 10),
                    targetSize = vector3(0.91000056266784, 0.85500061511993, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-21.21489906311035, -1.85679996013641, 495.4349060058594, 191.1584014892578),
                                particles = vector3(-21.11520004272461, -2.51830005645751, 496.5549011230469)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-21.17939949035644, 0.83719998598098, 497.8240966796875, 10),
                    targetSize = vector3(2.69001531600952, 1.42000007629394, 2.44500946998596),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-21.82719993591308, 0.57239997386932, 495.402099609375, 84.62370300292969),
                                particles = vector3(-21.76199913024902, 0.74449998140335, 497.5943908691406)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_mansion_shell.png'},
        },
    
        ['k4mb1_mansion2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Mansion 2',
            model = 'k4mb1_mansion2_shell',
            rooms = 0,
            
            doors = vector4(-10.9373, 6.0272, 503.6092, 280.29),
    
            interactable = {
                {
                    target = vector4(-5.4099998474121, -5.01539993286132, 504.7294921875, 10),
                    targetSize = vector3(0.9200005531311, 0.95000052452087, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-4.72580003738403, -4.89120006561279, 503.3999938964844, 100.61289978027344),
                                particles = vector3(-5.55950021743774, -5.02729988098144, 504.4400939941406)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(16.11790084838867, 14.63969993591308, 504.7886047363281, 46),
                    targetSize = vector3(1.03500044345855, 0.70500075817108, 0.85000038146972),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(15.75, 15.11610031127929, 503.39990234375, 223.4654998779297),
                                particles = vector3(16.172700881958, 14.60890007019043, 504.5199890136719)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(15.05529975891113, 13.60060024261474, 504.9635925292969, 46),
                    targetSize = vector3(1.05000042915344, 0.66500079631805, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(14.67850017547607, 14.04590034484863, 503.39990234375, 224.8852996826172),
                                particles = vector3(15.13129997253418, 13.52400016784668, 504.5199890136719)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(12.81830024719238, 12.52260017395019, 506.2694091796875, 46),
                    targetSize = vector3(2.47001028060913, 2.35500764846801, 2.92002034187316),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(12.69159984588623, 12.18889999389648, 503.40478515625, 128.97579956054688),
                                particles = vector3(12.49030017852783, 12.18290042877197, 505.939208984375)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(26.33639907836914, 7.08519983291626, 500.7737121582031, 46),
                    targetSize = vector3(0.94500052928924, 0.7450007200241, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(25.9508991241455, 6.81010007858276, 499.0169982910156, 312.9353942871094),
                                particles = vector3(26.46299934387207, 7.22489976882934, 500.1170959472656)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(27.5231990814209, 6.1744999885559, 500.7737121582031, 44),
                    targetSize = vector3(0.85500061511993, 0.71000075340271, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(26.96669960021972, 5.73680019378662, 499.0169982910156, 310.2781982421875),
                                particles = vector3(27.53400039672851, 6.15390014648437, 500.1370849609375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(24.01320075988769, 2.98629999160766, 501.47210693359375, 46),
                    targetSize = vector3(2.4900107383728, 2.6300139427185, 2.49001049995422),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(23.6117992401123, 2.58179998397827, 499.0224914550781, 315.65130615234375),
                                particles = vector3(23.60390090942382, 2.74460005760192, 501.45849609375)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-25.31189918518066, 2.07360005378723, 500.5784912109375, 10),
                    targetSize = vector3(0.93000054359436, 0.71000075340271, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-25.45929908752441, 2.63619995117187, 499.02191162109375, 188.8759002685547),
                                particles = vector3(-25.29829978942871, 1.97730004787445, 500.1218872070313)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-26.80540084838867, 1.81470000743865, 500.5784912109375, 10),
                    targetSize = vector3(0.73500072956085, 0.70000076293945, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-26.89410018920898, 2.4186999797821, 499.02191162109375, 188.5962066650391),
                                particles = vector3(-26.78319931030273, 1.70899999141693, 500.1218872070313)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-26.83440017700195, 5.11549997329711, 501.36871337890625, 10),
                    targetSize = vector3(2.67001485824584, 1.38500010967254, 2.36000752449035),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-27.36310005187988, 4.8914999961853, 498.98919677734375, 51.85169982910156),
                                particles = vector3(-27.43729972839355, 4.97900009155273, 501.3612060546875)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(4.30410003662109, -1.71029996871948, 496.9200134277344, 10),
                    targetSize = vector3(0.96000051498413, 0.98500049114227, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(4.96899986267089, -1.62679994106292, 495.4403991699219, 101.3668975830078),
                                particles = vector3(4.08230018615722, -1.77499997615814, 496.4804992675781)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(10.2278995513916, 11.91469955444336, 496.9963989257813, 10),
                    targetSize = vector3(0.87500059604644, 0.93000054359436, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(10.20590019226074, 11.39480018615722, 495.440185546875, 12.04389953613281),
                                particles = vector3(10.15830039978027, 12.09479999542236, 496.560302734375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(11.66969966888427, 12.28929996490478, 496.9963989257813, 10),
                    targetSize = vector3(0.83500063419342, 0.67000079154968, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(11.71780014038086, 11.66170024871826, 495.440185546875, 11.13939952850341),
                                particles = vector3(11.63790035247802, 12.36009979248046, 496.560302734375)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(11.68910026550293, 8.97929954528808, 497.85400390625, 10),
                    targetSize = vector3(2.67001485824584, 1.4650000333786, 2.49501061439514),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(12.17310047149658, 9.16160011291503, 495.4068908691406, 272.18939208984375),
                                particles = vector3(12.30869960784912, 9.07499980926513, 497.7596130371094)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(-19.66990089416504, -2.11599993705749, 496.9914855957031, 10),
                    targetSize = vector3(0.75000071525573, 0.8500006198883, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-19.72430038452148, -1.60300004482269, 495.4349060058594, 187.52099609375),
                                particles = vector3(-19.63489913940429, -2.25300002098083, 496.5549011230469)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-21.14119911193847, -2.36339998245239, 496.9914855957031, 10),
                    targetSize = vector3(0.91000056266784, 0.85500061511993, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-21.21489906311035, -1.85679996013641, 495.4349060058594, 191.1584014892578),
                                particles = vector3(-21.11520004272461, -2.51830005645751, 496.5549011230469)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(-21.17939949035644, 0.83719998598098, 497.8240966796875, 10),
                    targetSize = vector3(2.69001531600952, 1.42000007629394, 2.44500946998596),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-21.82719993591308, 0.57239997386932, 495.402099609375, 84.62370300292969),
                                particles = vector3(-21.76199913024902, 0.74449998140335, 497.5943908691406)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_mansion2_shell.png'},
        },
    
        ['k4mb1_mansion3_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Mansion 3',
            model = 'k4mb1_mansion3_shell',
            rooms = 0,
            
            doors = vector4(8.3931, -20.4221, 496.3409, 214.9786),
    
            interactable = {
                {
                    target = vector4(7.12890005111694, 5.80970001220703, 497.8044128417969, 0),
                    targetSize = vector3(1.05500042438507, 0.83500063419342, 1.20000004768371),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(7.10440015792846, 6.48689985275268, 496.3599853515625, 180.0550994873047),
                                particles = vector3(7.12440013885498, 5.72989988327026, 497.3200988769531)
                            },
                            timeUsage = 7000,
                            billType = 'water',
                            type = 'sink',
                            waterUsage = 5000
                        }
                    }
                },
                {
                    target = vector4(15.80140018463134, 16.79360008239746, 499.126708984375, 0),
                    targetSize = vector3(2.77501726150512, 1.73499977588653, 2.83001828193664),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(16.61870002746582, 16.70409965515136, 496.3121032714844, 205.6416931152344),
                                particles = vector3(16.49320030212402, 16.797700881958, 498.5715942382813)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(8.25969982147216, 9.52900028228759, 502.6571960449219, 0),
                    targetSize = vector3(1.98499953746795, 1.72499978542327, 2.35500741004943),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(8.79669952392578, 9.53240013122558, 500.2800903320313, 224.4040069580078),
                                particles = vector3(8.52519989013671, 9.52929973602295, 502.4616088867188)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                },
                {
                    target = vector4(16.54459953308105, 23.41699981689453, 503.0596923828125, 0),
                    targetSize = vector3(2.39000844955444, 1.87999975681304, 2.76001667976379),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(17.20750045776367, 23.52599906921386, 500.2800903320313, 90.8314971923828),
                                particles = vector3(17.01729965209961, 23.43659973144531, 502.5408935546875)
                            },
                            timeUsage = 10000,
                            billType = 'water',
                            type = 'shower',
                            waterUsage = 120000
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_mansion3_shell.png'},
        },
    
        ['k4mb1_modern_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Modern',
            model = 'k4mb1_modern_shell',
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
    
        ['k4mb1_penthouse2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Penthouse 2',
            model = 'k4mb1_penthouse2_shell',
            rooms = 0,
            
            doors = vector4(4.7383, -12.3583, 497.8214, 2.3155),
    
            interactable = {
                {
                    targetSize = vector3(1.19500029087066, 0.72000074386596, 1.20000004768371),
                    target = vector4(7.23080015182495, 1.67789995670318, 499.172607421875, 0),
                    options = {
                        {
                            waterUsage = 5000,
                            timeUsage = 7000,
                            type = 'sink',
                            billType = 'water',
                            coords = {
                                player = vector4(7.18930006027221, 1.09130001068115, 497.8215026855469, 359.5741882324219),
                                particles = vector3(7.22359991073608, 1.65629994869232, 499.1014099121094)
                            },
                            targetIcon = 'fa-solid fa-sink'
                        }
                    }
                },
                {
                    targetSize = vector3(1.19500029087066, 0.66000080108642, 1.20000004768371),
                    target = vector4(8.02880001068115, 10.00619983673095, 499.06640625, 0),
                    options = {
                        {
                            waterUsage = 5000,
                            timeUsage = 7000,
                            type = 'sink',
                            billType = 'water',
                            coords = {
                                player = vector4(7.97469997406005, 9.46650028228759, 497.8215026855469, 3.57380008697509),
                                particles = vector3(8.03079986572265, 10.04269981384277, 498.96148681640625)
                            },
                            targetIcon = 'fa-solid fa-sink'
                        }
                    }
                },
                {
                    targetSize = vector3(1.09000039100646, 2.58501291275024, 2.46000981330871),
                    target = vector4(5.80910015106201, 9.0438003540039, 500.2688903808594, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            timeUsage = 10000,
                            type = 'shower',
                            billType = 'water',
                            coords = {
                                player = vector4(5.67070007324218, 9.95349979400634, 497.83441162109375, 329.8508911132813),
                                particles = vector3(5.76319980621337, 9.88129997253418, 500.20159912109375)
                            },
                            targetIcon = 'fa-solid fa-shower'
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_penthouse2_shell.png'},
        },
    
        ['k4mb1_penthouse_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Penthouse',
            model = 'k4mb1_penthouse_shell',
            rooms = 0,
            
            doors = vector4(8.9532, -11.7559, 500.081, 271.6963),
    
            interactable = {
                {
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            waterUsage = 5000,
                            type = 'sink',
                            coords = {
                                particles = vector3(-27.80929946899414, -13.04100036621093, 501.2232971191406),
                                player = vector4(-27.85199928283691, -12.34959983825683, 500.0831909179688, 185.93359375)
                            },
                            billType = 'water',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(1.56999993324279, 0.67000079154968, 1.20000004768371),
                    target = vector4(-28.32060050964355, -13.03709983825683, 501.5527038574219, 0)
                },
                {
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            waterUsage = 5000,
                            type = 'sink',
                            coords = {
                                particles = vector3(-24.39139938354492, -9.72529983520507, 501.22320556640625),
                                player = vector4(-23.71809959411621, -9.72220039367675, 500.0830993652344, 90.40959930419922)
                            },
                            billType = 'water',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.66500079631805, 1.7299997806549, 1.20000004768371),
                    target = vector4(-24.36949920654297, -9.71420001983642, 501.510009765625, 0)
                },
                {
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            waterUsage = 5000,
                            type = 'sink',
                            coords = {
                                particles = vector3(-8.89610004425048, -9.33300018310546, 501.2218017578125),
                                player = vector4(-8.87689971923828, -8.74810028076171, 500.0816955566406, 180.80209350585935)
                            },
                            billType = 'water',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(1.10000038146972, 0.69500076770782, 1.20000004768371),
                    target = vector4(-8.89620018005371, -9.31910037994384, 501.6325073242188, 0)
                },
                {
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            waterUsage = 5000,
                            type = 'sink',
                            coords = {
                                particles = vector3(28.69179916381836, 2.93359994888305, 501.1630859375),
                                player = vector4(28.031099319458, 2.94569993019104, 500.0830078125, 269.1594848632813)
                            },
                            billType = 'water',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.75000071525573, 1.00000047683715, 1.20000004768371),
                    target = vector4(28.63999938964843, 2.93939995765686, 501.4690856933594, 0)
                },
                {
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            waterUsage = 5000,
                            type = 'sink',
                            coords = {
                                particles = vector3(28.69989967346191, 1.70459997653961, 501.1630859375),
                                player = vector4(28.03140068054199, 1.70759999752044, 500.0830993652344, 269.7851867675781)
                            },
                            billType = 'water',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(1.0250004529953, 1.03500044345855, 1.20000004768371),
                    target = vector4(28.75919914245605, 1.70840001106262, 501.4690856933594, 0)
                },
                {
                    options = {
                        {
                            targetIcon = 'fa-solid fa-shower',
                            waterUsage = 120000,
                            type = 'shower',
                            coords = {
                                particles = vector3(22.78680038452148, -0.55099999904632, 502.5624084472656),
                                player = vector4(22.92180061340332, -0.46860000491142, 500.0840148925781, 145.15989685058597)
                            },
                            billType = 'water',
                            timeUsage = 10000
                        }
                    },
                    targetSize = vector3(4.11504793167114, 2.62001371383667, 2.77501702308654),
                    target = vector4(23.65180015563965, 0.29649999737739, 502.8760070800781, 0)
                },
                {
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            waterUsage = 5000,
                            type = 'sink',
                            coords = {
                                particles = vector3(26.05430030822754, -1.55959999561309, 501.1630859375),
                                player = vector4(26.01899909973144, -2.23160004615783, 500.0830993652344, 358.2076110839844)
                            },
                            billType = 'water',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.93000054359436, 0.97000050544738, 1.20000004768371),
                    target = vector4(26.05249977111816, -1.45930004119873, 501.74859619140625, 0)
                },
                {
                    options = {
                        {
                            targetIcon = 'fa-solid fa-sink',
                            waterUsage = 5000,
                            type = 'sink',
                            coords = {
                                particles = vector3(24.80649948120117, -1.55379998683929, 501.1630859375),
                                player = vector4(24.82119941711425, -2.26819992065429, 500.0830993652344, 358.2912902832031)
                            },
                            billType = 'water',
                            timeUsage = 7000
                        }
                    },
                    targetSize = vector3(0.89000058174133, 0.95000052452087, 1.20000004768371),
                    target = vector4(24.80699920654297, -1.45930004119873, 501.8034057617188, 0)
                },
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_penthouse_shell.png'},
        },
    
        ['k4mb1_villa1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Villa',
            model = 'k4mb1_villa1_shell',
            rooms = 0,
            
            doors = vector4(2.5605, 4.0958, 498.4691, 175.4785),
    
            interactable = {
                {
                    targetSize = vector3(1.38500010967254, 0.82500064373016, 1.20000004768371),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(1.29639995098114, -4.17049980163574, 498.4692077636719, 177.37789916992188),
                                particles = vector3(1.23099994659423, -4.72179985046386, 499.7491149902344)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink'
                        }
                    },
                    target = vector4(1.22510004043579, -4.78009986877441, 500.0198974609375, 0)
                },
                {
                    targetSize = vector3(0.65000081062316, 1.14500033855438, 1.20000004768371),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(5.80299997329711, -3.3529999256134, 498.4692077636719, 91.64659881591795),
                                particles = vector3(5.17070007324218, -3.40289998054504, 499.389404296875)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink'
                        }
                    },
                    target = vector4(5.26660013198852, -3.39280009269714, 499.7381896972656, 0)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_villa1_shell.png'},
        },
    
        ['k4mb1_vw_house4_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Vinewood House 4',
            model = 'k4mb1_vw_house4_shell',
            rooms = 0,
            
            doors = vector4(7.0365, -8.7712, 497.4623, 87.3823),
    
            interactable = {
                {
                    targetSize = vector3(1.94499957561492, 1.22500026226043, 2.53001141548156),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(10.78699970245361, 6.42199993133544, 497.4627990722656, 264.31298828125),
                                particles = vector3(10.4483003616333, 6.23489999771118, 499.6418151855469)
                            },
                            billType = 'water',
                            waterUsage = 120000,
                            type = 'shower'
                        }
                    },
                    target = vector4(10.17879962921142, 6.25600004196167, 499.9323120117188, 0)
                },
                {
                    targetSize = vector3(0.58500087261199, 1.06000041961669, 1.20000004768371),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(8.34259986877441, 5.32870006561279, 497.4627075195313, 88.01020050048828),
                                particles = vector3(7.70900011062622, 5.33029985427856, 498.48291015625)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink'
                        }
                    },
                    target = vector4(7.8043999671936, 5.3204002380371, 498.9497985839844, 0)
                },
                {
                    targetSize = vector3(2.15000295639038, 3.0200228691101, 2.56001210212707),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-3.55850005149841, 16.97540092468261, 497.1669006347656, 292.1517028808594),
                                particles = vector3(-3.47300004959106, 16.94580078125, 499.2856140136719)
                            },
                            billType = 'water',
                            waterUsage = 120000,
                            type = 'shower'
                        }
                    },
                    target = vector4(-3.4944999217987, 16.14080047607422, 499.6514892578125, 0)
                },
                {
                    targetSize = vector3(1.03000044822692, 0.71500074863433, 1.20000004768371),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-6.04199981689453, 15.57059955596923, 497.1669006347656, 177.96519470214844),
                                particles = vector3(-6.11250019073486, 14.94699954986572, 498.18701171875)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink'
                        }
                    },
                    target = vector4(-6.11499977111816, 15.00720024108886, 498.6539916992188, 0)
                },
                {
                    targetSize = vector3(1.71499979496002, 2.87001943588256, 2.48001027107238),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-3.52620005607605, 4.18849992752075, 497.1669921875, 344.2744140625),
                                particles = vector3(-3.45180010795593, 4.11019992828369, 499.2463073730469)
                            },
                            billType = 'water',
                            waterUsage = 120000,
                            type = 'shower'
                        }
                    },
                    target = vector4(-3.48970007896423, 3.44309997558593, 499.6115112304688, 358)
                },
                {
                    targetSize = vector3(1.21500027179718, 0.63500082492828, 1.20000004768371),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(-5.16139984130859, 3.96970009803771, 497.1669006347656, 0.57840001583099),
                                particles = vector3(-5.13490009307861, 4.59800004959106, 498.1669921875)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink'
                        }
                    },
                    target = vector4(-5.09539985656738, 4.51370000839233, 498.24359130859375, 358)
                },
                {
                    targetSize = vector3(2.58501291275024, 2.06000089645385, 2.62001347541809),
                    options = {
                        {
                            timeUsage = 10000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                player = vector4(-1.66139996051788, 5.51109981536865, 497.1669921875, 83.79209899902344),
                                particles = vector3(-1.71350002288818, 5.72179985046386, 499.40618896484375)
                            },
                            billType = 'water',
                            waterUsage = 120000,
                            type = 'shower'
                        }
                    },
                    target = vector4(-1.18079996109008, 5.61859989166259, 499.6814880371094, 0)
                },
                {
                    targetSize = vector3(0.65500080585479, 1.05000042915344, 1.20000004768371),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(0.96310001611709, 5.60090017318725, 497.1669006347656, 265.26019287109375),
                                particles = vector3(1.56070005893707, 5.58809995651245, 498.18701171875)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink'
                        }
                    },
                    target = vector4(1.50510001182556, 5.59889984130859, 498.6539916992188, 0)
                },
                {
                    targetSize = vector3(0.90000057220458, 0.75500071048736, 1.20000004768371),
                    options = {
                        {
                            timeUsage = 7000,
                            targetIcon = 'fa-solid fa-sink',
                            coords = {
                                player = vector4(4.16949987411499, -14.82810020446777, 497.1669006347656, 174.03790283203125),
                                particles = vector3(4.16099977493286, -15.48680019378662, 498.2070007324219)
                            },
                            billType = 'water',
                            waterUsage = 5000,
                            type = 'sink'
                        }
                    },
                    target = vector4(4.15570020675659, -15.38939952850341, 498.6720886230469, 0)
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_vw_house4_shell.png'},
        },
    
        ['k4mb1_warehouse_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Warehouse',
            model = 'k4mb1_warehouse_shell',
            rooms = 0,
            
            doors = vector4(8.7008, -3.3682, 497.5053, 85.5066),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_warehouse_shell.png'},
        },
    }
    
    addShells(shells)
end)