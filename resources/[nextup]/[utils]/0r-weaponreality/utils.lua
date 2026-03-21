-- ╔══════════════════════════════════════╗
-- ║        0r-weaponReality Utils        ║
-- ╚══════════════════════════════════════╝

-- ┌─ Framework Init ─────────────────────┐
local framework = Config.Framework

if framework == "oldesx" then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
elseif framework == "esx" then
    ESX = exports['es_extended']:getSharedObject()
elseif framework == "qb" then
    QBCore = exports['qb-core']:GetCoreObject()
elseif framework == "oldqb" then
    QBCore = nil
    TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
end

-- ┌─ Notification ───────────────────────┐
local notifyHandlers = {
    ["qb-notify"]     = function(msg) QBCore.Functions.Notify(msg, 'primary', 5000) end,
    ["esx-notify"]    = function(msg) ESX.ShowNotification(msg) end,
    ["custom-notify"] = function(msg) exports["mythic-notify"]:SendAlert("success", msg) end,
}

function Notification(message)
    local handler = notifyHandlers[Config.NotificationType]
    if handler then handler(message) end
end

RegisterNetEvent('0r-weaponReality:Notification')
AddEventHandler('0r-weaponReality:Notification', function(message)
    Notification(message)
end)

-- ┌─ Animation ──────────────────────────┐
function PlayAnim(ped, dict, ...)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) end
    TaskPlayAnim(ped, dict, ...)
end

-- ┌─ 3D Text ────────────────────────────┐
function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if not onScreen then return end

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextCentre(1)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(_x, _y)

    local factor = #text / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

-- ┌─ 2D Text ────────────────────────────┐
function Draw2DText(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1], colour[2], colour[3], 255)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(content)
    DrawText(x, y)
end

-- ┌─ Raycast ────────────────────────────┐
local RAD = math.pi / 180

local function RotationToDirection(rotation)
    local rx = RAD * rotation.x
    local rz = RAD * rotation.z
    local cosX = math.abs(math.cos(rx))
    return {
        x = -math.sin(rz) * cosX,
        y =  math.cos(rz) * cosX,
        z =  math.sin(rx)
    }
end

function RayCastGamePlayCamera(distance)
    local rot   = GetGameplayCamRot()
    local coord = GetGameplayCamCoord()
    local dir   = RotationToDirection(rot)

    local dest = {
        x = coord.x + dir.x * distance,
        y = coord.y + dir.y * distance,
        z = coord.z + dir.z * distance,
    }

    local _, hit, endCoords = GetShapeTestResult(
        StartShapeTestRay(coord.x, coord.y, coord.z, dest.x, dest.y, dest.z, -1, PlayerPedId(), 0)
    )
    return hit == 1, endCoords
end

-- ┌─ Laser ──────────────────────────────┐
function DrawLaser(message, color)
    local hit, coords = RayCastGamePlayCamera(Config.MaxWeaponThrowDistance)

    Draw2DText(message, 4, {255, 255, 255}, 0.4, 0.43, 0.913)

    if hit then
        local pos = GetEntityCoords(PlayerPedId())
        local r, g, b, a = color.r, color.g, color.b, color.a

        DrawLine(pos.x, pos.y, pos.z, coords.x, coords.y, coords.z, r, g, b, a)
        DrawMarker(28, coords.x, coords.y, coords.z,
            0.0, 0.0, 0.0, 0.0, 180.0, 0.0,
            0.1, 0.1, 0.1, r, g, b, a,
            false, true, 2, nil, nil, false)
    end

    return hit, coords
end