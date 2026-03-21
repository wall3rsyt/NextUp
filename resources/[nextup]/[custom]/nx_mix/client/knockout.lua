-- nx_merged | knockout client

-- Pre-compute weapon hashes zodat GetHashKey niet elke seconde opnieuw loopt
local knockoutWeaponHashes = {}
for _, name in ipairs(Config.knockout_weapons) do
    knockoutWeaponHashes[#knockoutWeaponHashes + 1] = GetHashKey(name)
end

local optieActief = false

local function hasValidWeapon()
    local ped = PlayerPedId()
    for _, hash in ipairs(knockoutWeaponHashes) do
        if HasPedGotWeapon(ped, hash, false) then return true end
    end
    return false
end

local function knockoutPed(targetPed)
    if DoesEntityExist(targetPed) and not IsPedDeadOrDying(targetPed) then
        ClearPedTasksImmediately(targetPed)
        SetPedToRagdoll(targetPed, 5000, 5000, 0, true, true, false)
    end
end

local function playAnim(ped, dict, anim, duration)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(10) end
    TaskPlayAnim(ped, dict, anim, 8.0, -8.0, duration, 48, 0, false, false, false)
end

CreateThread(function()
    while true do
        Wait(1000)
        local hasWeapon = hasValidWeapon()
        if hasWeapon and not optieActief then
            optieActief = true
            exports.ox_target:addGlobalPlayer({
                {
                    name     = "knockout_player",
                    icon     = 'fas fa-hand-paper',
                    label    = "Sla Knockout...",
                    distance = Config.knockout_distance,
                    onSelect = function(data)
                        local ped = PlayerPedId()
                        playAnim(ped, "melee@pistol@streamed_core", "pistol_idle_whip", 800)
                        SetTimeout(800, function()
                            local targetId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(data.entity))
                            TriggerServerEvent('nx_merged:knockoutPlayer', targetId)
                        end)
                    end
                }
            })
        elseif not hasWeapon and optieActief then
            optieActief = false
            exports.ox_target:removeGlobalPlayer("knockout_player")
        end
    end
end)

RegisterNetEvent('nx_merged:doKnockout')
AddEventHandler('nx_merged:doKnockout', function()
    knockoutPed(PlayerPedId())
end)
