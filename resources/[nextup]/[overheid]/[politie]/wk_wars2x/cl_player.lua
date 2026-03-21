--[[---------------------------------------------------------------------------------------
	Wraith ARS 2X — cl_player.lua
	Original by WolfKnight | Optimised for wk_wars2x NL build
	MIT License © 2020-2021 WolfKnight
---------------------------------------------------------------------------------------]]--

PLY = {
	ped             = PlayerPedId(),
	veh             = nil,
	inDriverSeat    = false,
	inPassengerSeat = false,
	vehClassValid   = false,
}

-- ── State checks ─────────────────────────────────────────────────────────────────────
function PLY:VehicleStateValid()
	return self.veh and self.veh > 0 and DoesEntityExist(self.veh) and self.vehClassValid
end

function PLY:IsDriver()    return self:VehicleStateValid() and self.inDriverSeat    end
function PLY:IsPassenger() return self:VehicleStateValid() and self.inPassengerSeat end

function PLY:CanViewRadar()
	return self:IsDriver() or (self:IsPassenger() and RADAR:IsPassengerViewAllowed())
end

function PLY:CanControlRadar()
	return self:IsDriver() or (self:IsPassenger() and RADAR:IsPassengerControlAllowed())
end

-- ── Ped helpers ──────────────────────────────────────────────────────────────────────
-- Returns the ped in the opposite seat (driver ↔ passenger)
function PLY:GetOtherPed()
	if self:IsDriver()    then return GetPedInVehicleSeat(self.veh,  0) end
	if self:IsPassenger() then return GetPedInVehicleSeat(self.veh, -1) end
	return nil
end

-- Returns the server ID of the opposite player, or nil
function PLY:GetOtherPedServerId()
	local ped = self:GetOtherPed()
	if ped and ped ~= 0 and IsPedAPlayer(ped) then
		return GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped))
	end
	return nil
end

-- ══════════════════════════════════════════════════════════════════════════════════════
--  THREADS
-- ══════════════════════════════════════════════════════════════════════════════════════

-- Updates local player state every 500 ms
CreateThread(function()
	while true do
		local ped = PlayerPedId()
		local veh = GetVehiclePedIsIn(ped, false)

		PLY.ped             = ped
		PLY.veh             = veh
		PLY.inDriverSeat    = GetPedInVehicleSeat(veh, -1) == ped
		PLY.inPassengerSeat = GetPedInVehicleSeat(veh,  0) == ped
		PLY.vehClassValid   = GetVehicleClass(veh) == 18

		Wait(500)
	end
end)

-- Detects vehicle entry and triggers sync
CreateThread(function()
	while true do
		if IsPedGettingIntoAVehicle(PLY.ped) and RADAR:IsPassengerViewAllowed() then
			local entering = GetVehiclePedIsEntering(PLY.ped)

			if GetVehicleClass(entering) == 18 then
				Wait(2000)  -- wait for player to be seated

				-- Only sync if the player ended up in the same vehicle
				if GetVehiclePedIsIn(PLY.ped, false) == entering then
					SYNC:SyncDataOnEnter()
				end
			end
		end

		Wait(500)
	end
end)