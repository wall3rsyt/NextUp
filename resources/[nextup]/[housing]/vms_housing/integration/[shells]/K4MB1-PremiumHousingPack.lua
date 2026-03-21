CreateThread(function()
    Wait(1000)
    
    if not Config.Shells.K4MB1_PremiumHousingPack then return end
    
    if Config.Shells.K4MB1_AllShellsSubPack then
        return warn(("^3You cannot have ^1%s^3 and ^1%s^3 running at the same time.^7"):format('K4MB1_PremiumHousingPack', 'K4MB1-AllShellsSubPack'))
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
        ['k4_mansion_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Mansion 1',
            model = 'k4_richman1_shell',
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
            model = 'k4_richman2_shell',
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
            model = 'k4_richman3_shell',
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
        ['vinewood_housing3_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Vinewood Housing 3',
            model = 'k4_vwhouse1_shell',
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
        ['vinewood_housing2_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Vinewood Housing 2',
            model = 'k4_vwhouse2_shell',
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
        ['classichouse_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Classic House 1',
            model = 'k4_classic1_shell',
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
            model = 'k4_classic2_shell',
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
            model = 'k4_classic3_shell',
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
        ['k4mb1_classic4_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Classic 4',
            model = 'k4_classic4_shell',
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
            model = 'k4_classic5_shell',
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
            model = 'k4_classic6_shell',
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
        ['Vinewood_housing1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},

            label = 'Vinewood Mansion',
            model = 'k4_vwmansion1_shell',
            rooms = 0,
            
            doors = vector4(11.0944, -2.8169, 496.6322, 180.5626),

            interactable = {
                {
                    options = {
                        {
                            timeUsage = 5000,
                            coords = {
                                player = vector4(-0.55479997396469, 21.82559967041015, 494.5006103515625, 270.5361938476563),
                                particles = vector3(0.25080001354217, 21.82979965209961, 495.7806091308594)
                            },
                            billType = 'water',
                            type = 'sink_drink',
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            waterUsage = 300
                        },
                        {
                            timeUsage = 7000,
                            coords = {
                                player = vector4(-0.55150002241134, 21.84070014953613, 494.5007019042969, 270.9342041015625),
                                particles = vector3(0.25, 21.82699966430664, 495.7806091308594)
                            },
                            billType = 'water',
                            type = 'sink',
                            targetIcon = 'fa-solid fa-sink',
                            waterUsage = 5000
                        }
                    },
                    target = vector4(0.23270000517368, 21.8302001953125, 496.05218505859375, 0),
                    targetSize = vector3(1.07500040531158, 1.66499984264373, 1.20000004768371)
                }
            },

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_vwmansion1_shell.png'},
        },

    }
    
    addShells(shells)
end)
