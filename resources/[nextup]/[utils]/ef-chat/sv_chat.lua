RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

local QBCore = exports['qb-core']:GetCoreObject()

-- Debounce voor onServerResourceStart
local refreshPending = false

local function refreshCommands(player)
    if not GetRegisteredCommands then return end

    local registeredCommands = GetRegisteredCommands()
    local suggestions = {}
    local seen = {}

    for _, command in ipairs(registeredCommands) do
        if IsPlayerAceAllowed(player, ('command.%s'):format(command.name)) then
            local name = command.name
            local nameSlash = '/' .. command.name

            if not seen[name] then
                seen[name] = true
                table.insert(suggestions, {name = name, help = ''})
            end

            if not seen[nameSlash] then
                seen[nameSlash] = true
                table.insert(suggestions, {name = nameSlash, help = ''})
            end
        end
    end

    TriggerClientEvent('chat:addSuggestions', player, suggestions)
end

AddEventHandler('chat:init', function()
    refreshCommands(source)
end)

AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then return end
    local command = message:sub(1, 1) == '/' and message:sub(2) or message
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)
    local cleanedCommand = command:sub(1, 1) == '/' and command:sub(2) or command
    CancelEvent()
end)

-- Debounce: voorkomt dat bij elke resource start alle spelers opnieuw commands krijgen
AddEventHandler('onServerResourceStart', function(resName)
    if refreshPending then return end
    refreshPending = true

    SetTimeout(1000, function()
        refreshPending = false
        local players = GetPlayers()
        for _, player in ipairs(players) do
            refreshCommands(player)
        end
    end)
end)

-- OOC Command
if Config.EnableOOCCommand then
    RegisterCommand(Config.OOCCommand, function(source, args, rawCommand)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player then return end

        local length = string.len(Config.OOCCommand)
        local message = rawCommand:sub(length + 1)

        if not message or message == '' then return end

        local time = os.date(Config.DateFormat)
        local playerName = Player.PlayerData.name
        TriggerClientEvent('chat:ooc', -1, source, playerName, message, time)
    end)
end