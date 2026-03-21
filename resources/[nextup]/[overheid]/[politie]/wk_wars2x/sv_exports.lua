--[[---------------------------------------------------------------------------------------
	Wraith ARS 2X — sv_exports.lua
	Original by WolfKnight | Optimised for wk_wars2x NL build
	MIT License © 2020-2021 WolfKnight
---------------------------------------------------------------------------------------]]--

--[[----------------------------------------------------------------------------------
	TogglePlateLock
	Vergrendelt of ontgrendelt de kentekenlezer voor de opgegeven client.

	Parameters:
		clientId  (number)  — server ID van de client
		cam       (string)  — camera om te vergrendelen: "front" of "rear"
		beepAudio (boolean) — piepgeluid afspelen bij vergrendeling
		boloAudio (boolean) — BOLO-geluid afspelen bij vergrendeling
----------------------------------------------------------------------------------]]--
function TogglePlateLock(clientId, cam, beepAudio, boloAudio)
	TriggerClientEvent("wk:togglePlateLock", clientId, cam, beepAudio, boloAudio)
end