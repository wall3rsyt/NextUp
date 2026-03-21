local LEG_BONES = {
    [0xE39F] = true, [0xCA72] = true,
    [0xF9BB] = true, [0x9000] = true,
    [0x3779] = true, [0xCC4D] = true,
    [0x83C]  = true, [0x512D] = true,
}

local ragdolling = false

local function playLegHitEffect(ped)
    -- Val naar grond
    SetPedToRagdoll(ped, 1500, 1500, 0, false, false, false)
    Wait(1500)

    -- Probeer op te staan maar strompel (pijn animatie)
    local dict = 'move_m@injured'
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(10) end

    -- Pijn reactie terwijl liggend
    TaskPlayAnim(ped, dict, 'injured_walk', 4.0, -4.0, 3000, 49, 0, false, false, false)
    Wait(1000)

    -- Tweede ragdoll alsof de speler probeert op te staan maar valt
    SetPedToRagdoll(ped, 800, 800, 0, false, false, false)
    Wait(900)

    -- Strompel animatie voor Config.ragdoll_tijd ms
    local walkDict = 'move_m@injured'
    TaskPlayAnim(ped, walkDict, 'injured_walk', 4.0, -4.0, Config.ragdoll_tijd, 1, 0, false, false, false)
    Wait(Config.ragdoll_tijd)

    ClearPedTasks(ped)
    ragdolling = false
end

CreateThread(function()
    while true do
        Wait(500)
        local ped = PlayerPedId()
        if not IsPedInAnyVehicle(ped, false) and not ragdolling then
            if HasEntityBeenDamagedByAnyPed(ped) or HasEntityBeenDamagedByAnyVehicle(ped) then
                local hit, bone = GetPedLastDamageBone(ped)
                if Config.debug_bone and hit then
                    print(('[DEBUG benen] Bone-id: %s'):format(tostring(bone)))
                end
                if hit and LEG_BONES[bone] then
                    ragdolling = true
                    ClearPedLastDamageBone(ped)
                    ClearEntityLastDamageEntity(ped)
                    CreateThread(function()
                        playLegHitEffect(ped)
                    end)
                else
                    ClearPedLastDamageBone(ped)
                    ClearEntityLastDamageEntity(ped)
                end
            end
        end
    end
end)