if Config.Dispatch then
    return
end

function DispatchAlertServer(src, xPlayer, property, type)
    -- type:
    --   'start'
    --   'success'
    --   'failed'
    
    if not property then
        return
    end
    
    local coords = nil
    if property.type == 'mlo' then
        coords = vector3(property.metadata.menu.x, property.metadata.menu.y, property.metadata.menu.z)
    else
        if property.object_id then
            local object = GetProperty(property.object_id)
            if object.type == 'building' then
                coords = vector3(object.metadata.enter.x, object.metadata.enter.y, object.metadata.enter.z)
                goto skip
            end
        end
        coords = vector3(property.metadata.enter.x, property.metadata.enter.y, property.metadata.enter.z)
        ::skip::
    end

    if not coords then
        return
    end

    TriggerClientEvent('vms_housing:cl:dispatchAlert', -1, tostring(property.id), coords, type)
end