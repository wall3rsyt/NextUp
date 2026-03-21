CreateThread(function()
    Wait(1000)

    if not Config.Shells.K4MB1_GaragesPack then return end
    
    if Config.Shells.K4MB1_AllShellsSubPack then
        return warn(("^3You cannot have ^1%s^3 and ^1%s^3 running at the same time.^7"):format('K4MB1_GaragesPack', 'K4MB1-AllShellsSubPack'))
    end
    
    local shells = {
        ['new_garages1_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'New Garages 1',
            model = 'k4_garage1_shell',
            rooms = 0,
            
            doors = vector4(-0.2192, 14.5161, 493.6575, 179.1481),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/new_garages1_k4mb1.png'},
        },
        ['new_garages2_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'New Garages 2',
            model = 'k4_garage2_shell',
            rooms = 0,
            
            doors = vector4(-3.9324, -0.038, 498.3396, 270.7706),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/new_garages2_k4mb1.png'},
        },
        ['new_garages3_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'New Garages 3',
            model = 'k4_garage3_shell',
            rooms = 0,
            
            doors = vector4(-3.8934, -0.413, 498.3398, 269.932),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/new_garages3_k4mb1.png'},
        },
        ['new_garages4_k4mb1'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'New Garages 4',
            model = 'k4_garage4_shell',
            rooms = 0,
            
            doors = vector4(-3.9393, -7.2366, 498.2446, 350.3344),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/new_garages4_k4mb1.png'},
        },
        ['shell_garages'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Garages',
            model = 'k4_garage5_shell',
            rooms = 0,
            
            doors = vector4(-0.3966, -4.8094, 498.4946, 1.5658),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_garages.png'},
        },
        ['shell_garagem'] = {
            --[[
                This shell is also included in K4MB1-StarterShells.
    
                If you plan to modify it, please remove the duplicate entry
                from K4MB1-StarterShells.lua to prevent conflicts.
            ]]
            label = 'Garage',
    
            tags = {'empty', 'k4mb1'},
            rooms = 1,
    
            model = 'k4_garage6_shell',
    
            doors = {
                x = 3.64,
                y = -7.03,
                z = 498.25,
                heading = 0.43,
            },
            
            images = {
                'https://cfx-nui-vms_housing/html/images/shell/shell_garagem.png',
            },
        },
        ['shell_garagel'] = {
            tags = {'empty', 'k4mb1'},
    
            label = 'Garage l',
            model = 'k4_garage7_shell',
            rooms = 0,
            
            doors = vector4(3.8105, -16.4834, 497.9947, 0.5102),
    
            images = {'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/shell_garagel.png'},
        },
    }
    
    addShells(shells)
end)