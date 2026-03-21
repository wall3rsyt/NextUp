-- nx_merged | firstperson.lua
-- First-person aiming + recoil + vuisten damage modifier

-- Pre-compute unarmed hash zodat GetHashKey niet elke 500ms opnieuw wordt aangeroepen
local fist = GetHashKey('WEAPON_UNARMED')
CreateThread(function()
    while true do
        Wait(500)
        local _, weapon = GetCurrentPedWeapon(PlayerPedId(), true)
        SetPlayerWeaponDamageModifier(PlayerId(), weapon == UNARMED_HASH and 0.0 or 1.0)
    end
end)

-- First person aiming + recoil
CreateThread(function()
    while true do
        Wait(0)
        HideHudComponentThisFrame(14)

        local ped         = PlayerPedId()
        local _, weapon   = GetCurrentPedWeapon(ped, true)
        local camViewMode = GetFollowPedCamViewMode()

        -- Blokkeer third-person schieten
        if camViewMode ~= 4 then
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 257, true)
        end

        if IsControlPressed(0, 25) or IsPlayerFreeAiming(ped) then
            if camViewMode ~= 4 then SetFollowPedCamViewMode(4) end
        else
            if camViewMode == 4 then SetFollowPedCamViewMode(1) end
        end
    end
end)
