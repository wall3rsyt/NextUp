CreateThread(function()
    Wait(1000)
    
    if not Config.Shells.K4MB1_IllegalOperationsPack then return end
    
    if Config.Shells.K4MB1_AllShellsSubPack then
        return warn(("^3You cannot have ^1%s^3 and ^1%s^3 running at the same time.^7"):format('K4MB1_IllegalOperationsPack', 'K4MB1-AllShellsSubPack'))
    end
    
    local shells = {
        ['k4mb1_acid_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Acid',
            model = 'k4_labempty3_shell',
            rooms = 0,
            
            doors = vector4(-2.6196, 1.849, 499.7511, 177.7259),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_acid_shell.png'},
        },
        ['k4mb1_drug_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Drug',
            model = 'k4_labempty4_shell',
            rooms = 0,
            
            doors = vector4(11.0257, 2.0197, 497.1259, 91.5861),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_drug_shell.png'},
        },
        ['k4mb1_laundry_shell'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Laundry',
            model = 'k4_laundry_shell',
            rooms = 0,
            
            doors = vector4(-9.0254, 6.8918, 495.8819, 179.9983),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4mb1_laundry_shell.png'},
        },
        ['k4mb1_acid2_shell'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Acid 2',
            model = 'k4_labacid_shell',
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
        ['container2_shell'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Container 2',
            model = 'k4_container2_shell',
            rooms = 0,
            
            doors = vector4(0.0828, -5.7088, 498.781, 350.4664),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/container2_shell.png'},
        },
        ['stashhouse1_shell'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Stash House 1',
            model = 'k4_stashhouse3_shell',
            rooms = 3,
            
            doors = vector4(21.6324, -0.2829, 496.9237, 90.4644),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/stashhouse1_shell.png'},
        },
        ['stashhouse3_shell'] = {
            tags = {'furnished', 'k4mb1'},
    
            label = 'Stash House 3',
            model = 'k4_stashhouse4_shell',
            rooms = 0,
            
            doors = vector4(-0.146, 5.6094, 497.9828, 180.7346),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/stashhouse3_shell.png'},
        },
        ['shell_coke1'] = {
            tags = {'empty', 'k4mb1'},

            label = 'Lab Empty',
            model = 'k4_labempty_shell',
            rooms = 0,
            
            doors = vector4(-6.2824, 8.6559, 498.0363, 180.3895),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_labempty_shell.png'},
        },
        ['shell_weed'] = {
            tags = {'empty', 'k4mb1'},

            label = 'Lab Empty 2',
            model = 'k4_labempty2_shell',
            rooms = 0,
            
            doors = vector4(17.8865, 11.7018, 496.9019, 91.4273),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_labempty2_shell.png'},
        },
        ['shell_coke2'] = {
            tags = {'furnished', 'k4mb1'},

            label = 'Lab Coke',
            model = 'k4_labcoke_shell',
            rooms = 0,
            
            doors = vector4(-6.262, 8.6877, 498.036, 178.2736),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_labcoke_shell.png'},
        },
        ['k4coke_shell'] = {
            tags = {'furnished', 'k4mb1'},

            label = 'Lab Coke 2',
            model = 'k4_labcoke2_shell',
            rooms = 0,
            
            doors = vector4(-10.9778, -2.5036, 498.9613, 269.7616),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_labcoke2_shell.png'},
        },
        ['shell_meth'] = {
            tags = {'furnished', 'k4mb1'},

            label = 'Lab Meth',
            model = 'k4_labmeth_shell',
            rooms = 0,
            
            doors = vector4(-6.302, 8.6978, 498.036, 180.8866),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_labmeth_shell.png'},
        },
        ['k4meth_shell'] = {
            tags = {'furnished', 'k4mb1'},

            label = 'Lab Meth 2',
            model = 'k4_labmeth2_shell',
            rooms = 0,
            
            doors = vector4(-10.9717, -2.474, 498.9222, 271.1494),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_labmeth2_shell.png'},
        },
        ['shell_weed2'] = {
            tags = {'furnished', 'k4mb1'},

            label = 'Lab Weed',
            model = 'k4_labweed_shell',
            rooms = 0,
            
            doors = vector4(17.88, 11.7637, 496.9019, 89.4033),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_labweed_shell.png'},
        },
        ['k4weed_shell'] = {
            tags = {'furnished', 'k4mb1'},

            label = 'Lab Weed 2',
            model = 'k4_labweed2_shell',
            rooms = 0,
            
            doors = vector4(-10.9813, -2.5166, 498.9986, 271.3239),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_labweed2_shell.png'},
        },
        ['gunworkshop_k4mb1'] = {
            tags = {'empty', 'k4mb1'},

            label = 'Gun Shop',
            model = 'k4_guns_shell',
            rooms = 3,
            
            doors = vector4(0.0237, 4.8929, 498.179, 179.3649),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_guns_shell.png'},
        },
        ['k4mb1_bunkersilo_shell'] = {
            tags = {'empty', 'k4mb1'},

            label = 'Bunker',
            model = 'k4_bunker_shell',
            rooms = 0,
            
            doors = vector4(0.0179, -7.0971, 501.6872, 179.7089),

            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/k4_bunker_shell.png'},
        },
    }
    
    addShells(shells)
end)
