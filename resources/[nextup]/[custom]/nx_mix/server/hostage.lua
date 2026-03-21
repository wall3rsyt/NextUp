-- nx_merged | hostage server

local takingHostage = {}
local takenHostage  = {}

RegisterServerEvent("TakeHostage:sync")
AddEventHandler("TakeHostage:sync", function(targetSrc)
    local src = source
    targetSrc = tonumber(targetSrc)

    if not targetSrc or src == targetSrc then return end
    if takingHostage[src] or takenHostage[src] then return end
    if takenHostage[targetSrc] or takingHostage[targetSrc] then return end

    TriggerClientEvent("TakeHostage:syncTarget", targetSrc, src)
    takingHostage[src]      = targetSrc
    takenHostage[targetSrc] = src
end)

RegisterServerEvent("TakeHostage:releaseHostage")
AddEventHandler("TakeHostage:releaseHostage", function(targetSrc)
    local src = source
    targetSrc = tonumber(targetSrc)

    if takingHostage[src] ~= targetSrc then return end

    TriggerClientEvent("TakeHostage:releaseHostage", targetSrc)
    takingHostage[src]      = nil
    takenHostage[targetSrc] = nil
end)

RegisterServerEvent("TakeHostage:killHostage")
AddEventHandler("TakeHostage:killHostage", function(targetSrc)
    local src = source
    targetSrc = tonumber(targetSrc)

    if takingHostage[src] ~= targetSrc then return end

    TriggerClientEvent("TakeHostage:killHostage", targetSrc)
    takingHostage[src]      = nil
    takenHostage[targetSrc] = nil
end)

RegisterServerEvent("TakeHostage:stop")
AddEventHandler("TakeHostage:stop", function(targetSrc)
    local src = source
    targetSrc = tonumber(targetSrc)

    if takingHostage[src] == targetSrc then
        TriggerClientEvent("TakeHostage:cl_stop", targetSrc)
        takingHostage[src]      = nil
        takenHostage[targetSrc] = nil
    elseif takenHostage[src] == targetSrc then
        TriggerClientEvent("TakeHostage:cl_stop", targetSrc)
        takenHostage[src]        = nil
        takingHostage[targetSrc] = nil
    end
end)

AddEventHandler('playerDropped', function()
    local src = tonumber(source)

    if takingHostage[src] then
        TriggerClientEvent("TakeHostage:cl_stop", takingHostage[src])
        takenHostage[takingHostage[src]] = nil
        takingHostage[src]               = nil
    end
    if takenHostage[src] then
        TriggerClientEvent("TakeHostage:cl_stop", takenHostage[src])
        takingHostage[takenHostage[src]] = nil
        takenHostage[src]                = nil
    end
end)