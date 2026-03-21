CreateThread(function()
    Wait(1000)
    
    if not Config.Shells.K4MB1_MiscPack then return end
    
    if Config.Shells.K4MB1_AllShellsSubPack then
        return warn(("^3You cannot have ^1%s^3 and ^1%s^3 running at the same time.^7"):format('K4MB1_MiscPack', 'K4MB1-AllShellsSubPack'))
    end
    
    local shells = {
        ['k4mb1_furnishedoffice1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Furnished Office 1',
            model = 'k4_office1_shell',
            rooms = 0,
            
            doors = vector4(3.7266, -2.0206, 498.0762, 90.4983),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_furnishedoffice1_shell.png'},
        },
        ['k4mb1_furnishedoffice2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Furnished Office 2',
            model = 'k4_office2_shell',
            rooms = 0,
            
            doors = vector4(4.3583, 3.92, 498.2487, 185.8252),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_furnishedoffice2_shell.png'},
        },
        ['k4mb1_furnishedoffice3_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Furnished Office 3',
            model = 'k4_office3_shell',
            rooms = 0,
            
            doors = vector4(-0.2388, 5.8427, 498.2997, 89.1062),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_furnishedoffice3_shell.png'},
        },
        ['k4mb1_furnishedoffice4_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Furnished Office 4',
            model = 'k4_office4_shell',
            rooms = 0,
            
            doors = vector4(8.9262, -2.2106, 497.4483, 91.1339),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_furnishedoffice4_shell.png'},
        },
        ['shell_office1'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
            tags = {'empty', 'k4mb1'},
    
            label = 'Office 1',
            model = 'k4_office6_shell',
            rooms = 0,
            
            doors = vector4(4.4837, 5.3705, 499.9955, 181.3904),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_office1.png'},
        },
        ['shell_office2'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Office 2',
            model = 'k4_office7_shell',
            rooms = 0,
            
            doors = vector4(3.6459, -1.864, 498.0741, 93.5323),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_office2.png'},
        },
        ['shell_officebig'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Office Big',
            model = 'k4_office8_shell',
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
        ['container_shell'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
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
        ['stashhouse_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Stash House',
            model = 'k4_stashhouse1_shell',
            rooms = 3,
            
            doors = vector4(21.6266, -0.3474, 496.9241, 88.1805),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/stashhouse_shell.png'},
        },
        ['shell_warehouse1'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
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
        ['shell_warehouse2'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Warehouse 2',
            model = 'k4_warehouse2_shell',
            rooms = 1,
            
            doors = vector4(12.456, 0.1663, 496.9355, 102.2598),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_warehouse2.png'},
        },
        ['shell_warehouse3'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Warehouse 3',
            model = 'k4_warehouse3_shell',
            rooms = 0,
            
            doors = vector4(2.6057, -1.5809, 498.0482, 94.8552),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_warehouse3.png'},
        },
        ['k4mb1_warehouse_shell'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
            tags = {'empty', 'k4mb1'},
    
            label = 'Warehouse',
            model = 'k4_warehouse4_shell',
            rooms = 0,
            
            doors = vector4(8.7008, -3.3682, 497.5053, 85.5066),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_warehouse_shell.png'},
        },
        ['warehouse_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Warehouse',
            model = 'k4_warehouse5_shell',
            rooms = 0,
            
            doors = vector4(-13.8037, -0.1838, 497.0333, 271.1431),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/warehouse_k4mb1.png'},
        },
        ['k4mb1_biker1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Biker 1',
            model = 'k4_biker1_shell',
            rooms = 0,
            
            doors = vector4(7.6209, -11.1893, 499.2495, 359.7387),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_biker1_shell.png'},
        },
        ['k4mb1_biker2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Biker 2',
            model = 'k4_biker2_shell',
            rooms = 0,
            
            doors = vector4(-9.0398, -8.4413, 499.9975, 269.2645),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_biker2_shell.png'},
        },
        ['k4mb1_basement1_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Basement 1',
            model = 'k4_basement1_shell',
            rooms = 0,
            
            doors = vector4(-4.3524, -4.8339, 500.5969, 93.0709),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_basement1_shell.png'},
        },
        ['k4mb1_basement2_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Basement 2',
            model = 'k4_basement2_shell',
            rooms = 0,
            
            doors = vector4(-4.3524, -4.8339, 500.5969, 93.0709),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_basement2_shell.png'},
        },
        ['k4mb1_basement3_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Basement 3',
            model = 'k4_basement3_shell',
            rooms = 0,
            
            doors = vector4(-4.3524, -4.8339, 500.5969, 93.0709),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_basement3_shell.png'},
        },
        ['k4mb1_basement4_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Basement 4',
            model = 'k4_basement4_shell',
            rooms = 0,
            
            doors = vector4(-4.3524, -4.8339, 500.5969, 93.0709),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_basement4_shell.png'},
        },
        ['k4mb1_basement5_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Basement 5',
            model = 'k4_basement5_shell',
            rooms = 0,
            
            doors = vector4(-4.3524, -4.8339, 500.5969, 93.0709),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_basement5_shell.png'},
        },
        ['k4mb1_furnishedoffice5_shell'] = {
            tags = {'furnished', 'k4mb1'},

            label = 'Office 5',
            model = 'k4_office5_shell',
            rooms = 0,
            
            doors = vector4(0.2397, -14.8827, 495.9228, 1.8795),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_office5_shell.png'},
        },
        ['shell_store1'] = {
            tags = {'empty', 'k4mb1'},

            label = 'Store 1',
            model = 'k4_store1_shell',
            rooms = 0,
            
            doors = vector4(-2.7419, 4.543, 498.376, 183.37),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_store1_shell.png'},
        },
        ['shell_store2'] = {
            tags = {'empty', 'k4mb1'},

            label = 'Store 2',
            model = 'k4_store2_shell',
            rooms = 0,
            
            doors = vector4(-0.7516, -5.1739, 497.841, 357.9616),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_store2_shell.png'},
        },
        ['shell_store3'] = {
            tags = {'empty', 'k4mb1'},

            label = 'Store 3',
            model = 'k4_store3_shell',
            rooms = 0,
            
            doors = vector4(-0.0697, -7.8819, 498.6937, 358.1675),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_store3_shell.png'},
        },
        ['shell_gunstore'] = {
            tags = {'empty', 'k4mb1'},

            label = 'Store 4',
            model = 'k4_store4_shell',
            rooms = 0,
            
            doors = vector4(-1.0747, -5.5381, 498.2582, 0.5689),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_store4_shell.png'},
        },
        ['shell_barber'] = {
            tags = {'empty', 'k4mb1'},

            label = 'Store 5',
            model = 'k4_store5_shell',
            rooms = 0,
            
            doors = vector4(1.6376, 5.4551, 498.4374, 178.4962),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_store5_shell.png'},
        },
        ['stashhouse2_shell'] = {
            tags = {'empty', 'k4mb1'},

            label = 'Stash House 2',
            model = 'k4_stashhouse2_shell',
            rooms = 0,
            
            doors = vector4(-1.9789, 2.2181, 497.983, 269.8379),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_stashhouse2_shell.png'},
        },
        ['k4mb1_biker3_shell'] = {
            tags = {'empty', 'k4mb1'},

            label = 'Biker 3',
            model = 'k4_biker3_shell',
            rooms = 0,
            
            doors = vector4(-12.1027, 2.484, 497.9061, 270.1835),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_biker3_shell.png'},
        },
    }
    
    addShells(shells)
end)
