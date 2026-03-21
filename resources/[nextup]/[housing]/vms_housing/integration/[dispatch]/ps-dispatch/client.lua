if Config.Dispatch ~= 'ps-dispatch' then
    return
end

function DispatchAlertClient(property, type)
    local alarm = Config.Alarm
    
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

    -- To be implemented according to the ps-dispatch script according to your configuration
    -- https://github.com/Project-Sloth/ps-dispatch?tab=readme-ov-file#steps-to-create-new-alert
end