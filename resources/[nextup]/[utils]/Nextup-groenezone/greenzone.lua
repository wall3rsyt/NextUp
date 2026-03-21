local locations = {
    {
        coords         = vector3(1769.55, 2636.03, 45.63),
        gangshitrzText = "Geen kogels, wel kruisen",
        discordText    = "discord.gg/NextUP",
        range          = 20.0
    },
}

local inGreenZone = false
local GZ_CONTROLS = {24, 25, 47, 58}
local playerPed   = PlayerPedId()

local function RemoveText()
    SendNUIMessage({ type = "displayText", display = false })
end

local function SetPlayerPvP(enabled)
    NetworkSetFriendlyFireOption(enabled)
    SetCanAttackFriendly(playerPed, enabled, enabled)
end

-- ─── Zone check loop ─────────────────────────────────────────────────────────

Citizen.CreateThread(function()
    while true do
        playerPed              = PlayerPedId()
        local playerCoords     = GetEntityCoords(playerPed)
        local nearestLocation  = nil
        local nearestDistance  = nil

        for _, location in ipairs(locations) do
            local distance = #(playerCoords - location.coords)
            if distance <= location.range and (not nearestDistance or distance < nearestDistance) then
                nearestDistance = distance
                nearestLocation = location
            end
        end

        if nearestLocation then
            if not inGreenZone then
                inGreenZone = true
                SetPlayerPvP(false)
                SendNUIMessage({
                    type           = "displayText",
                    display        = true,
                    gangshitrzText = nearestLocation.gangshitrzText,
                    discordText    = nearestLocation.discordText,
                })
            end
        elseif inGreenZone then
            inGreenZone = false
            SetPlayerPvP(true)
            RemoveText()
        end

        Wait(1000)
    end
end)

-- ─── Control block loop ──────────────────────────────────────────────────────

Citizen.CreateThread(function()
    while true do
        if inGreenZone then
            local ped = PlayerPedId()
            for _, control in ipairs(GZ_CONTROLS) do
                DisableControlAction(0, control, true)
            end
            DisablePlayerFiring(ped, true)
            SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
            Wait(0)
        else
            Wait(500)
        end
    end
end)

-- ─── Blokkeer wapen equippen via ox_inventory ────────────────────────────────

AddEventHandler('ox_inventory:usedItem', function()
    if inGreenZone then
        SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
    end
end)