--[[---------------------------------------------------------------------------------------
	Wraith ARS 2X — sv_sync.lua
	Original by WolfKnight | Optimised for wk_wars2x NL build
	MIT License © 2020-2021 WolfKnight
---------------------------------------------------------------------------------------]]--

-- Helper: register server event + handler in one call
local function OnNet(event, fn)
	RegisterNetEvent(event)
	AddEventHandler(event, fn)
end

-- ── Simple relay events (server just forwards to target client) ──────────────────────
OnNet("wk_wars2x_sync:sendPowerState", function(target, state)
	TriggerClientEvent("wk_wars2x_sync:receivePowerState", target, state)
end)

OnNet("wk_wars2x_sync:sendAntennaPowerState", function(target, state, ant)
	TriggerClientEvent("wk_wars2x_sync:receiveAntennaPowerState", target, state, ant)
end)

OnNet("wk_wars2x_sync:sendAntennaMode", function(target, ant, mode)
	TriggerClientEvent("wk_wars2x_sync:receiveAntennaMode", target, ant, mode)
end)

OnNet("wk_wars2x_sync:sendLockAntennaSpeed", function(target, ant, data)
	TriggerClientEvent("wk_wars2x_sync:receiveLockAntennaSpeed", target, ant, data)
end)

OnNet("wk_wars2x_sync:sendLockCameraPlate", function(target, cam, data)
	TriggerClientEvent("wk_wars2x_sync:receiveLockCameraPlate", target, cam, data)
end)

-- ── Radar data sync ──────────────────────────────────────────────────────────────────

-- Passenger requests radar data → ask the driver for it
OnNet("wk_wars2x_sync:requestRadarData", function(target)
	TriggerClientEvent("wk_wars2x_sync:getRadarDataFromDriver", target, source)
end)

-- Driver sends full radar data → forward to passenger
OnNet("wk_wars2x_sync:sendRadarDataForPassenger", function(playerFor, data)
	TriggerClientEvent("wk_wars2x_sync:receiveRadarData", playerFor, data)
end)

-- Updated operator menu data → forward to other player
OnNet("wk_wars2x_sync:sendUpdatedOMData", function(playerFor, data)
	TriggerClientEvent("wk_wars2x_sync:receiveUpdatedOMData", playerFor, data)
end)