if Config.MenuResource ~= 'esx_menu_default' then
    return
end

function OpenMenu(data)
    ESX.UI.Menu.CloseAll()
    
    local elements = {}

    for k, v in pairs(data.options) do
        if v.isAllowed then
            table.insert(elements, {
                value = v.id,
                icon = v.icon,
                label = v.label,
                metadata = v.metadata
            })
        end
    end

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vms_housing', {
        title = data.header.label,
        elements = elements,
        align = 'left',
    }, function(menuData, menu)
        menu.close()
        SelectInteractionOption(data.propertyId, menuData.current.value, menuData.current.metadata)
    end, function(menuData, menu)
        menu.close()
    end)
end