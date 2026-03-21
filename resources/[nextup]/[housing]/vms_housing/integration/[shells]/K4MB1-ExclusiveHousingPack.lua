CreateThread(function()
    Wait(1000)

    if not Config.Shells.K4MB1_ExclusiveHousingPack then return end
    
    if Config.Shells.K4MB1_AllShellsSubPack then
        return warn(("^3You cannot have ^1%s^3 and ^1%s^3 running at the same time.^7"):format('K4MB1_ExclusiveHousingPack', 'K4MB1-AllShellsSubPack'))
    end
    
    local shells = {
        ['k4mb1_motel1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Motel 1',
            model = 'k4_house1_shell',
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
        ['k4mb1_trap_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Trap',
            model = 'k4_house2_shell',
            rooms = 0,
            
            doors = vector4(-7.1435, -1.3721, 498.7477, 175.361),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_trap_shell.png'},
        },
        ['k4mb1_apartment_shell'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
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
        ['kambi_emptyhouse1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Empty House 1',
            model = 'k4_house4_shell',
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
        ['k4mb1_sandyhouse1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Sandy House 1',
            model = 'k4_house5_shell',
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
        ['k4mb1_hoodhouse1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Hood House 1',
            model = 'k4_house6_shell',
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
        ['k4mb1_palhouse1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Pal House 1',
            model = 'k4_house7_shell',
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
        ['k4mb1_house1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'House 1',
            model = 'k4_house8_shell',
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
            model = 'k4_house9_shell',
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
        ['k4mb1_house4_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'House 4',
            model = 'k4_house10_shell',
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
        ['k4mb1_farmhouse_shell'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
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
        ['k4mb1_house1paleto_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Paleto House',
            model = 'k4_house13_shell',
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
        ['k4mb1_villa1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Villa',
            model = 'k4_house14_shell',
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
        ['k4mb1_loft1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Loft 1',
            model = 'k4_loft1_shell',
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
            model = 'k4_loft2_shell',
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
            model = 'k4_loft3_shell',
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
        ['k4mb1_apa1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Apa 1',
            model = 'k4_apa1_shell',
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
            model = 'k4_apa2_shell',
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
            model = 'k4_apa3_shell',
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
        ['luxury_housing1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Luxury Housing 1',
            model = 'k4_modern1_shell',
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
            model = 'k4_modern2_shell',
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
        ['k4mb1_house3_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'House 3',
            model = 'k4_modern3_shell',
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
        ['k4mb1_banham_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Banham',
            model = 'k4_modern4_shell',
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
            model = 'k4_modern5_shell',
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
            model = 'k4_modern6_shell',
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
            model = 'k4_modern7_shell',
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
        ['k4mb1_mansion1modern_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Modern Mansion',
            model = 'k4_modern8_shell',
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
        ['k4mb1_modern_shell'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
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
        ['k4mb1_vw_house4_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Vinewood House 4',
            model = 'k4_modern10_shell',
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
        ['manor_housing1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Manor Housing 1',
            model = 'k4_manor1_shell',
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
        ['k4mb1_manor2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Manor 2',
            model = 'k4_manor2_shell',
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
        ['k4mb1_penthouse_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Penthouse',
            model = 'k4_penthouse_shell',
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
        ['k4mb1_penthouse2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Penthouse 2',
            model = 'k4_penthouse2_shell',
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
        ['k4mb1_mansion_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Mansion',
            model = 'k4_vwmansion2a_shell',
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
            model = 'k4_vwmansion2b_shell',
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
            model = 'k4_vwmansion3_shell',
            rooms = 0,
            
            doors = vector4(1.01, 20.93, 496.36, 267.48),
    
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
        ['k4mb1_hoodhouse2_shell'] = {
            tags = {'empty', 'k4mb1'},

            label = 'Hood House 2',
            model = 'k4_house12_shell',
            rooms = 0,
            
            doors = vector4(-3.4266, 4.1058, 498.4181, 266.4364),

            interactable = {
                {
                    options = {
                        {
                            timeUsage = 5000,
                            coords = {
                                player = vector4(-5.935800075531, 1.05229997634887, 498.4176025390625, 89.94329833984375),
                                particles = vector3(-6.60839986801147, 1.0326999425888, 499.53759765625)
                            },
                            billType = 'water',
                            type = 'sink_drink',
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            waterUsage = 300
                        },
                        {
                            timeUsage = 7000,
                            coords = {
                                player = vector4(-5.98299980163574, 1.02999997138977, 498.4176025390625, 91.61640167236328),
                                particles = vector3(-6.60780000686645, 1.03670001029968, 499.53759765625)
                            },
                            billType = 'water',
                            type = 'sink',
                            targetIcon = 'fa-solid fa-sink',
                            waterUsage = 5000
                        }
                    },
                    target = vector4(-6.59989976882934, 1.10780000686645, 499.9332885742188, 0),
                    targetSize = vector3(0.80500066280364, 0.98500049114227, 1.20000004768371)
                },
                {
                    options = {
                        {
                            timeUsage = 10000,
                            coords = {
                                player = vector4(4.50309991836547, 0.27360001206398, 498.57708740234375, 292.3062133789063),
                                particles = vector3(4.56239986419677, 0.35170000791549, 500.8569030761719)
                            },
                            billType = 'water',
                            type = 'shower',
                            targetIcon = 'fa-solid fa-shower',
                            waterUsage = 120000
                        }
                    },
                    target = vector4(4.24139976501464, 0.15309999883174, 500.6242065429688, 0),
                    targetSize = vector3(1.74499976634979, 1.17500030994415, 2.08500099182128)
                }
            },

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_house12_shell.png'},
        },
    }
    
    addShells(shells)
end)