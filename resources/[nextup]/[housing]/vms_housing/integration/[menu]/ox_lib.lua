if Config.MenuResource ~= 'ox_lib' then
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

    exports['ox_lib']:registerContext({
        id = "vms_housing",
        title = data.header.label,
        options = elements,
    })

    exports['ox_lib']:showContext("vms_housing")
end