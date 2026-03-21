CreateThread(function()
    Wait(1000)

    if not Config.Shells.JamaringMapsShellsV1 then return end
    
    local shells = {
        ['jamaring_shell1_dark'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Dark 1 (V1)',
            model = 'jamaring_shell1_dark',
            rooms = 4,
            
            doors = vector4(0.2343, 5.2022, 498.5312, 183.4593),
    
            interactable = {
                {
                    target = vector4(3.7648000717163, -7.86639976501464, 499.57861328125, 0),
                    targetSize = vector3(0.86000061035156, 0.7800006866455, 1.03000020980834),
                    options = {
                        {
                            coords = {
                                player = vector4(3.76729989051818, -7.31629991531372, 498.5314025878906, 180.1811981201172),
                                particles = vector3(3.77419996261596, -7.94829988479614, 499.3714904785156)
                            },
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            billType = 'water',
                            timeUsage = 5000,
                            waterUsage = 300,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                player = vector4(3.77819991111755, -7.23719978332519, 498.5314025878906, 181.8404998779297),
                                particles = vector3(3.77640008926391, -7.94770002365112, 499.3716125488281)
                            },
                            timeUsage = 7000,
                            targetIcon = "fa-solid fa-sink",
                            type = 'sink',
                            waterUsage = 5000, -- Mililiters
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shell1_dark.png'},
        },
        ['jamaring_shell1_light'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Light 1 (V1)',
            model = 'jamaring_shell1_light',
            rooms = 4,
            
            doors = vector4(0.2343, 5.2022, 498.5312, 183.4593),
    
            interactable = {
                {
                    target = vector4(3.7648000717163, -7.86639976501464, 499.57861328125, 0),
                    targetSize = vector3(0.86000061035156, 0.7800006866455, 1.03000020980834),
                    options = {
                        {
                            coords = {
                                player = vector4(3.76729989051818, -7.31629991531372, 498.5314025878906, 180.1811981201172),
                                particles = vector3(3.77419996261596, -7.94829988479614, 499.3714904785156)
                            },
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            billType = 'water',
                            timeUsage = 5000,
                            waterUsage = 300,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                player = vector4(3.77819991111755, -7.23719978332519, 498.5314025878906, 181.8404998779297),
                                particles = vector3(3.77640008926391, -7.94770002365112, 499.3716125488281)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shell1_light.png'},
        },
    
        ['jamaring_shell2_dark'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Dark 2 (V1)',
            model = 'jamaring_shell2_dark',
            rooms = 3,
            
            doors = vector4(-0.0505, 0.0349, 498.9698, 184.1328),
    
            interactable = {
                {
                    targetSize = vector3(1.40500009059906, 2.09000158309936, 3.11002469062805),
                    target = vector4(2.31229996681213, -18.71269989013672, 505.24468994140625, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(2.26620006561279, -18.13179969787597, 504.6668090820313),
                                player = vector4(2.28080010414123, -18.13260078430175, 502.289306640625, 328.2951965332031)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                },
                {
                    targetSize = vector3(0.72000074386596, 0.7800006866455, 1.20000004768371),
                    target = vector4(7.05830001831054, -19.20450019836425, 503.5024108886719, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(7.09240007400512, -19.21179962158203, 503.1885070800781),
                                player = vector4(6.47800016403198, -19.20669937133789, 502.24810791015625, 268.6940002441406)
                            },
                            waterUsage = 300,
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(7.09240007400512, -19.21179962158203, 503.1885070800781),
                                player = vector4(6.47800016403198, -19.20669937133789, 502.24810791015625, 268.6940002441406)
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
                    targetSize = vector3(0.70500075817108, 0.7800006866455, 1.20000004768371),
                    target = vector4(7.06199979782104, -20.62409973144531, 503.5024108886719, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(7.09009981155395, -20.64299964904785, 503.1684875488281),
                                player = vector4(6.41900014877319, -20.66959953308105, 502.2474060058594, 270.8528137207031)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(7.09009981155395, -20.64299964904785, 503.1684875488281),
                                player = vector4(6.41900014877319, -20.66959953308105, 502.2474060058594, 270.8528137207031)
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
                    targetSize = vector3(0.82500064373016, 1.34500014781951, 1.20000004768371),
                    target = vector4(9.66129970550537, -12.08129978179931, 500.293212890625, 0),
                    options = {
                        {
                            coords = {
                                particles = vector3(9.64500045776367, -11.92140007019043, 499.8976135253906),
                                player = vector4(9.0644998550415, -11.87189960479736, 498.7374877929688, 268.84271240234375)
                            },
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(9.64500045776367, -11.92140007019043, 499.8976135253906),
                                player = vector4(9.0644998550415, -11.87189960479736, 498.7374877929688, 268.84271240234375)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shell2_dark.png'},
        },
        ['jamaring_shell2_light'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Light 2 (V1)',
            model = 'jamaring_shell2_light',
            rooms = 3,
            
            doors = vector4(-0.0505, 0.0349, 498.9698, 184.1328),
    
            interactable = {
                {
                    targetSize = vector3(1.40500009059906, 2.09000158309936, 3.11002469062805),
                    target = vector4(2.31229996681213, -18.71269989013672, 505.24468994140625, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(2.26620006561279, -18.13179969787597, 504.6668090820313),
                                player = vector4(2.28080010414123, -18.13260078430175, 502.289306640625, 328.2951965332031)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                },
                {
                    targetSize = vector3(0.72000074386596, 0.7800006866455, 1.20000004768371),
                    target = vector4(7.05830001831054, -19.20450019836425, 503.5024108886719, 0),
                    options = {
                        {
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(7.09240007400512, -19.21179962158203, 503.1885070800781),
                                player = vector4(6.47800016403198, -19.20669937133789, 502.24810791015625, 268.6940002441406)
                            },
                            waterUsage = 300,
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(7.09240007400512, -19.21179962158203, 503.1885070800781),
                                player = vector4(6.47800016403198, -19.20669937133789, 502.24810791015625, 268.6940002441406)
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
                    targetSize = vector3(0.70500075817108, 0.7800006866455, 1.20000004768371),
                    target = vector4(7.06199979782104, -20.62409973144531, 503.5024108886719, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(7.09009981155395, -20.64299964904785, 503.1684875488281),
                                player = vector4(6.41900014877319, -20.66959953308105, 502.2474060058594, 270.8528137207031)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(7.09009981155395, -20.64299964904785, 503.1684875488281),
                                player = vector4(6.41900014877319, -20.66959953308105, 502.2474060058594, 270.8528137207031)
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
                    targetSize = vector3(0.82500064373016, 1.34500014781951, 1.20000004768371),
                    target = vector4(9.66129970550537, -12.08129978179931, 500.293212890625, 0),
                    options = {
                        {
                            coords = {
                                particles = vector3(9.64500045776367, -11.92140007019043, 499.8976135253906),
                                player = vector4(9.0644998550415, -11.87189960479736, 498.7374877929688, 268.84271240234375)
                            },
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(9.64500045776367, -11.92140007019043, 499.8976135253906),
                                player = vector4(9.0644998550415, -11.87189960479736, 498.7374877929688, 268.84271240234375)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shell2_light.png'},
        },
    
        ['jamaring_shell3_dark'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Dark 3 (V1)',
            model = 'jamaring_shell3_dark',
            rooms = 0,
            
            doors = vector4(-0.0252, -0.356, 499.9948, 180.7996),
    
            interactable = {
                {
                    targetSize = vector3(1.24000024795532, 1.10000038146972, 1.20000004768371),
                    target = vector4(-16.17239952087402, -10.2918996810913, 501.3904113769531, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-15.91829967498779, -10.41079998016357, 501.3147888183594),
                                player = vector4(-16.02420043945312, -11.04749965667724, 499.9949951171875, 354.05999755859375)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-15.91829967498779, -10.41079998016357, 501.3147888183594),
                                player = vector4(-16.02420043945312, -11.04749965667724, 499.9949951171875, 354.05999755859375)
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
                    targetSize = vector3(0.90500056743621, 0.84500062465667, 1.20000004768371),
                    target = vector4(10.13000011444091, -12.41079998016357, 504.5929870605469, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(10.13700008392334, -12.42109966278076, 504.2381896972656),
                                player = vector4(10.16860008239746, -13.04590034484863, 503.2580871582031, 2.71560001373291)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(10.13700008392334, -12.42109966278076, 504.2381896972656),
                                player = vector4(10.16860008239746, -13.04590034484863, 503.2580871582031, 2.71560001373291)
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
                    targetSize = vector3(0.90000057220458, 0.94500052928924, 1.20000004768371),
                    target = vector4(8.71689987182617, -12.46049976348877, 504.5929870605469, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(8.71100044250488, -12.42169952392578, 504.2383117675781),
                                player = vector4(8.72570037841796, -13.05749988555908, 503.2582092285156, 0.75880002975463)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(8.71100044250488, -12.42169952392578, 504.2383117675781),
                                player = vector4(8.72570037841796, -13.05749988555908, 503.2582092285156, 0.75880002975463)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shell3_dark.png'},
        },
        ['jamaring_shell3_light'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Light 3 (V1)',
            model = 'jamaring_shell3_light',
            rooms = 0,
            
            doors = vector4(-0.0252, -0.356, 499.9948, 180.7996),
    
            interactable = {
                {
                    targetSize = vector3(1.24000024795532, 1.10000038146972, 1.20000004768371),
                    target = vector4(-16.17239952087402, -10.2918996810913, 501.3904113769531, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-15.91829967498779, -10.41079998016357, 501.3147888183594),
                                player = vector4(-16.02420043945312, -11.04749965667724, 499.9949951171875, 354.05999755859375)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-15.91829967498779, -10.41079998016357, 501.3147888183594),
                                player = vector4(-16.02420043945312, -11.04749965667724, 499.9949951171875, 354.05999755859375)
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
                    targetSize = vector3(0.90500056743621, 0.84500062465667, 1.20000004768371),
                    target = vector4(10.13000011444091, -12.41079998016357, 504.5929870605469, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(10.13700008392334, -12.42109966278076, 504.2381896972656),
                                player = vector4(10.16860008239746, -13.04590034484863, 503.2580871582031, 2.71560001373291)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(10.13700008392334, -12.42109966278076, 504.2381896972656),
                                player = vector4(10.16860008239746, -13.04590034484863, 503.2580871582031, 2.71560001373291)
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
                    targetSize = vector3(0.90000057220458, 0.94500052928924, 1.20000004768371),
                    target = vector4(8.71689987182617, -12.46049976348877, 504.5929870605469, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(8.71100044250488, -12.42169952392578, 504.2383117675781),
                                player = vector4(8.72570037841796, -13.05749988555908, 503.2582092285156, 0.75880002975463)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(8.71100044250488, -12.42169952392578, 504.2383117675781),
                                player = vector4(8.72570037841796, -13.05749988555908, 503.2582092285156, 0.75880002975463)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shell3_light.png'},
        },
    
        ['jamaring_shell4_dark'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Dark 4 (V1)',
            model = 'jamaring_shell4_dark',
            rooms = 0,
            
            doors = vector4(-5.1363, 17.4, 498.6906, 180.9162),
    
            interactable = {
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(0.28220000863075, -7.53060007095336, 500.0426940917969, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-0.1431999951601, -7.45830011367797, 499.6380920410156),
                                player = vector4(-0.15270000696182, -6.65990018844604, 498.47808837890625, 181.85350036621097)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-0.1431999951601, -7.45830011367797, 499.6380920410156),
                                player = vector4(-0.15270000696182, -6.65990018844604, 498.47808837890625, 181.85350036621097)
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
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(2.89400005340576, 8.859299659729, 503.1597900390625, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(2.88330006599426, 8.92640018463134, 502.8337097167969),
                                player = vector4(2.88100004196167, 9.76669979095459, 501.8135986328125, 178.8636016845703)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(2.88330006599426, 8.92640018463134, 502.8337097167969),
                                player = vector4(2.88100004196167, 9.76669979095459, 501.8135986328125, 178.8636016845703)
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
                    targetSize = vector3(1.68499982357025, 1.71499979496002, 3.06502366065979),
                    target = vector4(4.27449989318847, 11.39009952545166, 504.8165893554688, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(4.10349988937377, 11.69429969787597, 504.0931091308594),
                                player = vector4(4.02740001678466, 11.48680019378662, 501.88470458984375, 336.6231079101563)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                },
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(2.89059996604919, 18.7844009399414, 503.1737060546875, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(2.88960003852844, 18.70310020446777, 502.8345031738281),
                                player = vector4(2.90059995651245, 17.83429908752441, 501.81439208984375, 0.09149999916553)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(2.88960003852844, 18.70310020446777, 502.8345031738281),
                                player = vector4(2.90059995651245, 17.83429908752441, 501.81439208984375, 0.09149999916553)
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
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(-20.71640014648437, 13.34539985656738, 503.143798828125, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-20.7401008605957, 13.34070014953613, 502.8338928222656),
                                player = vector4(-21.6156005859375, 13.30739974975586, 501.8138122558594, 270.1344909667969)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-20.7401008605957, 13.34070014953613, 502.8338928222656),
                                player = vector4(-21.6156005859375, 13.30739974975586, 501.8138122558594, 270.1344909667969)
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
                    targetSize = vector3(1.63499987125396, 1.6949998140335, 2.71001553535461),
                    target = vector4(-23.16069984436035, 14.71829986572265, 504.4390869140625, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(-23.53079986572265, 14.55060005187988, 504.09320068359375),
                                player = vector4(-23.53030014038086, 14.5334997177124, 501.8846130371094, 59.5901985168457)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                },
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(-30.58839988708496, 13.39990043640136, 503.16070556640625, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-30.52879905700683, 13.34630012512207, 502.8345947265625),
                                player = vector4(-29.67130088806152, 13.36520004272461, 501.81451416015625, 90.05889892578125)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-30.52879905700683, 13.34630012512207, 502.8345947265625),
                                player = vector4(-29.67130088806152, 13.36520004272461, 501.81451416015625, 90.05889892578125)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shell4_dark.png'},
        },
        ['jamaring_shell4_light'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Light 4 (V1)',
            model = 'jamaring_shell4_light',
            rooms = 0,
            
            doors = vector4(-5.1363, 17.4, 498.6906, 180.9162),
    
            interactable = {
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(0.28220000863075, -7.53060007095336, 500.0426940917969, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-0.1431999951601, -7.45830011367797, 499.6380920410156),
                                player = vector4(-0.15270000696182, -6.65990018844604, 498.47808837890625, 181.85350036621097)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-0.1431999951601, -7.45830011367797, 499.6380920410156),
                                player = vector4(-0.15270000696182, -6.65990018844604, 498.47808837890625, 181.85350036621097)
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
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(2.89400005340576, 8.859299659729, 503.1597900390625, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(2.88330006599426, 8.92640018463134, 502.8337097167969),
                                player = vector4(2.88100004196167, 9.76669979095459, 501.8135986328125, 178.8636016845703)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(2.88330006599426, 8.92640018463134, 502.8337097167969),
                                player = vector4(2.88100004196167, 9.76669979095459, 501.8135986328125, 178.8636016845703)
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
                    targetSize = vector3(1.68499982357025, 1.71499979496002, 3.06502366065979),
                    target = vector4(4.27449989318847, 11.39009952545166, 504.8165893554688, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(4.10349988937377, 11.69429969787597, 504.0931091308594),
                                player = vector4(4.02740001678466, 11.48680019378662, 501.88470458984375, 336.6231079101563)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                },
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(2.89059996604919, 18.7844009399414, 503.1737060546875, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(2.88960003852844, 18.70310020446777, 502.8345031738281),
                                player = vector4(2.90059995651245, 17.83429908752441, 501.81439208984375, 0.09149999916553)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(2.88960003852844, 18.70310020446777, 502.8345031738281),
                                player = vector4(2.90059995651245, 17.83429908752441, 501.81439208984375, 0.09149999916553)
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
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(-20.71640014648437, 13.34539985656738, 503.143798828125, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-20.7401008605957, 13.34070014953613, 502.8338928222656),
                                player = vector4(-21.6156005859375, 13.30739974975586, 501.8138122558594, 270.1344909667969)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-20.7401008605957, 13.34070014953613, 502.8338928222656),
                                player = vector4(-21.6156005859375, 13.30739974975586, 501.8138122558594, 270.1344909667969)
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
                    targetSize = vector3(1.63499987125396, 1.6949998140335, 2.71001553535461),
                    target = vector4(-23.16069984436035, 14.71829986572265, 504.4390869140625, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(-23.53079986572265, 14.55060005187988, 504.09320068359375),
                                player = vector4(-23.53030014038086, 14.5334997177124, 501.8846130371094, 59.5901985168457)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                },
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(-30.58839988708496, 13.39990043640136, 503.16070556640625, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-30.52879905700683, 13.34630012512207, 502.8345947265625),
                                player = vector4(-29.67130088806152, 13.36520004272461, 501.81451416015625, 90.05889892578125)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-30.52879905700683, 13.34630012512207, 502.8345947265625),
                                player = vector4(-29.67130088806152, 13.36520004272461, 501.81451416015625, 90.05889892578125)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shell4_light.png'},
        },
    
        ['jamaring_shell5_light'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Light 5 (V1)',
            model = 'jamaring_shell5_light',
            rooms = 0,
            
            doors = vector4(-0.0275, -0.2815, 500.0181, 181.8156),
    
            interactable = {
                {
                    targetSize = vector3(2.62001371383667, 4.21005010604858, 2.89501976966857),
                    target = vector4(16.34810066223144, -42.90090179443359, 502.8631896972656, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(17.21139907836914, -43.83349990844726, 502.5163879394531),
                                player = vector4(16.94479942321777, -43.72249984741211, 500.0169982910156, 235.0258941650391)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                },
                {
                    targetSize = vector3(1.99499952793121, 0.82000064849853, 1.20000004768371),
                    target = vector4(16.04560089111328, -37.47370147705078, 495.3434143066406, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(16.03529930114746, -37.5359001159668, 495.09521484375),
                                player = vector4(16.00169944763183, -36.85770034790039, 493.935302734375, 182.9546051025391)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(16.03529930114746, -37.5359001159668, 495.09521484375),
                                player = vector4(16.00169944763183, -36.85770034790039, 493.935302734375, 182.9546051025391)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_shell5_light.png'},
        },
    }
    
    addShells(shells)
end)