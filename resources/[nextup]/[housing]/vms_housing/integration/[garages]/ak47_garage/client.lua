if Config.Garages ~= 'ak47_garage' then
    return
end

function OpenGarage(propertyId, propertyData)
    local myPed = PlayerPedId()
    local myVehicle = GetVehiclePedIsIn(myPed, false)
    local isInVehicle = myVehicle and myVehicle ~= 0 and GetPedInVehicleSeat(myVehicle, -1) == myPed
    if isInVehicle then
        TriggerEvent("ak47_garage:housing:storevehicle", "Housing "..propertyId, 'car')
    else
        TriggerEvent("ak47_garage:housing:takevehicle", "Housing "..propertyId, 'car')
    end
end