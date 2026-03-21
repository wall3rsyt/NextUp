if Config.MenuResource ~= 'esx_context' then
    return
end

function OpenMenu(data)
    ESX.CloseContext()
    
    local elements = {
        {unselectable = true, icon = data.header.icon, title = data.header.label}
    }

    for k, v in pairs(data.options) do
        if v.isAllowed then
            table.insert(elements, {
                value = v.id,
                icon = v.icon,
                title = v.label,
                metadata = v.metadata
            })
        end
    end

    ESX.OpenContext('left', elements, function(menu, element)
        ESX.CloseContext()
        SelectInteractionOption(data.propertyId, element.value, element.metadata)
    end)
end