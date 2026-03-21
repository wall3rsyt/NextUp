if Config.MenuResource ~= 'lation_ui' then
    return
end

function OpenMenu(data)
    local elements = {}

    for k, v in pairs(data.options) do
        if v.isAllowed then
            table.insert(elements, {
                icon = v.icon, 
                title = v.label, 
                onSelect = function()
                    SelectInteractionOption(data.propertyId, v.id, v.metadata)
                end
            })
        end
    end

    exports.lation_ui:registerMenu({
        id = "vms_housing",
        title = data.header.label,
        position = 'offcenter-right',
        options = elements,
    })

    exports.lation_ui:showMenu("vms_housing")
end