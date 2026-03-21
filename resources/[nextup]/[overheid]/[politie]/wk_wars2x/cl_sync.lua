--[[---------------------------------------------------------------------------------------
	Wraith ARS 2X — cl_sync.lua
	Original by WolfKnight | Optimised for wk_wars2x NL build
	MIT License © 2020-2021 WolfKnight
---------------------------------------------------------------------------------------]]--

-- Register decorator for remote-open state sync
DecorRegister("wk_wars2x_sync_remoteOpen", 2)

-- Shared antenna/camera list
local ANTENNAS = { "front", "rear" }

-- Generic restore helper: copies backed-up data back via get/set/clear functions
local function RestoreData(obj, getFunc, setFunc, clearFunc, key)
	local data = key and getFunc(obj, key) or getFunc(obj)
	if data == nil then return end

	if key then
		setFunc(obj, key, data)
		clearFunc(obj, key, nil)
	else
		setFunc(obj, data)
		clearFunc(obj, nil)
	end
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  PLATE READER — SYNC EXTENSIONS
-- ══════════════════════════════════════════════════════════════════════════════════════
READER.backupData = {
	cams = { front = nil, rear = nil }
}

function READER:GetReaderDataForSync()
	return { front = self.vars.cams.front, rear = self.vars.cams.rear }
end

function READER:SetReaderCamData(cam, data)
	if type(data) == "table" then self.vars.cams[cam] = data end
end

function READER:GetBackupReaderData(cam)      return self.backupData.cams[cam]    end
function READER:SetBackupReaderData(cam, data) self.backupData.cams[cam] = data   end

function READER:IsThereBackupData()
	return self.backupData.cams.front ~= nil or self.backupData.cams.rear ~= nil
end

function READER:BackupData()
	local data = self:GetReaderDataForSync()
	for _, cam in ipairs(ANTENNAS) do
		if self.backupData.cams[cam] == nil then
			self.backupData.cams[cam] = data[cam]
		end
	end
end

function READER:LoadDataFromDriver(data)
	self:BackupData()
	SetTimeout(50, function()
		for _, cam in ipairs(ANTENNAS) do
			self:SetReaderCamData(cam, data[cam])
		end
		self:ForceNUIUpdate(true)
	end)
end

function READER:RestoreFromBackup()
	for _, cam in ipairs(ANTENNAS) do
		RestoreData(READER, READER.GetBackupReaderData, READER.SetReaderCamData, READER.SetBackupReaderData, cam)
	end
	self:ForceNUIUpdate(true)
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  RADAR — SYNC EXTENSIONS
-- ══════════════════════════════════════════════════════════════════════════════════════
RADAR.backupData = {
	power    = nil,
	om       = nil,
	antennas = { front = nil, rear = nil },
}

function RADAR:GetRadarDataForSync()
	return {
		power = self.vars.power,
		om    = self.vars.settings,
		front = self.vars.antennas.front,
		rear  = self.vars.antennas.rear,
	}
end

function RADAR:GetOMTableData()    return self.vars.settings end

function RADAR:SetOMTableData(data)
	if type(data) == "table" then
		self.vars.settings = data
		self:UpdateOptionIndexes(false)
	end
end

function RADAR:SetAntennaTableData(ant, data)
	if type(data) == "table" then self.vars.antennas[ant] = data end
end

-- Backup getters / setters
function RADAR:GetBackupPowerState()       return self.backupData.power          end
function RADAR:SetBackupPowerState(s)      self.backupData.power = s             end
function RADAR:GetBackupOMData()           return self.backupData.om             end
function RADAR:SetBackupOMData(d)          self.backupData.om = d                end
function RADAR:GetBackupAntennaData(ant)   return self.backupData.antennas[ant]  end
function RADAR:SetBackupAntennaData(ant,d) self.backupData.antennas[ant] = d     end

function RADAR:IsThereBackupData()
	return self.backupData.om ~= nil
		or self.backupData.antennas.front ~= nil
		or self.backupData.antennas.rear  ~= nil
end

function RADAR:BackupData()
	local data = self:GetRadarDataForSync()

	if self.backupData.power == nil then self.backupData.power = data.power end
	if self.backupData.om    == nil then self.backupData.om    = data.om    end

	if data.power then
		for _, ant in ipairs(ANTENNAS) do
			if self.backupData.antennas[ant] == nil then
				self.backupData.antennas[ant] = data[ant]
			end
		end
	end
end

function RADAR:LoadDataFromDriver(data)
	self:BackupData()
	SetTimeout(50, function()
		self:SetOMTableData(data.om)
		for _, ant in ipairs(ANTENNAS) do
			self:SetAntennaTableData(ant, data[ant])
		end
		self:SetPowerState(data.power, true)
		if data.power then self:SendSettingUpdate() end
	end)
end

function RADAR:RestoreFromBackup()
	RestoreData(RADAR, RADAR.GetBackupOMData, RADAR.SetOMTableData, RADAR.SetBackupOMData)

	for _, ant in ipairs(ANTENNAS) do
		RestoreData(RADAR, RADAR.GetBackupAntennaData, RADAR.SetAntennaTableData, RADAR.SetBackupAntennaData, ant)
	end

	local pwr = self.backupData.power
	if pwr ~= nil then
		self:SetPowerState(pwr, true)
		self.backupData.power = nil
	end

	if pwr then
		SetTimeout(50, function() self:SendSettingUpdate() end)
	end
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  SYNC OBJECT
-- ══════════════════════════════════════════════════════════════════════════════════════
SYNC = {}

-- Returns true if the other player already has the remote open
function SYNC:IsRemoteAlreadyOpen(ply)
	if not RADAR:IsPassengerViewAllowed() then return false end
	return DecorGetBool(ply, "wk_wars2x_sync_remoteOpen")
end

-- Sets the local remote-open decorator
function SYNC:SetRemoteOpenState(state)
	if RADAR:IsPassengerViewAllowed() then
		DecorSetBool(PLY.ped, "wk_wars2x_sync_remoteOpen", state)
	end
end

-- Core helper: resolves the other player's server ID and calls cb(id)
function SYNC:SyncData(cb)
	if not PLY:CanControlRadar() then return end
	local other = PLY:GetOtherPedServerId()
	if other then cb(other) end
end

-- ── Outbound sync helpers ────────────────────────────────────────────────────────────
function SYNC:SendPowerState(state)
	self:SyncData(function(ply)
		TriggerServerEvent("wk_wars2x_sync:sendPowerState", ply, state)
	end)
end

function SYNC:SendAntennaPowerState(state, ant)
	self:SyncData(function(ply)
		TriggerServerEvent("wk_wars2x_sync:sendAntennaPowerState", ply, state, ant)
	end)
end

function SYNC:SendAntennaMode(ant, mode)
	self:SyncData(function(ply)
		TriggerServerEvent("wk_wars2x_sync:sendAntennaMode", ply, ant, mode)
	end)
end

function SYNC:LockAntennaSpeed(ant, data)
	self:SyncData(function(ply)
		TriggerServerEvent("wk_wars2x_sync:sendLockAntennaSpeed", ply, ant, data)
	end)
end

function SYNC:SendUpdatedOMData(data)
	self:SyncData(function(ply)
		TriggerServerEvent("wk_wars2x_sync:sendUpdatedOMData", ply, data)
	end)
end

function SYNC:LockReaderCam(cam, data)
	self:SyncData(function(ply)
		TriggerServerEvent("wk_wars2x_sync:sendLockCameraPlate", ply, cam, data)
	end)
end

-- Requests radar data from the driver on vehicle entry, or restores backup on becoming driver
function SYNC:SyncDataOnEnter()
	if PLY:IsPassenger() then
		local driver = PLY:GetOtherPedServerId()
		if driver then TriggerServerEvent("wk_wars2x_sync:requestRadarData", driver) end
	elseif PLY:IsDriver() and RADAR:IsThereBackupData() then
		RADAR:RestoreFromBackup()
		READER:RestoreFromBackup()
	end
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  INBOUND NET EVENTS
-- ══════════════════════════════════════════════════════════════════════════════════════

-- Helper: register + add handler in one call
local function OnNet(event, fn)
	RegisterNetEvent(event)
	AddEventHandler(event, fn)
end

OnNet("wk_wars2x_sync:receivePowerState", function(state)
	RADAR:SetPowerState(state, false)
end)

OnNet("wk_wars2x_sync:receiveAntennaPowerState", function(state, antenna)
	-- Only toggle if local state differs
	if RADAR:IsAntennaTransmitting(antenna) ~= state then
		RADAR:ToggleAntenna(antenna)
	end
end)

OnNet("wk_wars2x_sync:receiveAntennaMode", function(antenna, mode)
	RADAR:SetAntennaMode(antenna, mode)
end)

OnNet("wk_wars2x_sync:receiveLockAntennaSpeed", function(antenna, data)
	RADAR:LockAntennaSpeed(antenna, data, true)
end)

OnNet("wk_wars2x_sync:receiveLockCameraPlate", function(camera, data)
	READER:LockCam(camera, true, false, data)
end)

-- Driver: collect and forward all radar data to the requesting passenger
OnNet("wk_wars2x_sync:getRadarDataFromDriver", function(playerFor)
	TriggerServerEvent("wk_wars2x_sync:sendRadarDataForPassenger", playerFor, {
		RADAR:GetRadarDataForSync(),
		READER:GetReaderDataForSync(),
	})
end)

-- Passenger: receive full radar + reader data from driver
OnNet("wk_wars2x_sync:receiveRadarData", function(data)
	RADAR:LoadDataFromDriver(data[1])
	READER:LoadDataFromDriver(data[2])
end)

-- Receive updated operator menu data
OnNet("wk_wars2x_sync:receiveUpdatedOMData", function(data)
	if PLY:IsDriver() or (PLY:IsPassenger() and RADAR:IsThereBackupData()) then
		RADAR:SetOMTableData(data)
		RADAR:SendSettingUpdate()
	end
end)