CreateThread(function()
    Wait(1000)
    
    if Config.Shells.Max_Creations_Classic or Config.Shells.Max_Creations_25 then
        local shells = {
            ['max_classic_shell1'] = {
                tags = {'empty', 'maxcreations'},
    
                label = 'Max Classic Shell #1',
                model = 'max_classic_shell1',
                rooms = 3,
                
                doors = vector4(-5.5531, 6.4269, 499.7168, 183.2679),
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/max_classic_shell1.webp'},
            },
    
            ['max_classic_shell2'] = {
                tags = {'empty', 'maxcreations'},
    
                label = 'Max Classic #2',
                model = 'max_classic_shell2',
                rooms = 9,
                
                doors = vector4(-3.593, -4.5309, 499.9994, 357.4575),
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/max_classic_shell2.webp'},
            },
    
        }
        
        addShells(shells)
    end
    
    if Config.Shells.Max_Creations_25 then
        local shells = {
            ['furnished_shell'] = {
                tags = {'furnished', 'maxcreations'},
    
                label = 'Max Furnished Shell',
                model = 'furnished_shell',
                rooms = 0,
                
                doors = vector4(-2.6287, 7.0194, 502.1608, 179.9442),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(6.34409999847412, 1.10290002822875, 502.16070556640625, 275.9045104980469),
                                    particles = vector3(6.97359991073608, 1.17420005798339, 503.4006958007813)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(6.34810018539428, 1.17060005664825, 502.1661987304688, 271.1736145019531),
                                    particles = vector3(6.97380018234252, 1.17340004444122, 503.3807067871094)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.5, 1.5, 1.20000004768371),
                        target = vector4(7.03119993209838, 0.96649998426437, 503.7579956054688, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(5.08330011367797, 0.28720000386238, 498.3633117675781, 358.6777038574219),
                                    particles = vector3(5.08290004730224, 0.98689997196197, 499.3599853515625)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(5.06430006027221, 0.30199998617172, 498.3664855957031, 359.6351013183594),
                                    particles = vector3(5.07429981231689, 0.99250000715255, 499.343505859375)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.07500040531158, 0.98500049114227, 1.20000004768371),
                        target = vector4(5.07929992675781, 1.08920001983642, 499.6841125488281, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(6.5398998260498, 0.31810000538825, 498.3505859375, 2.97169995307922),
                                    particles = vector3(6.50950002670288, 0.98650002479553, 499.34710693359375)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(6.52470016479492, 0.31060001254081, 498.3508911132813, 1.43869996070861),
                                    particles = vector3(6.50619983673095, 0.98750001192092, 499.3507080078125)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.9900004863739, 0.97500050067901, 1.20000004768371),
                        target = vector4(6.49949979782104, 1.12829995155334, 499.7192077636719, 0)
                    },
                    {
                        options = {
                            {
                                type = 'shower',
                                waterUsage = 120000,
                                targetIcon = 'fa-solid fa-shower',
                                coords = {
                                    player = vector4(2.50209999084472, -4.75190019607543, 498.373291015625, 255.0177001953125),
                                    particles = vector3(2.64540004730224, -4.89510011672973, 501.3294982910156)
                                },
                                timeUsage = 10000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(3.07002401351928, 1.7299997806549, 2.50001072883605),
                        target = vector4(2.64359998703002, -4.81960010528564, 500.82269287109375, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/furnished_shell.webp'},
            },
    
            ['newfurnished_shell'] = {
                tags = {'furnished', 'maxcreations'},
    
                label = 'Max New Furnished Shell',
                model = 'newfurnished_shell',
                rooms = 0,
                
                doors = vector4(-17.0541, -5.97, 500.8009, 270.5489),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-3.13579988479614, -5.87249994277954, 500.1993103027344, 180.8072052001953),
                                    particles = vector3(-3.16759991645813, -6.58529996871948, 501.4992065429688)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-3.15149998664855, -5.85080003738403, 500.1993103027344, 180.327392578125),
                                    particles = vector3(-3.16680002212524, -6.57569980621337, 501.4992065429688)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.5, 1.5, 1.20000004768371),
                        target = vector4(-3.16079998016357, -6.64400005340576, 501.78021240234375, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-2.58069992065429, 17.06879997253418, 503.6004943847656, 92.0103988647461),
                                    particles = vector3(-3.26320004463195, 17.0398998260498, 504.6033935546875)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-2.56960010528564, 17.0398006439209, 503.6005859375, 88.92060089111328),
                                    particles = vector3(-3.25869989395141, 17.0398006439209, 504.6005859375)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.80000066757202, 0.76500070095062, 1.20000004768371),
                        target = vector4(-3.21059989929199, 17.03459930419922, 505.0982971191406, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-2.60019993782043, 18.44969940185547, 503.6005859375, 88.82830047607422),
                                    particles = vector3(-3.26810002326965, 18.46209907531738, 504.6005859375)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-2.58349990844726, 18.44160079956054, 503.6004943847656, 90.14089965820312),
                                    particles = vector3(-3.26740002632141, 18.46570014953613, 504.6005859375)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.8500006198883, 0.86000061035156, 1.20000004768371),
                        target = vector4(-3.22830009460449, 18.45000076293945, 505.10650634765625, 0)
                    },
                    {
                        options = {
                            {
                                type = 'shower',
                                waterUsage = 120000,
                                targetIcon = 'fa-solid fa-shower',
                                coords = {
                                    player = vector4(0.81760001182556, 16.18490028381347, 503.6601867675781, 162.82229614257812),
                                    particles = vector3(0.76569998264312, 16.02009963989257, 505.9996948242188)
                                },
                                timeUsage = 10000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.42000007629394, 2.07500123977661, 2.64001393318176),
                        target = vector4(0.75800001621246, 16.59309959411621, 506.1798095703125, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/newfurnished_shell.webp'},
            },
    
            ['max_row_house'] = {
                tags = {'furnished', 'maxcreations'},
    
                label = 'Max Row House',
                model = 'max_row_house',
                rooms = 0,
                
                doors = vector4(-2.548, -7.401, 499.5562, 357.0669),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-3.20129990577697, 6.55609989166259, 499.5575866699219, 90.83209991455078),
                                    particles = vector3(-3.72300004959106, 6.55690002441406, 500.5007934570313)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-3.14759993553161, 6.55609989166259, 499.5574951171875, 88.07260131835938),
                                    particles = vector3(-3.72480010986328, 6.55249977111816, 500.4776916503906)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.78500068187713, 1.5, 1.20000004768371),
                        target = vector4(-3.78749990463256, 6.57140016555786, 500.8174133300781, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-2.16319990158081, -6.18599987030029, 502.8381042480469, 178.45199584960938),
                                    particles = vector3(-2.16810011863708, -6.8354001045227, 503.7970886230469)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-2.14280009269714, -6.185800075531, 502.84521484375, 181.2523956298828),
                                    particles = vector3(-2.15210008621215, -6.83939981460571, 503.7782897949219)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.76000070571899, 0.95000052452087, 1.20000004768371),
                        target = vector4(-2.1366000175476, -6.87799978256225, 504.2127990722656, 0)
                    },
                    {
                        options = {
                            {
                                type = 'shower',
                                waterUsage = 120000,
                                targetIcon = 'fa-solid fa-shower',
                                coords = {
                                    player = vector4(-1.26020002365112, -6.56330013275146, 502.9696960449219, 149.2030029296875),
                                    particles = vector3(-1.35490000247955, -6.66069984436035, 504.9106140136719)
                                },
                                timeUsage = 10000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.04500043392181, 2.09500169754028, 2.92002034187316),
                        target = vector4(-1.13689994812011, -6.05859994888305, 505.6257019042969, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/max_row_house.webp'},
            },
    
            ['lc_appartment'] = {
                tags = {'furnished', 'maxcreations'},
    
                label = 'Max LC Apartment',
                model = 'lc_appartment',
                rooms = 0,
                
                doors = vector4(0.5909, -5.9842, 495.8983, 359.1484),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-3.67300009727478, -5.86859989166259, 495.90478515625, 178.80340576171875),
                                    particles = vector3(-3.71659994125366, -6.65910005569458, 497.2448120117188)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-3.70449995994567, -5.84019994735717, 495.9046936035156, 175.65660095214844),
                                    particles = vector3(-3.71269989013671, -6.66639995574951, 497.24468994140625)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.5, 1.5, 1.20000004768371),
                        target = vector4(-3.64030003547668, -6.73579978942871, 497.4527893066406, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/lc_appartment.webp'},
            },
    
            ['loft_shell1'] = {
                tags = {'furnished', 'maxcreations'},
    
                label = 'Max Loft',
                model = 'loft_shell1',
                rooms = 0,
                
                doors = vector4(-1.4075, 9.1365, 500.0288, 179.3097),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(8.63899993896484, 4.96229982376098, 500.0296936035156, 91.17849731445312),
                                    particles = vector3(7.71890020370483, 4.96309995651245, 501.1697082519531)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(8.65219974517822, 4.9576997756958, 500.0335083007813, 90.92340087890624),
                                    particles = vector3(7.72230005264282, 4.95970010757446, 501.189697265625)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.91000056266784, 1.14500033855438, 1.20000004768371),
                        target = vector4(7.9471001625061, 5.11770009994506, 501.5750122070313, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(3.64010000228881, 11.44190025329589, 503.6488952636719, 94.40249633789064),
                                    particles = vector3(2.46110010147094, 11.37880039215087, 504.7688903808594)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(3.68400001525878, 11.40019989013671, 503.6488952636719, 89.19059753417969),
                                    particles = vector3(2.45429992675781, 11.37549972534179, 504.7690124511719)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.18000030517578, 1.5, 1.20000004768371),
                        target = vector4(2.71909999847412, 11.45849990844726, 505.09429931640625, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/loft_shell1.webp'},
            },
    
            ['customloft_shell2'] = {
                tags = {'furnished', 'maxcreations'},
    
                label = 'Max Loft #2',
                model = 'customloft_shell2',
                rooms = 0,
                
                doors = vector4(2.1568, -6.3724, 499.713, 7.2295),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(1.42530000209808, 3.56399989128112, 499.7171020507813, 90.05760192871094),
                                    particles = vector3(0.62940001487731, 3.510999917984, 500.8739929199219)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(1.41589999198913, 3.51740002632141, 499.7218933105469, 93.34259796142578),
                                    particles = vector3(0.63389998674392, 3.51029992103576, 500.8760070800781)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.5, 1.5, 1.20000004768371),
                        target = vector4(0.59399998188018, 3.25200009346008, 501.2410888671875, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(12.7721996307373, 14.56050014495849, 503.6018981933594, 270.42718505859375),
                                    particles = vector3(13.95020008087158, 14.58409976959228, 504.7619018554688)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(12.77190017700195, 14.52569961547851, 503.6018981933594, 266.406494140625),
                                    particles = vector3(13.95330047607421, 14.58950042724609, 504.7619018554688)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.5, 1.5, 1.20000004768371),
                        target = vector4(13.80430030822753, 14.52560043334961, 505.09429931640625, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/customloft_shell2.webp'},
            },
    
            ['max_luxury_apartv2uf'] = {
                tags = {'furnished', 'maxcreations'},
    
                label = 'Max Luxury Apartment',
                model = 'max_luxury_apartv2uf',
                rooms = 0,
                
                doors = vector4(-10.6785, 1.6915, 499.5171, 357.2794),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-22.64959907531738, 5.3713002204895, 499.5163879394531, 1.9277000427246),
                                    particles = vector3(-22.63529968261718, 5.96059989929199, 500.676513671875)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-22.67180061340332, 5.37760019302368, 499.5166931152344, 0.45100000500679),
                                    particles = vector3(-22.6378002166748, 5.95809984207153, 500.676513671875)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(2.23000359535217, 0.82000064849853, 1.20000004768371),
                        target = vector4(-22.28590011596679, 5.87029981613159, 501.04339599609375, 0)
                    },
                    {
                        options = {
                            {
                                type = 'shower',
                                waterUsage = 120000,
                                targetIcon = 'fa-solid fa-shower',
                                coords = {
                                    player = vector4(-19.94039916992187, 2.79469990730285, 499.543701171875, 308.3371887207031),
                                    particles = vector3(-19.97929954528808, 2.86380004882812, 502.0429992675781)
                                },
                                timeUsage = 10000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(2.20000410079956, 1.56999993324279, 2.65001416206359),
                        target = vector4(-20.48480033874511, 2.85150003433227, 502.0682067871094, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/max_luxury_apartv2uf.webp'},
            },
    
            ['small_house1'] = {
                tags = {'furnished', 'maxcreations'},
    
                label = 'Max Small House',
                model = 'small_house1',
                rooms = 0,
                
                doors = vector4(2.5373, 7.2708, 498.6359, 181.1062),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-6.22289991378784, -16.38990020751953, 498.3345947265625, 102.68599700927736),
                                    particles = vector3(-7.02860021591186, -16.57839965820312, 499.4346008300781)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-6.22580003738403, -16.4064998626709, 498.3346862792969, 104.81600189208984),
                                    particles = vector3(-7.03070020675659, -16.57789993286132, 499.4346923828125)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.12000036239624, 1.5, 1.20000004768371),
                        target = vector4(-6.9390001296997, -16.34180068969726, 499.8330993652344, 16)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/small_house1.webp'},
            },
    
            ['max_luxury_apartv2'] = {
                tags = {'furnished', 'maxcreations'},
    
                label = 'Max Luxury Apartment',
                model = 'max_luxury_apartv2',
                rooms = 0,
                
                doors = vector4(-10.6831, 1.6827, 499.5171, 359.6198),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-22.67060089111328, 5.32859992980957, 499.5173034667969, 358.44281005859375),
                                    particles = vector3(-22.63689994812011, 5.95160007476806, 500.6773986816406)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-22.70569992065429, 5.34340000152587, 499.5172119140625, 2.88000011444091),
                                    particles = vector3(-22.64179992675781, 5.95559978485107, 500.67718505859375)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(2.295006275177, 0.85500061511993, 1.20000004768371),
                        target = vector4(-22.32649993896484, 6.0479998588562, 501.04339599609375, 0)
                    },
                    {
                        options = {
                            {
                                type = 'shower',
                                waterUsage = 120000,
                                targetIcon = 'fa-solid fa-shower',
                                coords = {
                                    player = vector4(-20.16850090026855, 2.9491000175476, 499.543701171875, 234.0738983154297),
                                    particles = vector3(-19.94449996948242, 2.86010003089904, 502.0364990234375)
                                },
                                timeUsage = 10000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(2.21000432968139, 1.59499990940094, 2.5950129032135),
                        target = vector4(-20.46369934082031, 2.88579988479614, 502.0407104492188, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/max_luxury_apartv2.webp'},
            },
    
            ['maxcreations_mediumend'] = {
                tags = {'furnished', 'maxcreations'},
    
                label = 'Max Medium End',
                model = 'maxcreations_mediumend',
                rooms = 0,
                
                doors = vector4(3.0309, -2.7062, 498.6027, 358.1617),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-2.8882999420166, -7.12150001525878, 498.6097106933594, 92.27649688720705),
                                    particles = vector3(-3.61269998550415, -7.14879989624023, 499.8099060058594)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-2.89520001411438, -7.14909982681274, 498.6095886230469, 92.93900299072266),
                                    particles = vector3(-3.60630011558532, -7.14799976348876, 499.7897033691406)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.05500042438507, 1.5, 1.20000004768371),
                        target = vector4(-3.57999992370605, -7.29500007629394, 500.14410400390625, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-2.91709995269775, 2.62560009956359, 498.6546020507813, 84.42739868164062),
                                    particles = vector3(-3.58610010147094, 2.57200002670288, 499.59478759765625)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-2.92610001564025, 2.60660004615783, 498.6546020507813, 89.31109619140625),
                                    particles = vector3(-3.57870006561279, 2.58080005645751, 499.61480712890625)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.77500069141387, 0.83000063896179, 1.20000004768371),
                        target = vector4(-3.53130006790161, 2.60349988937377, 499.9826965332031, 0)
                    },
                    {
                        options = {
                            {
                                type = 'shower',
                                waterUsage = 120000,
                                targetIcon = 'fa-solid fa-shower',
                                coords = {
                                    player = vector4(-3.34330010414123, 1.73489999771118, 498.78179931640625, 68.6968994140625),
                                    particles = vector3(-3.41890001296997, 1.78359997272491, 500.7333068847656)
                                },
                                timeUsage = 10000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(2.17500352859497, 0.91500055789947, 2.75001645088195),
                        target = vector4(-2.92239999771118, 1.61640000343322, 501.1571044921875, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/maxcreations_mediumend.webp'},
            },
    
            ['maxcreations_small'] = {
                tags = {'empty', 'maxcreations'},
    
                label = 'Max Small',
                model = 'maxcreations_small',
                rooms = 0,
                
                doors = vector4(2.5524, 2.9765, 498.6089, 177.3318),
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/maxcreations_small.webp'},
            },
    
            ['shell_mansion1'] = {
                tags = {'empty', 'maxcreations'},
    
                label = 'Max Mansion',
                model = 'shell_mansion1',
                rooms = 0,
                
                doors = vector4(-1.458, 16.5009, 495.3076, 179.0195),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(9.87240028381347, -4.90889978408813, 495.3122863769531, 267.1701965332031),
                                    particles = vector3(10.67800045013427, -4.93739986419677, 496.60009765625)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(9.89099979400634, -4.93590021133422, 495.34820556640625, 267.60760498046875),
                                    particles = vector3(10.66950035095214, -4.93289995193481, 496.5885925292969)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.35500013828277, 1.52999997138977, 1.20000004768371),
                        target = vector4(10.59399986267089, -4.92220020294189, 496.8642883300781, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-16.76149940490722, 1.80280005931854, 499.8902893066406, 0.79890000820159),
                                    particles = vector3(-16.77519989013672, 2.43720006942749, 500.8904113769531)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-16.76359939575195, 1.73790001869201, 499.89019775390625, 359.00408935546875),
                                    particles = vector3(-16.77680015563965, 2.43790006637573, 500.8904113769531)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.92500054836273, 0.93500053882598, 1.20000004768371),
                        target = vector4(-16.81669998168945, 2.48920011520385, 501.2337036132813, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-15.49590015411377, 1.77020001411437, 499.8904113769531, 0.76660001277923),
                                    particles = vector3(-15.5201997756958, 2.44190001487731, 500.8904113769531)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-15.47710037231445, 1.80139994621276, 499.8904113769531, 0.80930000543594),
                                    particles = vector3(-15.52779960632324, 2.43829989433288, 500.8905944824219)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.8500006198883, 0.87500059604644, 1.20000004768371),
                        target = vector4(-15.55420017242431, 2.49200010299682, 501.2337036132813, 0)
                    },
                    {
                        options = {
                            {
                                type = 'shower',
                                waterUsage = 120000,
                                targetIcon = 'fa-solid fa-shower',
                                coords = {
                                    player = vector4(-19.17659950256347, 2.05529999732971, 499.9359130859375, 350.7296142578125),
                                    particles = vector3(-19.09539985656738, 2.31900000572204, 502.2869873046875)
                                },
                                timeUsage = 10000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.4300000667572, 2.15000295639038, 2.5400116443634),
                        target = vector4(-19.07159996032715, 1.69930005073547, 502.4053955078125, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_mansion1.webp'},
            },
    
            ['unfurnished_shell'] = {
                tags = {'empty', 'maxcreations'},
    
                label = 'Max Unfurnished Shell',
                model = 'unfurnished_shell',
                rooms = 0,
                
                doors = vector4(-2.6462, 7.0106, 502.1597, 176.5937),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(6.31209993362426, 1.18439996242523, 502.1693115234375, 276.2806091308594),
                                    particles = vector3(6.96379995346069, 1.17359995841979, 503.3750915527344)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(6.33199977874755, 1.2150000333786, 502.1809997558594, 271.9317016601563),
                                    particles = vector3(6.96560001373291, 1.1690000295639, 503.38079833984375)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.88000059127807, 1.41000008583068, 1.20000004768371),
                        target = vector4(6.98799991607666, 0.9937999844551, 503.7857971191406, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(6.48029994964599, 0.29449999332427, 498.3595886230469, 357.4118957519531),
                                    particles = vector3(6.50579977035522, 1.00479996204376, 499.3471984863281)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(6.50689983367919, 0.31380000710487, 498.3505859375, 358.4425964355469),
                                    particles = vector3(6.50120019912719, 1.00419998168945, 499.3396911621094)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.95000052452087, 1.04500043392181, 1.20000004768371),
                        target = vector4(6.5177001953125, 1.09409999847412, 499.6841125488281, 0)
                    },
                    {
                        options = {
                            {
                                type = 'shower',
                                waterUsage = 120000,
                                targetIcon = 'fa-solid fa-shower',
                                coords = {
                                    player = vector4(2.67639994621276, -4.56790018081665, 498.3734130859375, 166.9127960205078),
                                    particles = vector3(2.66039991378784, -4.9067997932434, 501.3096008300781)
                                },
                                timeUsage = 10000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(3.10502481460571, 1.74499976634979, 2.96502137184143),
                        target = vector4(2.66409993171691, -4.79400014877319, 501.2551879882813, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/unfurnished_shell.webp'},
            },
    
            ['newunfurnished_shell'] = {
                tags = {'empty', 'maxcreations'},
    
                label = 'Max New Unfurnished Shell',
                model = 'newunfurnished_shell',
                rooms = 0,
                
                doors = vector4(-17.0874, -6.0685, 500.7999, 274.1831),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-3.1201000213623, -5.87279987335205, 500.2001037597656, 175.73159790039065),
                                    particles = vector3(-3.16350007057189, -6.57800006866455, 501.5002136230469)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-3.11159992218017, -5.88399982452392, 500.2001037597656, 181.1071014404297),
                                    particles = vector3(-3.16580009460449, -6.58010005950927, 501.5000915527344)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.5, 1.5, 1.20000004768371),
                        target = vector4(-3.17969989776611, -6.67259979248046, 501.815185546875, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-2.59960007667541, 17.06110000610351, 503.6005859375, 88.90190124511719),
                                    particles = vector3(-3.27360010147094, 17.035400390625, 504.6023864746094)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-2.56640005111694, 17.02039909362793, 503.6005859375, 93.20800018310548),
                                    particles = vector3(-3.26869988441467, 17.0359992980957, 504.6007080078125)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.73000073432922, 0.97000050544738, 1.20000004768371),
                        target = vector4(-3.22830009460449, 17.05089950561523, 505.1145935058594, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-2.55509996414184, 18.44680023193359, 503.6004028320313, 89.21720123291016),
                                    particles = vector3(-3.26620006561279, 18.45999908447265, 504.6005859375)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-2.55279994010925, 18.44560050964355, 503.6005859375, 89.71410369873047),
                                    particles = vector3(-3.26799988746643, 18.46940040588379, 504.6004943847656)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.71500074863433, 0.77000069618225, 1.20000004768371),
                        target = vector4(-3.22830009460449, 18.43910026550293, 505.194091796875, 0)
                    },
                    {
                        options = {
                            {
                                type = 'shower',
                                waterUsage = 120000,
                                targetIcon = 'fa-solid fa-shower',
                                coords = {
                                    player = vector4(0.71640002727508, 16.09429931640625, 503.6603088378906, 188.12539672851565),
                                    particles = vector3(0.77240002155303, 16.00160026550293, 505.9999084472656)
                                },
                                timeUsage = 10000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.5, 2.01499986648559, 2.96002125740051),
                        target = vector4(0.79919999837875, 16.58149909973144, 506.539794921875, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/newunfurnished_shell.webp'},
            },
    
            ['lc_appartmentuf'] = {
                tags = {'empty', 'maxcreations'},
    
                label = 'Max LC Apartment',
                model = 'lc_appartmentuf',
                rooms = 0,
                
                doors = vector4(10.2215, -0.8589, 495.9036, 90.112),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-3.63429999351501, -5.85109996795654, 495.9039001464844, 175.11599731445312),
                                    particles = vector3(-3.71979999542236, -6.66130018234252, 497.2438049316406)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-3.76769995689392, -5.85820007324218, 495.9039001464844, 173.85780334472656),
                                    particles = vector3(-3.71320009231567, -6.65880012512207, 497.2438049316406)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.5, 1.5, 1.20000004768371),
                        target = vector4(-3.75929999351501, -6.83820009231567, 497.35009765625, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/lc_appartmentuf.webp'},
            },
    
            ['loft_shell1uf'] = {
                tags = {'empty', 'maxcreations'},
    
                label = 'Max Loft Shell',
                model = 'loft_shell1uf',
                rooms = 0,
                
                doors = vector4(-1.4108, 9.1366, 500.0289, 182.0593),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(3.65229988098144, 11.35449981689453, 503.6488037109375, 89.36160278320312),
                                    particles = vector3(2.45770001411438, 11.37180042266845, 504.768798828125)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(3.65339994430542, 11.37559986114502, 503.6488952636719, 90.19550323486328),
                                    particles = vector3(2.45819997787475, 11.37469959259033, 504.7489013671875)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.5, 1.5, 1.20000004768371),
                        target = vector4(2.56550002098083, 11.41860008239746, 505.09429931640625, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(8.62310028076171, 4.92649984359741, 500.03179931640625, 91.6552963256836),
                                    particles = vector3(7.71649980545043, 4.96460008621215, 501.1697082519531)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(8.69719982147216, 4.92119979858398, 500.0346984863281, 89.7311019897461),
                                    particles = vector3(7.71589994430542, 4.96129989624023, 501.1716918945313)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.5, 1.5, 1.20000004768371),
                        target = vector4(7.90259981155395, 5.10519981384277, 501.5750122070313, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/loft_shell1uf.webp'},
            },
    
            ['customloft_shell2uf'] = {
                tags = {'furnished', 'maxcreations'},
    
                label = 'Max Custom Loft 2',
                model = 'customloft_shell2uf',
                rooms = 0,
                
                doors = vector4(2.1908, -6.3337, 499.7136, 3.7096),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(1.39970004558563, 3.54749989509582, 499.7175903320313, 94.75959777832033),
                                    particles = vector3(0.63389998674392, 3.50950002670288, 500.8742980957031)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(1.40439999103546, 3.5518000125885, 499.7175903320313, 89.2876968383789),
                                    particles = vector3(0.63090002536773, 3.50300002098083, 500.8741149902344)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.5, 1.5, 1.20000004768371),
                        target = vector4(0.50129997730255, 3.14869999885559, 501.2156982421875, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(12.76060009002685, 14.59399986267089, 503.6018981933594, 270.0042114257813),
                                    particles = vector3(13.95699977874755, 14.58899974822998, 504.7619018554688)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(12.77140045166015, 14.61040019989013, 503.6018981933594, 269.49798583984375),
                                    particles = vector3(13.9576997756958, 14.59560012817382, 504.7619018554688)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.5, 1.5, 1.20000004768371),
                        target = vector4(13.87310028076171, 14.52499961853027, 505.09429931640625, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/customloft_shell2uf.webp'},
            },
    
            ['max_row_houseuf'] = {
                tags = {'empty', 'maxcreations'},
    
                label = 'Max Row House',
                model = 'max_row_houseuf',
                rooms = 0,
                
                doors = vector4(-2.5291, -7.3515, 499.5576, 1.8999),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-3.11770009994506, 6.48689985275268, 499.5574951171875, 78.83429718017578),
                                    particles = vector3(-3.73219990730285, 6.55740022659301, 500.5054931640625)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-3.2014000415802, 6.50220012664794, 499.56451416015625, 88.08899688720703),
                                    particles = vector3(-3.72970008850097, 6.55049991607666, 500.47760009765625)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.28500020503997, 1.5, 1.20000004768371),
                        target = vector4(-3.86339998245239, 6.55749988555908, 500.8174133300781, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-2.16199994087219, -6.185800075531, 502.84381103515625, 182.41769409179688),
                                    particles = vector3(-2.16090011596679, -6.84000015258789, 503.81500244140625)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-2.1537001132965, -6.1958999633789, 502.8428039550781, 178.9333038330078),
                                    particles = vector3(-2.16269993782043, -6.84270000457763, 503.7984924316406)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.9550005197525, 1.00000047683715, 1.20000004768371),
                        target = vector4(-2.1819999217987, -6.83510017395019, 504.1784973144531, 0)
                    },
                    {
                        options = {
                            {
                                type = 'shower',
                                waterUsage = 120000,
                                targetIcon = 'fa-solid fa-shower',
                                coords = {
                                    player = vector4(-1.19980001449584, -6.52010011672973, 502.96868896484375, 133.30990600585938),
                                    particles = vector3(-1.35350000858306, -6.65929985046386, 504.8976135253906)
                                },
                                timeUsage = 10000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.32000017166137, 2.12500238418579, 2.4300091266632),
                        target = vector4(-1.00769996643066, -6.0595998764038, 505.1806945800781, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/max_row_houseuf.webp'},
            },
    
            ['shell_apart1'] = {
                tags = {'empty', 'maxcreations'},
    
                label = 'Mex Apartment #1',
                model = 'shell_apart1',
                rooms = 0,
                
                doors = vector4(3.6418, -7.5152, 504.3, 87.8517),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-4.03310012817382, 3.66829991340637, 504.30169677734375, 91.61940002441406),
                                    particles = vector3(-4.94229984283447, 3.67179989814758, 505.58160400390625)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-4.07009983062744, 3.64299988746643, 504.30169677734375, 91.66639709472656),
                                    particles = vector3(-4.94329977035522, 3.66880011558532, 505.58160400390625)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.33000016212463, 1.71499979496002, 1.20000004768371),
                        target = vector4(-5.0809998512268, 3.45970010757446, 505.68310546875, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-4.3225998878479, -3.63960003852844, 500.039794921875, 180.92320251464844),
                                    particles = vector3(-4.30749988555908, -4.27129983901977, 500.9798889160156)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-4.30970001220703, -3.64030003547668, 500.0423889160156, 177.7068023681641),
                                    particles = vector3(-4.30539989471435, -4.27829980850219, 500.95989990234375)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.94000053405761, 1.10000038146972, 1.20000004768371),
                        target = vector4(-4.31850004196167, -4.35010004043579, 501.2677917480469, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-3.02180004119873, -3.13150000572204, 508.58538818359375, 182.68490600585935),
                                    particles = vector3(-3.03279995918273, -3.76570010185241, 509.5241088867188)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-2.98250007629394, -3.04719996452331, 508.58538818359375, 180.80369567871097),
                                    particles = vector3(-3.02460002899169, -3.76900005340576, 509.5255126953125)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.75500071048736, 0.84000062942504, 1.20000004768371),
                        target = vector4(-3.02729988098144, -3.81389999389648, 509.8634948730469, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-1.56070005893707, -3.0848000049591, 508.5851135253906, 179.64599609375),
                                    particles = vector3(-1.60490000247955, -3.76430010795593, 509.5295104980469)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-1.58840000629425, -3.12389993667602, 508.585205078125, 178.35679626464844),
                                    particles = vector3(-1.59959995746612, -3.77049994468688, 509.5252990722656)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.7450007200241, 0.99500048160552, 1.20000004768371),
                        target = vector4(-1.58309996128082, -3.85240006446838, 509.9848937988281, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_apart1.webp'},
            },
    
            ['shell_apart2'] = {
                tags = {'empty', 'maxcreations'},
    
                label = 'Max Apartment #2',
                model = 'shell_apart2',
                rooms = 0,
                
                doors = vector4(-2.9925, 1.2169, 498.5242, 268.9977),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(5.9446997642517, -4.1156997680664, 498.53179931640625, 268.918212890625),
                                    particles = vector3(6.53550004959106, -4.11630010604858, 499.6853942871094)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(5.96750020980835, -4.12349987030029, 498.5260009765625, 267.6615905761719),
                                    particles = vector3(6.53599977493286, -4.10720014572143, 499.69189453125)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.80500066280364, 1.5, 1.20000004768371),
                        target = vector4(6.5329999923706, -4.12220001220703, 499.9700012207031, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-4.92560005187988, 8.19530010223388, 498.5169067382813, 87.88069915771484),
                                    particles = vector3(-5.55429983139038, 8.17879962921142, 499.5369873046875)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-4.90889978408813, 8.17930030822753, 498.5169067382813, 88.45089721679688),
                                    particles = vector3(-5.54829978942871, 8.17240047454834, 499.5369873046875)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.68500077724456, 0.89500057697296, 1.20000004768371),
                        target = vector4(-5.52670001983642, 8.17870044708252, 499.8633117675781, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-4.88259983062744, 6.89940023422241, 498.5165100097656, 87.20880126953125),
                                    particles = vector3(-5.55450010299682, 6.9212999343872, 499.5367126464844)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-4.90770006179809, 6.87599992752075, 498.5165100097656, 91.91419982910156),
                                    particles = vector3(-5.55140018463134, 6.92070007324218, 499.5166931152344)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.80500066280364, 0.75500071048736, 1.20000004768371),
                        target = vector4(-5.55679988861084, 6.93279981613159, 499.8633117675781, 0)
                    },
                    {
                        options = {
                            {
                                type = 'shower',
                                waterUsage = 120000,
                                targetIcon = 'fa-solid fa-shower',
                                coords = {
                                    player = vector4(-5.35319995880126, 4.22580003738403, 498.56549072265625, 36.0458984375),
                                    particles = vector3(-5.30730009078979, 4.30919981002807, 500.9367065429688)
                                },
                                timeUsage = 10000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(2.36500787734985, 1.40500009059906, 3.0700237751007),
                        target = vector4(-4.55700016021728, 4.34250020980835, 501.5, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(-2.64249992370605, 4.09819984436035, 501.9223937988281, 357.6080017089844),
                                    particles = vector3(-2.64079999923706, 4.76429986953735, 502.9223937988281)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(-2.63969993591308, 4.12989997863769, 501.9223937988281, 359.0174865722656),
                                    particles = vector3(-2.63759994506835, 4.75899982452392, 502.9224853515625)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.5, 1.5, 1.20000004768371),
                        target = vector4(-2.70840001106262, 4.85860013961792, 503.2616882324219, 0)
                    },
                    {
                        options = {
                            {
                                type = 'shower',
                                waterUsage = 120000,
                                targetIcon = 'fa-solid fa-shower',
                                coords = {
                                    player = vector4(1.62059998512268, 3.50239992141723, 501.964111328125, 178.03680419921875),
                                    particles = vector3(1.52849996089935, 3.29320001602172, 504.31500244140625)
                                },
                                timeUsage = 10000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(1.4300000667572, 2.3250069618225, 2.96002125740051),
                        target = vector4(1.48300004005432, 3.91070008277893, 504.843505859375, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_apart2.webp'},
            },
    
            ['shell_apart3'] = {
                tags = {'empty', 'maxcreations'},
    
                label = 'Max Apartment #3',
                model = 'shell_apart3',
                rooms = 0,
                
                doors = vector4(7.3098, -1.4577, 500.3115, 2.0413),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(11.07909965515136, 9.14120006561279, 504.4450073242188, 273.3359985351563),
                                    particles = vector3(11.69919967651367, 9.359299659729, 505.465087890625)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(11.06680011749267, 9.17220020294189, 504.4450073242188, 275.6622009277344),
                                    particles = vector3(11.70890045166015, 9.36670017242431, 505.4450988769531)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.77000069618225, 0.71000075340271, 1.20000004768371),
                        target = vector4(11.57900047302246, 9.18169975280761, 505.8781127929688, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(13.34949970245361, 10.94279956817627, 504.44830322265625, 177.7969970703125),
                                    particles = vector3(13.3253002166748, 10.39599990844726, 505.4258117675781)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(13.35890007019043, 10.99899959564209, 504.4455871582031, 175.6580047607422),
                                    particles = vector3(13.32900047302246, 10.39859962463378, 505.4258117675781)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.80500066280364, 0.63500082492828, 1.20000004768371),
                        target = vector4(13.36110019683837, 10.40999984741211, 505.80670166015625, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_apart3.webp'},
            },
    
            ['shell_modernapart'] = {
                tags = {'empty', 'maxcreations'},
    
                label = 'Max Modern Apartment',
                model = 'shell_modernapart',
                rooms = 0,
                
                doors = vector4(-6.6678, 0.8009, 497.128, 272.771),
    
                interactable = {
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(16.35589981079101, 12.35809993743896, 497.1361999511719, 356.9833984375),
                                    particles = vector3(16.33009910583496, 13.08549976348877, 498.3109130859375)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(16.36829948425293, 12.34409999847412, 497.13128662109375, 358.5415954589844),
                                    particles = vector3(16.33119964599609, 13.08150005340576, 498.3161926269531)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.89500057697296, 0.92500054836273, 1.20000004768371),
                        target = vector4(16.30979919433593, 13.11330032348632, 498.64849853515625, 0)
                    },
                    {
                        options = {
                            {
                                type = 'sink_drink',
                                waterUsage = 300,
                                targetIcon = 'fa-solid fa-glass-water-droplet',
                                coords = {
                                    player = vector4(14.69579982757568, 12.34020042419433, 497.1290893554688, 357.9267883300781),
                                    particles = vector3(14.71100044250488, 13.08040046691894, 498.3093872070313)
                                },
                                timeUsage = 5000,
                                billType = 'water'
                            },
                            {
                                type = 'sink',
                                waterUsage = 5000,
                                targetIcon = 'fa-solid fa-sink',
                                coords = {
                                    player = vector4(14.69279956817627, 12.37600040435791, 497.13720703125, 359.0281982421875),
                                    particles = vector3(14.70960044860839, 13.08090019226074, 498.3091125488281)
                                },
                                timeUsage = 7000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(0.89500057697296, 0.9900004863739, 1.20000004768371),
                        target = vector4(14.66419982910156, 13.18019962310791, 498.6476135253906, 0)
                    },
                    {
                        options = {
                            {
                                type = 'shower',
                                waterUsage = 120000,
                                targetIcon = 'fa-solid fa-shower',
                                coords = {
                                    player = vector4(7.92999982833862, 12.16709995269775, 497.1195983886719, 279.0921020507813),
                                    particles = vector3(8.18599987030029, 12.1943998336792, 500.0296020507813)
                                },
                                timeUsage = 10000,
                                billType = 'water'
                            }
                        },
                        targetSize = vector3(2.76501703262329, 2.40500879287719, 2.98002171516418),
                        target = vector4(7.28599977493286, 12.25279998779296, 500.01080322265625, 0)
                    }
                },
    
                images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_modernapart.webp'},
            },
        }
        
        addShells(shells)
    end
end)