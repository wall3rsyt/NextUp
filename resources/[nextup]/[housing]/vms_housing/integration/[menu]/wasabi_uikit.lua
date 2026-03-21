if Config.MenuResource ~= 'wasabi_uikit' then
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

    exports.wasabi_uikit:RegisterContextMenu({
        id = "vms_housing",
        title = data.header.label,
        position = 'offcenter-right',
        options = elements,
    })

    exports.wasabi_uikit:OpenContextMenu("vms_housing")
end
