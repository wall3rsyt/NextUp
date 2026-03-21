if Config.Dispatch ~= 'lb-tablet' then
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
        coords = vector2(property.metadata.menu.x, property.metadata.menu.y)
    else
        if property.object_id then
            local object = GetProperty(property.object_id)
            if object.type == 'building' then
                coords = vector2(object.metadata.enter.x, object.metadata.enter.y)
                goto skip
            end
        end
        coords = vector2(property.metadata.enter.x, property.metadata.enter.y)
        ::skip::
    end

    if not coords then
        return
    end

    local dispatchId = exports["lb-tablet"]:AddDispatch({
        priority = 'high',
        code = '459',
        title = 'Burglary',
        description = TRANSLATE('notify.lockpick:alarm_' .. type),
        location = {
            label = property.address,
            coords = coords,
        },
        time = 20, -- 20 Seconds
        job = 'police',
    })
end