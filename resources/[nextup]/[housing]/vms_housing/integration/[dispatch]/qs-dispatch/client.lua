if Config.Dispatch ~= 'qs-dispatch' then
    return
end

function DispatchAlertClient(property, type)
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

    TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
        job = Config.Alarm.AlarmJobs,
        callLocation = coords,
        callCode = {code = '459', snippet = 'Burglary'},
        message = TRANSLATE('notify.lockpick:alarm_' .. type),
        flashes = false,
        blip = {
            sprite = 480,
            scale = 1.0,
            colour = 1,
            flashes = true,
            text = 'Burglary',
            time = (20 * 1000),
        },
    })
end