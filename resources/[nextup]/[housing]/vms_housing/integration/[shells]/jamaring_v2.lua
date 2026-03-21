CreateThread(function()
    Wait(1000)

    if not Config.Shells.JamaringMapsShellsV2 then return end
    
    local shells = {
        ['jamaring_rose_girlypop'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Rose 1 (V2)',
            model = 'jamaring_rose_girlypop',
            rooms = 0,
            
            doors = vector4(0.0451, 0.2534, 499.9614, 178.741),
    
            interactable = {
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(-7.5265998840332, -3.94199991226196, 501.3839111328125, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-7.38590002059936, -3.91020011901855, 501.1017150878906),
                                player = vector4(-6.59600019454956, -3.92230010032653, 499.9616088867188, 89.40049743652344)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-7.38590002059936, -3.91020011901855, 501.1017150878906),
                                player = vector4(-6.59600019454956, -3.92230010032653, 499.9616088867188, 89.40049743652344)
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
                    targetSize = vector3(0.91000056266784, 0.78500068187713, 1.20000004768371),
                    target = vector4(-10.33990001678466, -3.2716999053955, 504.6003112792969, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-10.38609981536865, -3.26999998092651, 504.4323120117188),
                                player = vector4(-9.66399955749511, -3.27220010757446, 503.3122863769531, 88.0896987915039)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-10.38609981536865, -3.26999998092651, 504.4323120117188),
                                player = vector4(-9.66399955749511, -3.27220010757446, 503.3122863769531, 88.0896987915039)
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
                    targetSize = vector3(1.15500032901763, 0.76500070095062, 1.20000004768371),
                    target = vector4(-10.43019962310791, -4.34270000457763, 504.6590881347656, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-10.37240028381347, -4.32980012893676, 504.4323120117188),
                                player = vector4(-9.65810012817382, -4.3422999382019, 503.3122863769531, 85.75340270996094)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-10.37240028381347, -4.32980012893676, 504.4323120117188),
                                player = vector4(-9.65810012817382, -4.3422999382019, 503.3122863769531, 85.75340270996094)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_rose_girlypop.png'},
        },
        ['jamaring_rose_girlypop2'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Rose 2 (V2)',
            model = 'jamaring_rose_girlypop2',
            rooms = 0,
            
            doors = vector4(0.0451, 0.2534, 499.9614, 178.741),
    
            interactable = {
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(-7.5265998840332, -3.94199991226196, 501.3839111328125, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-7.38590002059936, -3.91020011901855, 501.1017150878906),
                                player = vector4(-6.59600019454956, -3.92230010032653, 499.9616088867188, 89.40049743652344)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-7.38590002059936, -3.91020011901855, 501.1017150878906),
                                player = vector4(-6.59600019454956, -3.92230010032653, 499.9616088867188, 89.40049743652344)
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
                    targetSize = vector3(0.91000056266784, 0.78500068187713, 1.20000004768371),
                    target = vector4(-10.33990001678466, -3.2716999053955, 504.6003112792969, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-10.38609981536865, -3.26999998092651, 504.4323120117188),
                                player = vector4(-9.66399955749511, -3.27220010757446, 503.3122863769531, 88.0896987915039)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-10.38609981536865, -3.26999998092651, 504.4323120117188),
                                player = vector4(-9.66399955749511, -3.27220010757446, 503.3122863769531, 88.0896987915039)
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
                    targetSize = vector3(1.15500032901763, 0.76500070095062, 1.20000004768371),
                    target = vector4(-10.43019962310791, -4.34270000457763, 504.6590881347656, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-10.37240028381347, -4.32980012893676, 504.4323120117188),
                                player = vector4(-9.65810012817382, -4.3422999382019, 503.3122863769531, 85.75340270996094)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-10.37240028381347, -4.32980012893676, 504.4323120117188),
                                player = vector4(-9.65810012817382, -4.3422999382019, 503.3122863769531, 85.75340270996094)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_rose_girlypop2.png'},
        },
        ['jamaring_rose_girlypop3'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Rose 3 (V2)',
            model = 'jamaring_rose_girlypop3',
            rooms = 0,
            
            doors = vector4(0.0451, 0.2534, 499.9614, 178.741),
    
            interactable = {
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(-7.5265998840332, -3.94199991226196, 501.3839111328125, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-7.38590002059936, -3.91020011901855, 501.1017150878906),
                                player = vector4(-6.59600019454956, -3.92230010032653, 499.9616088867188, 89.40049743652344)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-7.38590002059936, -3.91020011901855, 501.1017150878906),
                                player = vector4(-6.59600019454956, -3.92230010032653, 499.9616088867188, 89.40049743652344)
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
                    targetSize = vector3(0.91000056266784, 0.78500068187713, 1.20000004768371),
                    target = vector4(-10.33990001678466, -3.2716999053955, 504.6003112792969, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-10.38609981536865, -3.26999998092651, 504.4323120117188),
                                player = vector4(-9.66399955749511, -3.27220010757446, 503.3122863769531, 88.0896987915039)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-10.38609981536865, -3.26999998092651, 504.4323120117188),
                                player = vector4(-9.66399955749511, -3.27220010757446, 503.3122863769531, 88.0896987915039)
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
                    targetSize = vector3(1.15500032901763, 0.76500070095062, 1.20000004768371),
                    target = vector4(-10.43019962310791, -4.34270000457763, 504.6590881347656, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-10.37240028381347, -4.32980012893676, 504.4323120117188),
                                player = vector4(-9.65810012817382, -4.3422999382019, 503.3122863769531, 85.75340270996094)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-10.37240028381347, -4.32980012893676, 504.4323120117188),
                                player = vector4(-9.65810012817382, -4.3422999382019, 503.3122863769531, 85.75340270996094)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_rose_girlypop3.png'},
        },
        ['jamaring_rose_girlypop4'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Rose 4 (V2)',
            model = 'jamaring_rose_girlypop4',
            rooms = 0,
            
            doors = vector4(0.0451, 0.2534, 499.9614, 178.741),
    
            interactable = {
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(-7.5265998840332, -3.94199991226196, 501.3839111328125, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-7.38590002059936, -3.91020011901855, 501.1017150878906),
                                player = vector4(-6.59600019454956, -3.92230010032653, 499.9616088867188, 89.40049743652344)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-7.38590002059936, -3.91020011901855, 501.1017150878906),
                                player = vector4(-6.59600019454956, -3.92230010032653, 499.9616088867188, 89.40049743652344)
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
                    targetSize = vector3(0.91000056266784, 0.78500068187713, 1.20000004768371),
                    target = vector4(-10.33990001678466, -3.2716999053955, 504.6003112792969, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-10.38609981536865, -3.26999998092651, 504.4323120117188),
                                player = vector4(-9.66399955749511, -3.27220010757446, 503.3122863769531, 88.0896987915039)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-10.38609981536865, -3.26999998092651, 504.4323120117188),
                                player = vector4(-9.66399955749511, -3.27220010757446, 503.3122863769531, 88.0896987915039)
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
                    targetSize = vector3(1.15500032901763, 0.76500070095062, 1.20000004768371),
                    target = vector4(-10.43019962310791, -4.34270000457763, 504.6590881347656, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-10.37240028381347, -4.32980012893676, 504.4323120117188),
                                player = vector4(-9.65810012817382, -4.3422999382019, 503.3122863769531, 85.75340270996094)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-10.37240028381347, -4.32980012893676, 504.4323120117188),
                                player = vector4(-9.65810012817382, -4.3422999382019, 503.3122863769531, 85.75340270996094)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_rose_girlypop4.png'},
        },
        ['jamaring_rose_girlypop5'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Rose 5 (V2)',
            model = 'jamaring_rose_girlypop5',
            rooms = 0,
            
            doors = vector4(0.0451, 0.2534, 499.9614, 178.741),
    
            interactable = {
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(-7.5265998840332, -3.94199991226196, 501.3839111328125, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-7.38590002059936, -3.91020011901855, 501.1017150878906),
                                player = vector4(-6.59600019454956, -3.92230010032653, 499.9616088867188, 89.40049743652344)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-7.38590002059936, -3.91020011901855, 501.1017150878906),
                                player = vector4(-6.59600019454956, -3.92230010032653, 499.9616088867188, 89.40049743652344)
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
                    targetSize = vector3(0.91000056266784, 0.78500068187713, 1.20000004768371),
                    target = vector4(-10.33990001678466, -3.2716999053955, 504.6003112792969, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-10.38609981536865, -3.26999998092651, 504.4323120117188),
                                player = vector4(-9.66399955749511, -3.27220010757446, 503.3122863769531, 88.0896987915039)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-10.38609981536865, -3.26999998092651, 504.4323120117188),
                                player = vector4(-9.66399955749511, -3.27220010757446, 503.3122863769531, 88.0896987915039)
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
                    targetSize = vector3(1.15500032901763, 0.76500070095062, 1.20000004768371),
                    target = vector4(-10.43019962310791, -4.34270000457763, 504.6590881347656, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-10.37240028381347, -4.32980012893676, 504.4323120117188),
                                player = vector4(-9.65810012817382, -4.3422999382019, 503.3122863769531, 85.75340270996094)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-10.37240028381347, -4.32980012893676, 504.4323120117188),
                                player = vector4(-9.65810012817382, -4.3422999382019, 503.3122863769531, 85.75340270996094)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_rose_girlypop5.png'},
        },
        ['jamaring_rose_girlypop6'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Rose 6 (V2)',
            model = 'jamaring_rose_girlypop6',
            rooms = 0,
            
            doors = vector4(0.0451, 0.2534, 499.9614, 178.741),
    
            interactable = {
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(-7.5265998840332, -3.94199991226196, 501.3839111328125, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-7.38590002059936, -3.91020011901855, 501.1017150878906),
                                player = vector4(-6.59600019454956, -3.92230010032653, 499.9616088867188, 89.40049743652344)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-7.38590002059936, -3.91020011901855, 501.1017150878906),
                                player = vector4(-6.59600019454956, -3.92230010032653, 499.9616088867188, 89.40049743652344)
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
                    targetSize = vector3(0.91000056266784, 0.78500068187713, 1.20000004768371),
                    target = vector4(-10.33990001678466, -3.2716999053955, 504.6003112792969, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-10.38609981536865, -3.26999998092651, 504.4323120117188),
                                player = vector4(-9.66399955749511, -3.27220010757446, 503.3122863769531, 88.0896987915039)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-10.38609981536865, -3.26999998092651, 504.4323120117188),
                                player = vector4(-9.66399955749511, -3.27220010757446, 503.3122863769531, 88.0896987915039)
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
                    targetSize = vector3(1.15500032901763, 0.76500070095062, 1.20000004768371),
                    target = vector4(-10.43019962310791, -4.34270000457763, 504.6590881347656, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-10.37240028381347, -4.32980012893676, 504.4323120117188),
                                player = vector4(-9.65810012817382, -4.3422999382019, 503.3122863769531, 85.75340270996094)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-10.37240028381347, -4.32980012893676, 504.4323120117188),
                                player = vector4(-9.65810012817382, -4.3422999382019, 503.3122863769531, 85.75340270996094)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_rose_girlypop6.png'},
        },
        ['jamaring_rose_girlypop7'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Rose 7 (V2)',
            model = 'jamaring_rose_girlypop7',
            rooms = 0,
            
            doors = vector4(0.0451, 0.2534, 499.9614, 178.741),
    
            interactable = {
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(-7.5265998840332, -3.94199991226196, 501.3839111328125, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-7.38590002059936, -3.91020011901855, 501.1017150878906),
                                player = vector4(-6.59600019454956, -3.92230010032653, 499.9616088867188, 89.40049743652344)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-7.38590002059936, -3.91020011901855, 501.1017150878906),
                                player = vector4(-6.59600019454956, -3.92230010032653, 499.9616088867188, 89.40049743652344)
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
                    targetSize = vector3(0.91000056266784, 0.78500068187713, 1.20000004768371),
                    target = vector4(-10.33990001678466, -3.2716999053955, 504.6003112792969, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-10.38609981536865, -3.26999998092651, 504.4323120117188),
                                player = vector4(-9.66399955749511, -3.27220010757446, 503.3122863769531, 88.0896987915039)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-10.38609981536865, -3.26999998092651, 504.4323120117188),
                                player = vector4(-9.66399955749511, -3.27220010757446, 503.3122863769531, 88.0896987915039)
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
                    targetSize = vector3(1.15500032901763, 0.76500070095062, 1.20000004768371),
                    target = vector4(-10.43019962310791, -4.34270000457763, 504.6590881347656, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-10.37240028381347, -4.32980012893676, 504.4323120117188),
                                player = vector4(-9.65810012817382, -4.3422999382019, 503.3122863769531, 85.75340270996094)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-10.37240028381347, -4.32980012893676, 504.4323120117188),
                                player = vector4(-9.65810012817382, -4.3422999382019, 503.3122863769531, 85.75340270996094)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_rose_girlypop7.png'},
        },
        ['jamaring_rose_girlypop8'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Rose 8 (V2)',
            model = 'jamaring_rose_girlypop8',
            rooms = 0,
            
            doors = vector4(0.0451, 0.2534, 499.9614, 178.741),
    
            interactable = {
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(-7.5265998840332, -3.94199991226196, 501.3839111328125, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-7.38590002059936, -3.91020011901855, 501.1017150878906),
                                player = vector4(-6.59600019454956, -3.92230010032653, 499.9616088867188, 89.40049743652344)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-7.38590002059936, -3.91020011901855, 501.1017150878906),
                                player = vector4(-6.59600019454956, -3.92230010032653, 499.9616088867188, 89.40049743652344)
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
                    targetSize = vector3(0.91000056266784, 0.78500068187713, 1.20000004768371),
                    target = vector4(-10.33990001678466, -3.2716999053955, 504.6003112792969, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-10.38609981536865, -3.26999998092651, 504.4323120117188),
                                player = vector4(-9.66399955749511, -3.27220010757446, 503.3122863769531, 88.0896987915039)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-10.38609981536865, -3.26999998092651, 504.4323120117188),
                                player = vector4(-9.66399955749511, -3.27220010757446, 503.3122863769531, 88.0896987915039)
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
                    targetSize = vector3(1.15500032901763, 0.76500070095062, 1.20000004768371),
                    target = vector4(-10.43019962310791, -4.34270000457763, 504.6590881347656, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-10.37240028381347, -4.32980012893676, 504.4323120117188),
                                player = vector4(-9.65810012817382, -4.3422999382019, 503.3122863769531, 85.75340270996094)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-10.37240028381347, -4.32980012893676, 504.4323120117188),
                                player = vector4(-9.65810012817382, -4.3422999382019, 503.3122863769531, 85.75340270996094)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_rose_girlypop8.png'},
        },
    }
    
    addShells(shells)
end)