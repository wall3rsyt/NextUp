--[[---------------------------------------------------------------------------------------
	Wraith ARS 2X — cl_utils.lua
	Original by WolfKnight | Optimised for wk_wars2x NL build
	MIT License © 2020-2021 WolfKnight
---------------------------------------------------------------------------------------]]--

UTIL = {}

-- Cache stdlib
local math, string, tostring, pairs, setmetatable, coroutine = math, string, tostring, pairs, setmetatable, coroutine

-- ── Number helpers ───────────────────────────────────────────────────────────────────
function UTIL:Round(num, decimals)
	return tonumber(string.format("%." .. (decimals or 0) .. "f", num))
end

function UTIL:Clamp(val, min, max)
	return val < min and min or val > max and max or val
end

-- ── Speed formatter ──────────────────────────────────────────────────────────────────
-- Custom font uses ¦ as blank — pads speed to 3 chars
local PIPES = { "¦¦", "¦", "" }  -- indexed by string length (1→3)
function UTIL:FormatSpeed(speed)
	if speed < 0 or speed > 999 then return "Err" end
	local s = tostring(speed)
	return (PIPES[#s] or "") .. s
end

-- ── Table helpers ────────────────────────────────────────────────────────────────────
function UTIL:IsTableEmpty(t)
	return next(t) == nil   -- next() is faster than counting with pairs
end

-- Iterator over an array (replaces pairs() for ordered tables)
function UTIL:Values(xs)
	local i = 0
	return function()
		i = i + 1
		return xs[i]
	end
end

-- ── Vehicle helpers ──────────────────────────────────────────────────────────────────
function UTIL:GetVehicleInDirection(entFrom, coordFrom, coordTo)
	local ray = StartShapeTestCapsule(
		coordFrom.x, coordFrom.y, coordFrom.z,
		coordTo.x,   coordTo.y,   coordTo.z,
		5.0, 10, entFrom, 7
	)
	local _, _, _, _, vehicle = GetShapeTestResult(ray)
	return vehicle
end

-- Returns 1 (closing), 2 (away), or 0 (sideways) based on heading difference
function UTIL:GetEntityRelativeDirection(myAng, tarAng)
	local diff = math.abs((myAng - tarAng + 180) % 360 - 180)
	if diff <  45 then return 1 end
	if diff > 135 then return 2 end
	return 0
end

-- Returns true if any player ped is seated in the given vehicle
function UTIL:IsPlayerInVeh(veh)
	for i = -1, GetVehicleMaxNumberOfPassengers(veh) + 1 do
		local ped = GetPedInVehicleSeat(veh, i)
		if DoesEntityExist(ped) and IsPedAPlayer(ped) then return true end
	end
	return false
end

-- ── Notification / logging ───────────────────────────────────────────────────────────
function UTIL:Notify(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentSubstringPlayerName(text)
	DrawNotification(false, true)
end

function UTIL:Log(msg)
	print("[Wraith ARS 2X]: " .. msg)
end

-- ── Debug text ───────────────────────────────────────────────────────────────────────
function UTIL:DrawDebugText(x, y, scale, centre, text)
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(2, 0, 0, 0, 255)
	SetTextCentre(centre)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

-- ── Resource validation ──────────────────────────────────────────────────────────────
function UTIL:IsResourceNameValid()
	return GetCurrentResourceName() == "wk_wars2x"
end

-- ── Vehicle enumerator ───────────────────────────────────────────────────────────────
-- Credit: IllidanS4 — https://gist.github.com/IllidanS4/9865ed17f60576425369fc1da70259b2
-- MIT License © 2017 IllidanS4
local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end
		enum.destructor = nil
		enum.handle     = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = setmetatable({ handle = iter, destructor = disposeFunc }, entityEnumerator)

		local ok = true
		repeat
			coroutine.yield(id)
			ok, id = moveFunc(iter)
		until not ok

		enum.destructor = nil
		enum.handle     = nil
		disposeFunc(iter)
	end)
end

function UTIL:EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end