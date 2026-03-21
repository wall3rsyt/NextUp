if Config.Garages ~= 'esx_garage' then
    return
end

local parkingOnlyOwnedVehicles = false

function OpenGarage(propertyId, propertyData)
    local myPed = PlayerPedId()
    local myVehicle = GetVehiclePedIsIn(myPed, false)
    local isInVehicle = myVehicle and myVehicle ~= 0 and GetPedInVehicleSeat(myVehicle, -1) == myPed
    if isInVehicle then
        local vehicleProps = ESX.Game.GetVehicleProperties(myVehicle)

        local function checkOwner(cb)
            if not parkingOnlyOwnedVehicles then
                return cb(true)
            end

            library.Callback('esx_garage:checkVehicleOwner', function(owner)
                return cb(owner)
            end, vehicleProps.plate)
        end
        
        checkOwner(function()
            TriggerServerEvent('esx_garage:updateOwnedVehicle', true, 'property_' .. propertyId, nil, {vehicleProps = vehicleProps})
            DeleteVehicle(myVehicle)
        end)
    else
        ESX.TriggerServerCallback('esx_garage:getVehiclesInParking', function(vehicles)
            if next(vehicles) then
                local menuData = {
                    propertyId = propertyId,
                    header = {
                        icon = 'fa-solid fa-warehouse',
                        label = TRANSLATE('menu:header', propertyId),
                    },
                    options = {}
                }
                
                for i = 1, #vehicles, 1 do
                    table.insert(menuData.options, {
                        id = 'take_out_vehicle',
                        label = GetDisplayNameFromVehicleModel(vehicles[i].vehicle.model) .. ' [ ' .. vehicles[i].plate .. ' ]',
                        isAllowed = true,
                        metadata = {
                            vehicleProps = vehicles[i].vehicle,
                        }
                    })
                end

                OpenMenu(menuData)
            end
        end, 'property_' .. propertyId)
    end
end

function TakeOutVehicle(metadata)
    local isInsideProperty, propertyId = exports[GetCurrentResourceName()]:IsPlayerOnPropertyZone()
    if not isInsideProperty or not propertyId then
        return
    end
    
    local propertyData = exports[GetCurrentResourceName()]:GetProperty(propertyId)
    local garage = propertyData?.metadata?.garage
    if not garage or not garage.x then
        return
    end

    TriggerServerEvent('esx_garage:updateOwnedVehicle', false, nil, nil, {
        vehicleProps = metadata.vehicleProps,
        spawnPoint = { heading = garage.w }
    }, vector3(garage.x, garage.y, garage.z))
end