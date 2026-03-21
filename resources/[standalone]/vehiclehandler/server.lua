if not lib then
    print('^1ox_lib must be started before this resource.^0')
    return
end

lib.locale()
lib.versionCheck("QuantumMalice/vehiclehandler")

-- ox_inventory item exports
if GetResourceState('ox_inventory') == 'started' then
    local itemCallbacks = {
        cleaningkit    = { cb = 'vehiclehandler:basicwash',  arg = nil        },
        tirekit        = { cb = 'vehiclehandler:basicfix',   arg = 'tirekit'  },
        repairkit      = { cb = 'vehiclehandler:basicfix',   arg = 'smallkit' },
        advancedrepairkit = { cb = 'vehiclehandler:basicfix', arg = 'bigkit'  },
    }

    for item, data in pairs(itemCallbacks) do
        exports(item, function(event, _, inventory)
            if event ~= 'usingItem' then return end
            local success = lib.callback.await(data.cb, inventory.id, data.arg)
            return success or false
        end)
    end
end

-- Sync callback
lib.callback.register('vehiclehandler:sync', function()
    return true
end)

-- Admin commands
local adminCommands = {
    { name = 'fix',  cb = 'vehiclehandler:adminfix'  },
    { name = 'wash', cb = 'vehiclehandler:adminwash' },
}

for _, cmd in ipairs(adminCommands) do
    lib.addCommand(cmd.name, {
        help       = locale('commands.' .. cmd.name .. '.help'),
        restricted = 'group.admin'
    }, function(source)
        lib.callback(cmd.cb, source, function() end)
    end)
end

-- Setfuel command (separate due to params)
lib.addCommand('setfuel', {
    help       = locale('commands.setfuel.help'),
    restricted = 'group.admin',
    params     = {
        {
            name = locale('commands.setfuel.params.name'),
            type = locale('commands.setfuel.params.type'),
            help = locale('commands.setfuel.params.help'),
        },
    },
}, function(source, args)
    if args.level then
        lib.callback('vehiclehandler:adminfuel', source, function() end, args.level)
    end
end)