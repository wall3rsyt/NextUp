--[[---------------------------------------------------------------------------------------
	Wraith ARS 2X — cl_plate_reader.lua
	Original by WolfKnight | Optimised for wk_wars2x NL build
	MIT License © 2020-2021 WolfKnight
---------------------------------------------------------------------------------------]]--

READER = {}

-- ══════════════════════════════════════════════════════════════════════════════════════
--  VARIABLES
-- ══════════════════════════════════════════════════════════════════════════════════════
READER.vars = {
	displayed  = false,
	hidden     = false,
	boloPlate  = nil,

	cams = {
		front = { plate = "", index = "", locked = false },
		rear  = { plate = "", index = "", locked = false },
	},
}

-- Shared camera list — avoids repeated table creation in loops
local CAMS = { "front", "rear" }


-- ══════════════════════════════════════════════════════════════════════════════════════
--  DISPLAY STATE
-- ══════════════════════════════════════════════════════════════════════════════════════
function READER:GetDisplayState()   return self.vars.displayed end
function READER:GetDisplayHidden()  return self.vars.hidden    end
function READER:SetDisplayHidden(s) self.vars.hidden = s       end

function READER:ToggleDisplayState()
	self.vars.displayed = not self.vars.displayed
	SendNUIMessage({ _type = "setReaderDisplayState", state = self.vars.displayed })
end

function READER:CanPerformMainTask()
	return self.vars.displayed and not self.vars.hidden
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  CAMERA HELPERS
-- ══════════════════════════════════════════════════════════════════════════════════════
function READER:GetPlate(cam)        return self.vars.cams[cam].plate  end
function READER:SetPlate(cam, v)     self.vars.cams[cam].plate  = v    end
function READER:GetIndex(cam)        return self.vars.cams[cam].index  end
function READER:SetIndex(cam, v)     self.vars.cams[cam].index  = v    end
function READER:GetCamLocked(cam)    return self.vars.cams[cam].locked end

-- Converts relative position (1 / -1) to camera name
function READER:GetCamFromNum(relPos)
	if relPos ==  1 then return "front" end
	if relPos == -1 then return "rear"  end
end

function READER:GetCameraDataPacket(cam)
	return { self:GetPlate(cam), self:GetIndex(cam) }
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  BOLO
-- ══════════════════════════════════════════════════════════════════════════════════════
function READER:GetBoloPlate() return self.vars.boloPlate end

function READER:SetBoloPlate(plate)
	self.vars.boloPlate = plate
	UTIL:Notify("BOLO kenteken ingesteld op: ~b~" .. plate)
end

function READER:ClearBoloPlate()
	self.vars.boloPlate = nil
	UTIL:Notify("~b~BOLO kenteken gewist!")
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  LOCK / UNLOCK
-- ══════════════════════════════════════════════════════════════════════════════════════
function READER:LockCam(cam, playBeep, isBolo, override)
	if not PLY:VehicleStateValid() or not self:CanPerformMainTask() then return end
	if self:GetPlate(cam) == "" then return end

	-- Toggle lock
	local c = self.vars.cams[cam]
	c.locked = not c.locked

	if c.locked then
		-- Apply override data if provided (passenger sync)
		if override then
			self:SetPlate(cam, override[1])
			self:SetIndex(cam, override[2])
			self:ForceNUIUpdate(false)
		end

		local vol = RADAR:GetSettingValue("plateAudio")
		if playBeep then SendNUIMessage({ _type = "audio", name = "beep",      vol = vol }) end
		if isBolo   then SendNUIMessage({ _type = "audio", name = "plate_hit", vol = vol }) end

		TriggerServerEvent("wk:onPlateLocked", cam, self:GetPlate(cam), self:GetIndex(cam))
	end

	SendNUIMessage({ _type = "lockPlate", cam = cam, state = c.locked, isBolo = isBolo })
end

-- Forces a full NUI update for both cameras — used by the passenger control system
function READER:ForceNUIUpdate(lock)
	for _, cam in ipairs(CAMS) do
		local plate = self:GetPlate(cam)
		local index = self:GetIndex(cam)

		if plate ~= "" and index ~= "" then
			SendNUIMessage({ _type = "changePlate", cam = cam, plate = plate, index = index })

			if lock then
				SendNUIMessage({ _type = "lockPlate", cam = cam, state = self:GetCamLocked(cam), isBolo = false })
			end
		end
	end
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  NET EVENTS
-- ══════════════════════════════════════════════════════════════════════════════════════
RegisterNetEvent("wk:togglePlateLock")
AddEventHandler("wk:togglePlateLock", function(cam, beep, bolo)
	READER:LockCam(cam, beep, bolo)
end)


-- ══════════════════════════════════════════════════════════════════════════════════════
--  NUI CALLBACKS
-- ══════════════════════════════════════════════════════════════════════════════════════
RegisterNUICallback("togglePlateReaderDisplay", function(_, cb)
	READER:ToggleDisplayState()
	cb("ok")
end)

RegisterNUICallback("setBoloPlate", function(plate, cb)
	READER:SetBoloPlate(plate)
	cb("ok")
end)

RegisterNUICallback("clearBoloPlate", function(_, cb)
	READER:ClearBoloPlate()
	cb("ok")
end)


-- ══════════════════════════════════════════════════════════════════════════════════════
--  MAIN SCAN FUNCTION
-- ══════════════════════════════════════════════════════════════════════════════════════
function READER:Main()
	if not PLY:VehicleStateValid() or not self:CanPerformMainTask() then return end

	-- i = 1 → front, i = -1 → rear
	for i = 1, -1, -2 do
		local cam   = self:GetCamFromNum(i)
		if self:GetCamLocked(cam) then goto continue end

		local start  = GetOffsetFromEntityInWorldCoords(PLY.veh,  0.0, 5.0  * i, 0.0)
		local finish = GetOffsetFromEntityInWorldCoords(PLY.veh, -2.5, 50.0 * i, 0.0)
		local veh    = UTIL:GetVehicleInDirection(PLY.veh, start, finish)

		if not DoesEntityExist(veh) or not IsEntityAVehicle(veh) then goto continue end

		local dir = UTIL:GetEntityRelativeDirection(
			UTIL:Round(GetEntityHeading(PLY.veh), 0),
			UTIL:Round(GetEntityHeading(veh),     0)
		)

		if dir <= 0 then goto continue end

		local plate = GetVehicleNumberPlateText(veh)

		-- Only update when the plate actually changed
		if self:GetPlate(cam) == plate then goto continue end

		local index = GetVehicleNumberPlateTextIndex(veh)
		self:SetPlate(cam, plate)
		self:SetIndex(cam, index)

		-- Auto-lock on BOLO match
		if plate == self:GetBoloPlate() then
			self:LockCam(cam, false, true)
			SYNC:LockReaderCam(cam, self:GetCameraDataPacket(cam))
		end

		SendNUIMessage({ _type = "changePlate", cam = cam, plate = plate, index = index })

		-- Sonoran CAD filter
		local sonoran = CONFIG.use_sonorancad
		if not sonoran
		or (sonoran and GetVehicleClass(veh) ~= 18
			and (UTIL:IsPlayerInVeh(veh) or IsVehiclePreviouslyOwnedByPlayer(veh)))
		then
			TriggerServerEvent("wk:onPlateScanned", cam, plate, index)
		end

		::continue::
	end
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  DISPLAY VALIDATION
-- ══════════════════════════════════════════════════════════════════════════════════════
function READER:RunDisplayValidationCheck()
	local displayed  = self:GetDisplayState()
	local hidden     = self:GetDisplayHidden()
	local vehInvalid = PLY.veh == 0 or (PLY.veh > 0 and not PLY.vehClassValid)

	if displayed and not hidden and (vehInvalid or IsPauseMenuActive()) then
		self:SetDisplayHidden(true)
		SendNUIMessage({ _type = "setReaderDisplayState", state = false })
	elseif PLY:CanViewRadar() and displayed and hidden then
		self:SetDisplayHidden(false)
		SendNUIMessage({ _type = "setReaderDisplayState", state = true })
	end
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  THREADS
-- ══════════════════════════════════════════════════════════════════════════════════════
CreateThread(function()
	while true do
		READER:Main()
		Wait(500)
	end
end)

CreateThread(function()
	Wait(100)
	while true do
		READER:RunDisplayValidationCheck()
		Wait(500)
	end
end)