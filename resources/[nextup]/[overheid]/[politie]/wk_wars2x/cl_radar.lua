--[[---------------------------------------------------------------------------------------
	Wraith ARS 2X — cl_radar.lua
	Original by WolfKnight | Optimised for wk_wars2x NL build
	MIT License © 2020-2021 WolfKnight
---------------------------------------------------------------------------------------]]--

-- ── Lua stdlib cache ────────────────────────────────────────────────────────────────────
local next, type, tostring, pairs, ipairs = next, type, tostring, pairs, ipairs
local math, table = math, table
local dot = dot


-- ══════════════════════════════════════════════════════════════════════════════════════
--  UI LOADING & KEY BINDS
-- ══════════════════════════════════════════════════════════════════════════════════════
local function RegisterKeyBinds()
	if not UTIL:IsResourceNameValid() then
		UTIL:Log("ERROR: Resource name is not wk_wars2x. Key binds will not be registered.")
		return
	end

	UTIL:Log("Registering radar commands and key binds.")

	local function Bind(cmd, desc, default, fn)
		RegisterCommand(cmd, fn)
		RegisterKeyMapping(cmd, desc, "keyboard", default)
	end

	Bind("radar_remote", "Open Remote Control", CONFIG.keyDefaults.remote_control, function()
		if not RADAR:GetKeyLockState() then RADAR:OpenRemote() end
	end)

	Bind("radar_fr_ant", "Front Antenna Lock/Unlock", CONFIG.keyDefaults.front_lock, function()
		if not RADAR:GetKeyLockState() and PLY:CanControlRadar() then
			RADAR:LockAntennaSpeed("front", nil)
			SYNC:LockAntennaSpeed("front", RADAR:GetAntennaDataPacket("front"))
		end
	end)

	Bind("radar_bk_ant", "Rear Antenna Lock/Unlock", CONFIG.keyDefaults.rear_lock, function()
		if not RADAR:GetKeyLockState() and PLY:CanControlRadar() then
			RADAR:LockAntennaSpeed("rear", nil)
			SYNC:LockAntennaSpeed("rear", RADAR:GetAntennaDataPacket("rear"))
		end
	end)

	Bind("radar_fr_cam", "Front Plate Reader Lock/Unlock", CONFIG.keyDefaults.plate_front_lock, function()
		if not RADAR:GetKeyLockState() and PLY:CanControlRadar() then
			READER:LockCam("front", true, false)
			SYNC:LockReaderCam("front", READER:GetCameraDataPacket("front"))
		end
	end)

	Bind("radar_bk_cam", "Rear Plate Reader Lock/Unlock", CONFIG.keyDefaults.plate_rear_lock, function()
		if not RADAR:GetKeyLockState() and PLY:CanControlRadar() then
			READER:LockCam("rear", true, false)
			SYNC:LockReaderCam("rear", READER:GetCameraDataPacket("rear"))
		end
	end)

	Bind("radar_key_lock", "Toggle Keybind Lock", CONFIG.keyDefaults.key_lock, function()
		RADAR:ToggleKeyLock()
	end)

	RegisterCommand("reset_radar_data", function()
		DeleteResourceKvp("wk_wars2x_ui_data")
		DeleteResourceKvp("wk_wars2x_om_data")
		DeleteResourceKvp("wk_wars2x_new_user")
		UTIL:Notify("Radar data deleted, please immediately restart your game without opening the radar's remote.")
	end, false)

	TriggerEvent("chat:addSuggestion", "/reset_radar_data", "Resets the KVP data stored for the wk_wars2x resource.")
end

local function LoadUISettings()
	UTIL:Log("Attempting to load saved UI settings data.")
	local uiData = GetResourceKvpString("wk_wars2x_ui_data")

	if uiData then
		SendNUIMessage({ _type = "loadUiSettings", data = json.decode(uiData) })
		UTIL:Log("Saved UI settings data loaded!")
	else
		SendNUIMessage({ _type = "setUiDefaults", data = CONFIG.uiDefaults })
		UTIL:Log("Could not find any saved UI settings data.")
	end
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  RADAR VARIABLES
-- ══════════════════════════════════════════════════════════════════════════════════════
RADAR = {}

RADAR.vars = {
	displayed    = false,
	power        = false,
	poweringUp   = false,
	hidden       = false,

	settings = {
		fastDisplay = CONFIG.menuDefaults.fastDisplay,
		same        = CONFIG.menuDefaults.same,
		opp         = CONFIG.menuDefaults.opp,
		beep        = CONFIG.menuDefaults.beep,
		voice       = CONFIG.menuDefaults.voice,
		plateAudio  = CONFIG.menuDefaults.plateAudio,
		speedType   = CONFIG.menuDefaults.speedType,
		fastLock    = CONFIG.menuDefaults.fastLock,
		fastLimit   = CONFIG.menuDefaults.fastLimit,
	},

	menuActive         = false,
	currentOptionIndex = 1,
	menuOptions = {
		{ displayText = { "¦¦¦", "FAS" }, optionsText = { "On¦", "Off" },                                             options = { true, false },                    optionIndex = -1, settingText = "fastDisplay" },
		{ displayText = { "¦SL", "SEn" }, optionsText = { "¦1¦", "¦2¦", "¦3¦", "¦4¦", "¦5¦" },                      options = { 0.2, 0.4, 0.6, 0.8, 1.0 },        optionIndex = -1, settingText = "same" },
		{ displayText = { "¦OP", "SEn" }, optionsText = { "¦1¦", "¦2¦", "¦3¦", "¦4¦", "¦5¦" },                      options = { 0.2, 0.4, 0.6, 0.8, 1.0 },        optionIndex = -1, settingText = "opp" },
		{ displayText = { "bEE", "P¦¦" }, optionsText = { "Off", "¦1¦", "¦2¦", "¦3¦", "¦4¦", "¦5¦" },               options = { 0.0, 0.2, 0.4, 0.6, 0.8, 1.0 },   optionIndex = -1, settingText = "beep" },
		{ displayText = { "VOI", "CE¦" }, optionsText = { "Off", "¦1¦", "¦2¦", "¦3¦", "¦4¦", "¦5¦" },               options = { 0.0, 0.2, 0.4, 0.6, 0.8, 1.0 },   optionIndex = -1, settingText = "voice" },
		{ displayText = { "PLt", "AUd" }, optionsText = { "Off", "¦1¦", "¦2¦", "¦3¦", "¦4¦", "¦5¦" },               options = { 0.0, 0.2, 0.4, 0.6, 0.8, 1.0 },   optionIndex = -1, settingText = "plateAudio" },
		{ displayText = { "Uni", "tS¦" }, optionsText = { "USA", "INT" },                                             options = { "mph", "kmh" },                    optionIndex = -1, settingText = "speedType" },
	},

	patrolSpeed    = 0,

	antennas = {
		front = { xmit = false, mode = 0, speed = 0, dir = nil, fastSpeed = 0, fastDir = nil, speedLocked = false, lockedSpeed = nil, lockedDir = nil, lockedType = nil },
		rear  = { xmit = false, mode = 0, speed = 0, dir = nil, fastSpeed = 0, fastDir = nil, speedLocked = false, lockedSpeed = nil, lockedDir = nil, lockedType = nil },
	},

	maxCheckDist     = 350.0,
	sphereSizes      = {},
	capturedVehicles = {},
	validVehicles    = {},
	activeVehicles   = {},
	vehiclePool      = {},
	rayTraceState    = 0,
	numberOfRays     = 0,
	threadWaitTime   = 500,
	keyLock          = false,
}

RADAR.speedConversions = { mph = 2.236936, kmh = 3.6 }

RADAR.rayTraces = {
	{ startVec = { x =   0.0 }, endVec = { x =   0.0, y = 0.0 }, rayType = "same" },
	{ startVec = { x =  -5.0 }, endVec = { x =  -5.0, y = 0.0 }, rayType = "same" },
	{ startVec = { x =   5.0 }, endVec = { x =   5.0, y = 0.0 }, rayType = "same" },
	{ startVec = { x = -10.0 }, endVec = { x = -10.0, y = 0.0 }, rayType = "opp"  },
	{ startVec = { x = -17.0 }, endVec = { x = -17.0, y = 0.0 }, rayType = "opp"  },
}

RADAR.sorting = {
	strongest = function(a, b) return a.size  > b.size  end,
	fastest   = function(a, b) return a.speed > b.speed end,
}

local ANTENNAS = { "front", "rear" }


-- ══════════════════════════════════════════════════════════════════════════════════════
--  POWER & DISPLAY
-- ══════════════════════════════════════════════════════════════════════════════════════
function RADAR:IsPowerOn()      return self.vars.power      end
function RADAR:IsPoweringUp()   return self.vars.poweringUp end
function RADAR:SetPoweringUpState(s) self.vars.poweringUp = s end

function RADAR:SetPowerState(state, instantOverride)
	if self:IsPoweringUp() or self:IsPowerOn() == state then return end

	self.vars.power = state
	SendNUIMessage({ _type = "radarPower", state = state, override = instantOverride, fast = self:IsFastDisplayEnabled() })

	if state then
		self:SetMenuState(false)

		if not instantOverride then
			self:SetPoweringUpState(true)
			SetTimeout(2000, function()
				self:SetPoweringUpState(false)
				SendNUIMessage({ _type = "poweredUp", fast = self:IsFastDisplayEnabled() })
			end)
		end
	else
		self:ResetAntenna("front")
		self:ResetAntenna("rear")
	end
end

function RADAR:ToggleDisplayState()
	self.vars.displayed = not self.vars.displayed
	SendNUIMessage({ _type = "setRadarDisplayState", state = self.vars.displayed })
end

function RADAR:GetDisplayState()   return self.vars.displayed end
function RADAR:GetDisplayHidden()  return self.vars.hidden    end
function RADAR:SetDisplayHidden(s) self.vars.hidden = s       end

function RADAR:IsFastDisplayEnabled() return self:GetSettingValue("fastDisplay") end
function RADAR:IsEitherAntennaOn()    return self:IsAntennaTransmitting("front") or self:IsAntennaTransmitting("rear") end

function RADAR:CanPerformMainTask()
	return self:IsPowerOn() and not self:IsPoweringUp() and not self:IsMenuOpen()
end

function RADAR:GetThreadWaitTime()  return self.vars.threadWaitTime end
function RADAR:SetThreadWaitTime(t) self.vars.threadWaitTime = t    end

function RADAR:OpenRemote()
	if IsPauseMenuActive() or not PLY:CanViewRadar() then return end
	if SYNC:IsRemoteAlreadyOpen(PLY:GetOtherPed()) then
		UTIL:Notify("Another player already has the remote open.")
		return
	end

	SendNUIMessage({ _type = "openRemote" })
	SYNC:SetRemoteOpenState(true)

	if CONFIG.allow_quick_start_video and GetResourceKvpInt("wk_wars2x_new_user") == 0 then
		SendNUIMessage({ _type = "showNewUser" })
	end

	SetNuiFocus(true, true)
end

RegisterNetEvent("wk:openRemote")
AddEventHandler("wk:openRemote", function() RADAR:OpenRemote() end)

function RADAR:IsPassengerViewAllowed()    return CONFIG.allow_passenger_view end
function RADAR:IsPassengerControlAllowed() return CONFIG.allow_passenger_view and CONFIG.allow_passenger_control end
function RADAR:OnlyLockFastPlayers()       return CONFIG.only_lock_players end
function RADAR:IsFastLimitAllowed()        return CONFIG.allow_fast_limit end

function RADAR:ToggleKeyLock()
	if not PLY:CanViewRadar() then return end
	self.vars.keyLock = not self.vars.keyLock
	SendNUIMessage({ _type = "displayKeyLock", state = self.vars.keyLock })
end
function RADAR:GetKeyLockState() return self.vars.keyLock end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  FAST LIMIT
-- ══════════════════════════════════════════════════════════════════════════════════════
if RADAR:IsFastLimitAllowed() then
	function RADAR:CreateFastLimitConfig()
		local fastOptions = {
			{ displayText = { "FAS", "Loc" }, optionsText = { "On¦", "Off" }, options = { true, false }, optionIndex = 2, settingText = "fastLock" },
			{ displayText = { "FAS", "SPd" }, optionsText = {}, options = {}, optionIndex = 12,          settingText = "fastLimit" },
		}
		for i = 5, 200, 5 do
			local text = UTIL:FormatSpeed(i)
			table.insert(fastOptions[2].optionsText, text)
			table.insert(fastOptions[2].options, i)
		end
		if CONFIG.fast_limit_first_in_menu then
			table.insert(self.vars.menuOptions, 1, fastOptions[2])
			table.insert(self.vars.menuOptions, 2, fastOptions[1])
		else
			table.insert(self.vars.menuOptions, fastOptions[1])
			table.insert(self.vars.menuOptions, fastOptions[2])
		end
	end

	function RADAR:GetFastLimit()      return self:GetSettingValue("fastLimit") end
	function RADAR:IsFastLockEnabled() return self:GetSettingValue("fastLock")  end
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  OPERATOR MENU
-- ══════════════════════════════════════════════════════════════════════════════════════
function RADAR:SetMenuState(state)
	if not self:IsPowerOn() then return end
	self.vars.menuActive = state
	if state then self.vars.currentOptionIndex = 1 end
end

function RADAR:IsMenuOpen() return self.vars.menuActive end

function RADAR:CloseMenu(playAudio)
	self:SetMenuState(false)
	self:SendSettingUpdate()

	if playAudio ~= false then
		SendNUIMessage({ _type = "audio", name = "done", vol = self:GetSettingValue("beep") })
	end

	SetResourceKvp("wk_wars2x_om_data", json.encode(self.vars.settings))

	if self:IsPassengerViewAllowed() then
		SYNC:SendUpdatedOMData(self:GetOMTableData())
	end
end

function RADAR:ChangeMenuIndex()
	local idx = self.vars.currentOptionIndex + 1
	if idx > #self.vars.menuOptions then idx = 1 end
	self.vars.currentOptionIndex = idx
	self:SendMenuUpdate()
end

function RADAR:GetMenuOptionTable()   return self.vars.menuOptions[self.vars.currentOptionIndex] end
function RADAR:SetMenuOptionIndex(i)  self.vars.menuOptions[self.vars.currentOptionIndex].optionIndex = i end

function RADAR:GetMenuOptionValue()
	local opt = self:GetMenuOptionTable()
	return opt.options[opt.optionIndex]
end

function RADAR:ChangeMenuOption(dir)
	local opt   = self:GetMenuOptionTable()
	local idx   = opt.optionIndex
	local size  = #opt.options

	if dir == "front" then
		idx = idx < size and idx + 1 or 1
	elseif dir == "rear" then
		idx = idx > 1 and idx - 1 or size
	end

	self:SetMenuOptionIndex(idx)
	self:SetSettingValue(opt.settingText, self:GetMenuOptionValue())
	self:SendMenuUpdate()
end

function RADAR:GetMenuOptionDisplayText() return self:GetMenuOptionTable().displayText end

function RADAR:GetMenuOptionText()
	local opt = self:GetMenuOptionTable()
	return opt.optionsText[opt.optionIndex]
end

function RADAR:SendMenuUpdate()
	SendNUIMessage({ _type = "menu", text = self:GetMenuOptionDisplayText(), option = self:GetMenuOptionText() })
end

function RADAR:SetSettingValue(setting, value)
	if value == nil then return end
	-- FIX: speedType mag nooit op mph gezet worden op NL server
	if setting == "speedType" then value = "kmh" end
	self.vars.settings[setting] = value
	if setting == "same" or setting == "opp" then self:UpdateRayEndCoords() end
end

function RADAR:GetSettingValue(setting) return self.vars.settings[setting] end

function RADAR:LoadOMData()
	UTIL:Log("Attempting to load saved operator menu data.")
	local raw = GetResourceKvpString("wk_wars2x_om_data")
	if raw then
		self.vars.settings = json.decode(raw)
		-- FIX: forceer altijd kmh, ook als oude KVP mph had opgeslagen
		self.vars.settings.speedType = "kmh"
		UTIL:Log("Saved operator menu data loaded!")
	else
		UTIL:Log("Could not find any saved operator menu data.")
	end
end

function RADAR:UpdateOptionIndexes(loadSaved)
	if loadSaved then self:LoadOMData() end

	for k, v in pairs(self.vars.settings) do
		for _, opt in ipairs(self.vars.menuOptions) do
			if opt.settingText == k then
				for oi, ov in ipairs(opt.options) do
					if v == ov then opt.optionIndex = oi end
				end
			end
		end
	end
end

function RADAR:SendSettingUpdate()
	local antennas = {}
	for _, ant in ipairs(ANTENNAS) do
		antennas[ant] = {
			xmit        = self:IsAntennaTransmitting(ant),
			mode        = self:GetAntennaMode(ant),
			speedLocked = self:IsAntennaSpeedLocked(ant),
			fast        = self:ShouldFastBeDisplayed(ant),
		}
	end
	SendNUIMessage({ _type = "settingUpdate", antennaData = antennas })
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  PATROL SPEED / VEHICLE POOL
-- ══════════════════════════════════════════════════════════════════════════════════════
function RADAR:GetPatrolSpeed()  return self.vars.patrolSpeed end
function RADAR:GetVehiclePool()  return self.vars.vehiclePool end
function RADAR:GetMaxCheckDist() return self.vars.maxCheckDist end

function RADAR:SetPatrolSpeed(speed)
	if type(speed) == "number" then
		self.vars.patrolSpeed = self:GetVehSpeedConverted(speed)
	end
end

function RADAR:SetVehiclePool(pool)
	if type(pool) == "table" then self.vars.vehiclePool = pool end
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  RAY TRACE SYSTEM
-- ══════════════════════════════════════════════════════════════════════════════════════
function RADAR:GetRayTraceState()    return self.vars.rayTraceState end
function RADAR:CacheNumRays()        self.vars.numberOfRays = #self.rayTraces end
function RADAR:GetNumOfRays()        return self.vars.numberOfRays end
function RADAR:IncreaseRayTraceState() self.vars.rayTraceState = self.vars.rayTraceState + 1 end
function RADAR:ResetRayTraceState()  self.vars.rayTraceState = 0 end

function RADAR:GetIntersectedVehIsFrontOrRear(t)
	if t >  8.0 then return  1 end
	if t < -8.0 then return -1 end
	return 0
end

function RADAR:GetLineHitsSphereAndDir(c, radius, rs, re)
	local rayStart   = vector2(rs.x, rs.y)
	local rayEnd     = vector2(re.x, re.y)
	local centre     = vector2(c.x,  c.y)
	local rayNorm    = norm(rayEnd - rayStart)
	local rayToCentre = centre - rayStart
	local tProj      = dot(rayToCentre, rayNorm)
	local oppLenSqr  = dot(rayToCentre, rayToCentre) - (tProj * tProj)
	local radiusSqr  = radius * radius
	local distToCentre = #(rayStart - centre) - (radius * 2)

	if oppLenSqr < radiusSqr and distToCentre <= #(rayEnd - rayStart) then
		return true, self:GetIntersectedVehIsFrontOrRear(tProj)
	end
	return false, nil
end

function RADAR:IsVehicleInTraffic(tgtVeh, relPos)
	local hdgDiff = math.abs((GetEntityHeading(PLY.veh) - GetEntityHeading(tgtVeh) + 180) % 360 - 180)
	if relPos == 1  and hdgDiff > 45 and hdgDiff < 135 then return false end
	if relPos == -1 and hdgDiff > 45 and (hdgDiff < 135 or hdgDiff > 215) then return false end
	return true
end

function RADAR:ShootCustomRay(plyVeh, veh, s, e)
	local pos  = GetEntityCoords(veh)
	local dist = #(pos - s)

	if not DoesEntityExist(veh) or veh == plyVeh or dist >= self:GetMaxCheckDist() then
		return false, nil, nil, nil, nil
	end

	local entSpeed = GetEntitySpeed(veh)
	local pitch    = GetEntityPitch(plyVeh)

	if entSpeed <= 0.1 or pitch <= -35 or pitch >= 35 then
		return false, nil, nil, nil, nil
	end

	if not HasEntityClearLosToEntity(plyVeh, veh, 15) then
		return false, nil, nil, nil, nil
	end

	local radius, size = self:GetDynamicRadius(veh)
	local hit, relPos  = self:GetLineHitsSphereAndDir(pos, radius, s, e)

	if hit and self:IsVehicleInTraffic(veh, relPos) then
		return true, relPos, dist, entSpeed, size
	end
	return false, nil, nil, nil, nil
end

function RADAR:GetVehsHitByRay(ownVeh, vehs, s, e)
	local caught  = {}
	local hasData = false

	for _, veh in ipairs(vehs) do
		local hit, relPos, dist, speed, size = self:ShootCustomRay(ownVeh, veh, s, e)
		if hit then
			table.insert(caught, { veh = veh, relPos = relPos, dist = dist, speed = speed, size = size })
			hasData = true
		end
	end

	if hasData then return caught end
end

function RADAR:CreateRayThread(vehs, from, startX, endX, endY, rayType)
	local s = GetOffsetFromEntityInWorldCoords(from, startX, 0.0, 0.0)
	local e = GetOffsetFromEntityInWorldCoords(from, endX,   endY, 0.0)
	self:InsertCapturedVehicleData(self:GetVehsHitByRay(from, vehs, s, e), rayType)
	self:IncreaseRayTraceState()
end

function RADAR:CreateRayThreads(ownVeh, vehicles)
	for _, v in ipairs(self.rayTraces) do
		self:CreateRayThread(vehicles, ownVeh, v.startVec.x, v.endVec.x, v.endVec.y, v.rayType)
	end
end

function RADAR:UpdateRayEndCoords()
	for _, v in ipairs(self.rayTraces) do
		v.endVec.y = self:GetSettingValue(v.rayType) * self:GetMaxCheckDist()
	end
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  ANTENNA CONTROL
-- ══════════════════════════════════════════════════════════════════════════════════════
function RADAR:ToggleAntenna(ant)
	if not self:IsPowerOn() then return end
	local a = self.vars.antennas[ant]
	a.xmit = not a.xmit

	local xmitOn = a.xmit
	SendNUIMessage({ _type = "antennaXmit", ant = ant, on = xmitOn })
	SendNUIMessage({ _type = "audio", name = xmitOn and "xmit_on" or "xmit_off", vol = self:GetSettingValue("beep") })
end

function RADAR:IsAntennaTransmitting(ant) return self.vars.antennas[ant].xmit end

function RADAR:GetAntennaTextFromNum(relPos)
	if relPos ==  1 then return "front" end
	if relPos == -1 then return "rear"  end
end

function RADAR:GetAntennaMode(ant) return self.vars.antennas[ant].mode end

function RADAR:SetAntennaMode(ant, mode)
	if type(mode) ~= "number" or mode < 0 or mode > 3 or not self:IsPowerOn() then return end
	self.vars.antennas[ant].mode = mode
	SendNUIMessage({ _type = "antennaMode", ant = ant, mode = mode })
	SendNUIMessage({ _type = "audio", name = "beep", vol = self:GetSettingValue("beep") })
end

function RADAR:GetAntennaSpeed(ant)          return self.vars.antennas[ant].speed    end
function RADAR:SetAntennaSpeed(ant, s)       self.vars.antennas[ant].speed    = s    end
function RADAR:GetAntennaDir(ant)            return self.vars.antennas[ant].dir      end
function RADAR:SetAntennaDir(ant, d)         self.vars.antennas[ant].dir      = d    end
function RADAR:GetAntennaFastSpeed(ant)      return self.vars.antennas[ant].fastSpeed  end
function RADAR:SetAntennaFastSpeed(ant, s)   self.vars.antennas[ant].fastSpeed  = s    end
function RADAR:GetAntennaFastDir(ant)        return self.vars.antennas[ant].fastDir    end
function RADAR:SetAntennaFastDir(ant, d)     self.vars.antennas[ant].fastDir    = d    end

function RADAR:SetAntennaData(ant, speed, dir)
	self:SetAntennaSpeed(ant, speed)
	self:SetAntennaDir(ant, dir)
end
function RADAR:SetAntennaFastData(ant, speed, dir)
	self:SetAntennaFastSpeed(ant, speed)
	self:SetAntennaFastDir(ant, dir)
end

function RADAR:DoesAntennaHaveValidData(ant)     return self:GetAntennaSpeed(ant)     ~= nil end
function RADAR:DoesAntennaHaveValidFastData(ant) return self:GetAntennaFastSpeed(ant) ~= nil end

function RADAR:ShouldFastBeDisplayed(ant)
	return self:IsAntennaSpeedLocked(ant) and self:GetAntennaLockedType(ant) == 2
		or self:IsFastDisplayEnabled()
end

function RADAR:IsAntennaSpeedLocked(ant)    return self.vars.antennas[ant].speedLocked end
function RADAR:SetAntennaSpeedIsLocked(ant, s) self.vars.antennas[ant].speedLocked = s end

function RADAR:SetAntennaSpeedLock(ant, speed, dir, lockType, playAudio)
	if speed == nil or dir == nil or lockType == nil then return end

	local a = self.vars.antennas[ant]
	a.lockedSpeed = speed
	a.lockedDir   = dir
	a.lockedType  = lockType
	self:SetAntennaSpeedIsLocked(ant, true)

	if playAudio then
		local beepVol  = self:GetSettingValue("beep")
		local voiceVol = self:GetSettingValue("voice")
		SendNUIMessage({ _type = "audio",     name = "beep", vol = beepVol })
		SendNUIMessage({ _type = "lockAudio", ant  = ant,    dir = dir, vol = voiceVol })
	end

	if speed == "¦88" and self:GetSettingValue("speedType") == "mph" then
		math.randomseed(GetGameTimer())
		if math.random() <= 0.15 then
			SendNUIMessage({ _type = "audio", name = "speed_alert", vol = self:GetSettingValue("beep") })
		end
	end
end

function RADAR:GetAntennaLockedSpeed(ant) return self.vars.antennas[ant].lockedSpeed end
function RADAR:GetAntennaLockedDir(ant)   return self.vars.antennas[ant].lockedDir   end
function RADAR:GetAntennaLockedType(ant)  return self.vars.antennas[ant].lockedType  end

function RADAR:ResetAntennaSpeedLock(ant)
	local a = self.vars.antennas[ant]
	a.lockedSpeed = nil
	a.lockedDir   = nil
	a.lockedType  = nil
	self:SetAntennaSpeedIsLocked(ant, false)
end

function RADAR:LockAntennaSpeed(ant, override, lockRegardless)
	if not self:IsPowerOn() then return end
	if not (self:GetDisplayState() and not self:GetDisplayHidden()) and not lockRegardless then return end
	if not self:IsAntennaTransmitting(ant) then return end

	local isMenuOpen = self:IsMenuOpen()

	if not self:IsAntennaSpeedLocked(ant) then
		if override then
			self:SetAntennaData(ant, override[1], override[2])
			self:SetAntennaFastData(ant, override[3], override[4])
		end

		local speed, dir, lockType
		if self:IsFastDisplayEnabled() and self:DoesAntennaHaveValidFastData(ant) then
			speed, dir, lockType = self:GetAntennaFastSpeed(ant), self:GetAntennaFastDir(ant), 2
		else
			speed, dir, lockType = self:GetAntennaSpeed(ant), self:GetAntennaDir(ant), 1
		end

		self:SetAntennaSpeedLock(ant, speed, dir, lockType, not isMenuOpen)
	else
		self:ResetAntennaSpeedLock(ant)
	end

	if not isMenuOpen then
		SendNUIMessage({ _type = "antennaLock", ant = ant, state = self:IsAntennaSpeedLocked(ant) })
		SendNUIMessage({ _type = "antennaFast", ant = ant, state = self:ShouldFastBeDisplayed(ant) })
	end
end

function RADAR:ResetAntenna(ant)
	local a = self.vars.antennas[ant]
	a.xmit = false
	a.mode = 0
	self:ResetAntennaSpeedLock(ant)
end

function RADAR:GetAntennaDataPacket(ant)
	return {
		self:GetAntennaSpeed(ant),
		self:GetAntennaDir(ant),
		self:GetAntennaFastSpeed(ant),
		self:GetAntennaFastDir(ant),
	}
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  CAPTURED VEHICLES
-- ══════════════════════════════════════════════════════════════════════════════════════
function RADAR:GetCapturedVehicles()  return self.vars.capturedVehicles end
function RADAR:ResetCapturedVehicles() self.vars.capturedVehicles = {} end

function RADAR:InsertCapturedVehicleData(t, rt)
	if type(t) ~= "table" or UTIL:IsTableEmpty(t) then return end
	for _, v in ipairs(t) do
		v.rayType = rt
		table.insert(self.vars.capturedVehicles, v)
	end
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  DYNAMIC SPHERE RADIUS
-- ══════════════════════════════════════════════════════════════════════════════════════
function RADAR:GetDynamicRadius(veh)
	local key = tostring(GetEntityModel(veh))

	if self.vars.sphereSizes[key] then
		local d = self.vars.sphereSizes[key]
		return d.radius, d.actualSize
	end

	local min, max  = GetModelDimensions(GetEntityModel(veh))
	local size      = max - min
	local numSize   = size.x + size.y + size.z
	local radius    = UTIL:Clamp((numSize * numSize) / 12, 5.0, 11.0)

	self.vars.sphereSizes[key] = { radius = radius, actualSize = numSize }
	return radius, numSize
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  VEHICLE HELPERS
-- ══════════════════════════════════════════════════════════════════════════════════════
function RADAR:GetVehSpeedConverted(speed)
	return UTIL:Round(speed * self.speedConversions[self:GetSettingValue("speedType")], 0)
end

function RADAR:IsVehicleValid(veh)
	local key   = tostring(GetEntityModel(veh))
	local valid = self.vars.validVehicles[key]
	if valid ~= nil then return valid end

	local mdl   = GetEntityModel(veh)
	valid = not (IsThisModelABoat(mdl) or IsThisModelAHeli(mdl) or IsThisModelAPlane(mdl))
	self.vars.validVehicles[key] = valid
	return valid
end

function RADAR:GetAllVehicles()
	local t = {}
	for v in UTIL:EnumerateVehicles() do
		if self:IsVehicleValid(v) then table.insert(t, v) end
	end
	return t
end

function RADAR:CheckVehicleDataFitsMode(ant, rt)
	local mode = self:GetAntennaMode(ant)
	return mode == 3 or (mode == 1 and rt == "same") or (mode == 2 and rt == "opp")
end

function RADAR:GetVehiclesForAntenna()
	local vehs    = { front = {}, rear = {} }
	local results = { front = { nil, nil }, rear = { nil, nil } }

	for _, v in ipairs(self:GetCapturedVehicles()) do
		local ant = self:GetAntennaTextFromNum(v.relPos)
		if ant and self:IsAntennaTransmitting(ant) then
			table.insert(vehs[ant], v)
		end
	end

	for _, ant in ipairs(ANTENNAS) do
		if not UTIL:IsTableEmpty(vehs[ant]) then
			table.sort(vehs[ant], self.sorting.strongest)
			for _, v in ipairs(vehs[ant]) do
				if self:CheckVehicleDataFitsMode(ant, v.rayType) then
					results[ant][1] = v
					break
				end
			end

			if self:IsFastDisplayEnabled() and results[ant][1] then
				table.sort(vehs[ant], self.sorting.fastest)
				local strongest = results[ant][1]
				for _, v in ipairs(vehs[ant]) do
					if self:CheckVehicleDataFitsMode(ant, v.rayType)
					and v.veh   ~= strongest.veh
					and v.size  <  strongest.size
					and v.speed >  strongest.speed + 1.0
					then
						results[ant][2] = v
						break
					end
				end
			end
		end
	end

	return results
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  NUI CALLBACKS
-- ══════════════════════════════════════════════════════════════════════════════════════
RegisterNUICallback("toggleRadarDisplay", function(_, cb)
	RADAR:ToggleDisplayState()
	cb("ok")
end)

RegisterNUICallback("togglePower", function(_, cb)
	if PLY:CanControlRadar() and not RADAR:IsPoweringUp() then
		RADAR:SetPowerState(not RADAR:IsPowerOn(), false)
		SYNC:SendPowerState(RADAR:IsPowerOn())
	end
	cb("ok")
end)

RegisterNUICallback("closeRemote", function(_, cb)
	SetNuiFocus(false, false)
	if RADAR:IsMenuOpen() then RADAR:CloseMenu(false) end
	SYNC:SetRemoteOpenState(false)
	cb("ok")
end)

RegisterNUICallback("setAntennaMode", function(data, cb)
	if PLY:CanControlRadar() and RADAR:IsPowerOn() and not RADAR:IsPoweringUp() then
		if RADAR:IsMenuOpen() then
			RADAR:CloseMenu()
		else
			local mode = tonumber(data.mode)
			RADAR:SetAntennaMode(data.value, mode)
			SYNC:SendAntennaMode(data.value, mode)
		end
	end
	cb("ok")
end)

RegisterNUICallback("toggleAntenna", function(data, cb)
	if PLY:CanControlRadar() and RADAR:IsPowerOn() and not RADAR:IsPoweringUp() then
		if RADAR:IsMenuOpen() then
			RADAR:ChangeMenuOption(data.value)
			SendNUIMessage({ _type = "audio", name = "beep", vol = RADAR:GetSettingValue("beep") })
		else
			RADAR:ToggleAntenna(data.value)
			SYNC:SendAntennaPowerState(RADAR:IsAntennaTransmitting(data.value), data.value)
		end
	end
	cb("ok")
end)

RegisterNUICallback("menu", function(_, cb)
	if PLY:CanControlRadar() and RADAR:IsPowerOn() and not RADAR:IsPoweringUp() then
		if RADAR:IsMenuOpen() then
			RADAR:ChangeMenuIndex()
		else
			RADAR:SetMenuState(true)
			RADAR:SendMenuUpdate()
		end
		SendNUIMessage({ _type = "audio", name = "beep", vol = RADAR:GetSettingValue("beep") })
	end
	cb("ok")
end)

RegisterNUICallback("saveUiData", function(data, cb)
	UTIL:Log("Saving updated UI settings data.")
	SetResourceKvp("wk_wars2x_ui_data", json.encode(data))
	cb("ok")
end)

RegisterNUICallback("qsvWatched", function(_, cb)
	SetResourceKvpInt("wk_wars2x_new_user", 1)
	cb("ok")
end)


-- ══════════════════════════════════════════════════════════════════════════════════════
--  DISPLAY VALIDATION
-- ══════════════════════════════════════════════════════════════════════════════════════
function RADAR:RunDisplayValidationCheck()
	local canView   = PLY:CanViewRadar()
	local displayed = self:GetDisplayState()
	local hidden    = self:GetDisplayHidden()
	local vehInvalid = PLY.veh == 0 or (PLY.veh > 0 and not PLY.vehClassValid)

	if displayed and not hidden and (vehInvalid or IsPauseMenuActive()) then
		self:SetDisplayHidden(true)
		SendNUIMessage({ _type = "setRadarDisplayState", state = false })
	elseif canView and displayed and hidden then
		self:SetDisplayHidden(false)
		SendNUIMessage({ _type = "setRadarDisplayState", state = true })
	end
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  MAIN RADAR FUNCTION
-- ══════════════════════════════════════════════════════════════════════════════════════
function RADAR:Main()
	if not PLY:CanViewRadar() or not self:CanPerformMainTask() then return end

	local entSpeed = GetEntitySpeed(PLY.veh)
	self:SetPatrolSpeed(entSpeed)

	local patrolSpeedStr = entSpeed == 0
		and "¦[]"
		or UTIL:FormatSpeed(self:GetVehSpeedConverted(entSpeed))

	local av      = self:GetVehiclesForAntenna()
	local antData = { front = nil, rear = nil }

	for _, ant in ipairs(ANTENNAS) do
		if self:IsAntennaTransmitting(ant) then
			antData[ant] = {}

			for i = 1, 2 do
				antData[ant][i] = { speed = "¦¦¦", dir = 0 }

				if i == 2 and self:IsAntennaSpeedLocked(ant) then
					antData[ant][i].speed = self:GetAntennaLockedSpeed(ant)
					antData[ant][i].dir   = self:GetAntennaLockedDir(ant)

				elseif av[ant][i] then
					local vehSpeed       = GetEntitySpeed(av[ant][i].veh)
					local convertedSpeed = self:GetVehSpeedConverted(vehSpeed)
					local ownH           = UTIL:Round(GetEntityHeading(PLY.veh),           0)
					local tarH           = UTIL:Round(GetEntityHeading(av[ant][i].veh),    0)
					local dir            = UTIL:GetEntityRelativeDirection(ownH, tarH)

					antData[ant][i].speed = UTIL:FormatSpeed(convertedSpeed)
					antData[ant][i].dir   = dir

					if i == 2 then
						self:SetAntennaFastData(ant, antData[ant][i].speed, dir)
					else
						self:SetAntennaData(ant, antData[ant][i].speed, dir)
					end

					if self:IsFastLimitAllowed()
					and self:IsFastLockEnabled()
					and convertedSpeed > self:GetFastLimit()
					and not self:IsAntennaSpeedLocked(ant)
					then
						local playerInVeh = UTIL:IsPlayerInVeh(av[ant][i].veh)
						if (not self:OnlyLockFastPlayers() or playerInVeh) and PLY:IsDriver() then
							self:LockAntennaSpeed(ant, nil, false)
							SYNC:LockAntennaSpeed(ant, self:GetAntennaDataPacket(ant))
						end
					end
				else
					if i == 2 then self:SetAntennaFastData(ant, nil, nil)
					else            self:SetAntennaData(ant, nil, nil) end
				end
			end
		end
	end

	SendNUIMessage({ _type = "update", speed = patrolSpeedStr, antennas = antData })
end


-- ══════════════════════════════════════════════════════════════════════════════════════
--  THREADS
-- ══════════════════════════════════════════════════════════════════════════════════════

CreateThread(function()
	while true do
		local speed = RADAR:GetPatrolSpeed()
		RADAR:SetThreadWaitTime(speed < 0.1 and 200 or 500)
		Wait(2000)
	end
end)

CreateThread(function()
	while true do
		if PLY:CanViewRadar() and RADAR:CanPerformMainTask() and RADAR:IsEitherAntennaOn() then
			local state = RADAR:GetRayTraceState()

			if state == 0 then
				RADAR:ResetCapturedVehicles()
				RADAR:CreateRayThreads(PLY.veh, RADAR:GetVehiclePool())
				Wait(RADAR:GetThreadWaitTime())
			elseif state == RADAR:GetNumOfRays() then
				RADAR:ResetRayTraceState()
			end
		end
		Wait(0)
	end
end)

CreateThread(function()
	while true do
		if PLY:CanViewRadar() and RADAR:CanPerformMainTask() and RADAR:IsEitherAntennaOn() then
			RADAR:SetVehiclePool(RADAR:GetAllVehicles())
		end
		Wait(3000)
	end
end)

CreateThread(function()
	Wait(100)
	while true do
		RADAR:RunDisplayValidationCheck()
		Wait(500)
	end
end)

CreateThread(function()
	SetNuiFocus(false, false)

	RADAR:CacheNumRays()
	RADAR:UpdateRayEndCoords()

	if RADAR:IsFastLimitAllowed() then
		RADAR:CreateFastLimitConfig()
	end

	RegisterKeyBinds()
	Wait(1000)

	LoadUISettings()
	DecorSetBool(PlayerPedId(), "wk_wars2x_sync_remoteOpen", false)
	RADAR:UpdateOptionIndexes(true)

	while true do
		RADAR:Main()
		Wait(100)
	end
end)