if Config.Garages ~= 'qb-garages' then
    return
end

DisableGarageRegistration = true

AddEventHandler('vms_housing:cl:enteredPropertyZone', function(propertyId, propertyData)
    TriggerEvent('qb-garages:client:setHouseGarage', propertyId)
end)

AddEventHandler('vms_housing:cl:leftPropertyZone', function(propertyId)
    TriggerEvent('qb-garages:client:setHouseGarage', propertyId)
end)

AddEventHandler('vms_housing:cl:updatedOwner', function(propertyId)
    local onPropertyZone, playerPropertyId = exports[GetCurrentResourceName()]:IsPlayerOnPropertyZone()
    if onPropertyZone and propertyId == playerPropertyId then
        TriggerEvent('qb-garages:client:setHouseGarage', propertyId)
    end
end)

AddEventHandler('vms_housing:cl:updatedRenter', function(propertyId)
    local onPropertyZone, playerPropertyId = exports[GetCurrentResourceName()]:IsPlayerOnPropertyZone()
    if onPropertyZone and propertyId == playerPropertyId then
        TriggerEvent('qb-garages:client:setHouseGarage', propertyId)
    end
end)

AddEventHandler('vms_housing:cl:updatedPermissions', function(propertyId)
    local onPropertyZone, playerPropertyId = exports[GetCurrentResourceName()]:IsPlayerOnPropertyZone()
    if onPropertyZone and propertyId == playerPropertyId then
        TriggerEvent('qb-garages:client:setHouseGarage', propertyId)
    end
end)