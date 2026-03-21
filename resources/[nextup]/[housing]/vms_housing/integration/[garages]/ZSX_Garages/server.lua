if Config.Garages ~= 'ZSX_Garages' then
    return
end

local resource = GetCurrentResourceName()
local garageName = 'vms_housing-'

local GetPlayersAccess = function(owner, renter, permissions)
    local players = {}
    local added = {}

    if owner then
        table.insert(players, owner)
    elseif renter then
        table.insert(players, renter)
        added[renter] = true
    end

    for identifier, perms in pairs(permissions) do
        if perms.garage and not added[renter] then
            table.insert(players, identifier)
        end
    end

    return players;
end

RegisterNetEvent('vms_housing:sv:init', function()
    local properties = GetAllProperties()
    if properties and next(properties) then
        for id, property in pairs(properties) do
            if property.metadata.garage then
                local players = property.metadata.isOwnedByAgency and {} or GetPlayersAccess(property.owner, property.renter, property.permissions)
                local coordinates = {vector4( property.metadata.garage.x, property.metadata.garage.y, property.metadata.garage.z, property.metadata.garage.w)}
                exports['ZSX_Garages']:AddTempGarage(garageName .. property.id, property.name, true, 'player', players, coordinates)
            end
        end
    end
end)

CreateThread(function()
    Wait(1000)

    exports[resource]:RegisterHook('OnPropertyCreate', function(data)
        if data.propertyData.metadata.garage then
            local coordinates = {vector4(data.propertyData.metadata.garage.x, data.propertyData.metadata.garage.y, data.propertyData.metadata.garage.z, data.propertyData.metadata.garage.w)}
            exports['ZSX_Garages']:AddTempGarage(garageName .. data.propertyId, data.propertyData.name, true, 'player', {}, coordinates)
        end
    end)
    
    exports[resource]:RegisterHook('OnPropertyEdit', function(data)
        if data.propertyData.metadata.garage then
            local coordinates = {vector4(data.propertyData.metadata.garage.x, data.propertyData.metadata.garage.y, data.propertyData.metadata.garage.z, data.propertyData.metadata.garage.w)}
            exports['ZSX_Garages']:UpdateTempGarageCoords(garageName .. data.propertyId, coordinates)
        end
    end)
    
    exports[resource]:RegisterHook('OnPropertyDelete', function(data)
        if data.propertyData?.metadata?.garage then
            exports['ZSX_Garages']:UpdateTempGarageDisable(garageName .. data.propertyId, true)
        end
    end)

    exports[resource]:RegisterHook('OnPermissionUpdate', function(data)
        if data.propertyData?.metadata?.garage then
            local players = GetPlayersAccess(data.propertyData.owner, data.propertyData.renter, data.propertyData.permissions)
            exports['ZSX_Garages']:UpdateTempGaragePlayerList(garageName .. data.propertyId, players)
        end
    end)

    exports[resource]:RegisterHook('OnOwnerChange', function(data)
        if data.propertyData?.metadata?.garage then
            if (not data.propertyData.owner and not data.propertyData.renter) or data.propertyData.metadata.isOwnedByAgency then
                exports['ZSX_Garages']:UpdateTempGarageDisable(garageName .. data.propertyId, true)
            else
                local players = GetPlayersAccess(data.propertyData.owner, data.propertyData.renter, data.propertyData.permissions)
                exports['ZSX_Garages']:UpdateTempGaragePlayerList(garageName .. data.propertyId, players)
                exports['ZSX_Garages']:UpdateTempGarageDisable(garageName .. data.propertyId, false)
            end
        end
    end)

    exports[resource]:RegisterHook('OnRenterChange', function(data)
        if data.propertyData?.metadata?.garage then
            if (not data.propertyData.owner and not data.propertyData.renter) or data.propertyData.metadata.isOwnedByAgency then
                exports['ZSX_Garages']:UpdateTempGarageDisable(garageName .. data.propertyId, true)
            else
                local players = GetPlayersAccess(data.propertyData.owner, data.propertyData.renter, data.propertyData.permissions)
                exports['ZSX_Garages']:UpdateTempGaragePlayerList(garageName .. data.propertyId, players)
                exports['ZSX_Garages']:UpdateTempGarageDisable(garageName .. data.propertyId, false)
            end
        end
    end)
end)