if Config.Garages ~= 'qbx_garages' then
    return
end

local resource = GetCurrentResourceName()
local garageName = 'vms_housing-'

local getGarageStructure = function(property)
    return {
        vehicleType = 'car',
        label = property.name,
        shared = true,
        accessPoints = {
            {
                coords = vector3(property.metadata.garage.x, property.metadata.garage.y, property.metadata.garage.z + 1.0),
                spawn = vector4(property.metadata.garage.x, property.metadata.garage.y, property.metadata.garage.z, property.metadata.garage.w),
            }
        },
        canAccess = function(src)
            local xPlayer = SV.GetPlayer(src)
            local xIdentifier = SV.GetIdentifier(xPlayer)
            local hasPermissions = exports['vms_housing']:HasPermissions(property.id, xIdentifier, 'garage')

            return hasPermissions
        end,
    }
end

RegisterNetEvent('vms_housing:sv:init', function()
    local properties = GetAllProperties()
    if properties and next(properties) then
        for id, property in pairs(properties) do
            if property.metadata.garage then
                exports['qbx_garages']:RegisterGarage(garageName .. property.id, getGarageStructure(property))
            end
        end
    end
end)

CreateThread(function()
    Wait(1000)

    exports[resource]:RegisterHook('OnPropertyCreate', function(data)
        if data.propertyData.metadata.garage then
            exports['qbx_garages']:RegisterGarage(garageName .. data.propertyId, getGarageStructure(data.propertyData))
        end
    end)
    
    exports[resource]:RegisterHook('OnPropertyEdit', function(data)
        if data.propertyData.metadata.garage then
            exports['qbx_garages']:RegisterGarage(garageName .. data.propertyId, getGarageStructure(data.propertyData))
        end
    end)
    
    exports[resource]:RegisterHook('OnPropertyDelete', function(data)
        if data.propertyData?.metadata?.garage then
            exports['qbx_garages']:DeleteGarage(garageName .. data.propertyId)
        end
    end)
end)