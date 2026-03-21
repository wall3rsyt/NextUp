-- FiveM Heli Cam - heli_client.lua (Optimized)
-- Origineel: mraes v1.3, modified by rjross2013, Loque
-- Geoptimaliseerd: syntax-fouten gefixed, frame-leaks verwijderd, variabelenamen hersteld

---=========================
--- Config              ====
---=========================
local fov_max        = 80.0
local fov_min        = 5.0
local zoomspeed      = 3.0
local speed_lr       = 4.0
local speed_ud       = 4.0
local toggle_helicam    = 51
local toggle_vision     = 25
local toggle_rappel     = 154
local toggle_spotlight  = 183
local toggle_lock_on    = 22
local toggle_display    = 44
local lightup_key       = 246
local lightdown_key     = 173
local radiusup_key      = 137
local radiusdown_key    = 21
local maxtargetdistance = 700
local brightness     = 1.0
local spotradius     = 4.0
local speed_measure  = "Km/h"

-- FIX: config-tabel hernoemd van 'heli' naar 'heliModels' zodat het niet
-- conflicteert met de lokale 'heli' variabele (voertuig-handle) verderop
local heliModels = {
    "polheli",
}

-- State variabelen
-- FIX: spaties in variabelenamen verwijderd (syntax-fouten in origineel)
local target_vehicle     = nil
local manual_spotlight   = false
local tracking_spotlight = false
local vehicle_display    = 0
local helicam            = false
local fov                = (fov_max + fov_min) * 0.5
local vision_state       = 0

local Fspotlight_state   = false
local pause_Tspotlight   = false
local Tspotlight_toggle  = false
local Tspotlight_pause   = false
local Tspotlight_target  = nil
local Mspotlight_toggle  = false

---=========================
--- Decorator registratie ==
---=========================
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if NetworkIsSessionStarted() then
            DecorRegister("SpotvectorX", 3)
            DecorRegister("SpotvectorY", 3)
            DecorRegister("SpotvectorZ", 3)
            DecorRegister("Target", 3)
            return
        end
    end
end)

---=========================
--- Hoofd loop           ===
---=========================
Citizen.CreateThread(function()
    while true do
        -- FIX: als speler niet in heli zit EN helicam uit is, rustig wachten
        -- zodat de thread niet elke frame draait zonder reden
        if not IsPlayerInPolmav() and not helicam then
            Citizen.Wait(1000)
        else
            Citizen.Wait(0)
        end

        if IsPlayerInPolmav() then
            local lPed = GetPlayerPed(-1)
            local heli  = GetVehiclePedIsIn(lPed)

            if IsHeliHighEnough(heli) then
                if IsControlJustPressed(0, toggle_helicam) then
                    PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                    helicam = true
                end

                if IsControlJustPressed(0, toggle_rappel) then
                    local seat = GetPedInVehicleSeat(heli, 1) == lPed or GetPedInVehicleSeat(heli, 2) == lPed
                    if seat then
                        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                        TaskRappelFromHeli(lPed, 1)
                    else
                        SetNotificationTextEntry("STRING")
                        AddTextComponentString("~r~Can't rappel from this seat")
                        DrawNotification(false, false)
                        PlaySoundFrontend(-1, "5_Second_Timer", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", false)
                    end
                end
            end

            local isPilot = GetPedInVehicleSeat(heli, -1) == lPed

            if IsControlJustPressed(0, toggle_spotlight) and isPilot and not helicam then
                if target_vehicle then
                    if tracking_spotlight then
                        pause_Tspotlight = not pause_Tspotlight
                        TriggerServerEvent("heli:pause.tracking.spotlight", pause_Tspotlight)
                        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                    else
                        if Fspotlight_state then
                            Fspotlight_state = false
                            TriggerServerEvent("heli:forward.spotlight", Fspotlight_state)
                        end
                        local target_netID = VehToNet(target_vehicle)
                        local target_plate = GetVehicleNumberPlateText(target_vehicle)
                        local tx, ty, tz = table.unpack(GetEntityCoords(target_vehicle))
                        pause_Tspotlight   = false
                        tracking_spotlight = true
                        TriggerServerEvent("heli:tracking.spotlight", target_netID, target_plate, tx, ty, tz)
                        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                    end
                else
                    if tracking_spotlight then
                        pause_Tspotlight   = false
                        tracking_spotlight = false
                        TriggerServerEvent("heli:tracking.spotlight.toggle")
                    end
                    Fspotlight_state = not Fspotlight_state
                    TriggerServerEvent("heli:forward.spotlight", Fspotlight_state)
                    PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                end
            end

            if IsControlJustPressed(0, toggle_display) and isPilot then
                ChangeDisplay()
            end

            if target_vehicle and isPilot then
                local coords1 = GetEntityCoords(heli)
                local coords2 = GetEntityCoords(target_vehicle)
                local dist = GetDistanceBetweenCoords(coords1.x, coords1.y, coords1.z, coords2.x, coords2.y, coords2.z, false)
                if IsControlJustPressed(0, toggle_lock_on) or dist > maxtargetdistance then
                    DecorRemove(target_vehicle, "Target")
                    if tracking_spotlight then
                        TriggerServerEvent("heli:tracking.spotlight.toggle")
                    end
                    tracking_spotlight = false
                    pause_Tspotlight   = false
                    target_vehicle     = nil
                    PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                end
            end
        end

        ---=========================
        --- Helicam loop         ===
        ---=========================
        if helicam then
            SetTimecycleModifier("heliGunCam")
            SetTimecycleModifierStrength(0.3)

            local scaleform = RequestScaleformMovie("HELI_CAM")
            while not HasScaleformMovieLoaded(scaleform) do
                Citizen.Wait(0)
            end

            local lPed = GetPlayerPed(-1)
            local heli  = GetVehiclePedIsIn(lPed)
            local cam   = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)
            AttachCamToEntity(cam, heli, 0.0, 0.0, -1.5, true)
            SetCamRot(cam, 0.0, 0.0, GetEntityHeading(heli))
            SetCamFov(cam, fov)
            RenderScriptCams(true, false, 0, 1, 0)

            PushScaleformMovieFunction(scaleform, "SET_CAM_LOGO")
            PushScaleformMovieFunctionParameterInt(0)
            PopScaleformMovieFunctionVoid()

            local locked_on_vehicle = nil

            while helicam and not IsEntityDead(lPed) and GetVehiclePedIsIn(lPed) == heli and IsHeliHighEnough(heli) do

                -- Helicam toggle
                if IsControlJustPressed(0, toggle_helicam) then
                    PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                    if manual_spotlight and target_vehicle then
                        TriggerServerEvent("heli:manual.spotlight.toggle")
                        local tid   = VehToNet(target_vehicle)
                        local tpl   = GetVehicleNumberPlateText(target_vehicle)
                        local tx, ty, tz = table.unpack(GetEntityCoords(target_vehicle))
                        pause_Tspotlight   = false
                        tracking_spotlight = true
                        TriggerServerEvent("heli:tracking.spotlight", tid, tpl, tx, ty, tz)
                    end
                    manual_spotlight = false
                    helicam = false
                end

                -- Vision toggle
                if IsControlJustPressed(0, toggle_vision) then
                    PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                    ChangeVision()
                end

                -- Spotlight toggle binnen helicam
                if IsControlJustPressed(0, toggle_spotlight) then
                    if tracking_spotlight then
                        pause_Tspotlight = true
                        TriggerServerEvent("heli:pause.tracking.spotlight", pause_Tspotlight)
                        manual_spotlight = not manual_spotlight
                        if manual_spotlight then
                            local rot = GetCamRot(cam, 2)
                            local fwd = RotAnglesToVec(rot)
                            -- FIX: DecorSetFloat i.p.v. DecorSetInt voor float vectorwaarden
                            DecorSetFloat(lPed, "SpotvectorX", fwd.x)
                            DecorSetFloat(lPed, "SpotvectorY", fwd.y)
                            DecorSetFloat(lPed, "SpotvectorZ", fwd.z)
                            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                            TriggerServerEvent("heli:manual.spotlight")
                        else
                            TriggerServerEvent("heli:manual.spotlight.toggle")
                        end
                    elseif Fspotlight_state then
                        Fspotlight_state = false
                        TriggerServerEvent("heli:forward.spotlight", Fspotlight_state)
                        manual_spotlight = not manual_spotlight
                        if manual_spotlight then
                            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                            TriggerServerEvent("heli:manual.spotlight")
                        else
                            TriggerServerEvent("heli:manual.spotlight.toggle")
                        end
                    else
                        manual_spotlight = not manual_spotlight
                        if manual_spotlight then
                            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                            TriggerServerEvent("heli:manual.spotlight")
                        else
                            TriggerServerEvent("heli:manual.spotlight.toggle")
                        end
                    end
                end

                -- Licht/radius knoppen
                if IsControlJustPressed(0, lightup_key)   then TriggerServerEvent("heli:light.up")   end
                if IsControlJustPressed(0, lightdown_key) then TriggerServerEvent("heli:light.down") end
                if IsControlJustPressed(0, radiusup_key)  then TriggerServerEvent("heli:radius.up")  end
                if IsControlJustPressed(0, radiusdown_key)then TriggerServerEvent("heli:radius.down")end

                if IsControlJustPressed(0, toggle_display) then ChangeDisplay() end

                -- Camera lock-on logica
                if locked_on_vehicle then
                    if DoesEntityExist(locked_on_vehicle) then
                        PointCamAtEntity(cam, locked_on_vehicle, 0.0, 0.0, 0.0, true)
                        RenderVehicleInfo(locked_on_vehicle)

                        local c1   = GetEntityCoords(heli)
                        local c2   = GetEntityCoords(locked_on_vehicle)
                        local dist = GetDistanceBetweenCoords(c1.x, c1.y, c1.z, c2.x, c2.y, c2.z, false)

                        if IsControlJustPressed(0, toggle_lock_on) or dist > maxtargetdistance then
                            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                            if target_vehicle then DecorRemove(target_vehicle, "Target") end
                            if tracking_spotlight then
                                TriggerServerEvent("heli:tracking.spotlight.toggle")
                                tracking_spotlight = false
                            end
                            target_vehicle    = nil
                            locked_on_vehicle = nil

                            -- FIX: variabelenaam had een spatie ('old cam') in origineel — hersteld
                            local rot     = GetCamRot(cam, 2)
                            local savedFov = GetCamFov(cam)
                            local old_cam = cam
                            DestroyCam(old_cam, false)
                            cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)
                            AttachCamToEntity(cam, heli, 0.0, 0.0, -1.5, true)
                            SetCamRot(cam, rot, 2)
                            SetCamFov(cam, savedFov)
                            RenderScriptCams(true, false, 0, 1, 0)
                        end
                    else
                        locked_on_vehicle = nil
                        target_vehicle    = nil
                    end
                else
                    local zoomvalue = (1.0 / (fov_max - fov_min)) * (fov - fov_min)
                    CheckInputRotation(cam, zoomvalue)

                    local vehicle_detected = GetVehicleInView(cam)
                    if DoesEntityExist(vehicle_detected) then
                        RenderVehicleInfo(vehicle_detected)
                        if IsControlJustPressed(0, toggle_lock_on) then
                            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                            locked_on_vehicle = vehicle_detected

                            if target_vehicle then DecorRemove(target_vehicle, "Target") end
                            target_vehicle = vehicle_detected
                            NetworkRequestControlOfEntity(target_vehicle)

                            local tnid = VehToNet(target_vehicle)
                            SetNetworkIdCanMigrate(tnid, true)
                            NetworkRegisterEntityAsNetworked(tnid)
                            SetNetworkIdExistsOnAllMachines(target_vehicle, true)
                            SetEntityAsMissionEntity(target_vehicle, true, true)
                            DecorSetInt(locked_on_vehicle, "Target", 2)

                            if tracking_spotlight then
                                TriggerServerEvent("heli:tracking.spotlight.toggle")
                                target_vehicle = locked_on_vehicle
                                if not pause_Tspotlight then
                                    local tid    = VehToNet(target_vehicle)
                                    local tpl    = GetVehicleNumberPlateText(target_vehicle)
                                    local tx, ty, tz = table.unpack(GetEntityCoords(target_vehicle))
                                    pause_Tspotlight   = false
                                    tracking_spotlight = true
                                    TriggerServerEvent("heli:tracking.spotlight", tid, tpl, tx, ty, tz)
                                else
                                    tracking_spotlight = false
                                    pause_Tspotlight   = false
                                end
                            end
                        end
                    end

                    local zv = (1.0 / (fov_max - fov_min)) * (fov - fov_min)
                    HandleZoom(cam)
                    HideHUDThisFrame()

                    PushScaleformMovieFunction(scaleform, "SET_ALT_FOV_HEADING")
                    PushScaleformMovieFunctionParameterFloat(GetEntityCoords(heli).z)
                    PushScaleformMovieFunctionParameterFloat(zv)
                    PushScaleformMovieFunctionParameterFloat(GetCamRot(cam, 2).z)
                    PopScaleformMovieFunctionVoid()
                    DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
                    Citizen.Wait(0)

                    -- FIX: manual spotlight update enkel als actief
                    -- Origineel triggerde TriggerServerEvent elke frame in de else-tak!
                    if manual_spotlight then
                        local rot = GetCamRot(cam, 2)
                        local fwd = RotAnglesToVec(rot)
                        local camcoords = GetCamCoord(cam)
                        DecorSetFloat(lPed, "SpotvectorX", fwd.x)
                        DecorSetFloat(lPed, "SpotvectorY", fwd.y)
                        DecorSetFloat(lPed, "SpotvectorZ", fwd.z)
                        DrawSpotLight(camcoords, fwd, 255, 255, 255, 800.0, 10.0, brightness, spotradius, 1.0, 1.0)
                    end
                end
            end

            -- Helicam cleanup
            if manual_spotlight then
                manual_spotlight = false
                TriggerServerEvent("heli:manual.spotlight.toggle")
            end
            helicam = false
            ClearTimecycleModifier()
            fov = (fov_max + fov_min) * 0.5
            RenderScriptCams(false, false, 0, 1, 0)
            SetScaleformMovieAsNoLongerNeeded(scaleform)
            DestroyCam(cam, false)
            SetNightvision(false)
            SetSeethrough(false)
        end

        if IsPlayerInPolmav() and target_vehicle and not helicam and vehicle_display ~= 2 then
            RenderVehicleInfo(target_vehicle)
        end
    end
end)

---=========================
--- Net Events           ===
---=========================
RegisterNetEvent('heli:forward.spotlight')
AddEventHandler('heli:forward.spotlight', function(serverID, state)
    local heli = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(serverID)), false)
    SetVehicleSearchlight(heli, state, false)
end)

RegisterNetEvent('heli:Tspotlight')
AddEventHandler('heli:Tspotlight', function(serverID, target_netID, target_plate, targetposx, targetposy, targetposz)
    -- Meervoudige fallback methoden voor target identificatie
    if GetVehicleNumberPlateText(NetToVeh(target_netID)) == target_plate then
        Tspotlight_target = NetToVeh(target_netID)
    elseif GetVehicleNumberPlateText(DoesVehicleExistWithDecorator("Target")) == target_plate then
        Tspotlight_target = DoesVehicleExistWithDecorator("Target")
    elseif GetVehicleNumberPlateText(GetClosestVehicle(targetposx, targetposy, targetposz, 25.0, 0, 70)) == target_plate then
        Tspotlight_target = GetClosestVehicle(targetposx, targetposy, targetposz, 25.0, 0, 70)
    else
        local match = FindVehicleByPlate(target_plate)
        Tspotlight_target = match or nil
    end

    local heli    = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(serverID)), false)
    local heliPed = GetPlayerPed(GetPlayerFromServerId(serverID))
    Tspotlight_toggle = true
    Tspotlight_pause  = false
    tracking_spotlight = true

    while not IsEntityDead(heliPed) and GetVehiclePedIsIn(heliPed) == heli and Tspotlight_target and Tspotlight_toggle do
        Citizen.Wait(1)
        local helicoords   = GetEntityCoords(heli)
        local targetcoords = GetEntityCoords(Tspotlight_target)
        local spotVector   = targetcoords - helicoords
        local dist         = Vdist(targetcoords, helicoords)

        if Tspotlight_target and Tspotlight_toggle and not Tspotlight_pause then
            DrawSpotLight(helicoords.x, helicoords.y, helicoords.z, spotVector.x, spotVector.y, spotVector.z, 255, 255, 255, dist + 20, 10.0, brightness, 4.0, 1.0, 0.0)
        end

        if dist > maxtargetdistance then
            DecorRemove(Tspotlight_target, "Target")
            target_vehicle     = nil
            tracking_spotlight = false
            TriggerServerEvent("heli:tracking.spotlight.toggle")
            Tspotlight_target  = nil
            break
        end
    end

    Tspotlight_toggle  = false
    Tspotlight_pause   = false
    Tspotlight_target  = nil
    tracking_spotlight = false
end)

RegisterNetEvent('heli:Tspotlight.toggle')
AddEventHandler('heli:Tspotlight.toggle', function()
    Tspotlight_toggle  = false
    tracking_spotlight = false
end)

RegisterNetEvent('heli:pause.Tspotlight')
AddEventHandler('heli:pause.Tspotlight', function(serverID, pause)
    Tspotlight_pause = pause
end)

RegisterNetEvent('heli:Mspotlight')
AddEventHandler('heli:Mspotlight', function(serverID)
    if GetPlayerServerId(PlayerId()) == serverID then return end -- Piloot ziet eigen spotlight al

    local heli    = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(serverID)), false)
    local heliPed = GetPlayerPed(GetPlayerFromServerId(serverID))
    Mspotlight_toggle = true

    while not IsEntityDead(heliPed) and GetVehiclePedIsIn(heliPed) == heli and Mspotlight_toggle do
        Citizen.Wait(0)
        local helicoords = GetEntityCoords(heli)
        local spotoffset = helicoords + vector3(0.0, 0.0, -1.5)
        -- FIX: DecorGetFloat i.p.v. DecorGetInt
        local sx = DecorGetFloat(heliPed, "SpotvectorX")
        local sy = DecorGetFloat(heliPed, "SpotvectorY")
        local sz = DecorGetFloat(heliPed, "SpotvectorZ")
        if sx then
            DrawSpotLight(spotoffset.x, spotoffset.y, spotoffset.z, sx, sy, sz, 255, 255, 255, 800.0, 10.0, brightness, spotradius, 1.0, 1.0)
        end
    end

    Mspotlight_toggle = false
end)

RegisterNetEvent('heli:Mspotlight.toggle')
AddEventHandler('heli:Mspotlight.toggle', function()
    Mspotlight_toggle = false
end)

RegisterNetEvent('heli:light.up')
AddEventHandler('heli:light.up', function()
    if brightness < 10.0 then
        brightness = brightness + 1.0
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
    end
end)

RegisterNetEvent('heli:light.down')
AddEventHandler('heli:light.down', function()
    if brightness > 1.0 then
        brightness = brightness - 1.0
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
    end
end)

RegisterNetEvent('heli:radius.up')
AddEventHandler('heli:radius.up', function()
    if spotradius < 10.0 then
        spotradius = spotradius + 1.0
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
    end
end)

RegisterNetEvent('heli:radius.down')
AddEventHandler('heli:radius.down', function()
    if spotradius > 4.0 then
        spotradius = spotradius - 1.0
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
    end
end)

---=========================
--- Helper functies      ===
---=========================
function IsPlayerInPolmav()
    local lPed    = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(lPed)
    for i = 1, #heliModels do
        if IsVehicleModel(vehicle, heliModels[i]) then return true end
    end
    return false
end

function IsHeliHighEnough(heli)
    return GetEntityHeightAboveGround(heli) > 1.5
end

function ChangeVision()
    if vision_state == 0 then
        SetNightvision(true)
        vision_state = 1
    elseif vision_state == 1 then
        SetNightvision(false)
        SetSeethrough(true)
        vision_state = 2
    else
        SetSeethrough(false)
        vision_state = 0
    end
end

function ChangeDisplay()
    vehicle_display = (vehicle_display + 1) % 3
end

function HideHUDThisFrame()
    HideHelpTextThisFrame()
    HideHudAndRadarThisFrame()
    for _, id in ipairs({19, 1, 2, 3, 4, 13, 11, 12, 15, 18}) do
        HideHudComponentThisFrame(id)
    end
end

function CheckInputRotation(cam, zoomvalue)
    local rightAxisX = GetDisabledControlNormal(0, 220)
    local rightAxisY = GetDisabledControlNormal(0, 221)
    if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
        local rotation = GetCamRot(cam, 2)
        local new_z = rotation.z + rightAxisX * -1.0 * speed_ud * (zoomvalue + 0.1)
        local new_x = math.max(math.min(20.0, rotation.x + rightAxisY * -1.0 * speed_lr * (zoomvalue + 0.1)), -89.5)
        SetCamRot(cam, new_x, 0.0, new_z, 2)
    end
end

function HandleZoom(cam)
    if IsControlJustPressed(0, 241) then fov = math.max(fov - zoomspeed, fov_min) end
    if IsControlJustPressed(0, 242) then fov = math.min(fov + zoomspeed, fov_max) end
    local current_fov = GetCamFov(cam)
    if math.abs(fov - current_fov) < 0.1 then fov = current_fov end
    SetCamFov(cam, current_fov + (fov - current_fov) * 0.05)
end

function GetVehicleInView(cam)
    local coords  = GetCamCoord(cam)
    local forward = RotAnglesToVec(GetCamRot(cam, 2))
    local ray     = CastRayPointToPoint(coords, coords + (forward * 200.0), 10, GetVehiclePedIsIn(GetPlayerPed(-1)), 0)
    local _, _, _, _, entityHit = GetRaycastResult(ray)
    if entityHit > 0 and IsEntityAVehicle(entityHit) then return entityHit end
    return nil
end

function RenderVehicleInfo(vehicle)
    if not DoesEntityExist(vehicle) then return end
    local model    = GetEntityModel(vehicle)
    local vehname  = GetLabelText(GetDisplayNameFromVehicleModel(model))
    local plate    = GetVehicleNumberPlateText(vehicle)
    local speed    = GetEntitySpeed(vehicle) * (speed_measure == "MPH" and 2.236936 or 3.6)

    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.0, vehicle_display == 0 and 0.49 or 0.55)
    SetTextColour(255, 255, 255, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    if vehicle_display == 0 then
        AddTextComponentString(("Speed: %d %s\nModel: %s\nPlate: %s"):format(math.ceil(speed), speed_measure, vehname, plate))
    elseif vehicle_display == 1 then
        AddTextComponentString(("Model: %s\nPlate: %s"):format(vehname, plate))
    end
    DrawText(0.45, 0.9)
end

function RotAnglesToVec(rot)
    local z   = math.rad(rot.z)
    local x   = math.rad(rot.x)
    local num = math.abs(math.cos(x))
    return vector3(-math.sin(z) * num, math.cos(z) * num, math.sin(x))
end

-- Entity enumerator (IllidanS4)
local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then enum.destructor(enum.handle) end
        enum.destructor = nil
        enum.handle     = nil
    end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then disposeFunc(iter) return end
        local enum = setmetatable({handle = iter, destructor = disposeFunc}, entityEnumerator)
        local next = true
        repeat
            coroutine.yield(id)
            next, id = moveFunc(iter)
        until not next
        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function FindVehicleByPlate(plate)
    for vehicle in EnumerateVehicles() do
        if GetVehicleNumberPlateText(vehicle) == plate then return vehicle end
    end
end