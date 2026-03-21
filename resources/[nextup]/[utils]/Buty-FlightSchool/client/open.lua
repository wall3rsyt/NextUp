local flightSchoolPed = nil

-- Function to spawn NPC and Target
CreateThread(function()
    local model = GetHashKey(Config.NPC.Model)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end

    flightSchoolPed = CreatePed(4, model, Config.NPC.Position.x, Config.NPC.Position.y, Config.NPC.Position.z - 1.0, Config.NPC.Position.w, false, true)
    
    SetEntityHeading(flightSchoolPed, Config.NPC.Position.w)
    FreezeEntityPosition(flightSchoolPed, true)
    SetEntityInvincible(flightSchoolPed, true)
    SetBlockingOfNonTemporaryEvents(flightSchoolPed, true)

    if Config.Framework.UseOxTarget then
        exports.ox_target:addLocalEntity(flightSchoolPed, {
            {
                name = 'flight_school_open',
                icon = 'fa-solid fa-plane',
                label = 'Open Flight School',
                onSelect = function()
                    -- REPLACE THIS WITH THE ACTUAL OPEN MENU TRIGGER OF THE SCRIPT
                    OpenFlightMenu() 
                end
            }
        })
    end
end)

-- These are your bridge functions from the original script
function VehicleSpawned(vehicle)
    -- Logic when vehicle spawns
end

function VehicleDeleted(vehicle)
    -- Logic when vehicle deleted
end

function RevivePlayer()
    -- Add your medical revive logic here if needed
end

-- 3D Text Logic (Only used if NOT using Ox Target)
function Text(text, coords)
    if Config.Framework.UseOxTarget then return end
    local dist = #(coords.xyz - GetEntityCoords(PlayerPedId()))
    if dist < 1.5 then
        DrawText3Ds(coords.x, coords.y, coords.z + 1.05, text)
    end
end

function DrawText3Ds(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end