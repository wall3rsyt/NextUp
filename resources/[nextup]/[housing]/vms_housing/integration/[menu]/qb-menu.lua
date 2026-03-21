if Config.MenuResource ~= 'qb-menu' then
    return
end

function OpenMenu(data)
    local elements = {
        {icon = data.header.icon, header = data.header.label, isMenuHeader = true},
    }

    for k, v in pairs(data.options) do
        if v.isAllowed then
            table.insert(elements, {
                icon = v.icon, 
                header = v.label,
                params = {
                    isAction = true,
                    event = function()
                        SelectInteractionOption(data.propertyId, v.id, v.metadata)
                    end
                },
            })
        end
    end

    exports['qb-menu']:openMenu(elements)
end