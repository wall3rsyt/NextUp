Cfg = {}
voiceTarget = 1
gameVersion = GetGameName()
-- deze zijn alleen hier om linting te voldoen
if not IsDuplicityVersion() then
	LocalPlayer = LocalPlayer
	playerServerId = GetPlayerServerId(PlayerId())
	if gameVersion == "redm" then
		function CreateAudioSubmix(name)
			return Citizen.InvokeNative(0x658d2bc8, name, Citizen.ResultAsInteger())
		end
		function AddAudioSubmixOutput(submixId, outputSubmixId)
			Citizen.InvokeNative(0xAC6E290D, submixId, outputSubmixId)
		end
		function MumbleSetSubmixForServerId(serverId, submixId)
			Citizen.InvokeNative(0xFE3A3054, serverId, submixId)
		end
		function SetAudioSubmixEffectParamFloat(submixId, effectSlot, paramIndex, paramValue)
			Citizen.InvokeNative(0x9A209B3C, submixId, effectSlot, paramIndex, paramValue)
		end
		function SetAudioSubmixEffectParamInt(submixId, effectSlot, paramIndex, paramValue)
			Citizen.InvokeNative(0x77FAE2B8, submixId, effectSlot, paramIndex, paramValue)
		end
		function SetAudioSubmixEffectRadioFx(submixId, effectSlot)
			Citizen.InvokeNative(0xAAA94D53, submixId, effectSlot)
		end
		function SetAudioSubmixOutputVolumes(submixId, outputSlot, frontLeftVolume, frontRightVolume, rearLeftVolume,
											 rearRightVolume, channel5Volume, channel6Volume)
			Citizen.InvokeNative(0x825DC0D1, submixId, outputSlot, frontLeftVolume, frontRightVolume, rearLeftVolume,
				rearRightVolume, channel5Volume, channel6Volume)
		end
	end
end
Player = Player
Entity = Entity
if GetConvar('voice_useNativeAudio', 'false') == 'true' then
	-- afstand bij native audio lijkt groter dan normale GTA-eenheden
	Cfg.voiceModes = {
		{ 1.5, "Fluisteren" }, -- Fluisterafstand in GTA-afstandseenheden
		{ 3.0, "Normaal" },    -- Normale spreekafstand in GTA-afstandseenheden
		{ 6.0, "Schreeuwen" }  -- Schreeuwafstand in GTA-afstandseenheden
	}
else
	Cfg.voiceModes = {
		{ 3.0,  "Fluisteren" }, -- Fluisterafstand in GTA-afstandseenheden
		{ 7.0,  "Normaal" },    -- Normale spreekafstand in GTA-afstandseenheden
		{ 15.0, "Schreeuwen" }  -- Schreeuwafstand in GTA-afstandseenheden
	}
end
logger = {
	log = function(message, ...)
		print((message):format(...))
	end,
	info = function(message, ...)
		if GetConvarInt('voice_debugMode', 0) >= 1 then
			print(('[info] ' .. message):format(...))
		end
	end,
	warn = function(message, ...)
		print(('[^1WAARSCHUWING^7] ' .. message):format(...))
	end,
	error = function(message, ...)
		error((message):format(...))
	end,
	verbose = function(message, ...)
		if GetConvarInt('voice_debugMode', 0) >= 4 then
			print(('[uitgebreid] ' .. message):format(...))
		end
	end,
}
function tPrint(tbl, indent)
	indent = indent or 0
	for k, v in pairs(tbl) do
		local tblType = type(v)
		local formatting = string.rep("  ", indent) .. k .. ": "
		if tblType == "table" then
			print(formatting)
			tPrint(v, indent + 1)
		elseif tblType == 'boolean' then
			print(formatting .. tostring(v))
		elseif tblType == "function" then
			print(formatting .. tostring(v))
		else
			print(formatting .. v)
		end
	end
end
local function types(args)
	local argType = type(args[1])
	for i = 2, #args do
		local arg = args[i]
		if argType == arg then
			return true, argType
		end
	end
	return false, argType
end

function type_check(...)
	local vars = { ... }
	for i = 1, #vars do
		local var = vars[i]
		local matchesType, varType = types(var)
		if not matchesType then
			table.remove(var, 1)
			error(("Ongeldig type meegegeven aan argument #%s, verwacht %s, ontvangen %s"):format(i, table.concat(var, "|"), varType))
		end
	end
end