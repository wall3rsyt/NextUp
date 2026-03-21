exports("deleteEntity",
    ---@param entity number
    function(entity)
        DeleteEntity(entity)
    end)

exports("deleteVehicle",
    ---@param entity number
    function(entity)
        if GetResourceState("AdvancedParking") == "started" then
            return exports["AdvancedParking"]:DeleteVehicle(vehicle, false)
        end
        DeleteEntity(entity)
    end)
