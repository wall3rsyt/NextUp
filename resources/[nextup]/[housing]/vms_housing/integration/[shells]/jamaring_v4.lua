CreateThread(function()
    Wait(1000)

    if not Config.Shells.JamaringMapsShellsV4 then return end
    
    local shells = {
        ['jamaring_v4_1_dark'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Dark 1 (V4)',
            model = 'jamaring_v4_1_dark',
            rooms = 0,
            
            doors = vector4(-0.0517, 0.1161, 499.7198, 185.0823),
    
            interactable = {
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(6.87809991836547, -7.85290002822876, 501.2709045410156, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(6.8833999633789, -7.83640003204345, 501.0198059082031),
                                player = vector4(6.87029981613159, -8.62639999389648, 499.7199096679688, 359.03338623046875)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(6.8833999633789, -7.83640003204345, 501.0198059082031),
                                player = vector4(6.87029981613159, -8.62639999389648, 499.7199096679688, 359.03338623046875)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v4_1_dark.png'},
        },
        ['jamaring_v4_1_light'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Light 1 (V4)',
            model = 'jamaring_v4_1_light',
            rooms = 0,
            
            doors = vector4(-0.0517, 0.1161, 499.7198, 185.0823),
    
            interactable = {
                {
                    targetSize = vector3(1.5, 1.5, 1.20000004768371),
                    target = vector4(6.87809991836547, -7.85290002822876, 501.2709045410156, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(6.8833999633789, -7.83640003204345, 501.0198059082031),
                                player = vector4(6.87029981613159, -8.62639999389648, 499.7199096679688, 359.03338623046875)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(6.8833999633789, -7.83640003204345, 501.0198059082031),
                                player = vector4(6.87029981613159, -8.62639999389648, 499.7199096679688, 359.03338623046875)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v4_1_light.png'},
        },
    
        ['jamaring_v4_2_dark'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Dark 2 (V4)',
            model = 'jamaring_v4_2_dark',
            rooms = 0,
            
            doors = vector4(-0.0123, 1.2894, 499.7205, 180.5614),
    
            interactable = {
                {
                    targetSize = vector3(1.78499972820281, 1.34500014781951, 1.20000004768371),
                    target = vector4(-5.63030004501342, -17.38209915161132, 500.74560546875, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-5.78859996795654, -17.25130081176757, 500.6521911621094),
                                player = vector4(-5.74049997329711, -16.46520042419433, 499.3721923828125, 178.4781951904297)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-5.78859996795654, -17.25130081176757, 500.6521911621094),
                                player = vector4(-5.74049997329711, -16.46520042419433, 499.3721923828125, 178.4781951904297)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v4_2_dark.png'},
        },
        ['jamaring_v4_2_light'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Light 2 (V4)',
            model = 'jamaring_v4_2_light',
            rooms = 0,
            
            doors = vector4(-0.0123, 1.2894, 499.7205, 180.5614),
    
            interactable = {
                {
                    targetSize = vector3(1.78499972820281, 1.34500014781951, 1.20000004768371),
                    target = vector4(-5.63030004501342, -17.38209915161132, 500.74560546875, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-5.78859996795654, -17.25130081176757, 500.6521911621094),
                                player = vector4(-5.74049997329711, -16.46520042419433, 499.3721923828125, 178.4781951904297)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-5.78859996795654, -17.25130081176757, 500.6521911621094),
                                player = vector4(-5.74049997329711, -16.46520042419433, 499.3721923828125, 178.4781951904297)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v4_2_light.png'},
        },
    
        ['jamaring_v4_3_dark'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Dark 3 (V4)',
            model = 'jamaring_v4_3_dark',
            rooms = 0,
            
            doors = vector4(-0.2844, -0.0109, 499.6282, 270.4824),
    
            interactable = {
                {
                    targetSize = vector3(0.99500048160552, 1.73999977111816, 1.20000004768371),
                    target = vector4(19.44630050659179, 8.62559986114502, 499.5804138183594, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(19.41670036315918, 8.8007001876831, 499.5459899902344),
                                player = vector4(20.19000053405761, 8.78849983215332, 498.22601318359375, 96.10269927978516)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(19.41670036315918, 8.8007001876831, 499.5459899902344),
                                player = vector4(20.19000053405761, 8.78849983215332, 498.22601318359375, 96.10269927978516)
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
                    targetSize = vector3(1.02000045776367, 0.66500079631805, 1.20000004768371),
                    target = vector4(17.58880043029785, 7.65119981765747, 499.5401916503906, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(17.57309913635254, 7.49639987945556, 499.1062927246094),
                                player = vector4(17.56620025634765, 8.20240020751953, 498.2261047363281, 179.35609436035156)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(17.57309913635254, 7.49639987945556, 499.1062927246094),
                                player = vector4(17.56620025634765, 8.20240020751953, 498.2261047363281, 179.35609436035156)
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
                    targetSize = vector3(1.41500008106231, 2.09000158309936, 2.66501450538635),
                    target = vector4(9.2898998260498, -5.55159997940063, 498.4007873535156, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(9.29440021514892, -6.0873999595642, 498.2398986816406),
                                player = vector4(9.31410026550293, -5.85230016708374, 495.86871337890625, 139.38800048828125)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                },
                {
                    targetSize = vector3(0.73500072956085, 0.84500062465667, 1.20000004768371),
                    target = vector4(5.25040006637573, -5.11479997634887, 497.1659851074219, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(5.25710010528564, -5.09130001068115, 496.8291931152344),
                                player = vector4(5.93419981002807, -5.13959980010986, 495.8291015625, 91.19429779052736)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(5.25710010528564, -5.09130001068115, 496.8291931152344),
                                player = vector4(5.93419981002807, -5.13959980010986, 495.8291015625, 91.19429779052736)
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
                    targetSize = vector3(0.69000077247619, 0.93500053882598, 1.20000004768371),
                    target = vector4(5.29050016403198, -3.66739988327026, 497.1659851074219, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(5.24760007858276, -3.66230010986328, 496.8291931152344),
                                player = vector4(5.89589977264404, -3.68039989471435, 495.8293151855469, 88.83170318603516)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(5.24760007858276, -3.66230010986328, 496.8291931152344),
                                player = vector4(5.89589977264404, -3.68039989471435, 495.8293151855469, 88.83170318603516)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v4_3_dark.png'},
        },
        ['jamaring_v4_3_light'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Light 3 (V4)',
            model = 'jamaring_v4_3_light',
            rooms = 0,
            
            doors = vector4(-0.2844, -0.0109, 499.6282, 270.4824),
    
            interactable = {
                {
                    targetSize = vector3(0.99500048160552, 1.73999977111816, 1.20000004768371),
                    target = vector4(19.44630050659179, 8.62559986114502, 499.5804138183594, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(19.41670036315918, 8.8007001876831, 499.5459899902344),
                                player = vector4(20.19000053405761, 8.78849983215332, 498.22601318359375, 96.10269927978516)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(19.41670036315918, 8.8007001876831, 499.5459899902344),
                                player = vector4(20.19000053405761, 8.78849983215332, 498.22601318359375, 96.10269927978516)
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
                    targetSize = vector3(1.02000045776367, 0.66500079631805, 1.20000004768371),
                    target = vector4(17.58880043029785, 7.65119981765747, 499.5401916503906, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(17.57309913635254, 7.49639987945556, 499.1062927246094),
                                player = vector4(17.56620025634765, 8.20240020751953, 498.2261047363281, 179.35609436035156)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(17.57309913635254, 7.49639987945556, 499.1062927246094),
                                player = vector4(17.56620025634765, 8.20240020751953, 498.2261047363281, 179.35609436035156)
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
                    targetSize = vector3(1.41500008106231, 2.09000158309936, 2.66501450538635),
                    target = vector4(9.2898998260498, -5.55159997940063, 498.4007873535156, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(9.29440021514892, -6.0873999595642, 498.2398986816406),
                                player = vector4(9.31410026550293, -5.85230016708374, 495.86871337890625, 139.38800048828125)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                },
                {
                    targetSize = vector3(0.73500072956085, 0.84500062465667, 1.20000004768371),
                    target = vector4(5.25040006637573, -5.11479997634887, 497.1659851074219, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(5.25710010528564, -5.09130001068115, 496.8291931152344),
                                player = vector4(5.93419981002807, -5.13959980010986, 495.8291015625, 91.19429779052736)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(5.25710010528564, -5.09130001068115, 496.8291931152344),
                                player = vector4(5.93419981002807, -5.13959980010986, 495.8291015625, 91.19429779052736)
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
                    targetSize = vector3(0.69000077247619, 0.93500053882598, 1.20000004768371),
                    target = vector4(5.29050016403198, -3.66739988327026, 497.1659851074219, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(5.24760007858276, -3.66230010986328, 496.8291931152344),
                                player = vector4(5.89589977264404, -3.68039989471435, 495.8293151855469, 88.83170318603516)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(5.24760007858276, -3.66230010986328, 496.8291931152344),
                                player = vector4(5.89589977264404, -3.68039989471435, 495.8293151855469, 88.83170318603516)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v4_3_light.png'},
        },
    
        ['jamaring_v4_4_dark'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Dark 4 (V4)',
            model = 'jamaring_v4_4_dark',
            rooms = 0,
            
            doors = vector4(-0.0285, -0.3318, 500.0001, 357.8033),
    
            interactable = {
                {
                    targetSize = vector3(0.7450007200241, 1.00000047683715, 1.20000004768371),
                    target = vector4(3.60159993171691, 0.97979998588562, 501.30511474609375, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(3.76189994812011, 0.97530001401901, 500.8801879882813),
                                player = vector4(3.01060009002685, 0.98159998655319, 500.0000915527344, 265.3302917480469)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(3.76189994812011, 0.97530001401901, 500.8801879882813),
                                player = vector4(3.01060009002685, 0.98159998655319, 500.0000915527344, 265.3302917480469)
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
                    targetSize = vector3(1.75499975681304, 1.5, 1.20000004768371),
                    target = vector4(-3.65400004386901, -0.03139999881386, 501.3750915527344, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-3.82299995422363, 0.13030000030994, 501.340087890625),
                                player = vector4(-3.76920008659362, 0.83469998836517, 500.0002136230469, 178.85220336914065)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-3.82299995422363, 0.13030000030994, 501.340087890625),
                                player = vector4(-3.76920008659362, 0.83469998836517, 500.0002136230469, 178.85220336914065)
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
                    targetSize = vector3(1.69999980926513, 1.45000004768371, 2.92002034187316),
                    target = vector4(-2.05209994316101, 5.61140012741088, 505.93060302734375, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(-1.59539997577667, 5.60330009460449, 505.6336059570313),
                                player = vector4(-2.01110005378723, 5.55940008163452, 503.0710144042969, 291.1565856933594)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v4_4_dark.png'},
        },
        ['jamaring_v4_4_light'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Light 4 (V4)',
            model = 'jamaring_v4_4_light',
            rooms = 0,
            
            doors = vector4(-0.0285, -0.3318, 500.0001, 357.8033),
    
            interactable = {
                {
                    targetSize = vector3(0.7450007200241, 1.00000047683715, 1.20000004768371),
                    target = vector4(3.60159993171691, 0.97979998588562, 501.30511474609375, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(3.76189994812011, 0.97530001401901, 500.8801879882813),
                                player = vector4(3.01060009002685, 0.98159998655319, 500.0000915527344, 265.3302917480469)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(3.76189994812011, 0.97530001401901, 500.8801879882813),
                                player = vector4(3.01060009002685, 0.98159998655319, 500.0000915527344, 265.3302917480469)
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
                    targetSize = vector3(1.75499975681304, 1.5, 1.20000004768371),
                    target = vector4(-3.65400004386901, -0.03139999881386, 501.3750915527344, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-3.82299995422363, 0.13030000030994, 501.340087890625),
                                player = vector4(-3.76920008659362, 0.83469998836517, 500.0002136230469, 178.85220336914065)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-3.82299995422363, 0.13030000030994, 501.340087890625),
                                player = vector4(-3.76920008659362, 0.83469998836517, 500.0002136230469, 178.85220336914065)
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
                    targetSize = vector3(1.69999980926513, 1.45000004768371, 2.92002034187316),
                    target = vector4(-2.05209994316101, 5.61140012741088, 505.93060302734375, 0),
                    options = {
                        {
                            waterUsage = 120000,
                            targetIcon = 'fa-solid fa-shower',
                            coords = {
                                particles = vector3(-1.59539997577667, 5.60330009460449, 505.6336059570313),
                                player = vector4(-2.01110005378723, 5.55940008163452, 503.0710144042969, 291.1565856933594)
                            },
                            billType = 'water',
                            timeUsage = 10000,
                            type = 'shower'
                        }
                    }
                }
            },
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v4_4_light.png'},
        },
    
        ['jamaring_v4_5_dark'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Dark 5 (V4)',
            model = 'jamaring_v4_5_dark',
            rooms = 0,
            
            doors = vector4(0.0097, -0.2539, 500.0001, 359.6887),
    
            interactable = {
                {
                    targetSize = vector3(1.77999973297119, 0.87500059604644, 1.20000004768371),
                    target = vector4(-3.8183000087738, 4.90950012207031, 501.4034118652344, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-3.59270000457763, 4.98430013656616, 501.3599853515625),
                                player = vector4(-3.63499999046325, 4.27400016784668, 500.0000915527344, 359.02850341796875)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-3.59270000457763, 4.98430013656616, 501.3599853515625),
                                player = vector4(-3.63499999046325, 4.27400016784668, 500.0000915527344, 359.02850341796875)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v4_5_dark.png'},
        },
        ['jamaring_v4_5_light'] = {
            tags = {'empty', 'jamaring'},
    
            label = 'Jamaring Light 5 (V4)',
            model = 'jamaring_v4_5_light',
            rooms = 0,
            
            doors = vector4(0.0097, -0.2539, 500.0001, 359.6887),
    
            interactable = {
                {
                    targetSize = vector3(1.77999973297119, 0.87500059604644, 1.20000004768371),
                    target = vector4(-3.8183000087738, 4.90950012207031, 501.4034118652344, 0),
                    options = {
                        {
                            waterUsage = 300,
                            targetIcon = 'fa-solid fa-glass-water-droplet',
                            coords = {
                                particles = vector3(-3.59270000457763, 4.98430013656616, 501.3599853515625),
                                player = vector4(-3.63499999046325, 4.27400016784668, 500.0000915527344, 359.02850341796875)
                            },
                            billType = 'water',
                            timeUsage = 5000,
                            type = 'sink_drink'
                        },
                        {
                            coords = {
                                particles = vector3(-3.59270000457763, 4.98430013656616, 501.3599853515625),
                                player = vector4(-3.63499999046325, 4.27400016784668, 500.0000915527344, 359.02850341796875)
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
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/jamaring_v4_5_light.png'},
        },
    }
    
    addShells(shells)
end)