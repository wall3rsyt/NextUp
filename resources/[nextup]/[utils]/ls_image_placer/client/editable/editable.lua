-- set CAN_SEE_HIDDEN_IMAGES = true to enable the player to see hidden image
-- set CAN_SEE_HIDDEN_IMAGES = false to disable it
-- Edit this as you wish, this is just a simple implementation of this mechanic

RegisterCommand('putglasses', function()
    local playerPed = PlayerPedId()  -- Get the player's ped
    local animDict = "clothingspecs"
    local animName = "try_glasses_positive_a"

    -- Load the animation dictionary
    RequestAnimDict(animDict)

    -- Wait until the dictionary has loaded
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(100)
    end

    -- Play the animation
    TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, -1, 50, false, false, false)

    -- Wait for the animation to finish (approx. 2 seconds)
    Citizen.Wait(2000)

    ClearPedTasksImmediately(playerPed)

    -- Set the glasses on the ped
    SetPedPropIndex(playerPed, 1, 5, 0, true)  -- Adjust the second and third parameters as needed

    CAN_SEE_HIDDEN_IMAGES = true
end)

RegisterCommand('removeglasses', function()
    local playerPed = PlayerPedId()
    local animDict = "clothingspecs"
    local animName = "try_glasses_positive_a"

    RequestAnimDict(animDict)

    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(100)
    end

    TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, -1, 50, false, false, false)

    Citizen.Wait(2000)

    ClearPedTasksImmediately(playerPed)

    SetPedPropIndex(playerPed, 1, 0, 0, false)

    CAN_SEE_HIDDEN_IMAGES = false
end)