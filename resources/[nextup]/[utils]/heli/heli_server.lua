
local broadcastEvents = {
    ["heli:forward.spotlight"]       = "heli:forward.spotlight",
    ["heli:tracking.spotlight"]      = "heli:Tspotlight",
    ["heli:tracking.spotlight.toggle"] = "heli:Tspotlight.toggle",
    ["heli:pause.tracking.spotlight"] = "heli:pause.Tspotlight",
    ["heli:manual.spotlight"]        = "heli:Mspotlight",
    ["heli:manual.spotlight.toggle"] = "heli:Mspotlight.toggle",
    ["heli:light.up"]                = "heli:light.up",
    ["heli:light.down"]              = "heli:light.down",
    ["heli:radius.up"]               = "heli:radius.up",
    ["heli:radius.down"]             = "heli:radius.down",
}

for serverEvent, clientEvent in pairs(broadcastEvents) do
    RegisterNetEvent(serverEvent)
    AddEventHandler(serverEvent, function(...)
        local serverID = source
        TriggerClientEvent(clientEvent, -1, serverID, ...)
    end)
end