-- Configuratie
local config = {
    toggleKey   = 20,   -- Z-toets (keycode 20)
    maxDistance = 20,   -- Max afstand om ID's te tonen
    updateRate  = 1000, -- Afstand update interval (ms)
}

-- State
local showIDs         = false
local playerDistances = {}

-- ─── DrawText3D ───────────────────────────────────────────────────────────────
local function DrawText3D(coords, text, r, g, b)
    local onScreen, sx, sy = World3dToScreen2d(coords.x, coords.y, coords.z + 1.0)
    if not onScreen then return end

    local dist  = #(GetGameplayCamCoords() - coords)
    local scale = (1.0 / dist) * 2.0 * (1.0 / GetGameplayCamFov()) * 100.0

    SetTextScale(0.0, 0.55 * scale)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(sx, sy)
end

-- ─── Afstand bijhouden ────────────────────────────────────────────────────────
CreateThread(function()
    local playerPed = PlayerPedId()

    while true do
        playerPed = PlayerPedId()
        local origin = GetEntityCoords(playerPed)

        for _, id in ipairs(GetActivePlayers()) do
            local ped = GetPlayerPed(id)
            if ped ~= playerPed then
                playerDistances[id] = #(origin - GetEntityCoords(ped))
            end
        end

        Wait(config.updateRate)
    end
end)

-- ─── Toggle via toetsinvoer ───────────────────────────────────────────────────
CreateThread(function()
    while true do
        showIDs = IsControlPressed(0, config.toggleKey)
        Wait(0)
    end
end)

-- ─── Render loop ──────────────────────────────────────────────────────────────
CreateThread(function()
    Wait(500) -- Wacht op initialisatie

    local selfId    = PlayerId()
    local selfPed   = PlayerPedId()
    local selfServId = tostring(GetPlayerServerId(selfId))

    while true do
        if showIDs then
            -- Zelf ID
            selfPed   = PlayerPedId()
            DrawText3D(GetEntityCoords(selfPed), selfServId, 255, 255, 255)

            -- Andere spelers
            for _, id in ipairs(GetActivePlayers()) do
                local dist = playerDistances[id]
                if dist and dist < config.maxDistance then
                    local ped    = GetPlayerPed(id)
                    local coords = GetEntityCoords(ped)
                    local servId = tostring(GetPlayerServerId(id))

                    if NetworkIsPlayerTalking(id) then
                        DrawText3D(coords, servId, 247, 124, 24)
                        DrawMarker(27,
                            coords.x, coords.y, coords.z - 0.97,
                            0, 0, 0, 0, 0, 0,
                            1.001, 1.0001, 0.5001,
                            173, 216, 230, 100,
                            false, false, 2, false, nil, nil, false
                        )
                    else
                        DrawText3D(coords, servId, 255, 255, 255)
                    end
                end
            end
        end

        Wait(0)
    end
end)