CreateThread(function()
    Wait(1000)

    if not Config.Shells.Atenea then return end
    
    local shells = {
        ['ate_apartament_inicial'] = {
            label = 'Apartament Inicial',
    
            tags = {'furnished', 'ateneastore'},
            rooms = 1,
    
            model = 'ate_apartament_inicial',
            
            doors = {
                x = 2.28,
                y = 3.51,
                z = 500.04,
                heading = 83.47,
            },
            
            images = {
                'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/ate_apartament_inicial.png',
            },
        },
        
        ['ate_habitacion_deluxe'] = {
            label = 'Habitacion deluxe',
    
            tags = {'empty', 'ateneastore'},
            rooms = 1,
    
            model = 'ate_habitacion_deluxe',
    
            doors = {
                x = 0.11,
                y = 3.52,
                z = 500.04,
                heading = 180.01,
            },
            
            images = {
                'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/ate_habitacion_deluxe.png',
            },
        },
    
        ['ate_habitacion_deluxe_decorada'] = {
            label = 'Habitacion deluxe Decorada',
    
            tags = {'furnished', 'ateneastore'},
            rooms = 1,
    
            model = 'ate_habitacion_deluxe_decorada',
    
            doors = {
                x = 0.11,
                y = 3.36,
                z = 500.04,
                heading = 175.27,
            },
            
            images = {
                'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/ate_habitacion_deluxe_decorada.png',
            },
        },
    
        ['ate_housing_1'] = {
            label = 'Housing 1',
    
            tags = {'empty', 'ateneastore'},
            rooms = 2,
    
            model = 'ate_housing_1',
    
            doors = {
                x = -0.29,
                y = -0.42,
                z = 500.05,
                heading = 9.26,
            },
            
            images = {
                'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/ate_housing_1.png',
            },
        },
    
        ['ate_housing_2'] = {
            label = 'Housing 2',
    
            tags = {'empty', 'ateneastore'},
            rooms = 4,
    
            model = 'ate_housing_2',
    
            doors = {
                x = 8.27,
                y = -1.95,
                z = 500.15,
                heading = 87.13,
            },
            
            images = {
                'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/ate_housing_2.png',
            },
        },
    
        ['ate_housing_3'] = {
            label = 'Housing 3',
    
            tags = {'empty', 'ateneastore'},
            rooms = 4,
    
            model = 'ate_housing_3',
    
            doors = {
                x = 0.40,
                y = -0.12,
                z = 500.00,
                heading = 89.55,
            },
            
            images = {
                'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/ate_housing_3.png',
            },
        },
    
        ['ate_oficinacrema'] = {
            label = 'Office Crema',
    
            tags = {'empty', 'ateneastore'},
            rooms = 1,
    
            model = 'ate_oficinacrema',
    
            doors = {
                x = -2.02,
                y = -3.31,
                z = 500.04,
                heading = 350.51,
            },
            
            images = {
                'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/ate_oficinacrema.png',
            },
        },
    
        ['ate_oficinadecorada'] = {
            label = 'Office Decorada',
    
            tags = {'furnished', 'ateneastore'},
            rooms = 1,
    
            model = 'ate_oficinadecorada',
    
            doors = {
                x = -2.00,
                y = -3.44,
                z = 500.04,
                heading = 8.24,
            },
            
            images = {
                'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/ate_oficinadecorada.png',
            },
        },
    
        ['ate_oficinasindecorada'] = {
            label = 'Office',
    
            tags = {'empty', 'ateneastore'},
            rooms = 1,
    
            model = 'ate_oficinasindecorada',
    
            doors = {
                x = -2.01,
                y = -3.34,
                z = 500.04,
                heading = 353.25,
            },
            
            images = {
                'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/ate_oficinasindecorada.png',
            },
        },
    
        ['ate_shell_gaming_empty'] = {
            label = 'Gaming',
    
            tags = {'empty', 'ateneastore'},
            rooms = 1,
    
            model = 'ate_shell_gaming_empty',
    
            doors = {
                x = 0.00,
                y = 0.42,
                z = 500.99,
                heading = 0.88,
            },
            
            images = {
                'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/ate_shell_gaming_empty.png',
            },
        },
    
        ['ate_shell_gaming_furniture'] = {
            label = 'Gaming',
    
            tags = {'furnished', 'ateneastore'},
            rooms = 1,
    
            model = 'ate_shell_gaming_furniture',
    
            doors = {
                x = -0.04,
                y = 0.34,
                z = 500.00,
                heading = 1.07,
            },
            
            images = {
                'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/ate_shell_gaming_furniture.png',
            },
        },
    
        ['ate_estudio'] = {
            label = 'Studi',
    
            tags = {'empty', 'ateneastore'},
            rooms = 1,
    
            model = 'ate_estudio',
    
            doors = {
                x = -2.46,
                y = -1.97,
                z = 500.04,
                heading = 269.13,
            },
            
            images = {
                'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/ate_estudio.png',
            },
        },
    
        ['ate_estudio_decorado'] = {
            label = 'Studi Decorate',
    
            tags = {'furnished', 'ateneastore'},
            rooms = 1,
    
            model = 'ate_estudio_decorado',
    
            doors = {
                x = -2.40,
                y = -1.77,
                z = 500.04,
                heading = 274.22,
            },
            
            images = {
                'https://raw.githubusercontent.com/vames-dev/VMS-Housing-Images/refs/heads/main/shells/ate_estudio_decorado.png',
            },
        },
    }
    
    addShells(shells)
end)